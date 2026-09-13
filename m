Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B6FC88E75
	for <nouveau@archiver.kernel.org>; Mon, 14 Sep 2026 14:07:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 812C610E565;
	Mon, 14 Sep 2026 14:07:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PPwdjBBN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B853548055;
	Mon, 14 Sep 2026 13:50:00 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789393800;
 b=LxnDNeX9T1ZHvEFPZ/Vx0gmckL5iRnP9DTpiUXQTpwXW2CWhhxVvAak+ChpNZgBeLF4cZ
 7G8RmwzViYnDirELhwNJSYqFBuwhUJDqB3uR0jj9lx5uTLbyvZW2MF/xGd5sFoAXSfYVF8x
 0SfTHEuxCoxVx19j7lDaDQvTz3l+WUAVyjJnuY3xkCxYJsISXR7JIi2l2+EbNA/GWZcXsy/
 N7yGJbBt544+uc4ebP6GxH03DS6X4AxYGCCYWPZCNnrC1vHVw3C5iTwSxUk8AQTqXdO7ND5
 NOeSt+qH8ktEKtApGl76riRLWrbqQDV/zXhdnQk5G+4xyW85cy6xn8oQHbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789393800; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aI63pWsfdSJI20sdD0vd+vtSvoq1goZ0P9ovwMMqD68=;
 b=aEJQOgeljvJmHNGMRmBg+C069wsu6Jaeum2VkpsIikDY0bIHbxoFfvrGf9z+v+YmiVhF7
 TquXk86IPQ8SESQY9QEn7kl8kS8m7BnGa4aQfhDIMR6PCnWqTohp+t+nvviEw16raesongU
 cTb4TPrWYBBWgVjJPmZZvx0Yz0HFXthxIM/GjrbrpfVq3sRYj07r1TKc8fvoxp9mIL0bVuX
 qbEKIcD8zBw81uawB7m5FLJlnMWV/9CkJqpbCkU/FGxzaoQ6Dn55ObOb0YKqXtNxpw4TEor
 YQTmn3OzjBQ5yxWZ/xOM2/fefFOk4pHrF7Fh/B18nr8MI1+tPykVid951eXA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD99D46F1F
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 19:55:45 +0000 (UTC)
Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com
 [74.125.229.204])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A70DD10E9BF
	for <nouveau@lists.freedesktop.org>; Sun, 13 Sep 2026 20:13:14 +0000 (UTC)
Received: by mail-lf2-f12.google.com with SMTP id
 2adb3069b0e04-5b5e4f1801fso1925207e87.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 13 Sep 2026 13:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789330393; x=1789935193;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aI63pWsfdSJI20sdD0vd+vtSvoq1goZ0P9ovwMMqD68=;
        b=PPwdjBBNdJZxtq9sMbIUklT9ViYmnw45aWtaPOfr1O8r5K2VJe9j5v5fwHRalE+TD2
         2LVBcXFMZHGeXWmNR6ffjLLfkG+ZJJWbS4vR6Rm+FXW7DSUTfbH4pAMlIq56/nVe9DA0
         c/iPk3Cpel5J2E677XQHSOdSmsanIdivs0TLy0lYqOhpC8rOcbBiNf98wqH2gwh+iO68
         T1mYrXZyYa6SRCntjOGk0/ZJQBQGXzCpYLijcLi3iKKzppM1+gOhlL+i9hEXng/bSXEA
         OOCH9rtUvepgX3hm5i+9hXgNSBOKmdVL2obdvb0C+qT/fKX6MHq5kjISB9kHtbUE86r+
         2jGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789330393; x=1789935193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aI63pWsfdSJI20sdD0vd+vtSvoq1goZ0P9ovwMMqD68=;
        b=X4iYJnOWco20El6fJ5Lj7nIwO8j34qrWVEt5bnVj4wlNHvreBSxdPbVitLYmyc4vE8
         TtteNMa3gLwlffYU1bHeMOGzg1FUvokx41MYlfb9HQUJ3dSh3ryGt+iSIxShKjmydU95
         9YhhoPkMJbEMub+TAsBT34I52YPaVH6xWd/tO6JoCD2cUTeIza5R70OaZnRhP7uRn6Un
         +aA1gKKLNxBcM5dnWWJ2bRXh8AJLZmANz2t5dx/froh3Py2gX+PW128pu8uJZ7ZYJunu
         +sCvvBlSTpFfdzwmvsqXfPr/nLSkT6Ym3ANanp+E4s5lqqoBMlOnmuG4JhsNGaeShtQU
         u5Rg==
