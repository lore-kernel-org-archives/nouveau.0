Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8521C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 15:28:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D858610E48B;
	Mon, 27 Jul 2026 15:28:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NcCH534l";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BF7C94740F;
	Mon, 27 Jul 2026 15:12:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785165167;
 b=UWLPQs1WSVxsYt0GwMWxiAobvfbFdiJsYKmt4ildAFe4/6YwVUtjwUop2x7/yDk1XV5YL
 qS3kBp2lpyQhpJVShzUiP1nazDOV9Ts/FwLk4a5O2V/OJpcXj1TX5J1OHpBq783MlK70apT
 0AV3F9L57P0NAqSUh1xchMRod+QE9GVE5RDOUodjEbW6adFkEtg05ZV+cPJ5Fxppr+mZ2VS
 it+WrNiGMTcskzryKulxI3Li/cb9pmkihI132IYXJBMIAwRC1n5585hIv8diT08uvuWE0Na
 3As45gkeDR9zYFnaUJISAeacE+IOBphBvP7uRrImhLC55P11MxI37R1Wrl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785165167; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=TtyCVpfIwq8dbOfs0FyryLYRFkfiNQaZ8V8GbCjDPSQ=;
 b=AjSolKMeAp0xbMQAwdtNnXKukPh9vvsZUsMRv7QEhSyp3+nx9i2qWtlyVA6o318dNQLer
 jViul5VVz/RHJVmZq68yqJVeMQU6eGYR7DvVO2iFU14yTRRz2LoQfxl2W8rKcFRD7TL5gCe
 KF38pg1Oe0/8TNIwgQTCWBXoyid8yvlvbpKNpCbxXe4Iz97myBGMJglxaePxYhrxDYMhk2W
 xCdy9IqND0S/GQ5idv9yJaa64zttouDzPkZ/BlfhtTpHBd11LAX6p4z5RZCd4ymNWSbSV1z
 3nZC8Qi4bE3DT1KDThuceGAJhoXOhj42a11FfrnLdGreijj1Zze9x9J7AYWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8E794473DF
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:12:45 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8269B10E418
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:28:27 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4954a2e73a9so15523325e9.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166106; x=1785770906;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TtyCVpfIwq8dbOfs0FyryLYRFkfiNQaZ8V8GbCjDPSQ=;
        b=NcCH534lqL8UP6kkY3a+x8Hf97Y2LpjzNAFvctnskJXt0eoluN+YTwwA/IAGGlxRYg
         SLTmRfpyuJvR5XCBJRtfhH7/BhIbo9XeNDXJjPYa3BwW0h1NFWx+Jh2BA9SH4iR8uIMk
         67qkwi54QuEF/JXyj0a6V2GJL3YkWL+pjSrwcZJMQ5p/7qzV12mXQTKQlWdmi/CkRAhJ
         7E3CgQEcTvpCdy2f29MwseYLpaR4BUHqCP681Vbni0w2Q54evyAiwA6SIDbptqiw0dKb
         ncUaL6CeAXWSpS17tPtf2J5z4/aCljWC2A9jweuo/XzxV7eqFhxBf45CZveBh7hUeRnk
         MMHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166106; x=1785770906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TtyCVpfIwq8dbOfs0FyryLYRFkfiNQaZ8V8GbCjDPSQ=;
        b=YTt+VbRbjlU4UBw9tR32yR9jJ6z/9rrPGSqGpmL3Ryt3pRR4OHwDTjfQFARVJ/UopK
         967BZtMSwokQzqgkxVO3OLnS7rAW8hpC5FHGPiCqSviWjhBUdMjvnOjFAybj11Y+gsVX
         ZtUvtfbUQyCxpjzWMTbPn9HcoVHCaG73PyYpli2Rw0ysY5zuUv4gFJ56FDcbIste4tsx
         5PD99C5x1cdG/d3jfPInpn+MqJIMpqfEeoIM+PwYY4n7GNnBEX/M5ZPh2zQFNNz+vE7Q
         SI+RLlf49h8cwHCt+pR1ImYwxWylNbs7JRYn8ycU61zDwpugYuwMP9eiUJhs3M6BUCL5
         /VEQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RrXYOcm/oxKmm+KyCMzKNKoFrv4SYXQKvJeRe9dBwmxFdLgAIYHTHp9L6GpumCcs/Y4PYem/J4i@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLuHZElDB8bvpFmIIHvbrocbRGL13W+Qiuo+PBNQnC7hIcULLm
	Yv9uCIwuJhWfzXiyX8iCC/EDm1Z+3IIFWGGqKf6bT90c0UNvK6MbYU18
