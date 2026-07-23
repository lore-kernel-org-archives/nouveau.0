Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E92C531FF
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 17:37:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A26D10F1C5;
	Thu, 23 Jul 2026 17:36:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZLhq7Qya";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EE42447369;
	Thu, 23 Jul 2026 17:21:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784827285;
 b=uLeKJEE6OL07P+XKjOyD4aoUahD+uy3E3DGAuN1dWusAuM2/77xxx+qrdxvmrC2TiG10G
 GqeC6Bf+/qxKcfOfoi8T6mlRVNIYv+G5P9eHs0SeOaNjt+AHg81N+KUUFms6kbGd/m4CReC
 yXdYiEQH3AvhNbhOaR+svGZMX88/9ruRXZqDNetYUxqGBr5y7guf4r7WW8sTbe0KaD9MVjj
 7FzcjMYmIpdetsf481LmkjI9hbAZSl76dTjKZhsJQwWRYs2KiKmBUUjrGdjtvnNqaWwYU2T
 jJvXSB17jux6rolwrc6EigdaQ0lZQ+xd3FyF+k/omVNKOeF7YR3HLiMY2eKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784827285; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
 b=DAdGK8E3hgPUjW7qYuikWAqu13c4WHbJ/IQGXjYyRDM1IfcJ0nweUVldV+5OZqZYO3B1C
 /IIgtUlan/Pupwig/OgXP/QBu8/sOFJsj0+2DB5xhi9ztlm2fKEfx3q2xuAgAguSryuUmbH
 x0q9cwRe7qslICT5jvqT3CpmWY1hqQFJ6SLOb6/EK3oj3vk+i6Tgi1jFhfqyPMllObw1TQo
 WX9DInx7MG2yLXZ0eQt/3lzQ7qOe3BE+/roULrLCJeoEwElfQBPwd9opO1pNznnpI/G8cIP
 GWHy12xhaOvnn3mzS1Zl1Oh0CYXXP0d8nhO0PxwgeF8NkFAV8PlCVfhNGu9w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6936F4730E
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:21:23 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A73CC10F1C6
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:36:56 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-84536ecfc5bso1148286b3a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 10:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828216; x=1785433016;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=ZLhq7Qya/YSzA+8eG5ACSRxKnyEuHU8/+Wgz14+FUdYxp2HBpQFwhB6PydHR3beucT
         /luFIXwpAwV5otRaJJQ+qMXYeHqSgsJOv/78AZFqjyXV1/JL8RYLBPoCm3HDfrr7kH6i
         rtlmUkEf/nunvPAaZBCyU+eOuEEEVjwANh7upUOPR1NiEzqYypYTnO7npRWlGopPpx9b
         AoqtQtw6BKP+FRIUiFz1Kxfy3JefTKKkJp8E5NMD8ptb2hYrISExe4p/eARnAgayRF7J
         qy+VRQ9oxmFJJf3aeesL+6vixYujbrxCWjFIo/MmWJwBEbOQhR6c84pq6K/j9ll+KS2v
         kWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828216; x=1785433016;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=WQm01XAHw4o7K0Wpjds7qzV2K5ECLWJb9fvWWOOIG+svp53zmhCogUgRw8aB0eSCZV
         yjVKnmxm3vTEepSj67yqbaoEu9/YOM1K9X28z2HKnY4f2DaHUXwf57k4qEbfkGLQ8bC4
         FZfzwzYY1yKoaCYOgQSmGK45ahRxBTJyDo3vC6oOZ9CcTgl3sSSXdfJAwMhhvYtg+zc6
         TS6OItXHerHn0nFpwFxz3butr8hWoIEPnr7V7irLLpydEwY1D+XsNjE3fxkSq578R/iJ
         kSOf6CEWl9qzJJEicJswwq2v4jVIOgJU0T9Kk7SqAcS2UJxzqLtMyQPqVjFMguR/4DOz
         MA2Q==
