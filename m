From: Andrew Green <andrew.green.df-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Mesa build issue... is it just me?
Date: Sun, 29 Jul 2012 12:14:37 -0500
Message-ID: <50156F7D.4010001@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1177962545=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1177962545==
Content-Type: multipart/alternative;
 boundary="------------030400030403080400020907"

This is a multi-part message in MIME format.
--------------030400030403080400020907
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Anyone else getting this when building the latest mesa?

    make[3]: Entering directory
    `/usr/local/nouveau/mesa2/mesa/src/gallium/targets/dri-nouveau'
    gcc -c -I. -I../../../../src/mesa/drivers/dri/common -Iserver
    -I../../../../include -I../../../../include/GL/internal
    -I../../../../src/mapi -I../../../../src/gallium/include
    -I../../../../src/gallium/auxiliary
    -I../../../../src/gallium/drivers -I../../../../src/gallium/winsys
    -I../../../../src/mesa -I../../../../src/mesa/main
    -I../../../../src/mesa/math -I../../../../src/mesa/transform
    -I../../../../src/mesa/shader -I../../../../src/mesa/swrast
    -I../../../../src/mesa/swrast_setup -I../../../../src/egl/main
    -I../../../../src/egl/drivers/dri -I/usr/local/include
    -I/usr/local/include/libdrm    -g -O2 -Wall -std=c99
    -Werror=implicit-function-declaration -Werror=missing-prototypes
    -fno-strict-aliasing -fno-builtin-memcmp -g -g -O2 -fPIC
    -D_GNU_SOURCE -DPTHREADS -DDEBUG -DTEXTURE_FLOAT_ENABLED
    -DHAVE_POSIX_MEMALIGN -DUSE_XCB -DGLX_INDIRECT_RENDERING
    -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DPTHREADS
    -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS
    -fvisibility=hidden -DGALLIUM_RBUG -DGALLIUM_TRACE target.c -o target.o
    /bin/sh ../../../../bin/mklib -o nouveau_dri.so.tmp -noprefix
    -linker 'g++' -ldflags '' \
             target.o ../../../../src/mesa/drivers/dri/common/utils.o
    ../../../../src/mesa/drivers/dri/common/dri_util.o
    ../../../../src/mesa/drivers/dri/common/xmlconfig.o  
    ../../../../src/gallium/state_trackers/dri/drm/libdridrm.a
    ../../../../src/gallium/winsys/nouveau/drm/libnouveaudrm.a
    ../../../../src/gallium/drivers/trace/libtrace.a
    ../../../../src/gallium/drivers/rbug/librbug.a
    ../../../../src/gallium/drivers/nv30/libnv30.a
    ../../../../src/gallium/drivers/nv50/libnv50.a
    ../../../../src/gallium/drivers/nvc0/libnvc0.a
    ../../../../src/gallium/drivers/nouveau/libnouveau.a \
                     -Wl,--start-group
    ../../../../src/mesa/libmesagallium.a
    ../../../../src/gallium/auxiliary/libgallium.a -Wl,--end-group \
                       ../../../../lib/libdricore8.1.0.so 
    -L/usr/local/lib -ldrm   -lexpat -lm -lpthread -ldl -ldrm_nouveau
    mklib: Making Linux shared library:  nouveau_dri.so.tmp
    g++ -g -O2 -Wall -std=c99 -Werror=implicit-function-declaration
    -Werror=missing-prototypes -fno-strict-aliasing -fno-builtin-memcmp
    -g -g -O2 -fPIC -D_GNU_SOURCE -DPTHREADS -DDEBUG
    -DTEXTURE_FLOAT_ENABLED -DHAVE_POSIX_MEMALIGN -DUSE_XCB
    -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS
    -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=1 -DIN_DRI_DRIVER -DHAVE_ALIAS
    -fvisibility=hidden -o nouveau_dri.so.test
    ../../../../src/mesa/drivers/dri/common/dri_test.o
    nouveau_dri.so.tmp  ../../../../lib/libdricore8.1.0.so 
    -L/usr/local/lib -ldrm   -lexpat -lm -lpthread -ldl -ldrm_nouveau   ;
    /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libdrm_nouveau.so:
    undefined reference to `drmPrimeHandleToFD'
    /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libdrm_nouveau.so:
    undefined reference to `drmPrimeFDToHandle'
    collect2: error: ld returned 1 exit status

I'm on a mixed Debian testing/unstable/experimental, with Linux 
3.4-trunk-amd64. Didn't have any build issues before doing a git pull 
and an apt-get upgrade just prior.

I noticed this (refers to intel and drm): 
http://blog.gmane.org/gmane.comp.video.dri.patches . Says something 
about distributions having changed ld to default to 
--no-copy-dt-needed-entries.

Many thanks in advance for any suggestions, greetings,
Andrew

P.S. Here is my config:

./autogen.sh --prefix=/usr --bindir=/usr/bin --libdir=/usr/lib 
--includedir=/usr/include --with-dri-drivers= 
--with-gallium-drivers=swrast,nouveau --enable-debug 
--enable-texture-float --disable-asm --enable-opengl --disable-gles2 
--disable-openvg --enable-texture-float --disable-asm --enable-opengl 
--disable-gles2 --disable-openvg --enable-dri --enable-glx --enable-xvmc 
--disable-va --disable-vdpau --disable-osmesa --disable-egl 
--disable-xorg --disable-d3d1x --disable-xa --disable-gbm 
--disable-xlib-glx --disable-gallium-egl --disable-gallium-gbm 
--disable-gallium-llvm --enable-driglx-direct --enable-glx-tls 
--enable-glu --prefix=/usr/


--------------030400030403080400020907
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>

    <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body bgcolor=3D"#FFFFFF" text=3D"#000000">
    Anyone else getting this when building the latest mesa?<br>
    <blockquote>make[3]: Entering directory
      `/usr/local/nouveau/mesa2/mesa/src/gallium/targets/dri-nouveau'<br>
      gcc -c -I. -I../../../../src/mesa/drivers/dri/common -Iserver
      -I../../../../include -I../../../../include/GL/internal
      -I../../../../src/mapi -I../../../../src/gallium/include
      -I../../../../src/gallium/auxiliary
      -I../../../../src/gallium/drivers -I../../../../src/gallium/winsys
      -I../../../../src/mesa -I../../../../src/mesa/main
      -I../../../../src/mesa/math -I../../../../src/mesa/transform
      -I../../../../src/mesa/shader -I../../../../src/mesa/swrast
      -I../../../../src/mesa/swrast_setup -I../../../../src/egl/main
      -I../../../../src/egl/drivers/dri -I/usr/local/include
      -I/usr/local/include/libdrm=C2=A0=C2=A0=C2=A0 -g -O2 -Wall -std=3Dc=
