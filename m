From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: [PATCHv2] kmmio/mmiotrace: fix double free of kmmio_fault_pages
Date: Sun, 13 Jun 2010 23:56:54 +0200
Message-ID: <20100613215654.GA3829@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: x86@kernel.org
Cc: LKML <linux-kernel@vger.kernel.org>, Pekka Paalanen <pq@iki.fi>, Stuart Bennett <stuart@freedesktop.org>, Marcin =?utf-8?Q?Ko=C5=9Bcielnicki?= <koriakin@0x04.net>, Shinpei KATO <shinpei@il.is.s.u-tokyo.ac.jp>, nouveau@lists.freedesktop.org, Ingo Molnar <mingo@elte.hu>
List-Id: nouveau.vger.kernel.org

After every iounmap mmiotrace has to free kmmio_fault_pages, but it
can't do it directly, so it defers freeing by RCU.

It usually works, but when mmiotraced code calls ioremap-iounmap
multiple times without sleeping between (so RCU won't kick in and
start freeing) it can be given the same virtual address, so at
every iounmap mmiotrace will schedule the same pages for release.
Obviously it will explode on second free.

=46ix it by marking kmmio_fault_pages which are scheduled for release
and not adding them second time.

Signed-off-by: Marcin Slusarz <marcin.slusarz@gmail.com>
Acked-by: Pekka Paalanen <pq@iki.fi>
Cc: Stuart Bennett <stuart@freedesktop.org>
Tested-by: Marcin Ko=C5=9Bcielnicki <koriakin@0x04.net>
Tested-by: Shinpei KATO <shinpei@il.is.s.u-tokyo.ac.jp>
---
v2: added test to testmmiotrace.c
---
 arch/x86/mm/kmmio.c         |   16 +++++++++++++---
 arch/x86/mm/testmmiotrace.c |   22 ++++++++++++++++++++++
 2 files changed, 35 insertions(+), 3 deletions(-)

diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index 5d0e67f..e5d5e2c 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -45,6 +45,8 @@ struct kmmio_fault_page {
 	 * Protected by kmmio_lock, when linked into kmmio_page_table.
 	 */
 	int count;
+
+	bool scheduled_for_release;
 };
=20
 struct kmmio_delayed_release {
@@ -398,8 +400,11 @@ static void release_kmmio_fault_page(unsigned long=
 page,
 	BUG_ON(f->count < 0);
 	if (!f->count) {
 		disarm_kmmio_fault_page(f);
-		f->release_next =3D *release_list;
-		*release_list =3D f;
+		if (!f->scheduled_for_release) {
+			f->release_next =3D *release_list;
+			*release_list =3D f;
+			f->scheduled_for_release =3D true;
+		}
 	}
 }
=20
@@ -471,8 +476,10 @@ static void remove_kmmio_fault_pages(struct rcu_he=
ad *head)
 			prevp =3D &f->release_next;
 		} else {
 			*prevp =3D f->release_next;
+			f->release_next =3D NULL;
+			f->scheduled_for_release =3D false;
 		}
-		f =3D f->release_next;
+		f =3D *prevp;
 	}
 	spin_unlock_irqrestore(&kmmio_lock, flags);
=20
@@ -510,6 +517,9 @@ void unregister_kmmio_probe(struct kmmio_probe *p)
 	kmmio_count--;
 	spin_unlock_irqrestore(&kmmio_lock, flags);
=20
+	if (!release_list)
+		return;
+
 	drelease =3D kmalloc(sizeof(*drelease), GFP_ATOMIC);
 	if (!drelease) {
 		pr_crit("leaking kmmio_fault_page objects.\n");
diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
index 8565d94..e6cc5be 100644
--- a/arch/x86/mm/testmmiotrace.c
+++ b/arch/x86/mm/testmmiotrace.c
@@ -90,6 +90,27 @@ static void do_test(unsigned long size)
 	iounmap(p);
 }
=20
+/*
+ * Tests how mmiotrace behaves in face of multiple ioremap / iounmaps =
in
+ * a short time. We had a bug in deferred freeing procedure which trie=
d
+ * to free this region multiple times (ioremap can reuse the same addr=
ess
+ * for many mappings).
+ */
+static void do_test_bulk_ioremapping(void)
+{
+	void __iomem *p;
+	int i;
+=09
+	for (i =3D 0; i < 10; ++i) {
+		p =3D ioremap_nocache(mmio_address, PAGE_SIZE);
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
 	unsigned long size =3D (read_far) ? (8 << 20) : (16 << 10);
@@ -104,6 +125,7 @@ static int __init init(void)
 		   "and writing 16 kB of rubbish in there.\n",
 		   size >> 10, mmio_address);
 	do_test(size);
+	do_test_bulk_ioremapping();
 	pr_info("All done.\n");
 	return 0;
 }
--=20
1.7.1
