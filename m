Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC28C44507
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 21:27:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 798FA10E25C;
	Fri, 10 Jul 2026 21:27:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="LB00bvgt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 845394706D;
	Fri, 10 Jul 2026 21:12:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783717932;
 b=qKNzz7OuBVrGT0JA6F/JWvMmvJdePFD7ZEBWHmPqjc4IRP8n+kg77P4v0mpNhmKN3Uit0
 c5KVt8HKgCJ1ywzQnnZZ09NMRTY5oumLhbva9SutSKY2N4Ss0Zga1cCVIBTyGyKY+wapqmo
 k8v6o9kqbvbkQA6oXnc/JrJN3r1+v+/Jb2ZWPh/umA2RFXdbZhyY6nmnk9XoMa51p6d+raO
 MolqPMmz8a8JfrKqahxm3YpRRC+5W6kQpBQ2zb4XD7KvpOhFdWP0hphFCTFgEnHXfoFQ2Gf
 PCQSlNcPXGpl0qjJmA8N9XomNZ4UsrU9uvU9VtUY8WStmybmkw8TkDVCVZqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783717932; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SsZ1Rl/n/xZapvBLsULQnfYoRJnC5F850v9mJm5328I=;
 b=B5PGfbbiG6dMi80yEo2W0n56wse4Mo9z5QBPE9M0rfWcpd4/5S1idnn9qPuqY2GDr/C5Q
 A98gmIujjgIS5k2+hUB33zRKuTmIwWsv+CQ3wuXknGhKIYF0tlLrX2YUZt8HZjgJ6rUWhzk
 +FLoVSSGTzjcEBscBfHaQHE0YJ9tsgLm9tbEX9v35jkAQrjNVoh9F/W+fycQ1cdWNlIj9OQ
 pSA2EORMcITsJiy1lbkw+AlKCHo3nmQA9e+KlqQoqVcE7ik6FPuxyVLNknQ42IbEuf1fVw/
 6yerT/I1RIxrrSmFd+Z8CRJ1wIsvdmH4hsHaKXzDmE9dln1ZQg6/QtkKk8BQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C111546FDF
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:12:10 +0000 (UTC)
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com
 [209.85.210.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9404A10E494
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 21:27:15 +0000 (UTC)
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-84864086bfeso1383448b3a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 14:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783718835; x=1784323635;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SsZ1Rl/n/xZapvBLsULQnfYoRJnC5F850v9mJm5328I=;
        b=LB00bvgttTI29BSFvJxkKHWxTgwiu9llCFgDnPe/usTt2ghuy0rFA1LlJzTStos4zf
         4BPbI62aN2u8jPrz70NGprLzKtY2OAeXwCq7tqT6Sl1aItSJueiiHqZmBhaI68zqgNf5
         EqtWlY2WvFE4vNU6XTFrZc+IIrd4tA/OqEoFuU2IpagRioH56e1vCDgOTh+GTN42/bcp
         Dc/F1awNTDE79TzVbn7N3CBVIOxLjNO8Bc6DudofDEuajNlwA5HSXeIDFB/KJovssjpK
         DGkBqr/ePkmVCPamyNcoibZfBUM3QwKScKKJw8funHBskeJzftLzykSp+/rMNjHGzCIJ
         FZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783718835; x=1784323635;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SsZ1Rl/n/xZapvBLsULQnfYoRJnC5F850v9mJm5328I=;
        b=E0FMtucjgIthGgczd47cOTlPw6AX9xklNk7vRYqx2Nwu/PO/5SrLy5L5vrw348ixb7
         iCgKo9QwXpz8p+uVtkIe3AVh1txDXYJ9CyE+exfkmqXb1x1btqhuL4EXkcPmeoThJ82+
         ohhOdMxWOrZEKlg0shyWxkv9ZpCC4mwRu56gkLWMyfHstbgKegY6etxjah+rZPf+0g9H
         CT2SAf3DRDTGRz1CrLm3OdPhixT98Of8iIuUgW2OYeAZ0kSFGV6pPD9NESiyww3D6fNM
         3GrXUdM/TrFJXmSR4Qv9EiM4f6w6YtKteIKNH63v0Cfn1tmi+rQ7kfQmiKJExGBwThMw
         Ib+w==
X-Forwarded-Encrypted: i=1;
 AHgh+RpTMGgx22r52qXL/koELhHi9jSuLBuqDNPoUnVXfXAFzJttPxfUbIwP8D2l2a6VeFrR90zNU1RR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBcm6RcExp/7yolaq1i3omqEG+4Gtwk47c1J6fQv9QJwTveDUR
	0a3R4hjfF0EmC4kbtC5FrAmUqe69nhEVFWXDT+RYfnkxySVPQPjNUi5W
X-Gm-Gg: AfdE7cncT3zk6uQd+FN8NdDhj1JbIJvxMFijnOSuROy63Z4hZAgMjTPbl1RXyqlASdP
	jbcnlq/BlY5OCkC300bRw+8pzkX1NFOuzSnZaVG+25J9NQ3WwAD3K+vxhR/wL8rhKrnRj4MN1Bu
	IlsKTulNOS+ZLAWNqTOdpZ3SacOM02luR+lgQjpdUEDWJR3qLpdMAp4ljIHKwgNy/2sdZ0joRYL
	u336D4l5IKspo/EMWj9+Gex/Jsvv2fb2Cx7dZ6CnrfIfsm9RqVl7Xpj9yqHXDjAw/oGt1mK0ieM
	zSBLt3GCR46yl5SIYktAu5PsMqxcw1uHJohTfqyo7Sl2h1TbihQmBgWVdF9SouHeqVazPq/DNUE
	ilI6BWD6lOw0/4d/9ViZfa/Mo9r8zmp/fB6T3pASmz/iMPe+d4YuBnEf4AvPq8nTKjCnGrD7Oc3
	KFALFK+xySfd7mOqJ6phjkdXfJ4eZXfxurTeW8t4U5nKVtjbjZwd3M15O86Bj984UaFEIUpw==
X-Received: by 2002:a05:6a00:3397:b0:848:2f84:737 with SMTP id
 d2e1a72fcca58-8488990b261mr583131b3a.74.1783718835015;
        Fri, 10 Jul 2026 14:27:15 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84870d76ce7sm1801076b3a.55.2026.07.10.14.27.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 14:27:14 -0700 (PDT)
Subject: [PATCH v8 7/8] accel/amdxdna: Use hmm_range_fault_unlocked_timeout()
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
Date: Fri, 10 Jul 2026 14:27:12 -0700
Message-ID: <178371883276.900500.12789147320642521200.stgit@skinsburskii>
In-Reply-To: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: YFFKNW2QLNENPZHVVTMFRL74YXRRLKD3
X-Message-ID-Hash: YFFKNW2QLNENPZHVVTMFRL74YXRRLKD3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YFFKNW2QLNENPZHVVTMFRL74YXRRLKD3/>
Archived-At: 
 <https://lore.freedesktop.org/178371883276.900500.12789147320642521200.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
It keeps a single HMM_RANGE_DEFAULT_TIMEOUT deadline for the populate pass
and retries -EBUSY until that deadline expires.

Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
the mmap lock and refreshes mapp->range.notifier_seq for its internal
retries. Pass the remaining jiffies from the existing deadline to HMM,
while preserving the driver's existing outer loop for interval invalidation
retries and for selecting the next invalid mapping.

Keep returning -ETIME when the retry budget expires, matching the driver's
existing timeout error convention.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 54486960cbf5..a16b8d7deaea 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1061,22 +1061,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	mapp->range.notifier_seq = mmu_interval_read_begin(&mapp->notifier);
-	mmap_read_lock(mm);
-	ret = hmm_range_fault(&mapp->range);
-	mmap_read_unlock(mm);
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
+			max_t(long, timeout - jiffies, 1));
 	if (ret) {
-		if (time_after(jiffies, timeout)) {
+		if (ret == -EBUSY)
 			ret = -ETIME;
-			goto put_mm;
-		}
-
-		if (ret == -EBUSY) {
-			amdxdna_umap_put(mapp);
-			mmput(mm);
-			goto again;
-		}
-
 		goto put_mm;
 	}
 


