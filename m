Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67D19C44501
	for <nouveau@archiver.kernel.org>; Thu, 16 Jul 2026 02:27:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE9DC10E29D;
	Thu, 16 Jul 2026 02:27:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R9fSQpZ4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 615A5471FB;
	Thu, 16 Jul 2026 02:12:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784167922;
 b=TWGCFdDhhDh2SSP6a9158NJvODetRL/6L8d1pGUI7IwKRfb0oIeHNLVHaoLteRL+MCk/S
 dP95RsJ8ePyVHLDOj8dNRPN5ySMGJgvP0lg8tEfqb9tFzJEGiE3HXnfOX7bRlVm7EgWwN2y
 KkZwabGO+PVCb+A0O+dGoPK57NlC6Q8M+Cz+DOtY4qOSGto1gRmfCVQiYlX5Cqqqm6Ob/6H
 Ln7NhzCBDx3AN6QMgvvm4YHwhJKbTi1ZIX96NlGkDbLLplWepg5PIpchatK90ohd5bOheGY
 6brSi2zrG7mgPsoS7uFp9gY3vD/+kyuhxuiDuWlonJzvwcNtx7vbHAgMgdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784167922; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=MnEys3wW0UkOJWjz3Ha+uANv3CwPWTTT3M2E+EM5pUI=;
 b=zJ7GWZoanjR+Rcd+iTiI/SJvgc+JcQqRyhv7WzQhuhGMjltttStt2yZOI/2t10LUAwiGA
 vhAfw3xKt75v5bzJmZqkRh+5dBphOPVvD7KkLwkdaJa+WMWvRyUk433hGN0zzTBRHAu/GIi
 9ZzRM8fPYLGYltpqfvgulUKIISCvf1LofgyC5XZjFtGkgsExljKJ1AaZeP/9bbGmloX0/mP
 QeUwuEpGEzu4Lji8Cu8BjXY4kUuDt2RyiVWNj/LXvfK1lrxeNSuQ6XTFsBEo5gmB6r5PAbx
 iktdzEhPgku8hMQ77+SlPBsGyMuMNOiYQVK9A4Avpx8zwImnh0e3WfAAI2sg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C1DAB46038
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 14:20:57 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0840310E3C9
	for <nouveau@lists.freedesktop.org>; Wed, 15 Jul 2026 14:36:13 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-38e041ea211so2862481a91.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 15 Jul 2026 07:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784126172; x=1784730972;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MnEys3wW0UkOJWjz3Ha+uANv3CwPWTTT3M2E+EM5pUI=;
        b=R9fSQpZ4QN8fYRI6Rm39VWTVEImb1UEvZZciAohFcVWpODG7FtOIEvKfpZ5L3zT0b5
         /SqRSVOuK1VH3ZT8wj4Wmdf1sD42rocEzGKDfGd8xGlPkCFKY+KuP9gdAek9svKP6ARS
         Jk+ixx0x1F2DRugzLm9BcGG+9psKnuyhidD9mBCTdn9pySOHipYwGWr5ys5IQLf81MMC
         dQr2FlwBsrlx+BGrTSkBfiNXTeIDyAIDrbLls3bK52MraiNOKaNyGh7hU5nHm8lq/vBq
         9KPGAQboayaAfQRqGJMVqTIIjO03KsXT/kHD3i2ns1GfV3LyUzFSHxV2B7gBEr+9i1gQ
         lHMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784126172; x=1784730972;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MnEys3wW0UkOJWjz3Ha+uANv3CwPWTTT3M2E+EM5pUI=;
        b=YRPvyvjKdnOk6FVRTs/1AVbfiw0HvMprrL9npdU0y8P8Q245SblNw1Wln8FZKdzMFD
         kECdl+m4oMOmV/AfT17WlAF+lBLZU0EcS+5ZVrVz1ivSxcoJ9mcN3t7MKuFl3AcuBNWY
         o3Rz/TQKplxQYYeh+2BTdc891qHItJxDIbLkHZivOvOS7HDTCDUzwKt2FtZsx8tD7W8D
         2NH16cleDnhx+J/YAGg5iBKWlbFKhS0sD4k5gAPHWcfeZC8ayGdNRY05bVep/2ttIik8
         F9tW9QAqfUuYqrVhDseybrYIH0Au7YAjbRguBIiFPpBnvmfXbur6FPhtgATzrUYUvjpW
         YvXQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Roh0nhEa5qtVhENT/CUrpR6wLXW8VntIbn8aGgwEcpXtR9RYEFLZuCwJUCwrG2tcvnvLiHujZ5M@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBp2o0cppruhIlN+lCtwvVI77FlsRN1li2Zu2sX+DQ3P+vgFqJ
	mherfyoEGl1PAZeEC2jYCH9L7tf9e4b03j4EKUMbI+LtosojdASAPeP5
