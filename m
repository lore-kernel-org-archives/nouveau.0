Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF06C61DD9
	for <nouveau@archiver.kernel.org>; Sat, 21 Feb 2026 08:59:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A397710E17A;
	Sat, 21 Feb 2026 08:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="02r6ueLt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6BD954347A;
	Sat, 21 Feb 2026 08:49:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771663766;
 b=c3/V6Wxyb2gvkbwfZjNNLYCD3jzyzXm5ujvEGCBY2slX/O3P6yZhPjbbuHxcHQ0OsZVhL
 WkIwhRHg9qeC8rwo1ptwCNgCP3N8fwt56C3bDE+OF4Q8f05qg9nm6z6rCnR7BH0gCr/CoLd
 mDfdSKtlxuSUTxfeCqAHnWRCwuEwRTGnjrFjXSGp4q0VTVWusqDPTcOYFo0/t2KSRHuNdJB
 Oy+ZXtaBiKq1MUnNAPdLRUlhtIFBKgklIi7FuVK9oM9JbsxZKa7wHkcAaXlDfzMj4n4dRpf
 M5CiQUEIXDpr0cXPIYny1VMDfoNbaViXhm8nVmtXntoaPy1lpzvUecmtgGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771663766; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
 b=P7pGGWzHA9d0/Tf+I+zQUpDiZQ2P54FfVgUzmwjLwZ7KwiARKFbVDO4PEbQIqcNMoFykL
 yv6Jd8nA9lKG7+QlX1rYMqM0+U/XWrZNGkXmHcSAE8UTye3SZZ1NTbx3qFIwrCheZzXKJJ6
 yJrp/mlWrnUc0hf2iI3sZbvOugzLBSR1MsQXhtpuyJbBs3VSgGCOLYhetrMoeYtckN60XFH
 0Ey3fqf9v4nyQqOFjvgt8jqkoZxnW4MTSI3Z51ZTG7l9kXRk3Er61f5b5ZoBZbM0ts4YJFf
 D7Mi3Ria3/8A8XJUAUyRtL83fbHp6HE+wwigTcRjAjYaGlOlZIjSi5r2tVFg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 732EE40B8C
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 08:49:23 +0000 (UTC)
Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com
 [209.85.128.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7649310E175
	for <nouveau@lists.freedesktop.org>; Sat, 21 Feb 2026 08:59:18 +0000 (UTC)
Received: by mail-wm1-f74.google.com with SMTP id
 5b1f17b1804b1-4836b7c302fso23220855e9.1
        for <nouveau@lists.freedesktop.org>;
 Sat, 21 Feb 2026 00:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771664357; x=1772269157;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
        b=02r6ueLttmrsH85pAtUonNBPDWaS/+FEnhHe8IhfSIBLoO3yTvJdR/k3zFEVt2p1Oi
         4NudQ1srvM/NYWG1JpsVLPouKTTF/MTDtVWCyjcBCjBZybgiEohMEIVXushj/Pj6PkMx
         WakiU/4ydpqWbvojk0JptPrnWUeCckrvDh2zzYKG18rceY+iQHcivqT09d6IC9e5A3y7
         I+Lk5YzifYrN7W/8l6OU23Cp1aFwxjWDaz6SF+hCqbmoBksaHQRw08O1ouLyWGeqX9ht
         B3PrBdueLga3EgKRVbmU/JExR+y/z/3keMsnqTrFXEg1hiMIZWJdifVPE5cy1L+bM+6V
         GsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771664357; x=1772269157;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6zMqqgKoh/9hUmXKLa8W/Ktm8MqMG46VT0cs/LJ1MPQ=;
        b=fcmF3TotDomkcuYI7PUhYKyRY9PBuwnsq/JUbMA7sc/tmHPxf97ZdJdTxBgI7/759p
         YtYdEA13BqxFf3ODDJ14ZSUJvH4mz5kdBWNMVjDXSeuGOwS7rvGZ6x6xV0i8fbPFtPIE
         D+CUg1rCUiyo/cfmRl8v2WOcczOgwQZ4lt8AFawP5Pc8TWaZaOvgSF3UF66QsLbCEVkc
         mY9+a14wzNSfgqvpRO5CBx3hbkSVTdPWoqNfNNFAdg/6jkFrfK/MMH1eK53K7JoRFtUh
         I/J66oGpECFAsxFa2sOpWdnrvfm0ieywOc2uRZrcGEzTCizGgAkRjeeW5K4bYe5mD+1D
         8P5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/OazUthkRSpNDSbKtjYC3O5C/qATO5CSGIU50h7yjh7INrAaDCYzloig5gr028YjLu2SJ1aco@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyqs9nCFX/ucs+1mve1livb1cI+ki/N2PCBu0p1guZda1fVVNW+
	eenCLoFnoFH2iN5cK4ZIW82HS56oxt3Sqs5ZJ3TZi1VJUvHQyLgeEW/seMXIFPXft12KZtc8P62
	rL1+WPg90xvs9pQqnUQ==
X-Received: from wmbz1.prod.google.com ([2002:a05:600c:c081:b0:483:6f89:e2c8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e09:b0:480:25ae:9993 with SMTP id
 5b1f17b1804b1-483a962e3c9mr39685415e9.20.1771664356547;
 Sat, 21 Feb 2026 00:59:16 -0800 (PST)
Date: Sat, 21 Feb 2026 08:59:15 +0000
In-Reply-To: <20260218205507.689429-6-joelagnelf@nvidia.com>
Mime-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com>
Message-ID: <aZlz49VtPA0JbEGx@google.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: DTIT55Z3AP7M367CD5BNSHPGSSP7SIQX
X-Message-ID-Hash: DTIT55Z3AP7M367CD5BNSHPGSSP7SIQX
X-MailFrom: 
 35HOZaQkKB4Ujurln07qupxxpun.lxvwx34nj3ur121.o0nnmn1t2xy.x0p@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DTIT55Z3AP7M367CD5BNSHPGSSP7SIQX/>
Archived-At: <https://lore.freedesktop.org/aZlz49VtPA0JbEGx@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

In general this looks like a useful tool to write other abstractions, so
that's good. A few nits below.

Also, I think it would make more sense to split this series into two
with titles like this:

* Add clist helper for writing abstractions using C lists
* Move buddy alloctor one level up

That way, you can tell what the series actually does from its title.
Yes, the 'why' of a series is very important, and must be included in
the cover letter or commit messages, but I think the title of a series
should explain the 'what', not the 'why'.

> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> +    ///   for the lifetime `'a`.

I don't think C vs Rust is useful here. What you want is that the list
is not modified by random other code in ways you didn't expect. It
doesn't matter if it's C or Rust code that carries out the illegal
modification.

> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not modified
> +// by non-Rust code per safety requirements of [`CListHead::from_raw`].
> +unsafe impl Sync for CListHead {}

Same here. If another piece of Rust code modifies the list in parallel
from another thread, you'll have a bad time too. C vs Rust does not
matter.

Alice
