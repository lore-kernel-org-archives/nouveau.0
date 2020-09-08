From: Marc MERLIN <marc@merlins.org>
Subject: Re: [Nouveau] pcieport 0000:00:01.0: PME: Spurious native interrupt
 (nvidia with nouveau and thunderbolt on thinkpad P73)
Date: Mon, 7 Sep 2020 17:29:35 -0700
Message-ID: <20200908002935.GD20064@merlins.org>
References: <20191004123947.11087-1-mika.westerberg@linux.intel.com>
 <20191004123947.11087-2-mika.westerberg@linux.intel.com>
 <20200808202202.GA12007@merlins.org>
 <20200906181852.GC13955@merlins.org>
 <CACO55tsodfUGVUjFw9=smFOhp_oXP8zWY_9+vL+iiPZhKJdtyg@mail.gmail.com>
 <20200907205825.GB20064@merlins.org>
 <CACO55ttBXKWTbxERK-aHsYQe_4=eK_WVc2+ebmCbCJJcQpFZrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55ttBXKWTbxERK-aHsYQe_4=eK_WVc2+ebmCbCJJcQpFZrQ@mail.gmail.com>
Sender: linux-pci-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>, Lyude Paul <lyude@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, Sep 08, 2020 at 01:51:19AM +0200, Karol Herbst wrote:
> oh, I somehow missed that "disp ctor failed" message. I think that
> might explain why things are a bit hanging. From the top of my head I
> am not sure if that's something known or something new. But just in
> case I CCed Lyude and Ben. And I think booting with
> nouveau.debug=disp=trace could already show something relevant.

Thanks.
I've added that to my boot for next time I reboot.

I'm moving some folks to Bcc now, and let's remove the lists other than
nouveau on followups (lkml and pci). I'm just putting a warning here
so that it shows up in other list archives and anyone finding this
later knows that they should look in the nouveau archives for further
updates/resolution.

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
