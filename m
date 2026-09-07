Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 691BEC88E45
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:01:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41AF810E5EB;
	Sat, 12 Sep 2026 03:01:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qlpwUj7j";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F0D00470F1;
	Sat, 12 Sep 2026 02:43:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789181016;
 b=iMZiWb5pj7KSVOXgMHEGrVoZYR7m/YQ68wRmVqyBknCM9Y648/cbavlSLGtmqACr3F5zX
 hq4zB+8SUps+OCoZ3INFp8ko+4OYtirw8iHxiqFor7VC1nXlFPYboy+FcSCiIHG5QVNofXE
 yZAM3Yjw9GnYznedEJFZSOWRWjDymo8xgKvEJ/aPEKGE7TOsNMOwzWTeY9xOfYSMqIraL6A
 5s5grSd5OS3bniCkKpXUz2XysdMYgPdthBH30nyzoEHfTd1DQHYanNng2kzGfVA/QsE91GW
 I8L8fJnLG/5TvgwtpWDzfUcZ3j3hh+ulSDT8cVCOxHafXB7TFnamVJmmmIiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789181016; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uwDD4c2/RUpMOgZpwicrnDhtfhOW9xqP82DMYtNr2GY=;
 b=aol7PhPsKzEXtxO3CQOuBdUU9Gs38b6rW3bMx6RuRUs/Szgfza48f3PoiXRAGzf9YJRSV
 dG+DSlS84bcrkp58VuqxC03FQHKB40ZCyNs/62y4/Y4cP9PQ8tW5/mlbIFladuUSe1ow4Ij
 De4f1HFBBmt4CXC9i0yJHuz7FQfcM/wgfBIt6U3fXORGRP93I6QPwyJpB/ZZGsDV2eZpHpf
 mGTK8VtsLbSiSR1+49C827fXw735cZ7+LCFcKSJh8wspnh5azv30msZcvrkwlL9C7HpKDyS
 lqgK2f/FaBZ9D6Y0ea9tLRZlv55u0QCRReWbb6iq0ndzZr5SyVWnF7WU96ng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5348040102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:05 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7873910E286
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 16:39:43 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-c250a2bc3b3so418356166b.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799182; x=1789403982;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uwDD4c2/RUpMOgZpwicrnDhtfhOW9xqP82DMYtNr2GY=;
        b=qlpwUj7jmh9DJRUPYEc+KMEZJmZo0wqqhUczwHn79I7/YyJfUX+VvGs6hehshEDruH
         +XN9gnpSLtys68QmcTVFMsO5xtUJKTrnKoiZxfC4hOFASiE1zZ7Xc1huSQesL6/gIjMg
         Z1IO4yu/Te86x9ABSPshWv9nHEYTLRHDE9GtpAPuWCkfCQPu01S/Tkw0DZnz5YvWiVuj
         wM6x1P1AcvyiyuhsxjmQ3LttWyJFwL2KS5ijyzfSK//E+6Wb3T5cOHuT7fqhu+f4B9CB
         i3Wixp3R/C+hpv6tEGCaqI2QKEkL+tA0Kmf5oXQt5nUnR1copuHelMahAgMtjtKfPvQj
         uemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799182; x=1789403982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uwDD4c2/RUpMOgZpwicrnDhtfhOW9xqP82DMYtNr2GY=;
        b=Jca+Q96vNiSiImdOMOCbv+c6vqD30mE9yiftxnAsZKFkSHd+CUnT7SOZdpqerlqCMh
         TwQJw1kB5dt6ekRyN4aPTlIRNKBAIuhLioUYBfizDUMUB07Fbq/aCfqPR0L0UVunHjh4
         +g50pkhEFlF/PU4rQPy0nqQC9P9SaSTF0afem1k2YMPUXpxUCnGSUMfWosa06NS0oH62
         sbLgGrA0syBvO7xbuMDip/PzRF4SMyYHGYjnR0F1WNu0YfmdRei/fvi66w1wTxb2n//Q
         lz69oIPWN5LkplPotmMAchNkQjAnd7FP2nZ+4KqzWM0MNdq6WmfqAy8LNJvhOqkhVhyM
         mPnA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzDTP9AMdIO2ZaPct5mN2dqT58P9fr8zLCe9l2UArr7uIcqXGup1PKWLyG534wewELKAJ3ISAce@lists.freedesktop.org
X-Gm-Message-State: AFuF++k92Crv+a30e+0RHKI/dpzfzZS7TqmXIB1k+B9EqyenrbGc4G6X
	xG1a09o+qo4GlCANaMeN9U4oUiPilgvnLqXWmDB+eGmY+ROXlcRZFoE5
