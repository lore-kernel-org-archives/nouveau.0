Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AB3C5CFDB
	for <nouveau@archiver.kernel.org>; Wed, 12 Aug 2026 23:13:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EAD1310F16D;
	Wed, 12 Aug 2026 23:13:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OpX+Cmj1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 98BA547704;
	Wed, 12 Aug 2026 22:57:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786575442;
 b=Hy9MoHGd0SFOirySP1kYbbxwe+LtKt7h6VIxkz35oBLjEOdfARYBk67TspI/uGkEuhXyK
 lYvVEPq1IxoXiyCI+M5lf58Silczfxbaf3L6IeUk5rNyVfTAvOHRVfF/vMAs/SjAMwdML8H
 n1KNE4omVzsY7NyF5SESKk03lmwCkeDaorR0R6YCleKh9MhEvmI7w3ONA+JgE4RICnee7lr
 8ppv4+jvyzBEg4x4s5pDge4teAyLmPfJlnItRptjyEdrEoUZ+x94OURi5TUD5Sr1oOT8i00
 auLvGZzvA0e6cbpXhSrekypJFH7leC8WTEFOykH7KitXM+Tr8Sfmc/6veArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786575442; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Tfw6HroNHGc2c12iMbCQTsQpKK1xWyV/VLQvyFAcyJg=;
 b=02y1G7BpVCybLFw9Y//ywptfXS+GWlPpJFyL/uwYrmzQ8vud76NWUUARy9x792mD+mPeh
 ams5S8zmDLR5VCIZAm+vbjHIKvGeRSEQW4b1agSGRRuaHFzlxmrsyINmEWSblBOC0GnFA8r
 gRKKQgcB0eBbHO9VPdoZHAjpCcRox98btC2neWf8InYVBzVilJMiWaXD+byjCzOG6p/F9Cl
 WxVKPTBAjSJwzRR4DFeFBddJlvJM2jHxgoHV2vkyw/3G473mg/1JpbP2jW+04Gbs8RDLI8l
 wZpwj3YQZt5EEJNPEL92k/COc47Tb+ImMncuN7tDC/AFtiRAHODMIvFaNtmw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B47E04770C
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 22:57:19 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E4DB010F148
	for <nouveau@lists.freedesktop.org>; Wed, 12 Aug 2026 23:13:37 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4956d1d9fb2so1348195e9.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 12 Aug 2026 16:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786576416; x=1787181216;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tfw6HroNHGc2c12iMbCQTsQpKK1xWyV/VLQvyFAcyJg=;
        b=OpX+Cmj1uGJl1q3eLd05KHdF181l0/tdKwWCFcpNHqoRDZi7J5xjX9df5q9b1lAz8Z
         0nHnq8ZQK3j0aSigaHQAyrq2lPz7eYbidFdGFuaDlKsd8C/C7hSy6fe5KIfM/pBaxZHE
         kO1QRJgmPBR2TsctefIJ9XKahMLBxagYvWiAMLuXrxF2jzAbsjmpta8AiHmzubWdqPHo
         qJxp6F6voSeM544+k9mbikwgVE0rcuy0jSSq5SaHcXJPftsqityMbZF2nkCHmmB1ravw
         slmmHxkV62YtmBQgI+uVc8586N/voD8xFvN2LyqcEaH0xsQmeyLfhq4J/EKFPOZenazs
         Oxfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786576416; x=1787181216;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tfw6HroNHGc2c12iMbCQTsQpKK1xWyV/VLQvyFAcyJg=;
        b=h9qSy/AbyZiLriU3Af81lewrM6uztBANTulKz4ihqOpF4ilqr1iOrwayDE3L/5xEdR
         fGOUMeObG/aHMi2pEN5AN9RN4OEMOgYGAYBqBoR/vlt48xIGRtvziLgOjxElHPyMlCep
         4TqhGjAqWNUiKlTmMCmPrQ+eCbjurIb8wOlCLlCie3Km0qulIkEZbB+Ci+QTPi8fDDTT
         2dGATCUNLpSfNAwYPNovqQW90JNzjgTbZiX/3h4JvUBuEaOIUuRIf7I3I51p3TZnpywe
         srayL84QuCSmsUGjat1lK5Ge1Yix59Qy9wW/ShU1/zROrqILyXWtlS5hBZwEJWen58dR
         hMkw==
X-Gm-Message-State: AOJu0YyG8KyodfSJP/0VG+zrSXd90P9PmQ+I+dtyH+Z65CCYvlpKO3Gd
	rVIPyGcWJAsnYRnzpW0hibvPPcoktil5kZQRv8dHQXINwmPRwkksmoauzv1fxRwv
