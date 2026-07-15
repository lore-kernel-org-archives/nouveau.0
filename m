Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527F2C44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 18:16:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3324710F119;
	Wed, 15 Jul 2026 18:16:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="I9mjGOjl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7786A471EC;
	Wed, 15 Jul 2026 18:01:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784138493;
 b=Qa6FNHcVE0pzBBCBgxIXqQjI/ZMDi3pSZpciTKCq/dBtTXf94TaVI9wD8fAg5sKU3uOft
 /697x+mBn8AsN4593te9E2stcJhYDARHEhebN0/HBOwjEAs9sTrW75Ve6LYoh/50jxPHiZE
 8nW8Er6GyFoRY+9mxjO+P2Tva8Jr9IYuf2Ffb11XPntDBSQHOgQSWMAfwciPBTmtalGVnX7
 Ij2limqJhmj3dWda/PW22E/3uUi5wQoqD8lekccv7fPD8xofJ6MS83biQC+mSgpEs8wy4vG
 /JeczvAp/zau6WskMu/EwDt8In6+95/yM9FLPUz2xinQb1d905rtRsPMGv1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784138493; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+q3csfDWWlHf03esSbv28913HL95J8hCqGqZ6tTf+OA=;
 b=LkqctP0g5AsC5LGdQfumg42qBprXNxUaaZPlOIIv91PN9G2aEJZdPWfrkidSiUusrCxva
 viHX0acwh8wAArPfqMgOb5diluGLMgZCViHNfjhVUTOK531sCyp3SVMSmCHHjJVHffmB8tQ
 h+dpI9LhGJN/8Y0He0WvUAaR5Pvzxx8Pk7fNYaVQhV9At5f3FbC/NdoVQU8HD+WK0OtHciW
 ai4LULBfI41oT1Zh+LoLv6nCBDgMDqiuN9kQ+kEjiW89s5YZVdm0cPSRDw7ZsGgkm5T2BVJ
 Ks8HVynW1CWZi1uz8ZVlHxBLEH/L5QMLwoMmy3yl1gE3Er8gspTqPwu8t6Ag==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 18E6846CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:01:32 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ACD7E10F117
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:47 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2cc7e86e7aeso25554275ad.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 11:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139407; x=1784744207;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+q3csfDWWlHf03esSbv28913HL95J8hCqGqZ6tTf+OA=;
        b=I9mjGOjl9vYkBWbyALx0O0Pf6UCaB727hvbwkRo6EABA2FEdzcjmVtlIX0e9lmUZrs
         5p5W1vbitBZpOBPol0HtLycOwlYDfS2RyisXR9nqX36lyPrbnA2XZqA2mMIZvfmTJai3
         K8cLP+ZiGyY+DBvEfDXLV3dz+CMe9lDY/W0P1xuVyRcCzMSyNxpgiwNSjpY80agmDMIX
         Nlxl8P2pVv5Gs3OEgzordQ3W5rrzjKapc925AYhW+oaviVtJDBUvgSfWXbIpq+Nl5nhd
         QKJTreAmWCmBxjRh06CZJrAechmpIqVdYldXQS6QNjnx2uMTeNqqUQ0TRO4AhpAITJTA
         T4Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139407; x=1784744207;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+q3csfDWWlHf03esSbv28913HL95J8hCqGqZ6tTf+OA=;
        b=m0Yv06lzYx8n1Suemq4MDR+eLoWYESMOiShu+OS94GBMp8SkFJFFaIuCr6mVzL9YOB
         jITPWr2oJATCr8Z5Xyo7bo5eyuHJIvqZM1ArBjT1d/CMSbdAWo+owPbql3xsynPWiPl5
         jzO4BcWKUEKsRr8MKjWUgK1REbaFXSZqZUm1Y4OaxwmpxV1Jd+1q+MByczyjxqfkeUeY
         CFQ02SqFXyKN1TZlv3vPdSEs46+gcGK3X3o14IHPmHB8n7ekG6r+RTlu5B1BbzRcG7bz
         eNyYUNHugHM9hlAEqbe91lwvnQir1XhNQ7VQ0qRS6XbwaheH/KGA3/LUed4AdwwNYt2h
         m63w==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpc44iaqywiM+JEFc81I2O0qdwuXzuveSAvUBhDC/PLoM9Qyc8b020WK2IvzQnGJk5y0VvABWr+@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxua3d25rZgcpOzqoSQF2sXh3soEmb/CZp5zlvf5GMmCwzj+aUS
	Q1DFYg4YazbsUb4UlP7LH58O/uq82XMJCa64azdAuhnws3MxUEwvDaZr
X-Gm-Gg: AfdE7cl+HbZ4XumwXo1gxSVLemoq5u3oT6El5+96degLz+M2+HcBk45rvFz/I7Cf+mE
	AB0LZi+cEmBelZ2xrAfuTAXo/I7mAmAVsxYh51mbAJ0kWHs56XYgLUIMsc8KbP8JDmqY6Upm9HW
	lBOVXJIgXUeYP2gLAgNdoY9oK1jIzJ1QGyWnLYcpqZtaIRo/wNoatg4DCRo+nMgTpXx4fUyiLuj
	jbJ/ujrPwjt4+D3es10ZLg0ueeMFt6+vq2N5ULylKRDU+bsRxVCY1TL5CQ4h7htBEmD4/eMvU91
	2MSYKr1hvdJ+3LkLs3chyLH3gJE2Fhv9HK1oOg5e3f8r8AEHYfeqLhMCWuLwejtm8vwQKWtBqSD
	2vb/4dX5CmAWQDN3rn5+9uGGbP1zqjkf8sQ0ioXao1tLx5JzUHCkMprIwtnW6ohS9Bfo2jY8xHh
	WFw5gQ+LV4+ZBCy3zB1vDj7fg8Dsou0FffnuuSL+lYN7nmguxhCvpoKTc4ubA=
X-Received: by 2002:a17:902:c94a:b0:2ca:b8fd:f31 with SMTP id
 d9443c01a7336-2ce9e9a175bmr176469515ad.15.1784139406969;
        Wed, 15 Jul 2026 11:16:46 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf1055d661sm6778695ad.42.2026.07.15.11.16.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:46 -0700 (PDT)
Subject: [PATCH v9 7/8] accel/amdxdna: Use hmm_range_fault_unlocked_timeout()
 for range population
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
Date: Wed, 15 Jul 2026 11:16:44 -0700
Message-ID: <178413940486.1155966.10368807598827608499.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: V65XQX5ZT7FBT6L23KD5HEG4XPGTVVIF
X-Message-ID-Hash: V65XQX5ZT7FBT6L23KD5HEG4XPGTVVIF
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/V65XQX5ZT7FBT6L23KD5HEG4XPGTVVIF/>
Archived-At: 
 <https://lore.freedesktop.org/178413940486.1155966.10368807598827608499.stgit@skinsburskii/>
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
 drivers/accel/amdxdna/aie2_ctx.c |   23 ++++-------------------
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


