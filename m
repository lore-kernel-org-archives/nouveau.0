Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D2A1109022E
	for <nouveau@archiver.kernel.org>; Thu, 19 Mar 2026 14:33:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72D7010E8F4;
	Thu, 19 Mar 2026 14:33:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="f2LP+u3C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D429D45214;
	Thu, 19 Mar 2026 14:22:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773930151;
 b=H0DPBCyEaZDZ1dUwPkaQ+0fM6JKVvxxXrs72QnAaV8/qv84EG5FKkrPNmADAO9CJSyEes
 7QI16/T79ZEcvAIOq8Qm+L4bS/hpldE/4Xx0X3oQLI88s73+OHg6U8yFzPacAmj/OEoVSSn
 WprfX1RtZetKptRgVmIzOoeVK22rs/Vx7kvF5X7EZIujCBY0YDpnhRWTbwtBOAW5xiBxaR7
 NB12qAFWMuh1xz5cUl5o/gRETwdgrcZExezLksxOCpy/6TqQP+XyLpNdsrsPWJWgucrmcA1
 3qjFrfQV5DRE1b5He2L33BONYFQgKEbem32cRQKVB4B6m1GY8VwWRMhFRUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773930151; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WPdU0RGKwneFH7OF6wzVXdtsY6BXzcqmiGE7v4NtV4M=;
 b=WM3IQ2VGwJ0qZUKZE9mkqqtUzD1oPx1+yQU80j5sPsVnLDejNNND6KVW4O4BUcrdrVWd/
 HjNCYvCVw0RSbHEXIVHC3ZI+juYLbZLd4Bde91hH+7HayhRw5BBxjBZC5aMmVpm3bs551ev
 bZxHJnhrvdnMVocIgFMvIXqpo54mDKWfJUmXMB9+AyyFGzFQFruNA9LDhog0rX1XevN3loa
 AtzP/SZfrjIMbuJo9+tSiqJMcN83KOtPjJ6QNiWctkh+gxwCmV0ofsFY5eS4oJpU76ept8g
 LroFDLO/HdmOUBBKA+IVBu0kfY10oKwNC5hh+9ZkeHrUPVyPr6yxamh3xB4g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 96768451EA
	for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2026 14:22:28 +0000 (UTC)
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E036C10E8F0
	for <nouveau@lists.freedesktop.org>; Thu, 19 Mar 2026 14:33:21 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b9820e80ce3so53989166b.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 19 Mar 2026 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773930800; x=1774535600;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WPdU0RGKwneFH7OF6wzVXdtsY6BXzcqmiGE7v4NtV4M=;
        b=f2LP+u3CltkBxiIAGyhH2rcaFZfDJ+dX0lUvHUZZ4386z1aOUE2cvSaitMHeG6so7f
         hUJBstCkWa9Im6tLgN5BHE7Rv4BeIVyAwEnwahxR4msquyIz4Gd+ko6NWJMjOxab2CAN
         fm1bXDInNXmLOJr20aRhRoK+jknE6Y53SiQBr1O9e+TFdQdMqPhXH70WaTba8Q/r5Jck
         9xCGXao+6c+KVXBtDpEPzX+rERypflsWWeY9I+EkMTD4dBLTr/nhr/8TCJrj8iv7y1qb
         o6VBZ6tZ1kvsCPfZc1YUXmtx1uLsy+baqnHxbNkmYC8rle6+md1basrY65cm8jVw3cO8
         Qjmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773930800; x=1774535600;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPdU0RGKwneFH7OF6wzVXdtsY6BXzcqmiGE7v4NtV4M=;
        b=QoNK8GOJEZfAxOoKBkB5GYLFzTIAzl1VHHJmxzrawXjxP52oJbS7rRif7VqfBqvTTZ
         9AzvtuyRWYIkkaRQj6Sj39wBNE9k8M6gB/PittbE5MahuBV5kSXyjp4TyRtr77jSGKeS
         0THSfdNGput98F1JZVJMVUKGFX0+H5NFQRGLMEyqq5yZ6H96RWZYEIhOsL7bhVCzBlW3
         K/0V8ISyfRPTy2HyVBqEjidmh+QekQ0xr79Eu6Gh5+in8ZaIoo+RMIk21iX4T/Qz4G+n
         qb22ZZXbM3zE256/nuhN5efsRE5ERl2GVw4NiVxPSNrz1VoWRa2Hj0aaNJpZ/Twt3/Bs
         iZpg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5uXyfZqKBBRfS6U1zjV+pyNYr50LrjskCr9loyqtW2TzircMgbUFyeScJOKmSYh8wtPhogh2N@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVNaOzMQde6fZSKVqUy6REHJ23LaTFLDrtZfwLozPR7U8cqh5w
	m5yQyLfx/nLrRWPladRmw8njZBOLetMPPDv5lV5Xf42vLDYY+paQIh4LF5BjUkp7LqaKAjHv87v
	vD28D98C1ITRDOp8WGQ==
X-Received: from ejcdo3.prod.google.com ([2002:a17:906:c103:b0:b97:ccc1:b250])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:1d01:b0:b97:b9d5:4ae4 with SMTP id
 a640c23a62f3a-b97f48c3840mr428088066b.20.1773930800216;
 Thu, 19 Mar 2026 07:33:20 -0700 (PDT)
Date: Thu, 19 Mar 2026 14:33:19 +0000
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
Mime-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
Message-ID: <abwJL2OTFzSFdVxt@google.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: KIOLBW7PEFDTLF5WVSV6P3QFMLAWYVBX
X-Message-ID-Hash: KIOLBW7PEFDTLF5WVSV6P3QFMLAWYVBX
X-MailFrom: 
 3MAm8aQkKB4clwtnp29swrzzrwp.nzxyz56pl5wt343.q2ppop3v4z0.z2r@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Yury Norov <yury.norov@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
 Tamir Duberstein <tamird@kernel.org>, Yury Norov <ynorov@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KIOLBW7PEFDTLF5WVSV6P3QFMLAWYVBX/>
Archived-At: <https://lore.freedesktop.org/abwJL2OTFzSFdVxt@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 19, 2026 at 12:16:48PM +0000, Gary Guo wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> Given the macro scoping rules, all macros are rendered 3 times, in the
> module, in the top-level of kernel crate, and in the prelude.
> 
> Add `#[doc(no_inline)]` to the prelude so it just shows up as re-export.
> Add `#[doc(hidden)]` to the macro definition and `#[doc(inline)]` to the
> re-export inside `build_assert` module so the top-level items are hidden.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
