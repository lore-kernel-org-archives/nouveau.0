Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A276C44507
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:27:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2989310F347;
	Wed,  8 Jul 2026 23:27:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o0UJDoTl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7177D46FA0;
	Wed,  8 Jul 2026 23:12:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552342;
 b=hUs5qYME52zBhM6kSmnk31/2V5l03zI7Tra6YuFaI1y/qODukz/M7TMlQSet2Z5nFL6iA
 QIFgBneX1Tlp6b7liGIpCacleCnkmex/8a1BrbJLBCV6HdR+ezaZi8oUIdUMyrjsPFxRHJX
 S1li+bITPw7/sO1e5ao6g9mzHAPajFnU5opLaQa+B3wJI4wZ5cogIgPeSRLcrDLRGC747M8
 GgJzscwI63yA4gJjsc4erRgfRJ20AB2sY7hIeijP4B2WDgBRB2lTsEQSBxxyJLBr6DtRweJ
 B4UWvm3qs9JqumkwjD4iIJHrbNnzzHjVNzRCrbDPXtWNpVp27pNgoZznvzJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552342; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CyXJGY0usHae+LXmamNtPRV/qmWOdkzAleKaxE3NMCI=;
 b=FicB5HgJHONqyW08ZLOLATgOQ7NQ6xsOZhR1358cQFRYjUBmieF/KsTHR1KetjfkJ+L10
 KirIWHfP3a8GNs+3KVsGF4+vZUSSAP/KPGOG7XnMM75fnf0cQjEvNbpMW34rLAc6ACGeNPE
 mpHyZ28f12klNOJUtOxUWZYwK92Lj7tWbC34u84Ly5Qkv9bPaMFCS/ojnssAsJr9mMpJkee
 NJnSR10c3N9aYEwuVIEcM7smQ9oBezJlBpD6VLavk3w9ote+Nu5CQCMyAzk/iZ7ImvKy3Ho
 ZmzhNtEajkPu4xVLd8j/wIIK9RQAo2AmLxm81jfjyXQqcoO+QBv+IXdXU22Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5A81346F6D
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:32:48 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 584DF10EF0A
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:47:46 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-845eb7b96feso4521691b3a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Jul 2026 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453666; x=1784058466;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=CyXJGY0usHae+LXmamNtPRV/qmWOdkzAleKaxE3NMCI=;
        b=o0UJDoTlgZ3Bo60XDDcl+Xs78xMSm6QTQnMYvwHWwhVBXoY0dGBS6QfW/Tu6oH7My0
         6dCWbYbesDRnndAusOPrKFYZGSQbqnRFeL2aeeo5kOS1xxuBO/cs4f52xrdMgXotBuFE
         lHzNi7nY9eRwRRqhf45gWdjXkqGmHtnuFkcI8+/XvbvCFtegi6+wxsslW1RfugTwNSs2
         tf6SnaEzmfFjSVbDzmzAn9GbQls7OroAYr24zn/ecvG1nc2V1HbtM+P97HxraDAHrVVk
         J80bLpVyB+wRfO76v+Oi38RGlnQShsNmNTLbZtmANFOmwyeq1zr/8eXi2iaBJckQOD2d
         EJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453666; x=1784058466;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CyXJGY0usHae+LXmamNtPRV/qmWOdkzAleKaxE3NMCI=;
        b=hLENnll1GAsLZ6J0cS5qjqQbWOLEQx8f6qVagXDvqG/IXVfu8zxq8vCS0Rx/HEkLnu
         8O2vTSJGYy5ouGvR6WdEBO0nEmDEtHNWYaf6QmAOZ3UxwFkjiI8JztvMKOSy2c4XelPe
         LFtPgetB2b/4a5S+wQHAk2abO1o6YfTF3eiovCI23uORN8kEwVy2ZOnzbE4XB1gegbb1
         HhPxtajv/cYgxj0Euy5Ay2pr761vnJWFYlcSxCbOii/PZ21dCbdM/+9WS/cRaLr5qxnx
         4T5iujN4Jc4OXTyzy2vuJrFxxVwQWYnX84auVaAa0KOpy8tMYVVKTv+7h9HXT5w2UwHV
         dOAg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqqFy44CenGaiXWB+75lXHkOnY5LZ9HT9wsSPrZ1j0LrtX2wZk1+YycuYUqGhKx+iYPXW2u+cKH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyNY/BLowVM8jNAO6neAuXkKrZC5uQSuS3J5JfvqxKVqSYjZibQ
	Bc5tV6kmtrV6zWZAFc8+qPKSp4hHyvnbfH5mQU9xozzktGpGKB/FJLfjevrJGw==
