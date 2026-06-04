Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D344CD6E6B
	for <nouveau@archiver.kernel.org>; Thu,  4 Jun 2026 11:58:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66014113FB0;
	Thu,  4 Jun 2026 11:58:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="QDtOojWP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 29202467C8;
	Thu,  4 Jun 2026 11:44:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1780573471;
 b=liSiKG0N9TDf8fD6K59XXEl4R5SNxRECHnaGhM11UMd+gCT6Y9Mfln6eBceq3sRQJoVLV
 LKSY8On+NNUaAmcbuc62FXSafcIll8KGLmlBDp/RJicRwxQxAltqJpK+kq3IlF55KGeg5o0
 t60b8rCO77ib0+7kZYBHKxbfjLaKLj6h6y2FEYjSihjYiJ8OcZvOJEfyIwxcxeWFxe7h60V
 2yZiveep+2wIu+t39tPkjhmyfxK1ZV8kgK/EJ5pFqYMwz66In+SlLEtO9DCBPRJVp8Zvpbk
 4LBu399bNaCC6kIvuzZq+ZCJz4ojtlKYXHvkCVSBUfXzBGwa5QUc0Pgtu7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1780573471; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
 b=GITufe0lCbUrawiJ3QkgFlj7mNAjnAICUP9BYK/5/nvuD2qG17n8A1ZzdduSSkdgiunP9
 RP0YRT6MwqHh38OnRlTlCLX2hAKV3rAtXS7aCVbObBR08KgUe3UaDMjq50KrzClMXOnm/6h
 M4sVxpwlFb/x2Vghweu5SdRGCWhqSnAoygN5lQNfUf3raahlOobUmDyhRdlvgSalG3LTWjH
 UgUKxj5Zs4NQ3b5G9zyRV4GLAipDLubquWVHm2iyp8kAWcPJjnBpTq7Og2ZpG1vzFavQhG/
 rveUv+BDyoGj9my06l9n5ggvva/kG4hF+x78YHMoWeWTeO89urpoIeD2b7PA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6126A40638
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 11:44:28 +0000 (UTC)
Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com
 [209.85.208.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6E683113FAC
	for <nouveau@lists.freedesktop.org>; Thu,  4 Jun 2026 11:58:12 +0000 (UTC)
Received: by mail-ed1-f74.google.com with SMTP id
 4fb4d7f45d1cf-68d2339febdso930522a12.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 04 Jun 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780574291; x=1781179091;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=QDtOojWP8WqmKQDlCXhLBgfVurGfjDE4QYRxSQHc5MpfyRP8Bdu3RaInbtDLXmZSU4
         fbJlLNliALWfvBTYH4ESf9QLUKx0LzW0fr/TIZR/VRWHinTdFFqZmg3YCM33MkbDUUTL
         tDVxr+BW//YGOiTppSzanvMcLAbF3yZ0ct/9z649eXwndSJBDTpnLmxf4pfSsFEad/Ms
         FHpVUew/kfu1ULvREtT3XeNauLAAziTm4hMVTfcD9PZEx1tvsPGUZ2faS6gwGeE6fCCI
         2ySilosVVklX1SPPR9FvLULoKq0avgHBap5dC/nDnUVgGsEnk8FK8vjNrwuqBfpKo2yj
         xGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574291; x=1781179091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=SxHYdsUnMWadzua3uZi+CXTBet7hs8dpdDJdQwMIRMnk1RVIww+yiNiqCgP3lNMShu
         IuL3C3b0M64dpBNYL4WtXR8bOcNB9SNgKKcPpcFSwbd5kEJweDx0N8VOpAI6ggEMboAL
         dx2xBIBhkUlcunJ262r8G6stQ/cW5ZEzUhuB/yzRuiEhnArhrO8kUKBNtVBNvKFVwJuo
         U6sPwnKh4eEAcT45NzZITeVFFRDskEHiUKnGJ87wbzcW5zwvBzXUZsWhwcFbn5dOAX9W
         ew1v9clc7uSpat+joRguj81dqbXFPu0+hQT8nPrYWZcU9OHzQYSfZCAQvsGM15us7lCD
         a7yQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+CnmNkoFhke8JBJbg3xnmr5IsEXmoZOzrAhuHaNm9SOvNWzlJzzXqc82LqjvNOgfKvQYvq8ChE@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzhDbHbrFkc4twHw4pEZyLl9DMvyrWLxq0EZSswzmnqLjUi4Pdq
	K8VLYO7ln1nKovnebeQHBE6OOPsBVIbPTqVgQ4apPpNHKd+nbrs38OjHB2VkqBhdiHSorjQy4Gm
	sltSvfLV3mUFArq3OQg==
X-Received: from edrm6.prod.google.com ([2002:aa7:d346:0:b0:68b:163d:99f3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27cf:b0:688:1d5:44c5 with SMTP id
 4fb4d7f45d1cf-68e6f79352amr4016032a12.2.1780574290900;
 Thu, 04 Jun 2026 04:58:10 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:58:09 +0000
In-Reply-To: <20260603195210.693856-6-lyude@redhat.com>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com>
 <20260603195210.693856-6-lyude@redhat.com>
Message-ID: <aiFoUauWYLz-Oyrx@google.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: LQ6WWUX2NC4U4ZSGGE35JZFJM4ISLGDR
X-Message-ID-Hash: LQ6WWUX2NC4U4ZSGGE35JZFJM4ISLGDR
X-MailFrom: 
 3UmghagkKBwEbmjdfszimhpphmf.dpnopvwfbvmjtut.gsffeftlupq.psh@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>,
 Gary Guo <gary@garyguo.net>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 driver-core@lists.linux.dev, Miguel Ojeda <ojeda@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org,
 "Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Benno Lossin <lossin@kernel.org>, linaro-mm-sig@lists.linaro.org,
 Danilo Krummrich <dakr@kernel.org>,
 Mukesh Kumar Chaurasiya <mkchauras@gmail.com>,
 Asahi Lina <lina+kernel@asahilina.net>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LQ6WWUX2NC4U4ZSGGE35JZFJM4ISLGDR/>
Archived-At: <https://lore.freedesktop.org/aiFoUauWYLz-Oyrx@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> This function simply drops the contents of the SetOnce, given a mutable
> reference - since that proves we have exclusive access to the SetOnce.
> Additionally, update the invariants for SetOnce to make it clear as to why
> this is safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This isn't needed, you can just do:

unsafe { (*this).sgt_res = SetOnce::new() };

