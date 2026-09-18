Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C98C982D8
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72BBA10F386;
	Fri, 18 Sep 2026 13:16:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="n3JTp+X+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D6F24482BE;
	Fri, 18 Sep 2026 12:58:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789736330;
 b=bh2W+a3xOrmU41BIs0CH4x2f0X2QkB0+xZfbnOSL5kiOiWgPhF3C6q16oo2aow6Sr5l0M
 e29uMhTbo9VhHEAc+ewFq6V3yXU0wlbHPmB4EIdWSnOUW0RcUZsqQXtgWz8wmRt+IyzAUWS
 ty3fQ6M6YzyUnbFkhYSIcAqLdDu9Kx8F6WohOJYIPoOLgvrLaMHgnTMqj155kyRZ5Exj3SY
 i0S1VAEnz4Ye5VuWBB85GF+3PLe+sW+shHfPRKngIJHYYzYL16U4P3FrqLWdDCl8nCfKVf+
 xGunjpBKkdt4X4U1ERn2t83MHpSwrFZVRQqmYhODSi8o6jRSbMBlDNecMvKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789736330; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NPknZ1WGs+5VI15GYbHYggwlCsBgDjKJicFWFVELHwY=;
 b=hguB4pIwXCy0G19v7qHpt0ElyJQCeFhEUbHLFxMrjfvc+t2/JP39QAG42X3hDmV/XmxNy
 a7EOMFDuoJGfbNy8LJr8j37xzcvGzl27jdEoRQUloqd9ki6AQRTr2b5RYNQvVxGA4o4WNrZ
 JWbNsACDqgzg7UZWaHu31K1HoyEjW52gruaCchMg4n8o7fDP1hyn7GpiTbCDKRPwTric2uj
 vnIG/NaLv85BETymPZDzSf9JeoMY8cbnTKwg9FWm0FUETbOTOGjr92sQNSVh8oG9MOwA8qh
 UZrMJ9iH2MpHN3mI3EAr0Sy4niocAhwByIUnB2f5PScWHJ7GaLqAsY3mFjZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2CEED482B8
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 12:58:47 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91BDE10E8CA
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 13:16:26 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485984ebf5cso563160f8f.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 06:16:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737385; x=1790342185;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NPknZ1WGs+5VI15GYbHYggwlCsBgDjKJicFWFVELHwY=;
        b=n3JTp+X+oZScawSJX/lcq5OGmiuZ1cKXvd7+cded+hqGuA6O7NdwL0LV/Z0lF+3LI6
         A6ngQ1o5I/P+a1q0z4WVdsiS9dTIqKLCj2qSGoBPX4hiN2ZAZtNtOfiXZ06A/lciUSl4
         VlvCSEBtasqQ7vJ3AFyPvw9KpfebH1vEoOAFZ+VvAjjU7DfaiGeQtOUkVC5EWeP6Bo49
         Q7i7wqMaPMSyYxaLpe6Ey5cis/PIOk4ucpyHYh8THZXDiTNb/QYmE8kZLYN/aEOe/Y2o
         jrBEVJdY1YhIX8h4iREFlAOENsTwxlocJJ+CxG7reRI4PtYJJFvwCuryHWscYKHinYTQ
         1XIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737385; x=1790342185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=NPknZ1WGs+5VI15GYbHYggwlCsBgDjKJicFWFVELHwY=;
        b=KpN8JSylsqj6NRxqYLcgsZk/ENiEwOmUm8jDuLR86Y//xHEpqzal4lVgtZXHGNKY7O
         s/KHp22Al6pEc9ZvfDwqiCo4aN91p5EodlDO7iMO4e2qci+GboTuG6M1HxB1dxr+6Hzc
         k5C5xaSShpCqLyzWxnMBAMEO3gvQaXEFkQzapZWDLweHmxaOo5PzCnh6kH3jgFbJlIna
         RkGVdpg6qQA6YO2yXnmkXrhktYGJyDIX6NuNMA/EgyK6VtDY9ciYpmhbfWb31zdpAQuz
         +XS8893TOb6TwIBT79CpCXwO0goSgUDfkUbnFEprR4+1Av52IOGWt2rez3Yk0jCjOpAr
         +ZNA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzzMzTWRhFODy9JCMMJpucT+/4cWVToaO9kcGO77663tEXUBfLhzPAMN66ipRU/Xg++xtVUjQ1Z@lists.freedesktop.org
