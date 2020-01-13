From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4] pci: prevent putting nvidia GPUs into
 lower device states on certain intel bridges
Date: Mon, 13 Jan 2020 16:31:50 +0100
Message-ID: <CACO55tsCRzSOz4GcLuuvGP3hfbz8gYtYXqtYHy5XCpCi3tmPeA@mail.gmail.com>
References: <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <CACO55ttXJgXG32HzYP_uJDfQ6T-d8zQaGjXK_AZD3kF0Rmft4g@mail.gmail.com>
 <CAJZ5v0ibzcLEm44udUxW2uVgaF9NapdNBF8Ag+RE++u7gi2yNA@mail.gmail.com>
 <CACO55ttBkZD9dm0Y_jT931NnzHHtDFyLz28aoo+ZG0pnLzPgbA@mail.gmail.com>
 <CAJZ5v0jbh7jz+YQcw-gC5ztmMOc4E9+KFBCy4VGRsRFxBw-gnw@mail.gmail.com>
 <e0eeddf4214f54dfac08e428dfb30cbd39f20680.camel@redhat.com>
 <20191127114856.GZ11621@lahna.fi.intel.com>
 <CACO55tt5SAf24vk0XrKguhh2J=WuKirDsdY7T+u7PsGFCpnFxg@mail.gmail.com>
 <e7aec10d789b322ca98f4b250923b0f14f2b8226.camel@redhat.com>
 <CACO55tu+hT1WGbBn_nxLR=A-X6YWmeuz-UztJKw0QAFQDDV_xg@mail.gmail.com>
 <CAJZ5v0hcONxiWD+jpBe62H1SZ-84iNxT+QCn8mcesB1C7SVWjw@mail.gmail.com>
 <CAPM=9txefUg9_EO82an3b313mZz7J7-ydTuJtWD-hOQwE4QXkQ@mail.gmail.com>
 <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACO55tvhSM0aATBOK05-05aOc6LeN67=US2zO2jqXKWGTpUZFw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "Rafael J. Wysocki" <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mika Westerberg <mika.westerberg-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>, Linux PM <linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "Rafael J . Wysocki" <rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org>, LKML <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, dri-devel <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Mario Limonciello <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>, Bjorn Helgaas <helgaas-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

okay.. so checking whatever is the difference with _REV being 5
(meaning the firmware uses the legacy paths) doesn't help in any way.
It's using a different method to turn the link of and the other ACPI
variables touched either point to undocumented registers on the PCI
bridge or internal ACPI memory...

so, anybody with any other ideas? I really wished the nvidia driver
would enable runpm on pre turing GPUs, but that's sadly not the case
and on Turing things seem to be totally different, so it wouldn't help
to check there as well... *sigh*

On Tue, Dec 10, 2019 at 9:49 PM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>
> On Tue, Dec 10, 2019 at 8:58 PM Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> >
> > On Mon, 9 Dec 2019 at 21:39, Rafael J. Wysocki <rafael-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org> wrote:
> > >
> > > On Mon, Dec 9, 2019 at 12:17 PM Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
> > > >
> > > > anybody any other ideas?
> > >
> > > Not yet, but I'm trying to collect some more information.
> > >
> > > > It seems that both patches don't really fix
> > > > the issue and I have no idea left on my side to try out. The only
> > > > thing left I could do to further investigate would be to reverse
> > > > engineer the Nvidia driver as they support runpm on Turing+ GPUs now,
> > > > but I've heard users having similar issues to the one Lyude told us
> > > > about... and I couldn't verify that the patches help there either in a
> > > > reliable way.
> > >
> > > It looks like the newer (8+) versions of Windows expect the GPU driver
> > > to prepare the GPU for power removal in some specific way and the
> > > latter fails if the GPU has not been prepared as expected.
> > >
> > > Because testing indicates that the Windows 7 path in the platform
> > > firmware works, it may be worth trying to do what it does to the PCIe
> > > link before invoking the _OFF method for the power resource
> > > controlling the GPU power.
> > >
> >
> > Remember the pre Win8 path required calling a DSM method to actually
> > power the card down, I think by the time we reach these methods in
> > those cases the card is already gone.
> >
> > Dave.
> >
>
> The point was that the firmware seems to do more in the legacy paths
> and maybe we just have to do those things inside the driver instead
> when using the new method. Also the _DSM call just wraps around the
> interfaces on newer firmware anyway. The OS check is usually what
> makes the difference. I might be wrong about the _DSM call just
> wrapping though, but I think I saw it at least in some firmware at
> some point.
