Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8E16F33804
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 06:52:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2786310E349;
	Tue, 17 Mar 2026 06:52:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="q3nF+TF3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B6D34451CC;
	Tue, 17 Mar 2026 06:41:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773729695;
 b=NFRj7hddSI3nVYMw05oPDu31HU1DwPvtaxbr5yXxtjwJak3SdHyrQ6abejaaHS4yNuUaQ
 xtlqOu3EJTDT2P9SFZ5L+ByqW3I1OvakpFXI96HCrEUWB4WnFYCumXEhB1OBo+6+GHpxZq2
 PXWK7gRf1CHLas9Ld465KnMx5uJYGHij6ipOnYpol6sk8LK8bo+B+tIBcbzBabUHUbmSJR7
 BBeGOPrJctI19AwoaOQomCCE6uptvRW8K5j1+3HwLqizbU8ApSpWo48vZlEBF/L5WDDwsTI
 g2rVetQSDrtyhcYncgsL3xXdtsZS7Q3m5UhTfethAQ0DxS6CqAs6tmn5mx5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773729695; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
 b=dn6KL/Kicxx2njWUAu1UacKQOySY5JDANN3izK5ExfSIwVGf3C5dqbORxScatkBUajUc5
 nwBQBcovbb1yyUSSiZ687kS3GdEEVq56lD9SNaOB8vzuFg9UfxiVMxxJhbvlMo+cbjUVoo7
 VGJXgNZtUzg1Zw2WQaA+KWlZ1eOoQu506XCh9M93IqvkP4dZzKjEO7e0iQcM13b94T0ZS5T
 R9quXVJcIYVa6m/T6VjTiIEO/5Ym1/22irgbmZ0uyEStA2sRoaYJ3ginV9jr/JHpMe6L1r7
 FnVjser6sZ/zUSRoAPrq0QFqhZe/7WB17HnnKObD0ANWXa0oFFJH4RASR69A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AB15645168
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 06:41:33 +0000 (UTC)
Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com
 [209.85.208.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E398210E347
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 06:52:21 +0000 (UTC)
Received: by mail-ed1-f73.google.com with SMTP id
 4fb4d7f45d1cf-660fa747a8aso4791909a12.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730340; x=1774335140;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
        b=q3nF+TF3VaiJ0tQYnhZzGu+ov+JTB6akvHBAQZAuujL2iB1HdsCc9BQJsS65PQpS2C
         AGlyJn+pBwQ66Mx1WsDWSloxGXL9vlTGRUJ+pxcAwGDBtBpPeeBBwa0APq4fdSEH0Rs6
         0SbQl1ZRui1v/OJAVCZhxZBQ1WdgHtpnv6WFu/Du3pYui/8qfdZK5S+IQEsTonozLsSW
         Xxcj1GA92nY/drszk5ZoV7hlY3aufHWGRjcD/ZmQBcXkl+YaoW48MLEdVidi+v5SvuzI
         ILhKjolwh1+Den8S4LmaDZTH7YQrMqE53hYSOi/B1apz4Z8+MUy3Dr7pyzAaBmZRrFf4
         L4OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730340; x=1774335140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
        b=UJKlcIuOTs3CZQSxI4K0BiV3dMsrZjW/Zny40BlQNYzSi2Pdd0x1DyScSAvBZQytjr
         J+O5yUARMtqwfX9YYssicQt6Q/iVqAhZr0pf7ocp+hpAS3i7EMW/j0EuAHXSvFntbPJn
         zpzhO/doc3LXxDaCmZ6iubn8NY9eMn9L/MjqrhQeB1w8g/ATE8XemMuwfQZmwQ7r+Vc3
         yPVxpIeLSjGtruWHe0lTcfWU5x4oh2f9tA5JyK3AzB9VyeRDXSjKpFErLpSHTsfmIXwX
         bDXUthPGWrT0SeYRCeZFCUsXwRkuuSr+eWqO9mDODe3/Skk6UV+wyGDJHrUAIWFXxL6w
         NPwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo9ct89nl43XpPFfoISr83ZE7rlyTT/LkIg6QcMj8vaAzLidI18kpWXkNI1V/+JdjrRASu7mo9@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJVzgd67TXJPkE4N/5Ao8dcqj+tIZ+JlNuTBmXgFTM/4XrInoZ
	rPTk8L56L+VPUdvfqI5wsK7lvp1KFx0DFJD9zp2lr440DkGaFwlNs+cK+0kOa6K1D/znQWqc6gI
	XXSHqA6P3VWT0vYukbA==
X-Received: from edrd8.prod.google.com ([2002:aa7:d688:0:b0:660:cd0d:914e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27ce:b0:663:8841:17c9 with SMTP id
 4fb4d7f45d1cf-663babc44ecmr8734757a12.10.1773730340157;
 Mon, 16 Mar 2026 23:52:20 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:52:19 +0000
In-Reply-To: <20260303162314.94363-5-dakr@kernel.org>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org>
Message-ID: <abj6I9c_2IR0cKJ6@google.com>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: CPH5Q33WLSVG77WMF2ZSCIFP2E3WE5RG
X-Message-ID-Hash: CPH5Q33WLSVG77WMF2ZSCIFP2E3WE5RG
X-MailFrom: 
 3JPq4aQkKB1Et41vxAH04z77z4x.v7567DExtD41BCB.yAxxwxB3C78.7Az@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CPH5Q33WLSVG77WMF2ZSCIFP2E3WE5RG/>
Archived-At: <https://lore.freedesktop.org/abj6I9c_2IR0cKJ6@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
> Currently, dma::Coherent cannot safely provide (mutable) access to its
> underlying memory because the memory might be concurrently accessed by a
> DMA device. This makes it difficult to safely initialize the memory
> before handing it over to the hardware.
> 
> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> before its DMA address is exposed to the device. dma::CoherentInit can
> guarantee exclusive access to the inner dma::Coherent and implement
> Deref and DerefMut.
> 
> Once the memory is properly initialized, dma::CoherentInit can be
> converted into a regular dma::Coherent.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

overall LGTM

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        let ptr = core::ptr::from_mut(&mut self[i]);

&raw mut self[i].

Alice
