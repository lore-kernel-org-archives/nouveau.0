Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4EA9C531FC
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 15:06:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2DB610E47C;
	Mon, 27 Jul 2026 15:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UganyU/t";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9D7EA47409;
	Mon, 27 Jul 2026 14:50:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785163826;
 b=KAtUueBJ2iTq0CElLJL+/OGpLIR7XxuhQf1gRyjOUiIn+IUd4cGdq3U6bcHm/73nDj5GX
 f0iKp883VPFagURw8XTnBk6jS/1K0iq/LyMU5NCd3AI1GpnxY6CvVOZamjOFFT9F9xw2Vjd
 op3BHXDzTuzTELoLVpPH35YmysbDDVKZ2o8oJmFhxOYsZXTaIUIg+X/k7krH7yQBGe9NA5k
 VN/ZhpHLphg+UhrFKpyibP6SkP/r9Xbdqw6CUYTkndzmW4Ic2pSxIm0HbSElLRYMfJK3HgP
 rJFXN1CYnUh4Ptfzj3oxWDRWXmHa/vdIfZB3MHalFjKDPSgBmv6MT+U55YtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785163826; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bgMfUYC7ZpwL2pGUZegRGSOZuFsMOmvyJZY8xkpkpds=;
 b=O2NmhpAD3G26cXtb6hgqFSM0Djg/J+sL+Q0B/21aMPyTZ+aaSFtNOUJm3UZPCKgwOOSzP
 N6jODyhySTsDljy0KLuZU/yhfn0yKjsF+6KkDDzEFEqVZGKM9bx/oMBCX5UsDPE2ZZLEtif
 PctQ81vE1X+Xj1rVTf+P4J4ztMy2TLS/PMqvrx1sjtjMjWfT0hKWnw7sqzZWUOfgGvICrhN
 4vypADRqxEhF0/ok5+6j7nUxpRHHJC3FPzQGTyNT95z88EoxR3NpZ7ueohy1qgGZnTOxmgc
 T7zkuV0W7GoKkQmU+RyifzIMzAFoxY4X3Y1WMgSFki0kw4vcZnBALiAxRA2g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 13C5B473DF
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 14:50:24 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F056E10E45F
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:06:05 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-4957eefd361so21355595e9.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 08:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785164764; x=1785769564;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgMfUYC7ZpwL2pGUZegRGSOZuFsMOmvyJZY8xkpkpds=;
        b=UganyU/tfjumEe0NnvH5j8WkpaDIa6EsrG8EcWlBCr8qHilHV/iSNvkMeufF3Gqy1J
         IGlAjouu16mhH+VScug8T1ppX7RLYrt0hoIhpWV8jAO7fJYWBznRCond38COFmNzlGDv
         SiY4peS/5EyZBzHFv7VgxYLoYAAVLLCM7rIfgkv0g0rwIUvFbGEyb7zAsazFvUPYd3WS
         p4+ON/t+OEdGGhyRyPjWlWqmpFEvqcpYwPwLT4fRoP+W7jELK2ksSu8MN2XEYBndFUWi
         sST9jiKU37hTRgl0wPFQOXBUaGv7hoTeNyOXJM9HhtFlFccL49dK4S/pDo0LuSVKAyWJ
         xbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164764; x=1785769564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgMfUYC7ZpwL2pGUZegRGSOZuFsMOmvyJZY8xkpkpds=;
        b=QWTRMUjbG3C5YfbjOVjhGqf+x00iGOvNxVrdc6AlMpdovTqEL2NaPtmpsaIMQX33U8
         1npxHsODmpxPvJD9ZH1Yb4CSAspxpH9XTVqAX7O6GTSTdgadu6GJzT8spcDPzW4RvKyF
         CjAOuopJJRlb9u/mETB3R1mJ6/uwcJOl2ynJR9/65GVKxiCQ16+CGu3s8aGNV648HaD+
         lhTfjLJTs53vNyo7ayWyJ6BZCLBbX/7rLf+Gki3ckAK0xS3tJ0OCuzIMefNe8QVUpSJs
         chNNA+VdxZLwbawodyJqrEr6TeKNRoxka0fj0qLsv+1xQtb9n8VVirui99cQmPvKfSMB
         DKXw==