X-Forwarded-Encrypted: i=1;
 AHgh+RrGoiuHlAViXqsywZy0eecaNaxPwB1VfcionluRIhXuAJ0/rDSrO8K56rvIevT2oHdhCXQpWi8G@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz0O1R3tpdjYCO+GLQcJhadfuntR0Gbm0NTaermShpxTl88iLF6
	Z4SUQTqfEgAAdzV5Vg4AZdf0BdrA2uTU2ajMrPYiOV6+vr2dnA3LpPyq
X-Gm-Gg: AR+sD11PA1NID8Bc68mJ7w/bdZIHKKKPipA3+dbTfAiQRIARsXhTWDS6WoiXaaMBK+J
	8d1+lXbyPHn00peWoCDKy8vOCvMwR9etYp7JmdxMMbe9oSt3hGgnZE6HMh6E6bORfCp8L+NefIt
	OT22ijtnWUDCLGWFjBMsyC9Nw0kZgbQv+KChWlj2ONjOSyt3Zgdt2G51vYBxVSZ6eZE3YRm3I4F
	k1rnpStbvIzUXnZtUzwSWpUJFtsArfu7Hw1nGyka/rq5CisbjGp5lEsOmmw22TDlwbchp2T065u
	sIDkGWzP538t7SDg7TuI8pPrnpHxYSvv+U0KoB/f37K6GHQcaycnzm3CsV7kIwD/NRm9959WIxH
	MYKzgbpzwvaaPHL0tOzaKins4vlH0mdgbr99cT2layCxs7E71OBia1cnme9dUUMi8OHqOn7n3qE
	edsHUFf6kwqUzxJ0ht+AYjglcsbLNlxZIFS5GzfVY1qQa5qkaN
X-Received: by 2002:a05:6a00:4482:b0:848:47d3:47ec with SMTP id
 d2e1a72fcca58-84e2b8ab6d2mr4797080b3a.31.1784828216068;
        Thu, 23 Jul 2026 10:36:56 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:55 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:39 -0700
Subject: [PATCH v11 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-7-c55b003a4b61@gmail.com>
References: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
In-Reply-To: <20260723-hmm-v10-v11-0-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=2650;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=Js9Z5fScNTLs9yZDEPq5MMQDWBFdccrrYdkvKMfBR0c=;
 b=UoKX2QEi16TQG/XSPiXepu/KONklG+8l1kn86LgWhqxQQe32BnNrpIu04JJYOeap8yhmhRNnI
 Xgchah8NIfnDwgLdxf/plAUECr/N2GDtTgg00z0Czhp7vw9hyXoBoqQ
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: 4GK74TFS6ZSWCTBV2B4YRVS27466RAJO
X-Message-ID-Hash: 4GK74TFS6ZSWCTBV2B4YRVS27466RAJO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4GK74TFS6ZSWCTBV2B4YRVS27466RAJO/>
Archived-At: 
 <https://lore.freedesktop.org/20260723-hmm-v10-v11-7-c55b003a4b61@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It also open-codes the mmu interval sequence setup before each HMM walk and
retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries, so the driver only needs to call the helper and then validate the
sequence before marking the mapping populated.

Pass HMM_RANGE_DEFAULT_TIMEOUT as the helper retry budget for each HMM
population attempt. This scopes the timeout to repeated HMM notifier
retries while preserving the existing outer loop that moves between invalid
mappings and restarts when the interval is invalidated before the driver
updates its mapping state.

Keep returning -ETIME when the HMM retry budget expires, matching the
driver's existing timeout error convention.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c | 23 ++++-------------------
 1 file changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 54486960cbf5..b5b4ca263002 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1034,7 +1034,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1061,24 +1061,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
-	if (ret) {
-		if (time_after(jiffies, timeout)) {
-			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1096,7 +1081,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)

-- 
2.43.0

