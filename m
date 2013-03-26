From: Marcin Slusarz <marcin.slusarz@gmail.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Ack interrupts for some fuc engines
Date: Tue, 26 Mar 2013 21:29:52 +0100
Message-ID: <20130326202952.GA11307@joi.lan>
References: <5150175D.3070808@gmail.com> <20130325181456.GA8026@joi.lan>
	<51514044.1040709@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <51514044.1040709@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

On Tue, Mar 26, 2013 at 07:29:24AM +0100, Maarten Lankhorst wrote:
> Op 25-03-13 19:14, Marcin Slusarz schreef:
> > On Mon, Mar 25, 2013 at 10:22:37AM +0100, Maarten Lankhorst wrote:
> >> Fixes 100% cpu usage when the exit interrupt never got acked.
> >>
> >> Signed-off-by: Maarten Lankhorst <m.b.lankhorst@gmail.com>
> >> ---
> >> diff --git a/drivers/gpu/drm/nouveau/core/core/falcon.c b/drivers/gpu/drm/nouveau/core/core/falcon.c
> >> index e05c157..b11c5f3 100644
> >> --- a/drivers/gpu/drm/nouveau/core/core/falcon.c
> >> +++ b/drivers/gpu/drm/nouveau/core/core/falcon.c
> >> @@ -229,6 +229,24 @@ _nouveau_falcon_fini(struct nouveau_object *object, bool suspend)
> >>  	return nouveau_engine_fini(&falcon->base, suspend);
> >>  }
> >>  
> >> +void
> >> +nouveau_falcon_intr(struct nouveau_subdev *subdev)
> >> +{
> >> +	struct nouveau_falcon *falcon = (void*)subdev;
> >> +	u32 intr = nv_ro32(falcon, 0x008);
> >> +
> >> +	nv_wo32(falcon, 0x004, intr);
> >> +
> >> +	if (intr & 0x10) {
> >> +		intr &= ~0x10;
> >> +
> >> +		nv_info(falcon, "Exit interrupt called\n");
> > Do you really want to print it at "info" level? How frequent it is?
> It shouldn't be often, I want it to run at the error level since that usually
> means the firmware exited prematurely/crashed and things go bad, but it
> happens with the secret scrubber finishing on initialization too. That one
> is harmless though.

Maybe it should say:
nv_error(falcon, "firmware exited prematurely\n");
?

> >> +	}
> >> +
> >> +	if (intr)
> >> +		nv_error(falcon, "Unhandled interrupt %08x\n", intr);
> >> +}
> >> +
> >>  int
> >>  nouveau_falcon_create_(struct nouveau_object *parent,
> >>  		       struct nouveau_object *engine,
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > http://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> 
