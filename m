From: Eeydev <eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org>
Subject: [PATCH] Do not use the default pll found in pll table
	v2.1 on nv50+ cards
Date: Mon, 27 Sep 2010 01:50:27 +0100
Message-ID: <F47CC6A1FF2C9C40A25AEEBE1F58EEF7012316CA@VUIEXCHA.ad.nottingham.ac.uk>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1976732349=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-class: urn:content-classes:message
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

--===============1976732349==
Content-class: urn:content-classes:message
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01CB5DDD.FA47BBF0"

This is a multi-part message in MIME format.

------_=_NextPart_001_01CB5DDD.FA47BBF0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

=20
 Hi guys,
=20
Having looked at bug 30370, I believe that this is probably the best =
solution considering that on nv50 we set PLLs only if they exist in the =
pll_limits_table
=20
Please review and comment. Thanks
=20
--Emil
=20
=20
From e6e595a75dc9b2b106177abb26c0207e0fdc3fa9 Mon Sep 17 00:00:00 2001
From: Emil Velikov <eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org>
Date: Sun, 26 Sep 2010 20:26:02 +0100
Subject: [PATCH] Do not use the default pll found in pll table v2.1 on =
nv50+ cards
=20
This fixes issues bug 30370 and prevents another possible divide by zero =
on the original nv50 cards, by returning -ENOENT
=20
Signed-off-by: Emil Velikov <eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)
=20
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c =
b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 0b844ea..9bd7099 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -4890,6 +4890,12 @@ int get_pll_limits(struct drm_device *dev, =
uint32_t limit_match, struct pll_lims
 				break;
 			}
=20
+		if ((dev_priv->card_type >=3D NV_50) && (pllindex =3D=3D 0)) {
+			NV_ERROR(dev, "Register 0x%08x not found in PLL "
+				 "limits table", pll_lim->reg);
+			return -ENOENT;
+		}
+
 		pll_rec =3D &bios->data[plloffs + recordlen * pllindex];
=20
 		BIOSLOG(bios, "Loading PLL limits for reg 0x%08x\n",
--
1.7.2.3
=
This message and any attachment are intended solely for the addressee a=
nd may contain confidential information. If you have received this mess=
age in error, please send it back to me, and immediately delete it.   P=
lease do not use, copy or disclose the information contained in this me=
ssage or in any attachment.  Any views or opinions expressed by the aut=
hor of this email do not necessarily reflect the views of the Universit=
y of Nottingham.=0D=0A=0D=0AThis message has been checked for viruses b=
ut the contents of an attachment=0D=0Amay still contain software viruse=
s which could damage your computer system:=0D=0Ayou are advised to perf=
orm your own checks. Email communications with the=0D=0AUniversity of N=
ottingham may be monitored as permitted by UK legislation.=

------_=_NextPart_001_01CB5DDD.FA47BBF0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Diso-8859-1">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.5.7654.12">
<TITLE>[PATCH] Do not use the default pll found in pll table v2.1 on =
nv50+ cards</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2><BR>
&nbsp;Hi guys,<BR>
<BR>
Having looked at bug 30370, I believe that this is probably the best =
solution considering that on nv50 we set PLLs only if they exist in the =
pll_limits_table<BR>
<BR>
Please review and comment. Thanks<BR>
<BR>
--Emil<BR>
<BR>
<BR>
From e6e595a75dc9b2b106177abb26c0207e0fdc3fa9 Mon Sep 17 00:00:00 =
2001<BR>
From: Emil Velikov &lt;eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org&gt;<BR>
Date: Sun, 26 Sep 2010 20:26:02 +0100<BR>
Subject: [PATCH] Do not use the default pll found in pll table v2.1 on =
nv50+ cards<BR>
<BR>
This fixes issues bug 30370 and prevents another possible divide by zero =
on the original nv50 cards, by returning -ENOENT<BR>
<BR>
Signed-off-by: Emil Velikov &lt;eeydev-QabDm/c3fAmwa9SdKMSz+Q@public.gmane.org&gt;<BR>
---<BR>
&nbsp;drivers/gpu/drm/nouveau/nouveau_bios.c |&nbsp;&nbsp;&nbsp; 6 =
++++++<BR>
&nbsp;1 files changed, 6 insertions(+), 0 deletions(-)<BR>
<BR>
diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c =
b/drivers/gpu/drm/nouveau/nouveau_bios.c<BR>
index 0b844ea..9bd7099 100644<BR>
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c<BR>
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c<BR>
@@ -4890,6 +4890,12 @@ int get_pll_limits(struct drm_device *dev, =
uint32_t limit_match, struct pll_lims<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; break;<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<BR>
<BR>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if ((dev_priv-&gt;card_type =
&gt;=3D NV_50) &amp;&amp; (pllindex =3D=3D 0)) {<BR>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; NV_ERROR(dev, &quot;Register =
0x%08x not found in PLL &quot;<BR>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;limits =
table&quot;, pll_lim-&gt;reg);<BR>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return -ENOENT;<BR>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; }<BR>
+<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pll_rec =3D =
&amp;bios-&gt;data[plloffs + recordlen * pllindex];<BR>
<BR>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; BIOSLOG(bios, &quot;Loading =
PLL limits for reg 0x%08x\n&quot;,<BR>
--<BR>
1.7.2.3</FONT>
</P>

=
<br/>=0D=0A<p>=0D=0AThis message and any attachment are intended solely=
 for the addressee and may=20=0D=0Acontain confidential information. If=
 you have received this message in error,=20=0D=0Aplease send it back t=
o me, and immediately delete it.   Please do not use,=20=0D=0Acopy or d=
isclose the information contained in this message or in any attachment.=
 =20=0D=0AAny views or opinions expressed by the author of this email d=
o not necessarily=20=0D=0Areflect the views of the University of Nottin=
gham.=0D=0A</p>=0D=0A<p>=0D=0AThis message has been checked for viruses=
 but the contents of an attachment=0D=0Amay still contain software viru=
ses which could damage your computer system:=0D=0Ayou are advised to pe=
rform your own checks. Email communications with the=0D=0AUniversity of=
 Nottingham may be monitored as permitted by UK legislation.=0D=0A</p>=
</BODY>
</HTML>
------_=_NextPart_001_01CB5DDD.FA47BBF0--

--===============1976732349==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1976732349==--