X-Gm-Message-State: AOJu0Yzivsx2zpKF8r5xfwrO8c+BFAg3gGXy2nXxDoomDSrc/75qck4Z
	3SdRJFs/IBATzpTadqKE6VNPZlUuU/Em0L8Hr2YhgAthz8aEx4G44N1ya0guP8/T
X-Gm-Gg: AR+sD11nNUf4yVsAgk/Neimw4oBgaHUSVFwj8yVGb15nrdp9zKY9wX5MBTTkKAKcTNs
	RgzKMZkf4Lqu4GG+lDUqpOrxCxRv2tKjByxOTrG+o2FIqn9VMJDEfZMwgFOIvR9HOG2SbEb2dXE
	AF4hHq0eMucS0QDGo0ve7GP3z7V9GmW6lksW6GN7/se2LZ3aEEAuDaAhqXsKUiAA/YIcqXzfjBo
	glReaXsWEEsjkPCYZGbaFDo6L5rNs8MSK3Cyg8yZ6lOnuXFi6P3bXkG+TJeCM8oa6TfjRpLBWjK
	5j7XLvEsHGvPjhLSvq0PI6VuMV+y43laPhh4obeT0SqCafw9xjeAqRYPr93m1RVqK9LxAza5XMu
	aSCsDuTzDyEqGnRtTwDyiPG7/5lDZK6a9FS7Tf1FQJvkMSEkfSmOOeHv7tH46ehNKur+fEpal0g
	sVRiMeRoY=
X-Received: by 2002:a05:600c:190c:b0:495:495b:9248 with SMTP id
 5b1f17b1804b1-496b79068acmr104556845e9.4.1785164764177;
        Mon, 27 Jul 2026 08:06:04 -0700 (PDT)
Received: from fra-x8664.lan ([151.16.232.22])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5a2sm54242960f8f.7.2026.07.27.08.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:06:01 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/nouveau/clk: only update clk->pstate after hardware
 programming succeeds
Date: Mon, 27 Jul 2026 17:05:46 +0200
Message-ID: <20260727150546.121357-3-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727150546.121357-1-postadelmaga@gmail.com>
References: <20260727150546.121357-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: K35R4KZMPDS57CAHUJS7JWZOV6WD77PX
X-Message-ID-Hash: K35R4KZMPDS57CAHUJS7JWZOV6WD77PX
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K35R4KZMPDS57CAHUJS7JWZOV6WD77PX/>
Archived-At: 
 <https://lore.freedesktop.org/20260727150546.121357-3-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_pstate_prog() wrote clk->pstate = pstatei before attempting the RAM
and core clock reprogramming. If either step failed, the software state
tracker had already committed to the new pstate even though the hardware
transition never completed, and a later re-request for that same state
could be skipped (pstate != clk->pstate would be false), leaving the
hardware stuck out of sync with what the driver believes it's running.

Move the assignment to after nvkm_cstate_prog() returns, and only commit
it on success.

Found by Sashiko AI review (https://sashiko.dev) while reviewing
"[PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor after the
loop" (20260712123616.1180830-1-postadelmaga@gmail.com) as a
pre-existing issue.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 nvkm/subdev/clk/base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/nvkm/subdev/clk/base.c b/nvkm/subdev/clk/base.c
index 737bec8..91c51d4 100644
--- a/nvkm/subdev/clk/base.c
+++ b/nvkm/subdev/clk/base.c
@@ -285,7 +285,6 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 		return -EINVAL;
 
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
-	clk->pstate = pstatei;
 
 	nvkm_pcie_set_link(pci, pstate->pcie_speed, pstate->pcie_width);
 
@@ -302,7 +301,11 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 			return ret;
 	}
 
-	return nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
+	ret = nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
+	if (ret == 0)
+		clk->pstate = pstatei;
+
+	return ret;
 }
 
 static void
-- 
2.55.0

