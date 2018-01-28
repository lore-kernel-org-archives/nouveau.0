From: Sasha Levin <Alexander.Levin@microsoft.com>
Subject: [PATCH AUTOSEL for 3.18 23/25] x86/mm/kmmio: Fix mmiotrace for page
 unaligned addresses
Date: Sun, 28 Jan 2018 22:30:00 +0000
Message-ID: <20180128222931.7781-23-alexander.levin@microsoft.com>
References: <20180128222931.7781-1-alexander.levin@microsoft.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180128222931.7781-1-alexander.levin@microsoft.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Thomas Gleixner <tglx@linutronix.de>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ingo Molnar <mingo@kernel.org>, Sasha Levin <Alexander.Levin@microsoft.com>
List-Id: nouveau.vger.kernel.org

From: Karol Herbst <kherbst@redhat.com>

[ Upstream commit 6d60ce384d1d5ca32b595244db4077a419acc687 ]

If something calls ioremap() with an address not aligned to PAGE_SIZE, the
returned address might be not aligned as well. This led to a probe
registered on exactly the returned address, but the entire page was armed
for mmiotracing.

On calling iounmap() the address passed to unregister_kmmio_probe() was
PAGE_SIZE aligned by the caller leading to a complete freeze of the
machine.

We should always page align addresses while (un)registerung mappings,
because the mmiotracer works on top of pages, not mappings. We still keep
track of the probes based on their real addresses and lengths though,
because the mmiotrace still needs to know what are mapped memory regions.

Also move the call to mmiotrace_iounmap() prior page aligning the address,
so that all probes are unregistered properly, otherwise the kernel ends up
failing memory allocations randomly after disabling the mmiotracer.

Tested-by: Lyude <lyude@redhat.com>
Signed-off-by: Karol Herbst <kherbst@redhat.com>
Acked-by: Pekka Paalanen <ppaalanen@gmail.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: nouveau@lists.freedesktop.org
Link: http://lkml.kernel.org/r/20171127075139.4928-1-kherbst@redhat.com
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Sasha Levin <alexander.levin@microsoft.com>
---
 arch/x86/mm/ioremap.c |  4 ++--
 arch/x86/mm/kmmio.c   | 12 +++++++-----
 2 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/arch/x86/mm/ioremap.c b/arch/x86/mm/ioremap.c
index af78e50ca6ce..c76ea35fa19f 100644
--- a/arch/x86/mm/ioremap.c
+++ b/arch/x86/mm/ioremap.c
@@ -296,11 +296,11 @@ void iounmap(volatile void __iomem *addr)
 	    (void __force *)addr < phys_to_virt(ISA_END_ADDRESS))
 		return;
=20
+	mmiotrace_iounmap(addr);
+
 	addr =3D (volatile void __iomem *)
 		(PAGE_MASK & (unsigned long __force)addr);
=20
-	mmiotrace_iounmap(addr);
-
 	/* Use the vm area unlocked, assuming the caller
 	   ensures there isn't another iounmap for the same address
 	   in parallel. Reuse of the virtual address is prevented by
diff --git a/arch/x86/mm/kmmio.c b/arch/x86/mm/kmmio.c
index ddb2244b06a1..76604c8a2a48 100644
--- a/arch/x86/mm/kmmio.c
+++ b/arch/x86/mm/kmmio.c
@@ -434,17 +434,18 @@ int register_kmmio_probe(struct kmmio_probe *p)
 	unsigned long flags;
 	int ret =3D 0;
 	unsigned long size =3D 0;
+	unsigned long addr =3D p->addr & PAGE_MASK;
 	const unsigned long size_lim =3D p->len + (p->addr & ~PAGE_MASK);
 	unsigned int l;
 	pte_t *pte;
=20
 	spin_lock_irqsave(&kmmio_lock, flags);
-	if (get_kmmio_probe(p->addr)) {
+	if (get_kmmio_probe(addr)) {
 		ret =3D -EEXIST;
 		goto out;
 	}
=20
-	pte =3D lookup_address(p->addr, &l);
+	pte =3D lookup_address(addr, &l);
 	if (!pte) {
 		ret =3D -EINVAL;
 		goto out;
@@ -453,7 +454,7 @@ int register_kmmio_probe(struct kmmio_probe *p)
 	kmmio_count++;
 	list_add_rcu(&p->list, &kmmio_probes);
 	while (size < size_lim) {
-		if (add_kmmio_fault_page(p->addr + size))
+		if (add_kmmio_fault_page(addr + size))
 			pr_err("Unable to set page fault.\n");
 		size +=3D page_level_size(l);
 	}
@@ -527,19 +528,20 @@ void unregister_kmmio_probe(struct kmmio_probe *p)
 {
 	unsigned long flags;
 	unsigned long size =3D 0;
+	unsigned long addr =3D p->addr & PAGE_MASK;
 	const unsigned long size_lim =3D p->len + (p->addr & ~PAGE_MASK);
 	struct kmmio_fault_page *release_list =3D NULL;
 	struct kmmio_delayed_release *drelease;
 	unsigned int l;
 	pte_t *pte;
=20
-	pte =3D lookup_address(p->addr, &l);
+	pte =3D lookup_address(addr, &l);
 	if (!pte)
 		return;
=20
 	spin_lock_irqsave(&kmmio_lock, flags);
 	while (size < size_lim) {
-		release_kmmio_fault_page(p->addr + size, &release_list);
+		release_kmmio_fault_page(addr + size, &release_list);
 		size +=3D page_level_size(l);
 	}
 	list_del_rcu(&p->list);
--=20
2.11.0
