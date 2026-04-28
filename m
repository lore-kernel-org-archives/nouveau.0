Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F195FF885A
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 13:22:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77AC810EC9E;
	Tue, 28 Apr 2026 13:22:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="kszh/63M";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 404BB45C95;
	Tue, 28 Apr 2026 13:10:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777381830;
 b=srVkEugNBNLrC6n898ywgD1vf2jeQa1vJONDYDCwmLOHW+LPeMkargt6+M75ZkeceLb8h
 WY1e5sj59oBVuzoXGD7k/HLk3AAG5fe6QCvUYt4LhNHax2PbocAhC+IJjXcTAT++I4omVcs
 7FY/sJuheh2Vomd8oQRzHNvRba+tYmABte1jb2rB27yc74+gyNOOHOCtPG6fDMv4egZQHxI
 lnzhgUnOg61CdMFHfGMNU3KRX/ajkTRSTAe7JnUQGSlLi3yzpqkHaymhdn6wA/VwGx8P5Yd
 zdT6zRL2SBcPedZbnO2Und239hX7EM6HgleNJz8D2xHVPV9oafl3QaR8cvew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777381830; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9rjTYTuP7L8sLjc7X69kwiggXB2C5UsAdNVY1jH4Pk4=;
 b=BDM2MdxG63udzdYJyPxNsHen2t6pnCY91K1o45NN2uwP4hHKOiQc0EC2YXookCnWdFcCV
 BXKWBbkUN1s1gngOu+xws243Hal9EUACDP5HKqBzk/7O6+pnUejPPIU32i53Zpgg6NZi4k2
 Zc1YSmT3gWQnA7TwevHdFCtm2nzU22kvSaN1FNqhWyI6f+jQc1IlIEGvmVDgtV478lRdIJ0
 PV7tEMsU+cmmUqCja0bxegxBSF4yFCXwXI5G2lVka0qAS2eHwR3qTMqXKytQ1/60uI+NnPD
 Jw59lnLvOJ4HeH/wNFHB2xhtdYrKF/rP/GhA2t6weUHdDYSwJcm0jem7yajA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7759F45560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 13:10:27 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B35610EBC6;
	Tue, 28 Apr 2026 13:22:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F0BA461119;
	Tue, 28 Apr 2026 13:22:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E17AC4AF09;
	Tue, 28 Apr 2026 13:22:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777382568;
	bh=9rjTYTuP7L8sLjc7X69kwiggXB2C5UsAdNVY1jH4Pk4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=kszh/63MBzQJEBmRrcmOOTYxhbiH13kOw4r74yEHr2fPGmknb/wxFKK+mPYoY0GER
	 gajWe17zROcN87QMYobkstYdeaU7QjKWxTkg5CN5v12MLTMG+8PSmrRItUxUKAecXe
	 J53yiINuqNVAZOGRNUKY4SydOjZvhlyTyRD1Bn50JgBrhGHcOYNyaFV0i9p2UorAJ/
	 jfwlXFH0ebYuCb5q12m19COHXFOQidwX46t2g0iSXekZgAgvt6cRHqN8jcTnjbaTk2
	 VO5oEvlFOpsHszFelT3A5Nr7qKMNK+PyOdeKk81+kMprCMYXrnLImb5xCLhVqIWSTH
	 Fida1mVcj3kQg==
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
Subject: Re: [PATCH v2 07/11] rust: dma: add methods to unsafely create
 reference from subview
In-Reply-To: <20260421-io_projection-v2-7-4c251c692ef4@garyguo.net>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-7-4c251c692ef4@garyguo.net>
Date: Tue, 28 Apr 2026 14:10:12 +0200
Message-ID: <87qznzp9p7.fsf@t14s.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: QZIZ5DQ6EWVAFZLXG6PDL4ZMZPYTWJTO
X-Message-ID-Hash: QZIZ5DQ6EWVAFZLXG6PDL4ZMZPYTWJTO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QZIZ5DQ6EWVAFZLXG6PDL4ZMZPYTWJTO/>
Archived-At: 
 <https://lore.freedesktop.org/87qznzp9p7.fsf@t14s.mail-host-address-is-not-set/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gary Guo <gary@garyguo.net> writes:

> Implement `Io` for `Coherent`, so now `dma::Coherent` can be used with I/O
> projections.
>
> This allows the `as_ref()` and `as_mut()` API to be used in smaller region
> than the whole DMA allocation itself. For example, if a ring buffer is
> shared between GPU and CPU, users may now use the `io_project!` API to
> obtain a view of the buffer that is uniquely owned by the CPU and get a
> reference.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



