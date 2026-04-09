Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C856F45A08
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E2FD810E9B8;
	Fri, 10 Apr 2026 17:37:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RhjkVjCl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 47EAD457F2;
	Fri, 10 Apr 2026 17:25:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841934;
 b=ZydZ454g89YxDDZ/0Jh+8D1tiBvAvRTtmhmVQAiSU1yHeqqFuXY4vSQoIEjAyPnahGbRz
 PMbBmgFi+H0Je78GletrCoWcwkreWWd5UtQbhQYAkeF1MjQk1ACCd3hd2YPTo8/svMGEySE
 Jf4YvKhHH+OZVDiaitaq4EBs+lkGzceKoB5A0mJjuThnxLtwtwzXEKTYCuIHt4Fc0zQkjr0
 xo5Zkg3GibzI5h5tar2Le9KHeM/HlaxvVK79FVzaAryMkbUf/omPX5FPE+7AycPCi1GKznO
 EATHykG/X8OwQujvM/00U/c4KBQjiNtXjwz922PyJA8yc5SVb3J5QkX8fnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841934; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=naig0CaZu0k7Q+bocF2lGCn7pzOcOGz/HtaZFjdO1l4=;
 b=ncRSe7ZOyJrqOnA2zknO0gKsOToAO42KtShzkCCbZQ9Qv2+qUaDszEwZADI7wNaFy2Ggz
 FKMSn0XrZp+whKVhlQl7lMp9uR6+26XGLzeqsXk2LAzXTAWZl9eN4ncAqAM8iVtJz68/BQv
 omMV/ZVEOyu9Zm/UzTm2XkhGAmqda5i94C+z2RhjHTXq7L1kXV/pj8V+iQb2Z0pK66OZeyt
 YYv7gWAO1V2ngOC0d46n40Rwy+PI3/RdfOnxjfMpFeUASnp4jh+EZpclyIUbHi1vfD/3SEI
 Xxx4Q6Ff/3dC7b9w4UnqYtW9puXECVlVf0a4YYAeLoGguchPRTbqQPr8tZqQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9DF82457C9
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:09:53 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E219910E04B
	for <nouveau@lists.freedesktop.org>; Thu,  9 Apr 2026 17:21:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-48880947b7dso1551525e9.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 10:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775755292; x=1776360092;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naig0CaZu0k7Q+bocF2lGCn7pzOcOGz/HtaZFjdO1l4=;
        b=RhjkVjCl+BHllsDvVSSb47gpTWh3BgAsAWVOvqxIvPuJtHjC2DCjlQfEAvzgEIieHo
         tYYM3ySHEJb71IPf56+hMOtMqkZYnJ40ksvS9t8QdgfGkjXPMnnlfd/l+IdAqDAP0dpe
         0DSlzFrL5lXKPm1qdIcXU+jZoBVLf8yz4jfILo1A3OPdeBeC78G+BU2fPXeHuU4eiB2q
         lGhF/pXX5DdYmMGuAxF5o8d3W69s/uAYgmsTUeuuNuo0gLDwACFnVscKPlzBs/YVwLf4
         QK7HpkqLJRUcGaXWyV3Wa9tSg18dPVtufgLgrZ3YRtpD2Xsh1uu2mVaKerPPvusYOZKS
         zReQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775755292; x=1776360092;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=naig0CaZu0k7Q+bocF2lGCn7pzOcOGz/HtaZFjdO1l4=;
        b=nxlRmjRqy9lljI9eaSEreHsNEFLC3CkiddGXGJTkHINIVraMIDXGX4peovvRr0Hodc
         Fqn+ZnsQ72SUn72LOxdpJZJSxfXqPGEWXBX8SbGYw0xLErvu+zmNVFwQu/ZBy6MyPUlI
         7gTxlreqmMJQV7PIYAHhQmXUKdLYp05oT8noseo92pd5BF7yTBs4a+ptwSxverdzhPVn
         P1zPSIMh/Ru0CA2aZtvpecLsOMHNYxQGS6pSOtEgJoWbOYSZ+y5Q0703zsOrXuti1/VW
         9PHx5gFAAPVeDWEUPE6p/41Fux3qo0WpxM2LPNCy7j7F+ReoRHepdyzzu2WXnF0AZavF
         LDkA==
