From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: Handle fbcon suspend/resume in seperate
 worker
Date: Thu, 12 Jan 2017 09:27:33 +0100
Message-ID: <bb0baa66-8223-3356-b5ae-20b2b8c4d6e7@redhat.com>
References: <20170112022525.29217-1-lyude@redhat.com>
 <20170112022525.29217-2-lyude@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170112022525.29217-2-lyude@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude <lyude@redhat.com>, nouveau@lists.freedesktop.org
Cc: Kilian Singer <kilian.singer@quantumtechnology.info>, Lukas Wunner <lukas@wunner.de>, David Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
List-Id: nouveau.vger.kernel.org

Hi,

Good catch (both the previous patch as well as this one).
I've one small comment inline:

On 12-01-17 03:25, Lyude wrote:
> Resuming from RPM can happen while already holding
> dev->mode_config.mutex. This means we can't actually handle fbcon in
> any RPM resume workers, since restoring fbcon requires grabbing
> dev->mode_config.mutex again. So move the fbcon suspend/resume code into
> it's own worker, and rely on that instead to avoid deadlocking.
>
> This fixes more deadlocks for runtime suspending the GPU on the ThinkPad
> W541. Reproduction recipe:
>
>  - Get a machine with both optimus and a nvidia card with connectors
>    attached to it
>  - Wait for the nvidia GPU to suspend
>  - Attempt to manually reprobe any of the connectors on the nvidia GPU
>    using sysfs
>  - *deadlock*
>
> Signed-off-by: Lyude <lyude@redhat.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Kilian Singer <kilian.singer@quantumtechnology.info>
> Cc: Lukas Wunner <lukas@wunner.de>
> Cc: David Airlie <airlied@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_drv.h   |  2 ++
>  drivers/gpu/drm/nouveau/nouveau_fbcon.c | 43 ++++++++++++++++++++++++++-------
>  2 files changed, 36 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 8d5ed5b..42c1fa5 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -165,6 +165,8 @@ struct nouveau_drm {
>  	struct backlight_device *backlight;
>  	struct list_head bl_connectors;
>  	struct work_struct hpd_work;
> +	struct work_struct fbcon_work;
> +	int fbcon_new_state;
>  #ifdef CONFIG_ACPI
>  	struct notifier_block acpi_nb;
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> index 2f2a3dc..87cd30b 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
> @@ -470,19 +470,43 @@ static const struct drm_fb_helper_funcs nouveau_fbcon_helper_funcs = {
>  	.fb_probe = nouveau_fbcon_create,
>  };
>
> +static void
> +nouveau_fbcon_set_suspend_work(struct work_struct *work)
> +{
> +	struct nouveau_drm *drm = container_of(work, typeof(*drm), fbcon_work);
> +	int state = drm->fbcon_new_state;

The compiler may decide to optimize away this variable
and simply use drm->fbcon_new_state in the if-s below,
which is racy. I would fix this by making
drm->fbcon_new_state an atomic_t and using

atomic_read(&drm->fbcon_new_state) here.
(and atomic_set below).

Regards,

Hans



> +
> +	if (state == FBINFO_STATE_RUNNING)
> +		pm_runtime_get_sync(drm->dev->dev);
> +
> +	console_lock();
> +	if (state == FBINFO_STATE_RUNNING)
> +		nouveau_fbcon_accel_restore(drm->dev);
> +	drm_fb_helper_set_suspend(&drm->fbcon->helper, state);
> +	if (state != FBINFO_STATE_RUNNING)
> +		nouveau_fbcon_accel_save_disable(drm->dev);
> +	console_unlock();
> +
> +	if (state == FBINFO_STATE_RUNNING) {
> +		pm_runtime_mark_last_busy(drm->dev->dev);
> +		pm_runtime_put_sync(drm->dev->dev);
> +	}
> +}
> +
>  void
>  nouveau_fbcon_set_suspend(struct drm_device *dev, int state)
>  {
>  	struct nouveau_drm *drm = nouveau_drm(dev);
> -	if (drm->fbcon) {
> -		console_lock();
> -		if (state == FBINFO_STATE_RUNNING)
> -			nouveau_fbcon_accel_restore(dev);
> -		drm_fb_helper_set_suspend(&drm->fbcon->helper, state);
> -		if (state != FBINFO_STATE_RUNNING)
> -			nouveau_fbcon_accel_save_disable(dev);
> -		console_unlock();
> -	}
> +
> +	if (!drm->fbcon)
> +		return;
> +
> +	drm->fbcon_new_state = state;
> +	/* Since runtime resume can happen as a result of a sysfs operation,
> +	 * it's possible we already have the console locked. So handle fbcon
> +	 * init/deinit from a seperate work thread
> +	 */
> +	schedule_work(&drm->fbcon_work);
>  }
>
>  int
> @@ -502,6 +526,7 @@ nouveau_fbcon_init(struct drm_device *dev)
>  		return -ENOMEM;
>
>  	drm->fbcon = fbcon;
> +	INIT_WORK(&drm->fbcon_work, nouveau_fbcon_set_suspend_work);
>
>  	drm_fb_helper_prepare(dev, &fbcon->helper, &nouveau_fbcon_helper_funcs);
>
>
