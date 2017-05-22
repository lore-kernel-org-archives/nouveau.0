From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v4 1/2] drm/blend: Fix comment typ-o
Date: Mon, 22 May 2017 09:44:52 +0200
Message-ID: <20170522074452.tm5gg5jolrug55mp@phenom.ffwll.local>
References: <20170519205017.23307-1-robert.foss@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170519205017.23307-1-robert.foss@collabora.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Robert Foss <robert.foss@collabora.com>
Cc: liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, airlied@linux.ie, linux@armlinux.org.uk, boris.brezillon@free-electrons.com, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, p.zabel@pengutronix.de, robdclark@gmail.com, bskeggs@redhat.com, tomi.valkeinen@ti.com, linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com, architt@codeaurora.org, ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Kristian
List-Id: nouveau.vger.kernel.org

On Fri, May 19, 2017 at 04:50:16PM -0400, Robert Foss wrote:
> Fix DRM_REFELCT_Y -> DRM_REFLECT_Y.
> 
> Signed-off-by: Robert Foss <robert.foss@collabora.com>

Applied, thanks.
-Daniel

> ---
>  drivers/gpu/drm/drm_blend.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
> index a0d0d6843288..dee67ef6c670 100644
> --- a/drivers/gpu/drm/drm_blend.c
> +++ b/drivers/gpu/drm/drm_blend.c
> @@ -129,7 +129,7 @@
>   * 	"rotate-270"
>   * DRM_REFLECT_X:
>   * 	"reflect-x"
> - * DRM_REFELCT_Y:
> + * DRM_REFLECT_Y:
>   * 	"reflect-y"
>   *
>   * Rotation is the specified amount in degrees in counter clockwise direction,
> -- 
> 2.11.0.453.g787f75f05
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
