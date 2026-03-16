Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F322EF4645C
	for <nouveau@archiver.kernel.org>; Mon, 16 Mar 2026 12:08:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96C6F10E504;
	Mon, 16 Mar 2026 12:08:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OBLbdcc0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E23204513A;
	Mon, 16 Mar 2026 11:57:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773662276;
 b=l9AEv4oyhzOokttztI9CdOWgyYesPZaVnU1Ksl3InEOQEs6HHUXxrSPI20Qcv2HjqBlds
 NVqEkBz5Te34oDAQo+JxO7ywjlV1SmW0GeWPo8mFYZA0vRr/7TJVqRsUZS8ZRtlLG8laYjD
 cthX508CahEjCOnM7hCNCiXxViNLwn6lGwYcXIMAwDLIY8ezuf/2BGie/yDyhY+ObBqHgD5
 q3rRzN4qmCDLahcdlqi9bm/1LS4m6a8bORnNR7O6qt8i9iUOPKof7bX5iX9YwqgeoWCaDvJ
 vdo+ZwqwXh7rEA12SzmzCmgxrFsThxNlYpy/yIHPxwxDPThQ5HH4QKo4hOTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773662276; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=B/HmswETn8XM8b74AAva4wxSUFI8VgvK+V0Z0VnScGU=;
 b=pkt33EW/irUHMiQhOL3pb2HZeOIgntsWtNQ/zVzGHrHnnm/kLUlV2KDpQ3sl1kVQUiJ/G
 gyUjVekOM8t8RItfJjZm4Ic9w0z7iZIZiTy7XQ8zET3kI2F5RXTNNA/44JQgHeMXD2m6Yvy
 Wba7SUPefOS1LAQnMzpNFIa8jw0pdZS5/OQxCGVXPZCn7kfth2mknwUgebYi98CZQbbNrm9
 zzeToIdQxgb8jeMxzcdiIvjklMspgQshi85naaFTJ9Gg4Xzq7ck+4QcgIxn7CJ9xMA90I8p
 WBeJaVyNG/Z3WA+RPnbL+Gv5GGGGgEBGH9Pr/6med4oYU0+y5s/3K6J5ySzQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id ED91640696
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 11:57:53 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 79E4610E4FD
	for <nouveau@lists.freedesktop.org>; Mon, 16 Mar 2026 12:08:40 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-35a1230c60eso2292578a91.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Mar 2026 05:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773662920; x=1774267720;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/HmswETn8XM8b74AAva4wxSUFI8VgvK+V0Z0VnScGU=;
        b=OBLbdcc0KCdoi7Qq23UKrC2RluvCMBKtdybiCBFgA4nPkjWsTxlLwc6Bn/U7iXll4p
         S9ki7Ps5eilzJYHN5KnSvkJ2WgmCaysXgfp+rS2g5h+Tp4izCeno9pDaszD7KKtugpFZ
         I7jbyrGtBihrIPTSbpzK9i0F6elaXhwIzYbp9478t+mIhoecXLB1WvPPERUaSTrgLGo1
         i1NtdunIoveMZlMX0/uVgg65kSHtHzZjfcx+qnq2hW/F9Fhd5K8r4O3JKNh71kWRMOoD
         icfNZNhCxPyxIy/UScYlrna/vGjArz01VFjXRsf8zy3SCBW1aamtnbnOCVEBX9l0YwXK
         /J0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662920; x=1774267720;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B/HmswETn8XM8b74AAva4wxSUFI8VgvK+V0Z0VnScGU=;
        b=lWFZCDdr6DiG27EDREMW7AOf2xtaQG9WhdhL6smIIljpeF+5L4Xs33QgYHUmZvSGSg
         Xa6Ay8ZLYvvLlERv8BDSXyI113C1TAgaFJaK4Sjn3mhOoxGysbbFTaMUsf4yRRJvXA05
         hv4WUwITGmRFBY3hPTshIiz3NluoE39YDCrIcy9NICRqUoZWUamPLz2vpzUCMdtXTR/E
         BZKYDGwL4V/LwtsjkY7OF20qiZ/6ZlBw0zEp4PQFqoaB087ESKLb3ZS2omH9dSJ7lLPA
         lzxJWRQrDV9vB9IPIMI8/+jMhxTWIZmtbgmEojxdrpFKEff+AKIwwkPeTCF9slq3e1Ec
         l7fA==
