Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90E7C53219
	for <nouveau@archiver.kernel.org>; Tue, 28 Jul 2026 12:49:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DF4AB10E8C9;
	Tue, 28 Jul 2026 12:49:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bx+4D4MM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C75DF47444;
	Tue, 28 Jul 2026 12:34:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785242054;
 b=dusyLMXGUjEaIMKx4UgGThcEWZVEkyQYcH9EylbpJgsQM6OnSTuILvefrF3FRe3JfqajC
 Qpw9hEkYbsjYgA2df742dCilyPh8IAQdcsc2vpw2p9GXUw4xV2BIxsHkyqyv19l22kMQDTR
 jnhZdY13ivjKyTow8OukiahR8TGED0fJarQfxVsy19xjg3kjSX1NuSbbQUuErFQLymtyz6y
 GIp/EqRQU8sNNePJ40Qj86GBVsYGyhWRjTUmmpDOIUGTnBRKM4CwpG5WnZhAvhS31LH3Go6
 8ZyVq/+asBs7iDaPEHobuts7o+DkjLNPlVFHzPXGfUMZYlfANga1c/B9WcaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785242054; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mOlGHbnoCnDTPlyrEYMlscDbqYIlu3Es6RPIXVT+hSk=;
 b=qqnd+leYbVHDNfEC/p65WQHU1iSeNPQFqMRyOipuybE/yyGN/wQHgJ8LvqWjlNmzWJY9h
 ppU4Lr6fcCyoqH8mvuaJU+t7p+kQrIZ4HcRS6grq4Klt49T05ACTgAYAfAbOPacbGg1vZdy
 9GvbHjRR1LSlQVcqwXMHweYD/Ja0Xji3Pz8ZSolKYNiydkg72G6an/cTNLVfuqD15pKsij6
 AX5sOvqIPpKzvpOXUUH47ysCrbKuo16bxvdvyI+WPZzPvgeYIhwU9C4h9XwKU+3RE7JZs38
 hu1DQ9SzjzMHLBN+6so9bFHgDgs+EWbMJbgh2fMPgFx6wDO3lHSzPPeM+7hA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AE81B46EFC
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:34:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 052A110E591
	for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2026 12:49:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3A53360AA5;
	Tue, 28 Jul 2026 12:49:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55BBA1F000E9;
	Tue, 28 Jul 2026 12:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785242985;
	bh=mOlGHbnoCnDTPlyrEYMlscDbqYIlu3Es6RPIXVT+hSk=;
	h=From:To:Cc:Subject:Date;
	b=Bx+4D4MMYIwGUqCIaQG3AI/aJ65ae3igimJCL0rg3uXHKDSEg9D568X4bsIdC9VIq
	 7QOhxkax7F9qzCEVjY7OlqILS2aDVkTj6yVesG1Yw+LlHj1Scr6zVRiwsjhMDDD+p6
	 bGZxLhL62sWfLYYrMWRF1gZZJYzgkxVr4pcVwkAvTDgDW5QmpiqSNg3rHWvcSxRdX8
	 q16SHuVev3+CdBHtoUByi0Xf48oIeJp0+pW23kgC+dPUDUnBwh4icgq3fdJkTkAXsg
	 ckEkKcF4AOdAUBFGe2S5R65H9muL8tzUJEFNM7RjVVAziwEJ2GTd/R6zBV5Qo4U7Pi
	 wwgsA6OE2rhLQ==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 0/4] tracing/mmiotrace: Fix some bugs in mmiotrace
Date: Tue, 28 Jul 2026 21:49:41 +0900
Message-ID: <178524298182.56416.7520852015178187644.stgit@devnote2>
X-Mailer: git-send-email 2.43.0
User-Agent: StGit/0.19
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 33JDOQTYC6YKLHXSEFEONPC2WBZTFAMO
X-Message-ID-Hash: 33JDOQTYC6YKLHXSEFEONPC2WBZTFAMO
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/33JDOQTYC6YKLHXSEFEONPC2WBZTFAMO/>
Archived-At: 
 <https://lore.freedesktop.org/178524298182.56416.7520852015178187644.stgit@devnote2/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

Here are some patches to fix bugs in mmiotrace. I used Antigravity
to scan the code and found some issues.
The first 2 patches are fixing some kind of timing issues. Other
patches are a kind of cleanups.

Thank you,

---
base-commit: 62cc90241548d5570ee68e01aaba6506964e9811

Masami Hiramatsu (Google) (4):
      tracing/mmiotrace: Reset dropped_count in mmio_reset_data()
      tracing/mmiotrace: Add NULL check for mmio_trace_array in logging functions
      tracing/mmiotrace: Use trace_assign_type() in mmio_print_mark()
      tracing/mmiotrace: Clean up coding style and redundant debug logs


 kernel/trace/trace_mmiotrace.c |   36 +++++++++++++++++++++++-------------
 1 file changed, 23 insertions(+), 13 deletions(-)

--
Masami Hiramatsu (Google) <mhiramat@kernel.org>
