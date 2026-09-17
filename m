Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AAC9C982D6
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 14:19:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 154E710EF13;
	Thu, 17 Sep 2026 14:19:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="f/AsL3rs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8ED2F481A2;
	Thu, 17 Sep 2026 14:02:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789653733;
 b=fp/ImcFSNQAXeYbn69BTba9VavWRZ+5VJbXw+eKfEm0QYxxkCYjXcYR71TgtQDFvJp1EW
 FVBlzpi1uLxK7JkkUCiVCvqMDopuJ3s/6XIRS2F+Z1IvEdLlRnZfZlvGWpA6jm4T4r2lhSR
 JYd9LtWZM8BP+WzhNy7LaG7ZzkLDcntHfmtMmfKsrumkEcoeo8HRCskbJRkoM7ia3QfwJkC
 vJKIAvT60QgUfe7PUL5vJDyKpSAgoqq/y35PqOA5k+ZEizMRPj0HMYOxdrgZRoCpb3k3+uh
 exrK4URftiVovHyJlh2meXFCvFMTSeavMyA3amySBvWwQYXgT67wPCNoE5mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789653733; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZqUTUUtcpH+QYrYSYHDv9OjVF9PUa57N/cCdTlthFwY=;
 b=BqAvzIHemQlK+uvh8oifC50a+TcfKNV/ZW+tnmTjgDmNQEKYbW6B8EG+pkzB7rjitcv+1
 xccpQsuU5Kj5qX5TpwkpjOJ5P2qZZV8YaDRZ27yW3VObXbL0BcJHIbqCHazVU7dExkkPRcn
 T5oxhBHs+SOmxJHWnzXOuFM9KV1WlAzSgy3xgPeghd7D2qSY7CJN0eGXxfg0RGrXZ3J1TG2
 9owbLeAYuQ/V1G0Up+vA1DJB/96Nuu2k7+t1OgyvWFL+B9ozulzHquyHq8o/oqfS8BsYkze
 ckZv/F7hhYe0J1px1cReDW4OsLiGz0y7a1RrD9cHO2JgEz/yHFIFSjAEorWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8B9AE480F6
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 13:33:39 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B06F310E708
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 13:51:16 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-495437bb891so5787835e9.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 06:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789653075; x=1790257875;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZqUTUUtcpH+QYrYSYHDv9OjVF9PUa57N/cCdTlthFwY=;
        b=f/AsL3rsVEJ+EHSADL1WDwWFvY06+C8p+533hbgOlfmpZOiL6iXXDsFe0btJDLHWKa
         c/NPKJOKYFnATqM+IIlEa45VymUuDSV4bmK6zhPs9MfrDfFxY/Eenibebe4ZEzAScnw5
         tuVX3MzLtAxkoatmP+tQUsg+oCLlCqAOHLxPj6AgTwu9xhn2Z4733DjIPkmDpegd8J7I
         NREnDVVMisgrWOt3rol6c+pfZaEVKoZqkbnHnlS9JujAF9VVZAKYSEjWMiXJLAuZ7BHp
         A8F3xnb6FWYeSNnlVnosxSZHYurYDk67P74VjIQCsYbJKzpmL5jZefnxKN46x++B4Ub3
         V6/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789653075; x=1790257875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZqUTUUtcpH+QYrYSYHDv9OjVF9PUa57N/cCdTlthFwY=;
        b=xYNmJIZLPyBEWiafzQdPqLSwUnPfO1wtDYiAUYHFbWYivef7osKcbttDeDzca14wW0
         WxLWvMQ+SAKe+I9cc5gpCX5O9eiJZIZ9YMGQrijftj6qc3JkDJXYyFQoB1D6X22UQ0MH
         JoHmdOpoMZOFWIKFuV9SujygRFE4VKxHOXT2UUYIjWgOjdKfOghhqsGU24N76fF074nv
         xkvZp34UhQfd0CdhO9IOo5ecH5rYbP5VL/OQKCPL1a6nhtDtFAx9QlHFXGE81hgoqYhW
         j0sBLbhlWu3o7IEA0yhPIOvrBw0Lukk5ZweVThUJisGPODva96ZfdEDc412/piFebOzv
         5r+Q==
