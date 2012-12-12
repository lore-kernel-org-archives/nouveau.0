From: Jesse Barnes <jbarnes@virtuousgeek.org>
Subject: Re: [Intel-gfx] [PATCH 04/37] drm/i915: rework locking for
	intel_dpio|sbi_read|write
Date: Wed, 12 Dec 2012 12:54:47 -0800
Message-ID: <20121212125447.728e791a@jbarnes-desktop>
References: <1355317637-16742-1-git-send-email-daniel.vetter@ffwll.ch>
	<1355317637-16742-5-git-send-email-daniel.vetter@ffwll.ch>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
In-Reply-To: <1355317637-16742-5-git-send-email-daniel.vetter@ffwll.ch>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Nouveau Dev <nouveau@lists.freedesktop.org>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Radeon Dev <xorg-driver-ati@lists.x.org>, DRI Development <dri-devel@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Wed, 12 Dec 2012 14:06:44 +0100
Daniel Vetter <daniel.vetter@ffwll.ch> wrote:

> Spinning for up to 200 us with interrupts locked out is not good. So
> let's just spin (and even that seems to be excessive).
> 
> And we don't call these functions from interrupt context, so this is
> not required. Besides that doing anything in interrupt contexts which
> might take a few hundred us is a no-go. So just convert the entire
> thing to a mutex. Also move the mutex-grabbing out of the read/write
> functions (add a WARN_ON(!is_locked)) instead) since all callers are
> nicely grouped together.
> 
> Finally the real motivation for this change: Dont grab the modeset
> mutex in the dpio debugfs file, we don't need that consistency. And
> correctness of the dpio interface is ensured with the dpio_lock.
> 
> Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  drivers/gpu/drm/i915/i915_debugfs.c  |    4 +--
>  drivers/gpu/drm/i915/i915_dma.c      |    2 +-
>  drivers/gpu/drm/i915/i915_drv.h      |    2 +-
>  drivers/gpu/drm/i915/intel_display.c |   53 ++++++++++++++--------------------
>  4 files changed, 25 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_debugfs.c b/drivers/gpu/drm/i915/i915_debugfs.c
> index 58e6676..35d2ace 100644
> --- a/drivers/gpu/drm/i915/i915_debugfs.c
> +++ b/drivers/gpu/drm/i915/i915_debugfs.c
> @@ -1553,7 +1553,7 @@ static int i915_dpio_info(struct seq_file *m, void *data)
>  		return 0;
>  	}
>  
> -	ret = mutex_lock_interruptible(&dev->mode_config.mutex);
> +	ret = mutex_lock_interruptible(&dev_priv->dpio_lock);
>  	if (ret)
>  		return ret;
>  
> @@ -1582,7 +1582,7 @@ static int i915_dpio_info(struct seq_file *m, void *data)
>  	seq_printf(m, "DPIO_FASTCLK_DISABLE: 0x%08x\n",
>  		   intel_dpio_read(dev_priv, DPIO_FASTCLK_DISABLE));
>  
> -	mutex_unlock(&dev->mode_config.mutex);
> +	mutex_unlock(&dev_priv->dpio_lock);
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/i915/i915_dma.c b/drivers/gpu/drm/i915/i915_dma.c
> index 2635ee6..ad488f6 100644
> --- a/drivers/gpu/drm/i915/i915_dma.c
> +++ b/drivers/gpu/drm/i915/i915_dma.c
> @@ -1579,7 +1579,7 @@ int i915_driver_load(struct drm_device *dev, unsigned long flags)
>  	spin_lock_init(&dev_priv->irq_lock);
>  	spin_lock_init(&dev_priv->error_lock);
>  	spin_lock_init(&dev_priv->rps.lock);
> -	spin_lock_init(&dev_priv->dpio_lock);
> +	mutex_init(&dev_priv->dpio_lock);
>  
>  	mutex_init(&dev_priv->rps.hw_lock);
>  
> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
> index e2944e9..6fa0c00 100644
> --- a/drivers/gpu/drm/i915/i915_drv.h
> +++ b/drivers/gpu/drm/i915/i915_drv.h
> @@ -655,7 +655,7 @@ typedef struct drm_i915_private {
>  	spinlock_t irq_lock;
>  
>  	/* DPIO indirect register protection */
> -	spinlock_t dpio_lock;
> +	struct mutex dpio_lock;
>  
>  	/** Cached value of IMR to avoid reads in updating the bitfield */
>  	u32 pipestat[2];
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index d303f2a..a0d8869 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -416,13 +416,11 @@ static const intel_limit_t intel_limits_vlv_dp = {
>  
>  u32 intel_dpio_read(struct drm_i915_private *dev_priv, int reg)
>  {
> -	unsigned long flags;
> -	u32 val = 0;
> +	WARN_ON(!mutex_is_locked(&dev_priv->dpio_lock));
>  
> -	spin_lock_irqsave(&dev_priv->dpio_lock, flags);
>  	if (wait_for_atomic_us((I915_READ(DPIO_PKT) & DPIO_BUSY) == 0, 100)) {
>  		DRM_ERROR("DPIO idle wait timed out\n");
> -		goto out_unlock;
> +		return 0;
>  	}
>  
>  	I915_WRITE(DPIO_REG, reg);
> @@ -430,24 +428,20 @@ u32 intel_dpio_read(struct drm_i915_private *dev_priv, int reg)
>  		   DPIO_BYTE);
>  	if (wait_for_atomic_us((I915_READ(DPIO_PKT) & DPIO_BUSY) == 0, 100)) {
>  		DRM_ERROR("DPIO read wait timed out\n");
> -		goto out_unlock;
> +		return 0;
>  	}
> -	val = I915_READ(DPIO_DATA);
>  
> -out_unlock:
> -	spin_unlock_irqrestore(&dev_priv->dpio_lock, flags);
> -	return val;
> +	return I915_READ(DPIO_DATA);
>  }
>  
>  static void intel_dpio_write(struct drm_i915_private *dev_priv, int reg,
>  			     u32 val)
>  {
> -	unsigned long flags;
> +	WARN_ON(!mutex_is_locked(&dev_priv->dpio_lock));
>  
> -	spin_lock_irqsave(&dev_priv->dpio_lock, flags);
>  	if (wait_for_atomic_us((I915_READ(DPIO_PKT) & DPIO_BUSY) == 0, 100)) {
>  		DRM_ERROR("DPIO idle wait timed out\n");
> -		goto out_unlock;
> +		return;
>  	}
>  
>  	I915_WRITE(DPIO_DATA, val);
> @@ -456,9 +450,6 @@ static void intel_dpio_write(struct drm_i915_private *dev_priv, int reg,
>  		   DPIO_BYTE);
>  	if (wait_for_atomic_us((I915_READ(DPIO_PKT) & DPIO_BUSY) == 0, 100))
>  		DRM_ERROR("DPIO write wait timed out\n");
> -
> -out_unlock:
> -       spin_unlock_irqrestore(&dev_priv->dpio_lock, flags);
>  }
>  
>  static void vlv_init_dpio(struct drm_device *dev)
> @@ -1455,13 +1446,12 @@ static void intel_disable_pll(struct drm_i915_private *dev_priv, enum pipe pipe)
>  static void
>  intel_sbi_write(struct drm_i915_private *dev_priv, u16 reg, u32 value)
>  {
> -	unsigned long flags;
> +	WARN_ON(!mutex_is_locked(&dev_priv->dpio_lock));
>  
> -	spin_lock_irqsave(&dev_priv->dpio_lock, flags);
>  	if (wait_for((I915_READ(SBI_CTL_STAT) & SBI_BUSY) == 0,
>  				100)) {
>  		DRM_ERROR("timeout waiting for SBI to become ready\n");
> -		goto out_unlock;
> +		return;
>  	}
>  
>  	I915_WRITE(SBI_ADDR,
> @@ -1475,24 +1465,19 @@ intel_sbi_write(struct drm_i915_private *dev_priv, u16 reg, u32 value)
>  	if (wait_for((I915_READ(SBI_CTL_STAT) & (SBI_BUSY | SBI_RESPONSE_FAIL)) == 0,
>  				100)) {
>  		DRM_ERROR("timeout waiting for SBI to complete write transaction\n");
> -		goto out_unlock;
> +		return;
>  	}
> -
> -out_unlock:
> -	spin_unlock_irqrestore(&dev_priv->dpio_lock, flags);
>  }
>  
>  static u32
>  intel_sbi_read(struct drm_i915_private *dev_priv, u16 reg)
>  {
> -	unsigned long flags;
> -	u32 value = 0;
> +	WARN_ON(!mutex_is_locked(&dev_priv->dpio_lock));
>  
> -	spin_lock_irqsave(&dev_priv->dpio_lock, flags);
>  	if (wait_for((I915_READ(SBI_CTL_STAT) & SBI_BUSY) == 0,
>  				100)) {
>  		DRM_ERROR("timeout waiting for SBI to become ready\n");
> -		goto out_unlock;
> +		return 0;
>  	}
>  
>  	I915_WRITE(SBI_ADDR,
> @@ -1504,14 +1489,10 @@ intel_sbi_read(struct drm_i915_private *dev_priv, u16 reg)
>  	if (wait_for((I915_READ(SBI_CTL_STAT) & (SBI_BUSY | SBI_RESPONSE_FAIL)) == 0,
>  				100)) {
>  		DRM_ERROR("timeout waiting for SBI to complete read transaction\n");
> -		goto out_unlock;
> +		return 0;
>  	}
>  
> -	value = I915_READ(SBI_DATA);
> -
> -out_unlock:
> -	spin_unlock_irqrestore(&dev_priv->dpio_lock, flags);
> -	return value;
> +	return I915_READ(SBI_DATA);
>  }
>  
>  /**
> @@ -2960,6 +2941,8 @@ static void lpt_program_iclkip(struct drm_crtc *crtc)
>  	u32 divsel, phaseinc, auxdiv, phasedir = 0;
>  	u32 temp;
>  
> +	mutex_lock(&dev_priv->dpio_lock);
> +
>  	/* It is necessary to ungate the pixclk gate prior to programming
>  	 * the divisors, and gate it back when it is done.
>  	 */
> @@ -3041,6 +3024,8 @@ static void lpt_program_iclkip(struct drm_crtc *crtc)
>  	udelay(24);
>  
>  	I915_WRITE(PIXCLK_GATE, PIXCLK_GATE_UNGATE);
> +
> +	mutex_unlock(&dev_priv->dpio_lock);
>  }
>  
>  /*
> @@ -4268,6 +4253,8 @@ static void vlv_update_pll(struct drm_crtc *crtc,
>  	bool is_sdvo;
>  	u32 temp;
>  
> +	mutex_lock(&dev_priv->dpio_lock);
> +
>  	is_sdvo = intel_pipe_has_type(crtc, INTEL_OUTPUT_SDVO) ||
>  		intel_pipe_has_type(crtc, INTEL_OUTPUT_HDMI);
>  
> @@ -4351,6 +4338,8 @@ static void vlv_update_pll(struct drm_crtc *crtc,
>  			temp |= (1 << 21);
>  		intel_dpio_write(dev_priv, DPIO_DATA_CHANNEL2, temp);
>  	}
> +
> +	mutex_unlock(&dev_priv->dpio_lock);
>  }
>  
>  static void i9xx_update_pll(struct drm_crtc *crtc,

Looks fine, I guess you could convert the wait_for_atomic_us to the
non-atomic variant now that you have a mutex.  Either way:

Reviewed-by: Jesse Barnes <jbarnes@virtuousgeek.org>

-- 
Jesse Barnes, Intel Open Source Technology Center
