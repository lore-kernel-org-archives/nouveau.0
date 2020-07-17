From: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Fri, 17 Jul 2020 17:59:09 -0500
Message-ID: <20200717225909.GA784064@bjorn-Precision-5520>
References: <20200717144318.GP2722994@sasha-vm>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <stable-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200717144318.GP2722994@sasha-vm>
Sender: stable-owner@vger.kernel.org
To: Sasha Levin <sashal@kernel.org>
Cc: Karol Herbst <kherbst@redhat.com>, Linux PCI <linux-pci@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Ben Skeggs <bskeggs@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Lyude Paul <lyude@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Patrick Volkerding <volkerdi@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, stable@vger.kernel.org
List-Id: nouveau.vger.kernel.org

On Fri, Jul 17, 2020 at 10:43:18AM -0400, Sasha Levin wrote:
> On Fri, Jul 17, 2020 at 02:43:52AM +0200, Karol Herbst wrote:
> > On Fri, Jul 17, 2020 at 1:54 AM Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, Jul 17, 2020 at 12:10:39AM +0200, Karol Herbst wrote:
> > > > On Tue, Jul 7, 2020 at 9:30 PM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > Hi everybody,
> > > > >
> > > > > with the mentioned commit Nouveau isn't able to load firmware onto the
> > > > > GPU on one of my systems here. Even though the issue doesn't always
> > > > > happen I am quite confident this is the commit breaking it.
> > > > >
> > > > > I am still digging into the issue and trying to figure out what
> > > > > exactly breaks, but it shows up in different ways. Either we are not
> > > > > able to boot the engines on the GPU or the GPU becomes unresponsive.
> > > > > Btw, this is also a system where our runtime power management issue
> > > > > shows up, so maybe there is indeed something funky with the bridge
> > > > > controller.
> > > > >
> > > > > Just pinging you in case you have an idea on how this could break Nouveau
> > > > >
> > > > > most of the times it shows up like this:
> > > > > nouveau 0000:01:00.0: acr: AHESASC binary failed
> > > > >
> > > > > Sometimes it works at boot and fails at runtime resuming with random
> > > > > faults. So I will be investigating a bit more, but yeah... I am super
> > > > > sure the commit triggered this issue, no idea if it actually causes
> > > > > it.
> > > >
> > > > so yeah.. I reverted that locally and never ran into issues again.
> > > > Still valid on latest 5.7. So can we get this reverted or properly
> > > > fixed? This breaks runtime pm for us on at least some hardware.
> > > 
> > > Yeah, that stinks.  We had another similar report from Patrick:
> > > 
> > >   https://lore.kernel.org/r/CAErSpo5sTeK_my1dEhWp7aHD0xOp87+oHYWkTjbL7ALgDbXo-Q@mail.gmail.com
> > > 
> > > Apparently the problem is ec411e02b7a2 ("PCI/PM: Assume ports without
> > > DLL Link Active train links in 100 ms"), which Patrick found was
> > > backported to v5.4.49 as 828b192c57e8, and you found was backported to
> > > v5.7.6 as afaff825e3a4.
> > > 
> > > Oddly, Patrick reported that v5.7.7 worked correctly, even though it
> > > still contains afaff825e3a4.
> > > 
> > > I guess in the absence of any other clues we'll have to revert it.
> > > I hate to do that because that means we'll have slow resume of
> > > Thunderbolt-connected devices again, but that's better than having
> > > GPUs completely broken.
> > > 
> > > Could you and Patrick open bugzilla.kernel.org reports, attach dmesg
> > > logs and "sudo lspci -vv" output, and add the URLs to Kai-Heng's
> > > original report at https://bugzilla.kernel.org/show_bug.cgi?id=206837
> > > and to this thread?
> > > 
> > > There must be a way to fix the slow resume problem without breaking
> > > the GPUs.
> > > 
> > 
> > I wouldn't be surprised if this is related to the Intel bridge we
> > check against for Nouveau.. I still have to check on another laptop
> > with the same bridge our workaround was required as well but wouldn't
> > be surprised if it shows the same problem. Will get you the
> > information from both systems tomorrow then.
> 
> I take it that ec411e02b7a2 will be reverted upstream?

Yes, unless we have a better fix soon.  I applied the revert to my
for-linus branch, so it will appear in -next soon.  I think it's a
little late to get it in -rc5, so I'll probably ask Linus to pull it
next week for -rc6.

Bjorn
