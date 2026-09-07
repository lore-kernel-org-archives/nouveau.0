Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29315C88E59
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:01:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA88810F748;
	Sat, 12 Sep 2026 03:01:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Hqke0g37";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8567E470EE;
	Sat, 12 Sep 2026 02:43:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789181020;
 b=XdRl3ku0YPo3myscZO6zP9OyglhitgteJvzlT7TQU4eKlDMokVmnR91DNd+MucHBid/qd
 +8RlIpKRALSDm1VLZF3FCOshW6+CIab1Gzk1c8IJanqBHJ1Xwn7YjJSs3C4IyFVl9DVQeRG
 ztQm2vOHe+pgdjIl6frBk2nKCd0kBrOK/vxYGTnZEqRX0E+fd9gUE8gGJntMryzHxrqa9BL
 +NY1zGXBKeu460FXkLsyEXlW/4k5gUUWj2GB5dcqKdbUA+SJYjr6Yjh99rbBQIDOVSCS+/a
 qEZD2mVym8QlOWecgjfyoPHLnui6tlxu9sejS/r/EKJaP3VGx39u5RdrygoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789181020; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=t0UFyMkj4yYcM7C9qagjMJD0/AtaB8gajsJEK2CwTCQ=;
 b=SFn3gEa4m+U++/4VLa0HOgfwprdiyhZ0fBG5cpBBMTKYu+R5C+RMhSA3Qz4tk9PxL/mbV
 hQUf8LlhXDJ13JNZcPnzYLEuojMwn6zCtyoSwqz3LSiFv5KLtIcZhH/Et4xRHFdeAYRj0I2
 kLyfGmw8vGKMi/d9MLGCGFBSejP/HdJ2zohKx828KjqfU1+54WRph22aOnrItvXRxbP+DBk
 XRN6coWST6DLYF2xZMJYKnvusVBuAHmXjqybhgzTLtDXuyZ/R4NqDFBe2LYFadVIiqCtEde
 jn8AVceD+xqtrHal5+tuvBK/CG9FcbyftxdcdRXjDn1Z7j3ldMW1vUr6Zm3w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6109740361
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:07 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6487F10E029
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 15:07:53 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-c250c6a6a6eso474291366b.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 08:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793672; x=1789398472;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t0UFyMkj4yYcM7C9qagjMJD0/AtaB8gajsJEK2CwTCQ=;
        b=Hqke0g37a+ck6zhWazwF//bppKS9s8nqATXA4J+mnaVIfQdxDiq4QwE3skmAULdb1Z
         lPedmiGwTroA1APkloNt8WA7dIo8hOEN/9ISXAB6PQP5L7yjf9RCDuYf7OLDWMO7bSg3
         6fd7dlr4MVDq+aB67Mmjo7VE509OnxZNxb4fy8PJ3Mfq0BVly57azlHkf+MA2IdHFZEb
         VzfLqxzBfmWrNnp64a1kHfZ2CNQ72hpSg8gnOY/e0ERDk7L+Ptg1mjSTZOhDyTRpHINs
         Qims/7/wjHet5bcX/qUl6Vucfi4ZKTa5tyAex9K5O4j9ivy2tPT68GWLKL7i2uEZa6yW
         Dpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793672; x=1789398472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t0UFyMkj4yYcM7C9qagjMJD0/AtaB8gajsJEK2CwTCQ=;
        b=o7hrqYtuLO36dHSL/axvR09Up+tAX2j6ULL56AuDamVd6TU9N9Al3byMn8yKgqm5C7
         2JS0EPcVXdIiW38FJ+QK2xUrpUu4nozr0dTLK6/cLjkELjzs3gzOwcrK0va93TjziGse
         88mt3H4IO5uaEWCAkL41+7LdzjSNL8yf6AbcRyB7NXQCfNwRXNuwzwW5IIBC+tSyOjjB
         i3jhAKnjmWAHMsYrctBwHEGpbwsdr6kp3u/Q2TVdaiJ6Vy7bURmKl3NI2Z1SgLb9Q0aG
         OxkVIPfAWL4qAn1KEw+R4yb1mI3r8NCcfA68/MEn9PN57t59qQXEwCB4Whmuh9eL7XLs
         g7QA==
