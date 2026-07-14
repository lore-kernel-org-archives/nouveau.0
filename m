Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B0DBC43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA1C010EE44;
	Tue, 14 Jul 2026 20:13:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZhUaPRK5";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 32BFA4717C;
	Tue, 14 Jul 2026 19:58:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784059111;
 b=qVsioFAy0fSjhTnLgq87UcVc4spBJvPb+hx8kg6oPjDp9WzkiuqKmVQMBFcj386cUB4L6
 9Gp5s4e640xrDwSeoaP6xQHMLLIVaqOCAGNrv9gk8tk73WHCRTWOUkLq3Tfq46ClE68xSg1
 WENU6Msruu68uL8Bnj2kOf7Rj4j5Qpu7A54hV6wIyYhjk1VSmJR2w9yDfP/GfJ598mIMlxM
 0vatt90Y9Yjj3E0KNYJ4ZUE2z8/M7NWujCDfhy2VZAwP4CeT+jtx3GxznZwrvvo9720jOJ5
 uElkdCn75B5cwbBOLG2bQAAs3aLhKqkDr6Z4lCTRM81z5zU1hwOyvmNygfgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784059111; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SKEncuDEb35sxzE1YTlJf1hRIKo4X4QhyOOQXqSLrW4=;
 b=v2FYjXz336he0fzDi+hgVoGoVEZUVcTyu4rZCcVwR5IhzA7tqecnbSembenGDdKwdeCT2
 Sl0CZbLCux20ccwiyMd6sgvo0BTe3rE3HSo1MeuG4W89lOFHTCihJvpswfKHr0pfRR5fM5P
 MW/Vj6jNimDsrCNCQkUGQAxq+FzdW9PjEdrcue9MKb2/Vc66ol4WS9xNL0OaAInE9Kb/sbj
 JdPqCTvUBmwLFkNZzi560tj3UIc6mySUMUlz/uB7t7HlTAc3KUkb6Li5lpxC1Z7+o/Z5pSp
 zq9Uq4o+Em3/0wlJCeyIINtRBEjeNACUPR3jYxzLCtWWmxAw1iZRwn8Ccd9Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CB4D547123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 19:58:27 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 617BD10E721
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 20:13:41 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-8487b7b4066so4657394b3a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 13:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060021; x=1784664821;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SKEncuDEb35sxzE1YTlJf1hRIKo4X4QhyOOQXqSLrW4=;
        b=ZhUaPRK5qf0KPCH0IJyAZTKFh6459gGiUI7sUBRpK0PuYY7g9bBJNyC3B5paaiYxwk
         HMC8cYc8dMaGR09wcRG6lSyCcXj2IvxROb7SBzJn+uOFVywHjaiuGoMKTvPqxOAnqpJM
         82KWfol0va8rISfWS4fWSntgKhyf/CisNbNzCq3iizCYuiXSdNhqFK7C4i1X+sYAcwnA
         tV4BPuGuWAhtsurnoF6ZrvNcWUlP6uSNdHqi/Lex/Lanm9twxQFp4nBPJ0+0sulabwAq
         or+rbYVJZqULL4Owu1THLTfsf9PhrDGpnyMWHRAcFeetFct2npvxb6+gptkmzYx2GXbO
         WkTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060021; x=1784664821;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SKEncuDEb35sxzE1YTlJf1hRIKo4X4QhyOOQXqSLrW4=;
        b=blqmweR3aeto1CAgrTarIWXFPJOV4W4hh/E3ZlPMFaKWtSPuG8ai01WbZuYdA+BHU4
         ItI5qGHaqtc9+T9sXpGdtwKyZUG9Ajhk1vFR/vfnxnc8+Q5d3hU4opE1Oy/56F5hVvXA
         QVb5lKxxiEGbQ7x2Siv1mEJZJtc/by/2EvQkUU4IqyS2mue4BDl2wCtf/WweEUzd7hMP
         rArHQtlUJ4xAxOF0gUHY3eBcS30YFxac1Od9fQv9anbHBn2xlIUjS44ObdvPnRWWZRp1
         8+MOlVxNeOBzeau8MJR640pI+d0uzCdzRrAn4GmvNMIvXDI4pDgWDYzIn33apoqaLgw8
         s5mQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RqMo9775pp33YB7/WO6DArpjNXtF9GBcq6f9KH3xRIKPVdeoHFMEu5NVOAgUjCPbJjwPzvx0/2D@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyF/JMe04mSsUFdRHGBfK+dO2KpEAZasGqLZCNvigF5VAB76h19
	jC6yzc6mVqzoF4+umR94fn3aiiuEF6cUUf6iaGJYXFhHTg6+5fSATh5D
