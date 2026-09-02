Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39BCAC88E50
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 02:59:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0F6D810E409;
	Sat, 12 Sep 2026 02:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="AHTobRAD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B69E246DCD;
	Sat, 12 Sep 2026 02:42:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789180926;
 b=VbBZDno35nV/mF6YkikVHXa+vFICC/vEtPIO64fVJDeV2d23TzCGn1AJodAOgj4+rQedH
 yhtq6GAUEc2zjrF/O7fHL6/GNcv260lPFAPQv5wt3rvlT5+Qb22I9QUUapCQl/cB1pxKH3L
 TLyGo9vwWlPVGgkzXoE4VVrNb6CkiXpFV2EdJ+XvKpHstkphBSag+m+hA5khkO/rtFCkG3a
 jL7n0MJY1LZvzHZ5gzJg5g9FkYdgJjZzTSZkPAEGyREciQli+ulkoxlXCub2Q5/vIlxQIH0
 XZowcXGXu7yILlNmKpezpAH8PQHXh+6duyczyS0WW2dpUfdm1ANHEYpNyfXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789180926; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wt+LQiGu1u46A6j6YSEB/1Vma9hmj220lRwz/yCk9to=;
 b=hBtN7rOq7xbgIvRGdc+w3CusVwajj4MOyp2twPVZIKCZXa57CFZ8d5ORNkI9il+XpnlF8
 W4lIiiDWPJaBNZnWPM2pZQIQDkYoVd7pvGMkhq2Y3ICdOrkXojj5/qpnQiWMu4ickvs1JNm
 aP2BiknLSnjXZWC50n29XlJH/L1V7TvdDHxHfyPEXoEeAHEjEkSwLy+old/1ftcO5H6yerr
 FshtTnZynfLEPKDjx8GAzrujM3cSV65z8Dtx6bfVXGARXFyM9g09yFeNvIJnoyxo/CaxLb2
 LAYJeeQajozdxhy3SK+jWszgif9W2BJDspD2m5tlZRr8Z3MkoTsBBgr6UKKw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C1A7F47DC7
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:48:49 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C82A310E32A
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 01:27:22 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-398e9698a70so511873a91.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 01 Sep 2026 18:27:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788312442; x=1788917242;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wt+LQiGu1u46A6j6YSEB/1Vma9hmj220lRwz/yCk9to=;
        b=AHTobRADICjK8MGFFf3y0ueDIiqwkU+UCuMoxZX2X+RU/vnLP+zfbswsQm2gvGH+bT
         RfE7b+YGei+yCVNeoegDyM/QX73j/OcxVMSKfI0LyjCwONuxNgQB+eAeln7oWWsDjk1Q
         mS6tblnOgU0BoPF8RPHCB4uut56bF+YFwiV9Cv6jMkn2g69ZyAa6PNGR8vOJVFZK6z77
         5bgRSpdN/pq9wqg9uXz2Vo1axa8Gy2LMyc+WlR73C/vYEb0RLghGfvUTF+HTAnrr8bHk
         xMz6SHZ/yBxOx/mdExZeoetKqrjMpEihgbXW6XOYfJ+5zPFTifXIUpiox9DV81Gre2ee
         GeUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788312442; x=1788917242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wt+LQiGu1u46A6j6YSEB/1Vma9hmj220lRwz/yCk9to=;
        b=I0n/XY3Nql6YB5ufpP12O9ujsPit6/N5owgbgX/1czfuqCaamo/DjKDUUKOG9CU8fi
         FbTaqG5iEy/VOCAtMRTDvCE29PECbxDffR8paFIebJdVyCQcgz5NC0wzJ3Ay4dLYUhFI
         JZaSh1Hc2Q8N6/48uUtJ84gqzcWeGwo0NdNNJTBHlCUDed+HMah9osWw1cmyiqDZFE14
         bcroWfXDudvTbRdJY//peFNQzfpl0ZcdLMX564IzFw/Tw7CIcC7MoZEGUlxU78dpDrv0
         3IOv3swSAjF8SXJBlbvrWSQG+UIVRImz2T3OTKC9HhoatRCD7oMWwfEqIrRbQq5Z+wDp
         wv6g==
X-Forwarded-Encrypted: i=1;
 AKwUvBxecYByTMYwqYtLMzszToAfPgKYUeiUskapIOA3ZfcR1idivZNABuVFb79c5cxGNJdc5fpQ0U4X@lists.freedesktop.org
X-Gm-Message-State: AFuF++m8PhcsoNPAd5zAhFAMcwIG7WVMlfsRE5MhWuiumHVpRA8Nr7b8
	nqfPh4iRleKKe+rqM2/uOMxMyHGkPJy7JMiRg3w7ZRkSdlHhzShB99I=
