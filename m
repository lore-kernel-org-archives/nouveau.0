Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E20BA606A31A
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PA4Zop6l
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B54CF112A90;
	Sat, 31 Oct 2026 02:09:57 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 96FF048C3B;
	Sat, 31 Oct 2026 01:50:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411443;
 b=IwJ7ASgTkwxomdG9gvFb8blm7PQLEcRBsJN7VZx2feJf777KqQbin3THbO5TNAoWNQ1Ky
 sMYzPQ34Gn/jzhEJLb132Z+/FpcKfcefHt+5YEYwuq4PPUtzi9dWEM8w+eXi3xrgrtxtK8L
 xQxsDY4qvJ6aIGJNmbhVLrfd6LQHZp1jHYdoYQstC21rVtC3J92itZug2vdo17eeVjCFqp+
 RCsiKiZesC0v2b/qvkMXpUeyX4MfZK+TTJIz4J8O0VLnktaqLYgyairIZ2Cxj0yfK9jhgqD
 Ju4qhiYts7+BOGEZcJ/psoUdS09c3dOtOvn3x8YMGoEFmVPfFe4tHnhCrB5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411443; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
 b=lcomd4LfJpCUeHFtvBEzxgzixSvLKVgRvrU7hVSMAIS1Mrardf1w5Otx5oIDu6o+Ry5C2
 TryT1hCBl+IqpRE33X2LfAnoBCpbXkPaxai6PS6eCVv38HOwgx02yMj79efHWa+GpkCdM6R
 LBntE5vPL0JVLB1hLu0tzZOiIFCRprOYkWmTz1aicnf7iGlp+9s6mh1XhlFtvJkNLbrKH9V
 SaGIjoauUKYJasVQyC8shL85rX2oa6Oqb5w/9027e3NSxMLHwE2Qzk/GniCRo5Vtk4vfGiD
 H7Xiu2oqslS4wrU78mgiib+pT424u15uqPa8/YRwgQmFIKrlVkl7X+P26bxQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0582146CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 09:59:26 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A039B112195
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 10:18:30 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-c4677aad67bso220549866b.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 29 Oct 2026 03:18:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793269109; x=1793873909;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
        b=PA4Zop6lc4Y0kYBfPSbeWAY3q95w72m3C0ddOquLE218biaECm6ssDCry5uvj1Wnba
         yS5dTMXLDkptNTZd20npvoSjM7DcyqZqsrzPHopEOyQ732UKe5Rni1TDrH4UuxSW3be3
         RALyBeWq/vhoilt8lvIeA5zJOxfI6oEXlM+bh1aSwx0URrQgeW9U89uNhtkp4sO7Gujn
         jv8RMIMcpyxNHNKpXM/EK/pGF65RH0rS1+1bjBtYFZ+wjsHe/swchqW0AwGTjFN93V1N
         1NsWYxS1/QMytHXUHSeOOhX8PJtfur6JlqBZQyfkQAGcfhiKQeYyxgKjrsohxXe7DUbH
         GEwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793269109; x=1793873909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hPXRAqx03CWF4KTxZfjeshWKEYqjwFf9UJcm90FGUJk=;
        b=H9bNHGbv5LdDerwA8MrhXp0waETB2jC8WjFZuHdwek+Tbm0aVdlZLmmhsoRMhWC/ZX
         UYVMA2gMmifMZwmufZruBFkUoAUHmjf8U1KPdPAWehJDDm/l9OsHVUgUhxhp56CEMHxH
         E33JKnlS2VLqxFNVeFfRTvdUOLL+c4kmTGzi1ZWSnzZu+lQj9U0AbYo709sJ9wr7XI0R
         BdRx/ZnL+cwuEAt5UDap5s2ZBQrZouUOF2YgT+7EpYQ9ACA/p2mtiZvZ8oMNYzrHFNxD
         drKeMntP7ORnzfoRcsSQbkzwgabVM8bxMGzPJ48jpbNPJvZE46ew7xtB0F8OHhr1ROaB
         3ryQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBwry7gThlPi6+XucskxizLtSk2eZav9KmMLuly/QgeCmb5/7OdNE9KsRN8n/Yxv3cSfrA+bLU1D@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIokEdyjVvilZQKkW2Vadym4Tf6+yqXFBVF7N0CbAU9jDSKDiKS
	jGT3rfECsxuHn2tnKBE3EEpTbMWc4xlRKjUBJUPBnMuRcJskSG2D0nIB
