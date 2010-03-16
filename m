From: Thomas Hellstrom <thomas-4+hqylr40dJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [Patch RFC] ttm: nouveau accelerated on Xen pv-ops
	kernel
Date: Tue, 16 Mar 2010 14:25:40 +0100
Message-ID: <4B9F86D4.7090004@shipmail.org>
References: <d799c4761003100521h663c82eepda85f3f0309828c2@mail.gmail.com>	<20100311130258.49dc04bd@farn>
	<d799c4761003120445h57ab1373m31eb0add242ef74c@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <d799c4761003120445h57ab1373m31eb0add242ef74c-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Arvind R <arvino55-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, xen-devel-GuqFBffKawuULHF6PoxzQEEOCMrvLtNR@public.gmane.org
List-Id: nouveau.vger.kernel.org

Arvind R wrote:
> On Thu, Mar 11, 2010 at 4:32 PM, Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> wrote:
>   
>> I'm adding dri-devel@ to CC, since this suggested patch touches
>> TTM code, and none of the Nouveau code. TTM patches go via
>> dri-devel@.
>>
>> Thanks.
>>
>>
>>     

This is a NAK in its current form.

First, At mmap() time, the placement may not be known, and even if it is 
known, the placement may change.

Second, VM_IO is used to avoid including bos in core dumps, and make 
sure get_user_pages() isn't lazily called on BOs. That would cause the 
lock inversion prevention to fail.

Third, I'm not sure the Xen strategy will work for VM_MIXEDMAP, which 
may contain both IO- and real pages?

Thanks,
Thomas

>> On Wed, 10 Mar 2010 18:51:21 +0530
>> Arvind R <arvino55-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>>
>>     
>>> Hi,
>>> Following is a simple patch that is needed in nouveau to get
>>> accelerated X on a Xen dom0 pv_ops kernel. The kernel is jeremy's
>>> 2.6.31.6 as of 20100222. The whole gpu tree of nouveau (which is
>>> almost the mainline merge), was substituted into the kernel-tree.
>>> All components of X (mesa, Xorg-server-7.5, xf86-nouveau, libdrm)
>>> used of the same day.
>>>
>>> Patch:
>>> diff -Naur nouveau-kernel.orig/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> nouveau-kernel.new/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> --- nouveau-kernel.orig/drivers/gpu/drm/ttm/ttm_bo_vm.c 2010-01-27
>>> 10:19:28.000000000 +0530
>>> +++ nouveau-kernel.new/drivers/gpu/drm/ttm/ttm_bo_vm.c  2010-03-10
>>> 17:28:59.000000000 +0530
>>> @@ -271,7 +271,10 @@
>>>          */
>>>
>>>         vma->vm_private_data = bo;
>>> -       vma->vm_flags |= VM_RESERVED | VM_IO | VM_MIXEDMAP |
>>> VM_DONTEXPAND;
>>> +       vma->vm_flags |= VM_RESERVED | VM_MIXEDMAP |
>>> VM_DONTEXPAND;
>>> +       if (!((bo->mem.placement & TTM_PL_MASK_MEM) &
>>> TTM_PL_FLAG_TT))
>>> +               vma->vm_flags |= VM_IO;
>>> +       vma->vm_page_prot = vma_get_vm_prot(vma->vm_flags);
>>>         return 0;
>>>  out_unref:
>>>         ttm_bo_unref(&bo);
>>>
>>>       
> sorry for the typo and other procedural errors.
> the last added line should be
> +    vma->vm_page_prot = vm_get_page_prot(vma->vm_flags)
>
>   
>>> This patch is necessary because, in Xen, PFN of a page is
>>> virtualised. So physical addresses
>>> for DMA programming needs to use the MFN. Xen transparently does
>>> the correct translation
>>> using the _PAGE_IOMEM prot-bit in the PTE. If the bit is set,
>>> then Xen assumes that the backing
>>> memory is in the IOMEM space, and PFN equals MFN. If not set,
>>> page_to_pfn() returns MFN.
>>>
>>> The patch enables the ttm_bo_vm_fault() handler to behave
>>> correctly under Xen, and has no
>>> side-effects on normal (not under Xen) operations. The use of
>>> TTM_PL_FLAG_TT in the
>>> check assumes that all other placements are backed by device
>>> memory or IO. If there are
>>> any other placements that use system memory, that flag has to be
>>> OR'ed into the check.
>>>
>>> The above patch has no implications on a normal kernel or a Xen
>>> pv_ops kernel booted without
>>> the Xen hypervisor. My testing is on a debian-lenny environment
>>> on a Core2 processor with
>>> nVidia GeForce 9400 GT.
>>>       
> Efficacy of patch:
> successful flightgear run on dom0 AND bareboot!
>
> Arvind R.
>
> ------------------------------------------------------------------------------
> Download Intel&#174; Parallel Studio Eval
> Try the new software tools for yourself. Speed compiling, find bugs
> proactively, and fine-tune applications for parallel performance.
> See why Intel Parallel Studio got high marks during beta.
> http://p.sf.net/sfu/intel-sw-dev
> --
> _______________________________________________
> Dri-devel mailing list
> Dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
> https://lists.sourceforge.net/lists/listinfo/dri-devel
>   
