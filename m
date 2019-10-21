From: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Mon, 21 Oct 2019 10:48:29 +0200
Message-ID: <CACO55tvAyE1t2Bm8J=Yb_Gi5PDAgof=mRsJAKHFxOvEZpV-qGg@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com> <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher> <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
 <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Alex Hung <alex.hung@canonical.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Dave Airlie <airlied@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Linux ACPI <linux-acpi@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Mario Limonciello <mario.limonciello@dell.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

fyi: I decided to go for a different workaround to fix the runpm
issues observed with nvidia gpus with nouveau in the "pci: prevent
putting nvidia GPUs into lower device states on certain intel bridges"
thread

that's on the pci and pm mailing list. Maybe it makes sense to wait
for that to land before actually removing the ACPI workarounds here?
The workaround I had in this series didn't seem to be reliable enough,
so I ditched that approached.

On Mon, Oct 21, 2019 at 10:14 AM Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Mon, Oct 21, 2019 at 4:14 AM Alex Hung <alex.hung@canonical.com> wrote:
> >
> > We have done some tests on three of Intel + nVidia configuration
> > systems with OEM _OSI strings removed - while some bugs are still
> > observed, ex. one out of three has suspend/resume issues, no system
> > crashes were observed - the biggest issue that worries us.
> >
> > The positive results give us confident to ack the removal of the OEM
> > _OSI strings. While our tests were not able to cover all possible I+N
> > systems, we are sure we can fix issues along the way. If there aren't
> > systems that cannot be fixed without these OEM _OSI strings, these
> > strings should probably enable with DMI quirks (possible future
> > patches) so they won't affect others.
> >
> > Acked-by: Alex Hung <alex.hung@canonical.com>
>
> OK, thanks!
>
> I can queue this up or if it's better to route it through the DRM
> tree, please do that (and let me know).
