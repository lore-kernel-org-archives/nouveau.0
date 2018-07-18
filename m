From: Lyude Paul <lyude@redhat.com>
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Fix bogus indenting in
 nouveau_hwmon.c
Date: Wed, 18 Jul 2018 17:37:20 -0400
Message-ID: <da9a928ea3bd4ff2134bfc28447ef757232eabaa.camel@redhat.com>
References: <20180717000758.8770-1-lyude@redhat.com>
         <CACO55tt5e6PrvbfZUzQNb0T1o8twRfaFewt6tnjUW0DQYYXK-Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55tt5e6PrvbfZUzQNb0T1o8twRfaFewt6tnjUW0DQYYXK-Q@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: nouveau <nouveau@lists.freedesktop.org>, David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

I think that is an issue with your client? It seems to come up fine if I apply
it locally and look at it with gvim

On Tue, 2018-07-17 at 12:25 +0200, Karol Herbst wrote:
> isn't there like 1 space missing for each change? Or maybe my client
> is messed up, but please align it with the first letter of the
> parameters not the "(".
> 
> With that fixed: Reviewed-by: Karol Herbst <karolherbst@gmail.com>
> 
> On Tue, Jul 17, 2018 at 2:07 AM, Lyude Paul <lyude@redhat.com> wrote:
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > index 44178b4c3599..d556f24c6c48 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> > @@ -655,7 +655,7 @@ nouveau_read_string(struct device *dev, enum
> > hwmon_sensor_types type, u32 attr,
> > 
> >  static int
> >  nouveau_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > -                                                       int channel, long
> > *val)
> > +            int channel, long *val)
> >  {
> >         switch (type) {
> >         case hwmon_chip:
> > @@ -677,7 +677,7 @@ nouveau_read(struct device *dev, enum
> > hwmon_sensor_types type, u32 attr,
> > 
> >  static int
> >  nouveau_write(struct device *dev, enum hwmon_sensor_types type, u32 attr,
> > -                                                       int channel, long
> > val)
> > +             int channel, long val)
> >  {
> >         switch (type) {
> >         case hwmon_temp:
> > --
> > 2.17.1
> > 
> > _______________________________________________
> > Nouveau mailing list
> > Nouveau@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/nouveau
-- 
Cheers,
	Lyude Paul
