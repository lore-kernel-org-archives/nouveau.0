Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 820CEC43458
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 12:37:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8CC10E45C;
	Sun, 12 Jul 2026 12:37:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Its3AQtB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B31FC40800;
	Sun, 12 Jul 2026 12:22:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783858947;
 b=rmGANQosx2iSqRFvhtEPQ29fid7F7sC3LRFxoYuEoyNMfAojJ/haV6fSxD+e+ySNx2gEu
 hz4+A8oanFvfl5dNi2GtdUSXYGISbFm99JjeNYLJO7rghIMMbA/4MQMGhZT66j/Ml/M5hKl
 YNa4GOoJtkX48agbvPNmmwHqcjM4vL4ofnlH4LGKOv5bi0+aegyLdHngTui4zshkZS6yqfC
 HTqVdKYrQBbt+o7I498wu0V7upvq84AC8Lhyw91PfM9P/srCSQOcYOrKyhld8g+mvtrRBUJ
 6n4T5jgXc6NCZTirMV/hwzaf8Zb9HOWi8IMBqOqNjCfSEwnSfGKShV9VJuLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783858947; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x7IitsXdpTEQRJSq8p+rIrB3s36tgZetIRvXFPP7irs=;
 b=uKLTloFcUq2qjt7uFBR8EY/+J/2S/atq19ZDXDZJzRayEj1DADzWSYbADApuYQBrqBC8P
 lcQvIoPQfRVJtkfT/8fajRr3O6Wv1JZTks7ZKhMCwMBJkqV+Y8tX1T1sEffdH5uIn2h1eun
 TpZkpif7EPccEzoh+JDsH6XiQlo2c1HLkgFByE4O/33Cc/JEgNi4AYyYjyatpHX+s4oQudy
 mV/XqojpAWO675agv14m/Wz7H04jZA8w+uC5ww0SLuJfoxGyq2647QLGoaEGcViqsd2KA1I
 4aYf0y/Tk9kU5xbxKc2B4vnQX93Sa7dn3DoqVQBSBKPlTATyn9ocOdZB6LPA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C8D28400A8
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:22:24 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F58210E45A
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:37:33 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-493bf73ec2aso15896145e9.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 12 Jul 2026 05:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859852; x=1784464652;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=x7IitsXdpTEQRJSq8p+rIrB3s36tgZetIRvXFPP7irs=;
        b=Its3AQtB3W6/LOfqU/6dMlR2Qo0WNqgsbCQkeCqB6CMrGAX52SQquMNc9soht98K1l
         fzalEmiAlT2YhYvn1Ty0srjzqAojTXtLV1ypE5ClPiji8625bfUonP4RrEoet2hD8u/H
         Q9rgKQ8P56140FDG70s1rhOhVqGEKLVTp7iHtfUrfXpeflGepXENFv83lIPQVll1okN6
         4HDvbEGAmfEdg8tkR7c/3h7SjeSrIWSrW68SHdCpgTsy6Qg8HdoIw4R7em0x0Xt6zXIA
         WoMIr4z2WvzhkeWFt8zL50QgMku01QhFyacX3mtbuRViUCjPF5Uk4sXWWo5jsAoVBwbp
         Trgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859852; x=1784464652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=x7IitsXdpTEQRJSq8p+rIrB3s36tgZetIRvXFPP7irs=;
        b=iJT7XmYLNtAUsDOcP2yvcdFcjvvtWAecGBNQaqyJQ370+AXzcwWczNT93J7RSSlkzV
         +3ZYup7qn931QuRGQFEe0iGycfV2wf1I+y2P5y6Uyup7dLWXr8yYiNaGt7KdSDr/Zj5p
         xLA3G78xvfXxK27w5Qx1rZlChV3yoa3O+XIVZFsXf7KX6Yf/7f13ypYFvGVZKHm7iCZ4
         3KambK7679qvZnlCd2/kjAyBnTlfaAOZjBpYvRqTptP0+lzCcVKPm/PSNajxX6agzGez
         +Cv8k9n4WSCK6boJjHM+AAflNAJvtOc8kCWvJK2osDiTyqY/FowA1A2eE4fuuO1OWc5n
         gV9w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpWlroQCBo0x56EtFfmhawbyotL3c/BB7qb0ONLlIzsdW/uuqyvdgotMwhHvvVA3iROW81dcVx6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzayJrt+22BuD8J0P8dIS0uPF877x/sf6w6z2waBlFRFSXCtBoJ
	UKbl5Wfk/Y40qpJjV4gm1TzQrYlRILZyBkms2EQ1gcSJHDo/MfaBA+VS
