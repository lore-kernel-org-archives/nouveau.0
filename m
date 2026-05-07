Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE943CD3442
	for <nouveau@archiver.kernel.org>; Thu,  7 May 2026 18:50:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3019D10E5BB;
	Thu,  7 May 2026 18:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rZnM6kIl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 777CD45E10;
	Thu,  7 May 2026 18:37:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778179071;
 b=GeqP4fT+dNYMbtwUDdwwCtPhtYxkaBXVxhAqRgpuR9Z65v4JgRYDxPMCCwAO3/EDX115x
 UZKoV86Z8CHeouzRFMp7pwMo+BbJUHMVu4y4G4Mu68w304XXgA7jFZ30SGaPahDSUZ8m0M/
 LyYmwjW+oB5mEZxBe7PFbDeKiQUMx5z6sqplrG1cFUc365J23KsanidPFmb8iftpycWLoX6
 Z+Sg8cDdV8MwRNt6i8tphMmbNOwdx8fYjLe4ueUQGoS4YKAULp5lJojvwkZhN6yRULilEUS
 QgfWapl0WI1VHi8M6q3KNrisNF78x80kjsp6Dfn0gIIX8eTCY3pO7aD81lNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778179071; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cuuY9z0rIedXPeFqO2cyF/fMdOdBTdI3139yGpjZsbQ=;
 b=xP+hl8w6DW5dQo4+/44zDD00yqh5FLIZSF7gqXfuoZ4WtQ+LUoSBg5gViI1zlkt/O/y/d
 KKZPaTGVmlSEI8NVo7ZzHiQvNBaLtTAjN2eGjBtf4qI21LfEIKBVdNsii977BWt/RGfaLGq
 03kBhLXyxbHSCHJ4GhjLaFW4xuSZB8xG0YvHoNFFr8zqff+LRWc/ZNHQ35jZuOArMVKIN0e
 ZdU4EJK8XfrhpgprXB/7NxfAus5f/w792CS/910Ji+puWwbhGVpG8fi/WUSjSGHzitNk1/O
 KjwwSM/9s9wXPuled1/uak2HXuCziRe6ahIlafmsxD994qYMpYkqATe9dHZw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD1F545E0B
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 18:37:48 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com
 [209.85.214.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46AE910E29D
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 18:50:31 +0000 (UTC)
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-2b4650d5f5cso4560965ad.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 07 May 2026 11:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778179831; x=1778784631;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuuY9z0rIedXPeFqO2cyF/fMdOdBTdI3139yGpjZsbQ=;
        b=rZnM6kIlG9RI7UNvWTVseOj/yatYk779Ec0S/adVS9Q1XUMEUIU7xZ2M/1ioaZa5fT
         rOPJni8GDCA3SXuAl+mqaPXRF6KFSBOQnRA3UvVK/AA3AjJXKLJmTMpOMOVohuaO4mMK
         p9O6BzPjKQHCNRTmeCnQe3digjSMOcRyFnIzH74Ts8EUyqi6lGd7rXrUbXVnADax1jQ6
         Q44kfuIQ0GfwPcNI6IgrgRZ/yN+tv7ghkwDsHhOllZK4X0apDc6l3BWOGf4DdguglzNL
         y6MuYou6XjqqKl2+VZOHCmUUNahX8nrXPShdQqE/dRCoYNa8hVQrQ6BgPUTTYKMp4ho3
         +Jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179831; x=1778784631;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cuuY9z0rIedXPeFqO2cyF/fMdOdBTdI3139yGpjZsbQ=;
        b=ZU4x6C70R6THKtmkZ5GxSHeDa4vL1rcm4kphkfQAMLwm5HhIMZ75vBaVUipotTgwOO
         Cm2DvpoP/zb1hTbI5FBkTKTCfn9vvF9i9bQY9gfH6mu3j203gatoEi7hNRNCOCMrx5mo
         JeGJIF5NrDwku8edj+8UJj4vVkOdIWZoV0AHF2ytVMPKYOkW2c6e9D7KgNrXz2oiZH8F
         6VNcT7wpsfmNa9H5rDz5yZnOkEfr4XXRuw05W5H7Jq43jvbx1lwaHBKork50UHPZY2nI
         EKBtH1O97WEzHnHqHQmJLsxz/3n938cStQGH7sd0SlSZqywFDmzDvkVKkAVwPtmbN5ax
         s2Og==
X-Gm-Message-State: AOJu0Yy77JIpMPBQHVj3dnLH1fUlOuIE/PIDK86LCnxQ5T/nJbTeh8Mv
	sixoKvYR2LmSuVPch7ZeOEPIaIF9m8UvKJmlNh3wK7EhOb/1/gNzqAza
X-Gm-Gg: Acq92OFSX0E3W8CYThwcxJ5Wd/1xXhRPfqiYX06rbBJKrx8J9ML3ru//AedWnf6Gj5R
	nASPumzcjoYNigGGvJS6qmIdb5CiNLNyf2V1Kd/gP0snj9kNJeXschKAMn0xPDbKnk6GM2gQu58
	dsgDmx1PpWYl2+cCoo3pisbmkfEciZfZotpcERIS6fX09M+zbQNLO2+VyxubZspyNjtEUQ0V+YM
	3bPJjt2VQtXNBkSPYvmU5/ZIzrSHohAJ4ofbELspfwOQkvI3eIcF6hXTGbKcU8VbaOcRAqbpSvM
	7EZbKwxDMWAHcXSMROxjmHXqmDPdP3OY3SmCFOkCS1+0N4ua9qAUny1kGwGhK/jzGfL/XB7XnV4
	ZEyE/s+bi+V7G3uffrzmADtHvps63hW1yke1OuAd4Ywx3j3vvmQGwNmNwHc4rOlZEe7hNb3A/tC
	hktToC3XdkmHGcyqEstsZVsT2XjhZLPywBpBewA4KRWRoRhgLWFPfN
X-Received: by 2002:a17:903:3d4b:b0:2b0:608d:d8a8 with SMTP id
 d9443c01a7336-2ba78f5005cmr66704655ad.1.1778179830621;
        Thu, 07 May 2026 11:50:30 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:1e70:8174:f80d:ff44])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bae78709d1sm4272595ad.67.2026.05.07.11.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:50:30 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 1/2] gpu: nova, nova-core: Rename to kebab-case
