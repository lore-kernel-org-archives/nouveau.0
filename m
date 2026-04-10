Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A07BF459FC
	for <nouveau@archiver.kernel.org>; Fri, 10 Apr 2026 17:37:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D55C910E9D5;
	Fri, 10 Apr 2026 17:37:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A3fC4GwD";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3753A457DC;
	Fri, 10 Apr 2026 17:25:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775841936;
 b=gRJCDi4V7HwVNiQzy0n0ic/ql440s55uSQPfdGNAlI0YtDnq+zW7WCw+OokrkezEM6hKa
 cy2+ABwIT7gC7kr9+yMDPVew558NZTkLhxyWDwE4GxF2nQY4YWGRcczV19SHPfk3Up0Jgt5
 iLb8rrcdSL2RNn4ZBAylkIWSk0iAbmEgKEkfEFsX6qdOaTESODQbVKLxj0WwcuyOd1lrphP
 dFzG+Lnp0ESYm1fu1mf2BKorlCmknFMn8E9+vns707QtXnTmID8Mua1An7wm0NgceYutlDA
 OEHFHwOMcDtxb6LE2ApBzwZgRzQH7VfdFWsj9alE8FWYXRsHLPD/KmOJKa4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775841936; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=naig0CaZu0k7Q+bocF2lGCn7pzOcOGz/HtaZFjdO1l4=;
 b=IhipPt9BB/K/3NeSEvfPI6smjrVfHPTjekMwo0eu+0JnHJxTB4+XxCcEqv3GpxeWnqfCv
 wl2nDb61diaM/+GRNK/KdE5JTH3Y5FbeJhqfluu/n1a3H9ot3cC7i2xI+///2QoEMfVvH68
 Rxe+/0R2MI2KZTn/Iyb9sEFa0Uj0i0L+jMgGCDe3YVjmJDbDPKFOdFbk+pY0deP4DgGAt20
 sRL+82Ci2nnJNoK5VF9XVQl2ilhQbwC6PUJTBGAauBJv9qwb55F7MOrWohtVHAzmc9zxDJX
 UYgREppapDHtj3MPYIRRxlHAOIoHrboJ4aSqOYbLh893tC7rHsNk7AUi08cg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2B47A457D1
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 06:04:16 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECA910E897
	for <nouveau@lists.freedesktop.org>; Fri, 10 Apr 2026 06:15:57 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-488822b93c7so1929345e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 09 Apr 2026 23:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775801756; x=1776406556;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=naig0CaZu0k7Q+bocF2lGCn7pzOcOGz/HtaZFjdO1l4=;
        b=A3fC4GwDxgzP3SOmEovuAsKzCcpZ6Rmz5Uq5ljo75cqARvRAuEMTn7mKR5KYhr+xhh
         /kC03Sn2CCfvgm0MQUDKWskgBgIZJuiriz788TPEMtHGonBoj3N1BVkdtraOEbIXrSsu
         rxHVeyLYu5lMCm6VHWwymssZUVeyWltl/zgqPV32jGG1FEkBrVzkT5Lf8VeqHvZpSXoz
         fuiBxmLGwW8On4HdmLr4chJRZnlQNMkV8LUDWFfQKUZ6LYrUbDaYgpuUDtsYtp9fj37x
         KEw/r33pLt37WDXbzxiBhKr/+9qjJ7uzWhMRGnqN41sPu/APsf+AVLBXQ88eiK9CTOdb
         ICiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775801756; x=1776406556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=naig0CaZu0k7Q+bocF2lGCn7pzOcOGz/HtaZFjdO1l4=;
        b=QsDn1TThWbDxyo9U6yqdSgwENgolBtnZ0C4uy0sD6Pg23PntDHINGier0sy3LXM11a
         1zPtj/zaozdQgJcJdhsko4SXWfnO5sFBWXg8BJLC57ULksVP5LMUZ0oC61j/pASyGEe2
         1IhykgwMYPJRLyT910xEytPAAq4Lkx7U95elXlViHNSIpLQmtBw0BW8gByrZIu5MMTt9
         4gd6qR4aUkhdo7HLf/DOpcmjhPFqUupzRudyxjvfTKCCWXHUpeLV8KAwNjtAfDnEEY8V
         PcCl0rVfejQFBIqwt7K0lUp6PHOsLlSvCysiS1HOpgRpYivxgxbx0dNaaC0J9NXvvFRN
         6U3Q==
X-Gm-Message-State: AOJu0YwBWNt6GvL5qsRbgEhBsvw6nSf+HYaVa7pBRHVoQUiySNDB6/KM
	0r4N8aT2Zt6AcHfFcO6eVCs8K2YOyo1Tu3HHNPuWUxV+aYpicXDCj3zBLk5n76kD
X-Gm-Gg: AeBDiev6dHhdIi/s6P++hxvmuTiMjIJP1yL7NbMNM5qWNN2fskxi4f0NN/KI6cNCBvm
	Ev6LnLEPOX4gqOPo/RTjKfp/67uzqRx6HYx1ou2nEoaR/lNofoF9h0ydcZYWXwM1u2rfXcUkdMJ
	SI8QA9VXiXB2cYn8FXzpvdVaUCjNIv0K01HwliCzz/atViDPI+OdPxPt1IuaHFuK+7TMNm3cH4S
	AQKl6hFrxaRQzzUYFiC4PnZX/mAI3cKX1xCbzjjDD8FojxLGOskh9lLVyWHrtvQEsKOcbJIkFrD
	JA72lg9rUfr/m13WRiE/k7qlY7539NTJIUaMw8Y+Lc6nkIRTvxFY49Z2NkKMDg/9ycCPRDaIeDo
	tQ+/FnpWuYNQujO0cDoapJxVvWaT6Rzvha3covRn47IDsNkYwXtf2MBwE+LCc4J+QEdiy47j0Yp
	+Qa67OMzvUnsG5nq4LQvUVI+R9LiI4vqXfaas054MgA3iWm+ukab/VZzIjLyszmCbnCW0z0QQu+
	e+KjuBSNK4NaQ==
X-Received: by 2002:a05:600c:4689:b0:488:93c5:4dc with SMTP id
 5b1f17b1804b1-488d7f76192mr8388835e9.7.1775801756080;
        Thu, 09 Apr 2026 23:15:56 -0700 (PDT)
Received: from localhost.localdomain
 (ip-078-043-200-145.um18.pools.vodafone-ip.de. [78.43.200.145])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488d5888c12sm55473955e9.3.2026.04.09.23.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 23:15:55 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
X-Google-Original-From: Marek Czernohous <marek@czernohous.de>
To: nouveau@lists.freedesktop.org
Subject: [PATCH 3/3] drm/nouveau/dp: retry link check once on HPD IRQ before
 disconnect
Date: Fri, 10 Apr 2026 08:15:52 +0200
Message-ID: <20260410061552.19056-3-marek@czernohous.de>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260410061552.19056-1-marek@czernohous.de>
References: <20260410061552.19056-1-marek@czernohous.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: RLOPU7FWIJND4PVW7BT2VL4VPRTKR7AQ
X-Message-ID-Hash: RLOPU7FWIJND4PVW7BT2VL4VPRTKR7AQ
X-Mailman-Approved-At: Fri, 10 Apr 2026 17:25:31 +0000
CC: dri-devel@lists.freedesktop.org, Marek Czernohous <marek@czernohous.de>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RLOPU7FWIJND4PVW7BT2VL4VPRTKR7AQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260410061552.19056-3-marek@czernohous.de/>
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

