From: Patrick Volkerding <volkerdi@gmail.com>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Tue, 21 Jul 2020 13:37:12 -0500
Message-ID: <d3253a47-09ff-8bc7-3ca1-a80bdc09d1c2@gmail.com>
References: <CACO55tuA+XMgv=GREf178NzTLTHri4kyD5mJjKuDpKxExauvVg@mail.gmail.com>
 <20200716235440.GA675421@bjorn-Precision-5520>
 <CACO55tuVJHjEbsW657ToczN++_iehXA8pimPAkzc=NOnx4Ztnw@mail.gmail.com>
 <CACO55tso5SVipAR=AZfqhp6GGkKO9angv6f+nd61wvgAJtrOKg@mail.gmail.com>
 <20200721122247.GI5180@lahna.fi.intel.com>
 <f951fba07ca7fa2fdfd590cd5023d1b31f515fa2.camel@redhat.com>
 <20200721152737.GS5180@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <20200721152737.GS5180@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-pci-owner@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Lyude Paul <lyude@redhat.com>
Cc: Karol Herbst <kherbst@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, nouveau <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Sasha Levin <sashal@kernel.org>
List-Id: nouveau.vger.kernel.org

On 7/21/20 10:27 AM, Mika Westerberg wrote:
> On Tue, Jul 21, 2020 at 11:01:55AM -0400, Lyude Paul wrote:
>> Sure thing. Also, feel free to let me know if you'd like access to one of the
>> systems we saw breaking with this patch - I'm fairly sure I've got one of them
>> locally at my apartment and don't mind setting up AMT/KVM/SSH
> Probably no need for remote access (thanks for the offer, though). I
> attached a test patch to the bug report:
>
>   https://bugzilla.kernel.org/show_bug.cgi?id=208597
>
> that tries to work it around (based on the ->pm_cap == 0). I wonder if
> anyone would have time to try it out.


Hi Mika,

I can confirm that this patch applied to 5.4.52 fixes the issue with
hybrid graphics on the Thinkpad X1 Extreme gen2.

Thanks,

Pat