X-Gm-Gg: AR+sD12LU44B7HJrPdbVlFInhw1DqW8EetfISuqQtz2qMQZa6pmKPT/VsaV+crkSaHS
	sBEbL90jDucuwnOzhyHZSz/bhMpiABDr2UhiIQ5uI41nlNKz02I9PhgNnC8Kzw8YWSBF4ZTKG6F
	Pza3zkCaCnsxr9zoIPU6Y9M1hs+EDTY6UnNj/J2quWF/IY+XkWkwm5ELfjPpCCK9UbGTHWtgfSN
	zsWeiEKm8BfFHtsv0v9FnV292X9kpfK+HRlAUMEEnv7dhp74Tubp+r67IIxWcTp2DVFgSqSaxVr
	qImcvVWrphKqg2TlgSn5Ay62da9ijmhmJM1ENSF8BtPhMhIOVrLFivn0Ju8lKeDm8rw3FmnZtH7
	vLOxBJkLK7IBy8bS165RKxLP/Pxg9j02zZGAB+sxbqbR5ENzJapsuWoKrm9yAwJLJjmCLvqxOig
	L9rSXOVy7a7VSm5c5ReatC+J4hNfYGKe7kY+hq14CI8T/r/xx69TkirWTm4ZPaJiFFyU1h4s/6G
	0B12OqCsb8NI7OY6r4krI7PFSRa5qPpxlJxraafIENHDLM3Q/P/io0=
X-Received: by 2002:a05:600c:3b2a:b0:495:4505:dad0 with SMTP id
 5b1f17b1804b1-499821ad33cmr5870475e9.2.1786576416271;
        Wed, 12 Aug 2026 16:13:36 -0700 (PDT)
Received: from Neo.taile6b6ba.ts.net
 (ip-109-193-028-127.um39.pools.vodafone-ip.de. [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-49981b631c1sm44532245e9.14.2026.08.12.16.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 16:13:35 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/4] drm/nouveau/fifo/nv04: filter benign CACHE_ERROR from
 Mesa NV50 bind probe
Date: Thu, 13 Aug 2026 01:13:29 +0200
Message-ID: <20260812231330.705425-4-mczernohous@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812231330.705425-1-mczernohous@gmail.com>
References: <20260812231330.705425-1-mczernohous@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: TDZNEVIH65ZC7PVW34AENBTODW7XSWEI
X-Message-ID-Hash: TDZNEVIH65ZC7PVW34AENBTODW7XSWEI
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TDZNEVIH65ZC7PVW34AENBTODW7XSWEI/>
Archived-At: 
 <https://lore.freedesktop.org/20260812231330.705425-4-mczernohous@gmail.com/>
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
binding probe that ends up triggering CACHE_ERROR in the PFIFO
interrupt handler. The probe is harmless and recovers cleanly, but it
is reported at error level, so it shows up in dmesg on session start.

Filter that specific pattern down to debug level so dmesg stays clean
while real CACHE_ERROR conditions are still logged at error level.

The test is on the method and data pattern alone, not on the chip
family, so it applies wherever nv04_fifo_intr() is the handler, that is
nv04 through g98. That is deliberate rather than an oversight: a false
positive would need userspace to write exactly 0xbeef02xx to method
0x0060, and the probe itself comes from the shared nouveau Gallium code
rather than from anything NV50 specific. Say so here so the narrower
wording of the subject is not read as a chip gate.

Evidence: 99 occurrences across three logs from a second, independent
MCP79/MCP7A machine running 7.0.10 and 6.12.90, under both Xorg and
Wayland, with kwin and plasmashell named as the faulting clients. On my
own reference machine the filter went in before the persistent kernel
log did, so I cannot show a clean before and after from there.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/nv04.c   | 26 ++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
index c4b8e567d86f..ab144c1bd9da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/nv04.c
@@ -327,12 +327,26 @@ nv04_fifo_intr_cache_error(struct nvkm_fifo *fifo, u32 chid, u32 get)
 
 	if (!(pull0 & 0x00000100) ||
 	    !nv04_fifo_swmthd(device, chid, mthd, data)) {
-		chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
-		nvkm_error(subdev, "CACHE_ERROR - "
-			   "ch %d [%s] subc %d mthd %04x data %08x\n",
-			   chid, chan ? chan->name : "unknown",
-			   (mthd >> 13) & 7, mthd & 0x1ffc, data);
-		nvkm_chan_put(&chan, flags);
+		/*
+		 * Filter the benign Mesa bind probe: mthd 0x0060 with data
+		 * 0xbeef02xx is a harmless userspace probe and does not
+		 * indicate an actual error condition. The test is on the
+		 * method and data pattern alone, so it applies on every
+		 * chip that reaches this handler, not just on Tesla.
+		 * Demote to debug to keep dmesg clean while still catching
+		 * real CACHE_ERROR events.
+		 */
+		if ((mthd & 0x1ffc) == 0x0060 &&
+		    (data & 0xffffff00) == 0xbeef0200) {
+			nvkm_debug(subdev, "CACHE_ERROR - ch %d subc %d mthd %04x data %08x (benign, skipped)\n",
+				   chid, (mthd >> 13) & 7, mthd & 0x1ffc, data);
+		} else {
+			chan = nvkm_chan_get_chid(&fifo->engine, chid, &flags);
+			nvkm_error(subdev, "CACHE_ERROR - ch %d [%s] subc %d mthd %04x data %08x\n",
+				   chid, chan ? chan->name : "unknown",
+				   (mthd >> 13) & 7, mthd & 0x1ffc, data);
+			nvkm_chan_put(&chan, flags);
+		}
 	}
 
 	nvkm_wr32(device, NV04_PFIFO_CACHE1_DMA_PUSH, 0);
-- 
2.54.0