X-Forwarded-Encrypted: i=1;
 AKwUvBxJVnw8qn6lYWYvgwyJYoJHXiZa1LcZB3HlJlm8ZDIeYtnTP1GUC+L2/Y19B0rXxqVTQNkDkDsk@lists.freedesktop.org
X-Gm-Message-State: AFuF++ldHEqXAaSOMFwHlIjQZ/wG/MiD5K7SwGpQRp0RmK65cInm99vY
	ei7+/1QtT4BRMtosD/Ev+of55sRevq90wLMFdXEaOAlG6Rl9VAXRLeAJ
X-Gm-Gg: AYBFou2ZJzUrlvZItIwTQu8h1biHRftneMLXDL4ZhHNfRXrg8TuJ7T4XeQu1MhPraDj
	x5datfLE74ChghWvfKlknJDWDxoOQur3r+8GtI5vhd7FnZVvyIQJRZ6WO1qnlpN+3p9TGTx059M
	9Y2bw2zmPCcoTyFYcBUfRVa+uhlLu5vukD/1nHECDZvyb/2BeLyyi6gXt8jXcUo5fePkZNaMHDZ
	XiHnOdDYvh4tYKo/dRPvXqKD0XmU4DrP5OW57qN0Kd1tFrPMvh3df+V9zQigORVV48u7t77F4zZ
	cPEg1QSmo/Hcdl4G/VXZS+JMq7oFpjHFqdSTG0NXBvDvSiMY/X9slUE4QzAlKyW8XrWxDO7pucN
	IxFf6VQ8B6vSpFxjgxwmntAfl4MjsMRHfsneIVFut8f/c9EkPfSopuGA51WJ6Y74tR3IbwnplV2
	bll+OPRsRJi0J2Kz1vagPBp7bl5BGmpNEx9bDSB0U+6ZxxUmFmXBYl17w87MvBw711cLYyYNZDT
	TS4HOMxQJoskpvs/M99ncVdl7Sarg6VvJgq1ZrbYZuU/QhDpj09jAAOS8c50g==
X-Received: by 2002:a05:600c:a59c:b0:49d:2589:d8e9 with SMTP id
 5b1f17b1804b1-49fbd1e58a6mr31063615e9.11.1789653074785;
        Thu, 17 Sep 2026 06:51:14 -0700 (PDT)
Received: from kbuild.local ([46.10.181.108])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4870bcc7d1esm15669993f8f.0.2026.09.17.06.51.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 06:51:13 -0700 (PDT)
From: Tano Dzhinski <tano.dzhinski@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau/disp: don't reject HDMI config on cards without
 SCDC
Date: Thu, 17 Sep 2026 13:50:51 +0000
Message-ID: <20260917135051.47683-1-tano.dzhinski@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: tano.dzhinski@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: P7JZNOV2IVCDG6FADD3M2IQ3UNGI32EZ
X-Message-ID-Hash: P7JZNOV2IVCDG6FADD3M2IQ3UNGI32EZ
X-Mailman-Approved-At: Thu, 17 Sep 2026 14:02:10 +0000
CC: Ben Skeggs <bskeggs@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Tano Dzhinski <tano.dzhinski@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P7JZNOV2IVCDG6FADD3M2IQ3UNGI32EZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260917135051.47683-1-tano.dzhinski@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is no
hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
configuration with -EINVAL, and nv50_hdmi_enable() returns before
hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.

The result on such a card driving an SCDC-capable HDMI 2.0 sink is that
HDMI audio silently stops working. Video is unaffected, and nothing is
logged, which makes the failure hard to attribute.

SCDC is optional, and the hdmi->scdc() call further down is already
guarded against a missing callback. Requesting it on a card that cannot
do it need not invalidate the rest of the HDMI configuration, so drop
that term from the condition and let the existing guard skip SCDC alone.

Giuseppe Ranieri posted a fix for this to the nouveau list on
2026-01-17, which received no review:
https://ratatoskr.run/nouveau/2026/01/16963412

Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config method")
Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 377d0e0cef84..9887b3898505 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (!ior->func->hdmi ||
 	    args->v0.max_ac_packet > 0x1f ||
-	    args->v0.rekey > 0x7f ||
-	    (args->v0.scdc && !ior->func->hdmi->scdc))
+	    args->v0.rekey > 0x7f)
 		return -EINVAL;
 
 	if (!args->v0.enable) {
-- 
2.43.0

