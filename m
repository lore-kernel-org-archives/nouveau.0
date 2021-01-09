From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: Re: [patch V3 13/37] mips/mm/highmem: Switch to generic kmap atomic
Date: Sat, 9 Jan 2021 01:33:52 +0100
Message-ID: <20210109003352.GA18102@alpha.franken.de>
References: <JUTMMQ.NNFWKIUV7UUJ1@crapouillou.net>
 <20210108235805.GA17543@alpha.franken.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <owner-linux-aio@kvack.org>
Content-Disposition: inline
In-Reply-To: <20210108235805.GA17543@alpha.franken.de>
Sender: owner-linux-aio@kvack.org
To: Paul Cercueil <paul@crapouillou.net>
Cc: tglx@linutronix.de, airlied@linux.ie, airlied@redhat.com, akpm@linux-foundation.org, arnd@arndb.de, bcrl@kvack.org, bigeasy@linutronix.de, bristot@redhat.com, bsegall@google.com, bskeggs@redhat.com, chris@zankel.net, christian.koenig@amd.com, clm@fb.com, davem@davemloft.net, deanbo422@gmail.com, dietmar.eggemann@arm.com, dri-devel@lists.freedesktop.org, dsterba@suse.com, green.hu@gmail.com, hch@lst.de, intel-gfx@lists.freedesktop.org, jcmvbkbc@gmail.com, josef@toxicpanda.com, juri.lelli@redhat.com, kraxel@redhat.com, linux-aio@kvack.org, linux-arm-kernel@lists.infradead.org, linux-btrfs@vger.kernel.org, linux-csky@vger.kernel.org, linux-fsdevel@vger.kernel.org, linux-graphics-maintainer@vmware.com, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, linux@armlinux.org.uklinux
List-Id: nouveau.vger.kernel.org

On Sat, Jan 09, 2021 at 12:58:05AM +0100, Thomas Bogendoerfer wrote:
> On Fri, Jan 08, 2021 at 08:20:43PM +0000, Paul Cercueil wrote:
> > Hi Thomas,
> > 
> > 5.11 does not boot anymore on Ingenic SoCs, I bisected it to this commit.
> > 
> > Any idea what could be happening?
> 
> not yet, kernel crash log of a Malta QEMU is below.

update:

This dirty hack lets the Malta QEMU boot again:

diff --git a/mm/highmem.c b/mm/highmem.c
index c3a9ea7875ef..190cdda1149d 100644
--- a/mm/highmem.c
+++ b/mm/highmem.c
@@ -515,7 +515,7 @@ void *__kmap_local_pfn_prot(unsigned long pfn, pgprot_t prot)
 	vaddr = __fix_to_virt(FIX_KMAP_BEGIN + idx);
 	BUG_ON(!pte_none(*(kmap_pte - idx)));
 	pteval = pfn_pte(pfn, prot);
-	set_pte_at(&init_mm, vaddr, kmap_pte - idx, pteval);
+	set_pte(kmap_pte - idx, pteval);
 	arch_kmap_local_post_map(vaddr, pteval);
 	current->kmap_ctrl.pteval[kmap_local_idx()] = pteval;
 	preempt_enable();

set_pte_at() tries to update cache and could do an kmap_atomic() there.
Not sure, if this is allowed at this point.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

--
To unsubscribe, send a message with 'unsubscribe linux-aio' in
the body to majordomo@kvack.org.  For more info on Linux AIO,
see: http://www.kvack.org/aio/
Don't email: <a href=mailto:"aart@kvack.org">aart@kvack.org</a>
