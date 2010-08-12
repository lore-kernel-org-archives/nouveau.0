From: Greg KH <gregkh-l3A5Bk7waGM@public.gmane.org>
Subject: [05/67] x86,
	kmmio/mmiotrace: Fix double free of kmmio_fault_pages
Date: Wed, 11 Aug 2010 17:05:20 -0700
Message-ID: <20100812000613.137972824@clark.site>
References: <20100812000641.GA6348@kroah.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100812000641.GA6348-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>, akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, torvalds-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org, stable-review-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, alan-qBU/x9rampVanCEyBjwyrvXRex20P6io@public.gmane.org
List-Id: nouveau.vger.kernel.org

2.6.35-stable review patch.  If anyone has any objections, please let us know.

------------------

From: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

commit 8b8f79b927b6b302bb65fb8c56e7a19be5fbdbef upstream.

After every iounmap mmiotrace has to free kmmio_fault_pages, but
it can't do it directly, so it defers freeing by RCU.

It usually works, but when mmiotraced code calls ioremap-iounmap
multiple times without sleeping between (so RCU won't kick in
and start freeing) it can be given the same virtual address, so
at every iounmap mmiotrace will schedule the same pages for
release. Obviously it will explode on second free.

Fix it by marking kmmio_fault_pages which are scheduled for
release and not adding them second time.

Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Tested-by: Marcin Kocielnicki <koriakin-mP9o5jsk0RY@public.gmane.org>
Tested-by: Shinpei KATO <shinpei-a3aLqY3FAeqkRP3n4FtbsiGn5s73+xxf@public.gmane.org>
Acked-by: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: Stuart Bennett <stuart-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org>
Cc: Marcin Kocielnicki <koriakin-mP9o5jsk0RY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
LKML-Reference: <20100613215654.GA3829-OI9uyE9O0yo@public.gmane.org>
Signed-off-by: Ingo Molnar <mingo-X9Un+BFzKDI@public.gmane.org>
Signed-off-by: Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>

---
 arch/x86/mm/kmmio.c         |   16 +++++++++++++---
 arch/x86/mm/testmmiotrace.c |   22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)

--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -45,6 +45,8 @@ struct kmmio_fault_page {
 	 * Protected by kmmio_lock, when linked into kmmio_page_table.
 	 */
 	int count;
+
+	bool scheduled_for_release;
 };
 
 struct kmmio_delayed_release {
@@ -398,8 +400,11 @@ static void release_kmmio_fault_page(uns
 	BUG_ON(f->count < 0);
 	if (!f->count) {
 		disarm_kmmio_fault_page(f);
-		f->release_next = *release_list;
-		*release_list = f;
+		if (!f->scheduled_for_release) {
+			f->release_next = *release_list;
+			*release_list = f;
+			f->scheduled_for_release = true;
+		}
 	}
 }
 
@@ -471,8 +476,10 @@ static void remove_kmmio_fault_pages(str
 			prevp = &f->release_next;
 		} else {
 			*prevp = f->release_next;
+			f->release_next = NULL;
+			f->scheduled_for_release = false;
 		}
-		f = f->release_next;
+		f = *prevp;
 	}
 	spin_unlock_irqrestore(&kmmio_lock, flags);
 
@@ -510,6 +517,9 @@ void unregister_kmmio_probe(struct kmmio
 	kmmio_count--;
 	spin_unlock_irqrestore(&kmmio_lock, flags);
 
+	if (!release_list)
+		return;
+
 	drelease = kmalloc(sizeof(*drelease), GFP_ATOMIC);
 	if (!drelease) {
 		pr_crit("leaking kmmio_fault_page objects.\n");
--- a/arch/x86/mm/testmmiotrace.c
+++ b/arch/x86/mm/testmmiotrace.c
@@ -90,6 +90,27 @@ static void do_test(unsigned long size)
 	iounmap(p);
 }
 
+/*
+ * Tests how mmiotrace behaves in face of multiple ioremap / iounmaps in
+ * a short time. We had a bug in deferred freeing procedure which tried
+ * to free this region multiple times (ioremap can reuse the same address
+ * for many mappings).
+ */
+static void do_test_bulk_ioremapping(void)
+{
+	void __iomem *p;
+	int i;
+
+	for (i = 0; i < 10; ++i) {
+		p = ioremap_nocache(mmio_address, PAGE_SIZE);
+		if (p)
+			iounmap(p);
+	}
+
+	/* Force freeing. If it will crash we will know why. */
+	synchronize_rcu();
+}
+
 static int __init init(void)
 {
 	unsigned long size = (read_far) ? (8 << 20) : (16 << 10);
@@ -104,6 +125,7 @@ static int __init init(void)
 		   "and writing 16 kB of rubbish in there.\n",
 		   size >> 10, mmio_address);
 	do_test(size);
+	do_test_bulk_ioremapping();
 	pr_info("All done.\n");
 	return 0;
 }