X-Gm-Gg: AR+sD10LCDpsvVnms1omLknz284d5oWuefXtyiLy6KbU5buxk7qMLFraHDmGAqbm0OZ
	Whth1EHSwe7k3DU6WJtk5elCjYupIgJSvxUNk/nZ2gF+fHHyAJZY51Fn88dH5Mjq2p/rvsCaR9U
	H3ZfYnWMGgXCy/8irAtA3483WKd5WsDoyjisPFhMsQ69IvzNtO32UUAbut6lYB+xqeuzsgxds+U
	gabkSdDXrNEVAe8axcEVhvVL+cZTu19TH0/lG1AmBtC+EQmDyrJ+MRvkqSAMJ595re0zYCW+PO3
	CFXp/2uOijLYc13GZHZsHeRngOTPVrv/gkENPBUJ1I7n6DnhnW2tuqK5UHW24R1Z7jjWMo6uGYV
	2OCQdluzmG1Fu6Ojgmg/NkxiLTbu4Ce47G8xm4EibF6SojWrgmsoSpaWzx8RsWif7NhvmySE7OE
	bN/rqcJLM=
X-Received: by 2002:a05:600c:8b52:b0:493:c2cc:aecb with SMTP id
 5b1f17b1804b1-496b570fc3cmr122540755e9.38.1785166105587;
        Mon, 27 Jul 2026 08:28:25 -0700 (PDT)
Received: from fra-x8664.lan ([151.16.232.22])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b816ef8sm214838735e9.1.2026.07.27.08.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:28:24 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/2] drm/nouveau/clk: don't ignore RAM clock programming
 errors in nvkm_pstate_prog
Date: Mon, 27 Jul 2026 17:28:20 +0200
Message-ID: <20260727152821.128432-2-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FXIEGWSBUQERTZ7GFSB5V4WDACJ6ZCOM
X-Message-ID-Hash: FXIEGWSBUQERTZ7GFSB5V4WDACJ6ZCOM
X-MailFrom: postadelmaga@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FXIEGWSBUQERTZ7GFSB5V4WDACJ6ZCOM/>
Archived-At: 
 <https://lore.freedesktop.org/20260727152821.128432-2-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The RAM reclock loop discards its own return value: once the do-while
exits, ram->func->tidy() runs and the function falls straight into
nvkm_cstate_prog(), whose result becomes the return value regardless of
whether ram->func->calc()/prog() failed. A negative ret from RAM
programming is silently dropped, so a failed memory clock transition is
never reported and the core clock still gets reprogrammed on top of it.

Return the RAM error (after tidy() has still run) instead of falling
through to the core clock path.

Found by Sashiko AI review (https://sashiko.dev) while reviewing
"[PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor after the
loop" (20260712123616.1180830-1-postadelmaga@gmail.com) as a
pre-existing issue.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 nvkm/subdev/clk/base.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/nvkm/subdev/clk/base.c b/nvkm/subdev/clk/base.c
index 44dc86b..737bec8 100644
--- a/nvkm/subdev/clk/base.c
+++ b/nvkm/subdev/clk/base.c
@@ -298,6 +298,8 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 				ret = ram->func->prog(ram);
 		} while (ret > 0);
 		ram->func->tidy(ram);
+		if (ret < 0)
+			return ret;
 	}
 
 	return nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
-- 
2.55.0

