Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE87EC43458
	for <nouveau@archiver.kernel.org>; Sun, 12 Jul 2026 12:37:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C7A1710E46E;
	Sun, 12 Jul 2026 12:37:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gd6Jxw3k";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 41B3640B25;
	Sun, 12 Jul 2026 12:22:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783858954;
 b=Jd4pJdZqnayqFqhctAIAfu5wlZZczPbSDR3+0R4vuPAZKhheeppOWpfR3Pnfa7iqThJ4B
 NWbTvlhH1NDviz23nmeNkGSE/Xv6xtlsW6V7N47RYu2OwUbu8gVUNATHvRtBDXe+1JdCojy
 7vsUmRhToXqB1Ol5d1XOTZu+C/OnhW2OkC5XLGTzOgHI9yl6NZAFSoNSNxsVN4iuPcmcJfc
 GUqsotJsIhDSzEgae6W37sdiA2ahmB46cWD++N8ctOv7GRvGRAfKLfT3hSOpq/ne/VBo+75
 6qmhcovNC3amM1Ky/XU1YPj+a9FSyRNTEpsjZO2MaqtwAo4xvN5Jb/misI2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783858954; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CJi+7sCg+GNZFhEJVD2Hmu/wR2anVVL7EeD+/Q0E5aU=;
 b=VgQwhr7c9W3rl5tDc18071L6pEtQpe71yCnEG80PVXINkIohH4PSi8xyi7bfIqtHSr+jx
 o8HyvLGxn+aeNFnvRlkUmpde4CseaPG5muZQv4w1+QcbUM+sE/F5qy3mjh/MjWVHc48ElvH
 2RUjkwCdCSbPonOgkt/0xJC7fFqJCog+WbLpSnrBrzpPd6N9thOJoMYXPaPD2+Pz6PO+U2I
 rNH60mZYf7dij4/ZZN5dznwt704+a1RzWUVQdgNpi6XqKKzT4jSIV582rV2gy1mEb0ltk0S
 cXputdAk27VXNL9q/op31LYBw5AWZEE/19rC4N7F+PBrxhg2iQG2j4ldsRpw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B0A43400A8
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:22:31 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26B5210E45E
	for <nouveau@lists.freedesktop.org>; Sun, 12 Jul 2026 12:37:40 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-493c733f15aso22799315e9.0
        for <nouveau@lists.freedesktop.org>;
 Sun, 12 Jul 2026 05:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783859858; x=1784464658;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CJi+7sCg+GNZFhEJVD2Hmu/wR2anVVL7EeD+/Q0E5aU=;
        b=gd6Jxw3kS/XKxl0DgsthweK4b0xU3FQigz2ENF3SsZBQGKVTxJymByyWIae7If+gOE
         hZNo6o1hugpmNnbRrDZmkc2ozGEJImtMJuELKfr/x/wNu8vmpILazFj7Y2Tr8ktLjUJK
         a2Gi0gLbpXrsKT8WtH1eK62xyeu17/1RqKOdP6knzoOaV49mGkF8gGp9guQJYQgAorw8
         pcW+QsWwa+Hg8GbYagQJna8LYE88YaDCfRMF9G4DLxd+zYAmKr7+H8LHtiug4DoV14Pp
         39LYBdVDrPSD6Pj62Oo+ONikZPtxIP3ADUCxd8RCc/Gejz0n7n/DmQxU3xTIc3HvHIq1
         LS0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783859858; x=1784464658;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CJi+7sCg+GNZFhEJVD2Hmu/wR2anVVL7EeD+/Q0E5aU=;
        b=JKmkqxGeVlToS+BK4ehQMZ6Xsj3qKbJd0ot4A9GbRyYLG/9TLu5/aorDsTVn3TmCTT
         V9Klaq0ZChvLl7HocNYtAd02tm1YGOo0DreU/tDc9d9QVlmtwMnuUYechd6VLnSfw44a
         yWy807bhOuOmsIi76j7/cEkObTf73j/wyKuVzAEJXsyZQDv2VmFesY+1TjjMr+21FXUS
         htdjl4oJ/wDLN4YvyvppwED3ONthrzRkBXXyXmFNCzcRf/OH3xdp+uBZudOgNm7I4InI
         be6JPNdWmlRGRogHEiEHm/7L40aKo6wH81hRuTiv8k+ZOkbtTEeeEu5ha7MA5y9k2EP1
         m+aA==
