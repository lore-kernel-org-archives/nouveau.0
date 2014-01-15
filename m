From: Bob Gleitsmann <rjgleits@bellsouth.net>
Subject: Re: [Nouveau] [Fwd: [PATCH] Fix null dereference oopses for nv40
	cards] kernel 3.13.0-rc8
Date: Wed, 15 Jan 2014 18:42:24 -0500
Message-ID: <1389829344.1293.0.camel@s2895bg>
References: <1389669776.1320.5.camel@s2895bg>
	<CACAvsv41kYncW3y_atf3LhEy7k6SOf-geHfcQRFmtMQYBBRZPg@mail.gmail.com>
	<CACAvsv7-3nLH=47oXCXkP3PGP+UXrBgHyW1qy-YjXq41xf_e+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv7-3nLH=47oXCXkP3PGP+UXrBgHyW1qy-YjXq41xf_e+Q@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

Seems to work OK thanks.

Bob

On Tue, 2014-01-14 at 15:15 +1000, Ben Skeggs wrote:
> On Tue, Jan 14, 2014 at 3:07 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> > On Tue, Jan 14, 2014 at 1:22 PM, Bob Gleitsmann <rjgleits@bellsouth.net> wrote:
> >> I should have mentioned that this applies to Linus' 3.13.0-rc7 and rc8
> >> git. Maybe it's obvious.
> > Hey Bob,
> >
> > Thanks for reporting this.  Can you try the attached patch instead and
> > report if it helps you?
> Thinko in first attempt, new one attached.
> 
> >
> > Ben.
> >
> >>
> >> Sorry about that.
> >>
> >> Bob
> >> -------- Forwarded Message --------
> >> From: Bob Gleitsmann <rjgleits@bellsouth.net>
> >> To: bskeggs@redhat.com
> >> Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
> >> Subject: [PATCH] Fix null dereference oopses for nv40 cards
> >> Date: Mon, 13 Jan 2014 01:45:36 -0500
> >>
> >> The problem affects nv40 cards during booting. It comes from there being
> >> two places where subdev arrays are maintained. A commit was recently
> >> added to make the two equal. However, the struct nouveau_device version
> >> ends up being referenced before it is initialized. The problem arises
> >> during the creation of the INSTMEM and THERM subdevs. '
> >>
> >> Signed off by: Bob Gleitsmann rjgleits@bellsouth.net
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
> >> index b10a143..0f494ca 100644
> >> --- a/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
> >> +++ b/drivers/gpu/drm/nouveau/core/subdev/instmem/nv40.c
> >> @@ -23,6 +23,7 @@
> >>   */
> >>
> >>  #include <engine/graph/nv40.h>
> >> +#include <core/device.h>
> >>
> >>  #include "nv04.h"
> >>
> >> @@ -38,6 +39,7 @@ nv40_instmem_ctor(struct nouveau_object *parent, struct nouveau_object *engine,
> >>
> >>         ret = nouveau_instmem_create(parent, engine, oclass, &priv);
> >>         *pobject = nv_object(priv);
> >> +       device->subdev[NVDEV_SUBDEV_INSTMEM] = *pobject;
> >>         if (ret)
> >>                 return ret;
> >>
> >> diff --git a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
> >> index 002e51b..59b25be 100644
> >> --- a/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
> >> +++ b/drivers/gpu/drm/nouveau/core/subdev/therm/nv40.c
> >> @@ -187,9 +187,11 @@ nv40_therm_ctor(struct nouveau_object *parent,
> >>  {
> >>         struct nv40_therm_priv *priv;
> >>         int ret;
> >> +       struct nouveau_device *device = nv_device(parent);
> >>
> >>         ret = nouveau_therm_create(parent, engine, oclass, &priv);
> >>         *pobject = nv_object(priv);
> >> +       device->subdev[NVDEV_SUBDEV_THERM] = *pobject;
> >>         if (ret)
> >>                 return ret;
> >>
> >>
> >>
> >>
> >> _______________________________________________
> >> Nouveau mailing list
> >> Nouveau@lists.freedesktop.org
> >> http://lists.freedesktop.org/mailman/listinfo/nouveau
