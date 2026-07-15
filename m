Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8F4EC44508
	for <nouveau@archiver.kernel.org>; Wed, 15 Jul 2026 18:16:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 93E5310F12F;
	Wed, 15 Jul 2026 18:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rmUMAKGZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D2FAC46CB5;
	Wed, 15 Jul 2026 18:01:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784138479;
 b=0smiRmMPx3TjWtGEsHapNNOgrhdufD/dQqfvVOqJb6eqEgfZTLBP2/0MUc9vqH9XPfW/T
 ozdV0Ei7UUbPp+Vg9FIygse18LuRU62fRh6vxwmii+crePCiCeF1YQn2Le/cZFqZtRrQxz+
 nnlI+hddudOcvazI5/Hf3LbKqYO8PuNrMKobE9MIX08P2l3+I6OXtWq2WIewxAkqOgsxvCo
 vfupqzXaE5Ne7K/tbnRQXhiIqbdNk+Q19NMig+Bq0ejnCZPZwObTzbpVHxv6RewYsjv9hlh
 Hg9csMOtuPwAWqtyQtSHAeUypv5vCekFfvCbjKQHOKXKbgg253YIR1tFBscA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784138479; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
 b=oTiQKVeXTZW2xG9lGd8EaaVzfOax5o6tpkxwZzBjuUTcuwod0Q5dpcJsF8VuSW2h5WW0t
 DqsgGyAF6pI6VQof91CmafsJA6H4eD5KWrXryo0oja60GGHFD5pZW5/sIBsKBcLQZG5slki
 oSK8pZzzEiUdmf7sBcGYXVxfOc2KRA7KEevM8JH50VHeCs0m1zj9yofhvrGt9njE9TUCqQH
 egfSBP4CYn490ysHHbQx76hpNGg+4Kv9Uz+LnlVz8ul8TFrZsOOFXQwZWpu6yDXnyXti4nf
 VBUJqm6cieaHuWVC1bYwQCO1nnOYJHHP7zh0fXTtZhA2TYiau2x9MKL2i78g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 54CE346CB5
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:01:17 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7C6B10F132
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 18:16:32 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2ce7d2adef4so34915175ad.3
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 11:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139392; x=1784744192;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
        b=rmUMAKGZRAIFQsIeT8yjt6wWzuwzlqMJRcL0sDoxltpVKp/hTBLzkDtN8S7E/o/KLW
         NS41/J5+7zjc0AX0J1P0B3s4UC3l14JcRTLCrvqwChuQWsrU6EEEbBZJgehl9rh/Xo9O
         6R1Cxr4mukJyszkS75j6PuaSYtx5bMY1N60GOAszlWGaPdQ3z1MdgafHOlVcHMkOMpfo
         6PzdB1LrQ44QQpijs0haPuGIuKmzjXFXhTzDYzUyqtMGn78DAYkz4s3zaWivhHPZsxSy
         gtYEepyeVbCJJjwWUnLwMuJ9nGHRXT2V7wFKK1FVdSGXenbvghR5EqC6sSCGP0zAXftj
         rOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139392; x=1784744192;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4IcjMhwypTXX14WXh1GVYxiUX1ayGU/csb6g5Y2UiV8=;
        b=mqgXTR1gKyTRlVmQ9e7rZ61GxaqpM08dqMOTyELC9t9CL2lTt6ORnZeqCc5FGQrAMe
         gFgWTi0t7JgzKi5+OTR/GnsBUS5BnfR5ckQFS6QOZM6amPLTayg4kRgR1RHZN1qeF2kN
         AjFQXRp8B4bsXS5Dgiwfwgn4nfmlEvmYFIv6nCSM3ZYb0Nwgqj6T/GhTqCYRD0uhFDkW
         NLCrdEj6mfQ639EYVticLnu3o/Nzc6pVnB5U+7i9fai33RSj4vXinWEOYHvmWkmNu4V5
         g2VdWa5uH1IbFZgzA6zto48nI7ag1yxbV+97nYv5TTbPrj6R7JdklSAbah2AP8Ya9dGU
         9LbQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RpuyvjXYbHusT4E9d7DmDpVfSp4eF6Rml45kmE3oEKCARDXpQD3o9JWnCiiDCh9o577v6Eqnghc@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy00mz7OuUUVtlMuJYUY6ZwTg/MPAPujkbEG9G4VWc5fLgu2KTX
	wRjLXJ7nizmm7TP+U9MrKAcqqDGYsRC4WVaD3mYs+DVNKyinz5RD1oc8
X-Gm-Gg: AfdE7clqCYUClWzsN+CtUUuXuuwhcxfIpyA0C6Xq6woUndoIdBnhU/JUYIdbYBD/zeG
	wzwnP6kcdkwwdWBksubTmoH0fgAVdE/WfIiDdZw5OZi4GPc+l4FkOjaB6wm6wNLhJEWFW6dKdcL
	iWiwsj6tRB0h0C6BXSFSA7KjqCivtdeMkLT5Ea54hRUyjI14zDwFwsRILWhEpH3kZjIPWDXplz+
	fpcpH6U6JC0E9n/UWoBr2Jv07R3GARYAyKdbLdEYBuOs33lP+zCMLx3TcFkiVIru+IbJRxYid54
	E4lvwhHXF0tXgGEUcoZ2/2mi+2Vvn2qxqvx9x1ufJPO7D08gNc5RknY3zz3HRn8Vi4V3/qJ5QHT
	6LM9mxPvLeVn+5rNRDB8xIG8PiP5EZaPe9Dv5/5JCCybBOUqaamEtIQVzbiQbA6XOCDUnF1GKuz
	XDfWzHg8wddKTrSEMRAKtJ7iBhqMZdrxjwofV7cSDDz4x+2b0PnpU7xCam4p4=
X-Received: by 2002:a17:902:f645:b0:2c9:fc14:588f with SMTP id
 d9443c01a7336-2ce9ec0f95fmr181359435ad.29.1784139392357;
        Wed, 15 Jul 2026 11:16:32 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cf100e3946sm6817295ad.4.2026.07.15.11.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:16:31 -0700 (PDT)
Subject: [PATCH v9 5/8] drm/nouveau: Use hmm_range_fault_unlocked_timeout()
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
Date: Wed, 15 Jul 2026 11:16:30 -0700
Message-ID: <178413939024.1155966.6246787744253724390.stgit@skinsburskii>
In-Reply-To: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
References: <178413903133.1155966.3904063656020521607.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 4DLC2BIQ4YHBJHJHBTFQJEHOHNZB42KN
X-Message-ID-Hash: 4DLC2BIQ4YHBJHJHBTFQJEHOHNZB42KN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4DLC2BIQ4YHBJHJHBTFQJEHOHNZB42KN/>
Archived-At: 
 <https://lore.freedesktop.org/178413939024.1155966.6246787744253724390.stgit@skinsburskii/>
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
 drivers/gpu/drm/nouveau/nouveau_svm.c |   20 +++++++++++---------
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