X-Forwarded-Encrypted: i=1;
 AHgh+RokmoqCJnfbD4wQmGmiDQfbsdWrSpJcFs4B20I1y8kkuiAeWjrw62MMrTd/aCI8RIPuMO4fu4JA@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzxPuBlktpeT83McmPr5YM4PudgFfQbfOwrWUfgr5WUUBVXU3HA
	ibWV6yabWnHRhOHBFsBpLNgMO0JPdp7SBxTqXYMbGPfUnEo2tcLfn5hf
X-Gm-Gg: AfdE7cmQHhci3HRNzxeQymc/owFl7z1k+UAD7PFUQgtIXufxwRcEK84JPTJhOoRSkRx
	4QUVuwa8TeCZpJbUc1wRPlLv/mk5A/s79cCfF3jx4aTFHsitRblK7oR1gRv6qoyNovLztvVPUWb
	pE5/Qbg/Q7nEQu0qTCRwNBl8YUXil3IlOGHRBV0LWoDX2aiJEPC3Mqy0E7LLTMSmohuH4NplOd8
	BMu3TbhKCX/SHopVdc2WYSvjHdrmsMfNTvsnxye6MJxDQ3MoFeNERKEa2KOQitYLISramSamcqq
	TBtH0+oeyBCz4b0pBwxRzbXaupfje0vw2Uf6hcX9ZQjQUrxRnILtJC/b38+ddl6uOGwUsBB8s6V
	RaI4F1qdQxRLIQheJUQZwrJfkf2TUwY+xtJlL/CQumVwea8S85QUT22z0eYkph0osNRy9jGdVD5
	D1Wu1WH4V6SibJCPg=
X-Received: by 2002:a05:600c:6d48:b0:490:9588:bdb6 with SMTP id
 5b1f17b1804b1-493f88389c0mr40261455e9.33.1783859858299;
        Sun, 12 Jul 2026 05:37:38 -0700 (PDT)
Received: from fra-x8664 ([2a01:e11:8000:43b0:96d6:566b:35c:7b8c])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-493eb6f3c42sm280280485e9.1.2026.07.12.05.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 05:37:37 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/4] drm/nouveau/device: don't use the pstate cursor after
 the loop
Date: Sun, 12 Jul 2026 14:36:15 +0200
Message-ID: <20260712123616.1180830-4-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260712123616.1180830-1-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: MVPDE6GUSXWDO7GPASUJNNXY4TEOV35C
X-Message-ID-Hash: MVPDE6GUSXWDO7GPASUJNNXY4TEOV35C
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MVPDE6GUSXWDO7GPASUJNNXY4TEOV35C/>
Archived-At: 
 <https://lore.freedesktop.org/20260712123616.1180830-4-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_control_mthd_pstate_attr() looks up the pstate at the index supplied
by userspace by walking clk->states, and then keeps using the
list_for_each_entry cursor after the loop.  This is not triggerable today:
the function already rejects args->v0.state >= clk->state_nr before the
loop, and clk->state_nr is kept in sync with the number of entries on
clk->states, so the lookup always breaks on a real entry.

Should the loop ever run to completion, the cursor would point at the list
head rather than at a pstate, and the pstate->base.domain[] read and the
walk of pstate->list that follow would read past it.  Rather than leave
that trap in place, track whether the entry was found and return -EINVAL if
it was not, like the other lookup failures in this function.

No functional change.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
index f2e9a0626..28702741a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/ctrl.c
@@ -74,6 +74,7 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 	const struct nvkm_domain *domain;
 	struct nvkm_pstate *pstate;
 	struct nvkm_cstate *cstate;
+	bool found = false;
 	int i = 0, j = -1;
 	u32 lo, hi;
 	int ret = -ENOSYS;
@@ -104,10 +105,15 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 
 	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (i++ == args->v0.state)
+			if (i++ == args->v0.state) {
+				found = true;
 				break;
+			}
 		}
 
+		if (!found)
+			return -EINVAL;
+
 		lo = pstate->base.domain[domain->name];
 		hi = lo;
 		list_for_each_entry(cstate, &pstate->list, head) {
-- 
2.55.0

