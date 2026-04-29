Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B85CFF8864
	for <nouveau@archiver.kernel.org>; Wed, 29 Apr 2026 08:19:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B922910EEC7;
	Wed, 29 Apr 2026 08:19:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="Q/0J1mYN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B28D245D20;
	Wed, 29 Apr 2026 08:07:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777450042;
 b=pdPIrS4BpjfXgiTeCM9SaURBnv6bwILXAwxKfvxoslPLif/WUgVHuUCw3ykNF9rWZ3vhV
 9b51CdgfeimFODmvu3qM46uDDP9j1//Q6Uhc4/GRBGdP3xHBp4GIaDyMvWgLufkZDABkenC
 MIrRjuCpmtZ/dksY8CIuoEgnuH50bosWfAPgU7sa8vBG/hh6iZs/x67Awo8SiPB3l2iKhMf
 /Nwwjt8KwKEjPxdGiuBhTgCe+jgcvQB4xNARzQqnWoOPsMME20XerxtX5rpqSc1J5mg1626
 ydGfN1uG8dMPbf9UL2g44DgUv50f1M8IgNAakOa+RMU4FOI9CfjdJ6adk7dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777450042; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
 b=HhPASK1c1xXp6YP80NwWlfSOu5ZHZqr/Ee6hidrQVRx0rc7LPqhVLee82eS4Z0yegIwi5
 qiaFdNd2flXnrCBQSaeegdikxQHsWldYIRH0L97SDF9sRFcDbtE64tl034jemiW4RwTEzaV
 0+YGAlPD30aBiVeGHKgHMRuArGFGFGDo6OP7nsNifBFL2H2GniSt4/jyRyiP0gYX9rjro07
 +FSqYHUHSTaLW4vP4RyuCj+cykwFp7MSEO5yIFFpIVLQs1n6v5ffqVsT6BsJ8+hQ79uU5Rj
 NMPqlN63lnoUwE687p5rJSMjgxg8O/wrpxLx/SSHDQoa3mYAcumPaHxNhUZw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2BEEE44C05
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 08:07:20 +0000 (UTC)
Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com
 [209.85.221.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EEED710E069
	for <nouveau@lists.freedesktop.org>; Wed, 29 Apr 2026 08:19:43 +0000 (UTC)
Received: by mail-wr1-f73.google.com with SMTP id
 ffacd0b85a97d-43ea7a5da42so6987348f8f.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 29 Apr 2026 01:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777450782; x=1778055582;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
        b=Q/0J1mYNC5yx/TCVGmC2+o7vJsuVjVorVsjdhCR8ZSp0yPFNMochlcnDP7RP8NsTAq
         7zcPzk+u8H+rLS9JR91wvLp2SnZBN9tCl/hwEnHSk0Y/seQAqN+vL7biKPWNtK4uzvrd
         b30CRVrsaV7XuLeOEe5ISOhyg5NyisVQ/PJoHroWa88xZjapaLxlDr+mz8rMVwxtZgLX
         Jwi9TnNMe9UBVvXOlHvESAs09sBfP7WddU9WCZVDZ2Gru/wP97y/vRuyAYQSJj6LgQpC
         E1vzleOb9uB/Z+ZrNXOEUlhmiMDu8b65n10SeAobiboGv1HPjkQc0gAT8aetqUk79E9y
         PEHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777450782; x=1778055582;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UnWFkQyHgeOIkEs/wIKBFV9O4AMa1adBSTGrokeVPN0=;
        b=fWJtKzuBQAMtJIeWiRIl5MQbZkkFezRtvzvgrhyh2vpLCOx9fJfSLcxb2KMbTF+Ndh
         KNClDLe1Xfi31BIzPy9r8NL2s6l7xH3SbCFS9LmH6KicF7xq/rkvzzBKWmShzEagwlyp
         h6YQrfpqLFiuHike6mAOAvd3ZV58OHoGxOkIeNJS6IGFw4ASshyr1MhSJ8QeC0rdUGt9
         fVC7KqrAJcwrdKuhtwFSOHaGpVyLDsSEKBM3DeWO+sunDhxMgXyyUh5804olNcWfYW+P
         Ij39WOTKswHFB/V5ruAtsiBcNU4Nmqz7tZJDKw2fqUqR2YqbPr6Yv2prV6QU7Ps9vr3Q
         PQfQ==
X-Gm-Message-State: AOJu0YxE4psIGmStkUOoduGSKGte4ZfLM4+dQNmkRTVj8HGxnMhJ+ccN
	R6JakM/jm5s2Cs2AtMSj+ZItbmTjLLi7/yILaupLMCG/Cz+xgRVu/FKVndkMzvYARW1cnAWzfvm
	jyra22j6uQtaSP/EGLA==
X-Received: from wrve6.prod.google.com ([2002:a5d:5306:0:b0:43c:f94d:a0b5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:616:b0:43f:e43a:d85d with SMTP id
 ffacd0b85a97d-44648f28d2amr11438300f8f.3.1777450782265;
 Wed, 29 Apr 2026 01:19:42 -0700 (PDT)
Date: Wed, 29 Apr 2026 08:19:41 +0000
In-Reply-To: <20260428190605.3355690-5-lyude@redhat.com>
Mime-Version: 1.0
References: <20260428190605.3355690-1-lyude@redhat.com>
 <20260428190605.3355690-5-lyude@redhat.com>
Message-ID: <afG_HUjCMH2qKjPS@google.com>
Subject: Re: [PATCH v13 4/5] rust: drm: gem: Introduce shmem::SGTable
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: SIRVZCK2SPWTXIXTJSVO46N2EANCVRXW
X-Message-ID-Hash: SIRVZCK2SPWTXIXTJSVO46N2EANCVRXW
X-MailFrom: 
 3Hr_xaQkKB7kZkhbdqxgkfnnfkd.bnlmntudZtkhrsr.eqddcdrjsno.nqf@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 dri-devel@lists.freedesktop.org, Matthew Maurer <mmaurer@google.com>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, christian.koenig@amd.com,
 Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boqun Feng <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>,
 Krishna Ketan Rai <prafulrai522@gmail.com>, linux-media@vger.kernel.org,
 Shankari Anand <shankari.ak0208@gmail.com>, Benno Lossin <lossin@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, linaro-mm-sig@lists.linaro.org,
 Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SIRVZCK2SPWTXIXTJSVO46N2EANCVRXW/>
Archived-At: <https://lore.freedesktop.org/afG_HUjCMH2qKjPS@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Apr 28, 2026 at 03:03:44PM -0400, Lyude Paul wrote:
> In order to do this, we need to be careful to ensure that any interface we
> expose for scatterlists ensures that any mappings created from one are
> destroyed on driver-unbind. To do this, we introduce a Devres resource into
> shmem::Object that we use in order to ensure that we release any SGTable
> mappings on driver-unbind. We store this in an UnsafeCell and protect

Outdated? No longer UnsafeCell.

> access to it using the dma_resv lock that we already have from the shmem
> gem object, which is the same lock that currently protects
> drm_gem_object_shmem->sgt.
> 
> We also provide two different methods for acquiring an sg table:
> self.sg_table(), and self.owned_sg_table(). The first function is for
> short-term uses of mapped SGTables, the second is for callers that need to
> hold onto the mapped SGTable for an extended period of time. The second
> variant uses Devres of course, whereas the first simply relies on rust's
> borrow checker to prevent driver-unbind when using the mapped SGTable.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

>      obj: Opaque<bindings::drm_gem_shmem_object>,
>      /// Parent object that owns this object's DMA reservation object.
>      parent_resv_obj: Option<ARef<Object<T>>>,
> +    /// Devres object for unmapping any SGTable on driver-unbind.
> +    /// TODO: Drop the mutex once we can use Init with SetOnce.
> +    #[pin]
> +    sgt_res: Mutex<SetOnce<Devres<SGTableMap<T>>>>,

As far as I can tell, you don't need this Mutex. Also, it causes
problems like requiring the reference transmute below.

Alice
