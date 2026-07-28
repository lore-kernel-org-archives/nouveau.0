Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6BDEC54F4C
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 12:50:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 82F8810E8E2;
	Tue, 28 Jul 2026 12:50:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="cg7TbQwz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78C9047455;
	Tue, 28 Jul 2026 12:34:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785242072;
 b=pUL5y+0k8PXMuMoTOFcFSedZvb4rYjEix7LvrugjYondg9Mdsfv9tg1yCuE6tD7/GNd/b
 p/Uar7eYu53ktC1NcNMlCiUqVKJt6AKs9zqn2DCyERyVSV7rYlM7W1bC1pBcbYXkaqryw90
 nCH+CS/qsTXrsk83NUNMln8iSjHpHK+Ytw+gNdgxbst61JnZLZI84jWAj1LWpPX6uWUEkFd
 XiOEbnle3eLT0jfGbOMts33yyVcCUsQyFrs1SPGV9vGJGXnPveNDuSPZ3yV2ZQ1iYLe0F0I
 Mupxo9EARYe1G21RtAM1pX3VSfY1HTqSkAchbMjhrzVpYQRDBSmEQTB+uvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785242072; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hq4UWoi+hc5z18Sl/9fgWCQVQlYUBSaNGgbu37s5NPY=;
 b=XC65JwtJmylibwBFrpZGeeEZdfHVpXN+QGSPe+Oc6Gjzg4+slRZesksoaZ8+Z9x/mhobM
 o3eK6cYIBTCMLBvrrrtPm85VyEII09bIC2gsEY+Q01P1uzf/uFWrk/uiFxtSOLZ/4WqjSc7
 3n0C2Q6KeAfSOiuN1RmABbssqkEDA9qpCw8jyRlcWHUsbElZyLbqB4rimAw9fGpxWPgOEM4
 mr5Fg/4UbmKgH4tWSnUVVx5EGYnLKWlj9A7Yugi1lxvMVQXDrs4MR5LDpS8yX0XDxtqkNqZ
 erp1ztxF/SCnGiLaGW81F300u6bSIsqkuoneJOtA7Xzr48Vr+66s6SXHqqzQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5F2E24743E
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:34:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B7D010E8C9
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:50:14 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3476D412D8;
	Tue, 28 Jul 2026 12:50:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49D3A1F00A3A;
	Tue, 28 Jul 2026 12:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785243014;
	bh=hq4UWoi+hc5z18Sl/9fgWCQVQlYUBSaNGgbu37s5NPY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cg7TbQwzJbmR7TdB4ZjdCYwcc0d9puOhufXVpxNhqfIN1zKonDH1L0GgvvIXu5qO7
	 3wD/m6+ZYRxc0DQ/Omu+PdcJyrutHwxoz96DYIL4N0BawKCSF0+1WyoxVl/W1rV6QM
	 CHXmrbmfvNYuc21DT/Yqm6D7pdxQb+nB5XJxHkSNSP5Zw5AcmKNIKVWi7ZmbjrEhCR
	 7xnsAF1ye2/dNrAUpIFdwowpOkSntPD2Aq28PxVBGaiwz8d+CpJ4+Iusg+Dof8N3Zi
	 r4SgTQLjEtukaqMsiPC2TmhvwT2YhVR81X9icenCozEgk+Ky5O07QnNxwRkmHrDHS7
	 5O1m5TVMfNF9A==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 3/4] tracing/mmiotrace: Use trace_assign_type() in
 mmio_print_mark()
Date: Tue, 28 Jul 2026 21:50:10 +0900
Message-ID: <178524301013.56416.9116249028160618790.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <178524298182.56416.7520852015178187644.stgit@devnote2>
References: <178524298182.56416.7520852015178187644.stgit@devnote2>
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BTDZ2VMSBM376H3526IQSCODMYWSG5YU
X-Message-ID-Hash: BTDZ2VMSBM376H3526IQSCODMYWSG5YU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BTDZ2VMSBM376H3526IQSCODMYWSG5YU/>
Archived-At: 
 <https://lore.freedesktop.org/178524301013.56416.9116249028160618790.stgit@devnote2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

In mmio_print_mark(), a raw C cast (struct print_entry *)entry is used to
obtain the print_entry pointer.

Use the standard trace_assign_type() macro instead, matching the usage in
mmio_print_rw() and mmio_print_map().

Assisted-by: Antigravity:gemini-3.6-flash
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 kernel/trace/trace_mmiotrace.c |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index df8692c2dea8..77120d467e11 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -244,13 +244,16 @@ static enum print_line_t mmio_print_map(struct trace_iterator *iter)
 static enum print_line_t mmio_print_mark(struct trace_iterator *iter)
 {
 	struct trace_entry *entry = iter->ent;
-	struct print_entry *print = (struct print_entry *)entry;
-	const char *msg		= print->buf;
+	struct print_entry *print;
+	const char *msg;
 	struct trace_seq *s	= &iter->seq;
 	unsigned long long t	= ns2usecs(iter->ts);
 	unsigned long usec_rem	= do_div(t, USEC_PER_SEC);
 	unsigned secs		= (unsigned long)t;
 
+	trace_assign_type(print, entry);
+	msg = print->buf;
+
 	/* The trailing newline must be in the message. */
 	trace_seq_printf(s, "MARK %u.%06lu %s", secs, usec_rem, msg);
 

