Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6447CC4453A
	for <nouveau@archiver.kernel.org>; Wed, 22 Jul 2026 21:44:57 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B38110EED1;
	Wed, 22 Jul 2026 21:44:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pdbTk17b";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 76F5047317;
	Wed, 22 Jul 2026 21:29:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784755765;
 b=y2p7/xmeNT9xSrQW61Y4BPdsShxW4ShGC1XxdprEjtXNA4pfjfAOu7fz+MpUeg0fJTCCZ
 QWpy2pdMxsxuEsu0rZwQ5q6JPQAmvH5kSF5bHLZdVLQFsPiAxpELtvWjtIvq2eCImCiIyB7
 tL6cmaBDtGMb/r1nqr5J7t2vZFZ36bCkGUfRTBF7g5QInQXshJNnvwqKujWSvp3WkuzSmc4
 LDmOQquQukQAy0i3Rny8/DOHhizOO8jH6WVe/Y6KC01tFIQc8HzJ/5SJtf3M+9sAfyGlJ+B
 D4SKrYmBVPywiGimoqmtb+I8r6gE1/jmmWdwqL90myGgNNcDTLzYiVTUWIrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784755765; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
 b=ICU9lyDV6XoF4bFExIhmdEVPfWeB2BslXgJF7nAfLDBBX16u0CE0VL4JDKMhARTNWDJ5F
 P8Ul2k9eEVJTW1DA7r+j/4YU873phyohqD4wS+gvhn/WX9gD5KTaYC3HTHBd49MHn5DqzFc
 PSITIrL3DLMzuRySU7QKpQxHGWv8HiZ3YvfMWSEtVPHiTwli5EG0PEwHLkVs3UXvHpFD0u1
 Ijb+hn5tjCCyoHWR/115eHOKx+dgxEP5aCu+1PHoFQrTEgExK9u5gikSw0hDhCv/zh7P5FU
 XqJ8fCqbX8vRg5xTkoi+VwJcZbEQlLA6HLcxIuKUwG3hdvFJ3S2F7py3hgjg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A6E9E47316
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:29:22 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1246F10E514
	for <nouveau@lists.freedesktop.org>; Wed, 22 Jul 2026 21:44:54 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8485ef63b68so12772288b3a.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 22 Jul 2026 14:44:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784756693; x=1785361493;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=pdbTk17blbllYmW8bnVtEJK7XniQ6NX0h77nLKskDONm/x+Pjw/YDDPvyrht46ukVG
         Tno6a4rrsJD509NN1oighVQIEbSQo+AmNv53V0nXfTAD39tPyhJuFD1f4+BIVlgwx3aM
         p6bCiIX6Z9u8HyNCB///r0LNr0/xIzql8y7TQGn6mGa6XN6vddagMqdpjkQdIfaxEvVV
         ZGt/zhSBZdC+hl8VCQI/V1/0v38EchY/eHNyi8UIWFOYFAdHxpJigikReXmyvidBZ9SF
         umGJfsx1UUWc2b4cZHOrJChYy1vCLSWF0PlXSElNq1v0CsC0qwyb+RENcQGg9RNtpqw1
         CHiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784756693; x=1785361493;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=VC5WLyypzfViGtthd9Ipqqe7aFBlbiqN0mk1kJ5teVH4qsQsbepVskR1ui/q1Secw9
         mqvQvCGpVQrXL7sIJnNOnsc6ItTZ+bOXiD/PFA4M/jgLiy+stqiFzIkQPcfU+NP9G8+7
         4MgzpBAcL8HVUDXE5OmGnLTTR+X6y2Lco3KK2bzZ64ekmv4C0UeNXMbdq3ox7Y/lYGOg
         GnH/rZ0yt9M2KS77TvAjegC1lLyJGosE3i2a1Mw9HPBmdytAh1QBnTTGbCG7aLOUFFt4
         t7JNHNIHoko9yTIQ6xCg+wwuKnXoWjGm03Nrv6n1rjbZCSGLk+UZMf5OTxoGOWU40KN6
         zKNQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqhLnPg/l2IzB3lSpVitf4DI3J5lobQQ+aKhUJ/uOtFeJjIDS6UUrW1vAUfIp6OWQVHeGt/8dYJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxK/a6pGV7LMlxfhj6lQyuFmh1sh8o7pb9t/DzuBETyjlgUHrg1
	zRekO24sX0LgfvW4XVAZun6KG8c/VCtpYw9fPtzh1UtZ327dic1XrGr5
X-Gm-Gg: AR+sD12cYp5Ce3YdmKTV24SQqU3vWwAMFjZEOcTvdTUrArmh6nt5CKz/oxaIwMpYlJ7
	y5thIn5sCVRQJzUZmAYC4yE4VgesEMxbvOBgeEORwOxVaXIKgtFaGh1VQ0mAW68tB5t/TqEAgqY
	V/BfgQoxVQxKLaGQHACA0lO5Xt3gt/4aeYe4+5OrjUPzboE8HUEBuD2VZWsS+NdEnOvRN1lMzgs
	oNDfU5U4P5hmihrI2Sp18dd8QoCaGBODtQhtSfFjDN65JbMAgGhsEPSkBGAgJ2gvOnQ3Svc1VfG
	mjKmO4MxGahZYxVtnYr4DWJdxhToDw14DVari5iEiuZml4559DFETCXt8h9hBGp+gTmIt9ZD1Yl
	wXVFop9njDYeiAGbimyzxiPnLeAfWMDU2o2LlOgRuq9npLEmAixT4rsvtu9nrBgPy2jZeBwokrd
	A2ckr1PJkOOGNJg9Re7ZacVFTuog4sLM+OFfj01njbHt2x/gCU
