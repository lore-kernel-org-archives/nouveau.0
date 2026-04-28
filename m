Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA73FF885D
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 12:08:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB1710EB5B;
	Tue, 28 Apr 2026 12:08:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jJSopcu7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0BE2B45C90;
	Tue, 28 Apr 2026 11:56:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777377385;
 b=08BaTgAEwvA1LxKuJYUeHRTm4Oh5E+UdiM8sFMgB5yO6xu5e1Oy5o6W7EzygEytN2s5Qu
 Cy0xkTiNN2SLzELxu502ynJ0B/J17Ns0cKJZl3koxZA0aCmode9KE6p7ZHV+ycuOAXfGE1R
 hpRTpHoj4Zb6oBzqgEqRwr+8Zjj/ZHFnFUwsEy54MlCg4m67N3dT2dVYMP8s+T4lZmKtSHm
 7OdaHwpGxFoHk/Upe7zUQ19vBc+kWIQd9Wjzuuk1e0lqqGBO4OkuA09ZgkPkyeuedezFOur
 /ulhhZmAztUSomTjxpSwqMmF14LNUP63/zHz0Odprj/r5Q1iz6IfpDxjiXdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777377385; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bOwF+0GUALysM7CRy5XbgigqUCNNq+JTaQXbBGbEwis=;
 b=x08n5V9s89z5gyasXkIBnJurDXoOMqk+7F/rbjjimqkEhhg+VWX5tPkcO11JgBDbdhVrr
 UFNfZAU4Tk1Y17ZI/mDOGFaX77tXxovtOMTQkeC92W8Lw6NxkYSRP3gZ8W7qNum4EsIQDvZ
 rHtbcY+/qktYnVvy71jzrl5hUeeD4Ztg6p9mGIEMV5kTUHFFxU54FRDDC9gBBFGlPZW3exR
 ZAngk18dMWH5btRYyU5/aSKBsOsT9EMS/h0oKBelq5EZaPjv8JxvJTZgAwbaRJzR7ZjTWo2
 oKAB84mH5NGbtZebi0JU2swjFtufKHVj/Awqliy8GD6nexD4EpLSt8AcbalQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A8E7145560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 11:56:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92ACA10EB40;
	Tue, 28 Apr 2026 12:08:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1790660139;
	Tue, 28 Apr 2026 12:08:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC4EC2BCAF;
	Tue, 28 Apr 2026 12:08:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777378124;
	bh=bOwF+0GUALysM7CRy5XbgigqUCNNq+JTaQXbBGbEwis=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jJSopcu7jda15HdeY0xhBlkZIwx+pxlClsFUQyJUaur9Cx6PomSExXBNiotCduBKv
	 UyLAU3q3OED38hrsZZsx97gkH2Ej6yu+ex2+y0ZY619YfQSS+39Q86Xk9K/ryo5iTx
	 JY6irGEZSXTjjfU+vItU855lkPZTbmcSBWY299jeqK8wEoAPB5+Bsjcxf8BN9g2lb4
	 zT+dBjFhOwFCxfJ0lL51UhVvBtLq9RLhzLYGAfD+JyT7RHJudnAATVT4yoUbinp36R
	 Q/mm+t8MZyd/Eq0lUyPZ2m9qOHtMli+VaE9koZJAn6KZsCzmmYptnCgBCtAY0/sL17
	 ylekKk/IrXwYg==
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
Subject: Re: [PATCH v2 10/11] rust: dma: drop `dma_read!` and `dma_write!` API
In-Reply-To: <20260421-io_projection-v2-10-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-10-4c251c692ef4@garyguo.net>
Date: Tue, 28 Apr 2026 13:16:57 +0200
Message-ID: <87wlxrpc5y.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: EAVKKN3S7KP33RM22VI27AOETXKOVAIK
X-Message-ID-Hash: EAVKKN3S7KP33RM22VI27AOETXKOVAIK
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EAVKKN3S7KP33RM22VI27AOETXKOVAIK/>
Archived-At: 
 <https://lore.freedesktop.org/87wlxrpc5y.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> The primitive read/write use case is covered by the `io_read!` and
> `io_write!` macro. The non-primitive use case was finicky; they should
> either be achieved using `CoherentBox` or `as_ref()/as_mut()` to assert the
> lack of concurrent access, or should be using memcpy-like APIs to express
> the non-atomic and tearable nature.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


