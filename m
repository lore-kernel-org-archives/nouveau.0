Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 822A1C43458
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 12:37:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 135C710E457;
	Sun, 12 Jul 2026 12:37:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="mg4nZIqx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7096940800;
	Sun, 12 Jul 2026 12:22:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783858942;
 b=Z69OVdKZ3ZPqAkdm85jbg7DeK+vBVTMjJGn70AnAKHY9Plom/PYXWn1qJOb+pPw6eQyRk
 XYDQTx1x1XfzHahTN+yXLeuWveGUOfLKBSWu0A5Vrs6lL/Xgj0xycpT3HAYTdbjK4EbdtPm
 kv+Y0pZAcBjF4k6LuoADPU/X2J1MkjhQE9LJAcpIaa+pNnUKlbcxp2qzl65YNP/wO0yMz5Y
 D6SFUA+0CYdqjNxW4SoeqFYIicTX9KrGZNqYkNwNt9retgoiBGrbvgVKPeKvta/9XORo0M4
 pLVzvWDXCoj1LhXjjgLyaaLwUr3Xqg4l665OSJM9UjDu1a5qrE5FvMrYm9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783858942; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wEMsU51i/WwRT9EUJxt87IiRt2e91AKiv08Nq7CHthI=;
 b=KrBoy4mVxff3HDaCT1suqG29A9n87Wbu5NoOexq512Ad5FgEZyWfbl+rg8g+aaY2JLsNX
 jVtzC6xtHdeRw6Htaup5Uu0avMnJNe3DOSakMUvGymCSUCUrvwXjanXrhmXJyOSUpw7GWtf
 49zdI8owKGK7Dr5KXHQKsQQrdL8yN0ZofEE5Zea78HhQAxE0q6JJ+nt7EBYpZNovnGZzlsO
 2xivBI2497XMcI4fx3srEPWTcuxjb7e6c3NINB5sCde6L891QhSCTx1SwLkvj4NpbsWrwCB
 of+1K+mS3Phm2aQhzHaW3y0+vk4yRFczjIiHX5nNq6ia8a2AHxMa/LudCOVQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CDB16400A8
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:22:19 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D12E10E450
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:37:28 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-493f4638f4aso22488585e9.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 12 Jul 2026 05:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859846; x=1784464646;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wEMsU51i/WwRT9EUJxt87IiRt2e91AKiv08Nq7CHthI=;
        b=mg4nZIqxL6/PD87YTw4n2OuHKkw1M3SJsPiV+HnnrALZb9NyNVs/G9FFI+fwCYzM/O
         26xxG6BUUl4WWsr8D6iHZXNV4cPqTUelWFGwLkZKLCpvdxCFIalx2eNHm3Tuf8BuJwVD
         pLC1fJVGOmVGdJ3UcVxwxQz5sVqDH0pK3HF025LGTdM7sGJJ7GXsi2V9ArhYYRcH5TX7
         KuskemQWxhxjzdcQDJdrP7DvGS/SjRZPPlfT/eJPUv9daV87MkZKWTMm8ou3vEoAqFQC
         QeIEo7+7fzvyIdaRi14dY5nY2EyksHn6QfoddYvyxW1yrs4aPEda71h/oFgM3SYEr5hB
         SB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859846; x=1784464646;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wEMsU51i/WwRT9EUJxt87IiRt2e91AKiv08Nq7CHthI=;
        b=iUIGF0r2W0t61XcPLetdqtTEO66kewU7DzFqpLWKPgCCt4gVmYm3WP4doN0SvQp7d+
         S6HfURxF0sBB889Mdxn+5ApGyteB2NTHOI/rl4fDHxmeq/rNAQXq5rWeFIkSreQ2qfT/
         HKqudrghHpjD8D1kBIS55mOAmV/kM4Y12o63wISA1CKY+jw7wTl5HdwIofoHjWTLkdS9
         eti4QVtTg8zu4yvxxGltoja4OohhTArWGE4de0aX/kGZdL7biFbQBJ/02+9U/uQyp1Gb
         40Cfp9Vvb0E17Se7j5n/bCl9bxPwvp2sGcurT01swhN+WYiwrKdoLLSfLawOMfq4gM/z
         R2BA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rph3YYhKi2dU4ghMstLSaCkk1Ht7QFjId/UapHNHDV7OabI2Vexufekmpt0uEZ7VqwwSpSM24Wx@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxIEqkcQjatr3rDVGD5tY4TvUbTQVqXxDt3zenUaZQ7rzmZcKZj
	IMn/iSj76POtHdGUwIcONNzJLdc74YDukykYiJqzg8iQTcWoUMgq6iBf
