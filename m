Return-Path: <SRS0=UuQq=ID=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B28C433DB
	for <nouveau@archiver.kernel.org>; Fri,  5 Mar 2021 09:56:13 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1CE1A64E6B
	for <nouveau@archiver.kernel.org>; Fri,  5 Mar 2021 09:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1CE1A64E6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5EA96EB3B;
	Fri,  5 Mar 2021 09:56:12 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD166EB3B;
 Fri,  5 Mar 2021 09:56:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2972B601FE;
 Fri,  5 Mar 2021 09:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614938171;
 bh=hoQ19clzhxWtId19+87S7OFAK0lAZssf3HE94ZT3lAE=;
 h=Date:From:To:Cc:Subject:From;
 b=Cf+W81nk2RNf/cBzAjxflmCnPcLLtAEqSuukozJOPUVFblqMZjHU03gIjSZUzGCRT
 WtLkKHB64mFzN7Khk99CGVQ4tSLBtfvu7FaqG1+AcXvNf+7kQp0sTfYHnFD/2mMV+3
 S/tNiop3x1MnXm+RgQkNmA1+S/sAaq9BrFRCGn4bfO4pOyUEKv/lj6LEtCF5KfAmIc
 KG1L3dDGaYa2X9/0ew8OosbnhGWcOj0nf6H5AFDF7R2bk4tg3DQMV2RBCRvPP8jz/S
 Ch7zI3zzL/PdJbrqjv0D1Kv0jUAXy8BcNk1/muvoI+/QHCgEOf3ZElakqvtANC4paN
 ElXGZE4cYJ9FQ==
Date: Fri, 5 Mar 2021 03:56:09 -0600
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20210305095609.GA141907@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [Nouveau] [PATCH RESEND][next] drm/nouveau/clk: Fix fall-through
 warnings for Clang
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

In preparation to enable -Wimplicit-fallthrough for Clang, fix a warning
by explicitly adding a break statement instead of letting the code fall
through to the next case.

Link: https://github.com/KSPP/linux/issues/115
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
index 83067763c0ec..e1d31c62f9ec 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/nv50.c
@@ -313,6 +313,7 @@ nv50_clk_read(struct nvkm_clk *base, enum nv_clk_src src)
 		default:
 			break;
 		}
+		break;
 	default:
 		break;
 	}
-- 
2.27.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
