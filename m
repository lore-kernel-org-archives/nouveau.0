From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RESEND v2 2/2] PCI: Use ioremap(), not phys_to_virt() for
 platform ROM
Date: Tue, 17 Mar 2020 23:51:19 -0700
Message-ID: <20200318065119.GA14425@infradead.org>
References: <20200313222258.15659-1-mikel@mikelr.com>
 <20200313222258.15659-3-mikel@mikelr.com>
 <20200317144731.GG23471@infradead.org>
 <49518530.5kixuQOrMm@glidewell>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <49518530.5kixuQOrMm@glidewell>
Sender: linux-pci-owner@vger.kernel.org
To: Mikel Rychliski <mikel@mikelr.com>
Cc: Christoph Hellwig <hch@infradead.org>, amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <matthewgarrett@google.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Tue, Mar 17, 2020 at 09:34:33PM -0400, Mikel Rychliski wrote:
> I think the direct access to pdev->rom you suggest makes sense, especially 
> because users of the pci_platform_rom() are exposed to the fact that it just 
> calls ioremap().
> 
> I decided against wrapping the iounmap() with a pci_unmap_platform_rom(), but 
> I didn't apply the same consideration to the existing function.
> 
> How about something like this (with pci_platform_rom() removed)?

That looks sensible to me.
