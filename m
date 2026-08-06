Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B93C5620A
	for <nouveau@archiver.kernel.org>; Thu,  6 Aug 2026 10:00:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19CCF10F15D;
	Thu,  6 Aug 2026 10:00:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DCV0VvdY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3E791475CB;
	Thu,  6 Aug 2026 09:44:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786009441;
 b=d2uwQq5jQNl0lEd8KbsS7f+Nc1n76NQ0X0MO5C6uOMR8nNnuDKXtv5P6PJ8aJ8gjFF1F3
 teO7TMzf3MWr0pKxEPNL6y3zwzPnx8dWAXM1Yx5l3QSYIKaQ68SiEKBsA051I7kJ4tmzcxU
 KzcK+803q1zwIoPqyMF0Lh6w0vRYAbNZkrVQe6pV1tzdh8nmjygvAqZdbZCW5TNL/79RjLj
 CcF0pG233ynzU8NqTIF9cxp0g278TZ65OyroELEFXwMjcENA8K/e1jkNH1A5GdPnV48Q7GS
 oF2g7p8ByYEQsFRd82G7c+BfXioCr63ffem0NCkTxMQC1TfjSgo1onmhN3DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786009441; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=8102EMdRsA752wQbhXTdKaIRmXwR/nDaRkxmP1E6VH4=;
 b=Zoxi0Mjfj3/8sumo0o7/ZMPgvTNu6SHbNIIVv0iVe1A2xo/r3k9aTAwqe6Lupsi1BG4bH
 v29BGqgux8Ivp0Ae74maO4p64r4ru3ygXger3s16H28FA6I/ULSZ9CykToEKblGGQswXpOe
 XHz+ih8RQL6icbcgm3qMEFptPUYXwp8AxtSiTcxMbhAdamo6zgUVoh7Q6FHoNo8hMnrF6SK
 83VCyYSnUOOTF5jzMJ2Hy0cWGahNaHLMFXrUqwAq2gnoHPM69Z8Bu+kf7AIaWa1SIRQAh6C
 lBJ8RnILjX4qbHol9CeZXVyLM7CaUycr2xy1yWo36W8UfM8wD5/Xy/YcxLXA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 967594709A
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 09:43:57 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAB710E2B8
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 10:00:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-47df6a5655aso254641f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 06 Aug 2026 03:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786010399; x=1786615199;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8102EMdRsA752wQbhXTdKaIRmXwR/nDaRkxmP1E6VH4=;
        b=DCV0VvdYMsaqd8YRqzANMEmeJsCCfRgDwX9p6A03qJeWVfze2oPaSwGlmocN/j21D5
         bft7GhGzx6hClGExmOsAwKsPyBnlOlCB9+TUvOKDUKQD0uGKSEh0qvmt1vIMo+GIfk1i
         dNXzMtcGUCHBc8N/GSZZPrqUbcjsirPewTNcr2XHpKcxqVSnguraaloEywvr4HAtw2aS
         0v6SG8Cxyjq0jSf00bAhemTxnd1GFRh5pgJH2kWfaWpvIGtH/L/XInSV1LleMxt87+Rb
         xHDVlFDBIi3+Uh56Bs6As7n4NuhEs646xU6nbM7Z2j4QLtWvbBWnW/0pxiOspb1frU7u
         EaAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786010399; x=1786615199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8102EMdRsA752wQbhXTdKaIRmXwR/nDaRkxmP1E6VH4=;
        b=ayrvKQ5r4oBhmRD8zc7zOMJqmwZZ5Jfe2IpZb83pvTd3wZBn2tG5yJRx1wp5Le2udN
         GtSjh9jDeh2MJDSP8qmmyEHIzM/pDZHfKWbsrYGprFDcI/elQ7uaiPIe68vdisltM4ah
         kgvqUny2w5Z9Fj/nspw3XDxnrriEAiJyK5xLAX+pEmaL2kTH990PVqZecaFunIEkZCxq
         3S1O/J4+W2Z4s9KWIEW9tqG1mpRG6JNeiXQ6SHAQMuNBz3RdyTt0HNB8t5Kh37l4cInI
         IvoC3bVzPMsQU3eBFI4L/rH4YLWVVwJydhd80Qlkkdly2rMiv4QNqSvEuMhGs2mk4b/M
         Td3w==
