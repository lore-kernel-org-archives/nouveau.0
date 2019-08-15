From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Thu, 15 Aug 2019 10:37:05 -0400
Message-ID: <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com> <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM> <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: Mario.Limonciello@dell.com, nouveau <nouveau@lists.freedesktop.org>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux ACPI Mailing List <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Aug 15, 2019 at 10:25 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Thu, Aug 15, 2019 at 4:20 PM <Mario.Limonciello@dell.com> wrote:
> >
> > > > There are definitely going to be regressions on machines in the field with the
> > > > in tree drivers by reverting this.  I think we should have an answer for all of
> > > those
> > > > before this revert is accepted.
> > > >
> > > > Regarding systems with Intel+NVIDIA, we'll have to work with partners to
> > > collect
> > > > some information on the impact of reverting this.
> > > >
> > > > When this is used on a system with Intel+AMD the ASL configures AMD GPU to
> > > use
> > > > "Hybrid Graphics" when on Windows and "Power Express" and "Switchable
> > > Graphics"
> > > > when on Linux.
> > >
> > > and what's exactly the difference between those? And what's the actual
> > > issue here?
> >
> > DP/HDMI is not detected unless plugged in at bootup.  It's due to missing HPD
> > events.
> >
>
> afaik Lyude was working on fixing all that, at least for some drivers.
> If there is something wrong, we still should fix the drivers, not
> adding ACPI workarounds.
>
> Alex: do you know if there are remaining issues regarding that with amdgpu?

There was an issue with hpd events not making it to the audio side
when things were powered down that was fixed with this patch set:
https://patchwork.freedesktop.org/patch/316793/
Those patches depended on a bunch of alsa changes as well which may
have not been available in the distro used for a particular OEM
program.

>
> > >
> > > We already have the PRIME offloading in place and if that's not
> > > enough, we should work on extending it, not adding some ACPI based
> > > workarounds, because that's exactly how that looks like.
> > >
> > > Also, was this discussed with anybody involved in the drm subsystem?
> > >
> > > >
> > > > I feel we need a knob and/or DMI detection to affect the changes that the ASL
> > > > normally performs.
> > >
> > > Why do we have to do that on a firmware level at all?
> >
> > Folks from AMD Graphics team recommended this approach.  From their perspective
> > it's not a workaround.  They view this as a different architecture for AMD graphics driver on
> > Windows and AMD graphics w/ amdgpu driver.  They have different ASL paths used for
> > each.
>
> @alex: is this true?

I'm not familiar with this patches in particular, but I know we've
done things with OEM programs to support Linux on platforms where
Linux support is lacking for in new features for the target distros.
E.g., when the first hybrid graphics laptops were coming out, Linux
didn't support it too well or at all depending on the timing, so the
bios exposed power express which was working well at the time if the
OS told ACPI it was Linux.

Alex
