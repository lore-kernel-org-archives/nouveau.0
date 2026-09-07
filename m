Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC67DC88E5A
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:01:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6BC4310F74A;
	Sat, 12 Sep 2026 03:01:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rElgtvRO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DD04470F3;
	Sat, 12 Sep 2026 02:43:42 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789181021;
 b=Pc6fiieY17L1kY7zdKmAly7JMs3FLdIIHQ9HKxT0h4iJRDGfLB5JipQxD6NttZv+AhNtt
 gjXyggbtH4sRTULBJJepOOvhnira9gJboaBs8EBtCWUQ8c+S9l0ujrP7rMuhg+eoqp4FFkq
 oVXrWpX0PNvUxmdeAxGqSJrh4UHaFEazwaMeUN11BLZdP99nPe6YNDmeXR+Ttdwynu9iyYT
 W6h3LAD2Af1Xlqq55mr8lORZoEHo79IkVO3+9GPTYSe2cEMaERETybB09dUqQN/xEJg1SAP
 OgCg0KjCNEVo31QlsGEIgsVPpx+l4wmva68gr9lca7RduadFwu64d+S7pO2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789181021; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=K7XIr1AmkuFOmy/+HyKoEnCMODUMBbTqPPqgFxN3piQ=;
 b=ZrttfljPXKdqIooLcbPzyKeWL8tXILTu8W3ss7amqXgeTuTP5XQLZO2ivgqhQ2o9iHIQ/
 lckcTVZsRumqsA+pOomG4ZGlQSRKzFP6onvtBJ3kS4MV+UQgshLh8ySnDGecg8fPOkD/V/h
 g6AaIttqX2+F+62ipCUi60Sle3Pe/Aw+h6HIwW7aNgphZGDLEeW2HOrbZmj0yLJk20a1pfa
 1F5btg0Z5mIafJSpEmg8ClAAxv3GwibWjmPFc7CBfXpP88ZvbT3bIkfvmPdVpVGpTxFXkr5
 j4+AbgYFRH7wQXH+dogbqgQcXdmrtdg5dgIVK0Ru+QhcyHhpGaFytRkHn5lQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B583940438
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com
 [209.85.218.45])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C1C9110E3EB
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 16:39:46 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-c252c7270faso536013366b.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 09:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788799185; x=1789403985;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K7XIr1AmkuFOmy/+HyKoEnCMODUMBbTqPPqgFxN3piQ=;
        b=rElgtvROT2gimLsUjGjxZiJhFx7Ui1AJgFEWL0y6ppGdFjhykG9J4jxaKTbRdxflIC
         OOD5T9NWvPd/PdvbQBLG6iVnvZAAY+movUUob9ynzBtEr4IvIxvrumIwDrWsaXZTguU6
         a5lIlT6PTaeRZbO86yQgcCCsvaOIYVzUTOI4Vc2M+i5KXMEgeCUj3Sy5TJYnpQgBdQyl
         UbbM2p0sYXgCcbOi1nZftaU1HTA90d7JQg3PKyC6MB184Evt5H9q7U0q2kyH34+vYWle
         XF4EH1bVhSosiRWzufBx7w+Quw1viGiHQDOmrJmMk1//iY9g6zct0WsxDyd0XydIQwyU
         Qs3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788799185; x=1789403985;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=K7XIr1AmkuFOmy/+HyKoEnCMODUMBbTqPPqgFxN3piQ=;
        b=W57LqwJ7v3KYcBiEUCeMUOPUiT4cn9UNfl2kX37AEsvGK7U89T/OYATYzdiVYjy2PC
         37CxRKWRA8PQcrDdOlisPgrfjpweaIYqtChmdQy7nIMAoqPEieOhVrBJkzD+ewH4/ufU
         stKOq4AaYBpVp3f4P6sbh5O5XjifY0Fz6ects+hzufRURWPvK0/X+CVb9h/Ydll8jq6Q
         w9SkEpdv5nu22KVdsx1ATHLWFCRNLBvzDmjT18Yztpe+SZh96lG+s9kdgggkT0mej317
         4Yp9CDvVsNSkVeKes6UfkTz2mpLoT8F60enAau4wXQJPLCzP/5/mA9ygOnyffzaD+Osw
         9XtA==
X-Forwarded-Encrypted: i=1;
 AKwUvBywFZcMAYDJSWtvuo7LU8a2x+Vlc48+mNfjyJTSfhVok7hQG7yj04K9YDMe0HiRDqTamKGmPIDE@lists.freedesktop.org
