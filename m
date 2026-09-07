Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CF2FC88E45
	for <nouveau@archiver.kernel.org>; Sat, 12 Sep 2026 03:01:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2502210F741;
	Sat, 12 Sep 2026 03:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VcgwBuoj";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D263F470F1;
	Sat, 12 Sep 2026 02:43:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789181018;
 b=E1IVSOXAXF+/ww6XQLenCursNyw7NGcLFv7TLTY/OCJGTlirKJXbC7HD+tzEfnNMUZjK/
 0OHP2ZpeDHYRWp3bM8O2rIbshlmrQBL/VyzyfbB+SUijUbcqAtfRVbVS8+xV9MFvI8fAxh+
 wO47APeDI5OTC8hdxUAnzTWsIdCKCqQg1LcJyDBpnBjY/Zr71oBptjQPzOdPRtT2rEZ0KYU
 i3PVlMbjazbjMfeUe3IN2wYDPf/hmSLpeIoFRrFEgPmfGRPKdYWMMnggED4N4crK/uOQomW
 GRsBWwI4aGmpSkIals4LCH0nR9CTPynMZUOqUFPMGbk15JmrtKv4ae5J90+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789181018; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jzZ6irP1IJm4iTmeFvSaA6y2Zk76xV4+MV1ou0UvxWY=;
 b=eY4iHNc4eOVKWu8Ucjqu9Ii/hMNwr17NUjgk5bIJ4BCd3fVrcxJRcX9FKLVrI1QgAJhCS
 Rjyn0oXl4/wMsSN6ZahBhgXp+0c2cqWoJFeTuFM2nNPdbldCmTcJSxntdrpx5IXffo8rKf5
 3z2lfpPmHIiA+muM/Hs3kLraFDhox+sOQK316f+WgMqb+8EIiWsn8jjb6ocGAbGBv83wWNX
 ckuuAYgjy0Br4mfhVBTle1zVugQkJRtWMRvjwEh81zDaxVQ2whZcTDmokpf0aHIeHSLy5U5
 xwkNFFJG0XR/v9eMEQEwL69E7t8fIH2NlJWWqKLYL0rifpjpkMfS0N/I99gg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3D3FB402F3
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:07 +0000 (UTC)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com
 [209.85.208.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BA32210E15A
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 15:07:56 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-6a7e0ff423dso7654246a12.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 07 Sep 2026 08:07:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788793675; x=1789398475;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jzZ6irP1IJm4iTmeFvSaA6y2Zk76xV4+MV1ou0UvxWY=;
        b=VcgwBuoj+zwMOSm7zOfbRtZAVBBrSTTN/mfoGcv0arY2hBC67IEPo++ddQCzuo4gKP
         VTCOMNrf9CQLnGOnrOq2iOSsMASwBchYIyidKwxv5AvUsg+v586sasqfntuOqbxqr4x4
         GVv/HnFP+az152yfmlgn63noMbpEKxTFeDk2G08OA7YQv/i0gIIUwpGwykN00jr1sOBs
         FAUawRMhViH1j4AenUF4bY9FlAoT9mi1cA+Ss5uy+g2gNuwPDdcimE+v3QYA9rQ5nagt
         LXj5FHfSCs8ya/G+yI3b31UTwSUwyHgmgz8Kfa/AsDn5zsE9XHYMW7RkkX+sJsbOIRkZ
         IE4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788793675; x=1789398475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jzZ6irP1IJm4iTmeFvSaA6y2Zk76xV4+MV1ou0UvxWY=;
        b=YlUwF6WLjFjr9OJ94xrrQ/C7x2+BAjnUzd1xoMCuBp+R8Jxjs9EI+qzHZB5BAf+i/g
         joDqgkqK0gGImZg38MCQpzbOIN9w1FNjZZFSBAqHebVdDf9r1/HLg8Dv7aJqXEqkD/M5
         ihQUcrlgwY/t7juM0KUtPG8Ivzs+FBPAxCCskLajca1LLYrJRX+bF5xZQdRnWJulLPHm
         k+u+sF0U7F2dfE/r1BV4+MBfT0BXNUd13cRpVlZl3CPEYfHS7KEujh+Rm/O1+JwlF7D9
         lYu5U/eapzySq/9zZcBnkhQqZc2E98v6GgMkwzIZN6bi6kZWBJ+oxNpe4ve0g545qUhM
         MavA==
X-Forwarded-Encrypted: i=1;
 AKwUvByPR8NdmkQzDZMocsxAcddVbYvts7rQBAPM9MpPEV09vC6mCUqsbA6SHsq+cHL3ilF+pPWytkbU@lists.freedesktop.org
X-Gm-Message-State: AFuF++mwMoUpdt8X1jZuIZ2jIKYjqSex8ep6dj/sRHtkCVmxObtE0gVT
	zBD7OVSg3U70uLHtkwB9cLYOYiNCWIwSA42/9uxDcJofl8LCDI5X4tBv
X-Gm-Gg: AYBFou1TJnEHW+9gJvuIvbWMp5s/4XBEiwZHtewx8c/hk0CWfQ86zMtoiTP8zWdPH5R
	ek3dPrKImmvnS6YzC0oDbuKFkxqqRjYOPkK2U/XOSGPa2EsSqak2wrPDDmrMWcrApnahSVy/3xC
	SSGDv0cT+Y4NmYMvv4u/T05lqr/MgKlWvNLB81PGmxORjtjkC7DL9An58Ux/iCVWgyRtHpLf3a7
	pQ8c92QSXiD444Q/bftdejDroNjBY/oYbKiO5cQUerRgRjOUosn9t+Zsxa4moOMyywWUvxAowVs
	ncrz4BO8FWfvpCT7CIBJ2BwRb69NG6eWrESI2aV8AYZjXpFFZMs5iIkiXw6zIFwxxvm66DHsv0g
	yduVvQMl/TVmclMXTGOkVnkQ317sLWL3DHT8mUSHBHEnySL6yc8W58vSAy/EB/U/w5NQjH/sY4C
	TF2iA0nMyEdEIa9HVTs8vECwm2wBi+H3HGIMFnxCh5yIqAOre1ZBYIwnB2mLrcVWf2PyottE8=
X-Received: by 2002:a17:907:d501:b0:c26:1f8f:ed53 with SMTP id
 a640c23a62f3a-c261f8ffdd0mr686260766b.12.1788793675037;
        Mon, 07 Sep 2026 08:07:55 -0700 (PDT)
Received: from grower.astralinux.ru ([82.22.172.205])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c260d5773c5sm478376566b.40.2026.09.07.08.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 08:07:54 -0700 (PDT)
From: Alexander Martyniuk <alexevgmart@gmail.com>
To: sashal@kernel.org,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 5.10 2/2] tracing/mmiotrace: Add NULL check for
 mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 18:07:26 +0300