X-Gm-Gg: AfdE7cmK57k7g+SU8uZkJkXH/kLdMNkYLhJrshB/T9aAD7j1K7fsbhmAhxV5wCXw1+P
	bZSX7AKgfJpJdLaq2Rqctm3kAR9JyewZ1HLua+qassKjs5aOmifkCUnsQlf69qvleUXBXwu5xKB
	TJj8AH+eSXppfuT1PD1aCCjSD89saHVkk4fNPABc0u1aRO4pLOvw/cXoKGrN5iu6xrzeFAfFtt/
	lud26kFBTAPAVl5DTDSGZB9SckfygY1Hd0hSzslJtXt6dysDZyKkUnOwNEznnJyd295prBzGmYv
	fzPLdrxht3Baeox8hZWQpyaFeGByEkO72wTx/6yxg3ftK3kBOJuiqwJBUF45nu7C7G/d8YNUNeS
	RWCxRt2bbz7oMiHhw+4s1lSKqEH2n87VO9cglIXQEElxxUW5oD0qNjyvHl4QzHjgEOU+lSUCeAw
	eQHktniZd3YYAY5pZifV0gX+oZB3L3yARuQzbz7Pb2u5DAgExFlCVRyOPG6CU=
X-Received: by 2002:a05:6a00:b89:b0:845:cf73:c1d8 with SMTP id
 d2e1a72fcca58-84826c09c93mr6251882b3a.14.1783453665761;
        Tue, 07 Jul 2026 12:47:45 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8483dc66f2asm280202b3a.24.2026.07.07.12.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:45 -0700 (PDT)
Subject: [PATCH v7 8/8] drm/gpusvm: Use hmm_range_fault_unlocked_timeout() for
 range faults
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org, wei.liu@kernel.org,
 skinsburskii@gmail.com
Date: Tue, 07 Jul 2026 12:47:43 -0700
Message-ID: <178345366389.660027.12986386801605494596.stgit@skinsburskii>
In-Reply-To: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: EYDBV7LJTCXX5ASDPKDP73OWNQQVZAUP
X-Message-ID-Hash: EYDBV7LJTCXX5ASDPKDP73OWNQQVZAUP
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:12:16 +0000
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EYDBV7LJTCXX5ASDPKDP73OWNQQVZAUP/>
Archived-At: 
 <https://lore.freedesktop.org/178345366389.660027.12986386801605494596.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
MMU interval notifiers whose mm matches the mm that was locked for the HMM
fault.

Use hmm_range_fault_unlocked_timeout() for those faults and pass the
remaining retry budget to HMM. The helper owns mmap_lock acquisition and
refreshes range->notifier_seq internally for each retry, while GPU SVM
keeps its existing driver-lock validation with mmu_interval_read_retry()
after a successful fault.

Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
called with the mmap lock already held by its caller.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
 1 file changed, 7 insertions(+), 45 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
index 958cb605aedd..2601b793428c 100644
--- a/drivers/gpu/drm/drm_gpusvm.c
+++ b/drivers/gpu/drm/drm_gpusvm.c
@@ -788,22 +788,8 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
 	hmm_range.hmm_pfns = pfns;
 
 retry:
-	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-	mmap_read_lock(range->gpusvm->mm);
-
-	while (true) {
-		err = hmm_range_fault(&hmm_range);
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
-	mmap_read_unlock(range->gpusvm->mm);
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 	if (err)
 		goto err_free;
 
@@ -1439,21 +1425,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
 	}
 
 	hmm_range.hmm_pfns = pfns;
-	while (true) {
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-
-		if (err == -EBUSY) {
-			if (time_after(jiffies, timeout))
-				break;
-
-			hmm_range.notifier_seq =
-				mmu_interval_read_begin(notifier);
-			continue;
-		}
-		break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 	mmput(mm);
 	if (err)
 		goto err_free;
@@ -1736,24 +1709,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
 		return -ENOMEM;
 
 	hmm_range.hmm_pfns = pfns;
-	while (!time_after(jiffies, timeout)) {
-		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
-		if (time_after(jiffies, timeout)) {
-			err = -ETIME;
-			break;
-		}
-
-		mmap_read_lock(mm);
-		err = hmm_range_fault(&hmm_range);
-		mmap_read_unlock(mm);
-		if (err != -EBUSY)
-			break;
-	}
+	err = hmm_range_fault_unlocked_timeout(&hmm_range,
+				max_t(long, timeout - jiffies, 1));
 
 	kvfree(pfns);
 	mmput(mm);
 
-	return err;
+	return err == -EBUSY ? -ETIME : err;
 }
 EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
 


