Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51912F43698
	for <nouveau@archiver.kernel.org>; Fri, 17 Apr 2026 10:38:29 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E3AA610EA30;
	Fri, 17 Apr 2026 10:38:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="T/YkNMVP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 408B4459BD;
	Fri, 17 Apr 2026 10:26:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776421574;
 b=i16RBDIGZCuRaDouHR3Y0a0EJV9W7D3F3sC/9mxNB/d1ENbtO3Dwc3iunHWFhhUp6nYA1
 uSJxmn2rNJoa8wPcZTnMiEPxcVXeKvNvilJ5/kdp9I/NfT5PR/h7nRHbWbS6+tQ9bcUNmtx
 L6xOHzumD7n2NmL9avD6qcyRf6YuACCSA58fQqd80WBm2Lqu941a3BDdigizFcB2NqGAaHQ
 cWA82NLDi3Vv3yu2BxuTpGK982+l6FYcxlnb2RAiRVOK6wa/SPpO97EOwpSalgeMGnRo7Lk
 KSuZeXz/f9mMHk3vrP0dG1M5+hyAeoc9+ZRboQIhQDeFBqQj73PmDjpzypPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776421574; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=RQTUcL1I/8jadncAL2XKGoKxgkmVYQD7qHlBDYb7ynk=;
 b=Rs+reXol7ggYaLF9aGJay+uG2ZH43mOewqbqAKsZMGhtl6zkYiEM5OEqd+RYI7ZDOPTCV
 psvEEV9bFIG2nR8pe6+Jai6gy5quaDgCwYTeGjt42l2gAYToBW69MLfNIXwmiybXBTr3sZs
 FOU1tpcR4sgUlhPrDMaMagaiaia5IF19eSmfbw2376x6KzFpBbLaxm1WNMbwdsWXvz38rDj
 RKDUyObazHREBU18ShVvuiYovRCXcRTB6H1y4SBEE5/4rSS7/c/P21VcVl7bl+UFmDcZG9O
 RiNysIQWcuBSdrkOuyHXUY6Nwh0mqmAQJlrPQnuEZPCJw5VtV0OgPEXUdAzA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BDBE5452EE
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 10:26:10 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0BCF910EA17;
	Fri, 17 Apr 2026 10:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=RQTUcL1I/8jadncAL2XKGoKxgkmVYQD7qHlBDYb7ynk=; b=T/YkNMVP8AGMm1QSBA0TClh+lz
	WgqqaVyeNIkjF8lJowNfRc+5xpXfsFWOR2Adp6IgD8f1dOr4mKVD28CubLl0/dbNcp1RAI87Sb7ql
	KVuHqCNJeDC37fR1azUFu97/0aEma9kI0bsGhP2BebY8ll5GJnIj1XUFdYJ0DT+9xIT0pVrfUTYxb
	KeqhYmADzD1HjxN5Yct/nHH3EDloscZLC/wCIhXXKwaODW+x6Pky+n0UiPRYvTMunbc37VmvmyYNw
	jT8lPb5Z5iPp+Mx5aG9S2dmVS2NH9vjobYg4jahKZHTQiG88j6jAS5MDDYbl7h/SRyxLf14Cy3EyI
	Py2eZ+eQ==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wDgaM-00HPU1-8b; Fri, 17 Apr 2026 12:38:06 +0200
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 23/29] drm/nouveau: Remove drm_sched_init_args->num_rqs
 usage
Date: Fri, 17 Apr 2026 11:37:38 +0100
Message-ID: <20260417103744.76020-24-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260417103744.76020-1-tvrtko.ursulin@igalia.com>
References: <20260417103744.76020-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: C242AWRFDOL6PBM6K56FATQFNQW6VI6V
X-Message-ID-Hash: C242AWRFDOL6PBM6K56FATQFNQW6VI6V
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-xe@lists.freedesktop.org, kernel-dev@igalia.com,
 Danilo Krummrich <dakr@kernel.org>, Philipp Stanner <phasta@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C242AWRFDOL6PBM6K56FATQFNQW6VI6V/>
Archived-At: 
 <https://lore.freedesktop.org/20260417103744.76020-24-tvrtko.ursulin@igalia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Remove member no longer used by the scheduler core.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: nouveau@lists.freedesktop.org
Reviewed-by: Lyude Paul <lyude@redhat.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 5546be488795..179edf90a531 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -405,7 +405,6 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	struct drm_sched_entity *entity = &sched->entity;
 	struct drm_sched_init_args args = {
 		.ops = &nouveau_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = credit_limit,
 		.timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
 		.name = "nouveau_sched",
-- 
2.52.0

