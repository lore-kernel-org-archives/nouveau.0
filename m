From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v3] drm: Add DRM_MODE_ROTATE_ and DRM_MODE_REFLECT_ to
 UAPI
Date: Thu, 18 May 2017 12:49:56 +0300
Message-ID: <20170518094956.GY12629@intel.com>
References: <20170518013911.29626-1-robert.foss@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170518013911.29626-1-robert.foss@collabora.com>
Sender: linux-arm-msm-owner@vger.kernel.org
To: Robert Foss <robert.foss@collabora.com>
Cc: liviu.dudau@arm.com, brian.starkey@arm.com, malidp@foss.arm.com, airlied@linux.ie, linux@armlinux.org.uk, boris.brezillon@free-electrons.com, daniel.vetter@intel.com, jani.nikula@linux.intel.com, seanpaul@chromium.org, p.zabel@pengutronix.de, robdclark@gmail.com, bskeggs@redhat.com, tomi.valkeinen@ti.com, linux-graphics-maintainer@vmware.com, syeh@vmware.com, thellstrom@vmware.com, architt@codeaurora.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Emil Velikov <emil.l.velikov@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Kristian =?iso-8859-1?Q?H=F8gsberg?= <hoegsberg@gmail.com>
List-Id: nouveau.vger.kernel.org

On Wed, May 17, 2017 at 09:39:11PM -0400, Robert Foss wrote:
> +/*
> + * DRM_MODE_REFLECT_<axis>
> + *
> + * Signals that the contents of a drm plane has been reflected in
> + * the <axis> axis.

Still vague.

Also you didn't respond to my comment about the use of past tense.

> + *
> + * This define is provided as a convenience, looking up the property id
> + * using the name->prop id lookup is the preferred method.
> + */
> +#define DRM_MODE_REFLECT_X      (1<<4)
> +#define DRM_MODE_REFLECT_Y      (1<<5)
> +
> +/*
> + * DRM_MODE_REFLECT_MASK
> + *
> + * Bitmask used to look for drm plane reflections.
> + */
> +#define DRM_MODE_REFLECT_MASK (\
> +		DRM_MODE_REFLECT_X | \
> +		DRM_MODE_REFLECT_Y)
> +
> +
>  struct drm_mode_modeinfo {
>  	__u32 clock;
>  	__u16 hdisplay;
> -- 
> 2.11.0.453.g787f75f05

-- 
Ville Syrjälä
Intel OTC