X-Gm-Message-State: AFuF++k+cUfHzsQOGFaVmJPsqlBVXUUJXLBhb7pJs6wWhG25MJ/tHsu1
	MFo7qBYSo82tCr/qeneyy3bcJg1K2RspyQqc70T+z748ad/RDolYuKZt
X-Gm-Gg: AYBFou1RftHg+GOmPVaLEgJHRiVgkZvJa05g69zTg3xRG289Ceecq0gnawrc0C0NPTF
	K8zYrzMiYAFrPw84aNqamCQ0F/zLj5dbH8lAwcYyYFbcVfymGNF4+CFj2rk2xMCGbPapXgvog4I
	MoxnWOk1JxR280ZaSXHjinz7dxM9Td33Cfi3qJcLpXtgDMkjGrPHfucsZ0Jj6Wdj+qYL4GNUbTt
	DCM/A93BXZScjlcr/DeqSiZtJ2kiUp4GURA4hSgqBbXdZAmsRrbm0R0F67e61d2GKXzhNaajpyq
	Tx15ByiOuVShozB4KqeXJhh01p4w7MdJqFoNjrgJGtSCY6qCPiaH2hg7ggFHZVSmpaiFVOIMagr
	7vV65FnQkZmXJ/k/0UuFYlZs86iIc41Era1X7ly+Lum0j4g6PABB0AAdR4Oj6EjtsXyTznvaVyC
	dwJh/itkWA/Bb8R791Jvk81IR3UlI8w41cflgSjB4TWc3LbAP2tWX0m24q/JRku766/UYX1xIG5
	UI6LQqqcnw=
X-Received: by 2002:a05:6000:4548:b0:487:221f:a2e1 with SMTP id
 ffacd0b85a97d-487221fa2f6mr1255469f8f.55.1789737384792;
        Fri, 18 Sep 2026 06:16:24 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:24 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 2/4] drm/nouveau/clk: don't use the pstate cursor after the
 loop
Date: Fri, 18 Sep 2026 15:16:18 +0200
Message-ID: <20260918131620.405133-3-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: VY7J7U7CKXG47YGIVNMT4R42ELQA6DES
X-Message-ID-Hash: VY7J7U7CKXG47YGIVNMT4R42ELQA6DES
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VY7J7U7CKXG47YGIVNMT4R42ELQA6DES/>
Archived-At: 
 <https://lore.freedesktop.org/20260918131620.405133-3-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_pstate_prog() walks clk->states looking for the entry at index
'pstatei' and then keeps using the list_for_each_entry cursor after the
loop.  This is not triggerable today: every caller clamps the index
against clk->state_nr before calling, so the loop always breaks on a real
entry.  It is safe by virtue of what the callers happen to do, not by
anything the function itself checks.

Should a caller ever pass an index that is not on the list, the cursor
would point at the list head rather than at a pstate, and the
pstate->base.domain[] and pstate->fanspeed accesses that follow would read
past it.  Rather than leave that trap in place for the next caller, track
whether the entry was found and return -EINVAL if it was not.

No functional change.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index 5da82db71..a43246ae6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -270,13 +270,19 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 	struct nvkm_fb *fb = subdev->device->fb;
 	struct nvkm_pci *pci = subdev->device->pci;
 	struct nvkm_pstate *pstate;
+	bool found = false;
 	int ret, idx = 0;
 
 	list_for_each_entry(pstate, &clk->states, head) {
-		if (idx++ == pstatei)
+		if (idx++ == pstatei) {
+			found = true;
 			break;
+		}
 	}
 
+	if (!found)
+		return -EINVAL;
+
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
 	clk->pstate = pstatei;
 
-- 
2.55.0

