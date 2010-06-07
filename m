From: =?ISO-8859-1?Q?Sebastian_Jeger=E5s?= <jegeras-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Building Nouveau DRM for a recent kernel
	(linux-2.6.35-rc1)
Date: Mon, 7 Jun 2010 15:18:54 +0200
Message-ID: <AANLkTilSnNIJU8d2Ftxacus2acu2X30aWG1Ni8JKs-JT@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1767620188=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Mime-version: 1.0
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============1767620188==
Content-Type: multipart/alternative; boundary=001636c923b3c106a5048870830d

--001636c923b3c106a5048870830d
Content-Type: text/plain; charset=ISO-8859-1

Hello.
I had some trouble building nouveau drm for linux-2.6.35-rc1.
I investigated a bit why it failed and noticed that the fb_info-structure
had changed slightly.

Since I do not have any previous knowledge of how the driver works, I'm not
certain if this is a proper fix, but it seems to work.
I'm curious if there's a better solution, or if my solution breaks in all
other cases.

diff --git a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
index 8e7dc1d..3943a00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fbcon.c
@@ -317,6 +317,9 @@ nouveau_fbcon_create(struct drm_device *dev,
uint32_t fb_width,
 	info->fix.mmio_len = pci_resource_len(dev->pdev, 1);

 	/* Set aperture base/size for vesafb takeover */
+
+    info->apertures = alloc_apertures(1);
+
 #if defined(__i386__) || defined(__x86_64__)
 	if (nouveau_fbcon_has_vesafb_or_efifb(dev)) {
 		/* Some NVIDIA VBIOS' are stupid and decide to put the
@@ -326,15 +329,15 @@ nouveau_fbcon_create(struct drm_device *dev,
uint32_t fb_width,
 		 * we have left is to find out lfb_base the same way
 		 * vesafb did.
 		 */
-		info->aperture_base = screen_info.lfb_base;
-		info->aperture_size = screen_info.lfb_size;
+		info->apertures->ranges->base = screen_info.lfb_base;
+		info->apertures->ranges->size = screen_info.lfb_size;
 		if (screen_info.orig_video_isVGA == VIDEO_TYPE_VLFB)
-			info->aperture_size *= 65536;
+			info->apertures->ranges->size *= 65536;
 	} else
 #endif
 	{
-		info->aperture_base = info->fix.mmio_start;
-		info->aperture_size = info->fix.mmio_len;
+		info->apertures->ranges->base = info->fix.mmio_start;
+		info->apertures->ranges->size = info->fix.mmio_len;
 	}

 	info->pixmap.size = 64*1024;

--001636c923b3c106a5048870830d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello.<br>I had some trouble building nouveau drm for linux-2.6.35-rc1.<br>=
I investigated a bit why it failed and noticed that the fb_info-structure h=
ad changed slightly.<br><br>Since I do not have any previous knowledge of h=
ow the driver works, I&#39;m not certain if this is a proper fix, but it se=
ems to work.<br>
I&#39;m curious if there&#39;s a better solution, or if my solution breaks =
in all other cases.<br><pre>diff --git a/drivers/gpu/drm/nouveau/nouveau_fb=
con.c b/drivers/gpu/drm/nouveau/nouveau_fbcon.c<br>index 8e7dc1d..3943a00 1=
00644<br>
--- a/drivers/gpu/drm/nouveau/nouveau_fbcon.c<br>+++ b/drivers/gpu/drm/nouv=
eau/nouveau_fbcon.c<br>@@ -317,6 +317,9 @@ nouveau_fbcon_create(struct drm_=
device *dev, uint32_t fb_width,<br> 	info-&gt;fix.mmio_len =3D pci_resource=
_len(dev-&gt;pdev, 1);<br>
 <br> 	/* Set aperture base/size for vesafb takeover */<br>+<br>+    info-&=
gt;apertures =3D alloc_apertures(1);<br>+<br> #if defined(__i386__) || defi=
ned(__x86_64__)<br> 	if (nouveau_fbcon_has_vesafb_or_efifb(dev)) {<br> 		/*=
 Some NVIDIA VBIOS&#39; are stupid and decide to put the<br>
@@ -326,15 +329,15 @@ nouveau_fbcon_create(struct drm_device *dev, uint32_t=
 fb_width,<br> 		 * we have left is to find out lfb_base the same way<br> 	=
	 * vesafb did.<br> 		 */<br>-		info-&gt;aperture_base =3D screen_info.lfb_=
base;<br>
-		info-&gt;aperture_size =3D screen_info.lfb_size;<br>+		info-&gt;aperture=
s-&gt;ranges-&gt;base =3D screen_info.lfb_base;<br>+		info-&gt;apertures-&g=
t;ranges-&gt;size =3D screen_info.lfb_size;<br> 		if (screen_info.orig_vide=
o_isVGA =3D=3D VIDEO_TYPE_VLFB)<br>
-			info-&gt;aperture_size *=3D 65536;<br>+			info-&gt;apertures-&gt;ranges=
-&gt;size *=3D 65536;<br> 	} else<br> #endif<br> 	{<br>-		info-&gt;aperture=
_base =3D info-&gt;fix.mmio_start;<br>-		info-&gt;aperture_size =3D info-&g=
t;fix.mmio_len;<br>
+		info-&gt;apertures-&gt;ranges-&gt;base =3D info-&gt;fix.mmio_start;<br>+=
		info-&gt;apertures-&gt;ranges-&gt;size =3D info-&gt;fix.mmio_len;<br> 	}<=
br> <br> 	info-&gt;pixmap.size =3D 64*1024;<br></pre><br>

--001636c923b3c106a5048870830d--

--===============1767620188==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1767620188==--
