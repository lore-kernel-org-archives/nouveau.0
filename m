From: Pasi =?iso-8859-1?Q?K=E4rkk=E4inen?= <pasik@iki.fi>
Subject: Re: [PATCH] drm/nouveau: avoid null deref on bad arguments to
	nouveau_vma_getmap
Date: Tue, 3 Sep 2013 20:58:28 +0300
Message-ID: <20130903175828.GJ2924@reaktio.net>
References: <1377130214-17522-1-git-send-email-imirkin@alum.mit.edu>
	<5215B9E8.5080108@canonical.com>
	<20130823202042.GS2924@reaktio.net>
	<20130828062948.GE2924@reaktio.net>
	<521DAA4F.8030503@canonical.com>
	<20130903142006.GH2924@reaktio.net>
	<5225F390.3060804@canonical.com>
	<20130903144848.GI2924@reaktio.net>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="KuLpqunXa7jZSBt+"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
Content-Disposition: inline
In-Reply-To: <20130903144848.GI2924@reaktio.net>
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
Cc: nouveau@lists.freedesktop.org, Maarten Lankhorst <maarten.lankhorst@ubuntu.com>, Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2013 at 05:48:48PM +0300, Pasi K=E4rkk=E4inen wrote:
> > >>>>> Not it really isn't appropriate..
> > >>>>>
> > >>>>> You'd have to call call nouveau_vm_map_sg_table instead, the on=
ly place that doesn't handle that correctly
> > >>>>> is where it's not expected to be called.
> > >>>>>
> > >>>>> Here, have a completely untested patch to fix things...
> > >>>>>
> > >>>> Maarten: I've been testing this stuff with Linux 3.10.x, so I ha=
d to modify the patch a bit to make it apply there..=20
> > >>>> I've attached the modified copy that applies to 3.10.9, hopefull=
y I did the backport correctly.
> > >>>>
> > >>>> With Linux 3.10.9 and the patch applied the kernel doesn't crash=
 anymore, and I get this error in dmesg:
> > >>>>
> > >>>> [   76.105643] nouveau W[     DRM] Trying to create a fb in vram=
 with valid_domains=3D00000004
> > >>>>
> > >>>> Does that help?=20
> > >>>>
> > >>> Any comments?=20
> > >>>
> > >>> Maarten's patch works for me, I get that warning instead of a ker=
nel crash,
> > >>> but it's also a bigger change that doesn't apply to older kernels=
 as-is.=20
> > >>>
> > >>> Ilia's original patch in this thread can be applied to older kern=
els as-is,
> > >>> and it also prevents the kernel crash from happening.
> > >>>
> > >>> Should we get both applied, so Ilia's patch can be CC'd to stable=
 ?=20
> > >>>
> > >> You haven't understood the root cause then. You're trying to move =
an IMPORTED dma-buf into VRAM.
> > >> Doing so would seem to work, but at that point it's no longer a dm=
a-buf so changes done by the exporter
> > >> would not show up in nouveau because they no longer refer to the s=
ame piece of memory.
> > >>
> > > Yes, that's true, I don't understand the root cause.=20
> > > That's mostly because I'm not familiar with the nouveau code/intern=
als.=20
> > >
> > >
> > >> Failing is the only right option here.
> > >>
> > > Sorry but I'm not sure I understand that correctly.. what exactly d=
o you suggest? What should fail?
> > >
> > >
> > > Because I'm not familiar with the code (yet) understanding and find=
ing the root cause
> > > will take time for me.. that's why I was suggesting to meanwhile ap=
ply Ilia's very simple patch
> > > from this thread which actually prevents the hard kernel crash from=
 happening, because it seems=20
> > > like an unharmful fix to have to protect against this kind of bugs =
(the root cause) ?
> > > Or is that unacceptable?=20
> > >
> > > (To recap: The kernel crash happens very often when trying to use t=
he nouveau adapter in Optimus mode, with all kernels at least 3.8+, and i=
t's very annoying that your laptop crashes when trying to enable a nouvea=
u output. So Ilia's patch doesn't make the driver working properly, but a=
t least it prevents the hard kernel crash from happening. The crash bug i=
s in many kernel versions, including the long-term v3.10 tree. I've had t=
he crash happening with 3.8.x, 3.9.x and 3.10.x)
> >
> > The fix probably requires commit fdfb8332651db7a280851dfccfc4f0cff4bc=
d052 to apply cleanly "drm/nouveau: fix some error-path leaks in fbcon ha=
ndling code"
> >=20
>=20
> So what you mean is to use fdfb8332651db7a280851dfccfc4f0cff4bcd052 and=
 your patch from this thread?=20
> and skip Ilia's patch?
>=20

So I tested with Linux 3.10.10. I had to apply these two patches first:

1e2bd5f53b6282e711e9f074765911868f8e7dc1 drm/nouveau: fixup fbcon failure=
 paths
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/patch/?id=3D=
1e2bd5f53b6282e711e9f074765911868f8e7dc1

fdfb8332651db7a280851dfccfc4f0cff4bcd052 drm/nouveau: fix some error-path=
 leaks in fbcon handling code
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/patch/?id=3D=
fdfb8332651db7a280851dfccfc4f0cff4bcd052

And with those applied I was able to apply Maarten's patch cleanly (also =
attached to this email).

It's worth noting that I'm able to reproduce the kernel crash bug with Fe=
dora 18 (which has xorg-1.13),
but I'm not able to reproduce it with Fedora 19 (which has xorg-1.14). Bo=
th running the same kernel.
Optimus enabled in BIOS on Lenovo T430 laptop. Nvidia GF108 Discreet GPU =
with Intel integrated GPU.

Maarten's patch fixes the kernel crash problem, and produces a warning me=
ssage instead in dmesg.
You can add my Tested-By to the patch, assuming Maarten's patch is going =
to be merged?=20

Thanks,

-- Pasi


--KuLpqunXa7jZSBt+
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="nouveau_test_fix_null_deref.patch"

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -138,17 +143,26 @@ nouveau_user_framebuffer_create(struct drm_device *dev,
 {
 	struct nouveau_framebuffer *nouveau_fb;
 	struct drm_gem_object *gem;
+	struct nouveau_bo *nvbo;
 	int ret = -ENOMEM;
 
 	gem = drm_gem_object_lookup(dev, file_priv, mode_cmd->handles[0]);
 	if (!gem)
 		return ERR_PTR(-ENOENT);
 
+	nvbo = nouveau_gem_object(gem);
+	if (!(nvbo->valid_domains & NOUVEAU_GEM_DOMAIN_VRAM)) {
+		nv_warn(nouveau_drm(dev), "Trying to create a fb in vram with"
+			" valid_domains=%08x\n", nvbo->valid_domains);
+		ret = -EINVAL;
+		goto err_unref;
+	}
+
 	nouveau_fb = kzalloc(sizeof(struct nouveau_framebuffer), GFP_KERNEL);
 	if (!nouveau_fb)
 		goto err_unref;
 
-	ret = nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nouveau_gem_object(gem));
+	ret = nouveau_framebuffer_init(dev, nouveau_fb, mode_cmd, nvbo);
 	if (ret)
 		goto err;
 


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
http://lists.freedesktop.org/mailman/listinfo/dri-devel

--KuLpqunXa7jZSBt+--
