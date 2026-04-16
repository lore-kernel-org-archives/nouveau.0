Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B08BF88092
	for <nouveau@archiver.kernel.org>; Thu, 16 Apr 2026 07:07:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2A49F10E821;
	Thu, 16 Apr 2026 07:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="koq8gCOO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2F4E6458CB;
	Thu, 16 Apr 2026 06:55:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776322547;
 b=FTxysKCPbeUmybKeeDwasfGVt4k3SzD95TogVW9z+vm/++u8nUsuGK9VNsynetfaWx6vB
 V5yx4Vg8fq/MSAobbthn1w/+tzLYFEL1KiEAGtkJhOUclC+/qHvcJeQ40eQTCXA/xmy8uQN
 ijl4hq46r49nZjzUVuk9jggx+iMLpeCuMwceiHmYKD/3WmhI+SyRVCewz6erqtB2UtyhmST
 kCyVQ/VAL9oYdNSUtRIdsbAXZ2bYjE5/EHGCKjL/H2MdwVq49IbEugAKuoc4+dXGQ1rvmXb
 TmUEtuULckA8lvdgGcbYqJ7Hv8B5mSkJS/I0q6RThUU8qBgACv5E7eDR0/vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776322547; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
 b=MtRkzWXbbxGXUCIgOgJ9rHDNe+R2w+6fRj05ki3/EkjAbAy+NQ8W+TnD8e90tdBsYo0Un
 Xd9cM0qu73D+l7nJuKYP9Guw48LcYGKTDTJOZX2S54uALC2fB3Z+4b2ppdfDXyEeB4YMRMP
 3sQSJZCS+ZMBcxklWmAtasunpvAx6Lntl7CuF6T+jYeVPfJa1H5GsIkCb/0PXUfCYh3gCFS
 ygDLHSOeDxGW9Me5oZ30hSOm9U3S3HEveNi/v0y7qSN426GZmSzVFxT0yOkYSCyNXt3IUiI
 oSxZWCjq42gmOC2YWzowP52TazhINPvP8NNZ+041Y25qLVldbIIHnIC4MZsw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 20AC3405FF
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 06:55:44 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0105110E81C
	for <nouveau@lists.freedesktop.org>; Thu, 16 Apr 2026 07:07:38 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-488c2aa6becso61509705e9.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Apr 2026 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323257; x=1776928057;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
        b=koq8gCOOOUCi4JKX114j7+WGbX83jiwE+5J7tiJmrmI6WxSAS9uvwzVwKQ3xvkue65
         9MIuQCzy2dx0fOlUyd7mHQMAizPjGl5Hke2JV0g7aXa29Vas06lEkrBNLQPFtoY3b6kv
         mQP7WbVI4+f1ssS2Vu5TgbTRnE/885v08eqsSEKQCqFSj42YVpP/76roqpep2LF1b2nv
         zbn3YZ7wLMaAMdO3nXB3n8PEKZR1cWb68FsEUlsB51u9Q6k+pJifXwnspegDoGCJLiYF
         bucBMOPpzgOttffaYe9u6a++/YP8yHLDRbPwcFzNW6Y/SdDvC7lAPCUaVOtCugd92xRL
         +2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323257; x=1776928057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
        b=ANI5y1oYruBWImqKNNSPVkkpkJVn1z0AYwbcUNRVt8tK6Ws+iZTPCZ3Z8Z9ipRlhyQ
         rgK8PVaqzhEJq/nInwS2xbJhLSjSP6EtthDwvshvq9Idihpudn8i0+8mZH0p6xgmHSfg
         bB3ij1yTkLmPHKTMZLLG2SL7empS5ZZBozkaD0M7rGBtZmejtXblLyLfWn10aLjccSs3
         K5LqWEH4vY1sMGIBEFWUvqMrjr3r+TP4Ulw3hZB2wYe3dmY5BRkICnbU9jYPcVn7YjIW
         Ecfss2eod1dSTxjolB5Mfkeyw+H2AozgKidOGHvvvNA2ga5UzQpGHmfs+cLA6OeYRbRW
         GETw==
X-Forwarded-Encrypted: i=1;
 AFNElJ9XviHsTMVzg5tlhvpEpF1LiF8Q+tYNLpEFlQU6hpcXRKQx+6u9BeKZknNCi6sT/evvMsNYVSfd@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxEeCyRZpOLbjTqxMsfmuH160Y2MXIu3rVY6wzt0ZT39GQoKKMH
	u2++BNVBdxQYCnZahA/Rlsr5RznCCPZGhEX+JLin9Bkm+GzPP2Zx6y7Ha1fXkGNzJSKe1ob/mtj
	9dLFWFjufiQKunbH4lA==
X-Received: from wmop6.prod.google.com ([2002:a05:600c:4686:b0:488:7f1e:5fba])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6d:b0:485:9a50:3384 with SMTP id
 5b1f17b1804b1-488d688209dmr315526135e9.25.1776323257405;
 Thu, 16 Apr 2026 00:07:37 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:07:36 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Message-ID: <aeCKuBOrhHWtGvAF@google.com>
Subject: Re: [PATCH 2/5] rust: dma: update to keyworded index projection
 syntax
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: G7OOU3MPBYGJTRDEJVJAG2GLG3OKTUIP
X-Message-ID-Hash: G7OOU3MPBYGJTRDEJVJAG2GLG3OKTUIP
X-MailFrom: 
 3uYrgaQkKB6YGROIKXeNRMUUMRK.IUSTUabKGaROYZY.LXKKJKYQZUV.UXM@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/G7OOU3MPBYGJTRDEJVJAG2GLG3OKTUIP/>
Archived-At: <https://lore.freedesktop.org/aeCKuBOrhHWtGvAF@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Apr 15, 2026 at 08:57:13PM +0100, Gary Guo wrote:
> Demonstrate the preferred syntax of index projection in DMA documentation
> and examples. A few `[i]?` cases are converted to demonstrate the new
> variant.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

