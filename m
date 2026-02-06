Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7757EEE6B6A
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 22:35:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBF210E95F;
	Fri,  6 Feb 2026 22:35:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YWn9Bf6D";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 16BAD41B0A;
	Fri,  6 Feb 2026 22:26:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770416776;
 b=jXJ6eEiL2/W0E6unkOjMMAxTB29AoC3ZAC3KtXxHnAlAhhtRMS0vJyetWV3Q1OKYUw2q+
 zQVr/WyNS5Oi/xrxk+L958xSNQBhEaOCFrNv/Yvd2+/HmczPlASvNQ0+CIhZhDGukELm9cb
 NOgsq7JpoxiKcYIJTVVm69p5F0lCC/sV8mnwQbFFp3iI/C/Xz1d4Vi3mHnzT0nezKSNWWo0
 UNQuVc9kGzkL1INzt3piA1AJT/CwTMpVYKoHad7z1QEXWk6euLCh6QJFz2X4Ycm0EY4nUMp
 wlIZMlNxEEYwY0Tfyf6pGxfRhKyZpMG9MK3y6s1svbrjfGmzKhY6m5NZAkSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770416776; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UE4XXKfvvfpryLgAXCbkxE22KwoSFTyQYL9Yz6BCPbk=;
 b=DjBl+i+UkonqykGtW5DdOeDJCfsBHLaTy1RAYM451iKcaZNHbmvvhl1hMJB2DbvXdsTNV
 w1VnWGe1vTJOpmUTF9ZwA05b2qKGAQ2y65NfT3+5xcZLW2usxuP1UXei7VgNUpSULvfQI7Z
 BQpw81Wt7rCvEjXdv49F218CSbxWqkTdrH/rK22f4038t51i12exx5icCuCryhwksFrFADa
 Y3sf03LVvpAaus5jOpFeTd30E+QWeGETJz4Xgh8eGbq+c5CzkFaOm8xnMUG0wVf1T7OYlPA
 XLL5SCsEHBCb2GR+jMQX6Bf0YeJC1GpSvslT3wQa7tbD9rSq4w+GYNjehw4w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C5E8E41B4D
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:26:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 807D110E953
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 22:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770417335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UE4XXKfvvfpryLgAXCbkxE22KwoSFTyQYL9Yz6BCPbk=;
	b=YWn9Bf6D1Dxpm5AOAK1WUhQagttnsqpZoMABhPl9cD2IC9SAeaxFYQkaV8nREVqw+h6Hlr
	3KdbNSl7P+6SmxrVZQ1CZ4aM3p0DKbVnlEUnkHWgPlLh7Nv82pVYbVYp5bsimhOSMTrkKs
	/1peLg7LZTqElwEHV2AlwDCYg8j45HE=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-250-pS5TagS7PL26vwJxbZ23IQ-1; Fri,
 06 Feb 2026 17:35:32 -0500
X-MC-Unique: pS5TagS7PL26vwJxbZ23IQ-1
X-Mimecast-MFC-AGG-ID: pS5TagS7PL26vwJxbZ23IQ_1770417330
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 7C8D51955F20;
	Fri,  6 Feb 2026 22:35:30 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.64.226])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DBA9E19373D8;
	Fri,  6 Feb 2026 22:35:28 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v7 2/7] rust: helpers: Add bindings/wrappers for dma_resv_lock
Date: Fri,  6 Feb 2026 17:34:26 -0500
Message-ID: <20260206223431.693765-3-lyude@redhat.com>
In-Reply-To: <20260206223431.693765-1-lyude@redhat.com>
References: <20260206223431.693765-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: Vnaehn_WxjnCnDI6h-FlnFFBYzcNF4ZOFNgOVqUBKGY_1770417330
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: GIUNBKFU32OPFDJ7L7CL4PY3JB5KZL7T
X-Message-ID-Hash: GIUNBKFU32OPFDJ7L7CL4PY3JB5KZL7T
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org,
 Daniel Almeida <daniel.almeida@collabora.com>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Janne Grunau <j@jannau.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GIUNBKFU32OPFDJ7L7CL4PY3JB5KZL7T/>
Archived-At: 
 <https://lore.freedesktop.org/20260206223431.693765-3-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Asahi Lina <lina@asahilina.net>

This is just for basic usage in the DRM shmem abstractions for implied
locking, not intended as a full DMA Reservation abstraction yet.

Signed-off-by: Asahi Lina <lina@asahilina.net>
Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Janne Grunau <j@jananu.net>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
 rust/bindings/bindings_helper.h |  1 +
 rust/helpers/dma-resv.c         | 13 +++++++++++++
 rust/helpers/helpers.c          |  1 +
 3 files changed, 15 insertions(+)
 create mode 100644 rust/helpers/dma-resv.c

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 9fdf76ca630e0..ecf31681df806 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -48,6 +48,7 @@
 #include <linux/cpumask.h>
 #include <linux/cred.h>
 #include <linux/debugfs.h>
+#include <linux/dma-resv.h>
 #include <linux/device/faux.h>
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
diff --git a/rust/helpers/dma-resv.c b/rust/helpers/dma-resv.c
new file mode 100644
index 0000000000000..05501cb814513
--- /dev/null
+++ b/rust/helpers/dma-resv.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/dma-resv.h>
+
+int rust_helper_dma_resv_lock(struct dma_resv *obj, struct ww_acquire_ctx *ctx)
+{
+	return dma_resv_lock(obj, ctx);
+}
+
+void rust_helper_dma_resv_unlock(struct dma_resv *obj)
+{
+	dma_resv_unlock(obj);
+}
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c4..1d3333cc0d2a8 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -25,6 +25,7 @@
 #include "cred.c"
 #include "device.c"
 #include "dma.c"
+#include "dma-resv.c"
 #include "drm.c"
 #include "err.c"
 #include "irq.c"
-- 
2.53.0

