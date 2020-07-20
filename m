From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH] RFC: ACPI / OSI: remove workarounds for hybrid graphics laptops
Date: Mon, 20 Jul 2020 12:17:04 +0200
Message-ID: <CACO55ttJRpjZVSATSYo8bL_BStGACMO76kO8pZ5W+2vp6Ni6xA@mail.gmail.com>
References: <20200717190547.648604-1-kherbst@redhat.com> <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
 <CACO55tvLCrqeV8MsVDbTaWP2EPAeZtfU08Kb2fVGCD6X+g3-rg@mail.gmail.com> <8ad1866d-eb61-a30c-5875-5ffbfd2e17e1@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <8ad1866d-eb61-a30c-5875-5ffbfd2e17e1@canonical.com>
Sender: linux-acpi-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: Linux ACPI Mailing List <linux-acpi@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>, Lyude Paul <lyude@redhat.com>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
List-Id: nouveau.vger.kernel.org

On Mon, Jul 20, 2020 at 3:19 AM Alex Hung <alex.hung@canonical.com> wrote:
>
> On 2020-07-19 1:50 p.m., Karol Herbst wrote:
> > On Fri, Jul 17, 2020 at 9:52 PM Alex Hung <alex.hung@canonical.com> wrote:
> >>
> >> On 2020-07-17 1:05 p.m., Karol Herbst wrote:
> >>> It's hard to figure out what systems are actually affected and right now I
> >>> don't see a good way of removing those...
> >>>
> >>> But I'd like to see thos getting removed and drivers fixed instead (which
> >>> happened at least for nouveau).
> >>>
> >>> And as mentioned before, I prefer people working on fixing issues instead
> >>> of spending time to add firmware level workarounds which are hard to know
> >>> to which systems they apply to, hard to remove and basically a big huge
> >>> pain to work with.> In the end I have no idea how to even figure out what systems are affected
> >>> and which not by this, so I have no idea how to even verify we can safely
> >>> remove this (which just means those are impossible to remove unless we risk
> >>> breaking systems, which again makes those supper annoying to deal with).
> >>>
> >>> Also from the comments it's hard to get what those bits really do. Are they
> >>> just preventing runtime pm or do the devices are powered down when booting?
> >>> I am sure it's the former, still...
> >>>
> >>> Please, don't do this again.
> >>>
> >>> For now, those workaround prevent power savings on systems those workaround
> >>> applies to, which might be any so those should get removed asap and if
> >>> new issues arrise removing those please do a proper bug report and we can
> >>> look into it and come up with a proper fix (and keep this patch out until
> >>> we resolve all of those).
> >>>
> >>> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> >>> CC: Alex Hung <alex.hung@canonical.com>
> >>> CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> >>> CC: Len Brown <lenb@kernel.org>
> >>> CC: Lyude Paul <lyude@redhat.com>
> >>> CC: linux-kernel@vger.kernel.org
> >>> CC: dri-devel@lists.freedesktop.org
> >>> CC: nouveau@lists.freedesktop.org
> >>> ---
> >>>  drivers/acpi/osi.c | 24 ------------------------
> >>>  1 file changed, 24 deletions(-)
> >>>
> >>> diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> >>> index 9f68538091384..d4405e1ca9b97 100644
> >>> --- a/drivers/acpi/osi.c
> >>> +++ b/drivers/acpi/osi.c
> >>> @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
> >>>       {"Processor Device", true},
> >>>       {"3.0 _SCP Extensions", true},
> >>>       {"Processor Aggregator Device", true},
> >>> -     /*
> >>> -      * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> >>> -      * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> >>> -      * cards will hang without RTD3 disabled.
> >>> -      *
> >>> -      * Once NVidia drivers officially support RTD3, this _OSI strings can
> >>> -      * be removed if both new and old graphics cards are supported.
> >>> -      */
> >>> -     {"Linux-Dell-Video", true},
> >>> -     /*
> >>> -      * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
> >>> -      * audio device which is turned off for power-saving in Windows OS.
> >>> -      * This power management feature observed on some Lenovo Thinkpad
> >>> -      * systems which will not be able to output audio via HDMI without
> >>> -      * a BIOS workaround.
> >>> -      */
> >>> -     {"Linux-Lenovo-NV-HDMI-Audio", true},
> >>> -     /*
> >>> -      * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
> >>> -      * output video directly to external monitors on HP Inc. mobile
> >>> -      * workstations as Nvidia and AMD VGA drivers provide limited
> >>> -      * hybrid graphics supports.
> >>> -      */
> >>> -     {"Linux-HPI-Hybrid-Graphics", true},
> >>>  };
> >>>
> >>>  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
> >>>
> >>
> >> The changes were discussed and tested a while ago, and no crashes were
> >> observed. Thanks for solving PM issues in nouveau.
> >>
> >> Acked-by: Alex Hung <alex.hung@canonical.com>
> >>
> >
> > By any chance, do you have a list of systems implementing those workarounds?
> >
>
> I don't keep a list but the workaround, in theory, should only apply to
> the systems with the specific nvidia hardware.
>
> I reminded OEMs and ODMs that these _OSI strings were temporary
> solutions, and highlighted we were going to remove them after our
> discussion last year. If they were paying attentions recent systems
> shouldn't have these _OSI strings.
>

Right.. but I am actually wondering because I never saw those strings
in the wild or not on the Dell and Lenovo systems I was testing on. So
I think we might want to ask the vendors themselves and verify on
those systems.

> --
> Cheers,
> Alex Hung
>
