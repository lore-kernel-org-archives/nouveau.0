From: <Mario.Limonciello@dell.com>
Subject: RE: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Thu, 15 Aug 2019 16:19:52 +0000
Message-ID: <8724585e50004bc8b6f310587555f4a1@AUSX13MPC101.AMER.DELL.COM>
References: <20190814213118.28473-1-kherbst@redhat.com>
        <20190814213118.28473-2-kherbst@redhat.com>
        <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
        <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
        <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
        <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
        <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
        <CADnq5_Nv6tsW0J20td5rQSLq048HtTcw1b4c25jP6ZR6XWZ-eA@mail.gmail.com>
 <s5ho90qa34m.wl-tiwai@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <s5ho90qa34m.wl-tiwai@suse.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: tiwai@suse.de, alexdeucher@gmail.com
Cc: kherbst@redhat.com, nouveau@lists.freedesktop.org, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-acpi@vger.kernel.org, alex.hung@canonical.com, bskeggs@redhat.com, airlied@redhat.com
List-Id: nouveau.vger.kernel.org

> -----Original Message-----
> From: Takashi Iwai <tiwai@suse.de>
> Sent: Thursday, August 15, 2019 9:57 AM
> To: Alex Deucher
> Cc: Karol Herbst; Limonciello, Mario; nouveau; Rafael J . Wysocki; LKML; =
dri-devel;
> Linux ACPI Mailing List; Alex Hung; Ben Skeggs; David Airlie
> Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI strin=
g to
> enable dGPU direct output"
>=20
>=20
> [EXTERNAL EMAIL]
>=20
> On Thu, 15 Aug 2019 16:37:05 +0200,
> Alex Deucher wrote:
> >
> > On Thu, Aug 15, 2019 at 10:25 AM Karol Herbst <kherbst@redhat.com> wrot=
e:
> > >
> > > On Thu, Aug 15, 2019 at 4:20 PM <Mario.Limonciello@dell.com> wrote:
> > > >
> > > > > > There are definitely going to be regressions on machines in the=
 field
> with the
> > > > > > in tree drivers by reverting this.  I think we should have an a=
nswer for all
> of
> > > > > those
> > > > > > before this revert is accepted.
> > > > > >
> > > > > > Regarding systems with Intel+NVIDIA, we'll have to work with pa=
rtners
> to
> > > > > collect
> > > > > > some information on the impact of reverting this.
> > > > > >
> > > > > > When this is used on a system with Intel+AMD the ASL configures=
 AMD
> GPU to
> > > > > use
> > > > > > "Hybrid Graphics" when on Windows and "Power Express" and
> "Switchable
> > > > > Graphics"
> > > > > > when on Linux.
> > > > >
> > > > > and what's exactly the difference between those? And what's the a=
ctual
> > > > > issue here?
> > > >
> > > > DP/HDMI is not detected unless plugged in at bootup.  It's due to m=
issing
> HPD
> > > > events.
> > > >
> > >
> > > afaik Lyude was working on fixing all that, at least for some drivers=
.
> > > If there is something wrong, we still should fix the drivers, not
> > > adding ACPI workarounds.
> > >
> > > Alex: do you know if there are remaining issues regarding that with a=
mdgpu?
> >
> > There was an issue with hpd events not making it to the audio side
> > when things were powered down that was fixed with this patch set:
> > https://patchwork.freedesktop.org/patch/316793/
> > Those patches depended on a bunch of alsa changes as well which may
> > have not been available in the distro used for a particular OEM
> > program.
>=20
> FYI, the corresponding commit for ALSA part is destined for 5.4
> kernel:
>=20
> https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git/commit/?i=
d=3Dade
> 49db337a9d44ac5835cfce1ee873549011b27
>=20
> BTW, Nouveau should suffer from the same problem.  The patch to add
> the audio component support is found at:
>   https://patchwork.freedesktop.org/patch/319131/
>=20
>=20

It sounds like 5.3rcX won't be a useful check then.

So am I correct to understand that everything related to the AMD failures
described in this thread should be in linux-next at this point?
