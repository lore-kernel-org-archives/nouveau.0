Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D8AEB7EB2
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 08:47:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 038C210E982;
	Wed,  4 Mar 2026 08:47:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CGJ1QxVS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4E8C444E11;
	Wed,  4 Mar 2026 08:37:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772613458;
 b=Ed9P7PZA/SQxh5lPsOocLsecv/+N5LfO0tzPDVIDAiAAXHuXIAQD05pwwy06F0hMAhRoA
 b21LTBBRpeTnFqqQpOAlb+fxVVBLh1bbN5nMX3D7+CeLTPeA3H3OI9C4vlEhe+eVRUK6XRA
 gmPyBIJwSnrZo0/+Y8zccV9k/aYdisZZO9gQBEkaoOEHj6IBl6YgyIT4Kp9jv95miteG7va
 Qb4dZFBX9+JAdv8ApXjml/BtdMGFnRlAISLrUEEO68RJwfx+L5/YxM+kgySYjoKUISciyN3
 Mq6LkMg/LpaKKndWGOvk0xd5IjCjG17b3t4oaLqohY4Cgze0os7WJRcdyTQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772613458; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=q+uTTk+Tl69Kd6bd84m1ZhgW1BhIv3PD7PYeGemtd4Y=;
 b=tbVBUS1YJ1bzMa5Kv17QKCyGB/9lfQm9ZQ6/tdE5Fs8fsmttV15iS2pmVp219kP0yWaaD
 p72E0xzhpXQaWkqWrqeyVCExJ56HQX5+VJInbDn4s+fthrHH05KxzC3gDNxrv5tVXhhnY3W
 fbf2YkR3Es7Jr22p06aCjuCYv52FY+cQEp2jnF9Mk7ejg10+r7Za/5XytGm9ipa8KLzsObQ
 e3ALre83WakOGA1DMACeFDONEdQUgqMPJPusy1GGoDOUNPCaN/YdENTorFjItFNQATbyau+
 QZphM7MzTgE0QVuDIEi0HI8ihhT+/y762uM8H4dOeSvIAujaTptO5ZYc47OA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 147A541E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 08:37:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A11A10E97D;
	Wed,  4 Mar 2026 08:47:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7034943FAE;
	Wed,  4 Mar 2026 08:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A627BC19423;
	Wed,  4 Mar 2026 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772614074;
	bh=q+uTTk+Tl69Kd6bd84m1ZhgW1BhIv3PD7PYeGemtd4Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CGJ1QxVSx+yDBHFSGoiEA2QyfySvBh3UP/gWJq3VOBTvYMvejMq8Rzpzqmukquutx
	 t2OTkdGkFfjSoNlRUuQHsgRR2xPyC48SdWHcHPMUqRWp8gTeKSSWi5DJpATFoDNtZ9
	 6eXTKs6/AXKf3TjhGc64AYu971aZ4AAO/zQACZtsTZBjYnwb7TRHrdWWzPAuac4+uI
	 uwf+ggXetFVdGtF6buvhLTW9e2UF/v1T5XqeceHaXg+bYpa0CX6BxkGll5sZcYS8Wk
	 QY08VrLwU/YutzRmF/PxK5OygjVR6y6ITvSo4XVbV1CW+cGGQcFSGVrXVfj/KOs/S7
	 pmv5gl2WFBVIQ==
Date: Wed, 4 Mar 2026 10:47:50 +0200
From: Leon Romanovsky <leon@kernel.org>
To: Peter Colberg <pcolberg@redhat.com>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304084750.GW12611@unreal>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
Message-ID-Hash: MUGAS3N7Y65FGNF43SAL6CYM6NPUQXBK
X-Message-ID-Hash: MUGAS3N7Y65FGNF43SAL6CYM6NPUQXBK
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
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MUGAS3N7Y65FGNF43SAL6CYM6NPUQXBK/>
Archived-At: <https://lore.freedesktop.org/20260304084750.GW12611@unreal/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> capability of a PCI device. Provide a minimal set of wrappers for the
> SR-IOV C API to enable and disable SR-IOV for a device, and query if
> a PCI device is a Physical Function (PF) or Virtual Function (VF).

<...>

> For PF drivers written in C, disabling SR-IOV on remove() may be opted
> into by setting the flag managed_sriov in the pci_driver structure. For
> PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.

Why? Could you explain the rationale behind this difference between C and
Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
for a practical and well‑established reason: maximizing hardware
utilization.

Thanks
