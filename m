From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Fri, 23 Aug 2013 23:20:42 +0300
Message-ID: <20130823202042.GS2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="7gGkHNMELEOhSGF6"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <5215B9E8.5080108@canonical.com>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Maarten Lankhorst <maarten.lankhorst@canonical.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org


--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 22, 2013 at 09:12:40AM +0200, Maarten Lankhorst wrote:
> Op 22-08-13 02:10, Ilia Mirkin schreef:
> > The code expects non-VRAM mem nodes to have a pages list. If that's n=
ot
> > set, it will do a null deref down the line. Warn on that condition an=
d
> > return an error.
> >
> > See https://bugs.freedesktop.org/show_bug.cgi?id=3D64774
> >
> > Reported-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
> > Tested-by: Pasi K=E4rkk=E4inen <pasik@iki.fi>
> > Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> > Cc: <stable@vger.kernel.org> # 3.8+
> > ---
> >
> > I don't exactly understand what's going on, but this is just a
> > straightforward way to avoid a null deref that you see happens in the
> > bug. I haven't figured out the root cause of this, but it's getting
> > well into the "I have no idea how TTM works" space. However this seem=
s
> > like a bit of defensive programming -- nouveau_vm_map_sg will pass
> > node->pages as a list down, which will be dereferenced by
> > nvc0_vm_map_sg. Perhaps the other arguments should make that
> > dereferencing not happen, but it definitely was happening here, as yo=
u
> > can see in the bug.
> >
> > Ben/Maarten, I'll let you judge whether this check is appropriate,
> > since like I hope I was able to convey above, I'm just not really sur=
e :)
> Not it really isn't appropriate..
>=20
> You'd have to call call nouveau_vm_map_sg_table instead, the only place=
 that doesn't handle that correctly
> is where it's not expected to be called.
>=20
> Here, have a completely untested patch to fix things...
>=20

Maarten: I've been testing this stuff with Linux 3.10.x, so I had to modi=
fy the patch a bit to make it apply there..=20
I've attached the modified copy that applies to 3.10.9, hopefully I did t=
he backport correctly.

With Linux 3.10.9 and the patch applied the kernel doesn't crash anymore,=
 and I get this error in dmesg:

[   76.105643] nouveau W[     DRM] Trying to create a fb in vram with val=
id_domains=3D00000004

Does that help?=20


-- Pasi


--7gGkHNMELEOhSGF6
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="nouveau_test_fix_null_deref_v3.10.patch"

--- linux-3.10.9-100.fc18.x86_64/drivers/gpu/drm/nouveau/nouveau_display.c.orig	2013-07-01 01:13:29.000000000 +0300
+++ linux-3.10.9-100.fc18.x86_64/drivers/gpu/drm/nouveau/nouveau_display.c	2013-08-23 19:56:52.038234281 +0300
@@ -137,18 +137,31 @@
 {
 	struct nouveau_framebuffer *nouveau_fb;
 	struct drm_gem_object *gem;
+	struct nouveau_bo *nvbo;
 	int ret;
 
 	gem = drm_gem_object_lookup(dev, file_priv, mode_cmd->handles[0]);
 	if (!gem)
 		return ERR_PTR(-ENOENT);
 
+	nvbo = nouveau_gem_object(gem);
+	if (!(nvbo->valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)) {
+		nv_warn(nouveau_drm(dev), "Trying to create a fb in vram with"
+			" valid_domains=%08x\n", nvbo->valid_domains);
+		ret = -EINVAL;
+		drm_gem_object_unreference(gem);
+		return ERR_PTR(ret);
+	}
+
 	nouveau_fb = kzalloc(sizeof(struct nouveau_framebuffer), GFP_KERNEL);
-	if (!nouveau_fb)
+	if (!nouveau_fb) {
+		drm_gem_object_unreference(gem);
 		return ERR_PTR(-ENOMEM);
+	}
 
-	ret = nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nouveau_gem_object(gem));
+	ret = nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nvbo);
 	if (ret) {
+		kfree(nouveau_fb);
 		drm_gem_object_unreference(gem);
 		return ERR_PTR(ret);
 	}

--7gGkHNMELEOhSGF6
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--7gGkHNMELEOhSGF6--
