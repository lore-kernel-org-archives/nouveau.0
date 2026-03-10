Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D43CFD4F0D
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 17:40:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BAE6D10E775;
	Tue, 10 Mar 2026 17:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="IU6ukDu/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D8FD545019;
	Tue, 10 Mar 2026 17:30:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773163804;
 b=Jh8rCySUBIh3yFNWAEzV9N/l7rZrT8wKw51QmxhB/bMpDGFanisNS3+oJe7yzi2TH8ciO
 7SsdV2TbafAenG9NlYi1aZI4QTVJsN/83HxGs96egAvq2pnqcJ/m0IAFkphRuI7XKdOUDPF
 fJ7E2THg4SCAzt1hO9+h5RC46HPfC8gZjiS54lgpa8LwY3xt2O2bDnQjrFN/EZdwY40FEUH
 FXZG5Ohg+4TA/xNN0WY9y8dRsLq2jo5yl8GVQIQfzi7hq8q9YMVlxJNJ//o6gAXGbTh0cTC
 +AHiifL6msk/yGm7PS/XkH0QPK3GSmHQa6FTvEUCGzVw3x+phvsQdyEXHXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773163804; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d1DDQsl56wFMQYOdlxjbg7ksoOik7Zl9BgBnTcawGfg=;
 b=svahIXM1uwM7RPqxibM2RB7JHfOJVG6uRCfpLbUJaisdJjNcI38V3SY9Z3n8jK8t3Shv7
 xfJBJ3vCdeGPxLt1dylxnOEQKGTaqZW5pzjg6Ul0qpzamUjuiZFzrW31aoDT5TRnm4m/B8C
 WnFw9LC9Fv5uBftpLCJZ1V0UhuYsrw3oR2Ymbqs+2AaS+12kaGzo0/iXPne9y+Vxlfaeww2
 VPEQ/+I5DvDVS60NLsHlWg26tLv2POAtat7KH4ov52pvNyUzLNmpPNiBcEoCLcXn5R/fs1m
 6ahklA/yfpyPHx3EfPdLETzDGLFK6kU+5+pisLJrR+K5eXRBXp7cX6DDvQwg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1B1FA44F11
	for <nouveau@lists.freedesktop.org>; Tue, 10 Mar 2026 17:30:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C3A010E690;
	Tue, 10 Mar 2026 17:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2729041AB1;
	Tue, 10 Mar 2026 17:40:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93826C19423;
	Tue, 10 Mar 2026 17:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773164435;
	bh=dZcsL0fWmyyyT+dQAR3Tw27jgu+4nBjdpMoWNfXiRGE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=IU6ukDu/7o3EsXY4ZbhK5KDzIDLwThH1lDsx5GEybwp0pY4JtE+FqnjeTXLapyu70
	 f6b/+h80mFDLbb9oEuxyxCqCGPzxmPQS4uBmAF9nbFcT4+APDum+cBkozCm6OW72eL
	 vWiaomYoj/Mn4OtvuNbv4Z0FS19z652Dqq4SpYm2MCYsvdOiUdIeA544+6sbHYMXRG
	 akqOK+rUEWkHw4KjvBvGGOuMs1j9tjWoUeXEsM3bTqwaicly4Ul2eldP71Plh1vDCS
	 18xiQLe0ebXJYGo6uRbM2az2OZuHgvOjFsF5rNVVVsEQlLIu3cXa9K1xn9sQiS7jYo
	 Ffx0ONT0DD1gg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Mar 2026 18:40:28 +0100
Message-Id: <DGZABX6ABLN8.SBT6J72KH8YH@kernel.org>
Subject: Re: [PATCH v4 4/4] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
 <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-4-4ef485b19a4c@proton.me>
Message-ID-Hash: FMUP5SBZCYUOOATUCCYB2UJRMCSKFRWI
X-Message-ID-Hash: FMUP5SBZCYUOOATUCCYB2UJRMCSKFRWI
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FMUP5SBZCYUOOATUCCYB2UJRMCSKFRWI/>
Archived-At: 
 <https://lore.freedesktop.org/DGZABX6ABLN8.SBT6J72KH8YH@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 5:34 PM CET, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>
> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>

Applied to drm-rust-fixes, thanks!

--- commit ---

commit c7940c8bf215b9dc6211781c77ce80e76982a723
Author: Tim Kovalenko <tim.kovalenko@proton.me>
Date:   Mon Mar 9 12:34:21 2026 -0400

    gpu: nova-core: fix stack overflow in GSP memory allocation

    The `Cmdq::new` function was allocating a `PteArray` struct on the stac=
k
    and was causing a stack overflow with 8216 bytes.

    Modify the `PteArray` to calculate and write the Page Table Entries
    directly into the coherent DMA buffer one-by-one. This reduces the stac=
k
    usage quite a lot.

    Reported-by: Gary Guo <gary@garyguo.net>
    Closes: https://rust-for-linux.zulipchat.com/#narrow/channel/509436-Nov=
a/topic/.60Cmdq.3A.3Anew.60.20uses.20excessive.20stack.20size/near/57037554=
9
    Link: https://lore.kernel.org/rust-for-linux/CANiq72mAQxbRJZDnik3Qmd4ph=
vFwPA01O2jwaaXRh_T+2=3DL-qA@mail.gmail.com/
    Fixes: f38b4f105cfc ("gpu: nova-core: Create initial Gsp")
    Acked-by: Alexandre Courbot <acourbot@nvidia.com>
    Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>
    Link: https://patch.msgid.link/20260309-drm-rust-next-v4-4-4ef485b19a4c=
@proton.me
    [ * Use PteArray::entry() in LogBuffer::new(),
      * Add TODO comment to use IoView projections once available,
      * Add PTE_ARRAY_SIZE constant to avoid duplication.

        - Danilo ]
    Signed-off-by: Danilo Krummrich <dakr@kernel.org>
