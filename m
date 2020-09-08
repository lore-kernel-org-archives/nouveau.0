From: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 1/1] drm: allow limiting the scatter list size.
Date: Tue, 8 Sep 2020 07:48:58 +0200
Message-ID: <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
References: <20200907112425.15610-1-kraxel@redhat.com>
 <20200907112425.15610-2-kraxel@redhat.com>
 <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@linux.ie>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, Christian Gmeiner <christian.gmeiner@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
List-Id: nouveau.vger.kernel.org

On Mon, Sep 07, 2020 at 03:53:02PM +0200, Daniel Vetter wrote:
> On Mon, Sep 7, 2020 at 1:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> >
> > Add drm_device argument to drm_prime_pages_to_sg(), so we can
> > call dma_max_mapping_size() to figure the segment size limit
> > and call into __sg_alloc_table_from_pages() with the correct
> > limit.
> >
> > This fixes virtio-gpu with sev.  Possibly it'll fix other bugs
> > too given that drm seems to totaly ignore segment size limits
> > so far ...
> >
> > v2: place max_segment in drm driver not gem object.
> > v3: move max_segment next to the other gem fields.
> > v4: just use dma_max_mapping_size().
> >
> > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> Uh, are you sure this works in all cases for virtio?

Sure, I've tested it ;)

> The comments I've found suggest very much not ... Or is that all very
> old stuff only that no one cares about anymore?

I think these days it is possible to override dma_ops per device, which
in turn allows virtio to deal with the quirks without the rest of the
kernel knowing about these details.

I also think virtio-gpu can drop the virtio_has_dma_quirk() checks, just
use the dma api path unconditionally and depend on virtio core having
setup dma_ops in a way that it JustWorks[tm].  I'll look into that next.

take care,
  Gerd
