Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C27AC531CC
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 17:36:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5258210F1C0;
	Thu, 23 Jul 2026 17:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S87Kts+L";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E608947363;
	Thu, 23 Jul 2026 17:21:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784827280;
 b=Mn4xFl72RntlLpiWzgquRwsk3PNp5fedxk9/k7Pn8xldr1EPGEVtNxRd2GZHXw1fWtn4L
 8as/Z/Y5csAdyQldPjnQIkhUeadUseeKecF2swUZCvxo9UGfyLz1DIb/JXxvA0bHAjkW+c0
 YVGWRH7LAnopF4hSK4mFRyfCqZYvoWxMYEsLf+LPpwSXL+ajsvqDXU7rOdVuTvSlHE+NxHX
 HGqxol1yBAhVQR9vn0PiryY4dRaVD7Q6oAK/8L9jPKcrCm1GeE+xPGN74fHVr0EIUen7mpF
 cF6Ety520IgcUKsQl24/5DW74l1sRAoAjs9YANn/O1WCsrklLsNhB9cXretw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784827280; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
 b=ECMyLnYtCt36L4JMGzGHUlabgSZ45T8an/Hi+R7GV2cYQs537sJIAfxlNJIz4xFLyC+Du
 wJpqiXUoxCefRqB6N/98mzaogT1JGnyfueutm4qRhYg/CN1F1D/Z3rnGxEoFv03h9kernGz
 IRxYqk73jmQ6UmGsPXcrrtrxZ97Ohijf+jJF+NzRXOcR86jvXya6TeeQ4TMC18XzZETtut2
 OpD6iQehOpOaZOlQ5o32KmJPE2BbA/qUx7Oihf2BkhqT2adhjxn7UO3JzEBoJFr5uIL6Os/
 UJobRo/KrbeMmEagPqM715JFFkWo4b6DWXo25aouz0kQrNK8xjeamjjTfQlw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C39684735A
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:21:18 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5B410F1BB
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:36:52 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-84e27035206so1023103b3a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 10:36:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828211; x=1785433011;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=S87Kts+Ll8cqgJbTzmg7fPMx83HyW2aA7I/MdjjbdwcNSE38Z7FkGoRS/fUFt8xT7m
         M3cIeY0qzIBnAnYwOgGg0S0DoRuB+QZf5pdbg4Dcv+ggQGFQqaFIyL6WQy35335e5F16
         cNoBmcp7sBzOt/BMonrLdo8xfEL3xygcYb7s06tK+8foILHo+EzCTsw6nsoQMarjuqXl
         ngFRuSDkiY8DXXh5jFV25u+U/RQL49nq3UmAgqOILBehMvRsGhyy0OURzJSWbCjvivNg
         dERyjs8G8h+6xALbeQZwwyW++xHM21VFZhqDtIY4ChSkTOWjDYdc3ZJfKIjIdz1HCrjC
         DbFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828211; x=1785433011;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3slUHnl834IP76VoxdiRinKrcbFYlUZTVsrXFJZ4JdY=;
        b=L9U/J4QDbPWKmQgsO7NpJO1FRHH+GC6FRZeKv1JVwn1X+Q8lvWEyeTjAZw9jbyLDU1
         ADIdeqro7QELXzPzekylHyZI6VPeV/sc0WH9V2rOVfvlKM6IRhYpJytacNnn5T8Z8bpa
         FvYi7CXkqhjnhmsHxzudikaotvQyRuPCbLwo1ixszVhc/yH6KiM/H6iP5ddJnORysWQu
         9T8P4S7ou8Q6mw9e51lrLqQejIS0p+SZCfBMHxmEHk75BsgbotxwkCAS57QDyeQlnTkq
         RUrLXPz47u9GP8RnT3Hkc3FhsUTIvZjrKS8xeSl0liAZxc0M6p6/6G7u2n3Ne9Jv/eT+
         W8TQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqlNu2vi9vXbcNqXa5IyCC+HvPUw8QL6Vh7+kfn16ULImc/eR2tIX2Gp2r7eX6Z6G/ufKaa5kT5@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEqn1z3/6q4DAtzcyJHxcfitQ51g0UXxpkSHtv8zfhXWVmTfZO
	bcHq9Te/F91agZwTVSEOIw5nP+5PdItJxOUJLegyU+J3TcXHihXunjD3
X-Gm-Gg: AR+sD12/2lBnK/K3AZROw9/Cb3P73DXWXouEIRALY1aN1AR6czXL1o8efZa4ICi3DlZ
	H8pUjfh0alzDLeB0q7YxaHKJAtuCsukmvuE4OhuUnMzjUgBkqYJ4Bttz3l4cmF1c6AEorQ2yUv8
	cERzmrLz1xJdFvQ8f3CbId5+P/vLD06OheWCkFo9HOffLo968k39EBYJHUDKBgeYqBqXZW7no8W
	1wDvm3xYgO0mxCeEkZDAKts+kd2mc0XQUi+qlN//x9gPX7cnuQlVpjeSkPB81ybt0ZWWQykFZrX
	hzAnz1jQESi+PqMFdgxA3NagmyUiUQq62dmvygfEZw6a6c6HHqVkqoHVvsDJGI03RSa0jAAbGC+
	p+WND25aIh44te+Zc5h7kixkiOY+FBxCYPEMYJZ3FV4pRL/4dG2/FaW/Re7NfsxHFJDiPM03WAp
	gObXcV/G8NXwoF0zIdMUjGkOQ0U+wAyDEtKXTq9OviS7lPbVzNtU3Q1plaNK4=
X-Received: by 2002:a05:6a00:27aa:b0:848:2d1d:836f with SMTP id
 d2e1a72fcca58-84e2bd6923fmr4526185b3a.28.1784828211456;
        Thu, 23 Jul 2026 10:36:51 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:51 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:36 -0700
Subject: [PATCH v11 4/8] mshv: Use hmm_range_fault_unlocked_timeout() for
 region faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-4-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=3646;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=ZyAhBAfWZePcXjSsL7QqvsrSYU5bhX/lu/bgMYHTJjg=;
 b=U8sSsRw+6XM+qGDxpQuoe99V7LeZ+M1zXxyPfZetIcbxZBFVX+M/0/c0psrN63mtn0Gyjy1RN
 9IByi6+fiCLCWN+9DASYqtkcc69AC9zezCPbmBdSfWzMLLq1QDXujHn
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: 3VKIA5EQ3QSGOLB6XY72THBPKMYSXMHA
X-Message-ID-Hash: 3VKIA5EQ3QSGOLB6XY72THBPKMYSXMHA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3VKIA5EQ3QSGOLB6XY72THBPKMYSXMHA/>
Archived-At: 
 <https://lore.freedesktop.org/20260723-hmm-v10-v11-4-c55b003a4b61@gmail.com/>
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

