Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF41F33804
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 06:47:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6200010E342;
	Tue, 17 Mar 2026 06:47:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="k21xIKlT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED408451C9;
	Tue, 17 Mar 2026 06:36:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773729391;
 b=oxTe/eETfBD16BUbXNrMwpgop4E4Wqvl4BYELpLMVYX/9PJ0Wd7vlqI9iZFUfOS7Oe8nQ
 GERJgZCPmnPIY493D/dBL2PD+lvA5vJ1Tby7HjVca37K+nl+DOP7rHXjCuLjVMziaChMCr/
 Jk7feewoOR9m9mCAbXrbkQK35t7bekkE0BZl/NPq9gdtxgeGJVdqwR6kcA/1jnfvxkWGZFo
 S2EfaeVz8U0onHDhtnY/kd8UJ00goDH1M06rkwtyn1cW32M1F4hk1f6XeosZ8fOi/Gxb09P
 OF/UWhBbUK3MsIcdTfDakzqwLPHDbcdhEsZtsAdkC9OuzrIVY11HGd2bqnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773729391; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
 b=HLEWc94WHNLyornY6w4DKPFNvqDpYNilviUnulVfuCHphGM1RwGf37uGeCirs/6zPGQPL
 1Ma4sf9f174FDlVWByOPb7Y2HLkI6mWfbZwC1ChwYGLwg9mPLJhSLRTyVnR/7btM3CnZyXN
 Lrx4aWdsJOQtnPLZQzDqzKC6JzWTwfVePn2QcN/vLz0kjChzgjv/+jdirVJ/BPbtI+lzV21
 6hs40EIkjNzv9gH6rV8hIcxK+aCii8LMOxVhy1qoMcPJADhpT5mGj7WRcOInvGP2nc+ap8C
 3001VQaO15EpmVusRV85vHrJ6v5wUqu0kZXZRGplVctF4pHBst/1wqnLXyGw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E705340321
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 06:36:28 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1BD2410E33D
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 06:47:17 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-4853a9467c5so29951405e9.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 23:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730035; x=1774334835;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
        b=k21xIKlTd1Pm5qrLJvqROOCXenDBDvKedLnV+fmYY/mZe9v20KbLamFUmyvOVXL/L3
         j1giKNtnxkQ6AaKTy8yw8YXPcTYBNMDHXdZmYldya5fNbd3s5DsEAr3QUpxxWsX17ada
         nqdqzioeS9OhYnGEW3j/CT1Qp3Z20m41NHYfxmNFSdPp+kZNdBQoapYUL+4GRISa1sO9
         Lk986fWNUwgvksMoRxHR2kCEDWgiIrQ+Gd6TuzIDO20n2rBUmPzs5aJrtBPu23cPH0uo
         +/RPpMW+XTOiAKrGmxc/MK1ezXN6gcZekAxArHkWaAyDZq2K21dTk9kS8fHgJIqhjJhk
         VYCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730035; x=1774334835;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LfXYyK2K5YV7GwOcQbmsbmYUjdllavbSwogkW6CuYU=;
        b=sp//rFYczGkFOIYiDGkIqk2MDiVBKz+CRvq2g6w8xkw1e/qsIeZf+qEX+jIBAUjFKR
         Zc5pleFZTZljUW8efCE7UUXXD6Y8xktAspmVfwibsHENbD/BnP4LYqDoyD99fy9J8XPG
         w2ohR+R247X5/UF2zNHGf6ITnLf34dsK93MPFjPR6CiMlTcddQLHlnfYaATnV9csojJv
         4qga8Q6QkYCGkn1MMt6sWcocsj9uI5i3e7tynSkxQ0AzqlxKX0DgX+NdU40JYPpCziXr
         BnlNVNJNDgsWj3sYW0gRxdkwfF2wq9ZgzAeJX9gYmnI33iVsztlmWYS5r0/ocVrAlJ1L
         3QGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWFraHz5C1IqAVlZJRXJQCACOfNqjVFaA7IV3sIlPL1FHIHqPf3aXp0bbz1H8NWjf6WlVo3HihW@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxpsKS5ZPuzVpYwYrd4tPZJLwgIDMv5klyVOPJWG5Tl1w9BhnLZ
	gNI8zhPjCkcShjwD2MTLHYaQ3HJiJ7PlmWZ8cnihgFE3baPhv83O0hAiwWMLTyL4O+oq8XGRGDh
	0zPd3lgr4DvzORSoO+A==
X-Received: from wmpj3.prod.google.com ([2002:a05:600c:4883:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8a0c:20b0:485:54cd:6e4e with SMTP id
 5b1f17b1804b1-485566facebmr200570335e9.18.1773730035474;
 Mon, 16 Mar 2026 23:47:15 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:47:14 +0000
In-Reply-To: <20260303162314.94363-4-dakr@kernel.org>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-4-dakr@kernel.org>
Message-ID: <abj48uggZonBXPsf@google.com>
Subject: Re: [PATCH 3/8] rust: dma: add zeroed constructor to `Coherent`
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: UTMVKW67JCD7MOGKAJJA7Z4WOJI44LXI
X-Message-ID-Hash: UTMVKW67JCD7MOGKAJJA7Z4WOJI44LXI
X-MailFrom: 
 38_i4aQkKBx44FC68LSBFAIIAF8.6IGHIOP84OFCMNM.9L8878MENIJ.ILA@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UTMVKW67JCD7MOGKAJJA7Z4WOJI44LXI/>
Archived-At: <https://lore.freedesktop.org/abj48uggZonBXPsf@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 03, 2026 at 05:22:54PM +0100, Danilo Krummrich wrote:
> From: Gary Guo <gary@garyguo.net>
> 
> These constructors create a coherent container of a single object
> instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
> emphasis that they are created initialized zeroed. It is intended that
> there'll be new constructors that take `PinInit` instead of zeroing.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
