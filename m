Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 152CAFF885A
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 13:22:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F1D910ED02;
	Tue, 28 Apr 2026 13:22:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OiiW3wML";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EF4A245C94;
	Tue, 28 Apr 2026 13:10:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777381824;
 b=lG0tRVyY7wrFd+AAwY3fRkE1R+ThIznhwGIxYa9PZcdA6YrSeKik9iIe2PeQKAauTVKhq
 xB+XcskEzNnY/dVB/MukhPskXsPDor2egZ1ulTqC63Q37SRbGvo6hQ5Qfm3HDDTkHZplOOY
 QOmIfdBZtjCWjDxvhMq7Ug8bT0Zl8pniNdNTQg0Q5Jx13adrxALZqUFIgL7NacSppbUKYt/
 BysvmU6eEDs0YiP8kGyhY79EsoQWd3bbo+XJXlXJxOp/h8skBL0x36L/tSJqlRL5+6RpgUC
 CQGuQQRU68JAs/sWMVGR7veyai8O8IgaObJaZbQqv6b4CH61VWNluZqyqlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777381824; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=M1huU9amtIwVkVET6Mnt5+JELOvaJpGXaOgvuKFhvMs=;
 b=IRqFJhAseJv+fna9Uzt9JFKA5yRrLUQgS+2R+Y0LngDKTCqMYirm44PDUdhfw92Ch2lXj
 sWhdxNLeEfmiXXoJ3X3RdA0RApRFpZSVXhZdqIot3moThaoiC35HchB2ksmX4Pp/abuXkVi
 tiJLbofMKK8JedSuw4dX1qIRpSmv4nCUDCaJQsuK0heD/vzNi1sQzBD/R7iK49WknJEAbVR
 yrl+f3FCyULFSKLsEiDpsRi8iwm8xvx9/f9bfliaAkI7caCVWozEnLyRaqkfZNap33G87fJ
 hm8BJ5RVfMP/TjPutvEUvxjXnx2OeOwC3M/uqk+SArCrZ+BmMd4tZpCwGzuw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A131345560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 13:10:21 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE3710EBC6;
	Tue, 28 Apr 2026 13:22:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 155A461119;
	Tue, 28 Apr 2026 13:22:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8093CC2BCAF;
	Tue, 28 Apr 2026 13:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777382562;
	bh=M1huU9amtIwVkVET6Mnt5+JELOvaJpGXaOgvuKFhvMs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OiiW3wMLHpl4S5Wz4DZtog1aQWzIYgBsMSYspKvyKB8CIWD91tcGzzeyTNYgfv7wf
	 mEgvRbMt7A+3wgGvh/nT/1R/D6EEjoq2kBU10hxHwg2jU0AK03H4vC/HJMrQsFJVEL
	 BSjhkvwvmNJjhI701K9k06IuP+iBAwShkzlAk8sLRQQRsP1s71TghxfnVEGXtWeuE6
	 hZHcu+uD0LgWthhMv08g/dEyRIFqd6HpV6j0FmpAHpdig823kFoWsMvT1nstacs4jc
	 fBNE8/dPdy20V+za2VdbCqfOE9Dq9a6MKUNCSs99wR0pziJSuU6jIL89Df4j8mVInb
	 luRTpuL2qYUpA==
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
Subject: Re: [PATCH v2 08/11] rust: io: add `read_val` and `write_val`
 function on I/O view
In-Reply-To: <20260421-io_projection-v2-8-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-8-4c251c692ef4@garyguo.net>
Date: Tue, 28 Apr 2026 14:53:39 +0200
Message-ID: <87o6j3p7os.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: KIBXAMFBANOW7KENGY4U7CELZH2GUKIF
X-Message-ID-Hash: KIBXAMFBANOW7KENGY4U7CELZH2GUKIF
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KIBXAMFBANOW7KENGY4U7CELZH2GUKIF/>
Archived-At: 
 <https://lore.freedesktop.org/87o6j3p7os.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> When a view is narrowed to just a primitive, these functions provide a way
> to access them using the `IoCapable` trait. This is used to provide
> `io_read!` and `io_write!` macros, which are generalized version of current
> `dma_read!` and `dma_write!` macro (that works on `Coherent` only, but not
> subview of them, or other I/O backends).
>
> For DMA coherent objects, `IoCapable` is only implemented for atomically
> accessible primitives; this is because `read_volatile`/`write_volatile` can
> behave undesirably for aggregates; LLVM may turn them to multiple
> instructions to access parts and assemble, or could combine them to a
> single instruction.
>
> The ability to read/write aggregates (when atomicity is of no concern),
> could be implemented with copying primitives (e.g. memcpy_{from,to}io) in
> the future.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