X-Gm-Message-State: AFuF++ke6vtyJueaYQL2UaFkdXqRNRkoyXi9pTCCgEEMe1tyryKytJNK
	DBzGQzm7TJFsXYwfE+wCD+SDg2KO44j0Jw8tWYfLHjAvDFNm70mgCCEL
X-Gm-Gg: AYBFou0vjONhXn8JvEKU2vu+QaPYwudnc8mjU1o0Fa7EBErkJi9tivOIJZunGTIyOAH
	9WG2I3EvkFLvLhsXldbgJEuR1Sy+Cw6V3TxqtzHQJFdwnbrXpbxiLTvh1F592YvybzRgADIw/gl
	ANOOact5ySzi6vTmiYFjtI08f3/WgeXSEMPiOn02a8I5kyF5VyOfSCAIxvAyZGFd5H2XFP/G8cE
	kl0Fwmk0Q1ij90C1GTeCr4k8R+1Aas+Ed6h4alO39Blx4SVpCTfltsPEWwDmMgdutJJBNJ47uXQ
	OZ/55CEnCimZQFmUDv2r4yO5ftOK5325to6aaOniYi88S4y1twPMV29VaRbeaKEWkJBriXLGrjx
	Kj8E+cOmV/muc2TAz1z0/3+bHP2l6UB2zSyyRmo33ika5ix3UMI2CJKH0KKHE4hn2gz28JlUaC8
	mBou9Y/ERPjDlaS84cKM4/rJLKww66gqY+baIaqTeUOiwg8IpjzHv0kdUaKdqoHv8fPHNUS3mcz
	eD6KAHCddXaUwzrdiNId3lSlpaxVD7/6qjGxsXNW7WR
X-Received: by 2002:a05:6512:114b:b0:5b4:ac27:6bb8 with SMTP id
 2adb3069b0e04-5b8a0299d52mr3093358e87.12.1789330392669;
        Sun, 13 Sep 2026 13:13:12 -0700 (PDT)
Received: from tallipc.shacknet.nu (91-157-240-22.elisa-laajakaista.fi.
 [91.157.240.22])
        by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5b8a03a85cesm2003345e87.1.2026.09.13.13.13.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 13:13:12 -0700 (PDT)
From: Risto Pajula <or.pajula@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] drm/nouveau/fifo/gk104: fix legacy video engine context
 mappings
Date: Sun, 13 Sep 2026 23:12:24 +0300
Message-ID: <20260913201225.5975-2-or.pajula@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260913201225.5975-1-or.pajula@gmail.com>
References: <20260913201225.5975-1-or.pajula@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: or.pajula@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: JFJ3YILHD6X2KUKPMWHZOEILU6IBHQYC
X-Message-ID-Hash: JFJ3YILHD6X2KUKPMWHZOEILU6IBHQYC
X-Mailman-Approved-At: Mon, 14 Sep 2026 13:49:57 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Risto Pajula <or.pajula@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JFJ3YILHD6X2KUKPMWHZOEILU6IBHQYC/>
Archived-At: 
 <https://lore.freedesktop.org/20260913201225.5975-2-or.pajula@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Commit 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
made gk104_ectx_ctor() map engine contexts privileged by default.

On GK107, mapping the legacy MSVLD, MSPDEC and MSPPP video engine
contexts privileged causes FIFO PRIV_VIOLATION faults and kills the
channel during VDPAU decoding.

These engines require non-privileged engine context mappings. Keep
privileged mappings for the other engines, but clear the privileged
flag for the legacy video engines.

Fixes: 8ab849d6dd4c ("drm/nouveau/fifo: add new engine context handling")
Assisted-by: LLM
Signed-off-by: Risto Pajula <or.pajula@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
index 5655eda52..bbeb33cd9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/gk104.c
@@ -180,6 +180,20 @@ gk104_ectx_ctor(struct nvkm_engn *engn, struct nvkm_vctx *vctx)
 	struct gf100_vmm_map_v0 args = { .priv = 1 };
 	int ret;
 
+	/*
+	 * Legacy video engines access their engine contexts through
+	 * non-privileged MMU requests.
+	 */
+	switch (engn->engine->subdev.type) {
+	case NVKM_ENGINE_MSPDEC:
+	case NVKM_ENGINE_MSPPP:
+	case NVKM_ENGINE_MSVLD:
+		args.priv = 0;
+		break;
+	default:
+		break;
+	}
+
 	ret = nvkm_vmm_get(vctx->vmm, 12, vctx->inst->size, &vctx->vma);
 	if (ret)
 		return ret;
-- 
2.47.3

