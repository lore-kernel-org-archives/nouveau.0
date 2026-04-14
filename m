Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1C7AF9D0CD
	for <nouveau@archiver.kernel.org>; Tue, 14 Apr 2026 13:38:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91F7910E60C;
	Tue, 14 Apr 2026 13:38:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oYh2yKLD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5DCD845824;
	Tue, 14 Apr 2026 13:27:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776173221;
 b=acmW6y6q0okugIabZ85OQper94112c7KOSY954BSg+07xDLbDTT66B7WN+tWKq+CML67t
 a/wA4X1ZEY+3ozN9PNQRa+xgofNanUCJbQ9aWvqnverT1R9nXuTKb+PNrHMXhwllHGSh785
 TwzIFNMOqncj87MXGmtkIcHCp1RnI7A7RDk6tDZePIt0DK7qap1Tt9PzYsXChb++0QGFqee
 VU5qAB6FgxTnJdeMguZeYhhe/lr+o5q+HilJoL2zcXvsMhqXtDhyV3YhDRw+h+0/mF0+dHJ
 DXRJpsarMZnSo7i5qsK9OqZAq+TZunDSV8sJLxU+jbHNKdOIZnelGl3iOjLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776173221; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jPQgHGlu738TW4p3sn6dmJsF2FR5mcKoyvw5jgwb5JQ=;
 b=JFSQyjQ7/eR/R+cz5Rx7lmkFShfaJlSm015+VXpj5+3koPp2kLfWBj9lrWV+MZyT8G3tI
 KGC/0EwFbL5Wru+jXnwsrAAZnGt3yiwjnCWtqKxvO92dhXilvfgTc0P7FBd/3zEUVYDHiv5
 7KsmYbmVUPC2ktXM8fpOqAcpOwunipppTUqm9Gd/pSsH1xOfG0EAGZIlibvaMllUJDyq6VE
 e1H5kNL9VI1IkhwByHADFYwJuGw6E5pQVCUUUf8UhOFeiLH7e+l2U9fLokk1esTrKciAsUF
 uznhTB/ND16z7HpahUyapvravzBOak8Me7jnI5cHSmVLXYqTUYMfAz/8jBZQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1117B44894
	for <nouveau@lists.freedesktop.org>; Tue, 14 Apr 2026 13:26:58 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D4F6710E605;
	Tue, 14 Apr 2026 13:38:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C36040B45;
	Tue, 14 Apr 2026 13:38:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91BDC19425;
	Tue, 14 Apr 2026 13:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776173928;
	bh=GTGHJZGes2K6qYkbs1XoHgFnd4tqhzJFVwu+I96xVSw=;
	h=From:To:Cc:Subject:Date:From;
	b=oYh2yKLDQuBYlrZo+HE8rcRqodd4kee/tJmsVayvFWq5P9O9bD+udQ8ScYWibQbhA
	 vAksCKGkbfGNO+BqIudp9hORvYWgszOZDi/bj2eFdO397dzYyXYXS9qfQ/ODtemLVI
	 DVAHNRwYWR8igBhm2+N8L8UUABq0DFvgenacTnigWs+4f8/8AHuEEZ6RIgh1tiEI8f
	 bv3s0c2MXGYqV6CZAfFpEbK7nJR5cPcwnjDrPfMkgSm78l3zngWE6Y0E48o1pjUNnk
	 Q+Bi2myAArbCgzcDsiGLi8+PimsfDuiaSjPD5hDQs2qUvZVs3h+m+Be+HqD+b2wE2/
	 gMjWQUr+EsTFQ==
From: Philipp Stanner <phasta@kernel.org>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
	Dave Airlie <airlied@redhat.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>
Subject: [PATCH 1/2] drm/sched: Make drm_sched_entity_kill() a public function
Date: Tue, 14 Apr 2026 15:37:34 +0200
Message-ID: <20260414133734.130115-2-phasta@kernel.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 55UAN5DGFUOZCFPQB4VMGQGZSL4V7645
X-Message-ID-Hash: 55UAN5DGFUOZCFPQB4VMGQGZSL4V7645
X-MailFrom: phasta@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/55UAN5DGFUOZCFPQB4VMGQGZSL4V7645/>
Archived-At: 
 <https://lore.freedesktop.org/20260414133734.130115-2-phasta@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Some drivers do not care on teardown whether the last jobs pending in an
entity are actually executed before teardown completed. For such
scenarios, drm_sched_entity_flush() is not the ideal function.

Make drm_sched_entity_kill() public for that use-case and update the
documentation.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++++--
 include/drm/gpu_scheduler.h              |  1 +
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
index 61a4818cc87b..16c525b26c08 100644
--- a/drivers/gpu/drm/scheduler/sched_entity.c
+++ b/drivers/gpu/drm/scheduler/sched_entity.c
@@ -267,8 +267,16 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
 	schedule_work(&job->work);
 }
 
-/* Remove the entity from the scheduler and kill all pending jobs */
-static void drm_sched_entity_kill(struct drm_sched_entity *entity)
+/**
+ * drm_sched_entity_kill - kill an entities pending jobs and remove it
+ * @entity: the entity to kill
+ *
+ * Removes the entity from the scheduler and kills all pending jobs.
+ *
+ * This function should be used over drm_sched_entity_flush() if it is not
+ * desired to actually wait for all pending jobs to finish.
+ */
+void drm_sched_entity_kill(struct drm_sched_entity *entity)
 {
 	struct drm_sched_job *job;
 	struct dma_fence *prev;
@@ -306,6 +314,7 @@ static void drm_sched_entity_kill(struct drm_sched_entity *entity)
 	}
 	dma_fence_put(prev);
 }
+EXPORT_SYMBOL(drm_sched_entity_kill);
 
 /**
  * drm_sched_entity_flush - Flush a context entity
diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
index 53417baebd49..d61c19e78182 100644
--- a/include/drm/gpu_scheduler.h
+++ b/include/drm/gpu_scheduler.h
@@ -693,6 +693,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
 			  unsigned int num_sched_list,
 			  atomic_t *guilty);
 long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
+void drm_sched_entity_kill(struct drm_sched_entity *entity);
 void drm_sched_entity_fini(struct drm_sched_entity *entity);
 void drm_sched_entity_destroy(struct drm_sched_entity *entity);
 void drm_sched_entity_set_priority(struct drm_sched_entity *entity,
-- 
2.49.0

