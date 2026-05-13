Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FDBCD4F3D
	for <nouveau@archiver.kernel.org>; Wed, 13 May 2026 17:50:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C8B610EFD2;
	Wed, 13 May 2026 17:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qd5QElXj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 271A941C75;
	Wed, 13 May 2026 17:37:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778693844;
 b=ZQbRXOZhRA6SDk3ZQkf+f/SN0v1deYPaE4+anoQLS071ybhxfzqd4xpqEwduf6WOJ5f5O
 lmUmqwJ3rusczScnd4S9Q0IHr+KVdMSFWviFOWjxt6FOOXCCUlBLgUwgwp2HDOiHUKptISt
 fK87ylILk03lZPk7TfIrmLZQfRaLSvD4UrG6IFdtFCLtp9UrZqk4MhwL4PacjibXH6rpD1/
 oWLvnmuFD54ulRoU23IPDhHadcO1zO9lfljKrBRAgw1H/w+keAMm8SRGvd4utQqYTE/FWCV
 FKNFqBdTsM73xEH8TL4OGkVsUSlzQQXhCXymg0Un52Sd0e047mFtBG/PaJwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778693844; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=C3sIh5375gOTbKLogW0nu2FPAiE6cFaR5WSblCu7vM0=;
 b=LY7S52WnYlDaWLUhJ3TVH6ruCoLRzdq+Is+5GFGbkT1IQx/dF6KfUcK8QCGsv+I+MPehI
 mMiFDcTA/gKFphffYuesg8wwv1qmJDm8VTAvJ/Sjyw24dp4e7n4Hr2OSl2SdYNHYT3TsgHW
 zM4fbn46vS9pthWsi9j/c35GcYCEa/QeNNyAgECIaZ8yS+rFX1MN/JYnuNJ0KDFHqWvvsby
 G3cWk7beByH3yzYkq+R9a7t9bUvP8Ue7nYEAHis+Pq7R35eLo9b3swBWci6ZvTskPMpGzk6
 GB/HEMhAYNT9sqv0n5orDzJZPD+VJqWY3LEErAz3a2GVqrw9nFGO+/K5sYtQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CF7AB40564
	for <nouveau@lists.freedesktop.org>; Wed, 13 May 2026 17:37:22 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A0E5A10EFD2
	for <nouveau@lists.freedesktop.org>; Wed, 13 May 2026 17:50:18 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-48e72b02bf6so5076515e9.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 13 May 2026 10:50:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778694617; x=1779299417;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C3sIh5375gOTbKLogW0nu2FPAiE6cFaR5WSblCu7vM0=;
        b=qd5QElXjDhUxP7b7ClvHWAkc6Oq1NZYaerFp/qhu9yEbhX6ilH/BVGpJXJ8O+76XPo
         XojbzmpkKN3L3xik8csu7ceDQzHMz7AiDVhqocwVSu3JIUk9Ihf0SeAx9LT6a+XeJUPF
         TFKAE3gJQ4fKS0qtTfot3OOxH0xIHPGauWzhOPfVRr4nBfbV3wTtzTEkdxLq4EBRGL0n
         R2+9F2eJeKHiafBrTK6vuk1+NxdWS5fpTL1dLxeVnHQKUgaLdHoY+XJpjM1oOteEBRkJ
         UEJqKxYgpG3xT5uQVgHn1mY+2rXGNPyb2YSORvnI81GiEtzsCIGNvtZXyXrS4/VXLOYj
         CUcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778694617; x=1779299417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C3sIh5375gOTbKLogW0nu2FPAiE6cFaR5WSblCu7vM0=;
        b=UD4DmWAcPnqPJkQczPCB4rhjHtHFBDXRP3OQ6OqmpytipEwIDPODZtW/tZpVkD4Q1+
         mKeJyHFddWYyS4sHE1cPMQruPRf9gcV1SS0tj5GUE3Pw2mfvMPPsBclOne3MXH22jTfs
         vcLxkiQqQONdGUrO+0hfO3zZJoOHEtfxA9Kdp6QEaYDf9Q1Wquylyx5RCFij4kG0HNB6
         xwOcOn2Ai2S6+4GkaQpmXSRjRTCO8ANsmottYOcptmWrUw8IEmd9gSRN/AXZ0aGgtGLW
         CDuyZkifjfMq+Onz7gcibWgYdSu5Ioza1/ziYT2knTqk2/8YTmoVRTwTPIJnFcxm8tXG
         RpGw==
X-Gm-Message-State: AOJu0YybNElEpwiRXVXRNjnxcDst2Of+lARWAjZ54a5VCeFwlHHsVuEN
	1li89bqRNIzG5h9mie45x4+kgzaXAE2mZRHxc9mym/kptE+vYlUL652GbIy/q1Tb7h4=
