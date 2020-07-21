From: Lyude Paul <lyude@redhat.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Tue, 21 Jul 2020 11:01:55 -0400
Message-ID: <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
         <20200716235440.GA675421@bjorn-Precision-5520>
         <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
         <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
         <20200721122247.GI5180@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200721122247.GI5180@lahna.fi.intel.com>
Sender: linux-pci-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Karol Herbst <kherbst@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Patrick Volkerding <volkerdi@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Sasha Levin <sashal@kernel.org>
List-Id: nouveau.vger.kernel.org

Sure thing. Also, feel free to let me know if you'd like access to one of the
systems we saw breaking with this patch - I'm fairly sure I've got one of them
locally at my apartment and don't mind setting up AMT/KVM/SSH

On Tue, 2020-07-21 at 15:22 +0300, Mika Westerberg wrote:
> Hi,
> 
> [Sorry for the delay, I was on vacation]
> 
> On Fri, Jul 17, 2020 at 01:32:10PM +0200, Karol Herbst wrote:
> > Filed at https://bugzilla.kernel.org/show_bug.cgi?id=208597
> 
> Thanks for reporting.
> 
> I'll check your logs and try to figure if there is something we can do
> to make both nouveau and TBT working at the same time.
> 
> > oddly enough I wasn't able to reproduce it on my XPS 9560, will ping
> > once something breaks.
-- 
Cheers,
	Lyude Paul (she/her)
	Software Engineer at Red Hat
