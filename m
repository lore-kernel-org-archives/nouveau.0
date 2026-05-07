Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257FFCD3442
	for <nouveau@archiver.kernel.org>; Thu,  7 May 2026 18:50:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F14BA10E2BA;
	Thu,  7 May 2026 18:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Jrd69Sex";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 31F6045E10;
	Thu,  7 May 2026 18:37:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778179069;
 b=qvBUcARzsXTrcX+foUlKgBDqJOtxJQW2CdHQJ+XWdEETuVaJClJGDPAA4GnHCVRMHbF1h
 s+xFTBuc7js4HUiVXkNOYUgpgjLN0x4stwtfhSL1NqmIFcWV3QydvIzP17Aqk/v8YSsWHCu
 xZHu5wPlfds6LNhdYqGG15gE53MP/08bH4jqPp45asMZFiN/NAMCl0zfG0tC7nPbuRBXu2s
 6B2H1n5yTvUbn2WgLUtJdBLsHmokjeDjk+UR7G6JwDadXNBX5aXNs2FxL8YJbRebN5Z519n
 zhjNmUz2zNNkr1Ct9xEOKNcMTytjP7cZcK8pXM4X0MPhVZccNUkvO58KIcyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778179069; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dQn2lC111HIsJYeBhDzQtByq++XP+cE0Vqnv+qmfSTU=;
 b=g5/i/Si9vfLyxnT6piFV/TFNmcPu7MQGZYh5CrNqkp16Uw+T723MOVrnwiJq0RaoZENO2
 absO2GEhao5ZlCR5p/qVNrQ7M02pdtQCxyU7pJ6MyhCUVLk5rD2wKFonwPSBEGN50MpXOaD
 NvQGvkDkya1b4pAoZIskLzY2cx+Dxq+uy4EHXQ3evuUTfa4LJ3FXF5banunQN2pz226Ro+D
 vO642cG+f8EHc22oQavv88ZWyaFlW9KvQ+lLP2Da7zzAVNIJjRn9rS3Z+SSvtAVCyNw0ZKv
 usBiCxoRY7owhdGx0twc37GhIEAcHjCb9G06xWn3o/4hGQyNxMKU6E9cPlWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 13DBA43397
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 18:37:46 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE8610E29D
	for <nouveau@lists.freedesktop.org>; Thu,  7 May 2026 18:50:28 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-2ba1e9d3687so7540595ad.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 07 May 2026 11:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778179828; x=1778784628;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQn2lC111HIsJYeBhDzQtByq++XP+cE0Vqnv+qmfSTU=;
        b=Jrd69SexTwLqCwVXgHbQ7BQTze7oqNAbkFx+Q+kenJWm2M8nJjx6BmPOS1gUGZ9P7S
         kM4fn/w0iGWWxkMzxjdiREDOKpHaK3i0aiAfReX7pk5+rx9A/YNCs9iIewD378Mz8Jhk
         Jlhp611dIShHExXF05xmMYOKMJa4ruOaKFv6pc37e47ohCIAWMaC6wvz2L31xXYtlez9
         osyk9q0RWkuTJAuQBrS+Gh2uVI4EZ2UyJx0L3AfnWVUn/mCbgg9aaXgJX8aLCvMYExW/
         ybzRvdMrGAR9R9ItuY/Uln0Ki1HPy3I0KbI29s0yARuxqvg3FD/K8jLXHpBtcoX786Ww
         5Wsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778179828; x=1778784628;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQn2lC111HIsJYeBhDzQtByq++XP+cE0Vqnv+qmfSTU=;
        b=ZsxZM75b10AG8QwDm2zKXbN4+B9okbXKezEZ1Yr0nO05fPXo/W87nAj9DSg6eEUlbt
         vd87AqYrYiP8a/CMYQzOU7Ki7CqaLmU+OICbrSqLfwE9MTLrZdII1Pw5h2jtvjJH9UQD
         70dnRIQbQiAT77De5sANyakgd/ekNygPoizq8Ygl1n+T0j+kwh0gec4asOJeqvMsc5PB
         ZvcWfuInbPE7zMRSR7WFoZ5sKdGD9jSbU71wlYnaaIY/i3RoQ9Dd5EQBF5B23dCiAyW2
         9iVKHU9IHCGVEfNqSLQSPPhS2kGP1xOmOy+jqVmKSQJgUOtwmxzXLFLYEaVr5qW3brrC
         Uezw==
X-Gm-Message-State: AOJu0Yz36caAf/1HRZefm9tqSo7OYG8f/GL3Qsl7bA0qiEImtbK+uAYA
	5Jc8bR538LkVnKEQQWHGvyN62BqL4UG0rVHm9B6vUCVMtfcthmGIics5
