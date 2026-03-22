Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CA40D58CB0
	for <nouveau@archiver.kernel.org>; Sun, 22 Mar 2026 23:37:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DC2A010E1B9;
	Sun, 22 Mar 2026 23:37:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="G5NXkv5b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C2E594527F;
	Sun, 22 Mar 2026 23:26:07 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774221967;
 b=I2hTlzRMSI5ZB1gd4Ks0ETCfbTu5xQi85t/8OMuUqfdmPMRCAW3uk+loG3qIWQakXASAe
 D8J8xQnxsJM+j1sccDd1XAe5PGEZyC2LTaKp/L20CtRJibEULGnrLm7dvNXCoRFJhcU1M3u
 TxLBMPzcUK5IzbDtkXtywZsdF03mNgYqWhuqrquKqsZbtlvMC07v5gjUlPy5J+Sb2baBocO
 oFfKmBTNNL+Qf6BPubbRpHMVQFO241s64QKJ93ta0qR9KFs/8KU3Wm9wPd0uQ93ESpTV91P
 mfzaB41B8qmerZkT+pqEY98uweIyt+/yiAea8zcmfyEJi7hTAReDCnNxhy8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774221967; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
 b=QIsc/iInZnPj0D5PcABpeWrx4LDMUDuAJeVyU23VtpiAIf17q5iNc8FobUpa1LhyNsdI3
 VXIzMHRc1usPYwmnb1mFxwi2E8TYxK6CATXqxVy0kdTaC6aFgX/4TKC3cuWbCtc4qr5QVJs
 7FQ7H2w+FdPLhE3cqaPe622h+xPkfsd0LcYkcGcgW26YUMbTCkS6PQkwIYf4FdfHtTsA/1O
 +WySnds8I62K31PLdLiZSKeFXKmqjlBizFwy1Yre+p01IisJndYVTE/iW0yMfR7ykZ0aK1s
 SJA9ZK4yufGo3Hxh9EsnsCvQI4tIEqZr5vQkTYeFn2m8LuKdLLjnjUlvc3qg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C05604023E
	for <nouveau@lists.freedesktop.org>; Sun, 22 Mar 2026 23:26:04 +0000 (UTC)
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com
 [74.125.82.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4DE710E013
	for <nouveau@lists.freedesktop.org>; Sun, 22 Mar 2026 23:37:05 +0000 (UTC)
Received: by mail-dy1-f169.google.com with SMTP id
 5a478bee46e88-2bd5658b901so134169eec.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 22 Mar 2026 16:37:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774222625; cv=none;
        d=google.com; s=arc-20240605;
        b=cuFuk8Arn9PUsutFwYlj1ktsYGH3AIKX6gGwIdfI46seURNvcjGPURz03vGqDj5paj
         D6ijvh5MnEqJucfEhqnCG0UIi9bheSZyUEKZpRn7mw6pTRE72jLgfLSqxVAr5DDMxCVS
         wgiFxl+IF4og/TV2qVEBxb6+VQp7ovPcmQwNss6oHJdKaDgRVW11qrSMTHmgkdJDiWKx
         xiY6duyljpfxMLuuY2kqJ23wEp0JU2r9eXlemxw/0vi9Snkxe+hQXOzbzl8OfhBQfkwi
         KTUV9/00rLZ0W/0QsniZBh7/flDo10EDNJNimTNilRHQvkyA/gVOelfoRRspCr0/Wtck
         nbZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        fh=/4H48LMqc47Trg2JcCbh8wMoqn7AAp8mh2CJz+Y3TW4=;
        b=AYKzKQV7sZR+RtioILP8l7cy9A8S0VCs7+OGK/344/EooKurKpZb9vTnTX+sirUCaN
         q+XrqSARDve6yLrzabrS4U2F+VhlP2uHf3EZPf5eU3aFcy/YAx3ZKcR4JzxgzbF5/q8k
         plwNzTIvvuyy6W/tbwIGX9q5E1O4rJHuRIm2Y0ogNzVW0i73Jsf+whiVbnJT2D68VSYU
         uOf125vGCXfxI8RkyE454JoyWP8jcTVUURykrpvtzEyQeA81+ahQB/l8+zyGORWPvdRs
         e+m6xVnHFsnTiwgyRKebxZH2FoWrU06ut7n1DBk2HsSRrp2o34tqqGmiafGGSLLDkyZ8
         ro+A==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774222625; x=1774827425;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        b=G5NXkv5bvDEyUgPqfjWVeX42Rl+R8qTFXb/afze1CucceBf93F0xyFLT0tlw0zWW6a
         6jYCsjKKnoM5Ij90OyDk6/0SlNAIHT/eA/HyLEzW06JfIci2f5Med2dlTtkWicfoe6er
         GJ5h0oBWUb3+bwZOyYMIR1z9PLXQe5wY3QqHwZV+US/v2ZdzpsvARevYf243tthNGEgw
         qiBRpejYflWA3Gk/fzD7S7mMuMCGY/6nqGErC1uWwsoGT+2PFYBAYE3PDB9SB0vyt6/W
         7trrImzVbU+nzcQ69fl1SqTBWiWrJhiwpbIspaMMGP8KW1zyp6KCSrZSv+FQ14lmjLDm
         F/UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774222625; x=1774827425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3TFkIH6VCknZ8F6Tfn8RBWKBNHE4UMbauIDLil82xYA=;
        b=r5YRTKI+oHQjBLMuSQfz8NKGWmS7H9+hByPjFrKMJZQ76Czx2GlcJWPT4bgp0DEDwj
         pN8Y7QKOWQzTjrYJwiCPyx9eA/e2JY0/a1dS1oyCEmzZs2MWHHCAzlOZ3uWX18GIQzmF
         tv6qMHLAjWSnga4oRQeVF1y8sXPbykbR81GV2j4riudnxIz3+YFhsf4D1jzLzdLuaCHS
         BtfBA9RtFjVaqP6JDHGmKJXiq2Kkd49RapbZqeBhcBrlJNOFgATcvlRqvovAtMmamRDv
         VpUazys44OWeZoo3gsi1QndXzacprKF/6DYjfugrdzX6N3BtPut1ViCNDXKNZZyBtXXa
         tcag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbjfnBFM8tu/jimMhcOdNvygAHWMEOGiK05OXFlbjPShJRhOb/Xx430ib7MeFmHoxOlk+tPSwK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySv+jbfoeOzusch6Eyf/lnrFCSDT6pwyoQn/oRGuCmuZXdr6cy
	ocXe75SalfxDWLwGQJpX7uHNFzb5c8lbPBQcP0Lr7kRhHsx5LfiqMlxud3ZH59qGG4mAA8tPTLY
	kMlOnuDl2182WZBFt6PiZZ8MUB8Z16Ds=
X-Gm-Gg: ATEYQzwIjWHFgZZo7Tw9sKtg60y56LalOEePjUBZkC/IF5Rm1K/BjYbpztQKHm3Xpzp
	eiZuQFd2yQ345ypNVL9IPWvYtPFCzUp8nukXLCb0Q9S1NC8RcVOvqz88lcbMaXmtDqohnwrZpU1
	AaPrlOETqfGGXh0gPYVZQnRwPB0s4J//rvHGFktmgv410Y7DCDkAFK8h0kz9rZsaaYzvoV5j1gj
	+mLFGQsARzzmEm+sEAx6DjDAVEd26obOlCUpWDpC49/ZkiQlTsAkudktJIQjsBG6XuLqN6GM88a
	fX8zDnTn/RdOPgMu/RLrBth5Te1YGH/RldGZ0Fz+TeRDnijmGi+Qi6Y1vqzpE1HHKpgG2ham2Zk
	9PjL+nfHmxGRZt1/hX5TjilE=
X-Received: by 2002:a05:7300:d705:b0:2be:681:91b2 with SMTP id
 5a478bee46e88-2c109784e48mr2354158eec.6.1774222624794; Sun, 22 Mar 2026
 16:37:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260319121653.2975748-1-gary@kernel.org>
 <20260319121653.2975748-5-gary@kernel.org>
In-Reply-To: <20260319121653.2975748-5-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 23 Mar 2026 00:36:52 +0100
X-Gm-Features: AQROBzARASkmL1z31d-SPolLvyqalzs_slFQDBddlVkhvWh2YgJFEiUU-Y1iEYQ
Message-ID: 
 <CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com>
Subject: Re: [PATCH v3 4/4] rust: make `build_assert` module the home of
 related macros
To: Gary Guo <gary@garyguo.net>, FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Alexandre Courbot <acourbot@nvidia.com>, Boqun Feng <boqun.feng@gmail.com>,
	Tamir Duberstein <tamird@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: XVNOLYWIS5C67RGQH6KHP5FSF4ZLJX53
X-Message-ID-Hash: XVNOLYWIS5C67RGQH6KHP5FSF4ZLJX53
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, Yury Norov <yury.norov@gmail.com>,
 Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Mark Rutland <mark.rutland@arm.com>, Ingo Molnar <mingo@redhat.com>,
 Waiman Long <longman@redhat.com>, Yury Norov <ynorov@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, netdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XVNOLYWIS5C67RGQH6KHP5FSF4ZLJX53/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kZH-AX=QQz2V+qCfVzMsUEAPan=o1E=OZOAnivj3L3HQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Mar 19, 2026 at 1:17=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
>  rust/kernel/net/phy/reg.rs           |  8 +++++---

Tomonori: are you OK with these changes?

>  rust/kernel/num/bounded.rs           |  2 +-

Alexandre: are you OK with these changes?

>  rust/kernel/sync/atomic/internal.rs  |  9 ++++++---
>  rust/kernel/sync/atomic/predefine.rs |  2 +-
>  rust/kernel/sync/locked_by.rs        |  2 +-
>  rust/kernel/sync/refcount.rs         |  8 +++++---

Boqun: are you OK with these changes?

>  rust/kernel/xarray.rs                | 10 ++++++++--

Tamir, Andreas: are you OK with these changes?

> -    transmute::{AsBytes, FromBytes},
> +    transmute::{AsBytes, FromBytes}, //

Nit: We should take the chance to expand this.

Thanks all!

Cheers,
Miguel
