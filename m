Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 700ACC43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 22:21:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B66510EE6E;
	Tue, 14 Jul 2026 22:21:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q/DK8wL2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 64928471CE;
	Tue, 14 Jul 2026 22:06:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784066786;
 b=Mf5DiJ+fEsIgjwR7ILdEDMi/XTyb6zTy/gNc+tqclM1rLoU2l3dx1fNiMnVl0aerRmfY2
 7V0M4ii3OHlWiz3WcRGtJMnFdpeDp6iEmvmMwk8tVLn5MrkJoxaPfJmJ/boNS1+7dngdJrP
 5dmmC5ULhQy6e3NmduUhKEmwUB7ruKPlf7RxkipY20M+lbRJRwYDT5Bb8RbDdCwa0YZWTW1
 cpXWy95xosmKv1J+Us8Y8fT+XEPxQHSAGRNUvmZs0TOaGHZGrl6GFoE15L38J3ySWHoZh7L
 jHQJPCcGCgvmnADmnvxBtYGLJKUooA47nwFxEZDMxUrIiIiFsqISsoCV3k0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784066786; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
 b=J72AM/BD6ghicEhIOt8BhZKIXX/OoQInxxrdsNUgiiTPGkwMxAhfeqZeOgfUG/mP8Qv+P
 hqZOC69uOaNAHJKHVn/pTpNQOT5ME5+0vmKpOVx0fjFLgh5D5C16Y63qqUFI5kXkAm4z2mU
 KYgvMD/CnR7F51oYUNv1tBqg6yYfcMjNTAio/GheFEGfmmlryBf4v9jppycVUbESke4vvFj
 8e872PApDjjVhkD+Wo9OvRJ0gr6KSgS+R8YJKSs6tpRCAZ1k2lOd9aiO6r6CcKTkJYan4pq
 wK35XwQfiJ0ejg4sENat9Xi6s0Klgy2GdqXR1/7VnaEv01r4SqGBIYnaBpcw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 497D747123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:06:24 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1093610E0F9
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:21:38 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-8487b7b4066so4753651b3a.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 15:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067697; x=1784672497;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
        b=Q/DK8wL2mr7Tsbp8UGSA/7t4vh1g9Sm6kw2UE6/AAPVQ+RkPPpTFA5YlDPxOPVL6EW
         2YJbqVHpLWuD7XVBNc+89GkI3Zkay7E0fICHcKa43onulGNv4B1wV08WB/n8x0lACRYI
         wEaJ9Zl45/IDlNsH9Lm6oEbiVi5QU0C6hhMiI/Mj/3Xe9qE9BTZ/a4H08xI17A2pSLzy
         jXgNjUNSiUMc55lXNsCC1eFnkM30ODEJeKTvHzK0sVY+hpxe3mWzL5OmB/G0EI+Lg86I
         v9MBdSkhJg8BkvfkF5TckqfJiGAN3Sg3jPNBh19nlTk89xaTtu76jZ4nMxBJ86J5GUQl
         3V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067697; x=1784672497;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/XP8nJGTiSx4jpNVu3XVkKeZD1kh7QswKhz9rXqGp8=;
        b=KOoA/xmOkTfwfzg66r5FTPReSVURGU6PY4d//gs63Qr1eFRs9CmTlzqkUmJrM/LcnB
         mKzoPhg3SeAcroazJLBF3bTPhmXvF7AqJNVDRVeJxH5iXrVtoUwV2nVUO+rt705/Ik6Q
         hb+2vVWmcNt0b3C2MiIHhmwXhbYgvKFXd6qq6rJ3H1eDN3eQEd8hZSGp3V/hOnlXW3wB
         c9nWI/hTVjDqk7qWzQ2w6BUL5hTEFtQCRx29baVoZ08PimNAa6Fq1K0s3QJzat5WvYFq
         j0mmknZB65xqholAFxagzBJNKQneiQMlWHpn+3IvmzuRnFEjefODkadRYD5bHfl3vbFE
         vlgg==
