From: Lukas Wunner <lukas@wunner.de>
Subject: Re: nouveau regression with 5.7 caused by "PCI/PM: Assume ports
 without DLL Link Active train links in 100 ms"
Date: Fri, 17 Jul 2020 21:52:09 +0200
Message-ID: <20200717195209.vmtyfmgweoo645lh@wunner.de>
References: <20200716235440.GA675421@bjorn-Precision-5520>
 <ec6623032131fc3e656713b8ec644cdff89a8066.camel@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ec6623032131fc3e656713b8ec644cdff89a8066.camel@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Lyude Paul <lyude@redhat.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Karol Herbst <kherbst@redhat.com>, Sasha Levin <sashal@kernel.org>, Patrick Volkerding <volkerdi@gmail.com>, Linux PCI <linux-pci@vger.kernel.org>, linux-kernel@vger.kernel.org, dri-devel <dri-devel@lists.freedesktop.org>, Kai-Heng Feng <kai.heng.feng@canonical.com>, Ben Skeggs <bskeggs@redhat.com>, nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>
List-Id: nouveau.vger.kernel.org

On Fri, Jul 17, 2020 at 03:04:10PM -0400, Lyude Paul wrote:
> Isn't it possible to tell whether a PCI device is connected through
> thunderbolt or not? We could probably get away with just defaulting
> to 100ms for thunderbolt devices without DLL Link Active specified,
> and then default to the old delay value for non-thunderbolt devices.

pci_is_thunderbolt_attached()
