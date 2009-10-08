From: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau: Add DRM_NOUVEAU_DEBUG option
Date: Thu, 8 Oct 2009 17:10:24 -0500
Message-ID: <680ad8bc0910081510w6c8abe87jf825a4439640af69@mail.gmail.com>
References: <1255037211-5992-1-git-send-email-parwok@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0245971008=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1255037211-5992-1-git-send-email-parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0245971008==
Content-Type: multipart/alternative; boundary=0015174785f2ec347d047573ba7c

--0015174785f2ec347d047573ba7c
Content-Type: text/plain; charset=ISO-8859-1

Ignore the previous patch thread I started. This is the correct one.

On Thu, Oct 8, 2009 at 4:26 PM, Matt Parnell <parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> From: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
>
> Sometimes we have DEBUG_FS enabled, but don't want output from certain
> modules.
> Most modules make this an option, so I figured that Nouveau needed it too.
>
> Signed-off-by: Matt Parnell <mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/gpu/drm/Kconfig                   |   11 +++++++++++
>  drivers/gpu/drm/nouveau/Makefile          |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_debugfs.c |    2 --
>  drivers/gpu/drm/nouveau/nouveau_drv.c     |    2 +-
>  drivers/gpu/drm/nouveau/nouveau_drv.h     |    2 +-
>  5 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 7fe8a4c..62dd13c 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -176,6 +176,9 @@ config DRM_NOUVEAU_KMS
>        and you have a new enough userspace to support this. Running old
>        userspaces with this enabled will cause pain.
>
> +       NOTICE: if you plan on using the text based console outside of X,
> enable
> +       FRAMEBUFFER_CONSOLE or else the console will be unusable.
> +
>  config DRM_NOUVEAU_BACKLIGHT
>        bool "Support for backlight control"
>        depends on DRM_NOUVEAU
> @@ -184,6 +187,14 @@ config DRM_NOUVEAU_BACKLIGHT
>          Say Y here if you want to control the backlight of your display
>          (e.g. a laptop panel).
>
> +config DRM_NOUVEAU_DEBUG
> +       bool "Build in Nouveau's debugfs support"
> +       depends on DRM_NOUVEAU && DEBUG_FS
> +       default y
> +       help
> +         Say Y here if you want Nouveau to output debugging information
> +         via debugfs.
> +
>  menu "I2C encoder or helper chips"
>      depends on DRM
>
> diff --git a/drivers/gpu/drm/nouveau/Makefile
> b/drivers/gpu/drm/nouveau/Makefile
> index ab46e3a..e12b4ff 100644
> --- a/drivers/gpu/drm/nouveau/Makefile
> +++ b/drivers/gpu/drm/nouveau/Makefile
> @@ -9,7 +9,6 @@ nouveau-y := nouveau_drv.o nouveau_state.o
> nouveau_channel.o nouveau_mem.o \
>              nouveau_bo.o nouveau_fence.o nouveau_gem.o nouveau_ttm.o \
>              nouveau_hw.o nouveau_calc.o nouveau_bios.o nouveau_i2c.o \
>             nouveau_display.o nouveau_connector.o nouveau_fbcon.o \
> -            nouveau_debugfs.o \
>              nv04_timer.o \
>              nv04_mc.o nv40_mc.o nv50_mc.o \
>              nv04_fb.o nv10_fb.o nv40_fb.o \
> @@ -22,6 +21,7 @@ nouveau-y := nouveau_drv.o nouveau_state.o
> nouveau_channel.o nouveau_mem.o \
>              nv04_dac.o nv04_dfp.o nv04_tv.o nv17_tv.o nv17_tv_modes.o \
>              nv04_crtc.o nv04_display.o nv04_cursor.o nv04_fbcon.o
>
> +nouveau-$(CONFIG_DRM_NOUVEAU_DEBUG) += nouveau_debugfs.o
>  nouveau-$(CONFIG_COMPAT) += nouveau_ioc32.o
>  nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) += nouveau_backlight.o
>  nouveau-$(CONFIG_ACPI) += nouveau_acpi.o
> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> index 1ac871b..6ccafd3 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
> @@ -33,7 +33,6 @@
>  #include "drmP.h"
>  #include "nouveau_drv.h"
>
> -#if defined(CONFIG_DEBUG_FS)
>  static int
>  nouveau_debugfs_channel_info(struct seq_file *m, void *data)
>  {
> @@ -154,4 +153,3 @@ nouveau_debugfs_takedown(struct drm_minor *minor)
>        drm_debugfs_remove_files(nouveau_debugfs_list,
> NOUVEAU_DEBUGFS_ENTRIES,
>                                 minor);
>  }
> -#endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c
> b/drivers/gpu/drm/nouveau/nouveau_drv.c
> index 327f01a..5e9d38a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.c
> @@ -325,7 +325,7 @@ static struct drm_driver driver = {
>        .lastclose = nouveau_lastclose,
>        .unload = nouveau_unload,
>        .preclose = nouveau_preclose,
> -#if defined(CONFIG_DEBUG_FS)
> +#if defined(CONFIG_DRM_NOUVEAU_DEBUG)
>        .debugfs_init = nouveau_debugfs_init,
>        .debugfs_cleanup = nouveau_debugfs_takedown,
>  #endif
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h
> b/drivers/gpu/drm/nouveau/nouveau_drv.h
> index 2ecfb25..46436ce 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drv.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
> @@ -765,7 +765,7 @@ extern int nouveau_sgdma_get_page(struct drm_device *,
> uint32_t offset,
>  extern struct ttm_backend *nouveau_sgdma_init_ttm(struct drm_device *);
>
>  /* nouveau_debugfs.c */
> -#if defined(CONFIG_DEBUG_FS)
> +#if defined(CONFIG_DRM_NOUVEAU_DEBUG)
>  extern int  nouveau_debugfs_init(struct drm_minor *);
>  extern void nouveau_debugfs_takedown(struct drm_minor *);
>  extern int  nouveau_debugfs_channel_init(struct nouveau_channel *);
> --
> 1.6.4.4
>
>

--0015174785f2ec347d047573ba7c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Ignore the previous patch thread I started. This is the correct one.<br><br=
><div class=3D"gmail_quote">On Thu, Oct 8, 2009 at 4:26 PM, Matt Parnell <s=
pan dir=3D"ltr"><span>&lt;<a href=3D"mailto:parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" class=3D"link=
ifyplus">parwok-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;</span></span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"border-left: 1px solid rgb(204, =
204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;">From: Matt Parnel=
l &lt;<a href=3D"mailto:mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
<br>
Sometimes we have DEBUG_FS enabled, but don&#39;t want output from certain =
modules.<br>
Most modules make this an option, so I figured that Nouveau needed it too.<=
br>
<br>
Signed-off-by: Matt Parnell &lt;<a href=3D"mailto:mparnell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org">mparn=
ell-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org</a>&gt;<br>
---<br>
=A0drivers/gpu/drm/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 11 +++=
++++++++<br>
=A0drivers/gpu/drm/nouveau/Makefile =A0 =A0 =A0 =A0 =A0| =A0 =A02 +-<br>
=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | =A0 =A02 --<br>
=A0drivers/gpu/drm/nouveau/nouveau_drv.c =A0 =A0 | =A0 =A02 +-<br>
=A0drivers/gpu/drm/nouveau/nouveau_drv.h =A0 =A0 | =A0 =A02 +-<br>
=A05 files changed, 14 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig<br>
index 7fe8a4c..62dd13c 100644<br>
--- a/drivers/gpu/drm/Kconfig<br>
+++ b/drivers/gpu/drm/Kconfig<br>
@@ -176,6 +176,9 @@ config DRM_NOUVEAU_KMS<br>
 =A0 =A0 =A0 =A0and you have a new enough userspace to support this. Runnin=
g old<br>
 =A0 =A0 =A0 =A0userspaces with this enabled will cause pain.<br>
<br>
+ =A0 =A0 =A0 NOTICE: if you plan on using the text based console outside o=
f X, enable<br>
+ =A0 =A0 =A0 FRAMEBUFFER_CONSOLE or else the console will be unusable.<br>
+<br>
=A0config DRM_NOUVEAU_BACKLIGHT<br>
 =A0 =A0 =A0 =A0bool &quot;Support for backlight control&quot;<br>
 =A0 =A0 =A0 =A0depends on DRM_NOUVEAU<br>
@@ -184,6 +187,14 @@ config DRM_NOUVEAU_BACKLIGHT<br>
 =A0 =A0 =A0 =A0 =A0Say Y here if you want to control the backlight of your=
 display<br>
 =A0 =A0 =A0 =A0 =A0(e.g. a laptop panel).<br>
<br>
+config DRM_NOUVEAU_DEBUG<br>
+ =A0 =A0 =A0 bool &quot;Build in Nouveau&#39;s debugfs support&quot;<br>
+ =A0 =A0 =A0 depends on DRM_NOUVEAU &amp;&amp; DEBUG_FS<br>
+ =A0 =A0 =A0 default y<br>
+ =A0 =A0 =A0 help<br>
+ =A0 =A0 =A0 =A0 Say Y here if you want Nouveau to output debugging inform=
ation<br>
+ =A0 =A0 =A0 =A0 via debugfs.<br>
+<br>
=A0menu &quot;I2C encoder or helper chips&quot;<br>
 =A0 =A0 =A0depends on DRM<br>
<br>
diff --git a/drivers/gpu/drm/nouveau/Makefile b/drivers/gpu/drm/nouveau/Mak=
efile<br>
index ab46e3a..e12b4ff 100644<br>
--- a/drivers/gpu/drm/nouveau/Makefile<br>
+++ b/drivers/gpu/drm/nouveau/Makefile<br>
@@ -9,7 +9,6 @@ nouveau-y :=3D nouveau_drv.o nouveau_state.o nouveau_channe=
l.o nouveau_mem.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_bo.o nouveau_fence.o nouveau_gem.o nouv=
eau_ttm.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nouveau_hw.o nouveau_calc.o nouveau_bios.o nouv=
eau_i2c.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 nouveau_display.o nouveau_connector.o nouveau_fbco=
n.o \<br>
- =A0 =A0 =A0 =A0 =A0 =A0nouveau_debugfs.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv04_timer.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv04_mc.o nv40_mc.o nv50_mc.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv04_fb.o nv10_fb.o nv40_fb.o \<br>
@@ -22,6 +21,7 @@ nouveau-y :=3D nouveau_drv.o nouveau_state.o nouveau_chan=
nel.o nouveau_mem.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv04_dac.o nv04_dfp.o nv04_tv.o nv17_tv.o nv17_=
tv_modes.o \<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0nv04_crtc.o nv04_display.o nv04_cursor.o nv04_f=
bcon.o<br>
<br>
+nouveau-$(CONFIG_DRM_NOUVEAU_DEBUG) +=3D nouveau_debugfs.o<br>
=A0nouveau-$(CONFIG_COMPAT) +=3D nouveau_ioc32.o<br>
=A0nouveau-$(CONFIG_DRM_NOUVEAU_BACKLIGHT) +=3D nouveau_backlight.o<br>
=A0nouveau-$(CONFIG_ACPI) +=3D nouveau_acpi.o<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/no=
uveau/nouveau_debugfs.c<br>
index 1ac871b..6ccafd3 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c<br>
@@ -33,7 +33,6 @@<br>
=A0#include &quot;drmP.h&quot;<br>
=A0#include &quot;nouveau_drv.h&quot;<br>
<br>
-#if defined(CONFIG_DEBUG_FS)<br>
=A0static int<br>
=A0nouveau_debugfs_channel_info(struct seq_file *m, void *data)<br>
=A0{<br>
@@ -154,4 +153,3 @@ nouveau_debugfs_takedown(struct drm_minor *minor)<br>
 =A0 =A0 =A0 =A0drm_debugfs_remove_files(nouveau_debugfs_list, NOUVEAU_DEBU=
GFS_ENTRIES,<br>
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 minor);<br=
>
=A0}<br>
-#endif<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.c b/drivers/gpu/drm/nouvea=
u/nouveau_drv.c<br>
index 327f01a..5e9d38a 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_drv.c<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.c<br>
@@ -325,7 +325,7 @@ static struct drm_driver driver =3D {<br>
 =A0 =A0 =A0 =A0.lastclose =3D nouveau_lastclose,<br>
 =A0 =A0 =A0 =A0.unload =3D nouveau_unload,<br>
 =A0 =A0 =A0 =A0.preclose =3D nouveau_preclose,<br>
-#if defined(CONFIG_DEBUG_FS)<br>
+#if defined(CONFIG_DRM_NOUVEAU_DEBUG)<br>
 =A0 =A0 =A0 =A0.debugfs_init =3D nouveau_debugfs_init,<br>
 =A0 =A0 =A0 =A0.debugfs_cleanup =3D nouveau_debugfs_takedown,<br>
=A0#endif<br>
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouvea=
u/nouveau_drv.h<br>
index 2ecfb25..46436ce 100644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h<br>
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h<br>
@@ -765,7 +765,7 @@ extern int nouveau_sgdma_get_page(struct drm_device *, =
uint32_t offset,<br>
=A0extern struct ttm_backend *nouveau_sgdma_init_ttm(struct drm_device *);<=
br>
<br>
=A0/* nouveau_debugfs.c */<br>
-#if defined(CONFIG_DEBUG_FS)<br>
+#if defined(CONFIG_DRM_NOUVEAU_DEBUG)<br>
=A0extern int =A0nouveau_debugfs_init(struct drm_minor *);<br>
=A0extern void nouveau_debugfs_takedown(struct drm_minor *);<br>
=A0extern int =A0nouveau_debugfs_channel_init(struct nouveau_channel *);<br=
>
<font color=3D"#888888">--<br>
1.6.4.4<br>
<br>
</font></blockquote></div><br>

--0015174785f2ec347d047573ba7c--

--===============0245971008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0245971008==--
