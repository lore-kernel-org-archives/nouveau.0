Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B29C88E72
	for <nouveau@archiver.kernel.org>; Mon, 14 Sep 2026 14:07:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F274E10EEE4;
	Mon, 14 Sep 2026 14:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nH9hQWTU";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 341F048054;
	Mon, 14 Sep 2026 13:50:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789393801;
 b=bFkx8Lwu7XtNFX4rx8p8ySGOPOpCKNYMVUfkv8Qzm0n2LC2gWL/nSJoX/q5N7um74D+MN
 2MbSdPI8NBdWlYMXqCwieg6gWFFnx+0XjWerqvCErDsRV2/1mwp5RCnAL/uCRC634iUoRFb
 cJpwdUc/EO9xv/QEyZrj+9OBC9ohOQbGOkxnx692uNdnofog1QcVSB2teCI30Drsx7TRjVE
 507aO+A3TUZhxOZ1FEOYcDmHZlTZlOeVRA341HzARZ4snv0sPQhV5oT6wBwPKzJRnqDhvBD
 VhYsgLKotInGKucBsTBV4RhjnftilxHGGvt1pMqe/R/GKdc6yx5DZBWsIb4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789393801; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tvQTHWXId30lHl89cQONJGQBaXvDgk+KicdEmbWVsGQ=;
 b=Yo1x6cHehgqdJ/L1q/dmkrtB9UN9O4AjQO5DSQE8BUu3nc4+7lADS2QcbIs1CAnPzMzN6
 WH95ljnqEMu7STHJj8IgT2uc7sc6oN/lQeibuBrXHIHF4PWTbrrpvpV6pA3Ap8tz7Rwf9N0
 BL5eINFt80X8YKIIu54BKb0Xkgawr3Oy+Key6Ioss3ePSQV8CJMDaz6/0YnfEYiUVi01g79
 ov0cFAq5YV1JcNoACvCZ5UWLlRBA8Er19Ir0YkHDoXuu7oLGXO9S4ypzmInktsWDGe8LU06
 H5KLrMEG84v1V/tDCv/GzJkFx1twjnBNUXns2S08woKZMrDC9S7GiM3eii+A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C715546F1F
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 19:55:49 +0000 (UTC)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com
 [74.125.229.204])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0C3C10E93F
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 20:13:18 +0000 (UTC)
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f1e419so476390e87.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 13 Sep 2026 13:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330397; x=1789935197;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tvQTHWXId30lHl89cQONJGQBaXvDgk+KicdEmbWVsGQ=;
        b=nH9hQWTU3pD/h0ZmLPu9s9V3lZnqzXulVyto88qcDb/NTy97RI87HQkXBWDQ94IdYV
         4IVEjB7w8knMLebM16z4l/gD3WkgR4hgWI50AZU4qrpJSsxQNhZjufiQK3ow8HhOvlJq
         o5DFh6Ybcze+JjS+BMB9qrDPwj79SqDQ7lERoBFXUOFlDXXg0HRYLD5OyAhkPy1mDZ8j
         ksArBaCrY0mafAgnCbCMA/nnBl2jH+fpDfJ4sT9pyczPYIqwzYeSr36+xy4RI54Xp6if
         1gcFHgNISYtrl2SBckk6aJgQARLHSnjqtXhpHL2DmQYm2h+iT7BnY48wOU/4OrgfCmhz
         TKbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330397; x=1789935197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tvQTHWXId30lHl89cQONJGQBaXvDgk+KicdEmbWVsGQ=;
        b=HO2M60g6GKlGDAAn8Oh3GtJiTSPmO8zcIonAJRvrNKq5Kmn4l7h461hDipXpg7YMOu
         OrqYienJclvRtcuMMbsNzyY3090jviBHIe0eQGvo+Yks0FXOCqLj+PjsdasSGc55/oyf
         VxiKP5ai8231k9q9lmGR9H+V+CmauZoZYpIsweWdGsBty469IoHRqmPlT8twLHEfs/SS
         Rx8Liq7SDJa3DJOoqvHsNkRIYANrylZLjMgjplnOGHJmhcPNrfWSog+JUjQ/eIYvwcA+
         eQ/uFQqLoo003Ey0dFWLyE3z7CQ8uABvuKJ4llu5tLtUhsQqpuXkFz6on6zZuwC3KmmB
         46Iw==
