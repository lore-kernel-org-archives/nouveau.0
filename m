Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB4EAC4453A
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:45:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 630FC10EEDA;
	Wed, 22 Jul 2026 21:45:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IkGUXOTS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B31AF47323;
	Wed, 22 Jul 2026 21:29:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755770;
 b=AHop9it2SLyUpGXkpINEay2AmdsdOVPXAr4Cppfs6gk75pdlJdM2lQy21OYuWNvl8pNCR
 Rw9AOiEDcoqbcm9+sPPGQRdortknaC3HXBI+QSOuWQE+lLJIzD70edil3wN6Bkfg2Yt85pO
 Rv1qOwkX13CVG8g8y5L2hk6XQUwPF2S8bbb6iea5rSl2E6lNLVpSEI9wNRsc+hqhIZccCxA
 3DmPKww+YkXw33T0FEZ6MuzM7IZ+3ZsNElFY1QJmmHoL/FzSDPnV56BSnmV/rGfGokqX5RO
 nHCgCufbttMuVoPCnP/Na5VhY2QG/kQ+5mdthhq/iMPe5ZtnhBZiiN0pY/0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755770; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
 b=SKMg/HyswFCr0IAbsG9Wfp+T3pgslWpea2MvGhN70gmKoq0zFL2Y6Q8/rrvLcYgOFN6o9
 O7rzC4LcbvKQrXjJKkESh1k9KYU2mYamx6n2/+YcGtuLZQ/jLS4EHHmrPU32B7zD79sYvTw
 Eg61w1horGYQksIHftBBDJWT/j8exA5ClsMXpREpqajwgB6V4JDsjup4T7WbaSa7y3ayKwK
 twmtZW4AtMJtoSTDIvyUyPmnwwNdi8vsQOKZG/mLk7czUyOGlHMpwDjlICWeSjpt9TiQU6Q
 oeVJn0P6AG4NYpL/yaEA+LhkM+FY4F1WPkm240pS3eUf07FqXIJFYKOMKTrg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C9C4C47317
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:27 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3FB1B10EED3
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:59 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-8485ef63b68so12772351b3a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756699; x=1785361499;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=IkGUXOTS3+vi0HOpIyPEaRiEIZIxwy4xSctvej/G3JE+gZYHUrtwSuY946hs90kK11
         I926bFaM3s+2Z75tVrCAI/okBtTYmu3l6ZeoqUBfv8FxBPN2f460VG1F34Y72Z/7YWii
         IsehtlYyCpps0ZNyqhjRLP+5zz0USEawoFv0GsVQ46WkT1rRaU4VPtXdFNtuBmZI9pq+
         C7xzZoeuvVsT+O/fPYF16DaJbs60ezLK8i8+zxX3dY+sVwwZm9W9VnlwLCWUROO7HtT9
         S1B93CCv+WXSI0D0ZG4+m6GKZXFIYfaz1eLhVHOlCrV/T6vDaSWAUHXrdfRzgMY1HA7N
         bSxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756699; x=1785361499;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/3EHZQlaXq9sLmhVgtuP5ODA2wxc36yvs54yemcncOc=;
        b=DCpKsdkGxuatFDa9OXIXDxWA0tK2Ke7AOZ42y0TBplVQLcrOyHdzV9RNCmaPXMddsO
         /F8OkGuBwVcdE73SfOCNreLcqrC1u8sgZM1fK8Ytm3x6B5cFrbwDLMzzqARhQ9oLXhq9
         OFYIn/xVI9i5JJmSftZkG8JA5RviL1gUXisCg1M0ecl65mSz6oM01ff9vvYtOEJwzFtv
         yEOBUZh19AAZVF8mqCU2j6X4Gu/5rXGAlHdmhp1SQZSaxD9tUJS8JLgram70QOX2Qb1r
         qQIy6fe8A31zMtCqwuB6fp76gTDLiS/RTst/xdmoSlhXyTB5J2qOLy1w4kfE9hgqrWqt
         80oQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrSYQzDL7VVeExLXfP1wvycQmHkdjzdv3o8/Nvgrhfx+AIr1BZz7nvPOX6xByuuloZpbV222FJ4@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw712ta5TOXG727BNetQEB/CTz9UEgS9b4TNRUU9Lmr57fkroDv
	yNAm/2Zl710lbizXibM5AafnPfaOU+5RqQromPNBROMj9hUKxbne87yB
X-Gm-Gg: AR+sD12yxvtDtiGUE6Zjns7yVt0dByAuNwCw5ddNdxPGDn8pZZ01XJ5CbEWj+7ACB9w
	TemA2HPgDWQlqZTRcWiTSuuJa26WLdifruq4gF8xJfDKfmICVwkXiXCGTRohr2VkzjqtJrBfLfx
	F2P0oPwjJCBMHqDZXJqCns0owT2tew+OnnKvzvqhu79kSTBI/7rvjdet7yrPU42WuxA7NF5Hbf3
	dmE+sx7nIsEm9d6p3CVbMOtrumKe1/BkNFMxacndN22K/Rm/enik2CI7w31gI//YZlmM/Q/yYqY
	wnM0RDODbNodal82vYAFq3SjUm91B8jwwehrszUCNRSIF+ol5jRSNH0INEKXzBhs8a24blw0hRL
	AF4IpVoAZxg5tGDorjph6GYIbZsm933C/JEQkUfk5K2GYh26Ym4NffnmKlENlbvXboyQX0lWG9X
	k5SV8p0PZ6kcvxkqbKmO9pGmSHptmtKO8BDbNbEJs/P/UgUPqT
X-Received: by 2002:a05:6a00:2e21:b0:848:5ca1:bae0 with SMTP id
 d2e1a72fcca58-84e2bb3728fmr677188b3a.42.1784756698735;
        Wed, 22 Jul 2026 14:44:58 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:58 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:29 -0700
Subject: [PATCH v10 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-7-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=2650;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=Js9Z5fScNTLs9yZDEPq5MMQDWBFdccrrYdkvKMfBR0c=;
 b=OvUAdAx0y7f+AZFnN5LSfteCYnBEUqdMQ1drzLwHbqAw6OKXvHLZibJ29BghZSxMaAsL2Igct
 7dhM0ZwBa4kCtizE7Rk+AH/sCkM9/0Xx1LPVtAK4e1kYz6EQ4qhx7vD
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: 44A53KMJYBBX7ASWRPYK7S6U6RF7R6LP
X-Message-ID-Hash: 44A53KMJYBBX7ASWRPYK7S6U6RF7R6LP
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/44A53KMJYBBX7ASWRPYK7S6U6RF7R6LP/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-7-606464dd601a@gmail.com/>
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