99
      -Werror=3Dimplicit-function-declaration -Werror=3Dmissing-prototype=
s
      -fno-strict-aliasing -fno-builtin-memcmp -g -g -O2 -fPIC
      -D_GNU_SOURCE -DPTHREADS -DDEBUG -DTEXTURE_FLOAT_ENABLED
      -DHAVE_POSIX_MEMALIGN -DUSE_XCB -DGLX_INDIRECT_RENDERING
      -DGLX_DIRECT_RENDERING -DGLX_USE_TLS -DPTHREADS
      -DUSE_EXTERNAL_DXTN_LIB=3D1 -DIN_DRI_DRIVER -DHAVE_ALIAS
      -fvisibility=3Dhidden -DGALLIUM_RBUG -DGALLIUM_TRACE target.c -o
      target.o<br>
      /bin/sh ../../../../bin/mklib -o nouveau_dri.so.tmp -noprefix
      -linker 'g++' -ldflags '' \<br>
      =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 target.o ../../../../src/mesa=
/drivers/dri/common/utils.o
      ../../../../src/mesa/drivers/dri/common/dri_util.o
      ../../../../src/mesa/drivers/dri/common/xmlconfig.o=C2=A0=C2=A0
      ../../../../src/gallium/state_trackers/dri/drm/libdridrm.a
      ../../../../src/gallium/winsys/nouveau/drm/libnouveaudrm.a
      ../../../../src/gallium/drivers/trace/libtrace.a
      ../../../../src/gallium/drivers/rbug/librbug.a
      ../../../../src/gallium/drivers/nv30/libnv30.a
      ../../../../src/gallium/drivers/nv50/libnv50.a
      ../../../../src/gallium/drivers/nvc0/libnvc0.a
      ../../../../src/gallium/drivers/nouveau/libnouveau.a \<br>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 -Wl,--start-group
      ../../../../src/mesa/libmesagallium.a
      ../../../../src/gallium/auxiliary/libgallium.a -Wl,--end-group \<br=
