From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [PATCH 3/7] Revert "ACPI / OSI: Add OEM _OSI strings to disable
 NVidia RTD3"
Date: Thu, 15 Aug 2019 06:44:06 +0200
Message-ID: <CACO55ttcXhod940t_G1ty74tU7vT2K1tShwqAwhcy0Eu2TYGqA@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com> <20190814213118.28473-4-kherbst@redhat.com>
 <CAJ=jquaVcWisQ3Qw-_GMktcOq4zqFmeYXztfwNAVKZJO=_+yLA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJ=jquaVcWisQ3Qw-_GMktcOq4zqFmeYXztfwNAVKZJO=_+yLA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Alex Hung <alex.hung@canonical.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Dave Airlie <airlied@redhat.com>, Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 15, 2019 at 1:35 AM Alex Hung <alex.hung@canonical.com> wrote:
>
> On Wed, Aug 14, 2019 at 3:31 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > This reverts commit 9251a71db62ca9cc7e7cf364218610b0f018c291.
> >
> > This was never discussed with anybody Nouveau related and we would have NACKed
> > this change immediately.
> >
> > We have a better workaround, which makes it actually work with Nouveau. No idea
> > why the comment mentions the Nvidia driver and assumes it gives any weight to
> > the reasoning.... we don't care about out of tree drivers.
> >
> > Nouveau does support RTD3, but we had some issues with that. And we even have
> > a better fix for this issue. Also, can we _please_ do it in a way worthy of an
> > upstream community the next time?
> >
> > If some distribution feels like they have to please companies not wanting to
> > be part of the linux community, please do so downstream and don't try to push
> > something like this upstream.
>
> Hi Karol,
>
> A lot of appreciation for your hard-work on this issue, but unfriendly
> comments aren't necessary. At the time this was discussed with
> hardware vendors and platform vendors and it worked for many systems
> and benefit for many people buying these platforms. Last but not
> least, I do appreciate better fixes and want to retire the hacks too.
>

sorry if that sounded too harsh, but the issue is not that it helped,
the issue is, that nobody talked with us about that. And those three
commits also sounded like they were mainly targeted against the Nvidia
driver (and please correct me if I am wrong here).

The situation would be completely different if we would have talked
about all this earlier (and I wouldn't get annoyed by all of this in
the first place).

I am well aware this is a super painful issue for a lot of users, but
even then disabling RTD3 (for a limited amount of hardware) inside
nouveau would be the only acceptable way to disable it.

I don't see how pushing vendors to add some firmware code to disable
certain features  helps in any way, when there is a fast and easy way
to disable it and wouldn't draw resources away from actually fixing
it.

> I am going to notify hardware owners to test these patches on the
> original intended systems, and will report whether there are
> regressions.
>
>
> >
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > CC: Alex Hung <alex.hung@canonical.com>
> > CC: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > CC: Dave Airlie <airlied@redhat.com>
> > CC: Lyude Paul <lyude@redhat.com>
> > CC: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  drivers/acpi/osi.c | 9 ---------
> >  1 file changed, 9 deletions(-)
> >
> > diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> > index 56cc95b6b724..f5d559a2ff14 100644
> > --- a/drivers/acpi/osi.c
> > +++ b/drivers/acpi/osi.c
> > @@ -44,15 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
> >         {"Processor Device", true},
> >         {"3.0 _SCP Extensions", true},
> >         {"Processor Aggregator Device", true},
> > -       /*
> > -        * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> > -        * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> > -        * cards will hang without RTD3 disabled.
> > -        *
> > -        * Once NVidia drivers officially support RTD3, this _OSI strings can
> > -        * be removed if both new and old graphics cards are supported.
> > -        */
> > -       {"Linux-Dell-Video", true},
> >  };
> >
> >  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
> > --
> > 2.21.0
> >
>
>
> --
> Cheers,
> Alex Hung