X-Forwarded-Encrypted: i=1;
 AKwUvBwIlAN/Tkjnsa8+6O9oBWZgyBGa3zf/HE6mZvLnPNDRuwK/sByO4+KlKv3cIqMaY/CNeXimBxe3@lists.freedesktop.org
X-Gm-Message-State: AFuF++lenHn6awT4vVo3KIZXCYg72Y5w7vSFujVZJ42oOq2zEop40gGw
	EwKZ5tq+b8QFpgBB5KVFb0YD5zSjnQt/PxRJhXtgptT120eMRTJUOhYy
X-Gm-Gg: AYBFou2D7BtvUGr2/o9BXYh6x1oot0B9XGAkyGUJfttXTYogumQVdc9bQnmFQjGl8eW
	wjwE5VUpkEaxxtUrgwJE7E8IRUAe6ULcnzAyK/jG3MQVkmpNIaZRSsYDIZCcIXGss2sfbpyECwD
	G2J58GtJwhNgRoRifsNkwnmQVUXlrfupEy/HKIJdK77yhUxvLCw+Lr38VW5YtWbjqIeoPJ1x6vL
	37TsrR//cup49HjnwYcQshq48miLITZSM3HLZ9yZxmhd9XgRYGlpvxXdOQ0bY3PA1sFVeYPcyHm
	WWVqOXjKb9IMZhNQpSac/pPuuACklRCLKx2s81YVTWGM3nlr9jLv31Vhsl/gpGb6LyZUbMiiGez
	oWAjdSdzN12/LL94MAF37NxGUKdInyg0zeWMCLzvJQlS65hc+uogQ/dZ7VyQOthGGZx1FJFr8yK
	vzkgRiAkF7R69C0Wm35kDJ51jK1tgzP3MjVZOWcHe5HiiI99sVCp69Eko4
X-Received: by 2002:a17:907:3d44:b0:c27:420b:7c90 with SMTP id
 a640c23a62f3a-c27420ba0camr424931166b.48.1788793671549;
        Mon, 07 Sep 2026 08:07:51 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d5773c5sm478376566b.40.2026.09.07.08.07.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:07:51 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: sashal@kernel.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.10 1/2] tracing/mmiotrace: Remove reference to unused per
 CPU data pointer
Date: Mon,  7 Sep 2026 18:07:25 +0300
Message-ID: <20260907150726.168416-2-alexevgmart@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260907150726.168416-1-alexevgmart@gmail.com>
References: 
 <20260903-daily-reply-0001-re-mmiotrace-null-check-5.10@kernel.org>
 <20260907150726.168416-1-alexevgmart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: alexevgmart@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: ROXHIQQ5MFM2CNWZ5OVSFZLPVEVVWG5S
X-Message-ID-Hash: ROXHIQQ5MFM2CNWZ5OVSFZLPVEVVWG5S
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:35 +0000
CC: alexevgmart@gmail.com, karolherbst@gmail.com,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 mhiramat@kernel.org, mingo@kernel.org, nouveau@lists.freedesktop.org,
 ppaalanen@gmail.com, rostedt@goodmis.org, tglx@linutronix.de,
 Mark Rutland <mark.rutland@arm.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Morton <akpm@linux-foundation.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ROXHIQQ5MFM2CNWZ5OVSFZLPVEVVWG5S/>
Archived-At: 
 <https://lore.freedesktop.org/20260907150726.168416-2-alexevgmart@gmail.com/>
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
index e8ae2d92a678..55ba76bea98b 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -294,7 +294,6 @@ __init static int init_mmio_trace(void)
 device_initcall(init_mmio_trace);
 
 static void __trace_mmiotrace_rw(struct trace_array *tr,
-				struct trace_array_cpu *data,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
@@ -319,12 +318,10 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
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