X-Gm-Message-State: AOJu0YwUGTuJccnn09spTgZloZ08szZXdUcO/Vk8kUBOnyWRevPXcLkL
	VIKPRlB8UpluKcxtqbjJGCdivXEgU38+lMqvv6NW77HPe8qPhvEDTmVrArt5SjGMRUA=
X-Gm-Gg: AR+sD13LhuqI5cpAACDi7RRy98ggBbLNETRvm5gmPkNzulFdGl4SwRiV4ptcA3sQabi
	0n5Qd01xUueeO+VcIb/A/acF+z77L2B/8RxpwYSshUyP2Ne8x1UWUoTPIwG/ORL2xql/q+c1tX5
	CC+eVq6CqJB8hkYVpj2RWmV9CTPU4TPaqTWKgICwZPnRtxEuteg+ZJPM1s+uvq2pPmWZJ9Ecfx5
	oWmLirLL9uwYmL1sP+lLOmpjH8P2jI7cI0XRBwTZrpNoKwngE0m4vJNx3y9NgvpeQ6GMRkNzNnM
	AZp34UxFRQm6ggVCIghE6quQj3FjksItdNm9eqevxT2+ETwENKJ2IwsQAhxjbu9LIts6LVA1Ttf
	nrMTDVQnELVaNqcyQ5ykhSYGA0TUAldyk2DmBrRJAzgvo4SyC7nmKJS9hzGRaYEVJxdp9h/0LbU
	v4VHlYYD2mPc6QxhVPH3x4/X1paWWbyLPGNRb4BIoGeRwzyDPvvLkiWBTUqALXWrj3rK8eQ6W9+
	SeAMIkbjcmC5RewQtId7CHhIcQxRaL0Pqe5zgXySY9B8nb1/WZgkV5O+7J8DebOQw==
X-Received: by 2002:a05:600c:1393:b0:495:650b:4c61 with SMTP id
 5b1f17b1804b1-4994e7d0166mr98743685e9.3.1786010399195;
        Thu, 06 Aug 2026 02:59:59 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49954206d9dsm56510905e9.2.2026.08.06.02.59.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 02:59:58 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: Re: [PATCH v2 0/3] drm/nouveau: nv04 FIFO cleanup + recovery for
 Tesla
Date: Thu,  6 Aug 2026 11:59:57 +0200
Message-ID: <20260806095957.1908908-1-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806085228.1848994-1-mczernohous@gmail.com>
References: <20260806085228.1848994-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BXAC5FLIRGPTHU7362B273CT5Z2UNO56
X-Message-ID-Hash: BXAC5FLIRGPTHU7362B273CT5Z2UNO56
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BXAC5FLIRGPTHU7362B273CT5Z2UNO56/>
Archived-At: 
 <https://lore.freedesktop.org/20260806095957.1908908-1-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Both findings are correct, thank you.

I checked them against mainline rather than against my downstream tree:

1) nouveau_channel_del() frees the fence context first and only drops the
   kill subscription later, among the nvif object teardown calls. The
   subscribed handler reaches nouveau_fence_context_kill(chan->fence), so
   a kill delivered in that window takes fctx->lock and walks
   fctx->pending on a context that context_del() has already freed.

2) nouveau_channel_init() arms the subscription right after mapping userd
   and creates the fence context at the end of the same function. The
   backends publish the pointer before the context is usable:

	fctx = chan->fence = kzalloc_obj(*fctx);
	if (!fctx)
		return -ENOMEM;

	nouveau_fence_context_new(chan, &fctx->base);

   and it is nouveau_fence_context_new() that runs spin_lock_init(&fctx->lock)
   and INIT_LIST_HEAD(&fctx->pending). The NULL check in
   nouveau_channel_kill() does not cover that window: chan->fence is
   non-NULL and unusable, so the handler locks something that was never
   initialised and walks a list head whose next pointer is still the NULL
   left by kzalloc().

Both are unreachable below Fermi today, which is exactly why they belong
in this series: 2/3 lowers the gate to NV50 and 3/3 adds the caller that
kills Tesla channels. This series is what makes them reachable, so
shipping it without them would trade a recoverable fault for a
use-after-free.

I should have carried the first one from the start. It has been running
on the reference machine since 2026-07-25, and my v2 cover letter
described that same ordering and then dismissed it as "most of that
window is harmless". That judgement was wrong.

v3 will put both in front of the subscription change, as 1/5 and 2/5,
with the remaining three unchanged apart from the rebase.
