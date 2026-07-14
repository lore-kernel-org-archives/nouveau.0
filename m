Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0BA7C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A14EB10EE4C;
	Tue, 14 Jul 2026 20:13:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="h28XSsV9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E65354717A;
	Tue, 14 Jul 2026 19:58:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784059101;
 b=x/3qn3LriRcCRgN50pPqo+6UY4d594B9iiu6BofVhfivQdb0JQd7lUMCx3AZHd9mH40o2
 0k0C6qOrkKfY6pEUz02wF355iVW6kGCGs+JvTQfM4Ov2/BtM0LSL3Jr/Vz93JZLb4ImMc77
 InQ9d5HWjmf6jvX2vPr5sFaPeSdBQrQqHnotq5nPYdG1bN0Ru/jkGjds+iORCUxxGhYb94l
 rJj+GqZFoXrgKvHiB8dYefbyfns4L2SMahayD8SaQpcpGwYJ4RN+7Jd+UPBlMQNng814E+C
 RatqiOBXC2i/2vdauxF/vV85ZCVazE7lpzfeDHS0j9uh9ShY9LgE1CZ9MPTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784059101; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
 b=KcPoOVgBntSeal1g6aJgLHklkAHqCb66dpm3jjbCK3NV1PWE4jq6X9OwZVnZhCzceYo4V
 uuK0uLv8Ts5C04L6Md0VMBaS/bFXTyi0m+FGpTh/1a628SnRFxY70xFeR3S3eH/xUqaEvNd
 kl4fCHJkL56EGmx0JO8vPSNTyZ2ec3rJeFvu4CQylWkVKBjyoOgyUJBDqQmZtADSxT1Rc1i
 p38309Z/T6v7oz8EuEX0Yq81/OoZd2jsSiizpqt9BD8PVRv66yuJEbmzo+tJMZFhnQQpg8f
 zaE1zHfmNIIXoQmoa0opcFUM3dkthKo1RVLoeCul1LCFtAQf/QM5GK46VtSg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E039647123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 19:58:19 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 767FF10E0CC
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 20:13:33 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-84a4d8fd6ecso1262475b3a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 13:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060013; x=1784664813;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
        b=h28XSsV9o081kMgK7EZFHLjOejwOM77Faz3eVI/IkFUnCjH9xRS6q+3QkZWVIqAFbZ
         pEjLiMXS/jQh7DhPGeM2pjJGAZdHMe2NAa8tuLlEh4WRCqig2g0PuqBwGkA12UC83WBi
         isS0aI1N5uu38ap1pRVOii5bhEXP4YwKNaORu1WpGa6hVAAa6WqGZRLf+fcKmNL19NfL
         rCwhRectI0TckuglFsJtYdPGRHycoBxJfphViSYtlDOGs+U3tEUxAghTaJbLUO7aFj/+
         5Y1Iay18obpGhnbdr56FrMzlUI/FDxfCqvt+qsNUGeICRBbvnKYWcT10n02CrijLmGt4
         d96g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060013; x=1784664813;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vc1a4EA+CKVDZWmxoam2W7gn+VW7+IE4FDUnuymM6t4=;
        b=h0zxegz77GLKxAyj5TYMAaJZkeD0zcwSvKaidWAaM8WDW211Csc0o0Fxe7MOngSHMH
         uLZM+Lj8KzMdZaIqNel+5+nYxBpB0M54zxMhCl7eL8tkEvYOFa+VJlOB1A+JNMK4yTmN
         R7I+H3AuVsET31L4MMfURJcxWmp6CeYyusn/aL767doBOnQLGYg8wUKO5KabO+9fTB+9
         ecWKc6zVE3hHgxObZvdxsqpDu97LDpPGC4HCbau47pY2Ff61WweG5RWsKh67ufr+C8dd
         9j+D1YIXfH409mGkfDBIkq+onwptlFAPI/O+dso+z0YDBHZ/7pz+xN2Iim4uR/+AvXDM
         tfKg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro332Svp5KlL03O5a4aZzUXBIf8hByX/8sx/JYyOvIbimIo6b1Rze1GVZ8wwG2yaGR6jyBInb/M@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyGt4zzYYB39t3Q5wW/7aUe8wnO2L/TMpHE2IU0mJmDGaZ+E+Fw
	G7Uet0LSX7Na300jn0Q250W+bHcChBNSLFgAetNmUImWYfUrBl8W3Rw9
