From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v7] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Fri, 20 Mar 2020 17:19:31 -0500
Message-ID: <20200320221931.GA23783@google.com>
References: <20200310192627.437947-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200310192627.437947-1-kherbst@redhat.com>
Sender: linux-pci-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@intel.com>, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 10, 2020 at 08:26:27PM +0100, Karol Herbst wrote:
> Fixes the infamous 'runtime PM' bug many users are facing on Laptops with
> Nvidia Pascal GPUs by skipping said PCI power state changes on the GPU.
> 
> Depending on the used kernel there might be messages like those in demsg:
> 
> "nouveau 0000:01:00.0: Refused to change power state, currently in D3"
> "nouveau 0000:01:00.0: can't change power state from D3cold to D0 (config
> space inaccessible)"
> followed by backtraces of kernel crashes or timeouts within nouveau.
> 
> It's still unkown why this issue exists, but this is a reliable workaround
> and solves a very annoying issue for user having to choose between a
> crashing kernel or higher power consumption of their Laptops.

Thanks for the bugzilla link.  The bugzilla mentions lots of mailing
list discussion.  Can you include links to some of that?

IIUC this basically just turns off PCI power management for the GPU.
Can you do that with something like the following?  I don't know
anything about DRM, so I don't know where you could save the pm_cap,
but I'm sure the driver could keep it somewhere.


diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index b65ae817eabf..2ad825e8891c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -618,6 +618,23 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	kfree(drm);
 }
 
+static void quirk_broken_nv_runpm(struct drm_device *drm_dev)
+{
+	struct pci_dev *pdev = drm_dev->pdev;
+	struct pci_dev *bridge = pci_upstream_bridge(pdev);
+
+	if (!bridge || bridge->vendor != PCI_VENDOR_ID_INTEL)
+		return;
+
+	switch (bridge->device) {
+	case 0x1901:
+		STASH->pm_cap = pdev->pm_cap;
+		pdev->pm_cap = 0;
+		NV_INFO(drm_dev, "Disabling PCI power management to avoid bug\n");
+		break;
+	}
+}
+
 static int nouveau_drm_probe(struct pci_dev *pdev,
 			     const struct pci_device_id *pent)
 {
@@ -699,6 +716,7 @@ static int nouveau_drm_probe(struct pci_dev *pdev,
 	if (ret)
 		goto fail_drm_dev_init;
 
+	quirk_broken_nv_runpm(drm_dev);
 	return 0;
 
 fail_drm_dev_init:
@@ -735,6 +753,9 @@ nouveau_drm_remove(struct pci_dev *pdev)
 {
 	struct drm_device *dev = pci_get_drvdata(pdev);
 
+	/* If we disabled PCI power management, restore it */
+	if (STASH->pm_cap)
+		pdev->pm_cap = STASH->pm_cap;
 	nouveau_drm_device_remove(dev);
 	pci_disable_device(pdev);
 }
