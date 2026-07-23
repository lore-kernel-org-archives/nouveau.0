Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50B65C531FD
	for <nouveau@archiver.kernel.org>; Thu, 23 Jul 2026 17:36:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C56E610F1C7;
	Thu, 23 Jul 2026 17:36:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GIBI3gAV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5D87547367;
	Thu, 23 Jul 2026 17:21:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784827284;
 b=XSZVNGshIfULOBjuLq0xK/TCpDJC+nQ4bCuJo7zcPxb+ejnRWRHAP3G7VmAB5lHfPKEk3
 sGAEiNlXpkT04vZhHT0lDH0aEwil61AXLnIiMMigf1aAxgRmM4x2R7luEZYLuXEMEdXXBKi
 Il66Lx4oym0fwaQg7kevjEX0szPizeT8KYTyTfNdvvo7w0yNJJarMNnzTDJm0NqKj/Q/XA4
 oGYG1954jIoKQ5k9Q5Syg/ElrVrULbxdnSoIZm++sV0zc62QSzzq2+/dpWHJdPYpahYstNT
 hUI1ICALvorXsHcMlcA1OmbJ0jRyHokqPsD+c5eR+gGtj6LEcv0JfGND8/tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784827284; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
 b=qU+MYLBYvEKuPPMlhXcDoUlx4wxKyrsXaIsSkUDbTTOOH9ZHl/fMhnJtG24FPWxQPZCki
 TnogiKaegNa8Z2VjpP7JkZvbXHNaL6jV9oaopRsq/6J+vvwXY6wOrzDZR8RHMBDmloMATGp
 bnXPkANdZlqgmtC5k8BaPE/yE4usot0gmL3wHQanlqZOfHi6TP4Kiy7Dlcvlu35TtkIbQ+0
 sMJTgQCavPZMiX5JmrH0doeDD0T+EiZ5nksObgf5tCpG+ner2AVVc1ivnRrJEK5zDrVoNKP
 42BUn6jOcRyL7WvOe4pUgAMLPAp7vQ/RkDeV5XnLvrpHyhIIE3obzRYp4dTQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 736274735B
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:21:20 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B398A10F1B8
	for <nouveau@lists.freedesktop.org>; Thu, 23 Jul 2026 17:36:53 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-84862b0d5aeso1012858b3a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 23 Jul 2026 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784828213; x=1785433013;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=GIBI3gAV/auUOjUKihcBSyBtMaOATzPUlXKGtM3CZYTu2BuDNcG5CAtu7K2srC+mZH
         4QMeGJyD3q0s+QG+Cc1pPdfgDA7Ck8vRUsxUO3z5LQauPXf9Cbjlq8Msz1HVt+IxZoi1
         0u1W/IJDtNeAwUlI5l/l6q8TGOrPbprEiwE0X2Pz/I7OAfbghIgEHMuJiTEnQZRL7PZ4
         n7AcjuhnpKuuwRvVcXUcvBGoCu1T1TAqsJX2yT2iyUMgqdEfgFX4UBDaOjo9K2HCpkEd
         Vl4a78S/cfsVnyeJjL0vfYVZGuDf7yRSt5nhPVvuP/ouit6dHrsxQg6YrnsbPmk7xkti
         LMvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784828213; x=1785433013;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WVIK4CTS2ebWqFuX16f+6TzH9lK4l3CZHr+WHLsMqrs=;
        b=Ia4GfDdQ5VGoOngWXf/ea263ki7zo826+QjCH55cdHctOK3M7uCnLkgOmSESYLn/a7
         A9hN9n9UluWV6esjg0iwpQr3UEPns4GS2daViIlgJkQY9LStG4b4lJDceMAitx1/sWIP
         ZKS46b9itqvM5t1Xj/shIkTodZNff+jUZYwZBEZ0ewVxeAe48j8sV0gpmIIaQZTjt5J4
         hcQCx5Fuccu+0RQ1sZEmA6O4UHvfPHzjf8tgV50rTu+X8KXAGho0A49Fr8H1HtmkmkFD
         H2PpJL12aKgJ4rluelD1fb4+Lpp7FL9kPxijqow7sAJrj3dHMg5z+iI9gnFg6kBTIvNn
         /mVw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp7prVNoDMjfTbXEAQUODjV1FsYymcrIItZBeChekY1r5vf8QMwkAAsUGGrJ/y+KU9gUoqJfSON@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzfLnm0k8U7MwKhfnWA3gps07zw00DoWERgTthZwIQgGSA4dizN
	8XpHx2s6G+j+oS1Vxh7ZcFqsqkgbCQ1S7w4lfrT7YtyFGoBe6hzXLVg2
