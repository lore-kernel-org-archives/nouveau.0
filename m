Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DE1EF9002
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 16:45:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B81E910EA74;
	Wed,  4 Mar 2026 16:45:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="ToFO2c8B";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4F8B444E19;
	Wed,  4 Mar 2026 16:35:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772642136;
 b=JjdZw1h1znE6vpu97mxhUHz145rUBUGlxRBPB7nD4FENnuuddAR5bVwkB3B9Q4RJen/FX
 BxrbzAKif9LxfKC8lJWIiSEFrbAJvOFn/dHa3DnvII0kPErnrI2fk8+GmR+aveKKNVwWMYm
 UlZQwj8oJaLeUnTCgSlctSswxDTNptaav6hjDOf8nAYksvG0FyImpxcF7Cv1USGuWYUxmm+
 gq+bhbIp9LC8BTqKjEsFg6ib7VFttH8NPpJNn8uea8XgELpXjBguRqTf+ywnOHDJcVbqMTp
 P12PtSKvmgFZkNWnb3LpR23JTP8k1Vx1u2zOntcOA//MCS7cUjzAeSYiMYig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772642136; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
 b=GtdtLD8rIg9o3+CGLpl7Sy75D1pvjvwo4lBzsJLwO1D9KjpLY+OFdeCc6XrBUGIc2K28q
 aNdwkj9f61GyjQRSYEQLTtzcgSrLlYxZBEzZSR2o5wlpXStQJ7M+LUBaJFNvKBdc0jVylUd
 iu1fr8CNOu9ZaOY80vjzr372dW1yeRop1S2GopN1cP/DDFLezrDWWXYUNV3+71vkkiIFX3t
 bF6fsU5qyGhETUuXfGZv37hUAGawcFELfAKdDEhlRfniRCvlxpVVZz2pLpN4BFq2BYCKQYS
 PBfKi/DGT4VkTJEQH+MqSgS3FFj9bfqFTbJV/3vD63TKWODqCgGjXdoU/gRQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B73743112
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 16:35:33 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com
 [209.85.219.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C4C9910EA6E
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 16:45:53 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-89a05955720so39768076d6.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Mar 2026 08:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772642753; x=1773247553;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
        b=ToFO2c8Bh1Iphrd50T1lcFzmzvedwhTfRWJYY1uZk9KD8dJWsaFPLdjbkxlqZ6CEpg
         Lj5hWyhJ2JqNElUeyYK5QRzttenh6J+quG+rz7zbzfsgjJCDS2cPRaDpsRle7BwOEJES
         niIL84LGj5TE+O2Y5ywcVZxbsMRfMuYnLc9+64JeXFndTM8y61Sv8EcaqvxZqwJUtfxL
         +BfbrFpWNR9rGq6UiUtxN+o3fueMTKnH10HFTPS4unFMkcaged39GjNGz3EfiIWWCCvq
         KKJxTZCjC+KxNhFiSMguq3DjyzPrWghwoA/05wh+3bEVYUMlOGxEHrn3rPkXqs8Dt+6B
         6Ydg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642753; x=1773247553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
        b=nFKDJZkHERS2p48FTkLkhQfICkc9A+BoLsCpXlcfvpSg8xJgpzaRf4YbRhzZuZzfov
         woWGmB2d3A4M/yt6YbpnfUnCGfod4GLe7GNs5FtJqZvcwP6LOSHPEH/NksG/Dr5t8u28
         8gKOsTovXiC5ERnOGm9h7tny3MoqAQlBK8+qmF6or11CXbqBgNS6j3cSKgELoT6t/0Ev
         vCKfgSkDKj6X836GkfYhpMPQTN+ZkfkAw2Cijn4pgFgNLI6QCP4XKSLqM+L5grsbFLgf
         9sidmqGIeMLwkqc/y7/yR6Q5eNypkDaREt9OqmgVV8FgITEUilQ0fo2HpkUiQF8jZ4YI
         2MzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXksRFAqsnU5fage7kJYZOn0XycDDoX54MI7CN5idXxkfhzAQExhwmfbHle9yc7MX4+wZQ6yyr0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBjxv4nORYiYE5j0ko2THK8PLRUVWLR4L4mGltcDHWTqom979J
	SbkJQEKgNfdzVLZ8RxKWDnji/PPlcS9QGnv8RQDf1cggBfAGQylMCg1JBKJkk+THP6c=
X-Gm-Gg: ATEYQzx87Lu8i2lVlvaH7cGBIJiNopBEtjqWwvIsINu5trTaE37xU7mwJH7fmVzjhEf
	3PmxqVhq9K7OD+Uz+uS2uNMkhgS/gLt6sM5azGq0o2qaqPnSLQxnFuU5ubSOBBV9uOq2qg42oRF
	vQZSam6yLhiSE1T18KfeG3hFAZj3jSiZ9bVtdddVZbGlvOc6qFF/sOmYT0aBSvR2dzOeUhQh8jq
	yHsI0gv/zJgC5+VvBR3I0kVJOCIVnBCjRiIuNijQrOz0qcMXy7XiyLMkYIw3tLOnvI20K6urGta
	EbGoPf4PxuQWuPAvgkx6Y3YLsSm+1y8E9X90kg8EZBdHjT8dmI1w5aIwQ0I0AD+zf70j3lf6IkZ
	QBrqfIpO95kLMW61J0D4wyXyM/vgTiVGk/2Tmss1aO2ma3sCUgOsVBHiLiRCYX7hdpKdOtDS3IZ
	tTN0dHp8eZq3FiY4H6/Qq6GtBP2YXAleiUkF+SOsitAOJ+BDe+VjESuei+QUTt0nTAeL4367zWf
	UzoWKhh3Xm1/bNC9pk=
X-Received: by 2002:a05:6214:cc6:b0:899:f2af:bd85 with SMTP id
 6a1803df08f44-89a19ce9729mr37872326d6.45.1772642752542;
        Wed, 04 Mar 2026 08:45:52 -0800 (PST)
Received: from ziepe.ca
 (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-899fdf30e99sm69421516d6.3.2026.03.04.08.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:45:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxpM7-00000005CBf-1l90;
	Wed, 04 Mar 2026 12:45:51 -0400
Date: Wed, 4 Mar 2026 12:45:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304164551.GG964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304162711.GI12611@unreal>
Message-ID-Hash: 2AZ4CIWVJI3QDL77SQSZEGCEUHJ6XRTS
X-Message-ID-Hash: 2AZ4CIWVJI3QDL77SQSZEGCEUHJ6XRTS
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2AZ4CIWVJI3QDL77SQSZEGCEUHJ6XRTS/>
Archived-At: <https://lore.freedesktop.org/20260304164551.GG964116@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 04, 2026 at 06:27:11PM +0200, Leon Romanovsky wrote:
> On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> > On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> > >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > >> > 
> > >> > <...>
> > >> > 
> > >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > >> > 
> > >> > Why? Could you explain the rationale behind this difference between C and
> > >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > >> > for a practical and well‑established reason: maximizing hardware
> > >> > utilization.
> > >> 
> > >> Personally I think drivers doing this are wrong. That such a driver
> > >> bug was allowed to become UAPI is pretty bad. The rust approach is
> > >> better.
> > >
> > > We already had this discussion. I see this as a perfectly valid
> > > use-case.
> > 
> > Can you remind about a specific use-case for this please? (Ideally, one that
> > can't be solved otherwise.)
> 
> You create X VFs through sriov_configure, unbind PF, bind it to vfio
> instead and forward (X + 1) functions to different VMs.

No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
will blow up the half baked SRIOV and break everything.

VFIO already has its own sriov_config support, the right flow is to
bind the PF to VFIO and then enable sriov and do your assignments.

Jason
