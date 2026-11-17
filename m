Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D03C606A332
	for <nouveau@archiver.kernel.org>; Tue, 17 Nov 2026 21:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Ci2tyFfv
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 80AC110F976;
	Tue, 17 Nov 2026 21:44:31 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B66BF494CD;
	Tue, 17 Nov 2026 21:24:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794950678;
 b=ag4lp1A6OYnkdKmq5CsOSe/3ucCJ8w1Z9S2q3yqTDDo7LfRoBZnVkRf9XTolDLazzsNTB
 XtYA9u0SYVhUySk5gERF1lGOP9FbBPYUAptzXQXKCiCrHFIa71d/THxiGR4vikjehcJw9QF
 l/FMVXgsBcFRivKByPeSaQSb3yCNVRtjH6VTEUog46kRkRs4YcsJ6p0bURYXoY2kpQm5DfI
 g4kwYWs2W9DOXqHZqZQ9cbXjEOckHsDWarmQnFTFiv9uHrqbp1o05HBj3Jk5x6Npi5Kjygw
 LCHieeRWjqgAtKe0LlDT7uruyrcfM3ijdBCNmcHaWn6SReLsI8rP94PwjdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794950678; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qJvVhGm7m/yddOVh7TzhHkOYiZu5bDfmIBnbwu2rovg=;
 b=Rkwt8CqFbYqTay8reVuvImNL4tLsBfM1LrSGXc+w3L2BGGa/paGsQlyuqO/S0fBNI4iQu
 U3dL+mId1Ygm3PX1di1XfjdiGLX0xQoj/43Q6mWSz9lp55ul8yB5SGePrBWvclTYL6HMIKE
 aGCQ+xxmE9V3aGKgGlVTfUr1bD6byxEgw+OFSrMgqVpY0RcckGmplz/s6SfWxdKtck8x36/
 bs/MAH81Ax2hYQtoM4/WdliGRsa1ibbefarGvGtXSwWHQjP8IbBEpgLLN1Cj19UOAAKsXhF
 9hfeZvL3vFMUtFYFfYuhxOQfkwN9W/+ZoCZOkehypooes9ICyvdZ3AfKfkdA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B13904946C
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:24:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4800310E6BE
	for <nouveau@lists.freedesktop.org>; Tue, 17 Nov 2026 21:44:23 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4bb77a462c6so9583865e9.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Nov 2026 13:44:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794951862; x=1795556662;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=qJvVhGm7m/yddOVh7TzhHkOYiZu5bDfmIBnbwu2rovg=;
        b=Ci2tyFfvDTYYgOnSEu7Rjo+JPBOsyXuhCAM0kAxcSeV3qmozKAMyzBu6qVcFiJ7EQK
         XVZy8sRmMMCfXeDEpZp/Ae8ZawGFSuTMSNWpZANb9fuiONuj14eFl67Zv8fV1tLFQgTr
         9ea6Y8mfBiz8QZaUMllDVFRGBHVXwjwHZwvaPsK1xtTjZnL5zX1XsIHKWTUwjInVzy9m
         cyhIoBoNVje5WxKo8V3gQpGbTo61B63OzeNdh0abgmdUnCjK0sryosQ+jsgOVKPpSrbj
         V+oUd2mf+jPdayuGs80BU+2dt8IRsL4JRg/EcGypcBQ60RinEKJWniuqbvIj5F/hv+Nd
         jFLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794951862; x=1795556662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qJvVhGm7m/yddOVh7TzhHkOYiZu5bDfmIBnbwu2rovg=;
        b=W0c8WRTUXcCp7Pd2/k506NkzUTn6Kz6pr47yYGBuie1avUtr5K6ioQhwkTaOd9knFM
         91z2XmpLB+smoF9GiPkiCEUeyzH3OWKbU4v4qdVb1aE7T8KPwHLiYB4X55Xj9eYeb7XI
         NYpfI3sX38AW/jPfSnM1WNPL3dw3mo5pKl2G9ZBfpe+4fW57TH6hdutYt2n18YOXmtre
         bjlQsXwCC6pDj0e/qkOP5pMIUW1dEQwxXL4Xv0XYQSp4wZ8AkpWd3CaBtvJFgNw7OOID
         4nNx/CiIOXaEj17gGA7yNvMbETcPTw6CCiC5SAmX2nY549fzYFLJDcthRs5R5matL3Gw
         VgOw==
X-Forwarded-Encrypted: i=1;
 AL+hErHtFtsS6uwfYXsrd+3FAx9UOgO1XEyd/RY07YjdF8oRn4reBSmo5g7O+QGwtUvM8dNRQw87zZte@lists.freedesktop.org
X-Gm-Message-State: APuU4Z94nfQlMLRIGUWJC5njxKXb4oJ2g/YvkQxP7rqWQxZYU7sp4fRD
	iffwiGY7M+KMPXoBJ0OF9B5cRpIvsjIH5Bn1/54e/bKrZ/5FH9hBMmpB
