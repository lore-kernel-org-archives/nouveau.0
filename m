Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0ACACD49C77
	for <nouveau@archiver.kernel.org>; Fri, 30 Jan 2026 08:34:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D160110E946;
	Fri, 30 Jan 2026 08:34:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="m7/9ZJIe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9B4C140F37;
	Fri, 30 Jan 2026 08:25:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769761534;
 b=ToCu1mdTsrCAFzfifxV9U0opBmxyQpXcvxUWP1ufp8WHY8temuvqeGLu3Ys800Z6mWekU
 oovWMpfsUPRrCOhEyfV0jDs2N012nPxHyNgcAZ8y/VmT9lEsUbuD1SjRZDbZO0Ipp+fxNa/
 FrxZ/2ewClQisNNDR1bw7aosii3KhYjPiIfU3CU4ArkwERfPuYm3xK8nbsykS3e0kA9OX3c
 N4+8E0EuxXPcj3Nbj+k0LtuRFEB7dRgVj5KmceyKovqM5uv3AnJacQdLVH33bcNeDzdzObz
 2zdOG47oiWhFrnN7B7RIdgAfsHH5PS24KeUfIOu2jEX6tV1UZfN6Axnp/GrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769761534; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BXwrLkuO838vdnUICThk+ZOtuk7JQw/6t67kS9o7Wo0=;
 b=0Ck2puGjujrEn4ILetbuYpxUKQ88j5LrdyJxB/qPrvDvbQvByqbV4eP4qg/BbxjCUOfPJ
 1367mrvkO439FohyceGu16B5bjKvJF2KfxbhTFoQ8ygUPSXtyGTMJAfTFO6fsG+L93E6t+B
 /Nf+gQm6HfB+vCU6TzI8Ds55AO1G29xlL2wKPeeve2BMS93+7q4MutP5RY+fDaNi36vRnBe
 iATqnzlPJ+c3QSW9OXc0HWjrJ85qt9rOtOplMlvilwjcDAW4ZNKlCTO+/Gv2Yr65lVUC4wO
 B6KvvREq4pyrzxpraq0bXYWQh9AWC2EvdwqrSrswbGkn5icyIN3m1rsdacjA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 73FD940ACE
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 08:25:31 +0000 (UTC)
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 740AA10E92F
	for <nouveau@lists.freedesktop.org>; Fri, 30 Jan 2026 08:34:37 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b8704795d25so254145166b.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 30 Jan 2026 00:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769762076; x=1770366876;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BXwrLkuO838vdnUICThk+ZOtuk7JQw/6t67kS9o7Wo0=;
        b=m7/9ZJIeOBBAPoVQGUsO6gkY0OCEbrCpNM0/Jy6hzpU1deMQox9eBQnP8kfKf+iixW
         QL0BdmloU20K6kAf1qo8j6z5QyUTLDeXPYUfRIX8/QrskyPNg1yjT+KXSUp2k1VICmXM
         ma3v6VV1JwEgEV9bh6qnI1TU8GQ9G4xmohOCKVkjm0N7ZbcHUD9j3dWdPS63ZR+ffXO4
         X4Md47hMLDidpCfY5fhfejkMUK6LNqDfag6IO+QDyX84pd5SWCVZBoOc+tXdbLO+yAx7
         vlRyurlhepK2J1HVvlg7WMXacxNREJfdET6vi9M6EWlgy4KXU2w416rpXoRZjTyDZdbU
         dw0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769762076; x=1770366876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXwrLkuO838vdnUICThk+ZOtuk7JQw/6t67kS9o7Wo0=;
        b=cLbzgIMcUjvEue2is3Bik83+DUPYlX+or4JV0Y1xipMPJ1mFchv+5WQWbbDTBRfUWU
         a97mbKRanA6u3NyjglCxYI7N7cfb4vbUI22NHlE8Ld5+Qc4jgDgNuRvgrNuWP7fMhojq
         oFfBQEgDWudzk7w6HsG6H6xFCbL0cq9xAML0EjzBd+mNBG44rsdky178CqaUBvnzrimK
         hGGLlPU+a3j2LwQ4XFSprw72nW8Pjhlfi/L42b+DKPNmLgESe4OvyajG5yhLRfgowNHR
         zgMQKLjnczumT1CbbLxmYvB+t0IfstbUI3F3InBaVcOBs9xX0GhVPru+JmW9/vwRpbxn
         xH3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUMQ0+lnWJNgKyLr1UDtteMUbyhw0UGpinIfuuGMZlkYDHAXgmaoi1Y4/1/MLC7xVXRtlOdTJCF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGq5GvfjveVt8vgP/xjWqEUBj0ar7QxYG4ciS4QQODhl6ILMuY
	jAp4p7apTHJht0eEW8OIh4ej5EFDJBbHS2jrsoUh9H08LYKyRHc+W0c2LmzzrLdOTk3Zsv+KlUC
	O+Hc1oFaYgVruGHjXEg==
X-Received: from ejbot14.prod.google.com
 ([2002:a17:906:ccce:b0:b7d:380b:a83c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:9287:b0:b87:1fe6:f223 with SMTP id
 a640c23a62f3a-b8dff5e8fecmr102609966b.6.1769762075992;
 Fri, 30 Jan 2026 00:34:35 -0800 (PST)
Date: Fri, 30 Jan 2026 08:34:35 +0000
In-Reply-To: <20260129022837.4133832-7-ttabi@nvidia.com>
Mime-Version: 1.0
References: <20260129022837.4133832-1-ttabi@nvidia.com>
 <20260129022837.4133832-7-ttabi@nvidia.com>
Message-ID: <aXxtG0TTk376dRsT@google.com>
Subject: Re: [PATCH v6 6/7] gpu: nova-core: create debugfs root in module init
From: Alice Ryhl <aliceryhl@google.com>
To: Timur Tabi <ttabi@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 3VEM3SHKELS2XKQFHQ5FITJBYN7GTXFJ
X-Message-ID-Hash: 3VEM3SHKELS2XKQFHQ5FITJBYN7GTXFJ
X-MailFrom: 
 3G218aQkKBzoWheYanudhckkcha.YkijkqraWqheopo.bnaaZaogpkl.knc@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Gary Guo <gary@garyguo.net>, mmaurer@google.com,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3VEM3SHKELS2XKQFHQ5FITJBYN7GTXFJ/>
Archived-At: <https://lore.freedesktop.org/aXxtG0TTk376dRsT@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jan 28, 2026 at 08:28:36PM -0600, Timur Tabi wrote:
> +// FIXME: Move this into per-module data once that exists
> +static mut DEBUGFS_ROOT: Option<debugfs::Dir> = None;

Surely debugfs has a solution to avoid this...

Alice
