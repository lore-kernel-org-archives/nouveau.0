Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21B96C55ABF
	for <nouveau@archiver.kernel.org>; Thu,  6 Aug 2026 08:52:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 210F110F147;
	Thu,  6 Aug 2026 08:52:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jqtihqCy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6A72547607;
	Thu,  6 Aug 2026 08:36:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786005394;
 b=khx9ojKgDLpvBcPKv0kughqaIibkrpBP9UV1MyQnHuEga3HjbRB5mErsUqNVucaemVjZ0
 v1aSQWvaHcRmnq+FgmxvpFiSjiGGibRW5/kqF+SawAij1Lzk/8AymuixAQ+Vi2SZzGq2zXL
 DClQi+eUzw5hLKMv4L85LCLrK3LvqZ41VHZxuLVR7uVXrhYqN5uiexp5iyJ4y5cBU293mc0
 5QxEzJLY0srwUQSVRY/tg87OdICBKL/Rgepc0CdM3ALVzYRxi9s7bLmzz9h1gagkjnqxrIm
 DDR1+MMkNmWdYR6SEJnRF0GN05P0o45L9bwqC1rQBYKdgDI/K4nCWY2vwfIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786005394; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=43GMMFZoVTY8+U+Ee+riXD/46xoLgGatma6l0KI0k2A=;
 b=QMN1dMWJIC7k1+S/NMmOYZQzgfqHML43aFKg+DjyBwvEjX5zjkB/kPnTw8ww81ZuVUUFS
 LeCLV5W1usWfLlJ+smsbJV97gA6lg3CXkN2CWA8JaUFcmGymfXGa9rwb3p1KMk30rpk1xh5
 1EpXCLOEWyIdNt79jTXeu6hPtRA3TW1037QswaMR2vcb5LtieQsu6UVcl0WhysHHbMqa6VE
 QYuMh6hgJehTkDiqCEPGnft+CYkRd+FmkZMf19R7CDL/EGE7iNhJpbI18Tw1mFAqOF08ZKl
 S4dZIWEFiFkVvJFpQ/beyop8EqjoGvB1bTQ0tsfB1TNvPUsNt2HMRC+KQAjw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2E877475ED
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 08:36:30 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB51B10E2C3
	for <nouveau@lists.freedesktop.org>; Thu,  6 Aug 2026 08:52:33 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4956d1d9fb2so1889235e9.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 06 Aug 2026 01:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786006352; x=1786611152;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=43GMMFZoVTY8+U+Ee+riXD/46xoLgGatma6l0KI0k2A=;
        b=jqtihqCyzG9nHdayar2/W8I1abCeFyqZLg/LwSDCNLQEmO0VahkSn+jy2saisnrIi+
         NQUCrKDI+GS+6y/p607sS+FydKnOebEotygOgcz8A6A0g2AZfJSeTqOgTa5GXUWURjK8
         0a2skxc2qkvzHtZjhxZPmZhVZ0N+kXlImNBqRojLuLh+Rok8jFdBU8tCdpQR7VG+rfWG
         n8pTjoviRergJrIhglZ/PbyeDX69MNXt6LZV0ttl/KPrLwU9ye0qnX0oQN6hNjYa/ra7
         RqrdWDPxqZYaOFC/chZsmRtS6VpLM3qsIuxhNK4owfnIodWwj63GdU9lUblLrbqYt5ZT
         TQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786006352; x=1786611152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=43GMMFZoVTY8+U+Ee+riXD/46xoLgGatma6l0KI0k2A=;
        b=EnVw3aHO/v/Mz9O060GxhpE9ejwBSudsfR0O1Z5NxC45Dyo/PPP42Md5720oJoGoCW
         EWZFkXIVyUCBNzKIK3RPieveJ02yF9ybXlxjOfZBuJgh2ZKORZG+hecgbmEyoHqs9lFY
         AmYBi2ZVt43c2i2wpcjHXuXNFqsTXCRKOLVG1k+LxKdTEmHRQcMuV2tXfkUCAdPYMTXW
         l/Oh2CDJIRH8S7yo+focfV/Wkr+hdlkBHjR2ft5ZSUrd7nS2TT6Gn+AbEId6rfx4Qb0W
         1lLjMZmm+ozYUf7UXpWd3aQiVR9Cpf2VKJEVkUm0on3JxMg2n/LUTkmR9m26p3aVmwdR
         /+sQ==
