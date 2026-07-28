Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E01C54F4C
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 12:50:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5EF210E8E3;
	Tue, 28 Jul 2026 12:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LemkiApK";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE84547459;
	Tue, 28 Jul 2026 12:34:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785242081;
 b=RzOd19HVhwKc/Z2oBP8gLxM8+C0asX7mWL8X6sCcQ+SyhKAsuu5j2Mullh/vmZ2w177LO
 j7Y9qPhYWnZ3U7b11CfN5P2knrZxGVPQ0U+2DQu6dVzIGRxAN6ds0CtE9JhPv+O7EEKfnyu
 vKW+BQ3DJ1wYG4V+iS6y2R935rlTtiBZQZF6tZwtxci8PF4GXr2PggCYzT8uB1KZXA/hjbY
 Dr09p8BZy5a24FvqzMBHayTWT4DLMtRiekpWj7qcc5Mt5XYeaoOhTwaAtluf8uQyTqc4VyT
 hUMisGLFTwopuywbfkxtXSnIOQ5w5HSKAMHZ+LxSX8MD1WjYmw+8xuqELlzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785242081; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tjW8QunB0TqlXecPQTXyLsyQo5KDdpsYt4sg9qwmSmg=;
 b=jGEgK9n0EH9NoJwmhKJdX/d3ZmsA7TzyulnGNuFL3ym4j5DXEQuB9/6j7Mpcnx4rK4PHN
 +iDaUs5TCNWvphpLGCW4czW51Qzgtvt6cgaKHAAKDuuIMz/udWDYVLnEwnPPzMZQtmjbQss
 rU9ppUZcyXmzub4CYT/tYSDaKPhfGLMk2YpxPBl8iFrkaW53iEKGlGcW0mZlWF49/NB2Unb
 0XLkgWX7EGY7xR9YJXVRmCNkqMXFbe0mz3XlOi8clDH+htggnTkcGlbK6MOHLUi6Jo6JFQJ
 88oRqZeToRZytziIxC+ufNk48QV9TwR8Gj634VPkQYpl1EyuMvFTHnK3AGhQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E4DC24743E
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:34:39 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC45E10E8E2
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:50:23 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B449A40DA9;
	Tue, 28 Jul 2026 12:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E27581F000E9;
	Tue, 28 Jul 2026 12:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243023;
	bh=tjW8QunB0TqlXecPQTXyLsyQo5KDdpsYt4sg9qwmSmg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LemkiApKfrT0JnkAQ8CTu0dd5grdSK7YQVb5yRF3ZxyrTUeuTzp2tBtcx+44LsFhY
	 YoOVI1XvI30IHe2etaunk6uPl9QxxeWSRl43XPhsFy+Xu95Yt2wdHCDlJ6BZviQZ8D
	 Qo/DJ37jKr0TzwQDuXyKl0v9BtuWv/ubWWiNbzwWylXC0LbT9fILQ6BZCDxr40Ab88
	 pOCxAaE1S4duueil1rerjUErh0GF401LgQs9X724WpA69xPBCOZsNXREu+fXZsHtib
	 6PZYTBzy2IhycLbYgg1+HwDaOxkQMxebAv8kvddACFS8jCeZpNQXd1uQAPBPvdqpFL
	 YaaqsRd0f8KLQ==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 4/4] tracing/mmiotrace: Clean up coding style and redundant
 debug logs
Date: Tue, 28 Jul 2026 21:50:19 +0900
Message-ID: <178524301945.56416.2087305624947649637.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178524298182.56416.7520852015178187644.stgit@devnote2>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: PLOWX4YSOG7TYX6HN74XFSP57YASJTMV
X-Message-ID-Hash: PLOWX4YSOG7TYX6HN74XFSP57YASJTMV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PLOWX4YSOG7TYX6HN74XFSP57YASJTMV/>
Archived-At: 
 <https://lore.freedesktop.org/178524301945.56416.2087305624947649637.stgit@devnote2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Clean up coding style issues in trace_mmiotrace.c:
- Remove redundant pr_debug() entries in tracer callbacks.
- Fix opening brace placement for mmio_tracer.
- Prefer 'unsigned int' to bare 'unsigned'.
- Add missing blank lines after local variable declarations.

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace_mmiotrace.c |   16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 77120d467e11..ce16e1c53d12 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -36,7 +36,6 @@ static void mmio_reset_data(struct trace_array *tr)
 
 static int mmio_trace_init(struct trace_array *tr)
 {
-	pr_debug("in %s\n", __func__);
 	mmio_trace_array = tr;
 
 	mmio_reset_data(tr);
@@ -46,8 +45,6 @@ static int mmio_trace_init(struct trace_array *tr)
 
 static void mmio_trace_reset(struct trace_array *tr)
 {
-	pr_debug("in %s\n", __func__);
-
 	disable_mmiotrace();
 	mmio_reset_data(tr);
 	mmio_trace_array = NULL;
@@ -55,7 +52,6 @@ static void mmio_trace_reset(struct trace_array *tr)
 
 static void mmio_trace_start(struct trace_array *tr)
 {
-	pr_debug("in %s\n", __func__);
 	mmio_reset_data(tr);
 }
 
@@ -113,6 +109,7 @@ static void mmio_pipe_open(struct trace_iterator *iter)
 static void mmio_close(struct trace_iterator *iter)
 {
 	struct header_iter *hiter = iter->private;
+
 	destroy_header_iter(hiter);
 	iter->private = NULL;
 }
@@ -170,7 +167,7 @@ static enum print_line_t mmio_print_rw(struct trace_iterator *iter)
 	struct trace_seq *s	= &iter->seq;
 	unsigned long long t	= ns2usecs(iter->ts);
 	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
-	unsigned secs		= (unsigned long)t;
+	unsigned int secs	= (unsigned long)t;
 
 	trace_assign_type(field, entry);
 	rw = &field->rw;
@@ -215,7 +212,7 @@ static enum print_line_t mmio_print_map(struct trace_iterator *iter)
 	struct trace_seq *s	= &iter->seq;
 	unsigned long long t	= ns2usecs(iter->ts);
 	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
-	unsigned secs		= (unsigned long)t;
+	unsigned int secs	= (unsigned long)t;
 
 	trace_assign_type(field, entry);
 	m = &field->map;
@@ -249,7 +246,7 @@ static enum print_line_t mmio_print_mark(struct trace_iterator *iter)
 	struct trace_seq *s	= &iter->seq;
 	unsigned long long t	= ns2usecs(iter->ts);
 	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
-	unsigned secs		= (unsigned long)t;
+	unsigned int secs	= (unsigned long)t;
 
 	trace_assign_type(print, entry);
 	msg = print->buf;
@@ -274,8 +271,7 @@ static enum print_line_t mmio_print_line(struct trace_iterator *iter)
 	}
 }
 
-static struct tracer mmio_tracer __read_mostly =
-{
+static struct tracer mmio_tracer __read_mostly = {
 	.name		= "mmiotrace",
 	.init		= mmio_trace_init,
 	.reset		= mmio_trace_reset,
@@ -322,6 +318,7 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 void mmio_trace_rw(struct mmiotrace_rw *rw)
 {
 	struct trace_array *tr = mmio_trace_array;
+
 	__trace_mmiotrace_rw(tr, rw);
 }
 
@@ -353,6 +350,7 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 void mmio_trace_mapping(struct mmiotrace_map *map)
 {
 	struct trace_array *tr = mmio_trace_array;
+
 	__trace_mmiotrace_map(tr, map);
 }
 

