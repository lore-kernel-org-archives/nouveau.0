From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: [RFC] Merge of a reincarnation of the nouveau classic
	mesa driver.
Date: Tue, 02 Feb 2010 12:01:28 +0100
Message-ID: <87k4uvvr3r.fsf@riseup.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0178515088=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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
To: mesa3d-dev <mesa3d-dev-TtF/mJH4Jtrk1uMJSBkQmQ@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

--===============0178515088==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha1; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

For a long time the gallium pipe drivers for nvidia fixed function cards
(nv0x, nv1x and, to some extent, nv2x) have remained unmaintained and
godforsaken -- especially nv0x and nv1x had seen almost no progress
since their creation.

They've recently grown a classic mesa driver which implements many new
features: texturing, hardware-accelerated tnl. However the killer
feature is "it actually draws stuff" (and if you're lucky even some
simple games at reasonable FPS) so I don't like to consider this a step
back.

Right now it is located in a git repo here [1], "mesa-next" is the
branch I'm proposing to merge. I'll reply myself with the patches
affecting core mesa it depends on, to give them more visibility. Of
course driver-related comments are welcome too.

[1] http://cgit.freedesktop.org/~currojerez/mesa/

 configure.ac                                       |    2 +-
 src/gallium/docs/source/distro.rst                 |   15 -
 src/gallium/drivers/nouveau/Makefile               |    3 +-
 src/gallium/drivers/nouveau/nouveau_winsys.h       |   18 -
 src/gallium/drivers/nouveau/nv04_surface_2d.c      |  547 +++++++++++++
 src/gallium/drivers/nouveau/nv04_surface_2d.h      |   37 +
 src/gallium/drivers/nv04/Makefile                  |   21 -
 src/gallium/drivers/nv04/nv04_clear.c              |   12 -
 src/gallium/drivers/nv04/nv04_context.c            |  112 ---
 src/gallium/drivers/nv04/nv04_context.h            |  148 ----
 src/gallium/drivers/nv04/nv04_fragprog.c           |   21 -
 src/gallium/drivers/nv04/nv04_fragtex.c            |   73 --
 src/gallium/drivers/nv04/nv04_miptree.c            |  146 ----
 src/gallium/drivers/nv04/nv04_prim_vbuf.c          |  339 --------
 src/gallium/drivers/nv04/nv04_screen.c             |  222 -----
 src/gallium/drivers/nv04/nv04_screen.h             |   30 -
 src/gallium/drivers/nv04/nv04_state.c              |  459 -----------
 src/gallium/drivers/nv04/nv04_state.h              |   72 --
 src/gallium/drivers/nv04/nv04_state_emit.c         |  246 ------
 src/gallium/drivers/nv04/nv04_surface.c            |   63 --
 src/gallium/drivers/nv04/nv04_surface_2d.c         |  547 -------------
 src/gallium/drivers/nv04/nv04_surface_2d.h         |   37 -
 src/gallium/drivers/nv04/nv04_transfer.c           |  178 -----
 src/gallium/drivers/nv04/nv04_vbo.c                |   78 --
 src/gallium/drivers/nv10/Makefile                  |   20 -
 src/gallium/drivers/nv10/nv10_clear.c              |   14 -
 src/gallium/drivers/nv10/nv10_context.c            |  298 -------
 src/gallium/drivers/nv10/nv10_context.h            |  151 ----
 src/gallium/drivers/nv10/nv10_fragprog.c           |   21 -
 src/gallium/drivers/nv10/nv10_fragtex.c            |  130 ---
 src/gallium/drivers/nv10/nv10_miptree.c            |  165 ----
 src/gallium/drivers/nv10/nv10_prim_vbuf.c          |  267 -------
 src/gallium/drivers/nv10/nv10_screen.c             |  208 -----
 src/gallium/drivers/nv10/nv10_screen.h             |   28 -
 src/gallium/drivers/nv10/nv10_state.c              |  590 --------------
 src/gallium/drivers/nv10/nv10_state.h              |  140 ----
 src/gallium/drivers/nv10/nv10_state_emit.c         |  333 --------
 src/gallium/drivers/nv10/nv10_surface.c            |   63 --
 src/gallium/drivers/nv10/nv10_transfer.c           |  178 -----
 src/gallium/drivers/nv10/nv10_vbo.c                |   78 --
 src/gallium/drivers/nv20/Makefile                  |   21 -
 src/gallium/drivers/nv20/nv20_clear.c              |   14 -
 src/gallium/drivers/nv20/nv20_context.c            |  424 ----------
 src/gallium/drivers/nv20/nv20_context.h            |  150 ----
 src/gallium/drivers/nv20/nv20_fragprog.c           |   21 -
 src/gallium/drivers/nv20/nv20_fragtex.c            |  130 ---
 src/gallium/drivers/nv20/nv20_miptree.c            |  226 ------
 src/gallium/drivers/nv20/nv20_prim_vbuf.c          |  440 ----------
 src/gallium/drivers/nv20/nv20_screen.c             |  204 -----
 src/gallium/drivers/nv20/nv20_screen.h             |   28 -
 src/gallium/drivers/nv20/nv20_state.c              |  583 --------------
 src/gallium/drivers/nv20/nv20_state.h              |  140 ----
 src/gallium/drivers/nv20/nv20_state_emit.c         |  426 ----------
 src/gallium/drivers/nv20/nv20_surface.c            |   63 --
 src/gallium/drivers/nv20/nv20_transfer.c           |  178 -----
 src/gallium/drivers/nv20/nv20_vbo.c                |   79 --
 src/gallium/drivers/nv20/nv20_vertprog.c           |  841 --------------------
 src/gallium/drivers/nv30/nv30_miptree.c            |    2 +-
 src/gallium/drivers/nv30/nv30_screen.h             |    2 +-
 src/gallium/drivers/nv40/nv40_miptree.c            |    2 +-
 src/gallium/drivers/nv40/nv40_screen.h             |    2 +-
 src/gallium/winsys/drm/nouveau/dri/Makefile        |    3 -
 .../winsys/drm/nouveau/drm/nouveau_drm_api.c       |   18 -
 src/gallium/winsys/drm/nouveau/egl/Makefile        |    3 -
 src/gallium/winsys/drm/nouveau/xorg/Makefile       |    3 -
 src/gallium/winsys/g3dvl/nouveau/Makefile          |    5 +-
 src/mesa/drivers/directfb/idirectfbgl_mesa.c       |    2 +-
 src/mesa/drivers/dri/intel/intel_screen.c          |    2 +-
 src/mesa/drivers/dri/nouveau/Makefile              |   59 ++
 src/mesa/drivers/dri/nouveau/nouveau_bo_state.c    |  184 +++++
 src/mesa/drivers/dri/nouveau/nouveau_bo_state.h    |  107 +++
 src/mesa/drivers/dri/nouveau/nouveau_bufferobj.c   |  172 ++++
 src/mesa/drivers/dri/nouveau/nouveau_bufferobj.h   |   39 +
 src/mesa/drivers/dri/nouveau/nouveau_context.c     |  273 +++++++
 src/mesa/drivers/dri/nouveau/nouveau_context.h     |  105 +++
 src/mesa/drivers/dri/nouveau/nouveau_driver.c      |  140 ++++
 src/mesa/drivers/dri/nouveau/nouveau_driver.h      |   89 ++
 src/mesa/drivers/dri/nouveau/nouveau_fbo.c         |  277 +++++++
 src/mesa/drivers/dri/nouveau/nouveau_fbo.h         |   51 ++
 src/mesa/drivers/dri/nouveau/nouveau_gldefs.h      |  263 ++++++
 src/mesa/drivers/dri/nouveau/nouveau_render.h      |   98 +++
 src/mesa/drivers/dri/nouveau/nouveau_render_t.c    |  361 +++++++++
 src/mesa/drivers/dri/nouveau/nouveau_screen.c      |  269 +++++++
 src/mesa/drivers/dri/nouveau/nouveau_screen.h      |   54 ++
 src/mesa/drivers/dri/nouveau/nouveau_span.c        |  174 ++++
 src/mesa/drivers/dri/nouveau/nouveau_state.c       |  532 +++++++++++++
 src/mesa/drivers/dri/nouveau/nouveau_state.h       |  119 +++
 src/mesa/drivers/dri/nouveau/nouveau_surface.c     |   81 ++
 src/mesa/drivers/dri/nouveau/nouveau_surface.h     |   58 ++
 src/mesa/drivers/dri/nouveau/nouveau_swtnl_t.c     |  354 ++++++++
 src/mesa/drivers/dri/nouveau/nouveau_texture.c     |  456 +++++++++++
 src/mesa/drivers/dri/nouveau/nouveau_texture.h     |   49 ++
 src/mesa/drivers/dri/nouveau/nouveau_util.h        |  176 ++++
 src/mesa/drivers/dri/nouveau/nouveau_vbo_t.c       |  409 ++++++++++
 src/mesa/drivers/dri/nouveau/nv04_context.c        |  118 +++
 src/mesa/drivers/dri/nouveau/nv04_context.h        |   52 ++
 src/mesa/drivers/dri/nouveau/nv04_driver.h         |   97 +++
 src/mesa/drivers/dri/nouveau/nv04_render.c         |  212 +++++
 src/mesa/drivers/dri/nouveau/nv04_screen.c         |  211 +++++
 src/mesa/drivers/dri/nouveau/nv04_state_fb.c       |  116 +++
 src/mesa/drivers/dri/nouveau/nv04_state_frag.c     |  261 ++++++
 src/mesa/drivers/dri/nouveau/nv04_state_raster.c   |  314 ++++++++
 src/mesa/drivers/dri/nouveau/nv04_state_tex.c      |  162 ++++
 src/mesa/drivers/dri/nouveau/nv04_surface.c        |  547 +++++++++++++
 src/mesa/drivers/dri/nouveau/nv10_context.c        |   91 +++
 src/mesa/drivers/dri/nouveau/nv10_driver.h         |  192 +++++
 src/mesa/drivers/dri/nouveau/nv10_render.c         |  201 +++++
 src/mesa/drivers/dri/nouveau/nv10_screen.c         |  364 +++++++++
 src/mesa/drivers/dri/nouveau/nv10_state_fb.c       |  190 +++++
 src/mesa/drivers/dri/nouveau/nv10_state_frag.c     |  416 ++++++++++
 src/mesa/drivers/dri/nouveau/nv10_state_polygon.c  |  126 +++
 src/mesa/drivers/dri/nouveau/nv10_state_raster.c   |  186 +++++
 src/mesa/drivers/dri/nouveau/nv10_state_tex.c      |  142 ++++
 src/mesa/drivers/dri/nouveau/nv10_state_tnl.c      |  514 ++++++++++++
 src/mesa/drivers/dri/nouveau/nv20_context.c        |   61 ++
 src/mesa/drivers/dri/nouveau/nv20_driver.h         |  112 +++
 src/mesa/drivers/dri/nouveau/nv20_render.c         |  225 ++++++
 src/mesa/drivers/dri/nouveau/nv20_screen.c         |  483 +++++++++++
 src/mesa/drivers/dri/nouveau/nv20_state_fb.c       |  123 +++
 src/mesa/drivers/dri/nouveau/nv20_state_polygon.c  |   44 +
 src/mesa/drivers/dri/nouveau/nv20_state_raster.c   |   42 +
 src/mesa/drivers/dri/nouveau/nv20_state_tex.c      |  167 ++++
 src/mesa/drivers/dri/nouveau/nv20_state_tnl.c      |  396 +++++++++
 src/mesa/drivers/dri/radeon/radeon_screen.c        |    2 +-
 src/mesa/drivers/dri/swrast/swrast.c               |    2 +-
 src/mesa/drivers/fbdev/glfbdev.c                   |    2 +-
 src/mesa/drivers/windows/gdi/wmesa.c               |    2 +-
 src/mesa/drivers/x11/xm_api.c                      |    2 +-
 src/mesa/main/bitset.h                             |   25 +-
 src/mesa/main/framebuffer.c                        |   41 +-
 src/mesa/main/framebuffer.h                        |    6 +-
 src/mesa/state_tracker/st_framebuffer.c            |    2 +-
 src/mesa/vbo/vbo_split_inplace.c                   |  109 ++--
 133 files changed, 11831 insertions(+), 9598 deletions(-)

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAktoBgkACgkQ196Zy2qEI5cxVQCghiKwQRUQhlipnqJkK4RmvuJN
idkAn0yPUSZjQNWWLw3ExnTld/KMaRwi
=i3Np
-----END PGP SIGNATURE-----
--==-=-=--

--===============0178515088==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0178515088==--
