From: Lyude Paul <lyude@redhat.com>
Subject: Re: [PATCH 0/5] Fix deadlock on runtime suspend in DRM drivers
Date: Mon, 12 Feb 2018 12:43:20 -0500
Message-ID: <1518457400.5319.5.camel@redhat.com>
References: <cover.1518338788.git.lukas@wunner.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1518338788.git.lukas@wunner.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Lukas Wunner <lukas@wunner.de>, Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Cc: dri-devel@lists.freedesktop.org, Peter Wu <peter@lekensteyn.nl>, nouveau@lists.freedesktop.org, Hans de Goede <hdegoede@redhat.com>, Pierre Moreau <pierre.morrow@free.fr>, linux-kernel@vger.kernel.org, Ismo Toijala <ismo.toijala@gmail.com>, intel-gfx@lists.freedesktop.org, Liviu Dudau <Liviu.Dudau@arm.com>, Archit Taneja <architt@codeaurora.org>
List-Id: nouveau.vger.kernel.org

This patchset is a no-brainer for me. I'm ashamed to say I think I might have
seen this issue before, but polling gets used so rarely nowadays it slipped
under the rug by accident.

Anyway, for the whole series  (except patch #2, which I will respond to with a
short comment in just a moment):

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2018-02-11 at 10:38 +0100, Lukas Wunner wrote:
> Fix a deadlock on hybrid graphics laptops that's been present since 2013:
> 
> DRM drivers poll connectors in 10 sec intervals.  The poll worker is
> stopped on ->runtime_suspend with cancel_delayed_work_sync().  However
> the poll worker invokes the DRM drivers' ->detect callbacks, which call
> pm_runtime_get_sync().  If the poll worker starts after runtime suspend
> has begun, pm_runtime_get_sync() will wait for runtime suspend to finish
> with the intention of runtime resuming the device afterwards.  The result
> is a circular wait between poll worker and autosuspend worker.
> 
> I'm seeing this deadlock so often it's not funny anymore. I've also found
> 3 nouveau bugzillas about it and 1 radeon bugzilla. (See patch [3/5] and
> [4/5].)
> 
> One theoretical solution would be to add a flag to the ->detect callback
> to tell it that it's running in the poll worker's context.  In that case
> it doesn't need to call pm_runtime_get_sync() because the poll worker is
> only enabled while runtime active and we know that ->runtime_suspend
> waits for it to finish.  But this approach would require touching every
> single DRM driver's ->detect hook.  Moreover the ->detect hook is called
> from numerous other places, both in the DRM library as well as in each
> driver, making it necessary to trace every possible call chain and check
> if it's coming from the poll worker or not.  I've tried to do that for
> nouveau (see the call sites listed in the commit message of patch [3/5])
> and concluded that this approach is a nightmare to implement.
> 
> Another reason for the infeasibility of this approach is that ->detect
> is called from within the DRM library without driver involvement, e.g.
> via DRM's sysfs interface.  In those cases, pm_runtime_get_sync() would
> have to be called by the DRM library, but the DRM library is supposed to
> stay generic, wheras runtime PM is driver-specific.
> 
> So instead, I've come up with this much simpler solution which gleans
> from the current task's flags if it's a workqueue worker, retrieves the
> work_struct and checks if it's the poll worker.  All that's needed is
> one small helper in the workqueue code and another small helper in the
> DRM library.  This solution lends itself nicely to stable-backporting.
> 
> The patches for radeon and amdgpu are compile-tested only, I only have a
> MacBook Pro with an Nvidia GK107 to test.  To test the patches, add an
> "msleep(12*1000);" at the top of the driver's ->runtime_suspend hook.
> This ensures that the poll worker runs after ->runtime_suspend has begun.
> Wait 12 sec after the GPU has begun runtime suspend, then check
> /sys/bus/pci/devices/0000:01:00.0/power/runtime_status.  Without this
> series, the status will be stuck at "suspending" and you'll get hung task
> errors in dmesg after a few minutes.
> 
> i915, malidp and msm "solved" this issue by not stopping the poll worker
> on runtime suspend.  But this results in the GPU bouncing back and forth
> between D0 and D3 continuously.  That's a total no-go for GPUs which
> runtime suspend to D3cold since every suspend/resume cycle costs a
> significant amount of time and energy.  (i915 and malidp do not seem
> to acquire a runtime PM ref in the ->detect callbacks, which seems
> questionable.  msm however does and would also deadlock if it disabled
> the poll worker on runtime suspend.  cc += Archit, Liviu, intel-gfx)
> 
> Please review.  Thanks,
> 
> Lukas
> 
> Lukas Wunner (5):
>   workqueue: Allow retrieval of current task's work struct
>   drm: Allow determining if current task is output poll worker
>   drm/nouveau: Fix deadlock on runtime suspend
>   drm/radeon: Fix deadlock on runtime suspend
>   drm/amdgpu: Fix deadlock on runtime suspend
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_connectors.c | 58 +++++++++++++-------
>  drivers/gpu/drm/drm_probe_helper.c             | 14 +++++
>  drivers/gpu/drm/nouveau/nouveau_connector.c    | 18 +++++--
>  drivers/gpu/drm/radeon/radeon_connectors.c     | 74 +++++++++++++++++----
> -----
>  include/drm/drm_crtc_helper.h                  |  1 +
>  include/linux/workqueue.h                      |  1 +
>  kernel/workqueue.c                             | 16 ++++++
>  7 files changed, 132 insertions(+), 50 deletions(-)
> 
-- 
Cheers,
	Lyude Paul