X-Gm-Gg: AYBFou10NzXXwEhrSjlL2w/qfk9JPjBOW1ERyIQRRCZQsK2W+3rMv3V4P+1DBY8tkkH
	uNPKdjVZ+1uWHn0m57pBTX24JaTiMJJ+paEuTCrOerTNz/wQhTt4R9d3OlpCR+AxceQfSj7GVAr
	d3t+HAM1+KiPTRJ5AJAX2Me3E9otBcV9+BsEFY9/oKYtF7X2b5wFlZ0H3oI0dv0pllJqNDRtCMq
	hnCT6C54j8C0Qt3yqF0rkFGCPA7fazDwBtKsOXZ8a8rqDvNCNobl9Ye0L6e1yuKHHDllsY3X7tN
	DxCpr8mLx0319ZpINYQLiR5Xy/KxiEAgP2dSdUIXsAqdTkUzfBcExMKFgCShXaIPMATjwjuYp0x
	PNwZrjqLkiKHMbkIoh67SsNo4PGXzf9Aun8HFdizFCKPUWKZHFb49iE50g/0YHYWSVHUvtmHNzB
	VlfN8AhKQnbRqf7zCV9C1UGQXr6flexAWnJzoGBijq5+t/Y6EAzQP1VNrm
X-Received: by 2002:a17:907:d503:b0:c21:792:8257 with SMTP id
 a640c23a62f3a-c260c994e17mr930468266b.15.1788799181596;
        Mon, 07 Sep 2026 09:39:41 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4a8b89sm483434766b.10.2026.09.07.09.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:41 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: alexevgmart@gmail.com,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.15/6.1/6.6 1/2] tracing/mmiotrace: Remove reference to
 unused per CPU data pointer
Date: Mon,  7 Sep 2026 19:39:18 +0300
Message-ID: <20260907163919.183961-2-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907163919.183961-1-alexevgmart@gmail.com>
References: <20260902122613.442176-1-alexevgmart@gmail.com>
 <20260907163919.183961-1-alexevgmart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexevgmart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: AVFD6PR4LBXFNVV5YYFZNLHZVL6H5AZQ
X-Message-ID-Hash: AVFD6PR4LBXFNVV5YYFZNLHZVL6H5AZQ
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:35 +0000
CC: karolherbst@gmail.com, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, mhiramat@kernel.org, mingo@kernel.org,
 nouveau@lists.freedesktop.org, ppaalanen@gmail.com, rostedt@goodmis.org,
 tglx@linutronix.de, linux-trace-kernel@vger.kernel.org,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AVFD6PR4LBXFNVV5YYFZNLHZVL6H5AZQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260907163919.183961-2-alexevgmart@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Steven Rostedt <rostedt@goodmis.org>

commit 6936298393d8d8bc3cec6b704f6a774162cf9bd3 upstream.

The mmiotracer referenced the per CPU array_buffer->data descriptor but
never actually used it. Remove the references to it.

Cc: Masami Hiramatsu <mhiramat@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Link: https://lore.kernel.org/20250505212234.696945463@goodmis.org
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80689
 kernel/trace/trace_mmiotrace.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index c523ce5aa495..74f378fca518 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -292,7 +292,6 @@ __init static int init_mmio_trace(void)
 device_initcall(init_mmio_trace);
 
 static void __trace_mmiotrace_rw(struct trace_array *tr,
-				struct trace_array_cpu *data,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
@@ -318,12 +317,10 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 void mmio_trace_rw(struct mmiotrace_rw *rw)
 {
 	struct trace_array *tr = mmio_trace_array;
-	struct trace_array_cpu *data = per_cpu_ptr(tr->array_buffer.data, smp_processor_id());
-	__trace_mmiotrace_rw(tr, data, rw);
+	__trace_mmiotrace_rw(tr, rw);
 }
 
 static void __trace_mmiotrace_map(struct trace_array *tr,
-				struct trace_array_cpu *data,
 				struct mmiotrace_map *map)
 {
 	struct trace_event_call *call = &event_mmiotrace_map;
@@ -349,12 +346,7 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 void mmio_trace_mapping(struct mmiotrace_map *map)
 {
 	struct trace_array *tr = mmio_trace_array;
-	struct trace_array_cpu *data;
-
-	preempt_disable();
-	data = per_cpu_ptr(tr->array_buffer.data, smp_processor_id());
-	__trace_mmiotrace_map(tr, data, map);
-	preempt_enable();
+	__trace_mmiotrace_map(tr, map);
 }
 
 int mmio_trace_printk(const char *fmt, va_list args)
-- 
2.43.0

