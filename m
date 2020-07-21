From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Tue, 21 Jul 2020 15:22:47 +0300
Message-ID: <20200721122247.GI5180@lahna.fi.intel.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Lyude Paul <lyude@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, Patrick Volkerding <volkerdi@gmail.com>, LKML <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Sasha Levin <sashal@kernel.org>
List-Id: nouveau.vger.kernel.org

Hi,

[Sorry for the delay, I was on vacation]

On Fri, Jul 17, 2020 at 01:32:10PM +0200, Karol Herbst wrote:
> Filed at https://bugzilla.kernel.org/show_bug.cgi?id=208597

Thanks for reporting.

I'll check your logs and try to figure if there is something we can do
to make both nouveau and TBT working at the same time.

> oddly enough I wasn't able to reproduce it on my XPS 9560, will ping
> once something breaks.
