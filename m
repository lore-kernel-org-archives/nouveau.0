Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5644C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 15:06:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69B1810E475;
	Mon, 27 Jul 2026 15:06:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J8he0zfu";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6455647404;
	Mon, 27 Jul 2026 14:50:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785163822;
 b=dLzzSXJeqdmiwvjKnEp22ypJVq17Zf+AARJtjNsR4n4FZ8Ux//8BP55R0rsqtHCi9cVST
 JkfcYqkYpm1tyzI3LkfkKALjBGivXo7rrQtjjqhI8A7zGj44icfdzJZbI7g1CV3LMam1ep2
 rbv98aMuE6qzWf5iHIgs+n0U4u3LVA9yiTQaCYcEJwnasUQIb+05te7HhpfvOSSHVPLMX7l
 h9mIiXK97tA+PvO2JGf1T5gRcCcC+3lou3wGEghZK9yLNfIlfsBq1cLPfX9HRxEwIJ9zBNu
 wwh0MX48ncIScUQeb0GAlGxlEaj7B7Ei3fFSr5s3qZy5QrVJxwcmgOUMpm7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785163822; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TtyCVpfIwq8dbOfs0FyryLYRFkfiNQaZ8V8GbCjDPSQ=;
 b=Aze8J+qYe/UEFCMf+qkbrmRd/ojOMcupHJdHozLSQ0DojBMI/ZPWHocLoigTOiW3Kwa7v
 c/SVdwxLGQFC0scqM9Dx/pEqPvrRwk8RVuQf+APNJq9WJ9ShZ6a11emnEeRTL+wUpY8Qdus
 wUFJb/LsUkjpUG6CaDc9baj7dXIX5XHZdVi4fY7jAPRMVE6I+wbItH9QZoJGgXAJC0UpFVZ
 MGAGAqa/hKTSUrfj2hzmGGMpHrkrJXJQVuDblvB9igcVE9TMelFHVYIO8q3ypENl+g20zOx
 E64Da12kQ3IwZUO1yzTOjAj9hUPldLjg15c4Oma/ujhFxe3TvUedVUKWIBWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9C50F473DF
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 14:50:20 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 86C4310E461
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:06:02 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-47ddf7b09e5so2891644f8f.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 08:06:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785164761; x=1785769561;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtyCVpfIwq8dbOfs0FyryLYRFkfiNQaZ8V8GbCjDPSQ=;
        b=J8he0zfuaUnX64ekTEtpxZR+aw9JyELiisd8s9jp+7pXfSj5OAMKG10gsarwUYrCGp
         gBlJ7vcyWWECF6pvPXdOVoIHM2eFydUCTp50XrfFaYF1v2ttqDckQfpljxuAazci4t7w
         0CK5q7ThJwjzR5JZfuScz0SZ/CVCIiwBBRQPoTUpzRkpAxS7tKZbCmL8A837sOmmmceF
         9iJkYijLMzNehSTKcjcwQ+6Hul4HBqlP1Da24jZbz1qcftV4BC6cqZCOyk7Na7aA14O4
         c88KW2SBk5VI99MHKgECJEbM0AM3igp0j7BIACv+D/43bA0KkEE3uAtx4lWuDN48L0np
         h5aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785164761; x=1785769561;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtyCVpfIwq8dbOfs0FyryLYRFkfiNQaZ8V8GbCjDPSQ=;
        b=HMqfiyQ+CfGPfWCs+eQugWvciRGnygFtQbcHI/K6Rhdj3SfNoXZYkS+smxtZ1YHRJg
         fvpQ2k14KEwEJvb1OXfyn4mDEprC2mtKD8pRoqm5TeEfnLAeAmsIdxDTbiAZeCD8gHu8
         pDKCTlJR2ltE2DkeGtVPsibp+YRB/BGqMJfWhTeFUtZUgdWj8yXQ9velIZUWy4dIvuyI
         tZoasi9HLRJ0Aq1JhmBtS4l/33vQAk4JpUrjgA2Kfbk3C2CbcGEYQYsmkbShQmtiPS0y
         wk/snENKXyRQL/BAdr1eNaP5bQOsHlCa+/kHb2+Z8xMoGjksiumNQ7tsNaT4fjBC0Qn5
         ATiA==