Date: Fri,  8 May 2026 02:49:25 +0800
Message-ID: <20260507185012.1527139-2-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260507185012.1527139-1-yphbchou0911@gmail.com>
References: <20260507185012.1527139-1-yphbchou0911@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7YKG2JZNXDXTMSLMEHYZRMQUUW4CVDGI
X-Message-ID-Hash: 7YKG2JZNXDXTMSLMEHYZRMQUUW4CVDGI
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>, Cheng-Yang Chou <yphbchou0911@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7YKG2JZNXDXTMSLMEHYZRMQUUW4CVDGI/>
Archived-At: 
 <https://lore.freedesktop.org/20260507185012.1527139-2-yphbchou0911@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Module names must follow kernel kebab-case convention before they
are exposed as UAPI via driver_override.

Rename the nova-drm module from "Nova" to "nova-drm" and the
nova-core module from "NovaCore" to "nova-core".

Update NOVA_CORE_MODULE_NAME to match the renamed nova-core module.

Suggested-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Acked-by: Timur Tabi <ttabi@nvidia.com>
Closes: https://github.com/Rust-for-Linux/linux/issues/1228
Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
---
 drivers/gpu/drm/nova/driver.rs     | 2 +-
 drivers/gpu/drm/nova/nova.rs       | 2 +-
 drivers/gpu/nova-core/nova_core.rs | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver.rs
index b1af0a099551..f8f7beeccb13 100644
--- a/drivers/gpu/drm/nova/driver.rs
+++ b/drivers/gpu/drm/nova/driver.rs
@@ -36,7 +36,7 @@ pub(crate) struct NovaData {
     desc: c"Nvidia Graphics",
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
index 3a609f6937e4..80264094d44b 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -67,7 +67,7 @@ fn init(module: &'static kernel::ThisModule) -> impl PinInit<Self, Error> {
 
 module! {
     type: NovaCoreModule,
-    name: "NovaCore",
+    name: "nova-core",
     authors: ["Danilo Krummrich"],
     description: "Nova Core GPU driver",
     license: "GPL v2",
-- 
2.48.1

