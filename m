Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B5F4C982DC
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0E2DB8952F;
	Fri, 18 Sep 2026 13:16:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="U19kmtsy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 69962482BE;
	Fri, 18 Sep 2026 12:58:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789736329;
 b=LQF41zeG+ylLjDyoAxF3U7inK/Y4BtUEegWqriDV3xG3wiJSkuNI3sm1jS1ip140TKhXg
 rmT1RyQf8aHBQk0Rbdz10+2wcH9c1FfrhIFHguJ5uOzIDuqku1rMgh9Iw9EyDDUZeHHuXNA
 vFRILfMG22R1BikjOsIRtKbTP1IwHcA+On6EwxxRhwqhuagWPiWpGvLUGiwTPxeDh2+ikSY
 jjmdm+IDpGJgeL1fwO+H5v8mV/JzyJtg6Y12PxCqVpmtcrLi2H057E32iAYiei/7GO7QRPM
 0msOjIUzNORSZcxKjqiX3B1M59VUBNSMtrYeT6X+mYyBOx6s8tJzKOp/yeLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789736329; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FZS4CiCQN/3yr16/M/PFmnufnsKta51fgde7Cv0nVKI=;
 b=fbrlT8pBu4pXAIUKJVa2NqCtInAMK3UDwB7YieGMaN0edcCuU65k9X6iK13O5elJG+dhr
 RfP1sT3f4zXd5sjh8cEeHh8hojEJuGN7XcGTZm1G3FWd3/mtT8nH6MFRIGndth/0Gi+3oRF
 y0KSrG3/g/4LuOQ8IvvsHjoOENlbXd79XpMftlCHvqTItxecmby+at2+w5rNc4quSfGQklo
 Lvg4kvitvwBf87sqKNpFFt+Wixd9J41SuRME0az5kfhz/7HTgwuSLCHW+5F1+/EFF59CGO9
 aC9cGXm0LiUX1S/D5gYI7i/1eY3DiFHaR6jniEKph7YcoNOPWCrkY2LtYgzQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B3FF482AD
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 12:58:46 +0000 (UTC)
Received: from mail-wr2-f27.google.com (mail-wr2-f27.google.com
 [74.125.225.91])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A2BD010E8C9
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 13:16:25 +0000 (UTC)
Received: by mail-wr2-f27.google.com with SMTP id
 ffacd0b85a97d-4843796e373so406410f8f.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 06:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737384; x=1790342184;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FZS4CiCQN/3yr16/M/PFmnufnsKta51fgde7Cv0nVKI=;
        b=U19kmtsy2LSHJaiahSILScgioNwcu5MKEX116C4oMziqjs5eJB816DmhxnEX6tTPAd
         RM+uo+bT8PO1/Y/zkgDcOPxPKM2+WkzNKumMr0MJS/nklNqRdLKgWuhXf7/CY7K/DKXi
         M74wCpvCiNqfwpqxrWDHwjAqsxYPkyN6O2yFIqKRrBurd+6rYm46P4gniMZLAq2vfmvW
         53JQtudlL+gs8B7gx0owSdriXHGUpF0MyriLiFwi2vT/jPJEwp4Tqr3KIO/SE/zJKzfb
         qe4hOy4TnqpkOCH8ZZvBEnd3HroL7ASp1uO8fopNP5WANqmhQTYIxJ5nNpcZ7753oQbT
         ZJtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737384; x=1790342184;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FZS4CiCQN/3yr16/M/PFmnufnsKta51fgde7Cv0nVKI=;
        b=uy5WQM2a+2AnkvNYk0D02lNWnsasSXzX2QZXlVDgYJVwgJxHNNiNK94NoYYx7jBF4h
         J3M4Cq8Zq219+SrEBZWTBdOu7bJSuniOGd6Djso25wLvdJGaA6tfC7+/XaNxImLZ8ZFI
         l6p7XEq4KGb5MIsoz2OyV+CCGeoCXD+kU+ZyPSyt2MNzGJIpzZnBWPWLV2FbPnX4EPNq
         rc7jT9JihjvSsQnAqApQQ2ace7guP+B0lTM9QMR0y9XcQ8I3z/swttO30ErUdCTOkoXH
         vpCEYZEwjb6o946AJRTDDVzj7eCiJOKiTALQ8xH1wiGgo+UQyxnOBfjQ2Pj/qbJMozQs
         hU/g==