X-Forwarded-Encrypted: i=1;
 AHgh+RoUN5W4GUPvQAqpaw6V5VT0lTGPK+aJelsmPD33zQ+dBjYPdVqqKtnbogDji8j3MF6/MLR+uclv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWLgkf6r7qkow1iDaRirii5MCH6YIMSWke510yWOWA7U7H/jUv
	MylqRNPe9WJgjXcRAvhX1ujWqBZNprb6/bA/UYN8UwoYUtvqAa/vTuNc
X-Gm-Gg: AfdE7cnoltoDRbAlF/XGTDkRend9+88pQQPHYPw206JPSX0COEYLPhchYk1tBF/rqC+
	u/yddaMT8QOzYYfaMO9QWeJm19dqOfomYdjUrVuuWpgOgKqcXWHltYm7mQ7Wm0TsQe+p6b9jHZf
	wE32plV1vL7nVLmyUjfleNmngQX5FefGLeiujv3pnBwwmJNw2YqBT58Eu1AWpoABHP4NnEoMJ4T
	+pXPF5hQ7GZTDv1rAcZBAbvH0uA00s3zquCKx0nkGo6cNojfCUUJOpJL8nu57CPly1HVOaUbWUs
	+ZfjJnONZ9SQM9Ww3Ohne+rah2ehDAnBiXwzm/VhUjYwpRX86lJ7grFLAQjq84gPmbe0YRY/cYy
	S21ktPbYPkz0yjjModrxZrIpd7pQ4kfcIICjejOBMNLUoEi1baEIqRNYgSPUG/q5K6rKfa+V8C5
	YAzXG4NwqL/XrhiJJOUqQJ7JpF54vE8XgIi5X7axSSZ+/mJBCkqXH6XD5z3l/19elB+itU5A==
X-Received: by 2002:a05:6a00:4b13:b0:847:8dec:141f with SMTP id
 d2e1a72fcca58-84a672ea3bfmr293017b3a.51.1784067697563;
        Tue, 14 Jul 2026 15:21:37 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4f238f75sm2119769b3a.9.2026.07.14.15.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:37 -0700 (PDT)
Subject: [PATCH v2 2/4] fixup! drm/nouveau: use
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
Date: Tue, 14 Jul 2026 15:21:35 -0700
Message-ID: <178406769581.1106335.2090301352195900623.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: KB6B423HPXYQCCTBDABFCKXJGP5NQU35
X-Message-ID-Hash: KB6B423HPXYQCCTBDABFCKXJGP5NQU35
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KB6B423HPXYQCCTBDABFCKXJGP5NQU35/>
Archived-At: 
 <https://lore.freedesktop.org/178406769581.1106335.2090301352195900623.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
the HMM fault path. Pass the remaining SVM fault timeout into HMM as a
positive relative timeout instead of open-coding the HMM retry loop in
nouveau.

Keep the outer absolute timeout around nouveau's
mmu_interval_read_retry() loop. HMM's timeout only bounds retries while
HMM is walking and faulting the range. Once HMM returns successfully, a
continuous stream of mmu-notifier invalidations can still make
mmu_interval_read_retry() restart the operation. This path runs from the
GPU fault worker, so fatal signals for the faulting userspace task cannot
be relied on to break that outer loop.

Use time_after_eq() before the HMM call so the remaining timeout passed
to HMM is always positive. This preserves the old timeout behavior at the
expiry boundary and avoids passing 0, which means retry indefinitely, to
hmm_range_fault_unlocked_timeout().

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_svm.c |   14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index 4cfb6eb7c771..58735446d783 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -678,14 +678,20 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
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
 
-		ret = hmm_range_fault_unlocked_timeout(&range,
-						       max(timeout - jiffies,
-							   1L));
+		ret = hmm_range_fault_unlocked_timeout(&range, remaining);
 		if (ret)
 			goto out;
 