X-Gm-Gg: Acq92OHiofHIdhoXVzD8qLn0z1p/OWoGXMEFwDweIcJkTsPdaQ5ehVMJ1Tcw9ny5C+Y
	B3graofNmmUr+mviGq6xP7sG+mQhjWZppwgHS3arRjM9XDaxaqBy0YOelkV36ohhG+x39jIztFK
	Y7FXJxwZJv7PWo7Wym1yA0O9+ZNKJXyPpHiIbFwbiAWkfKpwGy5vh1Xfw4eQZHEqI05OARFccEQ
	Cd5XnYlOPosO3pWRKaQBElSIw0IxVx+hyDai0Q4zI7F2WJYzyEPBpfKp6Xr/SuF83HOdHv+Ts60
	KsegOQjWJH5qiWoMsLTPPWVkZVxFbylecewOaCANYgB+iJkVkFguns44RKOuRwAYFSnCyozyenJ
	bClEmRXb0ItLk9oyYQAN/M2X+VfC4Mf7XZcCNsda0+2Mad+w5KqVAR0hzh6OAGSGeP4QZdX/AZc
	17l5UeMe5qeJrtCTOiLrIaLV8p66C+ao5FL4HxzWS2VgryZdnn5kpGiLiU63N/i/mEt2WbSjg1X
	MknIf8Obgy3bFk0X8T+ZpMtTw==
X-Received: by 2002:a05:600c:19ce:b0:48a:58e1:6cf7 with SMTP id
 5b1f17b1804b1-48fc9a362f9mr27622065e9.4.1778694616986;
        Wed, 13 May 2026 10:50:16 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-214.um39.pools.vodafone-ip.de. [109.193.28.214])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-45da0fe13a7sm486730f8f.29.2026.05.13.10.50.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:50:16 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from
 Mesa NV50 bind probe
Date: Wed, 13 May 2026 19:50:12 +0200
Message-ID: <20260513175014.96599-2-marek@czernohous.de>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260513175014.96599-1-marek@czernohous.de>
References: <20260513175014.96599-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: R57LGCMMV6NNWZMBVXHPJ3VSWCWHLV2W
X-Message-ID-Hash: R57LGCMMV6NNWZMBVXHPJ3VSWCWHLV2W
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R57LGCMMV6NNWZMBVXHPJ3VSWCWHLV2W/>
Archived-At: 
 <https://lore.freedesktop.org/20260513175014.96599-2-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The Mesa userspace driver issues a method-0x0060 / data-0xbeef02xx
binding probe on Tesla GPUs that ends up triggering CACHE_ERROR in the
PFIFO interrupt handler. The probe is harmless and recovers cleanly,
but it floods dmesg at error level on every X/Wayland session start.

Filter that specific pattern down to debug level so dmesg stays clean
while real CACHE_ERROR conditions are still logged at error level.

Tested on Apple Mac Mini (MCP79, NVAC 0xac080b1) and a G94: dmesg has
no CACHE_ERROR spam during normal operation, the previously visible
beef02xx pattern now only appears at debug level.

Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   | 25 ++++++++++++++-----
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
index c4b8e567d86f..fa13cd55b593 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
@@ -327,12 +327,25 @@ nv04_fifo_intr_cache_error(struct nvkm_fifo *fifo, u32 chid, u32 get)
 
 	if (!(pull0 & 0x00000100) ||
 	    !nv04_fifo_swmthd(device, chid, mthd, data)) {
-		chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
-		nvkm_error(subdev, "CACHE_ERROR - "
-			   "ch %d [%s] subc %d mthd %04x data %08x\n",
-			   chid, chan ? chan->name : "unknown",
-			   (mthd >> 13) & 7, mthd & 0x1ffc, data);
-		nvkm_chan_put(&chan, flags);
+		/*
+		 * Filter benign Mesa NV50 bind probe: mthd 0x0060 with
+		 * data 0xbeef02xx is a harmless userspace probe on Tesla
+		 * GPUs and does not indicate an actual error condition.
+		 * Demote to debug to keep dmesg clean while still catching
+		 * real CACHE_ERROR events.
+		 */
+		if ((mthd & 0x1ffc) == 0x0060 &&
+		    (data & 0xffffff00) == 0xbeef0200) {
+			nvkm_debug(subdev, "CACHE_ERROR - ch %d subc %d mthd %04x data %08x (benign, skipped)\n",
+				   chid, (mthd >> 13) & 7, mthd & 0x1ffc, data);
+		} else {
+			chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
+			nvkm_error(subdev, "CACHE_ERROR - "
+				   "ch %d [%s] subc %d mthd %04x data %08x\n",
+				   chid, chan ? chan->name : "unknown",
+				   (mthd >> 13) & 7, mthd & 0x1ffc, data);
+			nvkm_chan_put(&chan, flags);
+		}
 	}
 
 	nvkm_wr32(device, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
-- 
2.53.0

