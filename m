Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE2F4C43458
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 12:37:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8E05010E464;
	Sun, 12 Jul 2026 12:37:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lNWkNWM1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 01EF140A48;
	Sun, 12 Jul 2026 12:22:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783858951;
 b=Wq0+RRK4jxoyvZ+dVMOtzRrjnLvwcaBuybVbBO2UO+/oAJFbNRn94tFfcePDqAzbAz5R3
 1tq1MoDFszG58csBUyDUpUxqlOrEVXM7N5pukwZ6iDQuoVabpCWXs0fgngWIP89tPU3Tq4E
 deoOSW1d/ZyPnkEJjaDoXGz51RG7rbi9vWgQg4NjR+HUt8Lhni4FzIsIj1KQ2j8ewmbTa6V
 gWfQulye8Ge63LAap7yzL4D7Gvauaf6akAG8YMpOVZPYTCLMhNt2ST/jJ0W033HAkcJyee4
 ADGuKl19+TdlYwmmkfdDz0LMQjYmPQHwVvyVM4GgTFxZXltY88PBcMC5ySkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783858951; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yZa2enwSIIgLldRkiC8kJq5D8PtsumlenYqYmwQU3wk=;
 b=qFksMox97rB8SM/ofrFDuoiapiB72wHyiKwzXMHK/Jpqg0rYIyZhLTjsLcit7JlyDbDkh
 uMFLZSfJ7RAp6bZysfpnPZvcYyuWPjwd+Clc/dc4rSWoOIcyv+WCTNex0rNIxJCa8T2BqB/
 frDMqEl4+cX8W7XgY8IlayoUnscG2Py675Hv4Nff28xemp9mLQvP41HNZ8c+MxZfGv6w4km
 YEAUB39IBzuiBqEqL+/+VmT4iRbWIPzYdkknAr6WQJOo2rm6BcRfrssgWlrbg+RQ5XL8BQu
 waVTe6C2TSRpNiAJGKtGntKHge3GBYC0zYKAGC1zQaoHfaidBpPSvDeJHQlA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 205E8400A8
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:22:29 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 89BB110E462
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:37:37 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-493ba701891so21296545e9.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 12 Jul 2026 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859856; x=1784464656;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZa2enwSIIgLldRkiC8kJq5D8PtsumlenYqYmwQU3wk=;
        b=lNWkNWM11UkiHsmRhKcwZnFFxfTZg2w1QAFe0E6nVyXKEp/j/NbWBoiYz+lhG2UvZP
         /zWV4H1qD5jnePosKdEAW2s1IHGbgZgAKfSjTbQB1df9J/R1zIrq3GTpZKXMrIYGvaBC
         zk5LxUwn+5iGA4ILPtHBeJWuUUa17Yu4YSur9Lc26k04Sk8BEuvY5zIfDQ22WACsh0V3
         /YsHio2WX4K1VjV/GVBCfkzyVK4U81VAzpXXdYow+7RMyPTQNqrMQ3BfrmbrLapt54YS
         QFkztzaDTgHB4iNa0AFN0QcLlyO0VazcK/d0h2MyNY+6GS4knMXOXHvk5ebuqdJ2P2Lq
         1aLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859856; x=1784464656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZa2enwSIIgLldRkiC8kJq5D8PtsumlenYqYmwQU3wk=;
        b=l0yGvXtI88/PM6EwInYzuCO5JE98+2sU21tL8jFhIT2Y574L3aUUPr07ctUdGaHaY0
         e/1/6kOSrQx68KUIOry14SnJDSMdBtEvfyU+I91o8l9i95/VKnsh8FNoNHc6PQi+yewp
         W9tOodSeggFWVqx1wo1FIzb8k+cT8PzCdooSDt341fmPufPXOfK+iVwi3u+Jqc2WkdgN
         0PuBLoTT5L+WibKjNlD8Jsa9zIyefYVQeXX4Za7+UOoBGU5sK8t8enj4iOZojmGCJW91
         35qWa4ENvvclG8M35Hw80ggJ/hAsEMXJIEjKEo65Xdn3BdfIOZDYZwkSnVVjnb91rOVy
         1Srg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro3nzHC45f7gq/l1EzqlJvB1qDx1znE2qRD7qitr+JxuqJIDibB77FWO/U1MaNbgHZ3zLFkv6JH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfzmYhqosd8XpVafgNXQIFfGXTdguBmN1Dn2wWlI8vzNxfUF2W
	9xNiM5q5skH+K3WTyacMqHwfgfjgcHzb2l1MrVrmlOs69lgzuCkD+TIJ
