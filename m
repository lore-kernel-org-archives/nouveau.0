Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E77B0EF9008
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 17:02:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5385D10EA7D;
	Wed,  4 Mar 2026 17:02:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="hT9WUdDN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D6A8C44E21;
	Wed,  4 Mar 2026 16:52:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772643157;
 b=b4kHlGOiqeZs5LcbmlH0Xr8/b4M9K3oAIhyJhSUSx8Lj0rO/+oVVkAB4+mmdidTjcD1/Q
 2SVYQj0mi0TAbiFPIxRS4vE1TlxMkyv6G7KRk/tsFEHlvI4z3PaxVVozAx71c9mZMBSf6KO
 kv07Jgq17YYFe5whND5+wDvu1ndBtoZXBixsUSzPyQT/vV/+0VjedJheg7JhOfNJTpXhovh
 FbaNWlZLsHJSq1HUH3MLKj3aphvSak5id3edbH48UvuNTV+WpGy8F7M7jKifPBf2r9tFoe3
 xGno+Nko6gTR/XwjFvD7uxl1Q0QQa93FZjRiJhYj4vk7JlRY8melsTZDx2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772643157; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fqv1wvD7A6PqcjC2b0bX2OhBsYvrRlu0OY4eknZwVh8=;
 b=JG9gCl53k1F6nIYws6YQJEfMqA8KSqsV1UXaTf2yMnefa8vPXHby62/i6SZrFmi168vmu
 UW/4CWHuGc92JgG8GoUva0X/MGIOn+Z+id1hQOG3IC7ag0iU25VFijd92LYX7pXShdmKcOr
 08fnfgBSUguxX7+uYllfilOMbmCwAVeFtAAlTJu0aL1MAtVPBCozc2bS11kKqiZrTj5tzpF
 pmj6YZtGIeOrGCGKJVPQmYsDbvU/bnfqHx4UApLFxbIgmARFtwhqkIXnU83JUQLOSGUHt5M
 wqPsase+9mcBdtwLSJeHKEs789YMz54omoN7yFolVN0+21F9ZdbQjJ/bsNdQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EC8D243112
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 16:52:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 372E510EA78;
	Wed,  4 Mar 2026 17:02:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEF684079B;
	Wed,  4 Mar 2026 17:02:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E299FC4CEF7;
	Wed,  4 Mar 2026 17:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772643774;
	bh=aQJiY+2LCpzOcjrCyzcepEU8dJcqg8IvU44AMFz8v8M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hT9WUdDNSy78CtuA5kRf8mQTtoKTD2m4CXqf1thar1iHcKkmiNrxKPCHdoElX4ohB
	 GJDqQsLP/WI73C6u7MnKL/Gb7KlEuu21xLrOKbYRwd9hh4ETIowZMcVQnwJMF+AW59
	 EB+Tx62lWZlXgwqc23A2gC7Qy/YSjqMWXY5pw1ZrYR+nwYmCaXxLlqBaT4sWnEo64J
	 kFp6WTGP1rKSUpvrvYKc8sFz6to48D29AXlhF3+Sth6C5ewzSWg61wqJBIfw2mHGO6
	 CxQy0KUPVlSHwQUBw0X9FEkUIXbr6zoXZeMdEpLEiGVhiWv6rtRd9oAVIhrXmPhEaz
	 pYUq2rUyfTtOA==
Date: Wed, 4 Mar 2026 19:02:49 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304170249.GJ12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal>
 <20260304164551.GG964116@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304164551.GG964116@ziepe.ca>
Message-ID-Hash: G7HGADO3KMZWRYBM44WMG6IMWUIVGNVN
X-Message-ID-Hash: G7HGADO3KMZWRYBM44WMG6IMWUIVGNVN
X-MailFrom: leon@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/G7HGADO3KMZWRYBM44WMG6IMWUIVGNVN/>
Archived-At: <https://lore.freedesktop.org/20260304170249.GJ12611@unreal/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 04, 2026 at 12:45:51PM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 06:27:11PM +0200, Leon Romanovsky wrote:
> > On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> > > On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > > > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> > > >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > > >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > > >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > > >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > > >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > > >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > > >> > 
> > > >> > <...>
> > > >> > 
> > > >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > > >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > > >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > > >> > 
> > > >> > Why? Could you explain the rationale behind this difference between C and
> > > >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > > >> > for a practical and well‑established reason: maximizing hardware
> > > >> > utilization.
> > > >> 
> > > >> Personally I think drivers doing this are wrong. That such a driver
> > > >> bug was allowed to become UAPI is pretty bad. The rust approach is
> > > >> better.
> > > >
> > > > We already had this discussion. I see this as a perfectly valid
> > > > use-case.
> > > 
> > > Can you remind about a specific use-case for this please? (Ideally, one that
> > > can't be solved otherwise.)
> > 
> > You create X VFs through sriov_configure, unbind PF, bind it to vfio
> > instead and forward (X + 1) functions to different VMs.
> 
> No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
> will blow up the half baked SRIOV and break everything.

The FLR can be disabled. For example, PCI_DEV_FLAGS_NO_FLR_RESET flag
will do it.

> 
> VFIO already has its own sriov_config support, the right flow is to
> bind the PF to VFIO and then enable sriov and do your assignments.

VFIO started to support SR-IOV in 137e5531351d ("vfio/pci: Add
sriov_configure support"), which was added 8 years after VFIO core was
added cba3345cc494 ("vfio: VFIO core").

Thanks

> 
> Jason
> 
