Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5742CD98D2
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 11:10:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 83B0210EE98;
	Thu, 11 Jun 2026 11:10:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="T1uilIgg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C983746A48;
	Thu, 11 Jun 2026 10:56:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781175370;
 b=cfzO1I5dURryso/QcE7Gks6zP4yo6wS6yL3jKrtldfKcKZ/6nox0ez1P5DAn3J3pOCZlf
 H/werhXkOtZ7QQg7tOVPa30slcnHD6P5O3sRc7XLEh0N64+Kn8GAP3uJlCJ5+A/A/XScnN/
 OQzabMneKm76+58b+60W4HmEnR/zMFd9NJrAxpYzksH/m3YcIpUGVkGD8ybtGoI8TKyKfCI
 7CLO9NXLf2a8sKxUYwefayAWX1TkwzfXZV0I6tnHYKLtCGJVYoj1gFQcfanpz2H8bZrQHPZ
 5YhhoXIWipRNFnpuQ42G0jJRpBwHWEBPJJUnIE51U1BxC5cu17h+ehzjUXhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781175370; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
 b=LDd4jE51ProiaTbr7YomL3A8WAQuNxuxkq5ai2ZwxOH9fc6c/IyHLEhW/XfrBwLonFyjT
 FcCDw4QgXTdY5HYdAFUyH0cFHrcIN3ac675VASxJQUiKiP4Uknlh6YG1sumIU4+C+nFwfM+
 G0UsyOBtU3RPW/L8iRkzKHfsbcB9f9t6klLQf+ENusPAioif34VY+0RTc5twacoMNfxXNyF
 906NJG/R7hvtoBbsVVQKEsKJu+QaSCBZgX78q7Og5p8dvbifFtG6k94J9hsr8XBnGwyitbS
 fbH9xJHtBSeQ8DKgifKCbpOG4y7pR4TKTmSo4LINEFeeJ9pVdRY9GNzBvadA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DD6CF46980
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 10:56:07 +0000 (UTC)
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com
 [209.85.128.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6BBDE10EE8C
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 11:10:07 +0000 (UTC)
Received: by mail-wm1-f73.google.com with SMTP id
 5b1f17b1804b1-490e547f3cfso5217365e9.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176206; x=1781781006;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=T1uilIggIilzLD8Ep7b0pUTjJlBeRH7SWQMbj1RWNsZ6Ew5geteE7JXQA55edulGpM
         RQjtX38SBf9bJG9V2orwC10kBOek9STfMkGLwjoIxOfKxEOqQn88a89jo6926+Lz2maI
         XnxLNdybZOvbezc/cleGMFcyawC5La2CgvZAtNrmCJIqo6IiKo0zzj0EajMofxL9kUCO
         jbHADZeSK8x3ncHi797AaB+yiktF3b7RG0SoakjPX6zQv35AGnBFgbpL0QY54l9ukDK4
         cGcVtlzraF+kQRzUeAlYC1MEB9XR0mpFwD4DMZ+Owuq2OU4KG6PpyzCZoNZkiIVR7iKU
         ljDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176206; x=1781781006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=IRIoELQCxIxSn6Xyp5SSpQlc3185IDiOu7B8Z0ekNmyeZ90bWAIaEnB3XudWhqJrwk
         VjlMVEZBOj2Jy73Ub4MuZulS1RCKtIAP+Ip+EK4wZQPXtX5XUCfIBrqsIIqbytwnYtbj
         niylc5kBdM6+9PHv3J04xjS4h3sVt1tkPz6nYw59gScQcOf0whUXYqV+XoRUfcLbqnl1
         JRHOXRjWjlaPx35mnRe/nap0K74ZYKJG6QCC0ubFW9/taQzlpyKORD16bb1PFPzd0ylH
         whR1R0WYE9FO2/cQNSfJjTXzCzii0rJGSY+2TExqr/9BcjqU3by9goU/FxrPQGfXrBfN
         6Y+g==
X-Forwarded-Encrypted: i=1;
 AFNElJ8oNNDWhCAg2oGPEetkThIVwALCds3N7BajddJD1l/iCeZUfrDt6kVIZVEnLx4W+D4cD2//eXXy@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+HOgDJc1+4ZUEo8GgGL3VhE9r1xz8hATyQXPLssIIispjkx2J
	PtS5NYvvKTIMSJOXzzIk4vfFquNpeYoajmg9GUc5JL6zTF7Xic7o1ORpJ5KVQ4Off2eJEACfpe3
	UDl7+BKXOmMFeVuScrQ==
X-Received: from wmqe21.prod.google.com
 ([2002:a05:600c:4e55:b0:490:b058:c623])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:ca59:0:b0:490:9782:3eb8 with SMTP id
 5b1f17b1804b1-490e561ee97mr20621955e9.25.1781176205567;
 Thu, 11 Jun 2026 04:10:05 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:04 +0000
In-Reply-To: <20260610162433.923550-3-lyude@redhat.com>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-3-lyude@redhat.com>
Message-ID: <aiqXjAPQCQ7POxWS@google.com>
Subject: Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add vmap functions
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: 676PVBCTOLAYPV6WZNGEWB2ATKE3F3TF
X-Message-ID-Hash: 676PVBCTOLAYPV6WZNGEWB2ATKE3F3TF
X-MailFrom: 
 3jZcqagkKB74epmgiv2lpksskpi.gsqrsyzieypmwxw.jviihiwoxst.svk@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/676PVBCTOLAYPV6WZNGEWB2ATKE3F3TF/>
Archived-At: <https://lore.freedesktop.org/aiqXjAPQCQ7POxWS@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jun 10, 2026 at 12:21:29PM -0400, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
