Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28E5C982DA
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 518E210F396;
	Fri, 18 Sep 2026 13:16:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="qeOWKC06";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B7AC8482C4;
	Fri, 18 Sep 2026 12:58:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789736336;
 b=S/iY3d030qQqwa68RQ3VAX9wgzU/4BALUVRnmLlJJ2Pfn4fjYc2T4jpor8dBYVIQCbVoV
 PfQday/cla1Y8U+JHlkb1UQuAxuMHjaq5GU/RmLeqmjqtHoGf3fuj+WjLLAxCmP8DWg3BnS
 yNtJ3EkirUlDWDrP31UrmsWPNlAcppiY0g/J7/+cTmaWWaU3DQxjIrsfc/wdi1MIP10w1F9
 yFbORv+kXy/tZ+IPDgXu969dAPKaKIplszEMrmZOjGGVebqwQ8TPR2kQE18Mlyj9gSOvCST
 uE6aJdhY5RP+aWM2hPi6548E9J6IMAau3eq2etmCSZUJUW/uvOAveL2wNBRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789736336; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jQCO1lrXpdk3Cfzx3wIoTrVcbxEHs1oQDclhX0KurhE=;
 b=Gw1EZLIRYv7Vu4jVy68c+vJYtVws0VIhG4sfQ9ZSe1WM313hrBBQuOSgIyWy0RyNkwWB2
 b0CM9h8soTedUK5n/6ln1rTtKiDXoT3WSYarUgQDDXlfGIEBUsTEEqcBdoQPsobWxMHMACW
 FpUfZzjWaMz7DhSyi2kejOQEHH7PlOx3ZUz3JysHkKev7nlpMk+3TPCDYjlVFNkQ3L4xE8X
 ZJnNAEV2fm6j3xd0j2X8Nl4em/jTwRia143FhU3vYGLwZ/9VsAcLIodknCt2gIFbjp0NNz8
 CGYI6I/RfrMeHPM3BjCfcpHrcZWDHr+OI2DApriVerQIOpUWGyx/1JwMWLpw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E8C00482AD
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 12:58:52 +0000 (UTC)
Received: from mail-wr2-f13.google.com (mail-wr2-f13.google.com
 [74.125.225.77])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F039010F37F
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 13:16:29 +0000 (UTC)
Received: by mail-wr2-f13.google.com with SMTP id
 ffacd0b85a97d-4843378fb37so363800f8f.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 06:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737388; x=1790342188;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jQCO1lrXpdk3Cfzx3wIoTrVcbxEHs1oQDclhX0KurhE=;
        b=qeOWKC06zNvHxkzSTuNCYUZtoH5F1Q6bPg+SR7mhh4XbLmAxH6uFLcriXgB0j1VmCp
         tC0S6poJb8WG0yJta0khqf8xMge66go4p9OnSfa2i0D2jzuEHFkB1JFcpcFW2bqIHiAu
         36KZqMkiHrlVU6/ftYTzwuftfhkuuuKBehJ1peYKiL25xHNQqCu7x8U57c5K9kFFmelm
         7+JibNUIatWKQb+gHU3FgSvduJhCKWQR2nB+XQUnNxUpYeB5E0iufzOdEVB/XnvlT3NY
         g06M+o2ZbZsePUaxzMCjo1g8DJ653hOIYKC0noy8koASCEa8E51Xr2KNXnSKsfS+e+ZZ
         aHvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737388; x=1790342188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jQCO1lrXpdk3Cfzx3wIoTrVcbxEHs1oQDclhX0KurhE=;
        b=hJjZjAdDtWRvr6WeKjqLH7kMnlD5sZdPB+s5TNpdhJjbs+eYMQufubFrAqatGN4of+
         rMXSa9NqH5Z/qinsNR7lmuf+cPi2g318fe3PYMwUQWkutUtY7MtD4sduvoqCnkLW0E3O
         OyIHd8cjakru/5lcxa6L5uGYyKLJJcQ1W8rNR9RV62mbH8B5IU/5Wrb1VCbGhgFL/Qvi
         I1ZbVJOLlKoNhOaukUAW+CxE/WgG3uWbIuGIHIYuJhXd3yXzn4+XUiUPThxtVZKE8Mna
         L+Ytij8Tsy6+PIdsBLmJ75EG17M9YQvMNnxpCidisW2DpznO+B6h52teUBKHpOcvCQOJ
         znug==
