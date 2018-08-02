From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH v4 8/8] drm/nouveau: Call pm_runtime_get_noresume() from
 hpd handlers
Date: Thu, 02 Aug 2018 16:00:08 -0400
Message-ID: <b55fe368eaf99dee03e88288ec6e8fa53bb466e7.camel@redhat.com>
References: <20180801211459.7731-1-lyude@redhat.com>
         <20180801211459.7731-9-lyude@redhat.com> <20180802194041.GC6180@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180802194041.GC6180@wunner.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>
Cc: nouveau@lists.freedesktop.org, Karol Herbst <karolherbst@gmail.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Thu, 2018-08-02 at 21:40 +0200, Lukas Wunner wrote:
> On Wed, Aug 01, 2018 at 05:14:58PM -0400, Lyude Paul wrote:
> > We can't and don't need to try resuming the device from our hotplug
> > handlers, but hotplug events are generally something we'd like to keep
> > the device awake for whenever possible. So, grab a PM ref safely in our
> > hotplug handlers using pm_runtime_get_noresume() and mark the device as
> > busy once we're finished.
> 
> Patch looks fine in principle, but doesn't seem to be sufficient to fix
> the following race:
> 
> 1. runtime_suspend commences
> 2. user plugs in a display before the runtime_suspend worker disables
>    hotplug interrupts in nouveau_display_fini()
> 3. hotplug is handled, display is lit up
> 4. runtime_suspend worker waits for hotplug handler to finish
> 5. GPU is runtime suspended and the newly plugged in display goes black
> 
> The call to pm_runtime_mark_last_busy() has no effect in this situation
> because rpm_suspend() doesn't look at the last_busy variable after the
> call to rpm_callback().  What's necessary here is that runtime_suspend is
> aborted and -EBUSY returned.

So: that wasn't actually what this patch was meant to fix, this is just meant
to make it a little more likely that the GPU won't fall asleep while doing
connector probing, since there's no risk handling it here.

That being said; I think there's some parts you're missing on this. Mainly
that regardless of whether or not the GPU ends up getting runtime suspended
here, a hotplug event has still been propogated to userspace. If fbcon isn't
the one in charge in that scenario (e.g. we have gnome-shell, X, etc. running)
then whoever is can still respond to the hotplug as usual, and the probing
from userspace will result in waking the GPU back up again since
nouveau_connector_detect() will grab a runtime PM ref since it's not being
called from the hpd context. I don't think this is the case yet for MST
connectors since they don't use nouveau_connector_detect(), and I'll see if I
fix that as well in the next patch series.

Now; what you pointed out made me realize I'm not sure that would apply when
fbcon does happen to be the one in control, since fb_helper will have it's
hotplug handling suspended at this point, which will mean that it won't
respond to the connector change until the GPU is runtime resumed by something
else. That definitely should get fixed.

Also: let me know if any of this doesn't sound correct, there's so much to
this I wouldn't be surprised if I missed something else
> 
> Thanks,
> 
> Lukas
> 
> > 
> > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > Cc: stable@vger.kernel.org
> > Cc: Lukas Wunner <lukas@wunner.de>
> > Cc: Karol Herbst <karolherbst@gmail.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_connector.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > index 8409c3f2c3a1..5a8e8c1ad647 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> > @@ -1152,6 +1152,11 @@ nouveau_connector_hotplug(struct nvif_notify
> > *notify)
> >  	const char *name = connector->name;
> >  	struct nouveau_encoder *nv_encoder;
> >  
> > +	/* Resuming the device here isn't possible; but the suspend PM ops
> > +	 * will wait for us to finish our work before disabling us so this
> > +	 * should be enough
> > +	 */
> > +	pm_runtime_get_noresume(drm->dev->dev);
> >  	nv_connector->hpd_task = current;
> >  
> >  	if (rep->mask & NVIF_NOTIFY_CONN_V0_IRQ) {
> > @@ -1171,6 +1176,9 @@ nouveau_connector_hotplug(struct nvif_notify
> > *notify)
> >  	}
> >  
> >  	nv_connector->hpd_task = NULL;
> > +
> > +	pm_runtime_mark_last_busy(drm->dev->dev);
> > +	pm_runtime_put_autosuspend(drm->dev->dev);
> >  	return NVIF_NOTIFY_KEEP;
> >  }
> >  
> > -- 
> > 2.17.1
> > 
-- 
Cheers,
	Lyude Paul
