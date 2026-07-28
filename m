Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97D8FC54F4C
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 12:50:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 12C7F10E8F6;
	Tue, 28 Jul 2026 12:50:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BNxlql1E";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0B53647444;
	Tue, 28 Jul 2026 12:34:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785242056;
 b=Mts63fc8cCE34RGFNm79XLJUGHfbLObZBAB8yLdfjGQCasouH64KLgOlSs+yDGCYDfGWH
 3NhaIRBWsGf2U707KC9x1F9YwhzFe8ZJQKuH9uH/xKnVtugmYo06io+/O+BjntDMpsUxcYv
 nphOfa12ZtuEKsFfPfQ3RqCjcMf1QrJoOsy7S0o+xCg+PELF1imoHKCMX84F8GNpnw9LJBG
 4CzynKmHmWB4FAXbX3LsntTbHijjEoCocOTsEuRJf45aQHDCFArC2g0omZPyVT+WN1dmG8b
 DM+IB5Ox457EpRJWDBT64mGyQH531s6bx+nRVXcG9qcWuRcjWbwouTq6NVVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785242056; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=B+SkAkO+DZpWHcOFED85ZibUv6VMCkE6Esgv84zpzV8=;
 b=IFOh2FVknBK5T5V/+KoaYDOQxpfuoBymEFc9d+p9RBlYSgAkRYRPlRO8sjVyyPWZNbV3/
 XCLXk/cIwOJlqX4zebtZjPByHR655LqI2hkp5uQu9B/u/kkHWhTNew5qbX83UNIUYFctu/L
 Ob4pd5RwxR1drHwylIeBviG4y5TaKHcbzJtu8ckMhVYwUwwhgOeMH+jQSg0Bv25MOPZP4rS
 H5MViqzvun3c89sBRWLtn2ByHw/MtOmbzzS2YhdXtxMGn0p+IsFS/hur0IvPCiAqeg+/sPo
 dzawokg4ciks5D/+EDFbnQGbQA+6N0lB+Em2EP4rFV8BgZuJkR3oNkVqR4Ng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E72AA46EFC
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:34:14 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 94ADF10E8C9
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:49:56 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5A68743DE9;
	Tue, 28 Jul 2026 12:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EE91F00A3A;
	Tue, 28 Jul 2026 12:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785242995;
	bh=B+SkAkO+DZpWHcOFED85ZibUv6VMCkE6Esgv84zpzV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=BNxlql1ELMjCLY4whD2NKFfCbGuDKemzT62mPnVi5XEqXNas5wz1utgRcGawRGH9f
	 IS67grzadIMGA8QGyHR5vbgGOJ0ABa8HHBUUQ66T4DdyK/66RZ0BhRd6vbDiPlJiNk
	 6B0UTXgPTpyhojhJdyp1bY2eESwIxRx5nu5TLz8sTYOXo3KUlrk1W9wPsubn+XIQKc
	 RXHKKUzJ5ZxqPkenxNO4SnLrd48GN/pdExaasXADgCl+LdKTXfW/8YESvt18nuMO7g
	 goi64TgtY8KiTnBqRYDWG29PbLfapmW19LM8jn76veAr/5TsRtxLL4PjN042wrZEJ/
	 whkFYOpgUx1Rw==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 1/4] tracing/mmiotrace: Reset dropped_count in
 mmio_reset_data()
Date: Tue, 28 Jul 2026 21:49:51 +0900
Message-ID: <178524299122.56416.16277704230639425172.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178524298182.56416.7520852015178187644.stgit@devnote2>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DQX32TEKJMYGEOKHBJILVHP6NCGJXKEJ
X-Message-ID-Hash: DQX32TEKJMYGEOKHBJILVHP6NCGJXKEJ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DQX32TEKJMYGEOKHBJILVHP6NCGJXKEJ/>
Archived-At: 
 <https://lore.freedesktop.org/178524299122.56416.16277704230639425172.stgit@devnote2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

mmio_reset_data() is called during tracer initialization, reset, and
start. While it resets overrun_detected and prev_overruns, it neglects
to reset dropped_count. Consequently, dropped event counts from prior
tracing sessions persist in dropped_count and corrupt overrun reports
in subsequent runs.

Fix this by explicitly calling atomic_set(&dropped_count, 0) in
mmio_reset_data().

Fixes: 173ed24ee2d6 ("mmiotrace: count events lost due to not recording")
Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace_mmiotrace.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index b88b8d9923ad..e064ba3f28cb 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -29,6 +29,7 @@ static void mmio_reset_data(struct trace_array *tr)
 {
 	overrun_detected = false;
 	prev_overruns = 0;
+	atomic_set(&dropped_count, 0);
 
 	tracing_reset_online_cpus(&tr->array_buffer);
 }

