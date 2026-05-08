Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 987DBCD3436
	for <nouveau@archiver.kernel.org>; Fri,  8 May 2026 05:21:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6418010F333;
	Fri,  8 May 2026 05:21:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="m02Zt4Wz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A75E745E02;
	Fri,  8 May 2026 05:08:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778216913;
 b=vMIY39bizmYGGBQSVb9yEfP7OGHfhiKqkx4McpiZ6mzK4T9zcR2jPovobbgWmdh9R3o4d
 PbcIePiUO4+skSBXeLYp0dINSUN8PsSH2EIHiUNGSXoEq5FCvZ0h9ebi2eh837ceocpnFVn
 uM/vex1dvalLTt2EfDhygjWyzZp0TcinO1xrsntc5Gp03jvDrZtD4ALi22s+KMKlPB4gWL3
 EMkAiwLLMInMjtiIoAWR5SLgMzx/fcFQUw/YmDFS8ciIqWR7e209OCJxJAP1R9M87oImkhz
 QnEVYLjdu1Z94AtsXYV6uh9CI+bMCEmz3XjS8Yk8PjPFmX/Bxdk+XmobD1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778216913; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xCkIDeOyP4KM5t1o/lKb0daBHuqvkylgQbtw6G+k/MU=;
 b=BQIYiETjAgn1rMfQI+xQbz45IwrEnHLlHMkU+m5O92M2xQ4rM9eD7HnLagTPmIPT2lhbt
 QMqMxbIglNQFpEKSIwhWEntv4avoR2XO2/H/nbwnnGhlBdgHTZGVVHNLw09i2PKgRQnH2u/
 8i1FzaeVb3hkYXmWWJs+LnNt0yf3/WzrOMbts3VcCyPl6MI46n6+cLIuHOiqqU7Mc4AJhtY
 yTlwnzTNFQ+1yvaL1nv55ytg6sXp0LCWYqKQbGdkw1Dc8ug3shC09McOB2ITeShMpfB3fzw
 VNyB1d8AoYpHV0oQkOm+odHDLVhwsqh8jUIUZRYyl8VIhA8mqRsX0L3SQ57A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 96FBC44FF1
	for <nouveau@lists.freedesktop.org>; Fri,  8 May 2026 05:08:31 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com
 [209.85.216.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 22E6710E2E1
	for <nouveau@lists.freedesktop.org>; Fri,  8 May 2026 05:21:15 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id
 98e67ed59e1d1-366330b6751so710262a91.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 07 May 2026 22:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778217674; x=1778822474;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xCkIDeOyP4KM5t1o/lKb0daBHuqvkylgQbtw6G+k/MU=;
        b=m02Zt4WzgX+b5w1r5IkNROtGs9Z191uZOPTGfybLTRRRMeJ0TYVU7SMNpG8lejiwCd
         a/MYvBmPK1zsepHsZGV+TbcR9WNWthrgZ8IF89YncqZKVwqbFeBOt17rfVdiaWdqew+Y
         dbI8tYFQ+gao49J/gG8A+tw7CWbCn0cdqxVW1Xd6tlVtIEgdblF9j5s4242ZlZ5VDj6e
         3GrC4AvjRHWJF3BqA75AkZ2mPOeny1G9/s30rxve0GLTzSahzCDGAQ+O/dY53J5cEgiB
         qXNYjXamrPm25RtT8nHIdcpu4qoJH21o+tUkn1gXb0xtPLBywBp2SmuVB4d5ywOn0GRW
         spiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778217674; x=1778822474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xCkIDeOyP4KM5t1o/lKb0daBHuqvkylgQbtw6G+k/MU=;
        b=gBRkwnXC3AtdpDVfvNjDim9cg6Su3C42xYhAwoNsy1OuOXLqxLfd/w5DjHaoEf+9RE
         ac5v0+MpMf5HoLwikv+lOq0OT8jBwYYER18iEVtkAC+s955ocFblGSvw3FrrARrWuXK6
         8HEXEzFhLa3cNe7g604z6X3RAwz4det7bm5BkgPctTxV3kdbnBAdSzLobxWBzYFaZLr5
         l4++0KVibtxyCuojaZDotx/l71P4rYK0UxPia7w69GkVVTYLQMmhmzRtyeElsoSBkQWK
         aoVkOslAgib77LQvSWZy0SDZoa3XvKq8psU/CqvU5Xln9yE+0bgoyKmh6rNSG1bkZ9mU
         92nA==
X-Gm-Message-State: AOJu0YwvHbKS+zSDzllOVzhS0ec9Fc5O03QhHovOD0S+T9kv5lxFbbB/
	45+Q/96DVQ89ELKsdK49Jh3HyUr+KaFanLO4XWWqsSiD05ALlCMX9ZCaNtOtCO9O
X-Gm-Gg: Acq92OGu5beDR7w8wAYJaiMHKXB5pl5byN3qFCHL0/PAR0GP1xKdKPC0sfCOaIUgDXf
	wHmqWrpjYiryUw+IRmyjEgmmqYaJWtJ/H4yVL89fJ4QIY+XSVuAvWpMzRmyoPe5xX5mONK8dGa8
	n4+/Z4LKHq9vbZ6wg7aJtYD40YveP7rfq14hbJW2PSdJ283uQi5u839wX7zrH/k00WrXjNnAT7X
	E2Il5OdjNG8rnVmw3gunKqzmbViExKrcnYoAaRWjcvPhVqVGdsGEBX4kT8HIiTEQp1eZGlOEbWy
	C8853cW4oqxhSWwUJFGGI7hXU4QmCqemg40Of2s90kehRc5+dvd5pkoUDUe/XwS+c6uVv2nir/S
	HiKaZrUj19XYSrp/ogEeLPRwPjAHTmmzdnqjahTTwF9rLayTHMEIVBMqvgNEQodySXB5UniY7so
	wAK2YEgzXnWptsBd/VKLoaKBwGCIQlzMHvlIutx/BrOTrWe+KIs8/b0riUVbCIw7gEcUZpQoX4g
	fyviv7n6VYK11GH7oVpgGGgOP5dJCicWEg=
X-Received: by 2002:a17:90b:2248:b0:35f:b348:63e with SMTP id
 98e67ed59e1d1-365abbe373cmr11193012a91.9.1778217674186;
        Thu, 07 May 2026 22:21:14 -0700 (PDT)
Received: from ryzen ([2601:644:8000:5b5d:7285:c2ff:fe45:8a32])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3664db05828sm714910a91.12.2026.05.07.22.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 22:21:13 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau/gsp: Use kzalloc_flex() for r535 display funcs
Date: Thu,  7 May 2026 22:20:56 -0700
Message-ID: <20260508052056.1744665-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CZNZ7YBLWWYUSOUVHGMNYQDZSGB4ZZZ4
X-Message-ID-Hash: CZNZ7YBLWWYUSOUVHGMNYQDZSGB4ZZZ4
X-MailFrom: rosenp@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CZNZ7YBLWWYUSOUVHGMNYQDZSGB4ZZZ4/>
Archived-At: 
 <https://lore.freedesktop.org/20260508052056.1744665-1-rosenp@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

struct nvkm_disp_func ends with the user flexible array member. Allocate the
r535 display function table with kzalloc_flex() instead of open-coding the
size calculation with sizeof().

This makes the allocation describe the object being allocated directly and
keeps the fixed six user entries unchanged.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 6e63df816d85..1155f079b0c3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1734,7 +1734,8 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 	struct nvkm_disp_func *rm;
 	int ret;
 
-	if (!(rm = kzalloc(sizeof(*rm) + 6 * sizeof(rm->user[0]), GFP_KERNEL)))
+	rm = kzalloc_flex(*rm, user, 6);
+	if (!rm)
 		return -ENOMEM;
 
 	rm->dtor = r535_disp_dtor;
-- 
2.54.0