X-Gm-Gg: AR+sD12arKymZHuQoR3gTIJiZlVJjF4J7XIYDI8Ok1G9Y5Ie9oX30xVNOOeMUHWU603
	6oRGv5LvcAWcaK6qPXRo0wOdynZylKvolwhYAUYXaKIZ1cb9LsGrO1YXIvJ90/GFy8BUjni54u8
	sY6sc2VEKAJiSx843yZvVWhABagZaNcuM0vYxHP41U3rfY+6unMRnSpCRFoG8B3IyMB0fSVcF5r
	ZPJfDUnpf3Nwa7cX2bSdzha7F1BeRdaPqnNWveGjnp560chAFv2/swrHvfmvQc9DP8YM6ZFlo8G
	wWniAmt/2f+TDB3HFJkZak0myZThcGBalFqxPbz+bZ4jZadRbQdVhmEbmQzdfMt5kbfk7mA5BT3
	lucGQ2fZUafV/V3m5cwcbIL3ZQIfixeN3tpt9HK1YcDSSdx+il9DK6jVFRygrEHJ06tJp2H/SAv
	XxqW/Z+a0F7V6yXbME9gMqq8PJ76GZh7s7su8mpSu4LwgBhl0P
X-Received: by 2002:a05:6a00:278a:b0:848:42d0:bc91 with SMTP id
 d2e1a72fcca58-84e2b7f4d38mr4894542b3a.12.1784828213088;
        Thu, 23 Jul 2026 10:36:53 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84e20622dedsm2691612b3a.11.2026.07.23.10.36.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 10:36:52 -0700 (PDT)
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
Date: Thu, 23 Jul 2026 10:36:37 -0700
Subject: [PATCH v11 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-hmm-v10-v11-5-c55b003a4b61@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784828202; l=2163;
 i=skinsburskii@gmail.com; s=20260722; h=from:subject:message-id;
 bh=KaVy0LDD2WZ56zIlG4jDVljfxrz2j27JL0AnOSACkpk=;
 b=KV2nZSPyVg1Dt5uSSiSffiKfkGgb7W3sWOI6CSqvJIxSZb1CjTMqYYugO/lEA7iz8WZFfaBr6
 LbFOvRd/oG3AQDmUr73ZTQ/tVrKY3HQM715K46T+2IVDrVm2X1nPXe2
X-Developer-Key: i=skinsburskii@gmail.com; a=ed25519;
 pk=bDpriHBYgeTdkIDweZDCemxsU93neJBOCn3YLIuJpnE=
Message-ID-Hash: LJSKX2MGYIJVSEDP4BRVQIJL5DCVKOSQ
X-Message-ID-Hash: LJSKX2MGYIJVSEDP4BRVQIJL5DCVKOSQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LJSKX2MGYIJVSEDP4BRVQIJL5DCVKOSQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260723-hmm-v10-v11-5-c55b003a4b61@gmail.com/>
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

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c | 20 +++++++++++---------
 1 file changed, 11 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index dcc92131488e..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,20 +678,22 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
 	range.end = notifier->notifier.interval_tree.last + 1;
 
 	while (true) {
-		if (time_after(jiffies, timeout)) {
+		long remaining = timeout - jiffies;
+
+		/*
+		 * The HMM timeout only bounds retries while HMM is walking and
+		 * faulting the range. This fault is handled by a kernel worker,
+		 * so fatal signals from the faulting process cannot stop an
+		 * endless stream of invalidations here.
+		 */
+		if (time_after_eq(jiffies, timeout)) {
 			ret = -EBUSY;
 			goto out;
 		}
 
-		range.notifier_seq = mmu_interval_read_begin(range.notifier);
-		mmap_read_lock(mm);
-		ret = hmm_range_fault(&range);
-		mmap_read_unlock(mm);
-		if (ret) {
-			if (ret == -EBUSY)
-				continue;
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
+		if (ret)
 			goto out;
-		}
 
 		mutex_lock(&svmm->mutex);
 		if (mmu_interval_read_retry(range.notifier,

-- 
2.43.0

