From: Punit Agrawal <punit.agrawal@arm.com>
Subject: Re: [RFC PATCH] drm/nouveau/fb/nv50: set DMA mask before mapping scratch page
Date: Thu, 23 Jun 2016 10:55:11 +0100
Message-ID: <87a8ic44cg.fsf@e105922-lin.cambridge.arm.com>
References: <1466425804-7229-1-git-send-email-ard.biesheuvel@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1466425804-7229-1-git-send-email-ard.biesheuvel@linaro.org> (Ard
	Biesheuvel's message of "Mon, 20 Jun 2016 14:30:04 +0200")
Sender: linux-kernel-owner@vger.kernel.org
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com, airlied@linux.ie, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Ard Biesheuvel <ard.biesheuvel@linaro.org> writes:

> The 100c08 scratch page is mapped using dma_map_page() before the TTM
> layer has had a chance to set the DMA mask. This means we are still
> running with the default of 32 when this code executes, and this causes
> problems for platforms with no memory below 4 GB (such as AMD Seattle)
>
> So move the dma_map_page() to the .init hook, and set the streaming DMA
> mask based on the MMU subdev parameters before performing the call.
>
> Signed-off-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>

Hi Ard,

Thanks for posting this patch.

With the patch, I am able to see console output on a screen attached to
the NVS 300 PCIe card in an AMD Seattle system. It was failing with
a message similar to what you've posted below.

For some reason, X refuses to start up but that, I think, is a problem
with my userspace setup.

Cheers,
Punit


[...]
