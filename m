From: "Chris Lewis" <chris-wfxh7x6G0zpdj4APDhWzjA@public.gmane.org>
Subject: xf86-video-nouveau does not compile
Date: Sat, 10 Nov 2007 11:21:44 +0000
Message-ID: <20071110111645.M861@kool4katz.co.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1599514851=="
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
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1599514851==
Content-Type: text/html;
	charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

<HTML>
<HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" http-equiv=3DContent-Type>
<META content=3D"OPENWEBMAIL" name=3DGENERATOR>
</HEAD>
<BODY bgColor=3D#ffffff>

<font size=3D"2">

<font size=3D"2">Hello,

<br />

<br />I wonder if someone can advise what may be going wrong here when=20
attempting to compile the Xorg nouveau driver. autoconf &amp; configure run=
=20
through fine.=20

<br />

<br />This is on a fc7-ppc=20
box.

<br /></font><font size=3D"2">

<br />

<br /><span style=3D"font-family: courier new,courier,monospace;">make=20=
=20
all-recursive</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make[1]: Entering directory=20
`/root/xf86-video-nouveau'</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">Making all in=20
src</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make[2]: Entering directory=20
`/root/xf86-video-nouveau/src'</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">/bin/sh ../libtool=20
--tag=3DCC   --mode=3Dcompile gcc -DHAVE_CONFIG_H -I. -I..    -I/usr/includ=
e/drm=20
-I/usr/include/X11/dri -I/usr/include/xorg   -g -O2 -Wall -MT nv_accel_comm=
on.lo=20
-MD -MP -MF .deps/nv_accel_common.Tpo -c -o nv_accel_common.lo=20
nv_accel_common.c</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;"> gcc -DHAVE_CONFIG_H -I.=20
-I.. -I/usr/include/drm -I/usr/include/X11/dri -I/usr/include/xorg -g -O2 -=
Wall=20
-MT nv_accel_common.lo -MD -MP -MF .deps/nv_accel_common.Tpo -c=20
nv_accel_common.c  -fPIC -DPIC -o=20
.libs/nv_accel_common.o</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">In file included from=20
nv_include.h:69,</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">                 from=20
nv_accel_common.c:23:</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">nv_type.h:369: error: field=20
'fifo' has incomplete=20
type</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make[2]: ***=20
[nv_accel_common.lo] Error=20
1</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make[2]: Leaving directory=20
`/root/xf86-video-nouveau/src'</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make[1]: *** [all-recursive]=
=20
Error=20
1</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make[1]: Leaving directory=20
`/root/xf86-video-nouveau'</span>

<br style=3D"font-family: courier new,courier,monospace;" /><span style=3D"=
font-family: courier new,courier,monospace;">make: *** [all] Error=20
2</span>

<br style=3D"font-family: courier new,courier,monospace;" />

<br />Cheers

<br />

<br />Chris

<br />--=20

<br />
Open WebMail Project (<a href=3D"http://openwebmail.org/" target=3D"_blank"=
>http://openwebmail.org</a>)=20

<br />

<br />
</font>

</font>
</BODY>
</HTML>


--===============1599514851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1599514851==--
