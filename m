Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39402F33804
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 06:50:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D77F810E347;
	Tue, 17 Mar 2026 06:50:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="uo0mFdiS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6DB66451CB;
	Tue, 17 Mar 2026 06:39:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773729557;
 b=ayee9fba7fgSAceD2mwVzOIsNy1DIUdqXoNfRGjzVc5LPvWA8Ya64akymdoAo+k+gQT7E
 dure8hCDPfBBi0UwlgxQPw3dykxMIa8vvsNMSGTkytQCy4CejlcfyXBp9jfAUbnvW+kY1ua
 aW/BS7qmKU0cHoBmtYevSPI4KTMDWk2V5rU4xg7yel3aorlk3kjLnIKVmU5ZldQ+wtSfqsp
 0Az4cihdRYGPWyudi7xv1q53Z8UqtiJdQAMPuYNWdv93y+QyFiDBGqphYtzFdRwzrcE4kXy
 sJ1cCm6NOw1ZUMvAP9wgw4kNzpM2jAhtmK1LcuP8ERQX/YZRdxJzcJjCEadA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773729557; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
 b=Q26DUK4ZoGgcmI5lNpTyiDTAstMnzfB7e+D81kxNtZhRozunE3jVvIDxT08uq99tyQTEj
 fmjHN0E8ry2AOIu6IP3vtxFeW/eAKZDPMnvcxwHUOeiLizkt9v1p9uJVdHne9p9Nogsc/Fv
 3Dl2lxCP+xYuWhpK1ENcY46ul3WXVs16uwE5pj4N+A1vhYu/w/blfqA0Sm5gnM5oHyztG/0
 hbd1D+fVlESNx1Wlx56IZ+0Uu0taAm4UWB6cD7jWkeM49X1+FuTKoS+YvZ+2HmhAJcOPPl0
 X8ZXlm2AFP225cl1huA4QLpI7lgCAE6vPY406BUwurFDKGFIKFCC9DB79yaA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E2E3645168
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 06:39:14 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 23EBC10E33E
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 06:50:03 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4853a9467c5so29962845e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 23:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730202; x=1774335002;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
        b=uo0mFdiS0Ip8Z2i6F56p5h/OasWN5aQovxrriWg7KiHhQRjKgqS2ohCPW5Eltm18mm
         5DX1nl+2O0Pv3qeCljmh6gKHcDGYJ1aPft3uPOVfPoKXWo6dunW7DkJDBNNd8YgLFYtg
         XYlAfaaszuROWNNnAYVXi0W6zu43RGfPgFMEamVu1JXU5xuDWH1JuQNOes/+DfHI/n4J
         WKSFGnMmuY0Zu+sIEbfa0I9RhCO+e2ztxtXinC4Z7bLM5QnSQJJXQ1ToeMYma+t82Vqc
         peJO/8t95sfHnv/j8ncTI49x+MwLp7Yzob8Y02K3CT0niivZNY0vlJ/nL1Bfp+OajQgy
         rGgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730202; x=1774335002;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FxvRr8+lOBB6LohtXEdeEzhkagUanjKQw+ztADkvzGQ=;
        b=YmXJJsG+rfOhYylawF58K/3sW+e1bdaVwfK+lO94+aZERas70qVyItwzeOWfaZZc2Z
         HztLU/2LhhAIEF08WS1tdlZNK32m9OnB+lZ0ds/DKUbROKkH+jGdiqpY6nZq7O7ScYJe
         0jLOIiL2YFemjuiCcylSbvNQMpomOyUmUR6X0bPemRTHcys2l5OZ0LivJ9eBHqpz4l6B
         Qe/HKAYysKj8ZvWN3xulHh90P+oC6AD14VguQfRFTmo7bFbSWVdLMJlvDUMuBMOkFyTS
         LXXdCwBtOnC2dL4ZRZfvu369C3ymgG3EF8h5RepbWCq6Orjo+J75cY7pvU5Q84TRM72f
         jnzQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKVXd8jpCsY+aSWMKrcedGBwggtkZ3JQkoH1ukvNthO+WVnvF02PQNhho101EYtr83L2jYNiWe@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy4FvN8www4FkjvCN5L+tvk/pKqiRhAbvOqbjndSlQiEUofbko7
	r9sH/2bebtfPSzeDDa6yZrEtdiBTr6KeJDNKvGiXQm2haftkAqOWMRc+R+djV/kSKPUoo+wOlWv
	lSTsA9EmQVq1sc7q3eQ==
X-Received: from wmop12.prod.google.com
 ([2002:a05:600c:468c:b0:485:40d2:1eb1])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8519:b0:485:5812:bb9e with SMTP id
 5b1f17b1804b1-4855812bbddmr300430745e9.0.1773730201517;
 Mon, 16 Mar 2026 23:50:01 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:50:00 +0000
In-Reply-To: <20260303162314.94363-3-dakr@kernel.org>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-3-dakr@kernel.org>
Message-ID: <abj5mOYQAY290nqY@google.com>
Subject: Re: [PATCH 2/8] rust: dma: add generalized container for types other
 than slices
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: A5DKQPS6F65VTAWTQXQZWDUMFI7EVYTI
X-Message-ID-Hash: A5DKQPS6F65VTAWTQXQZWDUMFI7EVYTI
X-MailFrom: 
 3mfm4aQkKB8Qkvsmo18rvqyyqvo.mywxy45ok4vs232.p1oono2u3yz.y1q@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com, driver-core@lists.linux.dev,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A5DKQPS6F65VTAWTQXQZWDUMFI7EVYTI/>
Archived-At: <https://lore.freedesktop.org/abj5mOYQAY290nqY@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 03, 2026 at 05:22:53PM +0100, Danilo Krummrich wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Currently, `CoherentAllocation` is concecptually a DMA coherent container
> of a slice of `[T]` of runtime-checked length. Generalize it by creating
> `dma::Coherent<T>` which can hold any value of `T`.
> `Coherent::alloc_with_attrs` is implemented but not yet exposed, as I
> believe we should not expose the way to obtain an uninitialized coherent
> region.
> 
> `Coherent<[T]>` provides a `len` method instead of the previous `count()`
> method to be consistent with methods on slices.
> 
> The existing type is re-defined as a type alias of `Coherent<[T]>` to ease
> transition. Methods in use are not yet removed.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I see you have both `size()` and `len()`. I think it would be clearer to
rename `size()` to `len_bytes()`.

Otherwise LGTM.
Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Alice

