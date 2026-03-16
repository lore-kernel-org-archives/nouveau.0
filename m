Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4CFAF4645A
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 12:08:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1F910E4FF;
	Mon, 16 Mar 2026 12:08:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Wt+BIeKW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 876AC45138;
	Mon, 16 Mar 2026 11:57:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773662274;
 b=xU5Jqibu5PXWARpy/cqkhCAJpGRa760JApRCV4Gty5w5DSgRaNRFW/KmRyi7zVt44EEXO
 zXz1c2UIGV2Z1fEY8FJVlF/28ba7GWDPNFqhfH+qPDFHCwoTnGjPbd+hgi10ku00Z/yhK+k
 YYNQItp2arAfOO4OL69D7VTKHQA6zaD2+7RpMj7BVN2KTnPWUlLspM8BvbI7B8f1XOnzdTf
 7WHILIIGRVv2CwivvSgI/H5CfxFbozb/QzeQ8YDp54hFbpWRw+/AdkaHdtfauGIJwZg+cV/
 YQdLMjTnWi9IBP9Ci7q46+Bl1dqRjJwaMUg8z7wUwUF/9Hu/UMICbhfBIabQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773662274; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vmt6JmqfOvMD971meinjv4RPE5FU1VzZS/x4CNlI5L8=;
 b=XAo/aDjlTPzLfWGy0gy//IdUOlPCxQ/OvlOhk1zRFslX1rBBCa6sjIMJzXtKqTpkMcvVA
 jzbBGBSv6g27fuzRj8hygLeoUwcjCygCsSN1yjLabeNfwt06znKBDs37zlWls3AopqJodBH
 D7N331fiVMRoEwC13Ji9ZOWlAbSpfx9PJBKdzFyF5Cc8FhkJUp9gQCgbDfvf52Qh/qLQo65
 wr5sfrBlLI6KSg6nmx00j0ky2Ap1J0HYeqKxUr1h4b7UbPE/FVHibZ8RC+aDp2CHuBSK+i2
 1YvLpnHZyzMFNJnXRPMAQATD7MvFkWbdXXuZxdueansKComyuxpCESKYc/Jw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7981540696
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 11:57:51 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DAB3C10E4FD
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 12:08:37 +0000 (UTC)
Received: by mail-pj1-f41.google.com with SMTP id
 98e67ed59e1d1-35a288a2c00so1286021a91.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 05:08:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773662917; x=1774267717;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vmt6JmqfOvMD971meinjv4RPE5FU1VzZS/x4CNlI5L8=;
        b=Wt+BIeKWwQCpNdkRItFqtN1AumgnSOD2cz40AdpcqDEuvCbVOyhFFl1muX1Z/fmMte
         3RNYiYTTOFBaOAVYMHvJcTlvA+bSPiY0Tr4jbVCTIBOCFQjjqF48xZbCqzcQU6BRdKlD
         1SaBcsxIN39hBiQ/54Zr2IqQrmFOJyNLHH1SQf1nbXdReBvVKs+OETMdWoF3mz2St0pn
         7JNKFnMkDKQEO9WKrMTNLYX3I0cI0AmQUKdijWDuKnCScUHw1J7mG7JNj0uqAdcjAYav
         nyMeU745/PziKMnfKlO+xm22BLSu3m7ZQij8ZQofofpYBKwW1CWqSkHjN9uc9adE5anR
         Vw6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662917; x=1774267717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vmt6JmqfOvMD971meinjv4RPE5FU1VzZS/x4CNlI5L8=;
        b=Yl66nif4OW/kXkQSxzye4xvHZdu3r66bQwFGE1B23RxX9xyVtxW4MHGgTnv7QfxPmV
         KtlJHcm3r/fjrpl6+1Q1LOGpV62F8Yqj67AIbMOH2wky3DqcW5PGEb1s39uPPcyveIDC
         3kliVNPbin42D/pSPnxRzGoJAXs8gsimdQdrRhFknC1Sw+K0KTbQkb98X8vO/0f7IqAZ
         +Kf4OjHb79GpS1xx9wetZcDfqCYuZHqj4mKoHGolwvik2k6+fVRZu1P5T/eYqfjwcf9S
         WSE2RG72V5exfdOYrMFy2moaZ66F5mrxRioBeSgjYKvoMjPkuDyTbffmQK/w8WOEbMb5
         pX5Q==
X-Gm-Message-State: AOJu0YzysD2fecBqQ+2il5O9iZbHekKdy9w9jnqrABg9FInAaz17n27j
	lPA9j31FmcP5urfg4JqzUYWKiJjU4Yh8L/hwBsJZcaELyWeJ3CS8ntzD
