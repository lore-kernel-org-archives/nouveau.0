From: Punit Agrawal <punit.agrawal@arm.com>
Subject: Re: [RFC PATCH] drm/nouveau/fb/nv50: set DMA mask before mapping scratch page
Date: Thu, 23 Jun 2016 13:57:42 +0100
Message-ID: <87ziqc2hbt.fsf@e105922-lin.cambridge.arm.com>
References: <1466425804-7229-1-git-send-email-ard.biesheuvel@linaro.org>
	<87a8ic44cg.fsf@e105922-lin.cambridge.arm.com>
	<CAKv+Gu8uZ38JLKJLey5RD+0g+_zJ9xZU+0UaopeRmriho030ug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAKv+Gu8uZ38JLKJLey5RD+0g+_zJ9xZU+0UaopeRmriho030ug@mail.gmail.com>
	(Ard Biesheuvel's message of "Thu, 23 Jun 2016 12:07:58 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, airlied@linux.ie, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:

> On 23 June 2016 at 11:55, Punit Agrawal <punit.agrawal@arm.com> wrote:
>> Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:
>>
>>> The 100c08 scratch page is mapped using dma_map_page() before the TTM
>>> layer has had a chance to set the DMA mask. This means we are still
>>> running with the default of 32 when this code executes, and this causes
>>> problems for platforms with no memory below 4 GB (such as AMD Seattle)
>>>
>>> So move the dma_map_page() to the .init hook, and set the streaming DMA
>>> mask based on the MMU subdev parameters before performing the call.
>>>
>>> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
>>
>> Hi Ard,
>>
>> Thanks for posting this patch.
>>
>> With the patch, I am able to see console output on a screen attached to
>> the NVS 300 PCIe card in an AMD Seattle system. It was failing with
>> a message similar to what you've posted below.
>>
>
> Thanks for the report. May I take it as a tested-by?

Sure.

Punit


[...]
