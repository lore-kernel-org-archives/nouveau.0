From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH RESEND v2 2/2] PCI: Use ioremap(), not phys_to_virt() for
 platform ROM
Date: Tue, 17 Mar 2020 07:47:31 -0700
Message-ID: <20200317144731.GG23471@infradead.org>
References: <20200313222258.15659-1-mikel@mikelr.com>
 <20200313222258.15659-3-mikel@mikelr.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200313222258.15659-3-mikel@mikelr.com>
Sender: linux-pci-owner@vger.kernel.org
To: Mikel Rychliski <mikel@mikelr.com>
Cc: amd-gfx@lists.freedesktop.org, linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, "David (ChunMing) Zhou" <David1.Zhou@amd.com>, Bjorn Helgaas <bhelgaas@google.com>, Matthew Garrett <matthewgarrett@google.com>, Ben Skeggs <bskeggs@redhat.com>
List-Id: nouveau.vger.kernel.org

On Fri, Mar 13, 2020 at 06:22:58PM -0400, Mikel Rychliski wrote:
>  /**
> + * pci_platform_rom - ioremap() the ROM image provided by the platform
>   * @pdev: pointer to pci device struct
>   * @size: pointer to receive size of pci window over ROM
> + *
> + * Return: kernel virtual pointer to image of ROM
> + *
> + * The caller is responsible for removing the mapping with iounmap()
>   */
>  void __iomem *pci_platform_rom(struct pci_dev *pdev, size_t *size)
>  {
>  	if (pdev->rom && pdev->romlen) {
>  		*size = pdev->romlen;
> -		return phys_to_virt((phys_addr_t)pdev->rom);
> +		return ioremap(pdev->rom, pdev->romlen);
>  	}

What is the value of this helper over just open coding an ioremap
of pdev->rom in the callers?