X-Gm-Gg: AfdE7clMQGRUbg33JK8C0yXNeb4hnIHs5KzL0VDQT5xdZqRoiQhBh7z1wv/OoAjimIH
	pUHkcoTY8EPoiIVqUGlgLKLECJ5MVeamYJyilZiwNy+ZMNzIN5BQFBBVkBHtVC+XMyw6XooNyeB
	KXoW8iTKoUaBUFB35tZLg8yFKyqJlA+KYiqediiuy5HVDwxwVH9UTYuwNC+33OWh9aaZbyFxJqF
	a8FFipP3xas295cP2c9YYC/qLQiNnollsQnnfLKPWKVqruZ3fn4PynD7fJJZVTaUd/XJn0/pBKA
	lbKnHj8OPra6JqUOAdYkSpAWS/objhKYuw6fDkJ100TTiI1/plKBRuLkA/kSw4/WfrhgCuZkO5v
	zu9GZ08J5652Zbjjfq5sROcudk5xzSHLEY8/tVI964syPypAv8RpiEX9O9UYwKGQTZPC9AS7kgg
	sqwN3N/QqyxCCwObU=
X-Received: by 2002:a05:600c:1386:b0:490:5057:f5f7 with SMTP id
 5b1f17b1804b1-493f87e5164mr54882405e9.11.1783859851424;
        Sun, 12 Jul 2026 05:37:31 -0700 (PDT)
Received: from fra-x8664 ([2a01:e11:8000:43b0:96d6:566b:35c:7b8c])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3c42sm280280485e9.1.2026.07.12.05.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:37:30 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/4] drm/nouveau/clk: fix list cursor use after loop in
 nvkm_clk_ustate_update
Date: Sun, 12 Jul 2026 14:36:13 +0200
Message-ID: <20260712123616.1180830-2-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712123616.1180830-1-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C7VF4HZE73DEISCBVBXO4DVAPUYIFI7L
X-Message-ID-Hash: C7VF4HZE73DEISCBVBXO4DVAPUYIFI7L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C7VF4HZE73DEISCBVBXO4DVAPUYIFI7L/>
Archived-At: 
 <https://lore.freedesktop.org/20260712123616.1180830-2-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

If the requested pstate id is not present in the state list (or the
list is empty, e.g. broken/missing perf tables), the list_for_each_entry
cursor runs off the end of the list and the subsequent
pstate->pstate != req check dereferences the list head cast to a
struct nvkm_pstate, which is an out-of-bounds read.

Track whether the entry was actually found instead of inspecting the
cursor after the loop.

Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and engine clock control in core")
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
Note: essentially the same fix was posted by Dan Carpenter in 2022 and
never picked up; the bug is still present in drm-misc-next.  Credit for
spotting it goes to him.
Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/

 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 572e63846..42f3709e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -479,13 +479,17 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 		return -ENOSYS;
 
 	if (req != -1 && req != -2) {
+		bool found = false;
+
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (pstate->pstate == req)
+			if (pstate->pstate == req) {
+				found = true;
 				break;
+			}
 			i++;
 		}
 
-		if (pstate->pstate != req)
+		if (!found)
 			return -EINVAL;
 		req = i;
 	}
-- 
2.55.0