X-Gm-Gg: AfdE7clW/U9zsmHdwqU4IjtnUT5x4IM+fWHyUTAo1s1Pxpgwz9mSarbLRDmMrfJJBpa
	GmKJNDB922P57CT1Fd5kAd1xR1OUJ+sNVwuZbwi2HS+9l+yfasQRHHhspG53pQk0uPqt/iYuFJN
	f6IM7ol+rmN1gAxsTHsGKfgeurj6gUGSaD1jesguPf3AaS2hZypJyGzHtB/upUae3uaeZ06bvFU
	w+u0aycV8/umlMc6Ajki7f1wWxwsdrBVSDoDwpmTTsYZ90NiTJ5AqlrdBak+FHJGuaFNx/lm03h
	B+q3fi1KLhd7Dcq2HYH1CF/dOE/4rbUDCKWacQ565tgJTgCGLELqfG/Rvuq7ogT1f0s1x4g8HCw
	A0Vncfrh9jm05jag/XkfOspJ3ZhVAAEKsedzqGmVmpGXfdkzZX/0Mqsg0zFj2Aj9fGP3nbOr2Qr
	AKWqgGefs0sBhvX8M=
X-Received: by 2002:a05:600c:705:b0:493:9661:f55d with SMTP id
 5b1f17b1804b1-493f8826bf7mr39689255e9.30.1783859846182;
        Sun, 12 Jul 2026 05:37:26 -0700 (PDT)
Received: from fra-x8664 ([2a01:e11:8000:43b0:96d6:566b:35c:7b8c])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3c42sm280280485e9.1.2026.07.12.05.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:37:25 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/4] drm/nouveau: fix list cursor use after loop in the clk
 pstate paths
Date: Sun, 12 Jul 2026 14:36:12 +0200
Message-ID: <20260712123616.1180830-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L6G427DROIRWSRKD27TFA72EIBZWRS6F
X-Message-ID-Hash: L6G427DROIRWSRKD27TFA72EIBZWRS6F
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L6G427DROIRWSRKD27TFA72EIBZWRS6F/>
Archived-At: 
 <https://lore.freedesktop.org/20260712123616.1180830-1-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series deals with the three places in the nouveau clk pstate code
where the list_for_each_entry() cursor is used after the loop, plus one
unrelated fix.  They are exactly the three sites Dan Carpenter listed in
2022; his patch for the first one was never applied and the bug is still
present in drm-misc-next.

Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/

Only patch 1 fixes a bug that can actually be triggered:
nvkm_clk_ustate_update() takes an arbitrary pstate id from the user and
never checks that a matching entry exists, so if it does not the cursor
ends up pointing at the list head and the code reads past it.  It carries
a Fixes: tag and the credit for spotting it goes to Dan.

Patches 2 and 3 fix the same pattern in nvkm_pstate_prog() and
nvkm_control_mthd_pstate_attr(), but neither is triggerable as the code
stands: the callers of nvkm_pstate_prog() clamp the index against
clk->state_nr first, and nvkm_control_mthd_pstate_attr() already rejects
args->v0.state >= clk->state_nr before the loop.  Both are hardening, not
bug fixes, and they carry no Fixes: tag on purpose.  The point is to stop
the two functions from being correct only by virtue of what their callers
do.

Patch 4 is unrelated and is a real bug, though a modest one:
nvkm_cstate_prog() overwrites the reclock status in 'ret' with the status
of the voltage/fan restore calls it makes afterwards.  The only consumer of
the return value is an error message in nvkm_pstate_work(), so the
observable effect is that a failing reclock is never reported in dmesg.

Compile-tested only.  All the affected paths are reachable only by root,
through the 'pstate' debugfs file, so I could not exercise them in any
other way.

v2: v1 (2 patches) was sent on 2026-07-11 with a mail client that mangled
the patch text, so it did not apply; it is resent here with git send-email.
This version also adds the two remaining sites from Dan's list, and the
Fixes: tags to the two real fixes.

Link to v1:
https://lore.kernel.org/nouveau/CAHwn+vnw=DD=j7umFVdcr8-F6yUz=iM+3yfA+HcHKXJwpNrHRA@mail.gmail.com/

Francesco Magazzu (4):
  drm/nouveau/clk: fix list cursor use after loop in
    nvkm_clk_ustate_update
  drm/nouveau/clk: don't use the pstate cursor after the loop
  drm/nouveau/device: don't use the pstate cursor after the loop
  drm/nouveau/clk: don't clobber reclock status when restoring volt/fan

 .../gpu/drm/nouveau/nvkm/engine/device/ctrl.c |  8 ++++-
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 32 +++++++++++++------
 2 files changed, 29 insertions(+), 11 deletions(-)


base-commit: a284476db2653ae893f46cbea408eb412db54eb0
-- 
2.55.0

