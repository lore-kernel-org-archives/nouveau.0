Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 363B3E98E0F
	for <nouveau@archiver.kernel.org>; Mon, 23 Feb 2026 09:38:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E2E2E10E2CA;
	Mon, 23 Feb 2026 09:38:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="kVZuGB7D";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B4FA4348C;
	Mon, 23 Feb 2026 09:28:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771838934;
 b=onPVXJb5wqbQC/d/2uv2qwoUzJqvS8Dt33P2WwJ+pmmo+VBpHN2ajzRCswiz2rivo7b51
 ETXh2vSYT0qrIj1//j9JPkC/fG9LaglKBKT77IBDVw8hXv2Rua1vyq+3oEBhdLgAexY4Oyi
 OyFN0iq92uiPw1zxL6hi1P/qYfCJtGeC6NgV6hZ4hGsT3yK5weD7LO6A6BLWcng0ZsMVNRx
 VmOIki66qQ332AK6v3dFwTF46sQqn2bjEkzijhXwbgvOnSjMs6AJcn6PfarGrH2O5e2rOQs
 ua2G5Zl/ucmeBhLqAi4lVNh7WqMmcR6SktIzZLCih4jzd7zkqfUJSlmxbV6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771838934; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
 b=K4+fmbYgIMwfhJgEFWY068yGAgnOpecHKXr3cnoyjhT78xWUor6R51QUgenAUhSdE/5ka
 vRZKhMmDKp245GW8ezP/Sjuto0RKvA/C9U8yOTcWa48L08ZPB8o/hzAEj/ixQoVP70Y8iGA
 iJmbUVyW3WnHw2kgLihJGCZjBIdHE9+myJMi/9BketF1p9Z7oKCtf4z86YfrhjAv8qdksob
 8URMdf2NhXjwbbZd4PbBbFN/zd5al0blVOtF3A4jK6nagNBiYoINp4VnxkuKOBR1eEMvWyZ
 xSYD/82vDSLgNiDphKfy7cpu80D3CYFXPqa/frT37W8SqR0YKvyw749LpeRw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 581EB40F63
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 09:28:52 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF5B010E2C5
	for <nouveau@lists.freedesktop.org>; Mon, 23 Feb 2026 09:38:51 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4837b6f6b93so30621205e9.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 23 Feb 2026 01:38:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771839530; x=1772444330;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
        b=kVZuGB7DFrMYGq2Yw99+39eRkimoZu9W7wyX7clbebzNVcPJo2krkENNdCK4bpzmt6
         KflYooHTqsGrEouCcCMENSE88Xef0kfAXHHU6MpeRj5xShPr9nlPuW24nnbIw2HvGBDw
         HtC9yzYfy51Oy0yIJNbA37thOPGUDXEiCi3gCvhlK7a63cqTkTQga088/fFe4rvxE9Yk
         XRfqIMagiJCbonejFNFeV3mIjnooHj7phI5uyyQKlY9Cz2zO9UFSSBJQJby+QfkDFiol
         H8Up0k9ieo+Uqvjmx4P/JMVvBgzdGnsiBnQ3dv233UYFaiPP3jDJ2uviVxll/i5zmGot
         PfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771839530; x=1772444330;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CEki8/3kEPkYK4GTCiTKeIkEztw6O4in5DWfsgS0OCc=;
        b=W1Q+FkbEPqMitCHQZq+00LigBiAATRjaOI10KebTPiKKoWSieWqp8Aj7/HKYfCSKa1
         dGlVDtHwP02+D1Y+XOzyEih3eU7FXacBDQA6m1fJj2hleG+GrcpvADlWL2RVy0K+0LJy
         f5+rgz9j+Eap05v+grqOBZg85QU6WakcaZLAQsAsAfMrP8qexa5qqqiue3KfbkpvrWeh
         9VajgQ8BkCOviHNjaLMA8ksZX0h7eoxxbZGbD1LV14+fyujOigpz4MmYzidmXNBIOIvf
         eVgGFXUNSKTJvYeycde6m4DpUF59HJcjUzElAskQbNkrHB6zpOnBUDtEsvU2W8qOVUvb
         /aFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1t+WWE4iHhESuV+yq4ecla/3Ac9aBtEYZJixsQZi5G6MTEpzl7TmOSCZ22FeWgPkOf48G4H9R@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8Ls5SuRU7vSF4yo7asNFBepqnjZAMmDjDnrcQzvFjDqCcfoaB
	GvPaR8w8qXsUARI3+pYBk7fp2ZegVuIHRR/24FZioiKv5WexePHVDkIH3Vfr/XME6mXLYk6Brfk
	/ro9XfGy6V+V+qHq6qg==
X-Received: from wmg8.prod.google.com ([2002:a05:600c:22c8:b0:47e:dc0c:276f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e8d:b0:47e:e779:36d with SMTP id
 5b1f17b1804b1-483a95f8bdfmr128430325e9.23.1771839530398;
 Mon, 23 Feb 2026 01:38:50 -0800 (PST)
Date: Mon, 23 Feb 2026 09:38:49 +0000
In-Reply-To: <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Mime-Version: 1.0
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
 <20260218205507.689429-6-joelagnelf@nvidia.com> <aZlz49VtPA0JbEGx@google.com>
 <5523ddd6-fda1-445a-9235-54e778df2694@nvidia.com>
Message-ID: <aZwgKcdEnSHyuSLG@google.com>
Subject: Re: [PATCH v10 5/8] rust: clist: Add support to interface with C
 linked lists
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: RLAOQJENM6ECIMHVFSWPHZYHDN6YMUXI
X-Message-ID-Hash: RLAOQJENM6ECIMHVFSWPHZYHDN6YMUXI
X-MailFrom: 
 3KiCcaQkKBy8LWTNPcjSWRZZRWP.NZXYZfgPLfWTded.QcPPOPdVeZa.ZcR@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RLAOQJENM6ECIMHVFSWPHZYHDN6YMUXI/>
Archived-At: <https://lore.freedesktop.org/aZwgKcdEnSHyuSLG@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Feb 22, 2026 at 07:41:44PM -0500, Joel Fernandes wrote:
> Hi Alice,
> 
> On 2/21/2026 3:59 AM, Alice Ryhl wrote:
> > On Wed, Feb 18, 2026 at 03:55:03PM -0500, Joel Fernandes wrote:
> >> +impl CListHead {
> >> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> >> +    ///
> >> +    /// # Safety
> >> +    ///
> >> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
> >> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> >> +    /// - The list and all linked `list_head` nodes must not be modified by non-Rust code
> >> +    ///   for the lifetime `'a`.
> > 
> > I don't think C vs Rust is useful here. What you want is that the list
> > is not modified by random other code in ways you didn't expect. It
> > doesn't matter if it's C or Rust code that carries out the illegal
> > modification.
> 
> Yeah, this is true. I will change it to the following then:
> 
> "The list and all linked `list_head` nodes must not be modified from
> anywhere for the lifetime `'a`."

Ok. Perhaps you should say that it must not be modified except through
this CListHead? I guess it depends on whether you want to add methods
for changing the list via this API.

Alice