X-Gm-Message-State: AFuF++lLyUVdBDEHB5zrRdKmpH29F62jCGk0MalTlI6C2S4HbwhKQ0wF
	geVar0iWsYF4+XhirrMjO5CnZwJpjUyxwxZBPLBsbBJfqgmPfCdT+xJc
X-Gm-Gg: AYBFou3v4ADAhK1dhoNV9Z+xpqXaOil6RqK3lqZkSApBg0kenTWqiexA4rmoUEqjD0p
	XLMVy6dssoTm+1jDzGoWbypa2Qw+6f96RVz4KjkNLeQ9HaI3iuknHBIVp2gpX7DarollbZGwPxA
	9SwIa9nU4xyhTovMjNGAhsQ/YB4WCapcNHsa1YXqxpMe64A6/GtjqQSb/tRQgQPO+tKA06pDGqx
	3A8chRTmLVtPKQuL8oxhd59zVCvhlk2/cmMD2wy88egHqk+UOHe/+NwCHB2ms9aoKwFPj59xrSs
	9yY3AaPuJH/YWQaFZcIojNLGzRgarBYrV53RnBkPcvcy00rUdVRVyWEwgY3FARbktCL9p3jS+DR
	rcQPpD2F5O8bmvQtiFDp8nenu+ysoDFZDQtqouf/mPOJVMRYfmf8jbkvxZuLHymaGKZK7tZVAWN
	1ojUwCMo6Vr7yI7loSUn17mscqWiM+91E3w44ke9SFeB1LzisqupbiQF0FpH/+lEz6wihwa00=
X-Received: by 2002:a17:907:9492:b0:c25:ed6e:7edf with SMTP id
 a640c23a62f3a-c260cbd2e65mr1707997666b.11.1788799185034;
        Mon, 07 Sep 2026 09:39:45 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d4a8b89sm483434766b.10.2026.09.07.09.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 09:39:44 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: alexevgmart@gmail.com,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.15/6.1/6.6 2/2] tracing/mmiotrace: Add NULL check for
 mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 19:39:19 +0300
Message-ID: <20260907163919.183961-3-alexevgmart@gmail.com>
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
Message-ID-Hash: SIZUAF4CTQQF6XDOJAMEYBH4MG3VUOGP
X-Message-ID-Hash: SIZUAF4CTQQF6XDOJAMEYBH4MG3VUOGP
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:35 +0000
CC: karolherbst@gmail.com, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, mhiramat@kernel.org, mingo@kernel.org,
 nouveau@lists.freedesktop.org, ppaalanen@gmail.com, rostedt@goodmis.org,
 tglx@linutronix.de, Ingo Molnar <mingo@elte.hu>,
 linux-trace-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SIZUAF4CTQQF6XDOJAMEYBH4MG3VUOGP/>
Archived-At: 
 <https://lore.freedesktop.org/20260907163919.183961-3-alexevgmart@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>

commit 12b80cdbc54cf615b4717a4e8180063408091ea2 upstream.

mmio_trace_rw() and mmio_trace_mapping() retrieve mmio_trace_array into
tr and pass it to __trace_mmiotrace_rw() and __trace_mmiotrace_map().
If these functions are invoked while mmio_trace_array is NULL (e.g. before
initialization or after disabled), accessing tr->array_buffer.buffer will
result in a NULL pointer dereference crash.

Fix this by adding an explicit NULL check for tr at the beginning of
__trace_mmiotrace_rw() and __trace_mmiotrace_map().

Link: https://patch.msgid.link/178524300062.56416.8362487250709962380.stgit@devnote2
Fixes: f984b51e0779 ("ftrace: add mmiotrace plugin")
Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Alexander Martyniuk <alexevgmart@gmail.com>
---
Backport fix for CVE-2026-80689
 kernel/trace/trace_mmiotrace.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 74f378fca518..f4ebf7d9cc25 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -295,11 +295,15 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_rw *entry;
 	unsigned int trace_ctx;
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	trace_ctx = tracing_gen_ctx_flags(0);
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_RW,
 					  sizeof(*entry), trace_ctx);
@@ -324,11 +328,15 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 				struct mmiotrace_map *map)
 {
 	struct trace_event_call *call = &event_mmiotrace_map;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_map *entry;
 	unsigned int trace_ctx;
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	trace_ctx = tracing_gen_ctx_flags(0);
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_MAP,
 					  sizeof(*entry), trace_ctx);
-- 
2.43.0