X-Gm-Gg: AfdE7cmFaGY0kF90hW4fZmf1N0VxnNv7BOf1DUrz2Ht0GbniY7gIEX4uMDXsm1D+wyj
	vKrz3hfrTFTQYHSNtYUUT4zYHV6eD3fNVmW7w4b8A2SmsmufWdw8BCvt4XZe7lbSG4QK31Vqghf
	mPm9T8u8KpwLAA0pxtrIQT2dWAHqSV+lN5dX9r7ix1nZ2QofYCRCOemHy86h7pS2BtlURhkT0lk
	oz5QQwvI4os5ptjpNK4FFGaQgTnnfARhVJcBYNbqe3cQWrqnJhp3UQCjEeA9eNmmhQ/wENpx8PC
	ONwULPN0vuePOKxA1rKbnF2VyxL2ZdkTQTfsHPEEMevTl/VlRNiRmOK3A2Rlr98ckRGVO2N8bYY
	kSmx2x9CabePJnNqsmTETt62QoIWNv6pOmO+4JlV1SiU5IMYumGEqhmzR5GRt2XBCK7jdCi0fPt
	uEjhFmYDgQxDMkSA5FhAdh5schx8a3mnhN9r5OzA/Z3+IZCNXODNzHTbaOVHI=
X-Received: by 2002:a05:6a00:2e16:b0:846:f502:4cd4 with SMTP id
 d2e1a72fcca58-84a671da73cmr45857b3a.4.1784060020856;
        Tue, 14 Jul 2026 13:13:40 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f81d770sm1966491b3a.61.2026.07.14.13.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:39 -0700 (PDT)
Subject: [PATCH 2/4] fixup! drm/nouveau: use
 hmm_range_fault_unlocked_timeout() for SVM faults
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
Date: Tue, 14 Jul 2026 13:13:38 -0700
Message-ID: <178406001808.1082778.17299764648397654220.stgit@skinsburskii>
In-Reply-To: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NKWGELFPFABCU2KYP4Z3IRWHFXQJGWXM
X-Message-ID-Hash: NKWGELFPFABCU2KYP4Z3IRWHFXQJGWXM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NKWGELFPFABCU2KYP4Z3IRWHFXQJGWXM/>
Archived-At: 
 <https://lore.freedesktop.org/178406001808.1082778.17299764648397654220.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
the HMM fault path. The timeout passed to that helper is meant to bound
HMM's internal mmu-notifier retry loop, not the whole nouveau retry loop
around mmu_interval_read_retry().

Pass the full relative HMM_RANGE_DEFAULT_TIMEOUT value to
hmm_range_fault_unlocked_timeout() on each attempt, and retry from the
nouveau-side mmu_interval_read_retry() check with a fresh HMM retry
budget. This lets HMM continue when it has made progress, while still
preserving a timeout for repeated notifier invalidation retries inside
one HMM fault attempt.

This also removes the open-coded absolute deadline and remaining-time
calculation from nouveau_range_fault().

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4cfb6eb7c771..b1415c2e49fc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -655,8 +655,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 			       unsigned long hmm_flags,
 			       struct svm_notifier *notifier)
 {
-	unsigned long timeout =
-		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 	/* Have HMM fault pages within the fault window to the GPU. */
 	unsigned long hmm_pfns[1];
 	struct hmm_range range = {
@@ -677,25 +676,16 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.start = notifier->notifier.interval_tree.start;
 	range.end = notifier->notifier.interval_tree.last + 1;
 
-	while (true) {
-		if (time_after(jiffies, timeout)) {
-			ret = -EBUSY;
-			goto out;
-		}
-
-		ret = hmm_range_fault_unlocked_timeout(&range,
-						       max(timeout - jiffies,
-							   1L));
-		if (ret)
-			goto out;
+again:
+	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
+	if (ret)
+		goto out;
 
-		mutex_lock(&svmm->mutex);
-		if (mmu_interval_read_retry(range.notifier,
-					    range.notifier_seq)) {
-			mutex_unlock(&svmm->mutex);
-			continue;
-		}
-		break;
+	mutex_lock(&svmm->mutex);
+	if (mmu_interval_read_retry(range.notifier,
+				    range.notifier_seq)) {
+		mutex_unlock(&svmm->mutex);
+		goto again;
 	}
 
 	nouveau_hmm_convert_pfn(drm, &range, args);


