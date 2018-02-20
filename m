From: kbuild test robot <lkp-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Replace the iturbt_709 prop with
 the standarad COLOR_ENCODNIG prop
Date: Wed, 21 Feb 2018 00:13:17 +0800
Message-ID: <201802210033.ExLkYBX9%fengguang.wu@intel.com>
References: <20180220134816.15229-1-ville.syrjala@linux.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="azLHFNyN32YCQGCU"
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


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ville,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on drm/drm-next]
[also build test ERROR on v4.16-rc2 next-20180220]
[if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

url:    https://github.com/0day-ci/linux/commits/Ville-Syrjala/drm-nouveau-Replace-the-iturbt_709-prop-with-the-standarad-COLOR_ENCODNIG-prop/20180220-230332
base:   git://people.freedesktop.org/~airlied/linux.git drm-next
config: i386-randconfig-a1-201807 (attached as .config)
compiler: gcc-4.9 (Debian 4.9.4-2) 4.9.4
reproduce:
        # save the attached .config to linux build tree
        make ARCH=i386 

All errors (new ones prefixed by >>):

   drivers/gpu/drm/nouveau/dispnv04/overlay.c:56:26: error: field 'color_encoding' has incomplete type
     enum drm_color_encoding color_encoding;
                             ^
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv10_update_plane':
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:168:34: error: 'DRM_COLOR_YCBCR_BT709' undeclared (first use in this function)
     if (nv_plane->color_encoding == DRM_COLOR_YCBCR_BT709)
                                     ^
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:168:34: note: each undeclared identifier is reported only once for each function it appears in
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv10_set_params':
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:231:32: error: 'DRM_COLOR_YCBCR_BT709' undeclared (first use in this function)
      if (plane->color_encoding == DRM_COLOR_YCBCR_BT709)
                                   ^
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv_set_property':
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:260:37: error: 'struct drm_plane' has no member named 'color_encoding_property'
     else if (property == nv_plane->base.color_encoding_property)
                                        ^
   drivers/gpu/drm/nouveau/dispnv04/overlay.c: In function 'nv10_overlay_init':
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:342:26: error: 'DRM_COLOR_YCBCR_BT601' undeclared (first use in this function)
     plane->color_encoding = DRM_COLOR_YCBCR_BT601;
                             ^
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:343:2: error: implicit declaration of function 'drm_plane_create_color_properties' [-Werror=implicit-function-declaration]
     drm_plane_create_color_properties(&plane->base,
     ^
   In file included from include/linux/kernel.h:11:0,
                    from include/linux/list.h:9,
                    from include/linux/agp_backend.h:33,
                    from include/drm/drmP.h:35,
                    from drivers/gpu/drm/nouveau/dispnv04/overlay.c:26:
   drivers/gpu/drm/nouveau/dispnv04/overlay.c:345:12: error: 'DRM_COLOR_YCBCR_BT709' undeclared (first use in this function)
           BIT(DRM_COLOR_YCBCR_BT709),
               ^
   include/linux/bitops.h:7:28: note: in definition of macro 'BIT'
    #define BIT(nr)   (1UL << (nr))
                               ^
>> drivers/gpu/drm/nouveau/dispnv04/overlay.c:346:12: error: 'DRM_COLOR_YCBCR_LIMITED_RANGE' undeclared (first use in this function)
           BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
               ^
   include/linux/bitops.h:7:28: note: in definition of macro 'BIT'
    #define BIT(nr)   (1UL << (nr))
                               ^
   cc1: some warnings being treated as errors

vim +260 drivers/gpu/drm/nouveau/dispnv04/overlay.c

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
   231			if (plane->color_encoding == DRM_COLOR_YCBCR_BT709)
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
   242	static int
   243	nv_set_property(struct drm_plane *plane,
   244			struct drm_property *property,
   245			uint64_t value)
   246	{
   247		struct nouveau_plane *nv_plane =
   248			container_of(plane, struct nouveau_plane, base);
   249	
   250		if (property == nv_plane->props.colorkey)
   251			nv_plane->colorkey = value;
   252		else if (property == nv_plane->props.contrast)
   253			nv_plane->contrast = value;
   254		else if (property == nv_plane->props.brightness)
   255			nv_plane->brightness = value;
   256		else if (property == nv_plane->props.hue)
   257			nv_plane->hue = value;
   258		else if (property == nv_plane->props.saturation)
   259			nv_plane->saturation = value;
 > 260		else if (property == nv_plane->base.color_encoding_property)
   261			nv_plane->color_encoding = value;
   262		else
   263			return -EINVAL;
   264	
   265		if (nv_plane->set_params)
   266			nv_plane->set_params(nv_plane);
   267		return 0;
   268	}
   269	
   270	static const struct drm_plane_funcs nv10_plane_funcs = {
   271		.update_plane = nv10_update_plane,
   272		.disable_plane = nv10_disable_plane,
   273		.set_property = nv_set_property,
   274		.destroy = nv_destroy_plane,
   275	};
   276	
   277	static void
   278	nv10_overlay_init(struct drm_device *device)
   279	{
   280		struct nouveau_drm *drm = nouveau_drm(device);
   281		struct nouveau_plane *plane = kzalloc(sizeof(struct nouveau_plane), GFP_KERNEL);
   282		unsigned int num_formats = ARRAY_SIZE(formats);
   283		int ret;
   284	
   285		if (!plane)
   286			return;
   287	
   288		switch (drm->client.device.info.chipset) {
   289		case 0x10:
   290		case 0x11:
   291		case 0x15:
   292		case 0x1a:
   293		case 0x20:
   294			num_formats = 2;
   295			break;
   296		}
   297	
   298		ret = drm_plane_init(device, &plane->base, 3 /* both crtc's */,
   299				     &nv10_plane_funcs,
   300				     formats, num_formats, false);
   301		if (ret)
   302			goto err;
   303	
   304		/* Set up the plane properties */
   305		plane->props.colorkey = drm_property_create_range(
   306				device, 0, "colorkey", 0, 0x01ffffff);
   307		plane->props.contrast = drm_property_create_range(
   308				device, 0, "contrast", 0, 8192 - 1);
   309		plane->props.brightness = drm_property_create_range(
   310				device, 0, "brightness", 0, 1024);
   311		plane->props.hue = drm_property_create_range(
   312				device, 0, "hue", 0, 359);
   313		plane->props.saturation = drm_property_create_range(
   314				device, 0, "saturation", 0, 8192 - 1);
   315		if (!plane->props.colorkey ||
   316		    !plane->props.contrast ||
   317		    !plane->props.brightness ||
   318		    !plane->props.hue ||
   319		    !plane->props.saturation)
   320			goto cleanup;
   321	
   322		plane->colorkey = 0;
   323		drm_object_attach_property(&plane->base.base,
   324					   plane->props.colorkey, plane->colorkey);
   325	
   326		plane->contrast = 0x1000;
   327		drm_object_attach_property(&plane->base.base,
   328					   plane->props.contrast, plane->contrast);
   329	
   330		plane->brightness = 512;
   331		drm_object_attach_property(&plane->base.base,
   332					   plane->props.brightness, plane->brightness);
   333	
   334		plane->hue = 0;
   335		drm_object_attach_property(&plane->base.base,
   336					   plane->props.hue, plane->hue);
   337	
   338		plane->saturation = 0x1000;
   339		drm_object_attach_property(&plane->base.base,
   340					   plane->props.saturation, plane->saturation);
   341	
   342		plane->color_encoding = DRM_COLOR_YCBCR_BT601;
 > 343		drm_plane_create_color_properties(&plane->base,
   344						  BIT(DRM_COLOR_YCBCR_BT601) |
   345						  BIT(DRM_COLOR_YCBCR_BT709),
 > 346						  BIT(DRM_COLOR_YCBCR_LIMITED_RANGE),
   347						  DRM_COLOR_YCBCR_BT601,
   348						  DRM_COLOR_YCBCR_LIMITED_RANGE);
   349	
   350		plane->set_params = nv10_set_params;
   351		nv10_set_params(plane);
   352		drm_plane_force_disable(&plane->base);
   353		return;
   354	cleanup:
   355		drm_plane_cleanup(&plane->base);
   356	err:
   357		kfree(plane);
   358		NV_ERROR(drm, "Failed to create plane\n");
   359	}
   360	

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--azLHFNyN32YCQGCU
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

H4sICAxEjFoAAy5jb25maWcAlFxbc+S2sX7Pr5han4fkwV5JK8vrOqUHEARn4CEJLgCONHph
ydLsWhWttNElsf99ugFeALApO66K40E37o3ury/Ud3/7bsVeXx6/Xr/c3Vzf3/+x+nJ4ODxd
vxxuV5/v7g//v8rVqlZ2JXJpfwDm8u7h9ff3dx8+nq1Ofzg+++Ho+6eb49X28PRwuF/xx4fP
d19eofvd48PfvgN2rupCrruz00za1d3z6uHxZfV8ePlb33758az7cHL+R/B7+iFrY3XLrVR1
lwuucqEnompt09quULpi9vzd4f7zh5PvcVnvBg6m+Qb6Ff7n+bvrp5vf3v/+8ez9jVvls9tE
d3v47H+P/UrFt7loOtM2jdJ2mtJYxrdWMy7mtKpqpx9u5qpiTafrvIOdm66S9fnHt+js8vz4
jGbgqmqY/dNxIrZouFqIvMsr1iEr7MKKaa2OZtaOXIp6bTcTbS1qoSXvpGFInxOydj1v3FwI
ud7Y9DjYvtuwnega3hU5n6j6woiqu+SbNcvzjpVrpaXdVPNxOStlpmHxcKkl2yfjb5jpeNN2
GmiXFI3xjehKWcPlyavgANyijLBt0zVCuzGYFiw5oYEkqgx+FVIb2/FNW28X+Bq2FjSbX5HM
hK6ZE+1GGSOzUiQspjWNgGtdIF+w2nabFmZpKrjADayZ4nCHx0rHactsNocTY9OpxsoKjiWH
RwdnJOv1Emcu4NLd9lgJLyV6uvCUO1M1S13bRqtMmIlcyMtOMF3u4XdXieDOm7VlsGeQyJ0o
zfmHoX18znCTBp79+/u7X99/fbx9vT88v/+/tmaVQAkQzIj3PyTvWupP3YXSwVVkrSxz2Ljo
xKWfz0SP2m5AEPBICgX/6iwz2NnptbXTkveoy16/QcuosqTtRL2DneMSK2nPP5wMRK7hKt0z
lXCd795N6rFv66wwlJaEc2blTmgD4oL9iOaOtVYlQr0FERNlt76SDU3JgHJCk8qr8L2HlMur
pR4L85dXp0AY9xqsKtxqSndre4sBV0icVbjKeRf19oinxIAgcqwt4a0pY1G+zt/9/eHx4fCP
8RrMBWvCycze7GTDyZngMYPMV59a0QpiLi8h8BKU3nfMgr3ZhCO3RoAKJAdmbU4aWHcR7hk6
DlgbyEw5SDE8idXz66/Pfzy/HL5OUjzqfXgx7s0SJgFIZqMuaIooCgF2G6cuClD9ZjvnQ+UG
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

--azLHFNyN32YCQGCU
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--azLHFNyN32YCQGCU--
