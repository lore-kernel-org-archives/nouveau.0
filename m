Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B888C53219
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 12:50:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5586F10E8DA;
	Tue, 28 Jul 2026 12:50:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="gkr474Ek";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 425EA4744E;
	Tue, 28 Jul 2026 12:34:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785242065;
 b=oJbHNiO/BefbNDP7ENXQ6I7JDPiDJ6/BxUfW08+eurY2PuuhN9Z8B4OkAF9UfFBH32Fyd
 BR5vXJYpA9KN9+NOmYb8Ush8EjbvQJQigjrzNrNQRdmeBtrg1XgM4P8GUm8213GC+g2xwX6
 JVJGJ2i3kxDrmLpgHa/041Ry2wqhjPABRq2nUBenNDsmXX3l+GBvDS/4MJnswIrJGGfWcBK
 D6mxhmuXt472qmj98e4NtRI5DE5VjgRLUJ23Ye+9Z3E4annSgySdYxfKpfvarDbxSR5BRi9
 FUbrhKXNXLYbJz2O4d6sSQiKsJaR3QAsc7YD3Eb6nm2EAu/DfVSC5XeOSFvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785242065; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LaLFimEMmBrvMfMMx5gNeso5rpc7AUxMwn+69atIkjQ=;
 b=Kn+M82LWt7VlU+1W7RC6QiQNypxw9nh5Fj6ZiZcLAQ5n3NabI9r14a4uM4c9PDIKgX8lD
 B4EJHaByowj5eziH/scI1JL8JLbUvgqoauYgDUD1h6whHOs4g/A1Wkla9S1/EIGCBkYkwpV
 JEtP4pHHwtPHKTrBI3cSV+UZu8u2fzfzdnPfgySW47qvbv3yMrQeLXPSedYOjUNN6+J9DW7
 IygScGdH0FdRufjPBUa3Hwv1jpmCMckFFPgW4aC5jFJaBCtvhmvE7qgvuYTraCKc0fmazDa
 z8cx2NJPkKFuRHuocjSaeMlRy1S48cFRASD6DUDLHnI5knSLscbPyqKm56Sg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EC2D54743E
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:34:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F28E510E8CB
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:50:04 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DA32040C0D;
	Tue, 28 Jul 2026 12:50:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF7471F000E9;
	Tue, 28 Jul 2026 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243004;
	bh=LaLFimEMmBrvMfMMx5gNeso5rpc7AUxMwn+69atIkjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gkr474EkHDB2SsGE3JK1XRV2U+kQhMJ+j6uJKSXjjICdD5W19rNtzEwMhimnf9e0L
	 bqFanGzGoGZZGLVA5HG/FObd/ne+erYbSJlR9DiA/8WQDHWlxkh9GBTW8YF8l4AZie
	 70Q8fYTJwsLkGDZrxBHtzCWOvAim6Q75QdLyfhyrr0IQ/CuBqIXdxTZj2aNKaGhw7w
	 4WcHYm/zaoHd9oeWxD9nwj8cAmEw+VKDcz43nRH59srqxktoXvrmVYgCtLbpd5CwPg
	 OSq9IckLjMD8VdusbOYGB5mZwmBUPha8yj9nCBxwitaDHdDMVSXU+dJD/AD/MhUnVL
	 +fNKNBYxi2COA==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 2/4] tracing/mmiotrace: Add NULL check for mmio_trace_array in
 logging functions
Date: Tue, 28 Jul 2026 21:50:00 +0900
Message-ID: <178524300062.56416.8362487250709962380.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178524298182.56416.7520852015178187644.stgit@devnote2>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 2TCK5FTJ6U2WPSPJLE4NCTMEI7GFCICB
X-Message-ID-Hash: 2TCK5FTJ6U2WPSPJLE4NCTMEI7GFCICB
X-MailFrom: mhiramat@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Pekka Paalanen <ppaalanen@gmail.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-trace-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2TCK5FTJ6U2WPSPJLE4NCTMEI7GFCICB/>
Archived-At: 
 <https://lore.freedesktop.org/178524300062.56416.8362487250709962380.stgit@devnote2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

mmio_trace_rw() and mmio_trace_mapping() retrieve mmio_trace_array into
tr and pass it to __trace_mmiotrace_rw() and __trace_mmiotrace_map().
If these functions are invoked while mmio_trace_array is NULL (e.g. before
initialization or after disabled), accessing tr->array_buffer.buffer will
result in a NULL pointer dereference crash.

Fix this by adding an explicit NULL check for tr at the beginning of
__trace_mmiotrace_rw() and __trace_mmiotrace_map().

Fixes: f984b51e0779 ("ftrace: add mmiotrace plugin")
Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace_mmiotrace.c |   12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index e064ba3f28cb..df8692c2dea8 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -294,11 +294,15 @@ device_initcall(init_mmio_trace);
 static void __trace_mmiotrace_rw(struct trace_array *tr,
 				struct mmiotrace_rw *rw)
 {
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
@@ -321,11 +325,15 @@ void mmio_trace_rw(struct mmiotrace_rw *rw)
 static void __trace_mmiotrace_map(struct trace_array *tr,
 				struct mmiotrace_map *map)
 {
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