X-Gm-Message-State: AOJu0YzxJoWkEwaPWwyL25WBqI18l3gkLXRXvJ0Nq+d/TrYnvmx5IKzp
	OQBmACttKYMEo6SksHa/741KTPkoRfeRez8mHOLZ2L26oj6avcnxXzKa9XyQG7H5
X-Gm-Gg: AeBDieuLiHoW1FcTQSavOjsuWZbOWjRPJk+d8yQz2ZNM0jGNeDqdciDgfOB7cUh6hX7
	+N8n0CZMtZJQfmUtHJvqdSQGx1igBKYLdGRx8DVCw2hAJkAWniXFsf0DwQhXFcy4Gx4cVqsyiVr
	9aoBAwVZz7K89Jog2bUOCVzaIuDI8q681Y64tc9mR+/WP3+eekiw/VvuFchvZAEcwaIqWv6lv1Y
	XVNAQyUU+x6UDfQnvBgA/Y6HOFzN1YbjkxQmKI0XpsK93iIwVHF2CRgYKyHrRVWRSf7XzI3vPeH
	36TblOjmEJlByOiwHshOpX+vyE6nljvDQd9ESXytP6wHWtLdNDkrLb/BONZIT0ph4GPFSh0RxH8
	6eE6AZSLOQ5S6OIIuw+zsO8ojfkcB5/bO1GML2v09EzHlQqW15vEXLgmWW6c+05eFRUL4UIPWjZ
	BP14CkSHJp+a2ulszh84aUZSs2wkOqf9g5NcxBujhJi9GhSsc6x9v1wCTFyyTGyX4arMpyUfeja
	SIfi3/PIKmr1g==
X-Received: by 2002:a05:600c:4f56:b0:488:7fd3:5cd5 with SMTP id
 5b1f17b1804b1-488c5327661mr78481465e9.1.1775755292156;
        Thu, 09 Apr 2026 10:21:32 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63dec090sm367345f8f.12.2026.04.09.10.21.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 10:21:31 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 3/3] drm/nouveau/dp: retry link check once on HPD IRQ before
 disconnect
Date: Thu,  9 Apr 2026 19:21:26 +0200
Message-ID: <20260409172126.115441-4-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260409172126.115441-1-marek@czernohous.de>
References: <20260409172126.115441-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: BGRKITG2CXEFCFXBLJWVZYHJCR2F7OE7
X-Message-ID-Hash: BGRKITG2CXEFCFXBLJWVZYHJCR2F7OE7
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:31 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BGRKITG2CXEFCFXBLJWVZYHJCR2F7OE7/>
Archived-At: 
 <https://lore.freedesktop.org/20260409172126.115441-4-marek@czernohous.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On NV50/G94-family chipsets with DisplayPort, transient link glitches
can trigger an HPD IRQ where the first nouveau_dp_link_check() fails
momentarily. The driver then falls through to connector status
re-detection, treating it as a disconnect event. This causes a brief
display blackout followed by a re-plug, which is disruptive under
both X11 and Wayland.

Add a single retry with a 100ms delay before giving up on the link.
DisplayPort link training typically completes within a few
milliseconds; 100ms is generous enough to cover worst-case
re-negotiation on older hardware without adding perceptible latency
for genuine unplug events.

The retry is bounded (exactly one attempt) and only applies to the
IRQ path — plug/unplug events are not affected.

Tested on NVAC (MCP79) with DisplayPort output over extended DPMS
on/off cycles. Without this patch, occasional display flickers were
observed after DPMS resume. With this patch, all DPMS transitions are
clean.

Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index d71dcfc6e..b6e40794b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -465,6 +465,10 @@ nouveau_display_hpd_work(struct work_struct *work)
 		if (bits & NVIF_CONN_EVENT_V0_IRQ) {
 			if (nouveau_dp_link_check(nv_connector))
 				continue;
+			/* Retry once after 100ms for transient DP glitches (NV50/G94) */
+			msleep(100);
+			if (nouveau_dp_link_check(nv_connector))
+				continue;
 		}
 
 		connector->status = drm_helper_probe_detect(connector, NULL, false);
-- 
2.52.0