X-Forwarded-Encrypted: i=1;
 AKwUvBw2riRA4Y4h8K256tGFL0Flij7dsO/EgVVkZm/SpB+HfkWyDjqpUPjyd98HR8BjAaaIaMUqj2vG@lists.freedesktop.org
X-Gm-Message-State: AFuF++loLNSAt94IJze/VcamugyTAwLeWJCHnuQO17GxgtpuxMUE31oN
	Rq4GpM3Wj9TogWGUYcJ3hWwH2pgrnSt2+EfPGR8CvhhrsczhGaUzS8ND
X-Gm-Gg: AYBFou2U2Ghtw3E3CPAYG0vaL8LkLD4ZNy7HLZbGr13LPDEqNlrmvFk4akVxMPw1JYU
	Yn5BXXbDiYuVLw4dowWqlA88uVGzoR826293PU230q9D01Bhld5v+v2jayD2LJVwkvcdcqLYznv
	mxCHqUvLUpFrTj5xMnfWh13AWbFXsiZAj2+xxGVBqSCPElN8uTxpxDqpoSV/g99Un4E5APVFIoc
	mHM5I6o6Dn+iDuLdDa6Pozif6Lr0gfwyensrGegmBJB4ccSmUTTCZ4cNMYQ+t++oMHID1sPXz54
	c8oCM0liRcWuSRdfWnVvgCJQOGdSEhxEwl4qJ+q1Y5TQpCnf9vqKIVE8+Kj0DVqI7lfiLd+YD16
	cOsVDBIjMUCowjES1bUH9B/w+FCNoDGJ6rlX/74PwTsh2LVuahClalQYgihxec8zpL/N9sMyAbS
	LCHjfGynm1MddHub9EXPOjvW2gHmy6b9q7SpjLx3A5eM0lY4AkzGA60SryZWyWAq2ND31botip5
	itEHduiIEk=
X-Received: by 2002:a05:6000:2312:b0:486:f6dc:52c8 with SMTP id
 ffacd0b85a97d-4871e269e92mr3590006f8f.37.1789737387367;
        Fri, 18 Sep 2026 06:16:27 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:26 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 4/4] drm/nouveau/clk: don't clobber reclock status when
 restoring volt/fan
Date: Fri, 18 Sep 2026 15:16:20 +0200
Message-ID: <20260918131620.405133-5-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260918131620.405133-1-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XSZBCMJRQENA3WMZ7IDEVR5SPJIADIAL
X-Message-ID-Hash: XSZBCMJRQENA3WMZ7IDEVR5SPJIADIAL
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XSZBCMJRQENA3WMZ7IDEVR5SPJIADIAL/>
Archived-At: 
 <https://lore.freedesktop.org/20260918131620.405133-5-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_cstate_prog() reuses 'ret' for the voltage and fan-speed restore
calls it makes after reprogramming the clocks.  Those calls almost always
succeed, so the status of the reclock itself is overwritten and the
function reports success even when clk->func->calc() or clk->func->prog()
failed.  The converse is also true: a successful reclock is reported as an
error if the final restore call fails, even though that failure is only
logged and otherwise ignored.

The only consumer of the return value is the error message in
nvkm_pstate_work(), so in practice a failing reclock is simply never
reported.  Nothing else changes, but a function that returns success on
failure is a trap for the next caller.

Keep the calc/prog status in 'ret' and use a separate local for the
restore calls.

Fixes: 3eca809b3c05 ("drm/nouveau/clk: cosmetic changes")
Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
index a43246ae6..1cb83edc7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
@@ -199,16 +199,18 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct nvkm_pstate *pstate, int cstatei)
 	}
 
 	if (volt) {
-		ret = nvkm_volt_set_id(volt, cstate->voltage,
-				       pstate->base.voltage, clk->temp, -1);
-		if (ret && ret != -ENODEV)
-			nvkm_error(subdev, "failed to lower voltage: %d\n", ret);
+		int err = nvkm_volt_set_id(volt, cstate->voltage,
+					   pstate->base.voltage, clk->temp, -1);
+
+		if (err && err != -ENODEV)
+			nvkm_error(subdev, "failed to lower voltage: %d\n", err);
 	}
 
 	if (therm) {
-		ret = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
-		if (ret && ret != -ENODEV)
-			nvkm_error(subdev, "failed to lower fan speed: %d\n", ret);
+		int err = nvkm_therm_cstate(therm, pstate->fanspeed, -1);
+
+		if (err && err != -ENODEV)
+			nvkm_error(subdev, "failed to lower fan speed: %d\n", err);
 	}
 
 	return ret;
-- 
2.55.0

