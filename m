From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 14/14] drm/nouveau/therm: Rework
 nouveau_therm_create()
Date: Mon, 21 May 2012 21:47:10 +1000
Message-ID: <20120521114710.GE10508@nisroch.bne.redhat.com>
References: <1337555703-18925-1-git-send-email-emil.l.velikov@gmail.com>
	<1337555703-18925-15-git-send-email-emil.l.velikov@gmail.com>
	<20120521063032.GC10508@nisroch.bne.redhat.com>
	<op.wem99gsx8t7z9u@arch-laptop>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <op.wem99gsx8t7z9u@arch-laptop>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, May 21, 2012 at 07:13:54AM +0100, Emil Velikov wrote:
> On Mon, 21 May 2012 07:30:32 +0100, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 
> >On Mon, May 21, 2012 at 12:15:03AM +0100, Emil Velikov wrote:
> >>It contains a few changes mainly targeting the following
> >> * Therm table is present in BIT vbios
> >> * Parse the vbios table before hooking temp_get(), as it
> >>contains the therm
> >>sensor calibration data
> >> * Add dummy_therm_temp_get() function to prevent multiple null dereff's
> >
> >I didn't take this patch at all yet.  I'll let Martin put his input into
> >this instead.  I didn't really touch the thermal stuff aside from
> >matching
> >APIs because he's got an overhaul pending anyway.
> >
> >Comments on specific pieces inline as they may be useful.
> Point taken, I believe the whole therm subdev will need some love after
> the connection with the i2c devices have been finalised
> 
> >
> >>
> >>Signed-off-by: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> >>---
> >> drivers/gpu/drm/nouveau/nouveau_pm.c    |    2 +-
> >> drivers/gpu/drm/nouveau/nouveau_therm.c |   63
> >>++++++++++++++++++++++++-------
> >> 2 files changed, 50 insertions(+), 15 deletions(-)
> >>
> >>diff --git a/drivers/gpu/drm/nouveau/nouveau_pm.c
> >>b/drivers/gpu/drm/nouveau/nouveau_pm.c
> >>index 9dd34fe..1b4422b 100644
> >>--- a/drivers/gpu/drm/nouveau/nouveau_pm.c
> >>+++ b/drivers/gpu/drm/nouveau/nouveau_pm.c
> >>@@ -693,7 +693,7 @@ nouveau_hwmon_init(struct nouveau_device *ndev)
> >> 	}
> >>
> >> 	/* if the card can read the fan rpm */
> >>-	if (nouveau_gpio_func_valid(ndev, DCB_GPIO_FAN_SENSE)) {
> >>+	if (pfan && pfan->sense(pfan) >= 0) {
> >> 		ret = sysfs_create_group(&dev->pdev->dev.kobj,
> >> 					 &hwmon_fan_rpm_attrgroup);
> >> 		if (ret)
> >>diff --git a/drivers/gpu/drm/nouveau/nouveau_therm.c
> >>b/drivers/gpu/drm/nouveau/nouveau_therm.c
> >>index acf81a9..91095be 100644
> >>--- a/drivers/gpu/drm/nouveau/nouveau_therm.c
> >>+++ b/drivers/gpu/drm/nouveau/nouveau_therm.c
> >>@@ -30,6 +30,12 @@
> >> #include "nouveau_pm.h"
> >> #include "nouveau_therm.h"
> >>
> >>+static inline int
> >>+dummy_therm_temp_get(struct nouveau_therm *ptherm)
> >>+{
> >>+	return 0;
> >>+}
> >>+
> >I don't really like this, if we can't expose any thermal data I think we
> >just shouldn't create a thermal subdev?
> It boils to the point of - what is the reasonable approach to get
> out of the
> situation - call nouveau_subdev_fini()? How about cards that may not
> have on
> die sensor but have one via i2c ?
My "vision" for this, not being overly experienced with the whole subsystem,
is that nouveau_thermal_create() will detect what sensors are needed,
instantiate the modules to control them and hook them up with the relevant
cooling devices etc.

If this isn't necessary for a given board, nouveau_subdev_create() should
never be called (or at least, destroyed again before returing from
nouveau_therm_create()), and return 0 (so init doesn't completely fail).

Ben.

> 
> Regards
> Emil Velikov
