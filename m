From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [Nouveau] [PATCH v3] drm/nouveau/fb/nv50: set DMA mask before
 mapping scratch page
Date: Sat, 16 Jul 2016 15:20:10 +0900
Message-ID: <CAAVeFuLsLB8J_zAFZXxGesQjm5=6ZRjtC-4Si3OkCzx+WMMLrQ@mail.gmail.com>
References: <1467910768-2643-1-git-send-email-ard.biesheuvel@linaro.org>
 <CAAVeFuL+NEigyYk2LK3O5PLmeOSEOAKBpoT7TDbsvArWhtaA=g@mail.gmail.com> <CAKv+Gu-67zw0oNAmTfMD=JhgaD4=zPU5+uurUnTDDMrDyGTy_Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu-67zw0oNAmTfMD=JhgaD4=zPU5+uurUnTDDMrDyGTy_Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>, Ben Skeggs <bskeggs@redhat.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Sat, Jul 16, 2016 at 4:45 AM, Ard Biesheuvel
<ard.biesheuvel@linaro.org> wrote:
> On 15 July 2016 at 07:52, Alexandre Courbot <gnurou@gmail.com> wrote:
>> On Fri, Jul 8, 2016 at 1:59 AM, Ard Biesheuvel
>> <ard.biesheuvel@linaro.org> wrote:
>>> The 100c08 scratch page is mapped using dma_map_page() before the TTM
>>> layer has had a chance to set the DMA mask. This means we are still
>>> running with the default of 32 when this code executes, and this causes
>>> problems for platforms with no memory below 4 GB (such as AMD Seattle)
>>>
>>> So move the dma_map_page() to the .init hook, and set the streaming DMA
>>> mask based on the MMU subdev parameters before performing the call.
>>>
>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>> ---
>>> I am sure there is a much better way to address this, but this fixes the
>>> problem I get on AMD Seattle with a GeForce 210 PCIe card:
>>>
>>>    nouveau 0000:02:00.0: enabling device (0000 -> 0003)
>>>    nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)
>>>    nouveau 0000:02:00.0: bios: version 70.18.a6.00.00
>>>    nouveau 0000:02:00.0: fb ctor failed, -14
>>>    nouveau: probe of 0000:02:00.0 failed with error -14
>>>
>>> v2: replace incorrect comparison of dma_addr_t type var against NULL
>>> v3: rework code to get rid of DMA_ERROR_CODE references, which is not
>>>     defined on all architectures
>>>
>>>  drivers/gpu/drm/nouveau/nvkm/subdev/fb/nv50.c | 40 ++++++++++++++------
>>>  1 file changed, 29 insertions(+), 11 deletions(-)
>>
>> I think the same problem exists in fb/gf100.c, would be nice to fix it
>> there as well.
>>
>> I have faced similar issues on Tegra before. I wonder whether this
>> could not be addressed the same way I did, i.e. by setting a
>> temporary, fail-safe DMA mask in nvkm_device_pci_new()? That would
>> allow all subdevs to map pages to the device safely in their init.
>> With your solution, each subdev in that scenario needs to set a DMA
>> mask to be safe.
>>
>> Not sure whether that's practical as I suppose you want to make the
>> DMA mask larger than 32 bits?
>>
>
> Yes. This particular device supports 40 bits (judging from the MMU
> driver code) of physical address space, and RAM starts at
> 0x80_0000_0000 on AMD Seattle, so we need all 40 bits.
>
>> If you absolutely need to do this in the device, can we move the DMA
>> mask setting logic in nouveau_ttm into its own function and call it
>> from the FB driver to make sure the mask is correctly set? Maybe this
>> could even be made a MMU function and called during MMU ctor or init
>> (in the latter case we would also need to reorder MMU init to make it
>> happen before FB and INSTMEM).
>
> Happy to have stab at implementing this, but I'd like some buy in from
> the maintainer first before I dive into this. Ben is the person to
> give his blessing, I suppose? He has not responded to any of my
> postings so far, unfortunately.

A patch would make it easier to judge whether this is the right thing
to do, but let's hear what Ben thinks about it.
