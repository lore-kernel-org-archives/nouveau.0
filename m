Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6660FF8869
	for <nouveau@archiver.kernel.org>; Mon, 27 Apr 2026 15:00:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CB81310E7AE;
	Mon, 27 Apr 2026 15:00:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qQoslP+5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A787045C79;
	Mon, 27 Apr 2026 14:47:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777301273;
 b=apMZiNBaVCB1+fhblhcf46MZjpiDY1ztWa05w0tna9sfh3bPu/5U7GIY/7J9ulixITfQ8
 TT/qqqxMM+x1swncBRA4HI9LpSUeaQf+YDnOzxgjwoj1xA3eJ7IEHVgaDx/qT9W7LmptxRG
 o3vQSiALwAiTqxjkartgu1gkzcFJsHND68iUu/0j0gCE5zTvYIirt7j/r2MmfjwG1qmINYM
 t2k7M0uhZNS8IZ1CwbAt1cOiRETvbw6zYzEnVym+N3qyeiIYtSfRUd3eqMQ9H7d3DNKwEGP
 sQ0H1lJFxUbsm6wufcuiG1b5aQlp6Hiys5817Fje6JkABJBy9T+Fum8IuRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777301273; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SvqjExqH1mkKWJnHyinuMQQfSa4Iy3mz1aqPW9CT0zs=;
 b=R6zjCbWXgqnrtHyj2FhFfasZql9enQpJvMwuU8hJw6ih1wwjhhw6/pjwhvuD9XqvuFaAT
 FNOcvTm3Lakc+q223pVqTgeusAQ8glFkFIoQSZ8Elz18mtkR6O/HjVytAVk7VxbxbBsXTcO
 qfGlFnp4pvHmAIBegf5jHuCkpQA9Y4E5CksMW7y557ceZ738kbAaolWaVXMaAwODWrcSqPA
 vQP4XbKqrElYwGdaedkIGsoNt1a5uFxDdNl8i6C+HYN0XrxOL+ZVLKUyl1Z/OQpEdIlN0s2
 GrIOcA9Ya+u+z15RBLyTaIKQWx67aov8WaBIym24xehOJ7EvCx62kvqDi9fQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BAF2843E17
	for <nouveau@lists.freedesktop.org>; Mon, 27 Apr 2026 14:47:51 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC26610E7A7;
	Mon, 27 Apr 2026 15:00:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DA6460581;
	Mon, 27 Apr 2026 15:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A590C19425;
	Mon, 27 Apr 2026 15:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777302010;
	bh=SvqjExqH1mkKWJnHyinuMQQfSa4Iy3mz1aqPW9CT0zs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qQoslP+5qfAc6xUuT5b3W86ANE5BCglrib8L2V58nIhUGL546B8mlwFODMA/aXEeN
	 e+ZpUWgoohBDO6EEUuDIA0sCeG7jmEhv5K2RA5nkEvUN2m43i8i2CThEXw4a7bzd52
	 jApJAPJSoqHHUTKGwA/QAIMJ1bh/eohogIkjjPMcvAGswqU4hed9+CNC9Lz9BQC0bh
	 71+tBearoiurULXIXnfJyydH13fRKPgybgqH71GCrPZ8kjyGCoiC7Mi0h5XEznOzE5
	 aBWxGL62oXXc62F/xCkvKagL3vo7BEuCMoSDAhTdxcx+t5FU5330gAhNtB27c59TR0
	 ZmhIvz4tOnRsQ==
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
Subject: Re: [PATCH v2 02/11] rust: io: generalize `Mmio` to arbitrary type
In-Reply-To: <20260421-io_projection-v2-2-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-2-4c251c692ef4@garyguo.net>
Date: Mon, 27 Apr 2026 16:10:07 +0200
Message-ID: <87fr4gqytc.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: OKPVPDTAN4KQMEFQIACBQDEMTTP46RWD
X-Message-ID-Hash: OKPVPDTAN4KQMEFQIACBQDEMTTP46RWD
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OKPVPDTAN4KQMEFQIACBQDEMTTP46RWD/>
Archived-At: 
 <https://lore.freedesktop.org/87fr4gqytc.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> Currently, `io::Mmio` always represent an untyped region of a compile-time
> known minimum size, which is roughly equivalent to `void __iomem*` (but
> with bound checks). However, it is useful to also be to represent I/O
> memory of a specific type, e.g. `u32 __iomem*` or `struct foo __iomem*`.
>
> Thus, make `Mmio` generic on arbitrary `T`, where `T` is a sized type, or a
> DST that implements `KnownSize`. Similar to the `MmioRaw` change, the
> existing behaviour is preserved in the form of `Mmio<Region<SIZE>>`. This
> change brings the MMIO closer to the DMA coherent allocation types that we
> have, which is already typed.
>
> To be able to implement `IoKnownSize`, add a `MIN_SIZE` constant to
> `KnownSize` trait to represent compile-time known minimum size of a
> specific type.
>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



