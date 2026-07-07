Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8EAC43458
	for <nouveau@archiver.kernel.org>; Wed,  8 Jul 2026 23:27:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D035A10F33F;
	Wed,  8 Jul 2026 23:27:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="S+XbBzwy";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2601746FA2;
	Wed,  8 Jul 2026 23:12:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783552342;
 b=Wbm24eh/qd1bjHPLsIT/TWruT788TRIrSLu9glMnjGapaPSFRoB8leCtkRVKIklHscZeg
 CjdNAtgAg8UrNQOJjKWV50h7Uns5MrNt+VfyyQAutfUFpaUA1gbZJM0KDAtntCKNkPTPL+c
 sVMSE6pYcetuTkJx6KGtsYUcQ9/yWqTm6+RZmm4VchDcn0aZyxFGAxdZw7Oqb9kIi8zLQYx
 v5RsnvbrB6Tvm8rB+O6GySOjuZ9lhRG03olkrMH6+8P4Sfi6uF42W6xLxDAtbA+hOMITlVs
 jEV8ahaFyvqfidWDR2RcopWF4CC6lV9zPa/JCPg6ufSH5xv3aDRPWWAKegOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783552342; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+Fuhl2eREcU7wQkONDn3KjcEE0Ws3TgFkFsQfjplBps=;
 b=Dm88md6o2vUPMdnlyw8qWGzfH4gdsWnQ0JejXeVKIr5ROQoqi9l6AASNTr36mAMHklRBC
 eplGn3FMAHMiqidgZsqeq0B1fTMOj8sDDNDjkRGTP+BzWlBALK5xN6bSY4g0AFOQ08xbFzK
 mroshkY0k17pzRQpX2ZKBHwLnFSDzMYljv9xVgCff5dHy+J0f4BMMKXyVo22a9w9GQ8cSwF
 xdQimS+a7pwoFnpQe+yIqk4NqlsvkluyDGsYKJmrmzBcw5PWKYzqvOK0Sv+lpbnhd7/X4gi
 9BF95FxwNuJc9OeBZ30PE+jxFFgFNEGUON8eLEWLJSp0fs911Y3f9fQvKipA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B68DF46F6B
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:32:41 +0000 (UTC)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA21610E29A
	for <nouveau@lists.freedesktop.org>; Tue,  7 Jul 2026 19:47:39 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2caea3f742bso66374695ad.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 07 Jul 2026 12:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783453659; x=1784058459;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+Fuhl2eREcU7wQkONDn3KjcEE0Ws3TgFkFsQfjplBps=;
        b=S+XbBzwy1chi/Hvryk2HkcO/SE67y/mFdRSTOXF2C5+dQqZ5X/pEi6jyANxRapbjWz
         qlRtMM+AFNKs/5n6oWk2y6UIo79vhcVDsDrd8aG9DzzUJroa+RUOS6X1eayiCpqkYNUa
         EsRNBLO6FFWlyLr46jfiHVMSlicVFPWgL2VQvZu+cKSl24ml/vwdHAD2Opp3C+yBirXG
         KUD6yLZwyRdrH24bSgRnhjRIGs5t3DpMPAr515KzK0NkMddZLXtxp9yrPyzio8Z7Ck8R
         sf2Z+ydF4ccgqbX0m6PduYTDUUn7mlysWM7K+QGdpavG+H1xK6ZawqYa9LNanGgeOT3+
         o9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783453659; x=1784058459;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Fuhl2eREcU7wQkONDn3KjcEE0Ws3TgFkFsQfjplBps=;
        b=FuCPKOlTdU2XGsmh4ssF37EACMGIN3quCozd5suz4UwNf5vdaTEe3qfhUjWmC9U6W8
         IG3ADUS2zrbMgDisxSPeGQyvKD8Y55EEIqM7jYx8CVlAurKj9HhqvWZ4pJb627xUJIAF
         ztXxMH7A1Yv2Doxup9WsuXyhf+qARJYdKyz0oF5GawOARbtoLZp7abXzHMMMe//xo9Vd
         1CsFjcTZTeZR/Y573RqP3cLlpMopMr2GotajxX6O0sQSBbUpoYxmQwv44H/+Nj+wpeo5
         CFfr/oPXi2UJ6R6pCY7qG1twGSavRfZGEINKeqcUPkycBLd7gMqkIOS5S5pAHfakTR8Q
         c0pg==
X-Forwarded-Encrypted: i=1;
 AHgh+Ro5yWXgCnzWywOV8FgNb7SfjWKwrsxGBeWLCM55MK2lmsAKO/UGJ+uL8rTLxOGAw7OXmHSXA7Yp@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAnE8Wx5OpdN2SqJyukbrM8/PDKZb7WUL5w/NJx2Se6QK+RI8o
	62XXSvgl1IIm0qtxNMUpdFj4Ib8ioSESzy01fxmAYvFYg/hT8MDy14W5D/m8Tg==
X-Gm-Gg: AfdE7ckgojBDj1ejZT5NgJXILBRXosR83LKPYj8Z4Za9hpjrqO++1z241RXN2yoj7w/
	hqpWOF5nJeZ9vypWJvyv3hBKkjuBcX2VT9663Hs8rh8mRn4kNLU26KSz1n6fxI6l0UHIyUFnOJq
	5z7dikEcYUp2TkjpCXo2OTG0jr+Cme6hlJIIwRgcjrJzVqduDZwib2L7roprab0yfkda9rU/Vkm
	l+Y+rtfMcQaagMqzlPIyvmYbU6QNffse+58iUWqt/9Ihj+9ZOmvDb8riXddPQraqCukubhYVhhO
	miLeRZqWfJ9Y1lfv01HIFpdgVBWiyAIKubqShS7Fd3fZlABCdGO8mrGR+BBJcVflv/RZIV7T9vw
	vlEP6knCDFUEfeBlDXdX5vVcL7WxPgRNu9eJE5on8y6qDNtE/Fg2q4eqEcjqFwPQQTFZjGhq/74
	TDBECVv1s/HLtrJQOwF44RcHlZpRuTHVylPoVaj5oofgiZODrn6yJZQKj7eBE=
X-Received: by 2002:a17:902:f68f:b0:2c0:e5ee:f554 with SMTP id
 d9443c01a7336-2ccbe40ee4cmr72069895ad.8.1783453658644;
        Tue, 07 Jul 2026 12:47:38 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d1ea7fsm17015165ad.38.2026.07.07.12.47.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jul 2026 12:47:38 -0700 (PDT)
Subject: [PATCH v7 7/8] accel/amdxdna: Use hmm_range_fault_unlocked_timeout()
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
Date: Tue, 07 Jul 2026 12:47:36 -0700
Message-ID: <178345365679.660027.16671418103486907555.stgit@skinsburskii>
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
Message-ID-Hash: UNJ7ZY3SQOT6RNZCQD4LEB4ELHXC3GDZ
X-Message-ID-Hash: UNJ7ZY3SQOT6RNZCQD4LEB4ELHXC3GDZ
X-Mailman-Approved-At: Wed, 08 Jul 2026 23:12:16 +0000
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UNJ7ZY3SQOT6RNZCQD4LEB4ELHXC3GDZ/>
Archived-At: 
 <https://lore.freedesktop.org/178345365679.660027.16671418103486907555.stgit@skinsburskii/>
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
---
 drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index e9fbd8c14364..412f812d7c2c 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1031,22 +1031,11 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
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
 