Message-ID: <20260907150726.168416-3-alexevgmart@gmail.com>
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
Message-ID-Hash: 4HOT4FNASNIA7NVJD7SYCLYQ2KHEF26S
X-Message-ID-Hash: 4HOT4FNASNIA7NVJD7SYCLYQ2KHEF26S
X-Mailman-Approved-At: Sat, 12 Sep 2026 02:43:35 +0000
CC: alexevgmart@gmail.com, karolherbst@gmail.com,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 mhiramat@kernel.org, mingo@kernel.org, nouveau@lists.freedesktop.org,
 ppaalanen@gmail.com, rostedt@goodmis.org, tglx@linutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4HOT4FNASNIA7NVJD7SYCLYQ2KHEF26S/>
Archived-At: 
 <https://lore.freedesktop.org/20260907150726.168416-3-alexevgmart@gmail.com/>
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
index 55ba76bea98b..ce45c5ee5227 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -297,11 +297,15 @@ static void __trace_mmiotrace_rw(struct trace_array *tr,
 				struct mmiotrace_rw *rw)
 {
 	struct trace_event_call *call = &event_mmiotrace_rw;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_rw *entry;
 	int pc = preempt_count();
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_RW,
 					  sizeof(*entry), 0, pc);
 	if (!event) {
@@ -325,11 +329,15 @@ static void __trace_mmiotrace_map(struct trace_array *tr,
 				struct mmiotrace_map *map)
 {
 	struct trace_event_call *call = &event_mmiotrace_map;
-	struct trace_buffer *buffer = tr->array_buffer.buffer;
+	struct trace_buffer *buffer;
 	struct ring_buffer_event *event;
 	struct trace_mmiotrace_map *entry;
 	int pc = preempt_count();
 
+	if (!tr)
+		return;
+
+	buffer = tr->array_buffer.buffer;
 	event = trace_buffer_lock_reserve(buffer, TRACE_MMIO_MAP,
 					  sizeof(*entry), 0, pc);
 	if (!event) {
-- 
2.43.0

