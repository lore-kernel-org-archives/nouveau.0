From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH] drm/nouveau: use NULL for pointer assignment.
Date: Wed, 1 Jan 2020 19:51:47 +0100
Message-ID: <20200101185147.GB3856@dvetter-linux.ger.corp.intel.com>
References: <20191231205734.1452-1-wambui.karugax@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20191231205734.1452-1-wambui.karugax@gmail.com>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
To: Wambui Karuga <wambui.karugax@gmail.com>
Cc: airlied@linux.ie, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, bskeggs@redhat.com
List-Id: nouveau.vger.kernel.org

On Tue, Dec 31, 2019 at 11:57:34PM +0300, Wambui Karuga wrote:
> Replace the use of 0 in the pointer assignment with NULL to address the
> following sparse warning:
> drivers/gpu/drm/nouveau/nouveau_hwmon.c:744:29: warning: Using plain integer as NULL pointer
> 
> Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

I'll check with Ben next week or so whether he wants to pick these up or
whether I should stuff them into drm-misc-next.
-Daniel

> ---
>  drivers/gpu/drm/nouveau/nouveau_hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> index d445c6f3fece..1c3104d20571 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
> @@ -741,7 +741,7 @@ nouveau_hwmon_init(struct drm_device *dev)
>  			special_groups[i++] = &pwm_fan_sensor_group;
>  	}
>  
> -	special_groups[i] = 0;
> +	special_groups[i] = NULL;
>  	hwmon_dev = hwmon_device_register_with_info(dev->dev, "nouveau", dev,
>  							&nouveau_chip_info,
>  							special_groups);
> -- 
> 2.17.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
