Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD090C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 22:21:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AB56C10EE77;
	Tue, 14 Jul 2026 22:21:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qovwK4d+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C7AC0471D1;
	Tue, 14 Jul 2026 22:06:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784066794;
 b=MmhLtkIMj1v2BH/5vMmG+JlK2BXfpW0eQZIuXg0IfIhh8a4kz3iMDvg4z+EhDgQBqQVd1
 GD78cJkuxKsZbUchI0Zu3PzmERzCTI5R9PlfU+42GKp1lS/7fINV0N9djg0Db34BpTz7mAo
 nPkUw/zS9a279h96wRgQKh3rSUcHrab+jY+Gr5Qo31dVtcUR1ifWwurPuD3M3Ir6LvaTx2n
 +azgZvKVEnkq8HNJodgcCwFtyO9a1Jq7lC3Os+JIGksEKt9lm0bO8aKkVRB7yu47nk1/GsW
 7CnErCGBCfJ/y7AQdYMGJUCG3EOGYXb8X0DqfX/rYO1Hy9Qk39+BMXFa8JGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784066794; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=O6UyZtJMGWyTXwkf9Ut71gXKM+acqkuQS9WqdrHTITA=;
 b=ivFYcg1nGh/TgTxwl1rwN/fS7V/wZ9Z6iow3OvOJeoYAfLG0Uj5m8bfqsDMuMiy3fEA3O
 4jIxaA0Xg/mGhfVlatZIOmkBiEWtPwpJQ4f7MdZSn4ygPNXthqcps6lvFveGO7ArhfSMOwl
 Lvyoc88buFI+s4hP0Xrs3BQUNZ1H2XoQJvBrZwMOn20zlGsJLnIcH8WXPj3Ti9ctKkNzbi6
 IpDEjrahOFmmUhkTKZVpl7ccxwJZxvXrsYLt3P/I0mD5a+EFUsFAo8vc3ivjqZHM7exYQIY
 k7zUkYp1ymecj/dHgQ0B2/0g04f/mUbMDJdH0H291P5bHFqnibn2Rw/dB2nQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2668847123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:06:31 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
 [209.85.210.173])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD93310EE6E
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 22:21:44 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id
 d2e1a72fcca58-8485bd28dd0so5395639b3a.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 15:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784067704; x=1784672504;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=O6UyZtJMGWyTXwkf9Ut71gXKM+acqkuQS9WqdrHTITA=;
        b=qovwK4d+u27hpvbvCUVjMBJdX25FzMq8uZeMXgsjDHSIn4u1DJK1j1TFqI6w6R/7aM
         E7iOLA3pmFJZGh1BeWErl8lfaPFVrhWPX1CKv9AbxsFhTgyYqSAh78QLO8JKIsdoeDPx
         DFr/Ksw1M1QSr7sSESTsJFOR1MEnSruLDpNgFTK2atzVWhZaRC62NVKyju6Wi5UJpx19
         BfFl8GwkbvNemjZXiyoiGaIiOA0iUYzR+4IMyG64+Cm090NxZ1s4iXTkMeNB1ELJWQab
         sBd+oYGPJ2UC3DhHqsp+VaaawJbvusOVU2HPj7BPzCbP60S1UjmFNdAuFAh71C5kcmql
         zSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784067704; x=1784672504;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6UyZtJMGWyTXwkf9Ut71gXKM+acqkuQS9WqdrHTITA=;
        b=miE5k5snPeD5ORD+AztQ9/tq2YrD1YOVUqmQWcpgaUdYHsPvFgYbgJVzrUZOkmYi08
         VPHOXPlPkSI85sPtOMA5Cy/35wjiVDBVtABfplKVeEeMsYaOxkBrCZ1WbEc97XaBADAf
         Ld4ZWksNqyNI+Se0170KNUjnf02qAvNBaENEfcvz/rIkpVy1pHF/i2K2Vmogl/Fi59aF
         SDANEjZ8eshtKrOYEyScLs7gfADP/s+pxxw77q8E9D2s893tX1yORQ9bIuu4l+Du/Vo1
         pzFeVZwY4YcxEpADO2h64M3+XmyXa7gTvtnQwrS62sC9bAlXrsRb4cjPdD5jnnQlGStJ
         fuKg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmZaUX/vipMkuFZAGAw+q0dbP0Gqug0l1xUI87IFtfytC3n4BZgTAQcLKRAUVTFV0nMnCGYoiw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDOirxq4KH9JWDgU08cPyRMZxhZWzNhSuhRVnR+aaUEl142YIw
	xOdGYXbc2eUtcvRGzYzyR4AmYrjxc0DK452E1IopZJcQmVR26PvEQZjD
