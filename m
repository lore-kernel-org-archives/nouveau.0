Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B29CD98D2
	for <nouveau@archiver.kernel.org>; Thu, 11 Jun 2026 11:07:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B40E10EE8D;
	Thu, 11 Jun 2026 11:07:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="AGjwJLap";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4B0B846A3E;
	Thu, 11 Jun 2026 10:53:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1781175207;
 b=by8MGHp18g+hq/msC8p8W5b1m/MnwtD6UYkL5l6/LdSPzcfu3B0ugxg1TWrCH9n4aeleo
 /+9sAf/PdTXdZjFMZxTmNg07vOXP5H4dmZYDzIvYFk2Ia3BnvnP3BZuMlqk3sYYwtsLI43/
 YBd912uORqEjvmotnid4nFH2VnzhioDn1/EdpEfgkW1ARgQ0oTBi7W7kZ8Z7U9F/4Rp8+6M
 /ZwdfXF+ljkkd227OeDp1u/0SItJwThkMfb5ZPtYwM1DoArx9ELl4jPK+s4N9q8RnUrnCOH
 mPc+b1eGJhySkeRnLIa7eg72ipVbBZ2k26gOtsLr1puz04vY1IkRLhA4rHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1781175207; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
 b=I8+UHDbiHJ2ctI3jv81VLdDSVidSI9jyzzO2t/fkkDuoOwJvgTFZv6DH0H0vnTLjzwPfy
 D4iqcXsVSKg7wmpTAJOqLBqRHEsJkxocGs0OItnF/X6Pl7rWDq2CvUOI2BJQlTw3TAaYWE/
 6ry3EniwzIaI05DIbCgkgkR3hVkY2J8blCf5zuo88sZTgQ1QgDg4oXXSlSfZd7x23jzZBdM
 rxcuekBiuL3+mKDjyZoT/ykrjfnwBJRP8qpRwjMYlBUyvsJU3QaNCJyhSvjRn4VygY74ZJs
 fkuGxDLzPMisroZY6IkcwerzoeHi5LBlO9MfRTIV0pxNFtq/ByEnvZHE8IIQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C7698469E8
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 10:53:24 +0000 (UTC)
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com
 [209.85.218.73])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 40E8210EE86
	for <nouveau@lists.freedesktop.org>; Thu, 11 Jun 2026 11:07:24 +0000 (UTC)
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-bebacba844bso580590366b.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 11 Jun 2026 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176043; x=1781780843;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
        b=AGjwJLapWHoRl8nUQgne96j2hrfb/ie92AqeZWlK2IOWBwJPdQ7MIZI3KLYZwSFhl7
         diQYdUJDEPfP/ZJi7U9MEC7aIi7istRsKqdhRbcxYMtsz3xb9kXxNaXQ1/G3i77T7yKI
         h6z2/iEFY9fa8nkbqjMJmAaWmYUkxWahmhunfZ1lBBBX9E7XEifjkfRudqubZ3g5ltwE
         Iou9cFfXWv9rgA3699n13QewAdaawYQdH10pcuoFDzlwypL7Vp21ChqJR0vpkJ7JNCnc
         vDqyVy1saXz+gUouxTaTsNVJ01TLoZVFItLGLkyE0Mak1LvZbuTg+SjZCZXx6Nlyv1ms
         15Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176043; x=1781780843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
        b=c6aMa8dAB8pUIEhHLHwpk017KAcq4pzSWVSyk0jpFgER/E4XbM8EIUNvJ7clXvDJRK
         trDVckvrvecnm/MrUMFQCkYtbFAOnXQWiNIQkl73V0zNR5w0crGqMLsvM6tq2kCCc++j
         jR7qJCIrxQaJfldsiau5B0KBopu5Ncc9TJUsMwnUePvsXcEZ1D+C7YLgz+iGjIanlSwe
         dvfqKYqDN7TfHdueP7x/KnBeIgqny9z87rz1RRYLoawtmMn6Hgp9FIDj2lc+sytsCFZG
         HACkTxYIh7sYOzoJBDfT1+NWpNZDuVP5ptQ+8q6oW0aXxcPi1o/qnBIufOB7UI4NitEU
         mYwQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+KdcefQ0sRTnFYBe3sLkvqTj4VTEGrwqEzbZBLLsxd7Gev5UY0XJ/IGx4uW+7PdiDbsT/L7ZRs@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdUyVOT4ewksM39tNNUFG9i/T1sN7MKD8jNDqacbw31ONZolWp
	r/tvQaoyE0ah6Ei0TONaEN7wPHbPrfFIoEOtlw3+EFnrM3vto0rZ8pxLpefC2X82xa9pYR2zPrk
	UNRfD7Tyrs2/p6YKsIQ==
X-Received: from ejad6.prod.google.com ([2002:a17:906:406:b0:bf1:4fcd:aef0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72cc:b0:bdb:4cf3:7035 with SMTP id
 a640c23a62f3a-bfc85745bd1mr113064466b.4.1781176042458;
 Thu, 11 Jun 2026 04:07:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:07:21 +0000
In-Reply-To: <20260610162433.923550-2-lyude@redhat.com>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com>
 <20260610162433.923550-2-lyude@redhat.com>
Message-ID: <aiqW6WcagiyiOAKZ@google.com>
Subject: Re: [PATCH v20 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: HFC4LLU3A7WG2XU4SXY3OQOBEIZ54BDR
X-Message-ID-Hash: HFC4LLU3A7WG2XU4SXY3OQOBEIZ54BDR
X-MailFrom: 
 36pYqagkKBxs1C935IP8C7FF7C5.3FDEFLM51LC9JKJ.6I5545JBKFG.FI7@flex--aliceryhl.bounces.google.com
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HFC4LLU3A7WG2XU4SXY3OQOBEIZ54BDR/>
Archived-At: <https://lore.freedesktop.org/aiqW6WcagiyiOAKZ@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Jun 10, 2026 at 12:21:28PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
