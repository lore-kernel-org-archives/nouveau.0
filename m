From: gabriel muguerza <glmcabra-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Question about NV18 and GBM library.
Date: Wed, 25 Apr 2012 12:34:17 -0300
Message-ID: <CAJvabWDH8U_H-LaHj1LzZXYdSGb8E+grNUwDeJK+W0KrxKgAqg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0674165686=="
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

--===============0674165686==
Content-Type: multipart/alternative; boundary=14dae9340db1b4348204be829a32

--14dae9340db1b4348204be829a32
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I have a geforce 4mx 440 agp 8x, and I'm trying to use the GBM library,
(as jbarnes in: http://virtuousgeek.org/blog/index.php/jbarnes/2011/10/
and David Hermann in KMSCON: https://github.com/dvdhrm/kmscon),
without success.

when I try to create a gbm_device, I get: (below the code.)

nouveau_drm_screen_create: unknown chipset nv18
dri_init_screen_helper: failed to create pipe_screen
loaded /usr/lib/gbm/pipe_nouveau.so
nouveau_drm_screen_create: unknown chipset nv18
failed to load driver: nouveau


My question is:
Is this not supported by the driver?,
It's a GBM problem? or am I doing something wrong?



when I run the following code:

#include <errno.h>
#include <fcntl.h>
#include <gbm.h>

#include <stdlib.h>
#include <stdio.h>

#include <xf86drmMode.h>
#include <xf86drm.h>
#include <libdrm/drm.h>

int main(int argc, char* argv[])
{
    int fd;
    struct gbm_device *gbm = NULL;

    fd = open("/dev/dri/card0", O_RDWR | O_CLOEXEC);
    if (fd < 0) {
        perror("====> open error /dev/dri/card0...");
        exit(-1);
    }
    printf("..... open /dev/dri/card0, fd = %d\n\n", fd);

    gbm = gbm_create_device(fd);
    if (!gbm) {
        perror("\n====> cannot create gbm device...");
        fprintf(stderr, "====> errno = %d\n", errno);
            exit(-1);
    }

    exit(0);
}


I get:

..... open /dev/dri/card0, fd = 3

nouveau_drm_screen_create: unknown chipset nv18
dri_init_screen_helper: failed to create pipe_screen
loaded /usr/lib/gbm/pipe_nouveau.so
nouveau_drm_screen_create: unknown chipset nv18
failed to load driver: nouveau

====> cannot create gbm device...: No such file or directory
====> errno = 2


some details:
distro: Archlinux
kernel: 3.3.3
Mesa 8.0 from git: ./autogen.sh --prefix=/usr
--with-dri-driverdir=/usr/lib/xorg/modules/dri \
                --with-dri-drivers=i915,i965,nouveau,radeon,r200 \
                --with-gallium-drivers=r300,r600,nouveau,svga,swrast \
                --with-egl-platforms=drm,x11 \
                --enable-gallium-llvm \
                --enable-gallium-egl \
                --enable-shared-dricore \
                --enable-shared-glapi \
                --enable-egl \
                --enable-gles1 \
                --enable-gles2 \
                --enable-openvg \
                --enable-glx-tls \
                --enable-xcb \
                --enable-gbm \
                --enable-dri \
                --enable-xa \
                --enable-gallium-gbm \
                --enable-osmesa \
                --enable-texture-float \
                --enable-debug

libdrm 2.4.33 from git.
xf86-video-nouveau from git.


If necessary I will provide any other relevant information.

Thanks,
Gabriel Muguerza.

(English is not my native language, please excuse the typos.)

--14dae9340db1b4348204be829a32
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><br><br>Hi,<br><br>I have a geforce 4mx 440 agp 8x, and I&#39;m trying =
to use the GBM library, <br>(as jbarnes in: <a href=3D"http://virtuousgeek.=
org/blog/index.php/jbarnes/2011/10/" target=3D"_blank">http://virtuousgeek.=
org/blog/index.php/jbarnes/2011/10/</a><br>

and David Hermann in KMSCON: <a href=3D"https://github.com/dvdhrm/kmscon" t=
arget=3D"_blank">https://github.com/dvdhrm/kmscon</a>), <br>without success=
.<br><br>when I try to create a gbm_device, I get: (below the code.)<br><br=
>
nouveau_drm_screen_create: unknown chipset nv18<br>
dri_init_screen_helper: failed to create pipe_screen<br>loaded /usr/lib/gbm=
/pipe_nouveau.so<br>nouveau_drm_screen_create: unknown chipset nv18<br>fail=
ed to load driver: nouveau<br><br><br>My question is:<br>Is this not suppor=
ted by the driver?,<br>
It&#39;s a GBM problem? or am I doing something wrong?<br><br><br><br>when =
I run the following code:<br><br>#include &lt;errno.h&gt;<br>#include &lt;f=
cntl.h&gt;<br>
#include &lt;gbm.h&gt;<br><br>#include &lt;stdlib.h&gt;<br>#include &lt;std=
io.h&gt;<br><br>#include &lt;xf86drmMode.h&gt;<br>#include &lt;xf86drm.h&gt=
;<br>#include &lt;libdrm/drm.h&gt;<br><br>int main(int argc, char* argv[])<=
br>

{<br>=A0=A0=A0 int fd;<br>=A0=A0=A0 struct gbm_device *gbm =3D NULL;<br><br=
>=A0=A0=A0 fd =3D open(&quot;/dev/dri/card0&quot;, O_RDWR | O_CLOEXEC);<br>=
=A0=A0=A0 if (fd &lt; 0) {<br>=A0=A0=A0 =A0=A0=A0 perror(&quot;=3D=3D=3D=3D=
&gt; open error /dev/dri/card0...&quot;);=A0=A0=A0=A0=A0 <br>

=A0=A0=A0 =A0=A0=A0 exit(-1);<br>=A0=A0=A0 }<br>=A0=A0=A0 printf(&quot;....=
. open /dev/dri/card0, fd =3D %d\n\n&quot;, fd);<br>=A0=A0=A0 =A0=A0=A0 =A0=
=A0=A0 <br>=A0=A0=A0 gbm =3D gbm_create_device(fd);<br>=A0=A0=A0 if (!gbm) =
{<br>=A0=A0=A0 =A0=A0=A0 perror(&quot;\n=3D=3D=3D=3D&gt; cannot create gbm =
device...&quot;);=A0=A0=A0=A0=A0 <br>

=A0=A0=A0 =A0=A0=A0 fprintf(stderr, &quot;=3D=3D=3D=3D&gt; errno =3D %d\n&q=
uot;, errno);<br>=A0=A0=A0 =A0=A0=A0 =A0=A0=A0 exit(-1);<br>=A0=A0=A0 }<br>=
<br>=A0=A0=A0 exit(0);<br>}<br><br><br>I get:<br><br>..... open /dev/dri/ca=
rd0, fd =3D 3<br><br>nouveau_drm_screen_create: unknown chipset nv18<br>

dri_init_screen_helper: failed to create pipe_screen<br>loaded /usr/lib/gbm=
/pipe_nouveau.so<br>nouveau_drm_screen_create: unknown chipset nv18<br>fail=
ed to load driver: nouveau<br><br>=3D=3D=3D=3D&gt; cannot create gbm device=
...: No such file or directory<br>

=3D=3D=3D=3D&gt; errno =3D 2=A0=A0=A0 <br><br><br>some details:<br>distro: =
Archlinux<br>kernel: 3.3.3<br>Mesa 8.0 from git: ./autogen.sh --prefix=3D/u=
sr --with-dri-driverdir=3D/usr/lib/xorg/modules/dri \<br>
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --with-dri-drivers=3Di915,i96=
5,nouveau,radeon,r200 \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --=
with-gallium-drivers=3Dr300,r600,nouveau,svga,swrast \<br>=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --with-egl-platforms=3Ddrm,x11 \<br>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-gallium-llvm \<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-gallium-egl \<br>=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-shared-dricore \<br>=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-shared-glapi \<br>=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-egl \<br>=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-gles1 \<br>=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 --enable-gles2 \<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-openvg \<br>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-glx-tls \<br>=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-xcb \<br>=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 --enable-gbm \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 --enable-dri \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 --enable-xa \<br>=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --ena=
ble-gallium-gbm \<br>

=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-osmesa \<br>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-texture-float \<br>=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 --enable-debug<br><br>libdrm 2.4.33=
 from git.<br>xf86-video-nouveau from git.<br><br><br>If necessary I will p=
rovide any other relevant information.<br>

<br>Thanks,<br>Gabriel Muguerza.<br><br>(English is not my native language,=
 please excuse the typos.)<br><br><br><br><br><br>

--14dae9340db1b4348204be829a32--

--===============0674165686==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0674165686==--
