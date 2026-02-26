Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE35FC5904
	for <nouveau@archiver.kernel.org>; Thu, 26 Feb 2026 07:19:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D448810E885;
	Thu, 26 Feb 2026 07:18:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iaT6n/0f";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A038B44C5F;
	Thu, 26 Feb 2026 07:08:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772089732;
 b=JJvsbNWkyimEdXdaHICHyLWPPNWQVPwN9xVZXqV9KnAvWUsVwTF+fYw8pfDbw3mit5dXs
 W+79rwEaPOoK50BNfjt/vifUR8oRs7MSn04l3VjbHCFnVE1VNM+sErgU7lWfXWSW2llRkXK
 3QMBM+WOmAe/T5IrenqNWb2mqqyeIOUsBpQetdyybwj7/HTZXzQBNR0RoS1nQETezgriv3C
 2I3HpxnQqBqBHUP2rOG3dxbG31juLu93CKvpsk86CL6Xm6Vvrljj8hJLKR9XzTbdAOdHfFY
 omgblhWp0Jj7D+yWBFp4AL1eF3mpw3wOFyBY3vjBl1bSPeXsc65ir9HaHIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772089732; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/m2OFyTux5GR9d8QJAtLrrEvTUnXmZ/7e0mGj2WWIE8=;
 b=ABofPbpKW6Z5tdr+bH250Qy9UlYBby45Twml55AlGl6kAGOvWaYonp2li/Spg8MgXy3mt
 P+js71dSAtym1DlBJzMae3MuQxHgxXNDGggfE93FZ+Dfr1t1/sXYj0rrcwpHtfJIKHvBIPr
 AL51bjzW06dwJiNWblZn6EHSq/ym2jgHLz8twu67KiRcYap1ZxqmSCrYR26puUmk+Oirthk
 Nopv/shJ+aehT0ZlTup80ch6YNPjHTkS4IjrPDNfmIkcs8S7QFSlJOkkbpNr1e9fK9VA4EK
 L8PqFgR/rVgxZHf/zGLZER+oOhR+QWZy3uSa2bKvYkqAgPuq6+5JXu24pFWg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DCD8B40805
	for <nouveau@lists.freedesktop.org>; Thu, 26 Feb 2026 07:08:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A832A10E87B;
	Thu, 26 Feb 2026 07:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772090336; x=1803626336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVWWGoLzfnEr4YZDjcPykaqYCDvmIZeFsihBUzb3/3w=;
  b=iaT6n/0fVlopl97mA648y131clFvguPXVEnFnVy+JDuG04NNkYIsYD9C
   4n/oIG4pGU1kqc7uGk0VVwx92MetDchbCt0L5Me3Zlq/n//HaSXGMCCqA
   7yuwgryS4ugBH2qCspNuWdjI00oBMNuwvmiv953rb4WlEPQvh4aD/oiRW
   KJLS8pVvb0dRk+FY5zXBeYKcQzqBySEFx6oBS3IqzAE05ywuC1kizCO0m
   D6ET+5lYBO9qSeZUKnUlcr9SpdOBR1zbQrJEfr2kVfK6yavYqTQ0dz/AC
   2pFqk4Sdh/t2egxxmPyiDyUgarblvOxmLXAslLSMRH9wpDJjh4roRgHeH
   Q==;
X-CSE-ConnectionGUID: 4mgvlzE+Ra2s6EhoCyf3ew==
X-CSE-MsgGUID: qAMvIMZmREC82X0wEOXxPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72354110"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800";
   d="scan'208";a="72354110"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Feb 2026 23:18:55 -0800
X-CSE-ConnectionGUID: tzLjy4iLShKJpLYq/aCM9w==
X-CSE-MsgGUID: ZC3eU4WWRpiXnwMax+3VUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800";
   d="scan'208";a="220617388"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost)
 ([10.239.159.165])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2026 23:18:46 -0800
Date: Thu, 26 Feb 2026 14:59:12 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Peter Colberg <pcolberg@redhat.com>
Subject: Re: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable
 SR-IOV on remove()
Message-ID: <aZ/vQHV3zr49r7E+@yilunxu-OptiPlex-7050>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
Message-ID-Hash: JJZLG3CIDA6KJF2FXMYAJWBDLDVZYDIV
X-Message-ID-Hash: JJZLG3CIDA6KJF2FXMYAJWBDLDVZYDIV
X-MailFrom: yilun.xu@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JJZLG3CIDA6KJF2FXMYAJWBDLDVZYDIV/>
Archived-At: 
 <https://lore.freedesktop.org/aZ/vQHV3zr49r7E+@yilunxu-OptiPlex-7050/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Feb 05, 2026 at 03:59:49PM -0500, Peter Colberg wrote:
> Set the flag managed_sriov in the pci_driver structure to show how a
> PCI driver may opt into disabling the Single Root I/O Virtualization
> (SR-IOV) capability of the device when the driver is removed.
> 
> Merge the function cci_remove_feature_devs() into cci_pci_remove().

I think it makes much clearer demonstration if you split the unrelated
changes out.

> 
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> ---
> Changes in v2:
> - Demonstrate flag managed_sriov for dfl-pci driver.
> ---
>  drivers/fpga/dfl-pci.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
>  	return 0;
>  }
>  
> -static void cci_remove_feature_devs(struct pci_dev *pcidev)
> -{
> -	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
> -
> -	/* remove all children feature devices */
> -	dfl_fpga_feature_devs_remove(drvdata->cdev);
> -	cci_pci_free_irq(pcidev);
> -}
> -
>  static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
>  {
>  	unsigned int i;
> @@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
>  
>  static void cci_pci_remove(struct pci_dev *pcidev)
>  {
> -	if (dev_is_pf(&pcidev->dev))
> -		cci_pci_sriov_configure(pcidev, 0);
> +	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
>  
> -	cci_remove_feature_devs(pcidev);
> +	/* remove all children feature devices */
> +	dfl_fpga_feature_devs_remove(drvdata->cdev);
> +	cci_pci_free_irq(pcidev);
>  }
>  
>  static struct pci_driver cci_pci_driver = {
> @@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
>  	.probe = cci_pci_probe,
>  	.remove = cci_pci_remove,
>  	.sriov_configure = cci_pci_sriov_configure,
> +	.managed_sriov = true,
>  };
>  
>  module_pci_driver(cci_pci_driver);
> 
> -- 
> 2.52.0
> 
> 
