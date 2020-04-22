From: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH AUTOSEL 5.6 084/129] drm/nouveau: workaround runpm fail
 by disabling PCI power management on certain intel bridges
Date: Tue, 21 Apr 2020 20:55:23 -0400
Message-ID: <20200422005523.GV1809@sasha-vm>
References: <20200415113445.11881-1-sashal@kernel.org>
 <20200415113445.11881-84-sashal@kernel.org>
 <CACO55ttpvfoyt1p_5Y-Q1=+5NruF5kMoug85jE9y+jG+FW=HGw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <CACO55ttpvfoyt1p_5Y-Q1=+5NruF5kMoug85jE9y+jG+FW=HGw@mail.gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, Mika Westerberg <mika.westerberg@intel.com>, Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Wed, Apr 15, 2020 at 06:11:10PM +0200, Karol Herbst wrote:
>in addition to that 028a12f5aa829 "drm/nouveau/gr/gp107,gp108:
>implement workaround for HW hanging during init" should probably get
>picked as well as it's fixing some runtime pm related issue on a
>handful of additional GPUs. I have a laptop myself which requires both
>of those patches.
>
>Applies to 5.5 and 5..4 as well.

I've grabbed it for 5.6 and 5.4 (5.5 is EOL), thanks!

-- 
Thanks,
Sasha