X-Gm-Gg: AfdE7cmGxau8WZIjt8Pd7NqyadtMRs7drAeGpP4K+RQUxtZvKYPVMUKuJRwjunTCWxQ
	2Ysc3u4NAn2iyqTPdXzAxr58SoMWhhUigIYzno9y5F2KoHIlT6eelopTALGCRb+kf0CR+1BaZ+u
	E6xxfVYtOLh8fSNuA3yH21pAkSW5InSmNzrDrnqNQaGFYST3Q+qQQP9SBhe8PDW8zGGSEuFIz73
	bCe28xciRpTReDDv8KUIkzRVLQI10Q6acXkwXnE42EDk4TYsOhlS2EthzWGUNYn0r549e3WeULf
	nV9IJWzoo92eW2d6DRHbXIqn9lWATLuplNANa2kdOePqxEQQZVzdPnwIX6eYnAxUULNLaDK6TQp
	Dfhsmg5E4dqXM/93UwinEx+QCYn/5ArX4xRB5sUH3Kxoat9r5xMriGO6u6wPz40E/hut/8Lt9HW
	btxTW1ib75HED+QMKwFhnb5otBoTUC6/VoGuMhJ0DnU/pAB5/ggUI=
X-Received: by 2002:a17:90b:3b8b:b0:380:a568:cc4e with SMTP id
 98e67ed59e1d1-38e1add8e69mr6031307a91.9.1784126172417;
        Wed, 15 Jul 2026 07:36:12 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:90:2db1:3066:c473:74d2:497d])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-3140e6c08eesm2510724eec.21.2026.07.15.07.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 07:36:11 -0700 (PDT)
Sender: Deepak Rao Gaikwad <deepaksraog@gmail.com>
From: deepakraog <gaikwad.dcg@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] tracing/mmiotrace: fix resource leak on trace_pipe close
Date: Wed, 15 Jul 2026 20:06:04 +0530
Message-ID: <20260715143604.14481-1-gaikwad.dcg@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: gaikwad.dcg@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: A62254VM6WSS4WZ245F5GXZZLQ5WHG6L
X-Message-ID-Hash: A62254VM6WSS4WZ245F5GXZZLQ5WHG6L
X-Mailman-Approved-At: Thu, 16 Jul 2026 02:12:00 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A62254VM6WSS4WZ245F5GXZZLQ5WHG6L/>
Archived-At: 
 <https://lore.freedesktop.org/20260715143604.14481-1-gaikwad.dcg@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

mmio_pipe_open() allocates a header_iter and takes a pci_dev reference
when trace_pipe is opened. mmio_close() frees them, but it was only
wired to the tracer's .close callback.

tracing_release_pipe() invokes .pipe_close, not .close, when the
trace_pipe file is released. As a result, closing trace_pipe with the
mmiotrace tracer active leaked the header_iter allocation and left a
stale pci_dev reference.

Set .pipe_close to mmio_close, matching how function_graph wires both
callbacks to the same handler.

Signed-off-by: deepakraog <gaikwad.dcg@gmail.com>
---
 kernel/trace/trace_mmiotrace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/trace/trace_mmiotrace.c b/kernel/trace/trace_mmiotrace.c
index 226cf66e0..20812e7f9 100644
--- a/kernel/trace/trace_mmiotrace.c
+++ b/kernel/trace/trace_mmiotrace.c
@@ -109,7 +109,6 @@ static void mmio_pipe_open(struct trace_iterator *iter)
 	iter->private = hiter;
 }
 
-/* XXX: This is not called when the pipe is closed! */
 static void mmio_close(struct trace_iterator *iter)
 {
 	struct header_iter *hiter = iter->private;
@@ -279,6 +278,7 @@ static struct tracer mmio_tracer __read_mostly =
 	.start		= mmio_trace_start,
 	.pipe_open	= mmio_pipe_open,
 	.close		= mmio_close,
+	.pipe_close	= mmio_close,
 	.read		= mmio_read,
 	.print_line	= mmio_print_line,
 	.noboot		= true,
-- 
Deepak Rao Gaikwad