X-Forwarded-Encrypted: i=1;
 AKwUvBzxwnPQAICLH/UE5B1MoFs+NetybRRz0eKURCNs1UdC+hrvI5KcjLgzjNxdjllsBkdbEs4/9ip0@lists.freedesktop.org
X-Gm-Message-State: AFuF++ns+d/5ADp1HS3hwRCMPidP0MA8yKKK9j3MtYrpsgCfUZXCpyEE
	fAnr86e/GSLSHdVVbMInRh877PbnX6pYUnfC0oDxV+kyn636IFTuNnwx
X-Gm-Gg: AYBFou3AkSy/9knwnjgSqCOJIKG6d1sz8EM/nm6NTik4Or0JV1cIl87atyw1uJ4MuPz
	BB7JAPE5X0QKRP4iFJDww+lLVVEAgr6gBr8Bq5bAB/WTG+2PtwEkSRVBts3HSg9lk3gh02lg2Cp
	1JZCKNHoVlS1INVu3Cnx0vuNBbN+DiC14jJ1+6M6azBH6fZqaQAohopRDDn34sUZP7DXta1AQHJ
	1DONPrwPaDdlfnrKsgTDoL6+kKp8kVx5Zd/FFe45TC+5AufwPSV95//XdDP9qzsIZpEwK8n+Q1E
	A2rBARhfgxe93UzJF/Ge+XMNaFeLq30YS99rfuOls4snsGzGcdSl90pmLQwn3BKCUhZvUi812pe
	rRhTReiX7yl+SwklTxGbF/qsZolSHoxZK+2oGkhy7OGZSegJ6IpEHV0ASOiehZsiAg850ghCGsh
	vUe0+gE5+jfBrtkKVRYZW1cFWt9gOAdTYZf34XKLbZBmBLQBQJ/uo8YT5iiA83a1SocVfJoWzCp
	Jt/7xG48BI=
X-Received: by 2002:a05:6000:70f:b0:487:b50:101c with SMTP id
 ffacd0b85a97d-4871e215a94mr3116370f8f.5.1789737383660;
        Fri, 18 Sep 2026 06:16:23 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:23 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 1/4] drm/nouveau/clk: fix list cursor use after loop in
 nvkm_clk_ustate_update
Date: Fri, 18 Sep 2026 15:16:17 +0200
Message-ID: <20260918131620.405133-2-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: GETZH5SNZQAJYIWEVMD7OOMPJ6ARJKCC
X-Message-ID-Hash: GETZH5SNZQAJYIWEVMD7OOMPJ6ARJKCC
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GETZH5SNZQAJYIWEVMD7OOMPJ6ARJKCC/>
Archived-At: 
 <https://lore.freedesktop.org/20260918131620.405133-2-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Dan Carpenter <dan.carpenter@oracle.com>

If list_for_each_entry() exits without hitting a break then "pstate" is
not a valid pstate pointer.  Introduce a "found" variable instead.

The check is reachable from userspace: nvkm_clk_ustate_update() takes the
pstate id straight from the 'pstate' debugfs file, so requesting an id
that is not in clk->states - or any id at all when the perf tables are
broken and the list is empty - makes the pstate->pstate != req test
dereference the list head cast to a struct nvkm_pstate, which is an
out-of-bounds read.

Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and engine clock control in core")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
[Francesco: rebased on drm-misc-next, expanded the commit message]
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
This is Dan's 2022 patch, reposted with his authorship restored as asked
in the review of v2.  The diff is byte for byte what he sent; the commit
message keeps his original two sentences and adds a paragraph on how the
check is reached from userspace.
Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/

 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 572e63846..5da82db71 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -473,6 +473,7 @@ static int
 nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 {
 	struct nvkm_pstate *pstate;
+	bool found = false;
 	int i = 0;
 
 	if (!clk->allow_reclock)
@@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
 
 	if (req != -1 && req != -2) {
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

