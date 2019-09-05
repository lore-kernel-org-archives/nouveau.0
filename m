From: Alex Deucher <alexdeucher@gmail.com>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string to
 enable dGPU direct output"
Date: Thu, 5 Sep 2019 12:35:56 -0400
Message-ID: <CADnq5_NSY=usXHcX8UqBiTbenPE8K3+yZ5Ujnu3vSWziVTr_QQ@mail.gmail.com>
References: <20190814213118.28473-1-kherbst@redhat.com> <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <2215840.qs0dBhReda@kreacher> <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: "Rafael J. Wysocki" <rjw@rjwysocki.net>, Mario Limonciello <mario.limonciello@dell.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
List-Id: nouveau.vger.kernel.org

On Thu, Sep 5, 2019 at 11:51 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> is there any update on the testing with my patches? On the hardware I
> had access to those patches helped, but I can't know if it also helped
> on the hardware for which those workarounds where actually added.
>
> On Mon, Aug 19, 2019 at 11:52 AM Rafael J. Wysocki <rjw@rjwysocki.net> wrote:
> >
> > On Thursday, August 15, 2019 12:47:35 AM CEST Dave Airlie wrote:
> > > On Thu, 15 Aug 2019 at 07:31, Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > This reverts commit 28586a51eea666d5531bcaef2f68e4abbd87242c.
> > > >
> > > > The original commit message didn't even make sense. AMD _does_ support it and
> > > > it works with Nouveau as well.
> > > >
> > > > Also what was the issue being solved here? No references to any bugs and not
> > > > even explaining any issue at all isn't the way we do things.
> > > >
> > > > And even if it means a muxed design, then the fix is to make it work inside the
> > > > driver, not adding some hacky workaround through ACPI tricks.
> > > >
> > > > And what out of tree drivers do or do not support we don't care one bit anyway.
> > > >
> > >
> > > I think the reverts should be merged via Rafael's tree as the original
> > > patches went in via there, and we should get them in asap.
> > >
> > > Acked-by: Dave Airlie <airlied@redhat.com>
> >
> > The _OSI strings are to be dropped when all of the needed support is there in
> > drivers, so they should go away along with the requisite driver changes.
> >
>
> that goes beside the point. firmware level workarounds for GPU driver
> issues were pushed without consulting with upstream GPU developers.
> That's something which shouldn't have happened in the first place. And
> yes, I am personally annoyed by the fact, that people know about
> issues, but instead of contacting the proper persons and working on a
> proper fix, we end up with stupid firmware level workarounds. I can't
> see why we ever would have wanted such workarounds in the first place.
>
> And I would be much happier if the next time something like that comes
> up, that the drm mailing list will be contacted as well or somebody
> involved.
>
> We could have also just disable the feature inside the driver (and
> probably we should have done that a long time ago, so that is
> essentially our fault, but still....)

Generally these conversations happen between the OEM, the relevant
distro, and hw vendor prior to production so they can't always be
discussed in public.  These programs have power, feature, and distro
targets and not all of those align.  Sometimes fixing this at the
firmware level is the best way to make the product work well at launch
given the state of Linux at a particular time.  Windows already does
similar stuff so that older versions of windows will work properly on
newer hardware.  I agree that we should all strive to fix stuff
properly, but that's not always possible.

Alex

>
> > I'm all for dropping then when that's the case, so please feel free to add ACKs
> > from me to the patches in question at that point.
> >
> > Cheers,
> > Rafael
> >
> >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