X-Gm-Gg: AYBFou0tWRYYIa2xVIX7PXkAEmbgckVaIpjFpDTyOGrqPjALJ+9XTtcv+1aWxt4Xi/U
	ArNGkJPag9LABfhtIUw8BONGmHyEC+AmrViecQZAJ4MesbWMWeQL+ssRHh99oBTvBtJuB7Qt4qc
	D2lyFzcM6X42skoIQ2wPcbr85tCTEBgpB27upqX8f7k0B80RH7pGwvx2OS/0vNwffUrOrrHvPu1
	+1Ki8+iCFau23LzeURVCtAdZglkHZ7tc4xsLHiUXjew0kxk0UW04gBeJyNJFah3qfR2/U0UGJY2
	3yk7uIyCZB3i0zwSEDMRGsfkaxh8B9Sbfo8oQh9YE2Ui+8bYiy05rwaEEXOwpMrTXI19N8G7gwK
	kpAbkB+4I9C768iXVBDStuTpP6V2IuVUaYJtuAjMOE8LQ6OG1L6huu2lUFQk7kHS2tga28EoW8j
	+nteKtpsLwdPq7H2w6j368AVeUEVYvh8ws12toLkU7wyXSshIvm+foDvWFpmSjQixGZ+dsAPnLE
	QiFd+PCD4vHpvN61t64uo2k04veFCaqHrfbPHI8O4bV8SaDqgYTIMT79pgVCVJhY0dgTIhzIKRJ
	zdwMZpdg+fySV4ZZdXod3znXLwtx8oAYqDfFyO1w929RGYeaQeNZcfi+H4WYOmk=
X-Received: by 2002:a17:906:730e:b0:c40:231:6eab with SMTP id
 a640c23a62f3a-c49bdf393b4mr415116466b.16.1793269108982;
        Thu, 29 Oct 2026 03:18:28 -0700 (PDT)
Received: from localhost.localdomain ([46.205.195.0])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd66c6dbsm712145966b.59.2026.10.29.03.18.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 03:18:28 -0700 (PDT)
From: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/dp: Always use enhanced framing for DPCD r1.2+
Date: Thu, 29 Oct 2026 11:18:21 +0100
Message-ID: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dmitrymalovanyy@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: OFNQCQRQRWZQ7WWJGKIAG45MOQ3SBNM5
X-Message-ID-Hash: OFNQCQRQRWZQ7WWJGKIAG45MOQ3SBNM5
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:50:41 +0000
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OFNQCQRQRWZQ7WWJGKIAG45MOQ3SBNM5/>
Archived-At: 
 <https://lore.freedesktop.org/20261029101826.72773-1-dmitrymalovanyy@gmail.com/>
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

The Xiaomi Monitor A24i clears DP_ENHANCED_FRAME_CAP in its extended
receiver caps, and through a USB4 dock it does not sync without
enhanced framing. v1 kept the bit from the base caps. As Jani pointed
out, the spec says to enable enhanced framing for DPCD r1.2+ without
looking at the bit, so v2 does that in drm_dp_enhanced_frame_cap() and
converts the remaining direct users of DP_ENHANCED_FRAME_CAP.

amdgpu DC, mediatek and hibmc already enable enhanced framing always,
without checking the bit.

drm_dp_get_phy_test_pattern() still uses DP_ENHANCED_FRAME_CAP, but
there it is a bit in DP_TEST_LANE_COUNT, so it is left alone.

analogix_dp has its own copy of the check (DPCD_ENHANCED_FRAME_CAP()),
I left it out, can do it as a follow up.

Patch 1 is tested on i915 with the affected monitor, the rest is
compile tested only.

For nouveau I converted both dispnv50 and nvkm in one patch, so the
watermark calculation and the enable stay in sync. Happy to change it
if you prefer another way.

v2:
- Do it in drm_dp_enhanced_frame_cap() instead of patching the
  extended caps (Jani)
- Convert cdns-mhdp8546, it6505, gma500 and nouveau
- Commit message: the sink only fails through the dock, directly
  connected it works without enhanced framing

v1: https://lore.kernel.org/all/20261028162941.62762-1-dmitrymalovanyy@gmail.com/

Dmytro Malovanyi (5):
  drm/dp: Always use enhanced framing for DPCD r1.2+
  drm/bridge: cdns-mhdp8546: Use drm_dp_enhanced_frame_cap()
  drm/bridge: it6505: Use drm_dp_enhanced_frame_cap()
  drm/gma500: Use drm_dp_enhanced_frame_cap()
  drm/nouveau: Use enhanced framing for DPCD r1.2+

 drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c   |  2 +-
 drivers/gpu/drm/bridge/ite-it6505.c                   |  2 +-
 drivers/gpu/drm/gma500/cdv_intel_dp.c                 |  8 ++------
 drivers/gpu/drm/nouveau/dispnv50/disp.c               |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c         |  2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.h         | 11 +++++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c      |  2 +-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c    |  2 +-
 include/drm/display/drm_dp_helper.h                   |  4 ++++
 9 files changed, 23 insertions(+), 12 deletions(-)


base-commit: feaa32dc98090b2f45f7b6f179711a6640169c1a
-- 
2.50.1 (Apple Git-155)

