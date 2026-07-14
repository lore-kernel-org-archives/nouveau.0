Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 526ACC43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 20:13:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2816C10EE4F;
	Tue, 14 Jul 2026 20:13:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fErgMhjl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 704CE47189;
	Tue, 14 Jul 2026 19:58:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784059117;
 b=zwqekD9kecrV+23Z6LFHd5BFi0DPvipJ2gW973zMU1laz8NSm+uVchc7cjwPABCWgDxut
 Up0hlFcqdxLr0krXZs1I8QR6RK3o7ofiw1Cl6UIDBIhRVLL1QcjGryf2FJtQCGT3tfUvDGf
 5IYp9mx4HCpDqMnTsRrGCikbfuG/R1n4eB4Gc+chV2HmrzAaBF0vMciDrtSHGFi91c7TvZE
 sv4wIIVoSrlSIN+rdckSvc1GKWCra884JFIO4D6BUpzpJs2XIWfA4ojaD2CUErWKTez+Wzm
 3croNI9b3lnFAWI4ytDTecMYfn61e/Sud498psbr9Cwi+Yay6SCtRbQ0eHtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784059117; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
 b=mnfwO6sGx+B7cG3PahR7eeYkVCDTAxYhBkJicJdS2DbxifHZwekx7HNHZCxUtESmBGqnM
 EXELosanR0t2kHHQ5EX4i63KixoxUeukkM9UN2XeNqEBXYY+k00+IcHu2ST3yPDu2JUuC1K
 TqlMqRR6r32vcQbeNFRD/DKDFIgXTI1uOXg/MfXeQ8WzpNla8rkO/FDwXbEg3VXyExK/TOe
 +ldYMNOUFEDrc+/LMiRpMwaJonRDLWjomROJUTsWxDkR5lcWSM0nAdULggXdanTkm/TOknf
 eXE2eSkWWRjYx6emqCNGbFmk6tmJNArlRWj07zw4SBvJVTUKI3ZLAdRm1y9Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F238847123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 19:58:34 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com
 [209.85.214.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8922D10E58D
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 20:13:48 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id
 d9443c01a7336-2cc73e322dbso56087115ad.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 13:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784060028; x=1784664828;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
        b=fErgMhjlDhfDZj1gTfk9a62EM1y8nxQBlAna4HzC6PcMd+qSRVcQWRcgx9yM9NIuRi
         MCtufhTx+ohbRUPqgqa9G/Pk5pd8U0kw2aOui7IfidFazFroRGARe52aORGbFVeeOjit
         1SAapZXeUnsJS8i4TJ2+P079bj65tvsDMJmafF4mf7WOr+Svq9UBrzTwg1BccdZWI6CL
         526kRlbmJCGkCVEVogLOmtzad5/3TtPTAsy0UVEtRNh5/IfDBkQlhg0KU7FpqpCqKFpS
         IdE95/SExQigVF+1IWkkx1z0fWUIJdXomscNVCgMI/GCbLKdVH5E/h9bJaO8V/tp/URW
         XQIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784060028; x=1784664828;
        h=content-transfer-encoding:content-type:mime-version:user-agent
         :references:in-reply-to:message-id:date:cc:to:from:subject:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d214MLGyf83e1Jqi9SjyzgCBFipAoJ9SSnt0shamnDY=;
        b=FpHiYoGmK05c8hjOs9fic6Ki5435dd3ECXKUg0tNDe5kRYC4DKhnh9kQQQfCx8LVob
         5QiCmSml9OWY0V39YisnvZxLvJ15MzT+D8Q7DyIvvA8VXKHfMRPElkGN7A/9VOHLI78W
         xl73ScyeDvV7ZDA17cPdx9hihn8jFD85cE8iOdaknxtiCLhdkLJIfdeWyHwE2LDatJU5
         hutvcaH/JsiFFWAdloy2G/J4N1yOjMyElVJI1B3SGelnF4X5tSAkVKMAqRilrSOktr1s
         5nmy/JKj20HBrw7e0M/a5mupS9V4XjwqPZo2wh1PxUu5h9V2oYSsDXk+33phWV4zyw0R
         4eUg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpa61ZXMkdV62qAWD9cZY0065Jfb94bJAfseYaTGyRvA72TI2jo7Mn+NCM4SIlYY1RoZPh9VXcB@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtPmnnd3VtiMrvsC3zKiJL3ujUWAIug4aflbF+qDUPlPHTCrOO
	q6vM5OMeROEwTyFZdCwKotg7EjLQlLa54hI9u+2XdqX/sdDZFNXYKURe
X-Gm-Gg: AfdE7ckpKbGS4fvuE8ut3RlpbtTagGVJoX5wpKyI62XLu+U4Czl4uLdPv0srSRVg5TV
	QqccFROppMjV9Igw4T2l/LEGX+LHh77c3Cv8yuVP0JjdBIkf+dlsz+eXlv+kgYDStxbcm33XCfO
	StCkHdkR13Xp1Umn/5uEKZLqMN5AfuQSwkdTZiSBQmTWDys4RidS8w+DKFBwJjYd3yABKXo/kYR
	Fx508AxfRhIj6eMNTmE9DDpD4fuUbIBjkEuZPljHgezcBkUAshLOCLRYQ2CcwERiuQ3o/WRl9Yi
	VXd2bHOAdv8qu7kyX/Ga6+z4DBIO+j7nDuChHyAXiISxZY26ASyznxSGUVCOLuQ2bYDpAdT/xrI
	CKfDCK6JpkPVumzwoxdxzFOaxe9z8xweGOohNL2+ss+pkNyl9NVgZTkRolvlMNmI1NPFWu6Eapp
	Ba4+EO9wdfxWABnwxzSat8NncVWOedDkhKApuGieJ3fmC/zoEPbVDl+gLmna8=
X-Received: by 2002:a17:902:d591:b0:2ca:c68:c554 with SMTP id
 d9443c01a7336-2ce9f15d1f6mr140607525ad.38.1784060028032;
        Tue, 14 Jul 2026 13:13:48 -0700 (PDT)
Received: from [192.168.0.160] (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3d45csm120844995ad.62.2026.07.14.13.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:13:47 -0700 (PDT)
Subject: [PATCH 3/4] fixup! accel/amdxdna: use
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
Date: Tue, 14 Jul 2026 13:13:46 -0700
Message-ID: <178406002613.1082778.11295976907808029605.stgit@skinsburskii>
In-Reply-To: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: SACJ7XPXEXLPFKV4GNLMXR7VD6PJWOSJ
X-Message-ID-Hash: SACJ7XPXEXLPFKV4GNLMXR7VD6PJWOSJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SACJ7XPXEXLPFKV4GNLMXR7VD6PJWOSJ/>
Archived-At: 
 <https://lore.freedesktop.org/178406002613.1082778.11295976907808029605.stgit@skinsburskii/>
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


