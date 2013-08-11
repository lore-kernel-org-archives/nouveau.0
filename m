From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Subject: Fixing nouveau for >4k PAGE_SIZE
Date: Sun, 11 Aug 2013 10:41:10 +1000
Message-ID: <1376181670.32100.77.camel@pasglop>
References: <1372740099.4820.24.camel@pasglop>
	<CAPM=9txvRW5MM849FVqOoSL28g=+hTDiLWaMtn5Kj-X3h1kJ8g@mail.gmail.com>
	<1376175111.32100.53.camel@pasglop> <1376179046.32100.60.camel@pasglop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1376179046.32100.60.camel@pasglop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org, =?ISO-8859-1?Q?St=E9phane?= Marchesin <marcheu@chromium.org>
List-Id: nouveau.vger.kernel.org

Hi folks !

So I've been trying to figure out what it would take to make
nouveau work properly on architectures where PAGE_SIZE isn't
4k such as most ppc64's. An initial patch from Dave fixed a
bogon in nv41.c nv41_vm_map_sg() which was trying to handle
the case at that low level, but this isn't enough, and after
a bit of digging, I also think that's not the right approach:

So, from what I can tell, subdev/vm/base.c is not clean vs. PAGE_SIZE
in a number of places unless I'm mistaken. For example, in
nouveau_vm_map_sg_table(), something like that:

		sglen = sg_dma_len(sg) >> PAGE_SHIFT;

		end = pte + sglen;

Seems to imply an assumption here that the "pte" is in multiple of
PAGE_SHIFT, but afaik, it's not. So further down, we do:

		for (m = 0; m < len; m++) {
			dma_addr_t addr = sg_dma_address(sg) + (m << PAGE_SHIFT);

			vmm->map_sg(vma, pgt, mem, pte, 1, &addr);                       
			num--;
			pte++;

But in fact, inside vmm->map_sg, with the current code, we will have
incremented pte by more than 1 ... so we basically lose track here.

			if (num == 0)
				goto finish;
		}
		if (unlikely(end >= max)) {
			pde++;
			pte = 0;
		}

We need to similarly make sure we don't end up crossing accross two
pde's here, ie, that our 64k page isn't mapped at a non-multiple of
64k in the card space, where is that enforced ? (It might be, I don't
know). If it is, then we need to recalc the pde on each sub page.

So I'm thinking the right fix is to remove the inner loop in nv41.c
nv41_vm_map_sg() and similars, let those basically deal with card-size
PTEs exclusively, and move the breakdown logic inside
nouveau_vm_map_sg_table() and friendes, that's the only way it can get
pte and pde right anyway and it would generally work with all backends
(well, hopefully)

Now, to do that, I need a better understanding of the various things
in there since I'm not familiar with nouveau at all. What I think I've
figured out is with a few questions, it would be awesome if you could
answer them so I can have a shot at fixing it all :-)

 - There is spg_shift and lpg_shift in the backend vmm. My understanding
is those correspond to the supported small and large page shift respectively
in the card's MMU, correct ? On nv41 they are both 12.

 - vma->node->type indicates the desired page shift for a given vma
object we are trying to map. It may or may not match spg_shift. If it
doesn't, the 'big' flag gets set in the various vm/base.c functions,
which makes them use a different page table via:

		struct nouveau_gpuobj *pgt = vm->pgt[pde].obj[big];

 Question: Can that ever happen on nv41 ? Or rather, can node->type
ever be set to something that is neither vmm->spg_shift nor vmm->lpg_shift ?

 - vma->node->offset is the location in bytes in the card memory space
of the nouveau_vma object, right ?

 - In nouveau_vm_map_sg_table(), we take a "delta" argument. I assume that's
an indication of where within the "vma" we want to map the sg list, ie page
1 of the sg list gets mapped to page 1 of the VMA, correct ?

Thanks !

Ben.