X-Gm-Gg: AfdE7ckJmQo1aj5KBDZpewQapRFyrjulVAGn+JU9CfLcUCEsmqeM/nIuXzz4yMGnxuH
	edGraDf2P/Jcr+F8CE9mpskR3ivKMkENiXGwBnI8CMmpCawkod1n91ojJTLaCByXuScNjkkpxaU
	2siQQP1bxzZ72doS1/IyIIICfFmk7PUyikAJRm5VVOS+EOIvzk7m377dr5enTqtLmA6C1KyEyW8
	ZldTf5DdOxuODOMSuXqHEPvspFxUYcakjbABujk7x0MAuBZjW6HLSQVy8Hs8vMUIkvOmNOl/Fdb
	KBIVu/Krqw1Y1IoHfF0DwR5UEl/kyh5UeMQ+MHh01FRXUjj3lZwJEXp1ioiG47UUR7ipR5G8QMh
	ee5gOzJ1s/loN7/PSntc+5O1ky45rur8S/xWTZrtTscThB83Rz3y5RXc6A7yrdZ/m+vLHMSK9Vg
	iOPUJq/JHAvndi8CQ=
X-Received: by 2002:a05:600c:80c5:b0:493:a570:df7d with SMTP id
 5b1f17b1804b1-493f881d20fmr37660025e9.20.1783859855726;
        Sun, 12 Jul 2026 05:37:35 -0700 (PDT)
Received: from fra-x8664 ([2a01:e11:8000:43b0:96d6:566b:35c:7b8c])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3c42sm280280485e9.1.2026.07.12.05.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:37:35 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor after the
 loop
Date: Sun, 12 Jul 2026 14:36:14 +0200
Message-ID: <20260712123616.1180830-3-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712123616.1180830-1-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FRCK6QGFFA76IVQS2BNK7EGVLPCESUS6
X-Message-ID-Hash: FRCK6QGFFA76IVQS2BNK7EGVLPCESUS6
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FRCK6QGFFA76IVQS2BNK7EGVLPCESUS6/>
Archived-At: 
 <https://lore.freedesktop.org/20260712123616.1180830-3-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_pstate_prog() walks clk->states looking for the entry at index
'pstatei' and then keeps using the list_for_each_entry cursor after the
loop.  This is not triggerable today: every caller clamps the index
against clk->state_nr before calling, so the loop always breaks on a real
entry.  It is safe by virtue of what the callers happen to do, not by
anything the function itself checks.

Should a caller ever pass an index that is not on the list, the cursor
would point at the list head rather than at a pstate, and the
pstate->base.domain[] and pstate->fanspeed accesses that follow would read
past it.  Rather than leave that trap in place for the next caller, track
whether the entry was found and return -EINVAL if it was not.

No functional change.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 42f3709e0..4d546b07f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -270,13 +270,19 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 	struct nvkm_fb *fb = subdev->device->fb;
 	struct nvkm_pci *pci = subdev->device->pci;
 	struct nvkm_pstate *pstate;
+	bool found = false;
 	int ret, idx = 0;
 
 	list_for_each_entry(pstate, &clk->states, head) {
-		if (idx++ == pstatei)
+		if (idx++ == pstatei) {
+			found = true;
 			break;
+		}
 	}
 
+	if (!found)
+		return -EINVAL;
+
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
 	clk->pstate = pstatei;
 
-- 
2.55.0

