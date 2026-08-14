Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE36C5DF6D
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 23:58:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F2ADF10F6A2;
	Fri, 14 Aug 2026 23:58:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HwyZjrW9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1BBFF47803;
	Fri, 14 Aug 2026 23:42:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786750926;
 b=UAri4ZecWyJtIh8jq9Fuco9xHHVKS7DfiNnVbhF/XcXgfU9LiC7fNed1xh9AQOgu6JHK3
 essCGhWB2nXp1rBeEfvmmJAQjgiozCDuYN3xOhObB80g3kWBERX7OhTE8gACrIiIdrcQsZb
 V2hSfdkeo4ABDtB5oDDhQCte4uj7g3/ItN8BcMqrfrr5AHCoTSj7HewxC+aIeaLmvPodG7f
 RnthzD0EGgHcLuUIGSpDN7Xby5O1EWBa5/6IwaYlGDlF8BMuhJpFyLwr/9a6jJ8itWm9oaY
 Lz1l7Ew9l1lB3z/EBWzwP2lyGiOvDJAryC5+HI2d077obLVawHOd6aT+EQxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786750926; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=12i2qEk5t59OwBGwHt0k4psCek1hWBpIK5LtDGs5tyQ=;
 b=purE5JZh33g1ovXsyO4Iac+yEvjNlJt5xuy6SiiIGUvIRCmF0BzrkQWUyvgzZ5BHy/mji
 FOsfuO62fTGiv8JlPdSh30vZcvUx5vNc8vA82u+I6t+KbwZDa5esnykI84/RynmzEHOPXKP
 J+bJeZJQ/LXXryZGMArOI0QySZynZ+RLZQuRaPPv8RkiDx5qElLucsa/BVaKKfxf10R5ZAE
 48/hpg6kapldLP5s+oRWcnnZw/9tNE24+G9x16/Bs9AuWrkQeH/50S2tDWeiJHJL/bwkacV
 Mz7Le3h0JqgsYUIR7oX8INVv+3ARZlT1FpQoZhZGNvuqMHg6uG787w5R6yGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 312634779C
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:42:04 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C86F210E10F
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 23:58:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-495590dde14so20848635e9.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 16:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786751905; x=1787356705;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=12i2qEk5t59OwBGwHt0k4psCek1hWBpIK5LtDGs5tyQ=;
        b=HwyZjrW9JbDqrtdNCa3vnoUkyvOU60w1Gwf+fmHFmpfOPIjh6YAjH7qeWtAG/vXATT
         VP1wEPfIIXz1FgDAaJmTKHZrWcwDERBFOJ0Zsgun+i/b1icaTsk0H85at4BStBqA4lgk
         O92gNtwPSQbdSBDnnaU9JwgSOxNx1DH1utUNhhwnfI9lbdfS9e597PdZjD/1IH9HmjG9
         mykdGYh0P11Z6pCJ6DgqraDj5b8I3SDmpYG5YqItHs0HIzupx6wbxfp0aooPdJ7v7ffG
         aPWZ556UMQKLlmVYD+vErN2PggV2YzcwASAg6zFTIsb2Nwsf1Rg5lu6Vpvtl/P23/FaX
         Km0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786751905; x=1787356705;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=12i2qEk5t59OwBGwHt0k4psCek1hWBpIK5LtDGs5tyQ=;
        b=nxqTO9GUjkfGaBEgDWITf+kTBL9nq1xKc2bNhAe1A5PRlZL/9G692qxM774EFEFO2m
         MRd6FbVStxGH7krGFm614lmq2zmQG8sOaQ13FxgwVA9jDy/ztxnOVFxNZ8NZqzAb31F6
         crxqicraQyyk9b/SfF48mBMfDNIhkW15OY95cWb0n4h6R/uiay98AcPOiKdJjMuNvGWp
         Dm+TZxfMMefv3kSbXzi0ZykApWL/nUkQsnz4UTX/0E03zRTmoUaAHtUyfVJ3QK2mR3PT
         n1DA+YhgDPgZ7mnyr03W3TAW/XlVGcswbEvpURS296u8fhqbbKodzrlbWvmuwW17Gi3w
         jP5w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0y9L6zHZulreuOSbv7UG7cXaFW5YPiG9Z6zslCJA4joshgiRYO4TCDlnwlbiKw/s/35dfUnFC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkTd44JcuiJ+RM3M98B4pUq7JycHQZeF0J16FlZmzSe30Y5fR2
	0RQ0QUoHVAmAu9NDAhJxPpfWfmVzoZPz7JBAwzWxCpqoqC7SRa4cmzLW
