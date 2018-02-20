From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Replace the iturbt_709 prop with
 the standarad COLOR_ENCODNIG prop
Date: Wed, 21 Feb 2018 00:17:38 +0800
Message-ID: <201802210012.vXSf0F7k%fengguang.wu@intel.com>
References: <20180220134816.15229-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="r5Pyd7+fXNt84Ff3"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20180220134816.15229-1-ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ville Syrjala <ville.syrjala-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, kbuild-all-JC7UmRfGjtg@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.16-rc2 next-20180220]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Ville-Syrjala/drm-nouveau-Replace-the-iturbt_709-prop-with-the-standarad-COLOR_ENCODNIG-prop/20180220-230332
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: x86_64-allyesdebian (attached as .config)
compiler: gcc-7 (Debian 7.3.0-1) 7.3.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=x86_64 

All errors (new ones prefixed by >>):

>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:56:26: error: field 'color_encoding' has incomplete type
     enum drm_color_encoding color_encoding;
                             ^~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv10_update_plane':
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:168:34: error: 'DRM_COLOR_YCBCR_BT709' undeclared (first use in this function)
     if (nv_plane->color_encoding == DRM_COLOR_YCBCR_BT709)
                                     ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:168:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv10_set_params':
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:231:32: error: 'DRM_COLOR_YCBCR_BT709' undeclared (first use in this function)
      if (plane->color_encoding == DRM_COLOR_YCBCR_BT709)
                                   ^~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv_set_property':
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:260:38: error: 'struct drm_plane' has no member named 'color_encoding_property'; did you mean 'rotation_property'?
     else if (property == nv_plane->base.color_encoding_property)
                                         ^~~~~~~~~~~~~~~~~~~~~~~
                                         rotation_property
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv10_overlay_init':
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:342:26: error: 'DRM_COLOR_YCBCR_BT601' undeclared (first use in this function)
     plane->color_encoding = DRM_COLOR_YCBCR_BT601;
                             ^~~~~~~~~~~~~~~~~~~~~
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:343:2: error: implicit declaration of function 'drm_plane_create_color_properties'; did you mean 'drm_plane_create_zpos_property'? [-Werror=implicit-function-declaration]
     drm_plane_create_color_properties(&plane->base,
     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     drm_plane_create_zpos_property
   In file included from include/linux/kernel.h:11:0,
                    from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/nouveau/dispnv04/overlay.c:26:
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:345:12: error: 'DRM_COLOR_YCBCR_BT709' undeclared (first use in this function); did you mean 'DRM_COLOR_YCBCR_BT601'?
           BIT(DRM_COLOR_YCBCR_BT709),
               ^
   include/linux/bitops.h:7:28: note: in definition of macro 'BIT'
    #define BIT(nr)   (1UL << (nr))
                               ^~
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:346:12: error: 'DRM_COLOR_YCBCR_LIMITED_RANGE' undeclared (first use in this function); did you mean 'DRM_COLOR_YCBCR_BT709'?
           BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
               ^
   include/linux/bitops.h:7:28: note: in definition of macro 'BIT'
    #define BIT(nr)   (1UL << (nr))
                               ^~
   cc1: some warnings being treated as errors

vim +/color_encoding +56 drivers/gpu/drm/nouveau/dispnv04/overlay.c

  > 26	#include <drm/drmP.h>
    27	#include <drm/drm_crtc.h>
    28	#include <drm/drm_fourcc.h>
    29	
    30	#include "nouveau_drv.h"
    31	
    32	#include "nouveau_bo.h"
    33	#include "nouveau_connector.h"
    34	#include "nouveau_display.h"
    35	#include "nvreg.h"
    36	#include "disp.h"
    37	
    38	struct nouveau_plane {
    39		struct drm_plane base;
    40		bool flip;
    41		struct nouveau_bo *cur;
    42	
    43		struct {
    44			struct drm_property *colorkey;
    45			struct drm_property *contrast;
    46			struct drm_property *brightness;
    47			struct drm_property *hue;
    48			struct drm_property *saturation;
    49		} props;
    50	
    51		int colorkey;
    52		int contrast;
    53		int brightness;
    54		int hue;
    55		int saturation;
  > 56		enum drm_color_encoding color_encoding;
    57	
    58		void (*set_params)(struct nouveau_plane *);
    59	};
    60	
    61	static uint32_t formats[] = {
    62		DRM_FORMAT_YUYV,
    63		DRM_FORMAT_UYVY,
    64		DRM_FORMAT_NV12,
    65		DRM_FORMAT_NV21,
    66	};
    67	
    68	/* Sine can be approximated with
    69	 * http://en.wikipedia.org/wiki/Bhaskara_I's_sine_approximation_formula
    70	 * sin(x degrees) ~= 4 x (180 - x) / (40500 - x (180 - x) )
    71	 * Note that this only works for the range [0, 180].
    72	 * Also note that sin(x) == -sin(x - 180)
    73	 */
    74	static inline int
    75	sin_mul(int degrees, int factor)
    76	{
    77		if (degrees > 180) {
    78			degrees -= 180;
    79			factor *= -1;
    80		}
    81		return factor * 4 * degrees * (180 - degrees) /
    82			(40500 - degrees * (180 - degrees));
    83	}
    84	
    85	/* cos(x) = sin(x + 90) */
    86	static inline int
    87	cos_mul(int degrees, int factor)
    88	{
    89		return sin_mul((degrees + 90) % 360, factor);
    90	}
    91	
    92	static int
    93	verify_scaling(const struct drm_framebuffer *fb, uint8_t shift,
    94	               uint32_t src_x, uint32_t src_y, uint32_t src_w, uint32_t src_h,
    95	               uint32_t crtc_w, uint32_t crtc_h)
    96	{
    97		if (crtc_w < (src_w >> shift) || crtc_h < (src_h >> shift)) {
    98			DRM_DEBUG_KMS("Unsuitable framebuffer scaling: %dx%d -> %dx%d\n",
    99				      src_w, src_h, crtc_w, crtc_h);
   100			return -ERANGE;
   101		}
   102	
   103		if (src_x != 0 || src_y != 0) {
   104			DRM_DEBUG_KMS("Unsuitable framebuffer offset: %d,%d\n",
   105	                              src_x, src_y);
   106			return -ERANGE;
   107		}
   108	
   109		return 0;
   110	}
   111	
   112	static int
   113	nv10_update_plane(struct drm_plane *plane, struct drm_crtc *crtc,
   114			  struct drm_framebuffer *fb, int crtc_x, int crtc_y,
   115			  unsigned int crtc_w, unsigned int crtc_h,
   116			  uint32_t src_x, uint32_t src_y,
   117			  uint32_t src_w, uint32_t src_h,
   118			  struct drm_modeset_acquire_ctx *ctx)
   119	{
   120		struct nouveau_drm *drm = nouveau_drm(plane->dev);
   121		struct nvif_object *dev = &drm->client.device.object;
   122		struct nouveau_plane *nv_plane =
   123			container_of(plane, struct nouveau_plane, base);
   124		struct nouveau_framebuffer *nv_fb = nouveau_framebuffer(fb);
   125		struct nouveau_crtc *nv_crtc = nouveau_crtc(crtc);
   126		struct nouveau_bo *cur = nv_plane->cur;
   127		bool flip = nv_plane->flip;
   128		int soff = NV_PCRTC0_SIZE * nv_crtc->index;
   129		int soff2 = NV_PCRTC0_SIZE * !nv_crtc->index;
   130		unsigned shift = drm->client.device.info.chipset >= 0x30 ? 1 : 3;
   131		unsigned format = 0;
   132		int ret;
   133	
   134		/* Source parameters given in 16.16 fixed point, ignore fractional. */
   135		src_x >>= 16;
   136		src_y >>= 16;
   137		src_w >>= 16;
   138		src_h >>= 16;
   139	
   140		ret = verify_scaling(fb, shift, 0, 0, src_w, src_h, crtc_w, crtc_h);
   141		if (ret)
   142			return ret;
   143	
   144		ret = nouveau_bo_pin(nv_fb->nvbo, TTM_PL_FLAG_VRAM, false);
   145		if (ret)
   146			return ret;
   147	
   148		nv_plane->cur = nv_fb->nvbo;
   149	
   150		nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff, NV_CRTC_FSEL_OVERLAY, NV_CRTC_FSEL_OVERLAY);
   151		nvif_mask(dev, NV_PCRTC_ENGINE_CTRL + soff2, NV_CRTC_FSEL_OVERLAY, 0);
   152	
   153		nvif_wr32(dev, NV_PVIDEO_BASE(flip), 0);
   154		nvif_wr32(dev, NV_PVIDEO_OFFSET_BUFF(flip), nv_fb->nvbo->bo.offset);
   155		nvif_wr32(dev, NV_PVIDEO_SIZE_IN(flip), src_h << 16 | src_w);
   156		nvif_wr32(dev, NV_PVIDEO_POINT_IN(flip), src_y << 16 | src_x);
   157		nvif_wr32(dev, NV_PVIDEO_DS_DX(flip), (src_w << 20) / crtc_w);
   158		nvif_wr32(dev, NV_PVIDEO_DT_DY(flip), (src_h << 20) / crtc_h);
   159		nvif_wr32(dev, NV_PVIDEO_POINT_OUT(flip), crtc_y << 16 | crtc_x);
   160		nvif_wr32(dev, NV_PVIDEO_SIZE_OUT(flip), crtc_h << 16 | crtc_w);
   161	
   162		if (fb->format->format == DRM_FORMAT_YUYV ||
   163		    fb->format->format == DRM_FORMAT_NV12)
   164			format |= NV_PVIDEO_FORMAT_COLOR_LE_CR8YB8CB8YA8;
   165		if (fb->format->format == DRM_FORMAT_NV12 ||
   166		    fb->format->format == DRM_FORMAT_NV21)
   167			format |= NV_PVIDEO_FORMAT_PLANAR;
 > 168		if (nv_plane->color_encoding == DRM_COLOR_YCBCR_BT709)
   169			format |= NV_PVIDEO_FORMAT_MATRIX_ITURBT709;
   170		if (nv_plane->colorkey & (1 << 24))
   171			format |= NV_PVIDEO_FORMAT_DISPLAY_COLOR_KEY;
   172	
   173		if (format & NV_PVIDEO_FORMAT_PLANAR) {
   174			nvif_wr32(dev, NV_PVIDEO_UVPLANE_BASE(flip), 0);
   175			nvif_wr32(dev, NV_PVIDEO_UVPLANE_OFFSET_BUFF(flip),
   176				nv_fb->nvbo->bo.offset + fb->offsets[1]);
   177		}
   178		nvif_wr32(dev, NV_PVIDEO_FORMAT(flip), format | fb->pitches[0]);
   179		nvif_wr32(dev, NV_PVIDEO_STOP, 0);
   180		/* TODO: wait for vblank? */
   181		nvif_wr32(dev, NV_PVIDEO_BUFFER, flip ? 0x10 : 0x1);
   182		nv_plane->flip = !flip;
   183	
   184		if (cur)
   185			nouveau_bo_unpin(cur);
   186	
   187		return 0;
   188	}
   189	
   190	static int
   191	nv10_disable_plane(struct drm_plane *plane,
   192			   struct drm_modeset_acquire_ctx *ctx)
   193	{
   194		struct nvif_object *dev = &nouveau_drm(plane->dev)->client.device.object;
   195		struct nouveau_plane *nv_plane =
   196			container_of(plane, struct nouveau_plane, base);
   197	
   198		nvif_wr32(dev, NV_PVIDEO_STOP, 1);
   199		if (nv_plane->cur) {
   200			nouveau_bo_unpin(nv_plane->cur);
   201			nv_plane->cur = NULL;
   202		}
   203	
   204		return 0;
   205	}
   206	
   207	static void
   208	nv_destroy_plane(struct drm_plane *plane)
   209	{
   210		drm_plane_force_disable(plane);
   211		drm_plane_cleanup(plane);
   212		kfree(plane);
   213	}
   214	
   215	static void
   216	nv10_set_params(struct nouveau_plane *plane)
   217	{
   218		struct nvif_object *dev = &nouveau_drm(plane->base.dev)->client.device.object;
   219		u32 luma = (plane->brightness - 512) << 16 | plane->contrast;
   220		u32 chroma = ((sin_mul(plane->hue, plane->saturation) & 0xffff) << 16) |
   221			(cos_mul(plane->hue, plane->saturation) & 0xffff);
   222		u32 format = 0;
   223	
   224		nvif_wr32(dev, NV_PVIDEO_LUMINANCE(0), luma);
   225		nvif_wr32(dev, NV_PVIDEO_LUMINANCE(1), luma);
   226		nvif_wr32(dev, NV_PVIDEO_CHROMINANCE(0), chroma);
   227		nvif_wr32(dev, NV_PVIDEO_CHROMINANCE(1), chroma);
   228		nvif_wr32(dev, NV_PVIDEO_COLOR_KEY, plane->colorkey & 0xffffff);
   229	
   230		if (plane->cur) {
 > 231			if (plane->color_encoding == DRM_COLOR_YCBCR_BT709)
   232				format |= NV_PVIDEO_FORMAT_MATRIX_ITURBT709;
   233			if (plane->colorkey & (1 << 24))
   234				format |= NV_PVIDEO_FORMAT_DISPLAY_COLOR_KEY;
   235			nvif_mask(dev, NV_PVIDEO_FORMAT(plane->flip),
   236				NV_PVIDEO_FORMAT_MATRIX_ITURBT709 |
   237				NV_PVIDEO_FORMAT_DISPLAY_COLOR_KEY,
   238				format);
   239		}
   240	}
   241	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--r5Pyd7+fXNt84Ff3
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
DfGAggIA

--r5Pyd7+fXNt84Ff3
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--r5Pyd7+fXNt84Ff3--