X-Gm-Gg: AfdE7clFP7o8fvsV/UWLhOiP1jFrBroVW+dOr8B3hZ6wae+3Htgy88eybawJb/aGJNb
	1M/F/wu4y2T4SZyeJIwUHbfAwlRXujO6NYSBC3xu0qYH2VoUuP9ryclFZbraf0KVUBVdbieclPi
	dEFQvfAMz9LjwapyI8o8akod4wLl8j8mFqJo/vabRJz1l92gMDabJmXjG2rvNPRMhfTesUfQ9YZ
	Q7Ko4znrsOPhxZCgINIcilgdrMCeDHrU/UDZ6AvV2pJAq2RlQj/YVz6LoifvLE44e4t5Sq7niG6
	0zrh51DgJqQTL9a7cnpM4P71NaS2T+0E9f8htURjIf28B054NQRnMfoH96XGh2OgsIwDDsGs/GV
	KUmJTP8dR8K6zjLfxUOnl1i/BauAkxZdow0z0JDtkU9Ex/Mo/K/EdVDqLfZON7x1eRVRvYVZRbc
	sRyV7M6S5etBZB1vt8A6pr1hvZJUE+OWIll1Vclqi4ysh6tkX3xHnPPV9FzRw=
X-Received: by 2002:a05:6a00:1819:b0:848:4742:90a6 with SMTP id
 d2e1a72fcca58-84a5140d4b5mr4845081b3a.15.1784067704431;
        Tue, 14 Jul 2026 15:21:44 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84a4ff2ea4csm2010807b3a.23.2026.07.14.15.21.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 15:21:44 -0700 (PDT)
Subject: [PATCH v2 3/4] fixup! accel/amdxdna: use
 hmm_range_fault_unlocked_timeout() for range population
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
Date: Tue, 14 Jul 2026 15:21:42 -0700
Message-ID: <178406770278.1106335.17232929459598625570.stgit@skinsburskii>
In-Reply-To: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: EYXJFI5YUKIEKVDCFJUFFD354OA63EOY
X-Message-ID-Hash: EYXJFI5YUKIEKVDCFJUFFD354OA63EOY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EYXJFI5YUKIEKVDCFJUFFD354OA63EOY/>
Archived-At: 
 <https://lore.freedesktop.org/178406770278.1106335.17232929459598625570.stgit@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

aie2_populate_range() now uses hmm_range_fault_unlocked_timeout() to let
HMM own mmap_lock acquisition and retry handling while populating an
invalid user mapping. The timeout passed to that helper is a relative
HMM retry budget, not an absolute deadline.

Pass HMM_RANGE_DEFAULT_TIMEOUT directly to the HMM helper instead of
computing the remaining time from a local absolute deadline. The broader
command submission path still keeps its existing timeout around repeated
range population attempts, while each HMM fault attempt receives a fresh
retry budget for HMM's internal mmu-notifier retries.

Keep the existing driver-visible timeout errno by translating -EBUSY
from hmm_range_fault_unlocked_timeout() to -ETIME on return.

Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
---
 drivers/accel/amdxdna/aie2_ctx.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/accel/amdxdna/aie2_ctx.c b/drivers/accel/amdxdna/aie2_ctx.c
index 548ba4315554..21f2817751f9 100644
--- a/drivers/accel/amdxdna/aie2_ctx.c
+++ b/drivers/accel/amdxdna/aie2_ctx.c
@@ -1037,7 +1037,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 	bool found;
 	int ret;
 
-	timeout = jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
+	timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
 again:
 	found = false;
 	down_write(&xdna->notifier_lock);
@@ -1062,13 +1062,9 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 		return -EFAULT;
 	}
 
-	ret = hmm_range_fault_unlocked_timeout(&mapp->range,
-			max_t(long, timeout - jiffies, 1));
-	if (ret) {
-		if (ret == -EBUSY)
-			ret = -ETIME;
+	ret = hmm_range_fault_unlocked_timeout(&mapp->range, timeout);
+	if (ret)
 		goto put_mm;
-	}
 
 	down_write(&xdna->notifier_lock);
 	if (mmu_interval_read_retry(&mapp->notifier, mapp->range.notifier_seq)) {
@@ -1086,7 +1082,7 @@ static int aie2_populate_range(struct amdxdna_gem_obj *abo)
 put_mm:
 	amdxdna_umap_put(mapp);
 	mmput(mm);
-	return ret;
+	return ret == -EBUSY ? -ETIME : ret;
 }
 
 int aie2_cmd_submit(struct amdxdna_hwctx *hwctx, struct amdxdna_sched_job *job, u64 *seq)


