From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v5 09/10] dma-buf-map: Add memcpy and pointer-increment
 interfaces
Date: Thu, 5 Nov 2020 13:54:31 +0100
Message-ID: <20201105125431.GW401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-10-tzimmermann@suse.de>
 <CACRpkdbvGWKo8y323actUJn9xXmxpgDw1EKLiPH4RqB_kFx=XQ@mail.gmail.com>
 <27acbd7e-d72e-4e05-c147-b50f56e21589@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-samsung-soc-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <27acbd7e-d72e-4e05-c147-b50f56e21589@suse.de>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Dave Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Sam Ravnborg <sam@ravnborg.org>, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Gerd Hoffmann <kraxel@redhat.com>, Lucas Stach <l.stach@pengutronix.de>, linux+etnaviv@armlinux.org.uk, Christian Gmeiner <christian.gmeiner@gmail.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Kukjin Kim <kgene@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, yuq825@gmail.com, Ben Skeggs <bskeg>
List-Id: nouveau.vger.kernel.org

On Thu, Nov 05, 2020 at 11:37:08AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.11.20 um 11:07 schrieb Linus Walleij:
> > Overall I like this, just an inline question:
> > 
> > On Tue, Oct 20, 2020 at 2:20 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > 
> >> To do framebuffer updates, one needs memcpy from system memory and a
> >> pointer-increment function. Add both interfaces with documentation.
> > 
> > (...)
> >> +/**
> >> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> >> + * @dst:       The dma-buf mapping structure
> >> + * @src:       The source buffer
> >> + * @len:       The number of byte in src
> >> + *
> >> + * Copies data into a dma-buf mapping. The source buffer is in system
> >> + * memory. Depending on the buffer's location, the helper picks the correct
> >> + * method of accessing the memory.
> >> + */
> >> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> >> +{
> >> +       if (dst->is_iomem)
> >> +               memcpy_toio(dst->vaddr_iomem, src, len);
> >> +       else
> >> +               memcpy(dst->vaddr, src, len);
> >> +}
> > 
> > Are these going to be really big memcpy() operations?
> 
> Individually, each could be a scanline, so a few KiB. (4 bytes *
> horizontal resolution). Updating a full framebuffer can sum up to
> several MiB.
> 
> > 
> > Some platforms have DMA offload engines that can perform memcpy(),They could be
> > drivers/dma, include/linux/dmaengine.h
> > especially if the CPU doesn't really need to touch the contents
> > and flush caches etc.
> > An example exist in some MTD drivers that move large quantities of
> > data off flash memory like this:
> > drivers/mtd/nand/raw/cadence-nand-controller.c
> > 
> > Notice that DMAengine and DMAbuf does not have much in common,
> > the names can be deceiving.
> > 
> > The value of this varies with the system architecture. It is not just
> > a question about performance but also about power and the CPU
> > being able to do other stuff in parallel for large transfers. So *when*
> > to use this facility to accelerate memcpy() is a delicate question.
> > 
> > What I'm after here is if these can be really big, do we want
> > (in the long run, not now) open up to the idea to slot in
> > hardware-accelerated memcpy() here?
> 
> We currently use this functionality for the graphical framebuffer
> console that most DRM drivers provide. It's non-accelerated and slow,
> but this has not been much of a problem so far.
> 
> Within DRM, we're more interested in removing console code from drivers
> and going for the generic implementation.
> 
> Most of the graphics HW allocates framebuffers from video RAM, system
> memory or CMA pools and does not really need these memcpys. Only a few
> systems with small video RAM require a shadow buffer, which we flush
> into VRAM as needed. Those might benefit.
> 
> OTOH, off-loading memcpys to hardware sounds reasonable if we can hide
> it from the DRM code. I think it all depends on how invasive that change
> would be.

I wouldn't, all the additional locks this would pull in sound like
nightmare. And when an oops happens, this might be the only thing that
manages to get the oops to the user.

Unless someone really starts caring about fbcon acceleration I really
wouldn't bother. Ok maybe it also matters for fbdev, but the problem is
that the page fault intercepting alone is already expensive, so the only
real solution if you care about performance in that case is to use kms
natively, and use a dirty rectangle flip (or the DIRTY syscall).

And in there drivers should (and do) use any dma engines they have to
upload the frames already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
