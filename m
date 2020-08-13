From: Alex Deucher <alexdeucher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Nouveau] [PATCH 1/4] drm: retrieve EDID via ACPI _DDC method
Date: Wed, 12 Aug 2020 23:05:20 -0400
Message-ID: <CADnq5_Mzgb=KsqCzmRc_wc+NB_a7OqkEzfV-upJQ=77B7zcpgA@mail.gmail.com>
References: <20200727205357.27839-1-ddadap@nvidia.com>
 <20200727205357.27839-2-ddadap@nvidia.com>
 <20200808221114.5rfnys76ozoj62wv@wunner.de>
 <3aa06548-b7b4-6753-7169-88e9b2d80acc@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <3aa06548-b7b4-6753-7169-88e9b2d80acc-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/amd-gfx>
List-Post: <mailto:amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/amd-gfx>,
 <mailto:amd-gfx-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "amd-gfx" <amd-gfx-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Chunming Zhou <david1.zhou-5C7GfCeVMHo@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Joonas Lahtinen <joonas.lahtinen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Jani Nikula <jani.nikula-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, Lukas Wunner <lukas-JFq808J9C/izQB+pC5nmwQ@public.gmane.org>, amd-gfx list <amd-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Rodrigo Vivi <rodrigo.vivi-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, "Deucher,
 Alexander" <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Christian Koenig <christian.koenig-5C7GfCeVMHo@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9/egYHeGw8Jk@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Wed, Aug 12, 2020 at 10:31 PM Daniel Dadap <ddadap-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>
> Thanks, Lukas. I've incorporated your feedback into my local tree, but
> will wait for additional feedback from the individual DRM driver
> maintainers before sending out a series v2.
>
> On 8/8/20 5:11 PM, Lukas Wunner wrote:
> > On Mon, Jul 27, 2020 at 03:53:54PM -0500, Daniel Dadap wrote:
> >> +             for (i = 0; i < num_dod_entries; i++) {
> >> +                     if (adr == dod_entries[i]) {
> >> +                             ret = do_acpi_ddc(child->handle);
> >> +
> >> +                             if (ret != NULL)
> >> +                                     goto done;
> > I guess ideally we'd want to correlate the display objects with
> > drm_connectors or at least constrain the search to Display Type
> > "Internal/Integrated Digital Flat Panel" instead of picking the
> > first EDID found.  Otherwise we might erroneously use the DDC
> > for an externally attached display.
>
>
> Yes, we'd definitely need a way to do this if this functionality ever
> needs to be extended to systems with more than one _DDC method.
> Unfortunately, this will be much easier said than done, since I'm not
> aware of any way to reliably do map _DOD entries to connectors in a GPU
> driver, especially when we're talking about possibly correlating
> connectors on multiple GPUs which mux to the same internal display or
> external connector. All systems which I am aware of that implement ACPI
> _DDC do so for a single internal panel. I don't believe there's any
> reason to ever retrieve an EDID via ACPI _DDC for an external panel, but
> a hypothetical design with multiple internal panels, more than one of
> which needs to retrieve an EDID via ACPI _DDC, would certainly be
> problematic.
>
>
> On at least the system I'm working with for the various switcheroo and
> platform-x86 driver patches I've recently sent off, the dGPU has an ACPI
> _DOD table and one _DDC method corresponding to one of the _DOD entries,
> but the iGPU has neither a _DOD table nor a _DDC method. Either GPU can
> be connected to the internal panel via the dynamically switchable mux,
> and the internal panel's EDID is available via _DDC to allow a
> disconnected GPU to read the EDID. Since only the DGPU has _DOD and
> _DDC, and there's no obvious way to associate connectors on the iGPU
> with connectors on the dGPU, I've implemented the ACPI _DDC EDID
> retrieval with the "first available" implementation you see here. I'm
> open to other ideas if you have them, but didn't see a good way to
> search for the "right" _DDC implementation should there be more than one.
>
>
> As for preventing the ACPI EDID retrieval from being used for external
> panels, I've done this in the individual DRM drivers that call into the
> new drm_edid_acpi() API since it seemed that each DRM driver had its own
> way of distinguishing display connector types. If there's a good way to
> filter for internal panels in DRM core, I'd be happy to do that instead.

I can double check with our ACPI and vbios teams, but I'm not sure
that we ever used the _DDC method on any AMD platforms.  Even if we
did, the driver is still able to get the integrated panel's mode info
via other means.  In general, external connectors would always get the
EDID via i2c or aux.  The only use case we ever had to hardcoding an
EDID was for some really old server chips so they would always think
something was connected if you wanted to attach a crash cart.  That
EDID was stored in the vbios, not ACPI.

As for enumerating which displays were muxed or not and the local
mappings to acpi ids, etc., we had a whole set of ATPX methods to do
that if anyone is interested:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/amd/include/amd_acpi.h

Alex