X-Received: by 2002:a05:6a00:4fd3:b0:848:3fe2:c88b with SMTP id
 d2e1a72fcca58-84e2b7f59camr674000b3a.6.1784756693352;
        Wed, 22 Jul 2026 14:44:53 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e17237c3fsm1946297b3a.9.2026.07.22.14.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 14:44:52 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Wed, 22 Jul 2026 14:44:26 -0700
Subject: [PATCH v10 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-hmm-v10-v1-4-606464dd601a@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784756683; l=3646;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
 b=tdDpNRsCNvmVGCNOZZ9HC3yxGmAH4ax4m27NmzACrsQovmkbRz97eJ93jI+rhX+xJ0J5zVBrq
 FSNwxKzSGzhDXRe3C8R+8iVP4estzVdVfYmBtDp3huLkA3AiN268Vyv
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: WVXNVZFQPBWXT2FKWYQEKXCSDWYVKNTH
X-Message-ID-Hash: WVXNVZFQPBWXT2FKWYQEKXCSDWYVKNTH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WVXNVZFQPBWXT2FKWYQEKXCSDWYVKNTH/>
Archived-At: 
 <https://lore.freedesktop.org/20260722-hmm-v10-v1-4-606464dd601a@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

MSHV currently faults movable memory regions by taking mmap_read_lock()
around hmm_range_fault(). That prevents the fault path from handling VMAs
whose fault handlers need to drop mmap_lock, such as userfaultfd-backed
mappings.

Use hmm_range_fault_unlocked_timeout() instead. Passing a timeout of 0
preserves MSHV's existing unbounded retry behavior while letting the HMM
helper own mmap_lock acquisition and refresh range->notifier_seq internally
before walking the range. After the fault succeeds, MSHV still takes
mreg_mutex and checks mmu_interval_read_retry() before installing the pages
into the region, so the existing invalidation synchronization is preserved.

Fold the small fault-and-lock helper into mshv_region_range_fault(), since
the remaining retry path is just the standard "fault, take the driver lock,
check the interval notifier sequence" pattern.

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/hv/mshv_regions.c | 54 +++++++++--------------------------------------
 1 file changed, 10 insertions(+), 44 deletions(-)

diff --git a/drivers/hv/mshv_regions.c b/drivers/hv/mshv_regions.c
index 6d65e5b42152..dddaade31b5d 100644
--- a/drivers/hv/mshv_regions.c
+++ b/drivers/hv/mshv_regions.c
@@ -381,46 +381,6 @@ int mshv_region_get(struct mshv_mem_region *region)
 	return kref_get_unless_zero(&region->mreg_refcount);
 }
 
-/**
- * mshv_region_hmm_fault_and_lock - Handle HMM faults and lock the memory region
- * @region: Pointer to the memory region structure
- * @range: Pointer to the HMM range structure
- *
- * This function performs the following steps:
- * 1. Reads the notifier sequence for the HMM range.
- * 2. Acquires a read lock on the memory map.
- * 3. Handles HMM faults for the specified range.
- * 4. Releases the read lock on the memory map.
- * 5. If successful, locks the memory region mutex.
- * 6. Verifies if the notifier sequence has changed during the operation.
- *    If it has, releases the mutex and returns -EBUSY to match with
- *    hmm_range_fault() return code for repeating.
- *
- * Return: 0 on success, a negative error code otherwise.
- */
-static int mshv_region_hmm_fault_and_lock(struct mshv_mem_region *region,
-					  struct hmm_range *range)
-{
-	int ret;
-
-	range->notifier_seq = mmu_interval_read_begin(range->notifier);
-	mmap_read_lock(region->mreg_mni.mm);
-	ret = hmm_range_fault(range);
-	mmap_read_unlock(region->mreg_mni.mm);
-	if (ret)
-		return ret;
-
-	mutex_lock(&region->mreg_mutex);
-
-	if (mmu_interval_read_retry(range->notifier, range->notifier_seq)) {
-		mutex_unlock(&region->mreg_mutex);
-		cond_resched();
-		return -EBUSY;
-	}
-
-	return 0;
-}
-
 /**
  * mshv_region_range_fault - Handle memory range faults for a given region.
  * @region: Pointer to the memory region structure.
@@ -452,13 +412,19 @@ static int mshv_region_range_fault(struct mshv_mem_region *region,
 	range.start = region->start_uaddr + page_offset * HV_HYP_PAGE_SIZE;
 	range.end = range.start + page_count * HV_HYP_PAGE_SIZE;
 
-	do {
-		ret = mshv_region_hmm_fault_and_lock(region, &range);
-	} while (ret == -EBUSY);
-
+again:
+	ret = hmm_range_fault_unlocked_timeout(&range, 0);
 	if (ret)
 		goto out;
 
+	mutex_lock(&region->mreg_mutex);
+
+	if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
+		mutex_unlock(&region->mreg_mutex);
+		cond_resched();
+		goto again;
+	}
+
 	for (i = 0; i < page_count; i++)
 		region->mreg_pages[page_offset + i] = hmm_pfn_to_page(pfns[i]);
 

-- 
2.43.0

