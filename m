From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] RFC: ACPI / OSI: remove workarounds for
 hybrid graphics laptops
Date: Sun, 19 Jul 2020 21:50:56 +0200
Message-ID: <CACO55tvLCrqeV8MsVDbTaWP2EPAeZtfU08Kb2fVGCD6X+g3-rg@mail.gmail.com>
References: <20200717190547.648604-1-kherbst@redhat.com>
 <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Linux ACPI Mailing List <linux-acpi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 17, 2020 at 9:52 PM Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>
> On 2020-07-17 1:05 p.m., Karol Herbst wrote:
> > It's hard to figure out what systems are actually affected and right now I
> > don't see a good way of removing those...
> >
> > But I'd like to see thos getting removed and drivers fixed instead (which
> > happened at least for nouveau).
> >
> > And as mentioned before, I prefer people working on fixing issues instead
> > of spending time to add firmware level workarounds which are hard to know
> > to which systems they apply to, hard to remove and basically a big huge
> > pain to work with.> In the end I have no idea how to even figure out what systems are affected
> > and which not by this, so I have no idea how to even verify we can safely
> > remove this (which just means those are impossible to remove unless we risk
> > breaking systems, which again makes those supper annoying to deal with).
> >
> > Also from the comments it's hard to get what those bits really do. Are they
> > just preventing runtime pm or do the devices are powered down when booting?
> > I am sure it's the former, still...
> >
> > Please, don't do this again.
> >
> > For now, those workaround prevent power savings on systems those workaround
> > applies to, which might be any so those should get removed asap and if
> > new issues arrise removing those please do a proper bug report and we can
> > look into it and come up with a proper fix (and keep this patch out until
> > we resolve all of those).
> >
> > Signed-off-by: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > CC: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
> > CC: "Rafael J. Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>
> > CC: Len Brown <lenb-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
> > CC: Lyude Paul <lyude-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> > CC: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> > CC: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > CC: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> > ---
> >  drivers/acpi/osi.c | 24 ------------------------
> >  1 file changed, 24 deletions(-)
> >
> > diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> > index 9f68538091384..d4405e1ca9b97 100644
> > --- a/drivers/acpi/osi.c
> > +++ b/drivers/acpi/osi.c
> > @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
> >       {"Processor Device", true},
> >       {"3.0 _SCP Extensions", true},
> >       {"Processor Aggregator Device", true},
> > -     /*
> > -      * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> > -      * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> > -      * cards will hang without RTD3 disabled.
> > -      *
> > -      * Once NVidia drivers officially support RTD3, this _OSI strings can
> > -      * be removed if both new and old graphics cards are supported.
> > -      */
> > -     {"Linux-Dell-Video", true},
> > -     /*
> > -      * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
> > -      * audio device which is turned off for power-saving in Windows OS.
> > -      * This power management feature observed on some Lenovo Thinkpad
> > -      * systems which will not be able to output audio via HDMI without
> > -      * a BIOS workaround.
> > -      */
> > -     {"Linux-Lenovo-NV-HDMI-Audio", true},
> > -     /*
> > -      * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
> > -      * output video directly to external monitors on HP Inc. mobile
> > -      * workstations as Nvidia and AMD VGA drivers provide limited
> > -      * hybrid graphics supports.
> > -      */
> > -     {"Linux-HPI-Hybrid-Graphics", true},
> >  };
> >
> >  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
> >
>
> The changes were discussed and tested a while ago, and no crashes were
> observed. Thanks for solving PM issues in nouveau.
>
> Acked-by: Alex Hung <alex.hung-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
>

By any chance, do you have a list of systems implementing those workarounds?
