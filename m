From: Gerd Hoffmann <kraxel-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 1/2] drm: allow limiting the scatter list
 size.
Date: Mon, 7 Sep 2020 08:39:01 +0200
Message-ID: <20200907063901.atwjdxz7iqyra22h__17338.9181889192$1599494233$gmane$org@sirius.home.kraxel.org>
References: <20200818092017.26290-1-kraxel@redhat.com>
 <20200818092017.26290-2-kraxel@redhat.com>
 <20200901074043.GT2352366@phenom.ffwll.local>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200901074043.GT2352366-dv86pmgwkMBes7Z6vYuT8azUEOm+Xw19@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, christian.koenig-5C7GfCeVMHo@public.gmane.org, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Maxime Ripard <mripard-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>, Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Russell King <linux+etnaviv-I+IVW8TIWO2tmTQ+vhA3Yw@public.gmane.org>, Christian Gmeiner <christian.gmeiner-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sean Paul <sean-p7yTbzM4H96eqtR555YLDQ@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Sandy Huang <hjc-TNX95d0MmH7DzftRWevZcw@public.gmane.org>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko-4mtYJXux2i+zQB+pC5nmwQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Oleksandr Andrushchenko <oleksandr_andrushchenko-uRwfk40T5oI@public.gmane.org>, "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, moderated list:DRM DRIVERS FOR VIVANTE GP
List-Id: nouveau.vger.kernel.org

> > +	/**
> > +	 * @max_segment:
> > +	 *
> > +	 * Max size for scatter list segments.  When unset the default
> > +	 * (SCATTERLIST_MAX_SEGMENT) is used.
> > +	 */
> > +	size_t max_segment;
> 
> Is there no better place for this then "at the bottom"? drm_device is a
> huge structure, piling stuff up randomly doesn't make it better :-)

Moved next to the other gem fields for now (v3 posted).

> I think ideally we'd have a gem substruct like we have on the modeset side
> at least.

Phew, that'll be quite some churn in the tree.  And there aren't that many
gem-related fields in struct drm_device.

So you are looking for something like below (header changes only)?

take care,
  Gerd

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index c455ef404ca6..950167ede98a 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -299,22 +299,8 @@ struct drm_device {
 	/** @mode_config: Current mode config */
 	struct drm_mode_config mode_config;
 
-	/** @object_name_lock: GEM information */
-	struct mutex object_name_lock;
-
-	/** @object_name_idr: GEM information */
-	struct idr object_name_idr;
-
-	/** @vma_offset_manager: GEM information */
-	struct drm_vma_offset_manager *vma_offset_manager;
-
-	/**
-	 * @max_segment:
-	 *
-	 * Max size for scatter list segments for GEM objects.  When
-	 * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
-	 */
-	size_t max_segment;
+	/** @gem_config: Current GEM config */
+	struct drm_gem_config gem_config;
 
 	/** @vram_mm: VRAM MM memory manager */
 	struct drm_vram_mm *vram_mm;
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 337a48321705..74129fb29fb8 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -39,6 +39,25 @@
 
 #include <drm/drm_vma_manager.h>
 
+struct drm_gem_config {
+	/** @object_name_lock: GEM information */
+	struct mutex object_name_lock;
+
+	/** @object_name_idr: GEM information */
+	struct idr object_name_idr;
+
+	/** @vma_offset_manager: GEM information */
+	struct drm_vma_offset_manager *vma_offset_manager;
+
+	/**
+	 * @max_segment:
+	 *
+	 * Max size for scatter list segments for GEM objects.  When
+	 * unset the default (SCATTERLIST_MAX_SEGMENT) is used.
+	 */
+	size_t max_segment;
+};
+
 struct drm_gem_object;
 
 /**
