Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC2AEEF8FEE
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 14:26:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5A5110EA2A;
	Wed,  4 Mar 2026 14:26:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ts/0Flsu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8179D44E38;
	Wed,  4 Mar 2026 14:15:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772633750;
 b=dePATIQH4DzLD2xPaiu7zEJcL/nJi1lz4V2hoTGNTDzXoZxPxQqTMPaasZlZzpYL2tYLa
 xfdbWhJA4j56VdrBcZn8kJoVVZH9zMtjau4dSIu6f68fj7cavBhfDbsIiyPvXliCwiJrB5U
 MHz80qinjMFc697MRxxp4RHjVfPt9pLz+HY7DglpP6gk3ooDYH67AYy5U4hi+4K7zL2siwc
 LZGketmihb4QkXQ223fJU3TmWVnFyPsCrvRyTzH4ufk8HM8gk7eY4kbXSGo7hl0roEGo0lL
 OcsRUWJ0dx5KhbqEoaFHPbCKJHSCe6128LLynlxIlZp+nhcMp99BVPenGyZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772633750; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=skwYc2tFdi2G2UZmIdQO2+OuPDydZAwmKfkzXXSVbw4=;
 b=waydOeYX4YcagPlAPY4H4oGg/HJFUZt2eiIOKvmV96jxUyt0sa3w5i9fp0b7zjiECxzYn
 ZDUdU9z28mVtmqoas/c3hoiXE4bcGUIR3mphatj2ZJBtgt3OWscJ74eul0DQr7iEi1Xe2n4
 SyVkw116uXtKNrgO0rnXc991wbDTk55TOLQDxNqxIHLAzHe5TEwg8kd0S0ih0i7x1QSCPIo
 BotvqE58Maj5K9Ga419bR4jpeYt8yJgpuynTpAJVOtSSlJx7Pk4mrmzWJtIMu1KPcFqxUof
 Ixq/BUAbOYl2BIqMWQQnYBGCunF98zVThm8zdbICEj9yiowGNkZa+xnDL80w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8934D41E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 14:15:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72CE410EA1C;
	Wed,  4 Mar 2026 14:26:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7737E6057A;
	Wed,  4 Mar 2026 14:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 833ACC2BC87;
	Wed,  4 Mar 2026 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772634365;
	bh=B0weNWDunmwVDkkQkN0kc7eG+tPkHSnvIyKW9SWUWPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ts/0Flsu+WenzEZfA5RIGH5FOlyHpWYzSgcefBgKg2f19RaSYz+irtf4VdJbC766a
	 NEaEpQ4umSV40OOs9ljryMEiSfaxm3WaBTUH3UGZdOvowqt/RrlEXVEAKUI6C31Gvf
	 sG/yB38kxV7mnWG2tWKaBWl+zjobjnciujPIucg+/jacQpHmpX7sP2g5nZzJTR2aZw
	 bKWY102ePDXk+dqRHGD/xD9P0Lzhe933nURcNLqi+A56D/2L2FMtcX/pA3iitdI5HO
	 WVnC3yjobyeiqlz2mpolNYTWQuQHio4sAY+ArQ4J4bALd5gkWoYuv152zQoKTasSQM
	 3hHcgssibybRg==
Date: Wed, 4 Mar 2026 16:26:00 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304142600.GB12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304141852.GF964116@ziepe.ca>
Message-ID-Hash: 7JMI5SCA5AAECLR445EK4F7WL3ASUF5C
X-Message-ID-Hash: 7JMI5SCA5AAECLR445EK4F7WL3ASUF5C
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7JMI5SCA5AAECLR445EK4F7WL3ASUF5C/>
Archived-At: <https://lore.freedesktop.org/20260304142600.GB12611@unreal/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > 
> > <...>
> > 
> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > 
> > Why? Could you explain the rationale behind this difference between C and
> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > for a practical and well‑established reason: maximizing hardware
> > utilization.
> 
> Personally I think drivers doing this are wrong. That such a driver
> bug was allowed to become UAPI is pretty bad. The rust approach is
> better.

We already had this discussion. I see this as a perfectly valid
use-case.

Thanks

> 
> Jason
