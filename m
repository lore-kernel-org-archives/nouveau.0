From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [PATCH 1/2] drm/nouveau/dispnv04: Grab/put runtime PM refs on
 DPMS on/off
Date: Wed, 7 Aug 2019 19:06:46 -0400
Message-ID: <CAKb7UviCg7jeEyWqsHxygfPuqTg4ybFgTH8cRdx2O==tTEUD9Q@mail.gmail.com>
References: <20190807213304.9255-1-lyude@redhat.com> <20190807213304.9255-2-lyude@redhat.com>
 <20190807215508.GK7444@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190807215508.GK7444@phenom.ffwll.local>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
Cc: Daniel Vetter <daniel@ffwll.ch>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 7, 2019 at 5:55 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Wed, Aug 07, 2019 at 05:33:00PM -0400, Lyude Paul wrote:
> > The code claims to grab a runtime PM ref when at least one CRTC is
> > active, but that's not actually the case as we grab a runtime PM ref
> > whenever a CRTC is enabled regardless of it's DPMS state. Meaning that
> > we can end up keeping the GPU awake when there are no screens enabled,
> > something we don't really want to do.
> >
> > Note that we fixed this same issue for nv50 a while ago in:
> >
> > commit e5d54f193572 ("drm/nouveau/drm/nouveau: Fix runtime PM leak in
> > nv50_disp_atomic_commit()")
> >
> > Since we're about to remove nouveau_drm->have_disp_power_ref in the next
> > commit, let's also simplify the RPM code here while we're at it: grab a
> > ref during a modeset, grab additional RPM refs for each CRTC enabled by
> > said modeset, and drop an RPM ref for each CRTC disabled by said
> > modeset. This allows us to keep the GPU awake whenever screens are
> > turned on, without needing to use nouveau_drm->have_disp_power_ref.
> >
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv04/crtc.c | 18 ++++--------------
> >  1 file changed, 4 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv04/crtc.c b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > index f22f01020625..08ad8e3b9cd2 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv04/crtc.c
> > @@ -183,6 +183,10 @@ nv_crtc_dpms(struct drm_crtc *crtc, int mode)
> >               return;
> >
> >       nv_crtc->last_dpms = mode;
> > +     if (mode == DRM_MODE_DPMS_ON)
> > +             pm_runtime_get_noresume(dev->dev);
> > +     else
> > +             pm_runtime_put_noidle(dev->dev);
>
> it's after we filter out duplicate operations, so that part looks good.
> But not all of nouveau's legacy helper crtc callbacks go throuh ->dpms I
> think: nv_crtc_disable doesn't, and crtc helpers use that in preference
> over ->dpms in some cases.
>
> I think the only way to actually hit that path is if you switch an active
> connector from an active CRTC to an inactive one. This implicitly disables
> the crtc (well, should, nv_crtc_disable doesn't seem to shut down hw), and
> I think would leak your runtime PM reference here. At least temporarily.
>
> No idea how to best fix that. Aside from "use atomic" :-)

Not sure if this is relevant to the discussion at hand, but I'd like
to point out that dispnv04 is for pre-nv50 things, which definitely
didn't support any kind of ACPI-based runtime suspend.

  -ilia
