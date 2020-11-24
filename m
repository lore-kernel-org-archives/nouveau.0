From: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH 00/15] drm: Move struct drm_device.pdev to legacy
Date: Tue, 24 Nov 2020 22:49:41 +0100
Message-ID: <20201124214941.GD93095@ravnborg.org>
References: <20201124113824.19994-1-tzimmermann@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20201124113824.19994-1-tzimmermann-l3A5Bk7waGM@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Thomas Zimmermann <tzimmermann-l3A5Bk7waGM@public.gmane.org>
Cc: airlied-cv59FeDIM0c@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, virtualization-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, daniel-/w4YWyX8dFk@public.gmane.org, spice-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, intel-gvt-dev-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi Thomas.

Nice clean-up series - quite an effort to move one member to deprecated!

I have read through most of the patches. I left a few notes in my
replies but nothing buggy. Just nitpicks.


On Tue, Nov 24, 2020 at 12:38:09PM +0100, Thomas Zimmermann wrote:
> The pdev field in struct drm_device points to a PCI device structure and
> goes back to UMS-only days when all DRM drivers where for PCI devices.
> Meanwhile we also support USB, SPI and platform devices. Each of those
> uses the generic device stored in struct drm_device.dev.
> 
> To reduce duplications and remove the special case of PCI, this patchset
> converts all modesetting drivers from pdev to dev and makes pdev a field
> for legacy UMS drivers.
> 
> For PCI devices, the pointer in struct drm_device.dev can be upcasted to
> struct pci_device; or tested for PCI with dev_is_pci(). In several places
> the code can use the dev field directly.
> 
> After converting all drivers and the DRM core, the pdev fields becomes
> only relevant for legacy drivers. In a later patchset, we may want to
> convert these as well and remove pdev entirely.
> 
> The patchset touches many files, but the individual changes are mostly
> trivial. I suggest to merge each driver's patch through the respective
> tree and later the rest through drm-misc-next.
> 
> Thomas Zimmermann (15):
>   drm/amdgpu: Remove references to struct drm_device.pdev
>   drm/ast: Remove references to struct drm_device.pdev
>   drm/bochs: Remove references to struct drm_device.pdev
>   drm/cirrus: Remove references to struct drm_device.pdev
>   drm/gma500: Remove references to struct drm_device.pdev
>   drm/hibmc: Remove references to struct drm_device.pdev
>   drm/mgag200: Remove references to struct drm_device.pdev
>   drm/qxl: Remove references to struct drm_device.pdev
>   drm/vboxvideo: Remove references to struct drm_device.pdev
>   drm/virtgpu: Remove references to struct drm_device.pdev
>   drm/vmwgfx: Remove references to struct drm_device.pdev
>   drm: Upcast struct drm_device.dev to struct pci_device; replace pdev
All above are:
Acked-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>

>   drm/nouveau: Remove references to struct drm_device.pdev
I lost my confidence in my reading of this code.

>   drm/i915: Remove references to struct drm_device.pdev
>   drm/radeon: Remove references to struct drm_device.pdev
I did not look at these at all. I hope someone else find time to do so.

	Sam
