From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Subject: Re: [PATCH v5 0/3] drm/nouveau: set DMA mask before mapping scratch page
Date: Sun, 16 Oct 2016 21:12:48 +0100
Message-ID: <CAKv+Gu9UEOCQpU18X-x8z5HeJoxe24uD8R6nHXrAKj9wPyQ7hg@mail.gmail.com>
References: <1475768970-32512-1-git-send-email-ard.biesheuvel@linaro.org> <CAAVeFuKJ-Qmdnz1kmDtqo+P6m+aGW+DzVDkVTn+9ZLP94zO5dw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAAVeFuKJ-Qmdnz1kmDtqo+P6m+aGW+DzVDkVTn+9ZLP94zO5dw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On 7 October 2016 at 09:12, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Fri, Oct 7, 2016 at 12:49 AM, Ard Biesheuvel
> <ard.biesheuvel@linaro.org> wrote:
>> This v4 is now a 3 piece series (since v4), after Alexandre pointed out that
>> both GF 100 and NV50 are affected by the same issue, and that a related issue
>> has been solved already for Tegra in commit 9d0394c6bed5
>> ("drm/nouveau/instmem/gk20a: set DMA mask early").
>>
>> The issue that this series addresses is the fact that the Nouveau driver
>> invokes the DMA API before setting the DMA mask. In both cases addressed
>> here, these are simply static bidirectional mappings of scratch pages whose
>> purpose is not well understood, and in most cases, it does not matter that
>> these pages are always allocated below 4 GB even if the hardware can access
>> memory much higher up.
>>
>> However, on platforms without any RAM below 4 GB, the preliminary DMA mask
>> of 32 is preventing the nouveau driver from loading on GF100 and NV50
>> hardware with an error like the following one:
>>
>>    nouveau 0000:02:00.0: enabling device (0000 -> 0003)
>>    nouveau 0000:02:00.0: NVIDIA GT218 (0a8280b1)
>>    nouveau 0000:02:00.0: bios: version 70.18.a6.00.00
>>    nouveau 0000:02:00.0: fb ctor failed, -14
>>    nouveau: probe of 0000:02:00.0 failed with error -14
>>
>> So fix this by setting a preliminary DMA mask based on the MMU device 'dma_bits'
>> property (patch #1), and postpone mapping the scratch pages to the respective
>> FB .init() hooks. (#2 and #3)
>>
>> v5: move setting of preliminary DMA mask to nvkm_device_pci_new() (#1)
>>     move allocation and DMA mapping of scratch pages to .oneinit hooks (#2, #3)
>> v4: split and move dma_set_mask to probe hook (Alexander)
>> v3: rework code to get rid of DMA_ERROR_CODE references, which is not
>>     defined on all architectures
>> v2: replace incorrect comparison of dma_addr_t type var against NULL
>>
>> Ard Biesheuvel (3):
>>   drm/nouveau: set streaming DMA mask early
>>   drm/nouveau/fb/gf100: defer DMA mapping of scratch page to oneinit()
>>     hook
>>   drm/nouveau/fb/nv50: defer DMA mapping of scratch page to oneinit()
>>     hook
>
> The series,
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
>

Thank you Alexandre.

So is there a nouveau subtree this should go into? Or is it up to Dave
to pull it into drm?

Regards,
Ard.