X-Gm-Message-State: AOJu0Yxrg3k+oW+/e3uwtaIgIXSKE8+ucY6uFgHTDa5AoCk6MHHCDeo6
	pDlI9k5+79UsWyalYww64fJ6wh+FUFnDEeEIeEraNsrOcZE+BUbowSY+FmTSbpor
X-Gm-Gg: AR+sD12sndJe7kdxRhw4M7J4bQ4sTweg9o5wbBzQWw1UhZCRFL9WBjDVoja9JlK6VZh
	2A7B7wrrIoAgWnCPbbP6Wus+ymnyR5U/UUmfH6YliCiW9jaWs0npiqip2H/nl7KiiiP+OEEO9uQ
	YwwxGPi6jgHOWGIyBPqV/kk1prstL1TXXJhNULri/T0IcbMdysqh1U8k+VrvNxsmF7qBHlFy7wF
	XNhy7tRQX0jMameJ3hrLgmGC+XKJymjQFTtUNr6u+IC1RGJniOHpmeutwWbExztHOgbLg3SLpft
	XqOqhWJTaxoMWVgL/MEl4K+b+HkSnsyWa4oiPk+euA5q57Re0j51ePffs31cwyY17WVKn0tATyo
	2sduSYjXK74dzrBAYCAQzWqo9ZGLhpvjdgBP1XcR4GQ9ENcUENpihaCuygLajqykIcjzdWf9mUU
	n7gyqsbqIxawyi7QP+ow==
X-Received: by 2002:a05:6000:1867:b0:47f:9266:9bde with SMTP id
 ffacd0b85a97d-47f9fc82a3cmr11583384f8f.4.1785164759376;
        Mon, 27 Jul 2026 08:05:59 -0700 (PDT)
Received: from fra-x8664.lan ([151.16.232.22])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-47f85b9a5a2sm54242960f8f.7.2026.07.27.08.05.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:05:57 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/nouveau/clk: don't ignore RAM clock programming
 errors in nvkm_pstate_prog
Date: Mon, 27 Jul 2026 17:05:45 +0200
Message-ID: <20260727150546.121357-2-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727150546.121357-1-postadelmaga@gmail.com>
References: <20260727150546.121357-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 74TIAOBC4SRETAEE3OA62SPJELBIQTXY
X-Message-ID-Hash: 74TIAOBC4SRETAEE3OA62SPJELBIQTXY
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/74TIAOBC4SRETAEE3OA62SPJELBIQTXY/>
Archived-At: 
 <https://lore.freedesktop.org/20260727150546.121357-2-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The RAM reclock loop discards its own return value: once the do-while
exits, ram->func->tidy() runs and the function falls straight into
nvkm_cstate_prog(), whose result becomes the return value regardless of
whether ram->func->calc()/prog() failed. A negative ret from RAM
programming is silently dropped, so a failed memory clock transition is
never reported and the core clock still gets reprogrammed on top of it.

Return the RAM error (after tidy() has still run) instead of falling
through to the core clock path.

Found by Sashiko AI review (https://sashiko.dev) while reviewing
"[PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor after the
loop" (20260712123616.1180830-1-postadelmaga@gmail.com) as a
pre-existing issue.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 nvkm/subdev/clk/base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/nvkm/subdev/clk/base.c b/nvkm/subdev/clk/base.c
index 44dc86b..737bec8 100644
--- a/nvkm/subdev/clk/base.c
+++ b/nvkm/subdev/clk/base.c
@@ -298,6 +298,8 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 				ret = ram->func->prog(ram);
 		} while (ret > 0);
 		ram->func->tidy(ram);
+		if (ret < 0)
+			return ret;
 	}
 
 	return nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
-- 
2.55.0