X-Gm-Message-State: AOJu0YySADL7CCEyMbnXEU+EuDat6soL7S4VU8cK98lGsqAhNe1KDSjs
	RubUGTaJJjk6DxNUCAjHGdYgu5sWJ8Zqja6zmCUDzs7lXx8Y+zWNdJ9uwd08cxCve8g=
X-Gm-Gg: AR+sD1386qcYMKE6oq9qP457nv71piHZnIR4Pfz3Alq/vFMN9gYF195u0wfkBu3bi/9
	sIn/K5cHvKI1jXvv9fHcXufy7DroaA2Ekvu/0E/xMWGxyufc2A/OMYXdZMMJmREEVFCAgYBV8Ac
	xHCtOxqUAg4A3iFpHdge6Qw+f5mFr0tRcRZ8MPImOIwBeLmZc4a6mUtklKlFuypeiAnaSsCeIGL
	ASFHchw630NhFWGdiDU6AxLl9BYyUWqZ2Te9mXTM/lWB7zjpGQczkULhBFqx48d4n/nU9beJVUa
	XtDkY+ykfbnPjatuTvMX7xcEjbwAWiIP+Fq1fmfLKE2y/Nv20XXOSQazkVPGf7zypwv/QvAaJPf
	zqKdKXz9dlePph/Z450fXih6ilp9yWJHrYtunnHLjib0b1Or5/J6NUmiOIAMAKrYNqOc77unynM
	TStxOFkpeH4WWzYzQtbMiDgotcqtJG/0CzI1/5CZh5DUsH8cMYaAYqk2L8lkwVtjOAVT52G/3K4
	vJ+zhNWYjw3ZtxV5/ODu+Vw/0rnz3PqoLFDxk22nWsCBg2Mmxcy99SKKN28opEfSg==
X-Received: by 2002:a05:600c:b85:b0:495:4505:dad0 with SMTP id
 5b1f17b1804b1-4994e7ba5efmr93074145e9.2.1786006351804;
        Thu, 06 Aug 2026 01:52:31 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4995420cb4esm45985355e9.2.2026.08.06.01.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 01:52:31 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from
 Mesa NV50 bind probe
Date: Thu,  6 Aug 2026 10:52:26 +0200
Message-ID: <20260806085228.1848994-2-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260806085228.1848994-1-mczernohous@gmail.com>
References: <20260806085228.1848994-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: KACKRFL26AG3OJUQILOZWM22YU5NU2JO
X-Message-ID-Hash: KACKRFL26AG3OJUQILOZWM22YU5NU2JO
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KACKRFL26AG3OJUQILOZWM22YU5NU2JO/>
Archived-At: 
 <https://lore.freedesktop.org/20260806085228.1848994-2-mczernohous@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

The Mesa userspace driver issues a method-0x0060 / data-0xbeef02xx
binding probe on Tesla GPUs that ends up triggering CACHE_ERROR in the
PFIFO interrupt handler. The probe is harmless and recovers cleanly,
but it floods dmesg at error level on every X/Wayland session start.

Filter that specific pattern down to debug level so dmesg stays clean
while real CACHE_ERROR conditions are still logged at error level.

Tested on an Apple Mac mini Late 2009 (MCP79, NVAC 0xac080b1): dmesg has
no CACHE_ERROR spam during normal operation, the previously visible
beef02xx pattern now only appears at debug level.

Assisted-by: Claude:claude-opus-5
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
2.54.0

