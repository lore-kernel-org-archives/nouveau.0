From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Build failure in Mesa
Date: Tue, 16 Feb 2010 18:53:58 +1000
Message-ID: <1266310438.2256.0.camel@nisroch>
References: <201002160925.27160.johannesobermayr@gmx.de>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <201002160925.27160.johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, "mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <mesa3d-dev-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, 2010-02-16 at 09:25 +0100, Johannes Obermayr wrote:
> Hi,
> 
> Ben Skeggs latest changes in Mesa cause a build failure (libdrm is latest git ...).
Rebuild latest libdrm from git, you'll also need an updated kernel
module.

Ben.
> 
> Thanks.
> Johannes
> 
> gmake[3]: Entering directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers'
> gmake[4]: Entering directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri'
> sed -e 's,@INSTALL_DIR@,/usr,' -e 's,@INSTALL_LIB_DIR@,/usr/lib,' -e 's,@INSTALL_INC_DIR@,/usr/include,' -e 's,@VERSION@,7.8.0,' -e 's,@DRI_DRIVER_DIR@,/usr/lib/dri,' -e 's,@DRI_PC_REQ_PRIV@,libdrm >= 2.4.15,' dri.pc.in > dri.pc
> gmake[5]: Entering directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri/nouveau'
> running /usr/bin/makedepend
> gmake[5]: Leaving directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri/nouveau'
> gmake[5]: Entering directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri/nouveau'
> gmake[6]: Entering directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri/nouveau'
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/utils.c -o ../common/utils.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/vblank.c -o ../common/vblank.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/dri_util.c -o ../common/dri_util.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/xmlconfig.c -o ../common/xmlconfig.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/texmem.c -o ../common/texmem.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/drirenderbuffer.c -o ../common/drirenderbuffer.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    ../common/dri_metaops.c -o ../common/dri_metaops.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_screen.c -o nouveau_screen.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_context.c -o nouveau_context.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_fbo.c -o nouveau_fbo.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_driver.c -o nouveau_driver.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_state.c -o nouveau_state.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_bufferobj.c -o nouveau_bufferobj.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_span.c -o nouveau_span.o
> gcc -c -I. -I../../../../../src/mesa/drivers/dri/common -Iserver -I../../../../../include -I../../../../../src/mesa -I../../../../../src/egl/main -I../../../../../src/egl/drivers/dri -I/usr/include/drm    -g -O2 -Wall -Wmissing-prototypes -std=c99 -ffast-math -fvisibility=hidden -fno-strict-aliasing  -fPIC  -DUSE_X86_ASM -DUSE_MMX_ASM -DUSE_3DNOW_ASM -DUSE_SSE_ASM -D_GNU_SOURCE -DPTHREADS -DHAVE_POSIX_MEMALIGN -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DGLX_DIRECT_RENDERING -DGLX_INDIRECT_RENDERING -DHAVE_ALIAS -DHAVE_XEXTPROTO_71 -I/usr/include/drm -I/usr/include/nouveau    nouveau_bo_state.c -o nouveau_bo_state.o
> nouveau_bo_state.c: In function 'nouveau_bo_marker_emit':
> nouveau_bo_state.c:35: error: 'struct nouveau_channel' has no member named 'pushbuf'
> nouveau_bo_state.c:44: error: dereferencing pointer to incomplete type
> nouveau_bo_state.c:48: error: dereferencing pointer to incomplete type
> nouveau_bo_state.c:56: error: dereferencing pointer to incomplete type
> nouveau_bo_state.c:59: error: dereferencing pointer to incomplete type
> gmake[6]: *** [nouveau_bo_state.o] Error 1
> gmake[6]: *** Waiting for unfinished jobs....
> gmake[6]: Leaving directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri/nouveau'
> gmake[5]: *** [lib] Error 2
> gmake[5]: Leaving directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri/nouveau'
> gmake[4]: *** [subdirs] Error 1
> gmake[4]: Leaving directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers/dri'
> gmake[3]: *** [default] Error 1
> gmake[3]: Leaving directory `/usr/src/packages/BUILD/Mesa/src/mesa/drivers'
> gmake[2]: *** [driver_subdirs] Error 2
> gmake[2]: Leaving directory `/usr/src/packages/BUILD/Mesa/src/mesa'
> make[1]: *** [subdirs] Error 1
> make[1]: Leaving directory `/usr/src/packages/BUILD/Mesa/src'
> make: *** [default] Error 1
> error: Bad exit status from /var/tmp/rpm-tmp.Qtrwdg (%build)
