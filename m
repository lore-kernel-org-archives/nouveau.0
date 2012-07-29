From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Mesa build issue... is it just me?
Date: Sun, 29 Jul 2012 19:54:04 +0200
Message-ID: <CAGZ4FERUgC6buGM-TT9jONFR1kH21cd_EfHmTdyVHwZK3ZD6WQ@mail.gmail.com>
References: <50156F7D.4010001@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <50156F7D.4010001-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andrew Green <andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Jul 29, 2012 at 7:14 PM, Andrew Green <andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Anyone else getting this when building the latest mesa?
>
> make[3]: Entering directory
> `/usr/local/nouveau/mesa2/mesa/src/gallium/targets/dri-nouveau'
> gcc -c -I. -I../../../../src/mesa/drivers/dri/common -Iserver
> -I../../../../include -I../../../../include/GL/internal
> -I../../../../src/mapi -I../../../../src/gallium/include
> -I../../../../src/gallium/auxiliary -I../../../../src/gallium/drivers
> -I../../../../src/gallium/winsys -I../../../../src/mesa
> -I../../../../src/mesa/main -I../../../../src/mesa/math
> -I../../../../src/mesa/transform -I../../../../src/mesa/shader
> -I../../../../src/mesa/swrast -I../../../../src/mesa/swrast_setup
> -I../../../../src/egl/main -I../../../../src/egl/drivers/dri
> -I/usr/local/include -I/usr/local/include/libdrm    -g -O2 -Wall -std=c99
> -Werror=implicit-function-declaration -Werror=missing-prototypes
> -fno-strict-aliasing -fno-builtin-memcmp -g -g -O2 -fPIC -D_GNU_SOURCE
> -DPTHREADS -DDEBUG -DTEXTURE_FLOAT_ENABLED -DHAVE_POSIX_MEMALIGN -DUSE_XCB
> -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DPTHREADS
> -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS -fvisibility=hidden
> -DGALLIUM_RBUG -DGALLIUM_TRACE target.c -o target.o
> /bin/sh ../../../../bin/mklib -o nouveau_dri.so.tmp -noprefix -linker 'g++'
> -ldflags '' \
>         target.o ../../../../src/mesa/drivers/dri/common/utils.o
> ../../../../src/mesa/drivers/dri/common/dri_util.o
> ../../../../src/mesa/drivers/dri/common/xmlconfig.o
> ../../../../src/gallium/state_trackers/dri/drm/libdridrm.a
> ../../../../src/gallium/winsys/nouveau/drm/libnouveaudrm.a
> ../../../../src/gallium/drivers/trace/libtrace.a
> ../../../../src/gallium/drivers/rbug/librbug.a
> ../../../../src/gallium/drivers/nv30/libnv30.a
> ../../../../src/gallium/drivers/nv50/libnv50.a
> ../../../../src/gallium/drivers/nvc0/libnvc0.a
> ../../../../src/gallium/drivers/nouveau/libnouveau.a \
>                 -Wl,--start-group ../../../../src/mesa/libmesagallium.a
> ../../../../src/gallium/auxiliary/libgallium.a -Wl,--end-group \
>                   ../../../../lib/libdricore8.1.0.so  -L/usr/local/lib -ldrm
> -lexpat -lm -lpthread -ldl -ldrm_nouveau
> mklib: Making Linux shared library:  nouveau_dri.so.tmp
> g++ -g -O2 -Wall -std=c99 -Werror=implicit-function-declaration
> -Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp -g -g
> -O2 -fPIC -D_GNU_SOURCE -DPTHREADS -DDEBUG -DTEXTURE_FLOAT_ENABLED
> -DHAVE_POSIX_MEMALIGN -DUSE_XCB -DGLX_INDIRECT_RENDERING
> -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1
> -DIN_DRI_DRIVER -DHAVE_ALIAS -fvisibility=hidden -o nouveau_dri.so.test
> ../../../../src/mesa/drivers/dri/common/dri_test.o nouveau_dri.so.tmp
> ../../../../lib/libdricore8.1.0.so  -L/usr/local/lib -ldrm   -lexpat -lm
> -lpthread -ldl -ldrm_nouveau   ;
> /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libdrm_nouveau.so:
> undefined reference to `drmPrimeHandleToFD'
> /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libdrm_nouveau.so:
> undefined reference to `drmPrimeFDToHandle'
> collect2: error: ld returned 1 exit status
>
> I'm on a mixed Debian testing/unstable/experimental, with Linux
> 3.4-trunk-amd64. Didn't have any build issues before doing a git pull and an
> apt-get upgrade just prior.
>
> I noticed this (refers to intel and drm):
> http://blog.gmane.org/gmane.comp.video.dri.patches . Says something about
> distributions having changed ld to default to --no-copy-dt-needed-entries.
>
> Many thanks in advance for any suggestions, greetings,
> Andrew
>
> P.S. Here is my config:
>
> ./autogen.sh --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib
> --includedir=/usr/include --with-dri-drivers=
> --with-gallium-drivers=swrast,nouveau --enable-debug --enable-texture-float
> --disable-asm --enable-opengl --disable-gles2 --disable-openvg
> --enable-texture-float --disable-asm --enable-opengl --disable-gles2
> --disable-openvg --enable-dri --enable-glx --enable-xvmc --disable-va
> --disable-vdpau --disable-osmesa --disable-egl --disable-xorg
> --disable-d3d1x --disable-xa --disable-gbm --disable-xlib-glx
> --disable-gallium-egl --disable-gallium-gbm --disable-gallium-llvm
> --enable-driglx-direct --enable-glx-tls --enable-glu --prefix=/usr/
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

Sounds like something is wrong with your libdrm install if i had to guess.

Those symbols were added recently it seems:
http://cgit.freedesktop.org/mesa/drm/commit/?id=cc0a14575d9fd0aafe73cb4aa445eaf024436114

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