X-Gm-Gg: AYBFou34Bp6EJU6sZ6d2Q9GCfK/7020Ak3JiSgH+sCdN/hDKxj6Y1VXHQEDjsdZdEgy
	ckmfYoZc7gvg8DiCQbvsztiaoAUw5WPN6AvtHVxzTw3+9nJVrxmgNiZGce98doqolkUOR3SqKLv
	S3BICp2K9vYYshERDjbDB+FiwqB/x+cCuO6PsizmGHv8lYnKzCBsT1qowCGe+w6eLlP761nm6TC
	nVWnT4x+XkNRD4fCL+5KDYtnc4rxg47/flyDBcOMknISgqo/zcHqXNB+EgwIn6ZNY51x3fAlYl1
	7/9AVcgnOCsYkH/S2bfsRW5ki3vloxjLOwjoZeVPPoqHz8IymiGegL1raEecMh0y6fCUDBxFLOB
	HnEfCSoUI2TiZ9w8ZEMkFXNcFbdX9edMyEl07mnxgsLPBuaFMV0oWZHau53BKaEojBOtSQXjOs6
	9p/s7E2RJaPXzpbTPj9iWR4cHDzFcAAg9fOB+48QjKGydG5tiVp8p64RGQ7koHwabP9KQdKG0Ay
	IHINFhqB1e8DCr8wlX0jtg1CnU3
X-Received: by 2002:a17:90b:288a:b0:380:21b7:e727 with SMTP id
 98e67ed59e1d1-39aee0848bbmr1717405a91.14.1788312442070;
        Tue, 01 Sep 2026 18:27:22 -0700 (PDT)
Received: from MalHyuk.localdomain ([211.201.32.99])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3990d7bb9d7sm8719236a91.15.2026.09.01.18.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 18:27:21 -0700 (PDT)
From: "Jonghyuk Kim(MalHyuk)" <malhyuk97@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau: RCU-free the scheduler-containing nouveau_sched
Date: Wed,  2 Sep 2026 10:27:16 +0900
Message-ID: <20260902012717.880724-1-malhyuk97@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: malhyuk97@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: HQC7V62TG2XUY3EVW3QDVSN5BMDS2MTT
X-Message-ID-Hash: HQC7V62TG2XUY3EVW3QDVSN5BMDS2MTT
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:42:04 +0000
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HQC7V62TG2XUY3EVW3QDVSN5BMDS2MTT/>
Archived-At: 
 <https://lore.freedesktop.org/20260902012717.880724-1-malhyuk97@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

struct nouveau_sched embeds a struct drm_gpu_scheduler (base).
nouveau_sched_destroy() calls nouveau_sched_fini() (which does
drm_sched_fini(&sched->base)) and then frees the object with plain
kfree(sched).

drm_sched_fence_get_timeline_name() returns fence->sched->name, and the
scheduler fence keeps a .release callback so it is not ops-detached on
signalling.  A finished fence exported to userspace via drm_syncobj /
sync_file therefore keeps pointing at &sched->base after nouveau_sched_destroy(),
and a later get_timeline_name() -- reachable unprivileged through
SYNC_IOC_FILE_INFO -- dereferences freed memory (KASAN slab-use-after-free
read).

Per the dma-fence lifetime contract the exporter must keep the data backing a
signalled fence alive for an RCU grace period.  Free the scheduler-containing
object with kfree_rcu() instead of kfree().

Fixes: 5f03a507b29e ("drm/nouveau: implement 1:1 scheduler - entity relationship")
Cc: stable@vger.kernel.org
Signed-off-by: Jonghyuk Kim(MalHyuk) <malhyuk97@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_sched.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.c b/drivers/gpu/drm/nouveau/nouveau_sched.c
index 2cbae003d6de..48dbb851df2f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.c
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.c
@@ -516,7 +516,7 @@ nouveau_sched_destroy(struct nouveau_sched **psched)
 	struct nouveau_sched *sched = *psched;
 
 	nouveau_sched_fini(sched);
-	kfree(sched);
+	kfree_rcu(sched, rcu);
 
 	*psched = NULL;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_sched.h b/drivers/gpu/drm/nouveau/nouveau_sched.h
index 20cd1da8db73..51ce8dcf6285 100644
--- a/drivers/gpu/drm/nouveau/nouveau_sched.h
+++ b/drivers/gpu/drm/nouveau/nouveau_sched.h
@@ -98,6 +98,7 @@ void nouveau_job_free(struct nouveau_job *job);
 
 struct nouveau_sched {
 	struct drm_gpu_scheduler base;
+	struct rcu_head rcu;
 	struct drm_sched_entity entity;
 	struct workqueue_struct *wq;
 	struct mutex mutex;
