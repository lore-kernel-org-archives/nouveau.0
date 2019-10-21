From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH v3] pci: prevent putting nvidia GPUs into lower device
 states on certain intel bridges
Date: Mon, 21 Oct 2019 14:40:17 +0300
Message-ID: <20191021114017.GY2819@lahna.fi.intel.com>
References: <20191016144449.24646-1-kherbst@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191016144449.24646-1-kherbst@redhat.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Karol Herbst <kherbst@redhat.com>
Cc: linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Lyude Paul <lyude@redhat.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pci@vger.kernel.org, linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hi Karol,

Sorry for commenting late, I just came back from vacation.

On Wed, Oct 16, 2019 at 04:44:49PM +0200, Karol Herbst wrote:
> Fixes state transitions of Nvidia Pascal GPUs from D3cold into higher device
> states.
> 
> v2: convert to pci_dev quirk
>     put a proper technical explanation of the issue as a in-code comment
> v3: disable it only for certain combinations of intel and nvidia hardware
> 
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Rafael J. Wysocki <rjw@rjwysocki.net>
> Cc: Mika Westerberg <mika.westerberg@intel.com>
> Cc: linux-pci@vger.kernel.org
> Cc: linux-pm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: nouveau@lists.freedesktop.org
> ---
>  drivers/pci/pci.c    | 11 ++++++++++
>  drivers/pci/quirks.c | 52 ++++++++++++++++++++++++++++++++++++++++++++

I may be missing something but why you can't do this in the nouveau
driver itself?