>
      =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ../../../../lib/libdricore8.1.0.so=C2=A0
      -L/usr/local/lib -ldrm=C2=A0=C2=A0 -lexpat -lm -lpthread -ldl
      -ldrm_nouveau=C2=A0=C2=A0 <br>
      mklib: Making Linux shared library:=C2=A0 nouveau_dri.so.tmp<br>
      g++ -g -O2 -Wall -std=3Dc99 -Werror=3Dimplicit-function-declaration
      -Werror=3Dmissing-prototypes -fno-strict-aliasing
      -fno-builtin-memcmp -g -g -O2 -fPIC -D_GNU_SOURCE -DPTHREADS
      -DDEBUG -DTEXTURE_FLOAT_ENABLED -DHAVE_POSIX_MEMALIGN -DUSE_XCB
      -DGLX_INDIRECT_RENDERING -DGLX_DIRECT_RENDERING -DGLX_USE_TLS
      -DPTHREADS -DUSE_EXTERNAL_DXTN_LIB=3D1 -DIN_DRI_DRIVER -DHAVE_ALIAS
      -fvisibility=3Dhidden -o nouveau_dri.so.test
      ../../../../src/mesa/drivers/dri/common/dri_test.o
      nouveau_dri.so.tmp=C2=A0 ../../../../lib/libdricore8.1.0.so=C2=A0
      -L/usr/local/lib -ldrm=C2=A0=C2=A0 -lexpat -lm -lpthread -ldl
      -ldrm_nouveau=C2=A0=C2=A0 ;<br>
      /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libdrm_nouveau.so=
:
      undefined reference to `drmPrimeHandleToFD'<br>
      /usr/lib/gcc/x86_64-linux-gnu/4.7/../../../../lib/libdrm_nouveau.so=
:
      undefined reference to `drmPrimeFDToHandle'<br>
      collect2: error: ld returned 1 exit status<br>
    </blockquote>
    I'm on a mixed Debian testing/unstable/experimental, with Linux
    3.4-trunk-amd64. Didn't have any build issues before doing a git
    pull and an apt-get upgrade just prior.<br>
    <br>
    I noticed this (refers to intel and drm):
    <a class=3D"moz-txt-link-freetext" href=3D"http://blog.gmane.org/gman=
e.comp.video.dri.patches">http://blog.gmane.org/gmane.comp.video.dri.patc=
hes</a> . Says something
    about distributions having changed ld to default to
    --no-copy-dt-needed-entries.<br>
    <br>
    Many thanks in advance for any suggestions, greetings,<br>
    Andrew<br>
    <br>
    P.S. Here is my config:<br>
    <br>
    ./autogen.sh --prefix=3D/usr --bindir=3D/usr/bin --libdir=3D/usr/lib
    --includedir=3D/usr/include --with-dri-drivers=3D
    --with-gallium-drivers=3Dswrast,nouveau --enable-debug
    --enable-texture-float --disable-asm --enable-opengl --disable-gles2
    --disable-openvg --enable-texture-float --disable-asm
    --enable-opengl --disable-gles2 --disable-openvg --enable-dri
    --enable-glx --enable-xvmc --disable-va --disable-vdpau
    --disable-osmesa --disable-egl --disable-xorg --disable-d3d1x
    --disable-xa --disable-gbm --disable-xlib-glx --disable-gallium-egl
    --disable-gallium-gbm --disable-gallium-llvm --enable-driglx-direct
    --enable-glx-tls --enable-glu --prefix=3D/usr/<br>
    <br>
  </body>
</html>

--------------030400030403080400020907--

--===============1177962545==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1177962545==--