X-Gm-Message-State: AOJu0Yxm7ozV080ehgfa/M0tG10n+wq55ggoO5sFrzdRbD7Sk2GSuq/Z
	9oPhfCDO3OGMspNBwYmmuVDhe6Sl0/XN7208aT32kaojnzlN4Ds3o5Dh
X-Gm-Gg: ATEYQzwZ+ZX9w7Ab3YxXqAxCNRxv4IfM7V5xFovk03XbJpL8uLVCk5h77KcQdngVtfv
	XhK8WCflwm9XS6VoyuaBWLMDmhWQizylMpfgdKGpo5LgViPTgdUjmkUrnubatVDX7PSVJicfXps
	r5wsnWrbASXaYT3DOsmO9tVqN8bcvoks8vZq2JiWpRB31TrBu5ql69FKqLyFV99pcEwGmcVoLGT
	qdC2okP22reXeWktaBNkwDvtHKP1VCeLKS7igoHDPRHX+aK98r4Jiunq44F3/o1HOrmYuFX/+db
	MCXqNkIsTn405znd0oo/bZb8Un5H01PKih+/VHjgSmYFQ0ZxQhA/tVzsj2cw3A56VPLG1yk2YLl
	MReXeVXvZHqEhV9h6mGa2anQ83M7JmnhWknQQTZOozGYApqkacw73rvNhG/TRz9CqE4sFeNG7y7
	1/NEXq7dGqpxcXFmuyIJX2h4LJkVDpopxRAz5n3IOvltCSrKQ3nH1C
X-Received: by 2002:a17:90b:510b:b0:33b:b078:d6d3 with SMTP id
 98e67ed59e1d1-35a21fd68f4mr11272122a91.23.1773662919828;
        Mon, 16 Mar 2026 05:08:39 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:c21f:f7d6:f4bc:6198])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35b9e36f45asm3240083a91.3.2026.03.16.05.08.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 05:08:39 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v2 1/2] gpu: nova: rename drivers to use kebab-case convention
Date: Mon, 16 Mar 2026 20:08:19 +0800
Message-ID: <20260316120820.2117081-2-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260316120820.2117081-1-yphbchou0911@gmail.com>
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: X2D3P6XOJPIZ3OMPZ3ZXXFXVWDSESYYE
X-Message-ID-Hash: X2D3P6XOJPIZ3OMPZ3ZXXFXVWDSESYYE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X2D3P6XOJPIZ3OMPZ3ZXXFXVWDSESYYE/>
Archived-At: 
 <https://lore.freedesktop.org/20260316120820.2117081-2-yphbchou0911@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename nova-core driver from "NovaCore" to "nova-core" and nova-drm
driver from "Nova" to "nova-drm" to follow kernel naming conventions
before these names become UAPI (e.g. exposed via driver_override).

Also fix the nova-drm driver description from "Nvidia Graphics" to
"NVIDIA Graphics and Compute".

Link: https://github.com/Rust-for-Linux/linux/issues/1228
Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
Acked-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nova/driver.rs     | 6 +++---
 drivers/gpu/drm/nova/nova.rs       | 2 +-
 drivers/gpu/nova-core/nova_core.rs | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b1af0a099551..e3de04f358f0 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -32,11 +32,11 @@ pub(crate) struct NovaData {
     major: 0,
     minor: 0,
     patchlevel: 0,
-    name: c"nova",
-    desc: c"Nvidia Graphics",
+    name: c"nova-drm",
+    desc: c"NVIDIA Graphics and Compute",
 };
 
-const NOVA_CORE_MODULE_NAME: &CStr = c"NovaCore";
+const NOVA_CORE_MODULE_NAME: &CStr = c"nova-core";
 const AUXILIARY_NAME: &CStr = c"nova-drm";
 
 kernel::auxiliary_device_table!(
diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
index 8893e58ee0db..1fd454c7e0df 100644
--- a/drivers/gpu/drm/nova/nova.rs
+++ b/drivers/gpu/drm/nova/nova.rs
@@ -10,7 +10,7 @@
 
 kernel::module_auxiliary_driver! {
     type: NovaDriver,
-    name: "Nova",
+    name: "nova-drm",
     authors: ["Danilo Krummrich"],
     description: "Nova GPU driver",
     license: "GPL v2",
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..90e98380687b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -22,7 +22,7 @@
 
 kernel::module_pci_driver! {
     type: driver::NovaCore,
-    name: "NovaCore",
+    name: "nova-core",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
-- 
2.48.1

