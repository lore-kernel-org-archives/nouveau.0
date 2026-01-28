Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5BBD25B46
	for <nouveau@archiver.kernel.org>; Wed, 28 Jan 2026 11:08:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 366BC10E68B;
	Wed, 28 Jan 2026 11:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="VojS+KkN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2032440ACC;
	Wed, 28 Jan 2026 10:59:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769597972;
 b=rNnJLFHDqlWiq4IhN58SNVVMpvZlh3R9ctUkdnN7gKKBCbwiKYD0BufzO43EmfQAfb/b+
 BnOLWe76JjKff/7Nai2ZDqHjyGsa3EZRmUHm1TmCu0hq/j5mmcc+DuH9Lz15K7G3xVjwUD1
 EQZnFyyF9l7i9qAGY6GH7fA/m6FS6G+iyrtMfykK6eOLLRQuI37kMizN+RBJYDOaOG7NAEJ
 Qt4YqNUXOTPAMNuiG9qXgE9TFwiznMStP/bR8y40iPst00DPW1/X/uN2yO59WVYCq6y7+Ks
 DTez5mJNw1UB6HfnouX9q+OomoGVoS/FMSL7AwgiMNVC4wDjBMsotI/nnhEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769597972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4xj33rqoeOEGIlACIPZA79bATd+ipQjB9+w3hfaab+A=;
 b=tZHMI8fciBLBEsPWAVAKIr2rQ0dRwlt72N+oexeCacpLGIjMGQCGlkFH0Dgc8maScGtXH
 XVG1K5DWuMV7p58hIiokchZDSMq6aV4vtrpuR+2AEYWhimtTO+LlyH6Ap7fxG674FfQmlQA
 7ioILZfw7kaq2dbHyTDuZiUDVLCvmeF76uIKhF1HslEq7xX2vh6X26H/owNrVDPN0PBbbmW
 5q7JSkqi+JjUorcO8arlFNR8h1Uj7TSFTo5qbibcc0DJYRlAqGWNsbmUkQpsX/4+Vlg0sXp
 YKWuVgDgsvLwC9GHsKkvIIVUDuco1vtfcItJ7D0hzlnsVpM4Kiuu7hRReYRg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=igalia.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=igalia.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=igalia.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=igalia.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F45D40803
	for <nouveau@lists.freedesktop.org>; Wed, 28 Jan 2026 10:59:27 +0000 (UTC)
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3BED010E66F;
	Wed, 28 Jan 2026 11:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=4xj33rqoeOEGIlACIPZA79bATd+ipQjB9+w3hfaab+A=; b=VojS+KkNkRUBSJVZ1aRTb3r+Vh
	WZdli0OVTEwk0kPES4OoZiyqHVawe81hkQCVE6oNKTiCNfKQKhxRZhYceIdua9iNcZbdPuJsW+hcl
	UOsr6ajOKjut0sz3AswOvkTWFFJK4+eIXxvDWCxP0qlaDQD7TdkcCp5Xww5nj+Kpj+JJ9ok5Qfido
	yuRWVBR3GryekbW3zBm20D7qWeane5To2+/TGrpTWfu9sMW+NfBri8TQldrS6ZOXm6cXnQ4+Mz+Zu
	PVjc7JPnfEp4Zi3qVRNAqcLmLlEoSvJjF3E7/BseiUE3aY1YmH1i3VB6xmO3iWoxjtuhbXevxYmyH
	5ddbE52w==;
Received: from [90.240.106.137] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1vl3PP-00AqfI-GC; Wed, 28 Jan 2026 12:08:27 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
To: amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 25/31] drm/nouveau: Remove drm_sched_init_args->num_rqs
 usage
Date: Wed, 28 Jan 2026 11:08:00 +0000
Message-ID: <20260128110806.38350-26-tvrtko.ursulin@igalia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
References: <20260128110806.38350-1-tvrtko.ursulin@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: I77BHWQTQ6KDU2PH6D35L5LI5XWR6JRC
X-Message-ID-Hash: I77BHWQTQ6KDU2PH6D35L5LI5XWR6JRC
X-MailFrom: tvrtko.ursulin@igalia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I77BHWQTQ6KDU2PH6D35L5LI5XWR6JRC/>
Archived-At: 
 <https://lore.freedesktop.org/20260128110806.38350-26-tvrtko.ursulin@igalia.com/>
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
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index a7bf539e5d86..dce8c5c9bec6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -407,7 +407,6 @@ nouveau_sched_init(struct nouveau_sched *sched, struct nouveau_drm *drm,
 	struct drm_sched_entity *entity = &sched->entity;
 	struct drm_sched_init_args args = {
 		.ops = &nouveau_sched_ops,
-		.num_rqs = DRM_SCHED_PRIORITY_COUNT,
 		.credit_limit = credit_limit,
 		.timeout = msecs_to_jiffies(NOUVEAU_SCHED_JOB_TIMEOUT_MS),
 		.name = "nouveau_sched",
-- 
2.52.0

