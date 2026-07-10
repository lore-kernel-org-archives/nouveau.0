Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 094F8C43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 21:27:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DB19610E4B2;
	Fri, 10 Jul 2026 21:27:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="pkUl3JwF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E6EF847063;
	Fri, 10 Jul 2026 21:11:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783717919;
 b=d4eE0baHAo899LRqO6Tv9s7h+W/Gm9EAjq2zwX1D87KPAvdDsuIhm1hedxKHLwQ/oD3Yq
 X2jLh5dOr/QdIjlJRCRrdsCbS6OMVUVu6ycbtb6J1ozMaC+8AJ6RMvrOz/Q0avOjgVnipPL
 JBeVttVagZCEIRaJLUCGAfRmCGGSmzDLh7FTXdyUslLnoQ4pmQ6ZErWRVTUT1Q6l4jLANoi
 cK9ZqntyWl2lQtw2xrc8tlrcp/psngJvS8tDG+UOoAefrDSvWmalQYXV+zs7st4FS/5qc9t
 eYs1hl6ksslss1ZxcKilFpzWWQIxzvhg7bS7TopNcp8LC+WTZV4OloNVh7LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783717919; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
 b=I6QIly+niECSPVfT/OOsSNkCdUD/Xo9W6XXgFHKwNYM65nUAtvuxkUB4QheyIAxl3ZGi6
 1J5FX6vTLn94COrQLB667ZvgmVDJQkCXg5zuQuRSl/kiBv/9jc1J++DZXJS1Yp5PKsIfC0x
 7n/5Irnj4DINpqZVEGMweMXvkw3pssT308q82SIb8f3jdg3K85TTlCgRIizyvQeS4nc1Oi/
 5mUt5boW4272/T7++4x+wQulcyVRTEvPCyVCXKwADeEwNAsyyD4oQdOqSSAVwFVuYniMTU4
 o8le0nlFmQoUzwjFqfVZUm0iEDKiz/hBHp+QuFb3A2+Usmk7JCfGWBXBRifQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B60446FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:11:56 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com
 [209.85.210.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF210E23F
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:27:01 +0000 (UTC)
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-8487214ad2bso1821077b3a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 14:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718821; x=1784323621;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
        b=pkUl3JwF1sKKNS25JsP2bET0UDmcZ46g7aGnNi0AtqO4x70E0nOgOgwDWzntuVm+Hi
         EsrJ4JLqMVOZFrUcGKrIhtFHJPa6CVB2RHbmBifux4EFFYJFKCqDqG5gEYksrS53QGC7
         h9uBAOI4WcLqkFfpYxxe8v4CA79+k+u3mXBWayuOVlTWfveuBBghG58SkEIj1SDBbqXN
         XfKzghAjZNAaPw7r4kSctYBpLdyFYURmb5j42aMS0RQtwR7tMr/2N2/OHvpQK7ApWqB1
         Jp8Q4af4GVK3CawBTV1H1v8Wm0AjJZDbn9AHYklAsYtgJoQ3giwIHejwaaEp+EHu+6gA
         WhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718821; x=1784323621;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i81Mvoxwiz31acM23+HpM6LiopJwdOVnXlQ0p0m7OMc=;
        b=aCtUTPOPR4m2afsBtIm2lClmIBxlN/LbOc66SL2e1cAmn99N7vjf4OFIBHM9HrD1gK
         MnWHOs4TXCvwEJn/HSbeD9X+XuBZlq4Z3LE9g2bFm8PNyCUYDPUUB2ZGdD35RgxCsH5Q
         VESYQUyJ46UQOttE2f64r2UxmFHXkCo3i6DFvdPwT+zgwAV/KHnBMaP4/g+2XCutGXJx
         7EDnZr4iGQnyaF4ZPXQe9gqiYnHoiOPnMsrgaUCmz5fACaejSkDdg/BU7vSY8P2tjMbb
         WF+iI35lO2uriwWBs563gtKWtSjmt3V0yXWqPstJD09axrbd/FOYE+znpT+i0MDCzWXb
         v+xQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp0FoxE7QwMfWsSAstRa4o1LfiBbxePbbB4+4OULct8j+ZaT4DeyvTsNt6QRDxtEOmHZpI4b4wH@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWnwwe1JU+I3TDGq9KrA3iMcKH6cHuLZXdeWq0IUy38oGIadTL
	MQpW1M+zuolY0oEuOE83KBKq1J++J4gNBScj7X202zu0XSFAN3YozZ+Q
X-Gm-Gg: AfdE7cmMpGMvcfBH/iFkOFXZTliuMfOynojGnTkl9mFZCHuH27WoFBitkXY2Xf4Y5L4
	Ush1tK2AHPfNAEdSR3JoEY9abtWPoj03sbBtBU/zgLJ5o+us9n89FDCHLZvIAPtcjOhmALpYl49
	GfIRFnAub3BJpu6/OH2WYIgQ/bMPNiBfgReg0zvosgD2EVZj/xqPIEQgDQlX4+A7UeNzfxCnyBC
	WnkBxqalCj6T5+dsagtKUxdnG0IrbuWDI/hTjdvG1iug4I90Lq1HcFyrxe3zyWWcj6hu41Wbg9o
	jn0TPRF1MkDjziSLaNh+y2M0dZ0g+5mW4OllaDFPjJY5WYQhopba3IUcqurXx4Ssys8bcCQcsps
	6HiID9P+3tZozim4lmwoEFp3CXbCLKYDumRsh8zdoKgbruanswiqPoiZmVlI/m7vSSoaArYBbFt
	nSz4wMlceEpMWQX21/MLr3dMJAa9Kx4sbij5qXYhC1ft3F0DKzP9ngn4+rqNMJPKYWHYSPew==
X-Received: by 2002:a05:6a00:a0e:b0:847:7f38:27ad with SMTP id
 d2e1a72fcca58-8488975299emr661948b3a.53.1783718820769;
        Fri, 10 Jul 2026 14:27:00 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-8482b333d4fsm6649821b3a.54.2026.07.10.14.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:00 -0700 (PDT)
Subject: [PATCH v8 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
 for SVM faults
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
Date: Fri, 10 Jul 2026 14:26:58 -0700
Message-ID: <178371881847.900500.8789369230260725500.stgit@skinsburskii>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 3ZL7RL32SFP6EQUYL2WPYMMRXFXXGPV4
X-Message-ID-Hash: 3ZL7RL32SFP6EQUYL2WPYMMRXFXXGPV4
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3ZL7RL32SFP6EQUYL2WPYMMRXFXXGPV4/>
Archived-At: 
 <https://lore.freedesktop.org/178371881847.900500.8789369230260725500.stgit@skinsburskii/>
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

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..4cfb6eb7c771 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range,
+						       max(timeout - jiffies,
+							   1L));
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,


