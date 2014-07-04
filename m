From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH] drm: default scaling to NONE for external
 connectors
Date: Thu, 3 Jul 2014 20:47:59 -0400
Message-ID: <CAKb7UvgGMvrLCMyS75E8YoT+Q_=eQ8EctTQftbM1mp_Q0=c9tA@mail.gmail.com>
References: <1404415623-7198-1-git-send-email-imirkin@alum.mit.edu>
 <CACAvsv7iLKLENQbq0UAb39AjV-fg7o4TXLHbO2Bs_JjKoj9gYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
In-Reply-To: <CACAvsv7iLKLENQbq0UAb39AjV-fg7o4TXLHbO2Bs_JjKoj9gYw@mail.gmail.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Ben Skeggs <skeggsb@gmail.com>
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Thu, Jul 3, 2014 at 8:27 PM, Ben Skeggs <skeggsb@gmail.com> wrote:
> On Fri, Jul 4, 2014 at 5:27 AM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>> Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
>> ---
>>
>> Based on a recent discussion in #radeon, and also my own observation that the
>> 'full' scaling causes no end of confusion among users.
>>
>> See https://bugs.freedesktop.org/show_bug.cgi?id=80868 for some more details,
>> although it is more radeon-specific.
>>
>> Side-note: the scaling mode update handler disallows setting the mode to none
>> for LVDS... should it be the same for eDP as well? Or perhaps relax the
>> restriction and let people do whatever they want?
> We do need some improvement here, for sure.  What we do currently is
> confusing for a lot of cases, like where people select a
> (non-preferred) 24Hz mode or something and still get 60 because we
> always use the preferred mode on the backend (except for the 'None'
> scaling mode).

Right. That was the confusion I was largely referring to.

>
> I somewhat think we should probably default to something like "if mode
> came from edid (or the user?), no scaling" and "if it's from the
> random list of modes we add to fixed panels to keep old games happy,
> scale to closest edid mode / preferred mode / something".. I'm not
> entirely sure what the best choices are to be honest.

What are "fixed panels" (in the sense of... how does a driver
determine this)? I figured it was just LVDS/eDP == fixed. Everything
else == not fixed. At least that's what radeon does, according to...
someone (Alex, IIRC).

Unfortunately scaling mode is a connector-level property. So it may be
confusing if the user were to set it to something, then connect a
different screen, and have it all of a sudden reset itself to whatever
we feel the default should be. I guess we could keep track of a "has
the user futzed with this" bit.

I guess what you're saying is more of a per-mode property (of which no
such thing currently exists)...

  -ilia

>
> Ben.
>
>>
>>  drm/nouveau_connector.c | 7 +++++--
>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>
>> diff --git a/drm/nouveau_connector.c b/drm/nouveau_connector.c
>> index 1fa222e..295e222 100644
>> --- a/drm/nouveau_connector.c
>> +++ b/drm/nouveau_connector.c
>> @@ -1192,6 +1192,8 @@ nouveau_connector_create(struct drm_device *dev, int index)
>>                                               disp->color_vibrance_property,
>>                                               150);
>>
>> +       nv_connector->scaling_mode = DRM_MODE_SCALE_NONE;
>> +
>>         switch (nv_connector->type) {
>>         case DCB_CONNECTOR_VGA:
>>                 if (nv_device(drm->device)->card_type >= NV_50) {
>> @@ -1203,10 +1205,11 @@ nouveau_connector_create(struct drm_device *dev, int index)
>>         case DCB_CONNECTOR_TV_0:
>>         case DCB_CONNECTOR_TV_1:
>>         case DCB_CONNECTOR_TV_3:
>> -               nv_connector->scaling_mode = DRM_MODE_SCALE_NONE;
>>                 break;
>>         default:
>> -               nv_connector->scaling_mode = DRM_MODE_SCALE_FULLSCREEN;
>> +               if (type == DRM_MODE_CONNECTOR_LVDS ||
>> +                   type == DRM_MODE_CONNECTOR_eDP)
>> +                       nv_connector->scaling_mode = DRM_MODE_SCALE_FULLSCREEN;
>>
>>                 drm_object_attach_property(&connector->base,
>>                                 dev->mode_config.scaling_mode_property,
>> --
>> 1.8.5.5
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau@lists.freedesktop.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
