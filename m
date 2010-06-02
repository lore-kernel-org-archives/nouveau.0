From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] nv: improve KMS detection
Date: Thu, 03 Jun 2010 08:19:44 +1000
Message-ID: <1275517184.2328.2.camel@nisroch>
References: <20100523194645.GA15846@joi.lan> <1274654223.7344.0.camel@nisroch>
	<20100528184517.GA12408@soprano.nvidia.com>
	<20100602162047.GA2973@joi.lan>
	<20100602190752.GA17877@soprano.nvidia.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-xpJUGPqj+aYQDWeupOeb"
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20100602190752.GA17877-J3EY2hv0KmgMOYszX5p1ytBPR1lH4CV8@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Aaron Plattner <aplattner-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Christopher James Halse Rogers <raof-GeWIH/nMZzLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org


--=-xpJUGPqj+aYQDWeupOeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2010-06-02 at 12:07 -0700, Aaron Plattner wrote:
> On Wed, Jun 02, 2010 at 09:20:47AM -0700, Marcin Slusarz wrote:
> > On Fri, May 28, 2010 at 11:45:17AM -0700, Aaron Plattner wrote:
> > > On Sun, May 23, 2010 at 03:37:03PM -0700, Ben Skeggs wrote:
> > > > On Sun, 2010-05-23 at 21:46 +0200, Marcin Slusarz wrote:
> > > > > 1) DRICreatePCIBusID belongs to xserver dri module, so when it's
> > > > >    unavailable we can't format string for drmCheckModesettingSupported.
> > > > >    (This situation happened to me with KMS enabled and dri module moved
> > > > >    somewhere else by Gentoo's "eselect opengl set nvidia" switcher)
> > > > >    Open code DRICreatePCIBusID to drop dri dependency.
> > > > > 2) Once we dropped dependency on dri module (which linked to libdrm),
> > > > >    we have to link directly to libdrm.
> > > > An alternative, which we use in Fedora for nv/vesa is to use
> > > > pci_device_has_kernel_driver() from libpciaccess.
> > > 
> > > That seems better than open-coding it, and avoids a dependency on libdrm
> > > which is nice.
> > 
> > Well, you are trading one dependency for other. It doesn't really matter...
> > Ben, are you going to send your patch to Aaron?
> 
> Yeah, but the server already has a dependency on libpciaccess, while the
> libdrm dependency is just for a module, and I think might be optional (I
> haven't kept up with the dri2 patches on the list).
Exactly.  Patch is attached, but it was readily available in Fedora CVS
anyway.

Ben.
> 
> -- Aaron


--=-xpJUGPqj+aYQDWeupOeb
Content-Disposition: attachment; filename="nv-refuse-kms.patch"
Content-Type: text/x-patch; name="nv-refuse-kms.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit

From ee544c2b11ab327abab6e205425e6eafe961de2e Mon Sep 17 00:00:00 2001
From: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Date: Fri, 28 Aug 2009 09:43:16 +1000
Subject: [PATCH] nv: refuse to load if there's a kernel driver bound to the device already

---
 src/nv_driver.c |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/src/nv_driver.c b/src/nv_driver.c
index a7cf2dc..6f7fc0e 100644
--- a/src/nv_driver.c
+++ b/src/nv_driver.c
@@ -780,6 +780,12 @@ NVPciProbe(DriverPtr drv, int entity, struct pci_device *dev, intptr_t data)
                       NVGetPCIXpressChip(dev) : dev->vendor_id << 16 | dev->device_id;
     const char *name = xf86TokenToString(NVKnownChipsets, id);
 
+    if (pci_device_has_kernel_driver(dev)) {
+	ErrorF("The PCI device has a kernel module claiming it.\n");
+	ErrorF("This driver cannot operate until it has been unloaded\n");
+	return FALSE;
+    }
+
     if(dev->vendor_id == PCI_VENDOR_NVIDIA && !name &&
        !NVIsSupported(id) && !NVIsG80(id)) {
         /* See if pci.ids knows what the heck this thing is */
-- 
1.6.4


--=-xpJUGPqj+aYQDWeupOeb
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--=-xpJUGPqj+aYQDWeupOeb--
