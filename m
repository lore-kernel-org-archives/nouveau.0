Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED73DC44506
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:27:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F7DF10F337;
	Wed,  8 Jul 2026 23:27:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="hIarAfyR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8583F46F66;
	Wed,  8 Jul 2026 23:12:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552340;
 b=HLA6Nx5hsxpLlfcvaUqlMQsiFVIfJn5hO25jLIj+krGBc+USbCL9MZjlHd4M9tyKwD0w1
 yXm9sZJnCh/s/aDNBzmer+5/3H+Y05oU1DiMcT7Q412vLYXOSHc+zUJKHw4J5OW6SBNImEs
 vJjz+15Ee0Q2pPdobYWUurpBbKRb85ha3qZUII6IKVjAA7AJIRfkSVp0qB7SXt8jdk4H7jR
 fQs2MQVLjhjtt8v0TiWCgJY+xS5WYAgiR7yX7DuSqH/JtBUC1HczUD6qjVM/xl7qO932U8s
 xlnuB+sp26/B5jEZbrhmrGidS7S2ue/WzbXNjDvoKCtIhnv7gjFIdANxMxXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552340; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WqmeYeEILR9RvWotHFEqmi/tcbmYPgYQ90HTJiqdd/A=;
 b=e0QVN5eZjyHJmTpJVgBBtk4FGG4BxrLWs6egSvRRvG01tryvIDwt1K4D6DvOUpimCW+j+
 W0F15C1SK6p980XHQ4Hsc4JcSO4taDsTMHekQi7VSEdEK9D8MtyNdMNb2B5hhxwrdx+uj0t
 LTwPg5srqy9XaS1jR41wOxd8R4qM/LaGNA4u6IWqcR79XsbUz2y7xyDnPQaOi+Q7fxyryqB
 Wap9uoI/eST7fBsP2+Trj12uT1akETtyxjWQ5tMfSOf7Lu+q1lOe03XsxcAxVGf7t9tUspl
 l4BKgrIIw06TpHK69EjHHhcDIsqmGSDmee5F6bcY8idph3e2bkKY6l4W2Ggw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0995246F67
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:32:27 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com
 [209.85.214.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D6C210E29A
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:47:25 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id
 d9443c01a7336-2caed617615so38588235ad.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Jul 2026 12:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453644; x=1784058444;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=WqmeYeEILR9RvWotHFEqmi/tcbmYPgYQ90HTJiqdd/A=;
        b=hIarAfyRvji8GY0YMYmTGYIiWCldkVOsO3e6YDnnl9rr3U1pp2pzmdZTL30sDGM2Rj
         /hg+txXlcumWH1ejCM585rTAU5gkNyjcSMvRfbiCVlEPrdF86PCUsI/wlX58sS1snIiq
         jeTgzT962mZIA0WJhc6FO6WE3Y1u8gmI16Gh14BrpYBr9dDw5sgQE5605FVMmQVsKUz0
         DKdHLcDu1K2B3uSdXPIXXAJniS7lzDaSkTeqhf8nnWDj8ZfmRjpnEGShhqletAAklOZh
         QTPq3KHfYOfBZjtajnviY5ZGC738nr6Hi2zbpLWJ7GfMA6ORwjJJyhheHd+i0g+tUeyS
         NbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453644; x=1784058444;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqmeYeEILR9RvWotHFEqmi/tcbmYPgYQ90HTJiqdd/A=;
        b=Za8lppJ+d7C8rx1H6CVkeKiYhcM7gMjAV1LE6oCyeCzdwsiqDNUAzUzCeZ90y42McS
         VttIpSw1umP7spJ1iCPT0WGnHVCmIwv/HrCSqiGQBGCMa0+dA3JYidvifrQYeayXD+FW
         YKsfJ215B0VO4If3xL3zVcfL1sIt21a/pA5Clt+1u1lJumjb19pszgcWgJ01FS0RD7I8
         7gPhNAu0Fo3gK/Vknz3HYLgBU5XSRtv6oWIcoJqreqCb2ziKTB4Bf57x8Q2E476SsPH2
         bYy7TJIDNxtdKSVzQRDI/plJiLb+P3qXJvmNNs2OgL13W1RnWNSXyBumippOg8x7BKm1
         mbOA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqFUA/TGZC9SfMoyTw5ss9IHOtCv+UXV1WeTALUCJukBt7CwiW8cYA+VAzATgH09TsORx0C8wmu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzTrVeBvnUbzQcxzqyVPeDQurlWm9fwX3vTfezOY9WLoTsT4iYZ
	0pBGYEo66AyuUxytA1onKeYvFGdkpOl1WP+vI8GC/ORgld9gai3EXK3as+L/Fw==
X-Gm-Gg: AfdE7cmoUiT57NPF6C26X37qzBeiHIe3qQkAbqFGpOIsNv/CsbuuHtupfvYdJ2eafw4
	xC8KG9E+LOXnpBklT/WXI3kT5rhfPw8dYmt3fXS4pbX7c6/uj8PDwe3e6ZG8BpSFA95c+zw76Un
	diP1clRX9s/IESm/jrPlTzum9ziipWMRxAQ34JeU6dZ0jICJvFEB4/ja327ySXuy5h+tXjRRIfP
	4UHqmqLWexg0bPoD/sqEO3qtV7AOCOz4MkhS6cPQ4mMtiSWpSFv8dLKk2FAMUsx2NPLBdNQWhhP
	V9EJF10kd3UzTF/dzZ2Vdn72hNlcGLQV+u5lxogSdEIGVYWpo3e6GvQ9YuxDA4V0CxZWgkZKxxx
	cwDhJrmzKyQ37YIiGinU3d86uL2YoB2on4HROX+HDndziYmphY74KOSl+5DsnLQ0x1Pg1xpArn0
	NO6RMN+ifuGhx1B6x8CNIv7eKH+1mPRPFncdQtx9BvzlR2lI0PIcIhwApDm7wrWJjJOhBCRw==
X-Received: by 2002:a17:902:ea03:b0:2c9:d8c6:1dc3 with SMTP id
 d9443c01a7336-2ccbdc41f65mr54794995ad.0.1783453644502;
        Tue, 07 Jul 2026 12:47:24 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bdb7e9sm17819615ad.10.2026.07.07.12.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:24 -0700 (PDT)
Subject: [PATCH v7 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
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
Date: Tue, 07 Jul 2026 12:47:22 -0700
Message-ID: <178345364273.660027.15274510603185163961.stgit@skinsburskii>
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
Message-ID-Hash: TVAE7IBF4FAFKMGVUNUDVAON6WQKMW37
X-Message-ID-Hash: TVAE7IBF4FAFKMGVUNUDVAON6WQKMW37
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:12:16 +0000
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TVAE7IBF4FAFKMGVUNUDVAON6WQKMW37/>
Archived-At: 
 <https://lore.freedesktop.org/178345364273.660027.15274510603185163961.stgit@skinsburskii/>
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
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..ba93273341af 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -683,15 +683,10 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
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
+				       max_t(long, timeout - jiffies, 1UL));
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,


