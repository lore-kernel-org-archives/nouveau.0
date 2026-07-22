Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC6C3C4453F
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:44:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB9B10EEC0;
	Wed, 22 Jul 2026 21:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="KmzDszZN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DC8124731C;
	Wed, 22 Jul 2026 21:29:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755766;
 b=AShA6Rykz16mjQUIqx5mKP+kfe2wsbGpuKaMJby/7foq+O9JZnQp49VK0TRf3zqzQzybj
 k78MrrHcoZQ+5mEWYLpHbYG9rVzLLCzFynVOS2I1KJae993zFQpqiwO9Opo7fnRbPoTS1Hi
 TfdoyBBPCYvQLsnpcOUPbWjvb6lAkGzekW8jaPOVGfk/W6huMUpbQEwhNnRgNJf3AKHMPYP
 CTMJFuCuvlIA7P/vegwRmzeORykfQIKiGha3tg20hdWRz/ga9/WbH8aQzNQVg1V1UAovAXO
 ed7PD1S/EVquVsUU7mx2qu2ZPatXRZTTMhiERKlcVrcIk8/ygjvWxLqyRUIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755766; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
 b=wnWH1m5LvR1voT6IamC+R4XW/FjJqKfs+rl+HA3LR2bNPK/R22tY92hP3AIBts1akMMQ+
 WrNf6u1pY67x+i3XeQtg3aQMvLmUO1xgxtrXwhpnEePSHTmhO6eU6UoRMP74iORVYG+Z5I9
 JhHs82vKDrm2PBaI5fytiYf0W7+s1s/MpoFLpOPD2ExUtZhoit01UrNdwZcki9z2gdeP87C
 L6JYca+dSEMELdPcq0ogR7LV92n5feT8Ltrfdqa2h7XEySm2nPgQLzcA8Li0UJgjz9qlEx9
 Pp+kpOkHsP9cIdpU3Ne0SCSJxW7VfAkw0yP3lbpSco7x82j0bo1H4IpShX8Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 48112472CC
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A3E0510EED1
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:55 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-84874b52eabso12804477b3a.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756695; x=1785361495;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=KmzDszZNxzpzdxLE7K0gm71K8vtZ79VDkbw2FKhV09Y6zsHW9KTF1GhF/crpYzCi7o
         DvixbWlHrZzHbRcHJnq1dEXgmikSl7+AU2MdHbwkcObpyfM2YVOH6ZnN8teeT0Ccvx1T
         mmS/S7FkD1wZDWEzbeVjs2TAbXM8p42WOd31Ql1b26/xiC9LZO15SbC7IYB7qjbUKyqt
         d7uY6ui0XW3tNrggkVF19DDqyYrVvLzlWighUE2iga6IdNfRvS6wUewBuQyvzEHdNkaO
         uAO7G6jH4ZCjGovxpdyNtGoLi8Q+JqLQvl7sc88uoqnUtTBI1d6bD3f6dsKPawmCpywH
         U01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756695; x=1785361495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=EfLfOKsnItMBHLXwJayWyzndmQ+vVCq4XeEkrjiwxmvliVgOLDjkXh7xZsHfZUkwON
         ObPWu6MrUbn68PSL2BOnCFeyQx3ktbt5WtRBm9CupYzqE8Y7J+dIS7Ql/SoCihV24BWR
         QGk/zJiLEZot2KzMpGTuMvGCRMJ0nQoKlAUkP+h/sycg4p2hDjoz1rkjOouhbu9yoLJr
         jG7l+4ZHdJy6RHkBqD5C1pkKT0O+91PGvl5DVLTpJpoJSUm/WSTeJpXZhlRITw+vJMho
         zvrZJmnnMkv6Pf3RP3sDfnewyXfMv4BYwvKoBM7typR1agAslv9jQvYo6Ro+cpioIOba
         l3Xg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0V0opsARIRcWKH7HRPdmd7mAnt2MlotJ7OM/aN5UXznz6sZEgDgnz70FgZ/Pzgf1oA5kcsZiq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysfB7v44zt0G7cgmEwsFuluowYgI71l+qWQawdQGPcm1M+eBgE
	6aHknX5Vj5IeCvNvO0gGXxSEAvNjVHKWn3Zw04g7K6MoMj5eSNC+pewcBk2yBFaM
X-Gm-Gg: AR+sD11DOxEqeYVjjkTYXkN6LJ/yDvDkKmFMfD+e9Zg5UY6reD0gjC43ERlDvF8v2zH
	KpXAroHf8PKW9IvcHMgX3kPcprp7zaY/Js93hl7NZRPhVz2YLSMZ/ebMtqFhcDz5HxfADBZMSAH
	mjtUvib/Vq0bbWSiYczV5bzUniIm36u5UoE3MYXwF9uSSr1Th7d4wEdKIKBvO92hAQw8lxmx72S
	1S/4IsYPc8Di5bcLwAaVPPKJAuS6ALm2byoPy8fQFn0oEff7v/L36NEJMC8Y/XhDPGaNJqJRX4W
	hYGy2xC2tkcIqmuwlb7ghV/fzVAOupKCuOj1F1OGq2XcgpcoeUv5iIih72hzKXHHy9TMZzlU4H0
	3V2D5nMuGxgFC0mqrEncQbLVx70Y87O0j0JnHk4Ka86zkFuIMdy9ZRzPSOWaROdo7qBBm9qEBpL
	vLYq8JAOI7b9ItHxX1gc6qANtFw0pB7Epp8NzTnRVLE6pF6YMG
X-Received: by 2002:a05:6a00:852:b0:848:46ea:bbe7 with SMTP id
 d2e1a72fcca58-84e2bc6b5d6mr673956b3a.19.1784756695183;
        Wed, 22 Jul 2026 14:44:55 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:54 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:27 -0700
Subject: [PATCH v10 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-5-606464dd601a@gmail.com>
References: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
In-Reply-To: <20260722-hmm-v10-v1-0-606464dd601a@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Shuah Khan <shuah@kernel.org>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Min Ma <mamin506@gmail.com>, Lizhi Hou <lizhi.hou@amd.com>,
 Oded Gabbay <ogabbay@kernel.org>, skinsburskii@gmail.com
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=2163;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=KaVy0LDD2WZ56zIlG4jDVljfxrz2j27JL0AnOSACkpk=;
 b=uKgRFxKY7gMhEFoK0hHnwQl6N8UsouNcazo70jIAxend3BGPO0koGFjjGoE03g3KTWZd66DI6
 5tAsc5/qbDAAjPQ/pjqrtB3km5I7U9rctkdARaqcdzu58Lj+SzHd5bT
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: HXQRXYJSZBKK2MEM52PWQPFOMYSSXJD7
X-Message-ID-Hash: HXQRXYJSZBKK2MEM52PWQPFOMYSSXJD7
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-hyperv@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HXQRXYJSZBKK2MEM52PWQPFOMYSSXJD7/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-5-606464dd601a@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_range_fault() takes mmap_read_lock() only to call
hmm_range_fault(). It also keeps a single HMM_RANGE_DEFAULT_TIMEOUT
deadline across both HMM -EBUSY retries and post-fault
mmu_interval_read_retry() retries.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes range->notifier_seq for its internal retries.
Nouveau keeps its existing absolute deadline in the outer loop and passes
the remaining jiffies to the helper for each fault attempt, so retries
caused by mmu_interval_read_retry() do not reset the overall retry budget.

Nouveau still validates the interval notifier sequence while holding
svmm->mutex before programming the GPU mapping.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,20 +678,22 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,

-- 
2.43.0

