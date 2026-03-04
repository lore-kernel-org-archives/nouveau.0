Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44538EF9003
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 16:27:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EB6A10EA64;
	Wed,  4 Mar 2026 16:27:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KV8L5eiQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AAAB144E44;
	Wed,  4 Mar 2026 16:16:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772641019;
 b=MNAhVOIpAqfLk3A1Yax0BGZsaTvuXLvzM92tGB7Hk0/psCcMcNNjriH8+dqMZNxNycdjX
 bKlmS/AO+AQQDkUmd46N3uU77bD2Ewe8nwMK4H3DWecfnm2OlDS3RUxqsNEFPRmY8B82tc7
 CpYfkx77NqQYJoYs4g2HLlpQ5TNHJrhUJRMyFc+sfSsPk07fWWCQt4UuY0vECeEsdRz4tdf
 LYk3j+Q0FFYI8zAYDJPtqvO/g6HWTEvRwkSZvuAmHdWocxb9lrvzgQ/LklRFhxi4WnKyY3z
 Z3qUt9pszngv9EcYoX0peUDRI8ukmx00rDmwJG+EqTisvRqf2/8k9JIDD1Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772641019; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/upRRS02gSc1kwuIYj5RmWFY4+ZZpgbqkAT//1cL0xw=;
 b=n3fDOaea4sr1pGwjzs/5jx9zEvR9OoK0/lHnPOgalO9JVwOa1PX3tZQWNHXzsLCAI00FT
 TWAfmnVA+O96VSg2tcG1K+xSOCCGF0rUx1gzWFewH1lECHX3bI/+mwbq5nlKCmq1ZaVD5YN
 wu6z2uCGMQVvfx5KyDYzAS3LmHxc41xatinUfZe5eQDzCgDBo7RFj61xyg7HWLEnxejafvg
 08RokrVKGiEKV+PovktWDbMbvNfMHKRK1h6mYMKJV0t+30yeHwxvjhIHwF/i1ze/HRfaL4J
 vUnUEhN+YFqE3U9bCBtqfHaSUO4/1idQ3Vo9ITuweN9fuTjuwSXPDPls3Ekg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C8E7941E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 16:16:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 050F910EA5B;
	Wed,  4 Mar 2026 16:27:16 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9291E419F6;
	Wed,  4 Mar 2026 16:27:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB2EBC4CEF7;
	Wed,  4 Mar 2026 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772641635;
	bh=AfCEMFEFaW523pTkeEMztclMFG542ecaBMBKu13UGZU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KV8L5eiQbBVOpo+OeokNyKPYBoKK5g7vSE/nknwa473tAFw/QjlmcNO0ix4gySsJR
	 P8HGEuYKgLhs2iM5qBup4aRAoDdpXBSoN6aXuQpuSZQdcyK32b9CU44GBf06JQKrxe
	 A0138itmdBGIzt7qc/FuKDjEYCSXJY2vYvZFDzZpkQ24AdU2CATXVuKtzKQ417beN1
	 1HdgzguxGjgcfat/rasyFw88NZA2mgp2RTQ+oZK6lzIyI5/4MvYgarsiLUsmNN3co+
	 4kUUCcvOouTRL65YcHGShRf++I/qi/7S9VXcwYBddr2f7ugd4CGFQAwpy46t5yyczu
	 ppjBkqA5Ki4Cg==
Date: Wed, 4 Mar 2026 18:27:11 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304162711.GI12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
Message-ID-Hash: EHFQ2W4BZ6YWUDSP5IJ5QMBLLARW4ZXR
X-Message-ID-Hash: EHFQ2W4BZ6YWUDSP5IJ5QMBLLARW4ZXR
X-MailFrom: leon@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EHFQ2W4BZ6YWUDSP5IJ5QMBLLARW4ZXR/>
Archived-At: <https://lore.freedesktop.org/20260304162711.GI12611@unreal/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> >> > 
> >> > <...>
> >> > 
> >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> >> > 
> >> > Why? Could you explain the rationale behind this difference between C and
> >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> >> > for a practical and well‑established reason: maximizing hardware
> >> > utilization.
> >> 
> >> Personally I think drivers doing this are wrong. That such a driver
> >> bug was allowed to become UAPI is pretty bad. The rust approach is
> >> better.
> >
> > We already had this discussion. I see this as a perfectly valid
> > use-case.
> 
> Can you remind about a specific use-case for this please? (Ideally, one that
> can't be solved otherwise.)

You create X VFs through sriov_configure, unbind PF, bind it to vfio
instead and forward (X + 1) functions to different VMs.

If you destroy VFs on PF unbind, you will find yourself with one
function less per-device, as you will have not-utilized PF now,
which consumes HW resources anyway.

Thanks 