X-Gm-Gg: AR+sD10Ax534esUsPVViJ57VolhwONV6CED8LpvWv/1KZvWFaX88MKvb1yby64XUiAS
	Jy+bbk4+F3DUybY6Lw8ehabWjiRsdqunl8v9Zzv4X6lK3p1ZEsiOXPguybQBBIv0ismweUHe7Mz
	mfut/nc91azGtwJwA9SOvxMoaJZgN6O9vueejRwuYgwywRgYX/97O9VWHMEN+qaMRs+JLskZOHC
	556YahTLZM9kFBiK6GJnAVjIxL2WGC8E4ynvIoWGMwyMbspjFHbJxUODmAUhMWFtbQmAgwiIeOU
	nRYmsE7nS5GZLATrWTxTlU3J/gVCbKs+kgdHicXSKFBPyr2TnN/GUFcAYaWX4TTh0JjJtrUhjF6
	NPeXu1Ggno/MmdtsBH4Fj3F6wtASuAZQUwom6G/Y2vqqAJzmPJrVNe/hHllTTfqU0fAzgyc3Sy4
	d99lS6IcKspcN+KDa5ixCY3sMYQY/NOjlRdocLZ69Z9S40PSUgcIuSXp3cJEe+0gYcCgc=
X-Received: by 2002:a05:600c:1c07:b0:495:4d5c:903e with SMTP id
 5b1f17b1804b1-49987950d78mr124633925e9.7.1786751904971;
        Fri, 14 Aug 2026 16:58:24 -0700 (PDT)
Received: from fedora ([5.31.134.170])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899753ccsm77751245e9.0.2026.08.14.16.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 16:58:24 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/7] nouveau: assorted display fixes (GB20x,
 r570 DP_CONFIG_STREAM, HF-EEODB EDIDs)
Date: Sat, 15 Aug 2026 03:56:58 +0400
Message-ID: <20260814235705.59132-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D73QPASU3CW6GGYPQVMADZWPPDV2TF2R
X-Message-ID-Hash: D73QPASU3CW6GGYPQVMADZWPPDV2TF2R
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D73QPASU3CW6GGYPQVMADZWPPDV2TF2R/>
Archived-At: 
 <https://lore.freedesktop.org/20260814235705.59132-1-mohamedahmedegypt2001@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Several fixes for GSP-driven displays consisting of four independent
groups. These were created as part of ongoing HDMI 2.1 and display
handling clean-up work, so some of them are not issues now (e.g., the
2.147GHz pixel clock cap) but fixing them is required to get advanced
features such as FRL, DSC, VRR, etc working properly.

Patches 1-3 fix HDMI infoframes on GB20x. Blackwell removed the legacy
SF vendor-infoframe and GCP packet registers, so the MMIO writes land on
dead or moved offsets. Patch 1 adds a vendor infoframe writer for the new
layout, patch 2 switches GB20x over to it, and patch 3 corrects the GCP
AVMute offsets.

Patch 4 fixes DP modesets on r570 firmware. r570 shrank
NV0073_CTRL_CMD_DP_CONFIG_STREAM_PARAMS, so every call built against the
r535 struct is sent with a wrong paramsSize. Route the .sst/.vcpi paths
through per-version RM API hooks built against each firmware's struct.

Patch 5 fixes vblank interrupts on GB20x. The vblank enable moved to a
second top level FE interrupt enable and fires on a separate low-latency
vector that also needs a retrigger write. Without both, heads don't
report vblanks.

Patch 6 fixes pixel clocks above 2.147GHz on GB20x.
HEAD_SET_PIXEL_CLOCK_FREQUENCY carries 31 bits of Hz, and the CA7D class
adds FREQUENCY_HI for the upper bits. Program it instead of truncating
the clock.

Patch 7 converts nouveau's EDID handling to struct drm_edid, reading
through drm_edid_read_custom() on the GSP path. HDMI 2.1 sinks that
declare their real extension-block count through the EEODB no longer have
their EDIDs truncated to the base block's count.

Mohamed Ahmed (7):
  nouveau/disp: add GB20x HDMI vendor infoframe writer
  nouveau/gsp: fix HDMI vendor infoframes on GB20x
  nouveau/gsp: fix HDMI GCP AVMute register offsets on GB20x
  nouveau/gsp: use per-version DP_CONFIG_STREAM params on r570 firmware
  nouveau/gsp: fix vblank interrupts on GB20x
  nouveau/dispnv50: program pixel clocks above 2.147GHz on GB20x
  nouveau: honor HF-EEODB EDIDs by converting to struct drm_edid

 drivers/gpu/drm/nouveau/dispnv50/disp.c       |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/headca7d.c   |  21 ++-
 .../drm/nouveau/include/nvhw/class/clca7d.h   |   4 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  95 ++++++++++---
 drivers/gpu/drm/nouveau/nouveau_connector.h   |   7 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/Kbuild   |   1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/gb202.c  |  62 ++++++++
 .../gpu/drm/nouveau/nvkm/engine/disp/ior.h    |   2 +
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 132 +++++++++++++++++-
 .../nouveau/nvkm/subdev/gsp/rm/r570/disp.c    |  64 +++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c |   8 ++
 .../nvkm/subdev/gsp/rm/r570/nvrm/disp.h       |   2 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |   5 +
 13 files changed, 371 insertions(+), 34 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/gb202.c

-- 
2.55.0