X-Gm-Message-State: AFuF++nTI/ZVdiSrevXFNMVMFKBcrumdCf7CBmmgDEQwZO9Dztp/ToLe
	G4YvBQ5MJq+6lSL4pOUwf6kVrZjz/nZiok0nLdykUpBXyznAzT9NGG0D
X-Gm-Gg: AYBFou1uMb2ek1kZr39RQVJc7lg4QTwEK0apEm0L0dl47j5xKD9WnL2DhmCQ4YR8j7o
	XLOvQnYITkSIZQmsyWh250tGemF9s/l4jOBVOC4GgnWg6hMdznkoAyp5pajUYf5sCub/H3TYYDS
	aLcUYWMpx0LqN2HzuuXeo/5aRjFwAO4c+F8rd6BbHcInrlf52uxspdtX/xx8HqEGat5rIzwAMgd
	aFXAlpEMTd2VVsuanQCBgv91QPDe/hh5HOBGIrJypjBhKI4tZdZT+KxVuUnEgtSZ63824r6q6D3
	JsP/+8wnvxaHZSKpe1lFBCZCrgE4ZbtcxTm6mJUcd+3D/lMyPmnejRanQJqzIAIYPpFO92E2y9E
	E5itQFW5Jeeasnf2X/0JLmNK/1EZ4rqtdKbwiCH9jxtkGHbPX71arq1Pc8LNsEejHQImYUmW525
	upTEeu7mdFSoTuvfuUBBA4lEXjazzjdMVPGol/IzEJZ1nLdnUs1fiSbpxBstJoTFvKJ/uXh1oZZ
	T0xCyVSHwL3D1WYBP4iW7bjEzQ+pD3SLGFC5H+QHE+r
X-Received: by 2002:a05:6512:159b:b0:5b7:f0b4:de57 with SMTP id
 2adb3069b0e04-5b8abae311amr551289e87.6.1789330396785;
        Sun, 13 Sep 2026 13:13:16 -0700 (PDT)
Received: from tallipc.shacknet.nu (91-157-240-22.elisa-laajakaista.fi.
 [91.157.240.22])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8a03a85cesm2003345e87.1.2026.09.13.13.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:16 -0700 (PDT)
From: Risto Pajula <or.pajula@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] drm/nouveau/fifo: use global nonstall event on legacy
 FIFO
Date: Sun, 13 Sep 2026 23:12:25 +0300
Message-ID: <20260913201225.5975-3-or.pajula@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: or.pajula@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: DX3TK6JSMJI2R6KNRWBLTJGK2H23OA4M
X-Message-ID-Hash: DX3TK6JSMJI2R6KNRWBLTJGK2H23OA4M
X-Mailman-Approved-At: Mon, 14 Sep 2026 13:49:57 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Risto Pajula <or.pajula@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DX3TK6JSMJI2R6KNRWBLTJGK2H23OA4M/>
Archived-At: 
 <https://lore.freedesktop.org/20260913201225.5975-3-or.pajula@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The per-runlist nonstall interrupt handling change made channel
nonstall event registration use the runlist ID instead of the global
event index 0.

Legacy FIFO implementations do not provide a nonstall constructor.
They have a single global nonstall event, and their interrupt handlers
signal event index 0. Registering channel events using runl->id can
therefore leave fence completion waiting for an event that is never
signalled.

Use the runlist ID when per-runlist nonstall interrupts have been
constructed, and keep using event index 0 for legacy FIFO
implementations.

Fixes: 55e1a5996085 ("drm/nouveau/fifo/ga100-: add per-runlist nonstall intr handling")
Assisted-by: LLM
Signed-off-by: Risto Pajula <or.pajula@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index d6a87cec2..b96e84192 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -52,7 +52,8 @@ nvkm_uchan_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 
 	switch (args->v0.type) {
 	case NVIF_CHAN_EVENT_V0_NON_STALL_INTR:
-		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event, runl->id,
+		return nvkm_uevent_add(uevent, &runl->fifo->nonstall.event,
+				runl->fifo->func->nonstall_ctor ? runl->id : 0,
 				       NVKM_FIFO_NONSTALL_EVENT, NULL);
 	case NVIF_CHAN_EVENT_V0_KILLED:
 		return nvkm_uevent_add(uevent, &runl->chid->event, chan->id,
-- 
2.47.3