X-Gm-Gg: AfdE7cmEQBzXyPJnBU/Vr+vrN3QEpBa9JArb07r82lOFE0hPMWjumeHyG3X+rTHFbln
	iVT3gwSBCpx60aas8g2erKlrEniHLoz7N6H10/5tmnv6t0pbjOcFoFTQDWPj3wVpnnAby7XNwgD
	2TELgQpgrpBuUDmrgk1yM5FpSVSDWoQkujOzGfoGkoeqSTvJno56KLW1E3XnL0Zjy//71/H/LsM
	myxN5mSUOxiHNuO439vDwu83ujknOVoD4YxdtC8h3muzTlXPiE4dT91GxocyIRIXBKRgyBnJ8wZ
	wbjm0O0vNliAiuQyvol7FEnTC+jpI/LDQKurmHVMHNM+6Pr2Uq5Sd+iyRfFp8HDLGtRds2LXU7P
	7cLAJTGG/a8F9kYEirHHwb6JP3oGmMRZl5UxkUwCrxZVpVqzRwW+ofPkRDbMz77Ur3E842XGCME
	DT/uWpHptnlLpBBRg2au8W1jq7qbt7/3rxxrBr7mi8AZkBipOkKRHfekvXbKQ=
X-Received: by 2002:a05:6a00:2341:b0:848:2f84:f429 with SMTP id
 d2e1a72fcca58-84a6738a72fmr16414b3a.66.1784060012852;
        Tue, 14 Jul 2026 13:13:32 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f6bf5ecsm1974797b3a.29.2026.07.14.13.13.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:32 -0700 (PDT)
Subject: [PATCH 1/4] fixup! mm/hmm: add hmm_range_fault_unlocked_timeout() for
 mmap lock-drop support
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
 corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
 kees@kernel.org, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, lyude@redhat.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, skinsburskii@gmail.com, surenb@google.com,
 tzimmermann@suse.de, vbabka@kernel.org
Date: Tue, 14 Jul 2026 13:13:31 -0700
Message-ID: <178406001098.1082778.7615814555318834246.stgit@skinsburskii>
In-Reply-To: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: AWVXTNFUNZUTXIFNRDZZVTSMEYZU5JMP
X-Message-ID-Hash: AWVXTNFUNZUTXIFNRDZZVTSMEYZU5JMP
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AWVXTNFUNZUTXIFNRDZZVTSMEYZU5JMP/>
Archived-At: 
 <https://lore.freedesktop.org/178406001098.1082778.7615814555318834246.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The hmm_range_fault_unlocked_timeout() example checks for a concurrent
mmu_interval_notifier invalidation after the HMM fault has succeeded.
The sequence number used for that check is stored in range->notifier_seq
by hmm_range_fault_unlocked_timeout(), so the retry check should use the
same notifier stored in range as well.

Update the example to pass range.notifier to mmu_interval_read_retry(),
and spell out that the retry check uses the notifier and sequence number
stored in range by the HMM fault helper. This makes the relationship
between the HMM walk and the later invalidation check explicit.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 Documentation/mm/hmm.rst |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
index 5c88d2cf0818..fc1b8dc19825 100644
--- a/Documentation/mm/hmm.rst
+++ b/Documentation/mm/hmm.rst
@@ -206,7 +206,7 @@ The usage pattern is::
           goto out_put;
 
       take_lock(driver->update);
-      if (mmu_interval_read_retry(&interval_sub, range.notifier_seq)) {
+      if (mmu_interval_read_retry(range.notifier, range.notifier_seq)) {
           release_lock(driver->update);
           goto again;
       }
@@ -225,7 +225,8 @@ The usage pattern is::
 The driver->update lock is the same lock that the driver takes inside its
 invalidate() callback. That lock must be held before calling
 mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
-update.
+update. The retry check must use the same notifier and sequence number stored
+in ``range`` by ``hmm_range_fault_unlocked_timeout()``.
 
 Holding the mmap lock across HMM faults
 =======================================