X-Gm-Gg: ATEYQzxGSNls3rAB8n7fYA7Qpp8Lee2rlDxsGDimeyrFHEsAL8TjkwS9awTX/aHj0jS
	kKm0CPmPw7Q3bIl3qJBNE5J/z7QhvAkJ9BmotznHk6y7ACMb1UZnQobvx0f4r9/TK/ThRErJKa3
	uqiNY4pe5cUKMGFdyQznTFxieMxKZn6a60PdIbEvq2RuXPPipew8u5BdwhCgfE2tOV//Wby703u
	3cIsX3ZiS4n9mqikq+Hr569rCjGXb9cWpNC+LUbqhlkfJOr09HEbulizvYm4/nulEXtuEeqP3ps
	z4hJGMqZAMb1P3lul5ePmwdPvt/y9u8AoXIQe89Jof5+pBHc3nWvbG9OASUSPXj0ffnEmaz4umJ
	A22StfNUMFdrIasq0UL1d0cpIcPz2AwzWbOrRcpjVUCxwNwxFY1t/m8NwpdT3n/Bj/OWtWFj/bM
	TMRjlmh2CDhydFlH+VggOMWT8aREMWlOyFreoiN+HWPbArUUg9aV7f3AHsuGE4YWo=
X-Received: by 2002:a17:90b:1cc8:b0:358:db7b:f686 with SMTP id
 98e67ed59e1d1-35a2206c05cmr11091492a91.26.1773662917159;
        Mon, 16 Mar 2026 05:08:37 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:c21f:f7d6:f4bc:6198])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35b9e36f45asm3240083a91.3.2026.03.16.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:08:36 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 0/2] gpu: nova: rename drivers and directory to use
 kebab-case convention
Date: Mon, 16 Mar 2026 20:08:18 +0800
Message-ID: <20260316120820.2117081-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YWSNU3JZXCFG3IAAIVO2HYZ6LAGWT22W
X-Message-ID-Hash: YWSNU3JZXCFG3IAAIVO2HYZ6LAGWT22W
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YWSNU3JZXCFG3IAAIVO2HYZ6LAGWT22W/>
Archived-At: 
 <https://lore.freedesktop.org/20260316120820.2117081-1-yphbchou0911@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename the nova-core and nova-drm drivers to follow kernel naming
conventions before these names become UAPI (e.g. exposed via
driver_override).

Changes in v2:
- Also fix nova-drm driver description from "Nvidia Graphics" to
  "NVIDIA Graphics and Compute" (John Hubbard)
- Rename drivers/gpu/drm/nova/ directory to drivers/gpu/drm/nova-drm/
  and nova.rs to nova_drm.rs to match the module name (Danilo Krummrich)
- Link to v1:
  https://lore.kernel.org/all/20260310062443.2763230-1-yphbchou0911@gmail.com/

Link: https://github.com/Rust-for-Linux/linux/issues/1228

Thanks,
Cheng-Yang

---
Cheng-Yang Chou (2):
  gpu: nova: rename drivers to use kebab-case convention
  gpu: nova-drm: rename nova/ directory to nova-drm/

 MAINTAINERS                                            | 6 +++---
 drivers/gpu/drm/Kconfig                                | 2 +-
 drivers/gpu/drm/Makefile                               | 2 +-
 drivers/gpu/drm/{nova => nova-drm}/Kconfig             | 2 +-
 drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
 drivers/gpu/drm/{nova => nova-drm}/driver.rs           | 6 +++---
 drivers/gpu/drm/{nova => nova-drm}/file.rs             | 0
 drivers/gpu/drm/{nova => nova-drm}/gem.rs              | 0
 drivers/gpu/drm/{nova/nova.rs => nova-drm/nova_drm.rs} | 2 +-
 drivers/gpu/drm/nova/Makefile                          | 3 ---
 drivers/gpu/nova-core/nova_core.rs                     | 2 +-
 11 files changed, 14 insertions(+), 14 deletions(-)
 rename drivers/gpu/drm/{nova => nova-drm}/Kconfig (84%)
 create mode 100644 drivers/gpu/drm/nova-drm/Makefile
 rename drivers/gpu/drm/{nova => nova-drm}/driver.rs (94%)
 rename drivers/gpu/drm/{nova => nova-drm}/file.rs (100%)
 rename drivers/gpu/drm/{nova => nova-drm}/gem.rs (100%)
 rename drivers/gpu/drm/{nova/nova.rs => nova-drm/nova_drm.rs} (92%)
 delete mode 100644 drivers/gpu/drm/nova/Makefile

-- 
2.48.1

