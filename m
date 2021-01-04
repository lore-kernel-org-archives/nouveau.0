From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2] ALSA: hda: Continue to probe when codec
 probe fails
Date: Mon, 4 Jan 2021 14:20:52 +0100
Message-ID: <CACO55tsPx_UC3OPf9Hq9sGdnZg9jH1+B0zOi6EAxTZ13E1tf7A@mail.gmail.com>
References: <20201214060621.1102931-1-kai.heng.feng@canonical.com>
 <20201216124726.2842197-1-kai.heng.feng@canonical.com>
 <s5h5z51oj12.wl-tiwai@suse.de>
 <CAAd53p6kORC1GsW5zt+=0=J5ki43iriO-OqtFvf5W67LWhyyhA@mail.gmail.com>
 <s5hzh2dn3oa.wl-tiwai@suse.de>
 <CAAd53p6Ef2zFX_t3y1c6O7BmHnxYGtGSfgzXAMQSom1ainWXzg@mail.gmail.com>
 <s5hsg85n2km.wl-tiwai@suse.de> <s5hmtydn0yg.wl-tiwai@suse.de>
 <CAAd53p6MMFh=HCNF9pyrJc9hVMZWFe7_8MvBcBHVWARqHU_TTA@mail.gmail.com>
 <s5h7dpfk06y.wl-tiwai@suse.de>
 <CAAd53p53w0H6tsb4JgQtFTkYinniicTYBs2uk7tc=heP2dM_Cw@mail.gmail.com>
 <CAKb7UvjWX7xbwMKtnad5EVy16nY1M-A13YJeRWyUwHzemcVswA@mail.gmail.com>
 <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAAd53p4=bSX26QzsPyV1sxADiuVn2sowWyb5JFDoPZQ+ZYoCzA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Kai-Heng Feng <kai.heng.feng-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org>
Cc: Pierre-Louis Bossart <pierre-louis.bossart-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "moderated list:SOUND" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, Kai Vehmanen <kai.vehmanen-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org>, nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, tiwai-IBi9RG/b67k@public.gmane.org, open list <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Mike Rapoport <rppt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Linux PCI <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Alex Deucher <alexander.deucher-5C7GfCeVMHo@public.gmane.org>, Jaroslav Kysela <perex-/Fr2/VpizcU@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Tue, Dec 22, 2020 at 3:50 AM Kai-Heng Feng
<kai.heng.feng-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
>
> On Tue, Dec 22, 2020 at 1:56 AM Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org> wrote:
> >
> > On Mon, Dec 21, 2020 at 11:33 AM Kai-Heng Feng
> > <kai.heng.feng-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> wrote:
> > >
> > > [+Cc nouveau]
> > >
> > > On Fri, Dec 18, 2020 at 4:06 PM Takashi Iwai <tiwai-l3A5Bk7waGM@public.gmane.org> wrote:
> > > [snip]
> > > > > Quite possibly the system doesn't power up HDA controller when there's
> > > > > no external monitor.
> > > > > So when it's connected to external monitor, it's still needed for HDMI audio.
> > > > > Let me ask the user to confirm this.
> > > >
> > > > Yeah, it's the basic question whether the HD-audio is supposed to work
> > > > on this machine at all.  If yes, the current approach we take makes
> > > > less sense - instead we should rather make the HD-audio controller
> > > > working.
> > >
> > > Yea, confirmed that the Nvidia HDA works when HDMI is connected prior boot.
> > >
> > > > > > - The second problem is that pci_enable_device() ignores the error
> > > > > >   returned from pci_set_power_state() if it's -EIO.  And the
> > > > > >   inaccessible access error returns -EIO, although it's rather a fatal
> > > > > >   problem.  So the driver believes as the PCI device gets enabled
> > > > > >   properly.
> > > > >
> > > > > This was introduced in 2005, by Alan's 11f3859b1e85 ("[PATCH] PCI: Fix
> > > > > regression in pci_enable_device_bars") to fix UHCI controller.
> > > > >
> > > > > >
> > > > > > - The third problem is that HD-audio driver blindly believes the
> > > > > >   codec_mask read from the register even if it's a read failure as I
> > > > > >   already showed.
> > > > >
> > > > > This approach has least regression risk.
> > > >
> > > > Yes, but it assumes that HD-audio is really non-existent.
> > >
> > > I really don't know any good approach to address this.
> > > On Windows, HDA PCI is "hidden" until HDMI cable is plugged, then the
> > > driver will flag the magic bit to make HDA audio appear on the PCI
> > > bus.
> > > IIRC the current approach is to make nouveau and device link work.
> >
> > I don't have the full context of this discussion, but the kernel
> > force-enables the HDA subfunction nowadays, irrespective of nouveau or
> > nvidia or whatever:
>
> That's the problem.
>
> The nvidia HDA controller on the affected system only gets its power
> after HDMI cable plugged, so the probe on boot fails.
>

it might be that the code to enable the sub function is a bit broken
:/ but it should work. Maybe the quirk_nvidia_hda function needs to be
called on more occasions? No idea.

> Kai-Heng
>
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pci/quirks.c?h=v5.10#n5267
> >
> > Cheers,
> >
> >   -ilia
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
