Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E21DFF8860
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 15:00:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9008510E7A5;
	Mon, 27 Apr 2026 15:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gMiHnDib";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 61BD645C79;
	Mon, 27 Apr 2026 14:47:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777301269;
 b=bQ53RKqdZnjp2Cj3I0bb9zb47JSdzFVpUL2RMPr9o/RVApOGwWAuKb5aURQhrpwKkLw/B
 4HAoETKMPX3a5bsbZB59EYZSi0G4FKHCYTinRhmIEXL94pUGGN3ZGFoIiBpv5+31MAR8E2U
 ujYtTjVV15NfZzgkKB7jB+gmC4JR0LDNRJciZ2W4Ln1jKy8G6jphDbJhS4vXPAKN0Oz8HaP
 muJTiYEYdSmGqRobxYUltOOmWbn+kpVqVg9cmPWmzBvZk7ZVomiaZiiD2DBGlmkkkwoktgi
 TctJgQphHV2QVI7miez0hsIuS1SGIDlYumbPQ9cBYFxwfOfLOksbdmyy3nBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777301269; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IGrroLTu2RtTp56RZqsX0hxGrIQB13lcQxS9JEkWIMU=;
 b=hIQvVdX/wNzs7jes0QSLJw71J0KxFknvwLe0I7mzO+V0xI/zl4Uhfnckmyy+nbZvV8GUH
 BRXN42pCvHpPr8d2gqjep1HgAJUv5HstKgZWeLw71Az6EvxUlh7OBt9iarVaowS6tS5sKc1
 QobQUxD8hy5DNTLd94ZJP8Se9QckNg7+LBLoQH4grQgCZJuqEAthbVdOFUZ+XPW5DEqYOHW
 bpUWUoK4z2Q1coQqSj2/hlS3Z/5lef9CVE2XXaVmMhACNY1KFrptgYGR6btcCaZy9YfbPpn
 Ori7sogw5ufkcFV7ekLEh8lhxf+Yz7k+ul7GIlWwe+V2DKXwrZWRHmYKMnkw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 17DE243E17
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 14:47:46 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D70D510E0B7;
	Mon, 27 Apr 2026 15:00:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D6AD360126;
	Mon, 27 Apr 2026 15:00:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2D59C2BCB5;
	Mon, 27 Apr 2026 14:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302004;
	bh=IGrroLTu2RtTp56RZqsX0hxGrIQB13lcQxS9JEkWIMU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=gMiHnDibP2lvVXj8sftDu8/OmlvWjS8lRRDHBVuwVFkFlfPgeW2pvGkkfXPe42mUV
	 kXa/9Au4apALe9vRcvbV5U0jCxD/ilgxTJOPksnaCjV0B+jAJWfNsgm/YAFfaSJWDD
	 GRUSVJ8drHqEKuX1Ca38NAeMc4eVEnQBajvc/reQf/RYYXmzYOota38Os4uRRroTnO
	 GKOWfRi/G1UMCm5tlZLbm6sIgHlULo7lkQRm5SP1gionof7qHJv0AWezbRNJZ2T69M
	 QgBfbVdBuUnYGfVfeCPCm7Z9UcMYzJkugzeoj04NlbyT0D4TT1A7jDJTf77nlRIfMi
	 PhlXX7VZx6mmA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun
 Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6r?=
 =?utf-8?Q?n?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Daniel Almeida
 <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Abdiel
 Janulgue
 <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH v2 01/11] rust: io: generalize `MmioRaw` to pointer to
 arbitrary type
In-Reply-To: <20260421-io_projection-v2-1-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-1-4c251c692ef4@garyguo.net>
Date: Mon, 27 Apr 2026 15:44:21 +0200
Message-ID: <87ik9cr00a.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: GN3UN6VRIFV6LM7N7J6EO4LIJCPM2YCH
X-Message-ID-Hash: GN3UN6VRIFV6LM7N7J6EO4LIJCPM2YCH
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GN3UN6VRIFV6LM7N7J6EO4LIJCPM2YCH/>
Archived-At: 
 <https://lore.freedesktop.org/87ik9cr00a.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> Conceptually, `MmioRaw` is just `__iomem *`, so it should work for any
> types. The existing use case where it represents a region of compile-time
> known minimum size and run-time known actual size is moved to a custom
> dynamic-sized type `Region<SIZE>` instead. The `maxsize` method is also
> renamed to `size` to reflect that it is the actual size (not a bound) of
> the region.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



