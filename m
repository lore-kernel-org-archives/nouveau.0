From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 1/5] drm/nouveau: Check backlight IDs are >= 0, not > 0
Date: Thu, 23 Aug 2018 12:29:44 -0400
Message-ID: <6f99abb8f474f064588c64e29058db5c66acae13.camel@redhat.com>
References: <20180823012151.20099-1-lyude@redhat.com>
         <20180823012151.20099-2-lyude@redhat.com>
         <CACO55tsuJUyQULA3oGm9VxH7ufObvW1bNH_1g7WCwcpJPrVugw@mail.gmail.com>
Reply-To: lyude@redhat.com
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CACO55tsuJUyQULA3oGm9VxH7ufObvW1bNH_1g7WCwcpJPrVugw@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, stable@vger.kernel.org, Jeffery Miller <jmiller@neverware.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

On Thu, 2018-08-23 at 14:00 +0200, Karol Herbst wrote:
> Patches 1-5 are Reviewed-by: Karol Herbst <kherbst@redhat.com>
> 
> I think it might be worth to test those patches on a system without
> any backlight devices just to verify we don't break things, but the
> code looked good already, so maybe we don't really need to test.
Did! The P50 lets you switch between dedicated GPU mode and hybrid GPU mode, and
it switches backlight control between the intel and nvidia GPUs. Seemed to work
just fine for me
> 
> On Thu, Aug 23, 2018 at 3:21 AM, Lyude Paul <lyude@redhat.com> wrote:
> > Remember, ida IDs start at 0, not 1!
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: stable@vger.kernel.org
> > Cc: Jeffery Miller <jmiller@neverware.com>
> > Cc: Karol Herbst <kherbst@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_backlight.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > index 408b955e5c39..6dd72bc32897 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
> > @@ -116,7 +116,7 @@ nv40_backlight_init(struct drm_connector *connector)
> >                                        &nv40_bl_ops, &props);
> > 
> >         if (IS_ERR(bd)) {
> > -               if (bl_connector.id > 0)
> > +               if (bl_connector.id >= 0)
> >                         ida_simple_remove(&bl_ida, bl_connector.id);
> >                 return PTR_ERR(bd);
> >         }
> > @@ -249,7 +249,7 @@ nv50_backlight_init(struct drm_connector *connector)
> >                                        nv_encoder, ops, &props);
> > 
> >         if (IS_ERR(bd)) {
> > -               if (bl_connector.id > 0)
> > +               if (bl_connector.id >= 0)
> >                         ida_simple_remove(&bl_ida, bl_connector.id);
> >                 return PTR_ERR(bd);
> >         }
> > --
> > 2.17.1
> > 