X-Gm-Gg: AYBFou1gS2DrzIyJKoqN4xlXooxASWT2bLtu9cS0M22QRAw+YLO4UKlsWCE8WB6ViGJ
	9L/TduZhs6lVJchDJnwmUj764V4J3R5IUVx1D1TTGTyrR9UNjBAL6wgVBfAmTsZg1m5IIb7K2fo
	gTG8TaKrDtTAp8g+5jbHUPPZJKx5TQkiSl/jPLErt56obEVB5NcGChq8rVwrz9h2i+KGFTLtt07
	GiWz4KoJ/Wb9O99ZGQUpb7UD4yhxMvfzrBmVQBd+2A81C1i05E2H4/18BOYalMe/6VjiTGnPx82
	f3Dgz2eTjOTjMp7WO+VnboSugvkzDKFRFqI3iPE6IfuBCAv+nuhxS3kh0M3eGCdkWAOxCX/mRb3
	cEs8stPropBI6vd0wogViYudEe21C5MB8kXTcEd8rfWDSoE8EZt6gYRv12iW36XT68JEu4eB/99
	m0A6jLt2L4R97md8mwTGL/5JcTG1Bcm8+5DTeqZMj6D8KfaDk11WjkmwYMoqMkFIUuCa6Djgu4p
	5A69UBzjuKzehbmNkdKJwvrgrufolVV4cEesHrwv52zda/8wWE6OmXI09NXMGtGzqWIqWcCdEjj
	JsYXPfM0+5EQMBNnOtehdpr4yAJa/iRZidXBTLrLixC8bCVL1TlMY+PYLrM+xw==
X-Received: by 2002:a05:600c:6090:b0:4a2:1960:6fa with SMTP id
 5b1f17b1804b1-4bb7da0c872mr9124615e9.4.1794951861506;
        Tue, 17 Nov 2026 13:44:21 -0800 (PST)
Received: from fedora ([94.200.248.157])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb784231basm95069675e9.11.2026.11.17.13.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 13:44:20 -0800 (PST)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] drm/nouveau: fix instmem io_mapping faults and slowdowns
Date: Wed, 18 Nov 2026 01:43:49 +0400
Message-ID: <20261117214352.337961-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.56.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BRTQAQB672S2O2RRSXHNEDESS2LEN4R4
X-Message-ID-Hash: BRTQAQB672S2O2RRSXHNEDESS2LEN4R4
X-MailFrom: mohamedahmedegypt2001@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BRTQAQB672S2O2RRSXHNEDESS2LEN4R4/>
Archived-At: 
 <https://lore.freedesktop.org/20261117214352.337961-1-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

After the instmem io_mapping commit, some people noticed that some VK CTS
tests became much, much slower, while others started running into apps
MMU faulting. This was because of two issues that combine together.

A synchronous VM_BIND waits for its job with an interruptible wait and
ignores the result. On a signal, the ioctl returns 0 before the page
tables are written. Userspace can then use the new mappings, and the
channel takes an MMU fault. This was an old pre-existing bug.

On the GSP path, the BAR code keeps an ioremap() of the first page of
BAR2 to flush BAR2 writes with a read while flushFBZero is not mapped.
The instmem io_mapping covers all of BAR2 and overlaps it. However, PAT
gives the new mapping the type of the older mapping it overlaps,
uncached-minus, so instmem was now uncached without write-combining and
bind jobs became much slower. This is what caused the slowdowns, and the
slowdowns in turn made it easier to hit the pre-existing VM_BIND bug.

Patch 1 fixes the faults. A synchronous VM_BIND now waits uninterruptibly
for its job.

Patch 2 takes the flush pointer from the io_mapping which allows us to
skip the ioremap entirely. Nothing maps BAR2 before instmem does, so the
io_mapping is write-combined again.

Patch 3 sizes the io_mapping to the part of BAR2 that the driver uses.
This is technically not required, but this matches OpenRM and makes more
sense. It also guarantees that a similar issue can't happen again if
something changes in the upper half.

Mohamed Ahmed (3):
  drm/nouveau: do not return early from a synchronous VM_BIND
  drm/nouveau/bar: take the GSP-RM flush pointer from the BAR2
    io_mapping
  drm/nouveau/instmem: map only the part of BAR2 that is used

 drivers/gpu/drm/nouveau/nouveau_sched.c       |  6 +++-
 .../gpu/drm/nouveau/nvkm/subdev/bar/gf100.c   |  6 ++++
 .../gpu/drm/nouveau/nvkm/subdev/bar/priv.h    |  1 +
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c | 32 ++++++++++++++-----
 .../drm/nouveau/nvkm/subdev/instmem/nv50.c    | 19 ++++++++---
 .../drm/nouveau/nvkm/subdev/instmem/priv.h    |  3 ++
 6 files changed, 53 insertions(+), 14 deletions(-)

-- 
2.56.1