X-Gm-Gg: Acq92OEs7rRvOqvYFoyCRDT+2vpWjiyi0zsB1/iwwzkC7Su0IioxqA55nr1jAX+C4aR
	M3YaUqn75bf/iQbttgysAT4y08F79kS7sTNc19bLnwfviz2mq492iqdGfD04/7KwBt9O4HnWre5
	eaRUj3dmjNk0EwwguPKVwgzPTQnJbWGA3dDCpqqOvG5C4Hv2hLtdDwT4Z2/Lxyj3IXPqmdCvUfJ
	9iPQ3W+omqB4ThilyhVbSxCe7YllYl9hp0CdJBa99Rhw7OhT7+JjCqIELPm2EYLUlg+h6fNM27j
	WTcFugzaYLJvhCa9w/zEB3gqjgbA79OdzeI2/ASEoCr5MuGPoFedQZJu9u1JAhQfMlI1nsEQ5/7
	FKiBYX/90D7I27mBfWH3rKxw4qcjwhtB/uey26VfeLV6ovx09F2lmcXBArU2SxmRLhC+XLxYlkx
	MmzogKvNMWzDQxFARoVEccaViZD3rgd0pcwfcRkKEb24MzJUlbKJMcW9EkRV2EM9A=
X-Received: by 2002:a17:903:2bcb:b0:2ba:924b:3948 with SMTP id
 d9443c01a7336-2ba924b3b5bmr77979445ad.15.1778179828134;
        Thu, 07 May 2026 11:50:28 -0700 (PDT)
Received: from eric-wcnlab.tail151456.ts.net
 ([2001:288:7001:1099:1e70:8174:f80d:ff44])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2bae78709d1sm4272595ad.67.2026.05.07.11.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 11:50:27 -0700 (PDT)
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Gary Guo <gary@garyguo.net>,
	John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v3 0/2] gpu: nova,
 nova-core: rename drivers and directory to follow kebab-case
Date: Fri,  8 May 2026 02:49:24 +0800
Message-ID: <20260507185012.1527139-1-yphbchou0911@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 453D75EXVNY4IW7HHBFO7EMQ2VXD4N3Q
X-Message-ID-Hash: 453D75EXVNY4IW7HHBFO7EMQ2VXD4N3Q
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/453D75EXVNY4IW7HHBFO7EMQ2VXD4N3Q/>
Archived-At: 
 <https://lore.freedesktop.org/20260507185012.1527139-1-yphbchou0911@gmail.com/>
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

Changes in v3:
- Move drm::DriverInfo name/desc update from patch 1 to patch 2
  (Danilo Krummrich)
- Add kbuild composite object rule to nova/Makefile to produce
  nova-drm.ko (Danilo Krummrich)
- Add kbuild composite object rule to nova-core/Makefile to produce
  nova-core.ko (Danilo Krummrich)
- Fix debugfs directory name in nova_core.rs to "nova-core" to match
  module name
- Patch 2 has been reworked, no review tags carried over
- Link to v2:
  https://lore.kernel.org/r/20260316120820.2117081-1-yphbchou0911@gmail.com/

Changes in v2:
- Also fix nova-drm driver description from "Nvidia Graphics" to
  "NVIDIA Graphics and Compute" (John Hubbard)
- Rename drivers/gpu/drm/nova/ directory to drivers/gpu/drm/nova-drm/
  and nova.rs to nova_drm.rs to match the module name (Danilo Krummrich)
- Link to v1:
  https://lore.kernel.org/r/20260310062443.2763230-1-yphbchou0911@gmail.com/

Link: https://github.com/Rust-for-Linux/linux/issues/1228

Thanks,
Cheng-Yang

---

Cheng-Yang Chou (2):
  gpu: nova, nova-core: Rename to kebab-case
  gpu: nova-drm: Rename nova to nova-drm

 drivers/gpu/drm/nova/Kconfig       | 2 +-
 drivers/gpu/drm/nova/Makefile      | 3 ++-
 drivers/gpu/drm/nova/driver.rs     | 6 +++---
 drivers/gpu/drm/nova/nova.rs       | 2 +-
 drivers/gpu/nova-core/Kconfig      | 2 +-
 drivers/gpu/nova-core/Makefile     | 3 ++-
 drivers/gpu/nova-core/nova_core.rs | 4 ++--
 7 files changed, 12 insertions(+), 10 deletions(-)


base-commit: 37f748ed0c19e007e7c5677f5d605d6b93841792
-- 
2.48.1

