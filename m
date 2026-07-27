Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F356C531FC
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 15:28:33 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2171E10E4D2;
	Mon, 27 Jul 2026 15:28:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AonkEpf4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FFC64740E;
	Mon, 27 Jul 2026 15:12:51 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785165170;
 b=QfA6somb4URigxG3VkeD70AmrbMkfcm/a9tfn2j0pNXU5ZSKJU89FuWBQdtK2HRxRS8Y/
 rL2jOLNUaFjrSOPGZixzQCRO1udNx/LDigNPJEjT8h0/IYqSEdFuo39zLCrhLWVP/D2CCHL
 3pgbJdA8nzpBsovTqtBXvfNMDTo3XkgDLZ1hqtoSJdJtGP3I7dltcJ8kg7vVi9FTi/2LXEQ
 dLubXnHRd1YHl5IqxhZT6jQsBT+MG5tiqeXzrigObQ2qIJjDMW/1BF7WUI+AFVcoZF/54zb
 A7BM8prMiYQhV+INNXkXHNqUTV8imCKewmmR+knALsnztp7315Sj6q30DAYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785165170; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bgMfUYC7ZpwL2pGUZegRGSOZuFsMOmvyJZY8xkpkpds=;
 b=m5N8zFWZX8dzdGIbspwR/8cOhoFYajVqnimnVttFOAekKwsAomTE2NfHZ72xrgFmFdVHb
 +LY5Qn/vfHTWGlWPAoT6jaY32l0PLdYDq8hD1pUp0POiGUp1T18Ax0NQQwo20OmqJrxZvv8
 qwRlPe7XBTTsRi3VSsS3GKiULNiBOiMTaFr2Qx1B1U98dpggLo9Mwtybd9JAO1oTjNnd86p
 GzNU+EoCOI1IBP+pWl0cRA5zPtW7NC1mWmqQm7XQVJmKHsmpPFXGX4cB4Oc0q21DBEMxvPR
 89oIUT55frDXd8ve2gNhH5lGS+7+l7PjJpD+E5uYkG4kYW8GSVQ4MC9z6+Gg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1B6F7473DF
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:12:48 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B34A10E4C7
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 15:28:30 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-495590dde14so31492465e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 08:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785166108; x=1785770908;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bgMfUYC7ZpwL2pGUZegRGSOZuFsMOmvyJZY8xkpkpds=;
        b=AonkEpf4Et3f0mMfZzeiTpAZXzo6RjHmT9CCeHx7/pwqHg+TlBEKzRHLKR/g0/nAFs
         yYakLwLOKWWMYPmbOxfx4DJKMc6WmLHk8N81P+2nyMl08xBk6VSnVcpt7yuIE9V31pEk
         L4W5235j9aDUfgw4cQHX+KXpe+s3jeMPqdc5Wu8NR4xiP7VvkJPc2b970hhuTG2FVpBw
         quFzevEwiVXxBtswuSuHtG9swOFaWm+yzdUti82hD+qGENr2sl7MnlDZnX1cCGfnTFdm
         6/zaA9hloY359HwN1nuAE0EY8rNLCcxi7yPHxYLLU37oEQ+W4MerNjNM2Rx2vHBhRmab
         9xCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785166108; x=1785770908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bgMfUYC7ZpwL2pGUZegRGSOZuFsMOmvyJZY8xkpkpds=;
        b=Pz2tYhSDKEgkvMtEZb1ZxHy0IRPDpY1rsUCRGw/Fl/qYHWGA+dgpyLsmfeqOnkWYSz
         0bEJUSv/66EtOmiFCnQUWUlGpBu8uvmhiZfNbwhPcFNzZrS8FxMMOGim69jL/2AT6v40
         a8gui6uMW3n/PwzHSgo608uSH7n1ARbk34eW5A9jIhtFS7rrhgaQeOVa66L7wjTRUTjg
         1yhKsSc4D+Mskdd8E/4D9AjRtxFBjLb+T8hbg2bFZDe3MXtxB+peMSW78tZG5t3ohNid
         Y71hxu3+MfTnjOA2h18rKlG6Lg08Ft2ZsZPnluY3vMboTHBUg0BCTNgTUbIuX+vGZkMx
         78gw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqXiguharJSUsIUEBT2xsC/BF1gqrRGWQjL8/qtUdVt4INyURIhdjENEHwZZqiZZE0A6m1zPLkH@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn45jmiAyfWzRBtDthv86OHq70oluEon0vhXprjt0vOuxmtWIX
	gdXjezME42ZkA7ve7+4blNokP+JfT7MFvTbBG65iRP5nsoekpuGM6MYLoiNI7XtP
X-Gm-Gg: AR+sD10VvPsk+3OOTfTcsz6Q8KfOQ3+4zqW3zcUqiMQyljEKPcvGbWghH08hyh/e+aB
	zOJvhTNcZjkk5CwuYVoOZy+PZ3U+v9Y4wKA5RcPde1UFAviX4nSFWbFEOAmUxYEihHZVBmqaLiH
	BcuuIwMvsU16f8LbV3kQir6NxKx7p4l4AB6kRArc+M7apciTSAUBvRP0QyMtiaSOHO3AGeFc5qY
	+p5GqLQXAjRtL8+hGelEgd4tZuLKo62j4XgnOEY3O11yqj7PqlrYGby+kaS+Xom04jCNxkyPQDq
	cnnmLseippSae/IIz3fRwoXdIX1Dp+g2D+4kW31GN9l8iIiV9/UWPAkzNA/nhyGvBSCtTw/97KM
	NwJGTcjFsjP1EFaWAqKkiEuZhLMVKCt4srvQkITle3rfDuSt5z5M7hRWCwoeZ1sktTGjf08zo2z
	jA95iNaho=
X-Received: by 2002:a05:600c:3488:b0:495:7a23:1eee with SMTP id
 5b1f17b1804b1-496c3a0cc27mr15603325e9.12.1785166108275;
        Mon, 27 Jul 2026 08:28:28 -0700 (PDT)
Received: from fra-x8664.lan ([151.16.232.22])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4957b816ef8sm214838735e9.1.2026.07.27.08.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 08:28:27 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] drm/nouveau/clk: only update clk->pstate after hardware
 programming succeeds
Date: Mon, 27 Jul 2026 17:28:21 +0200
Message-ID: <20260727152821.128432-3-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260727152821.128432-1-postadelmaga@gmail.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IH77IEFWLLFSOWQ2O2TIFLM3OEK5ZVDA
X-Message-ID-Hash: IH77IEFWLLFSOWQ2O2TIFLM3OEK5ZVDA
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IH77IEFWLLFSOWQ2O2TIFLM3OEK5ZVDA/>
Archived-At: 
 <https://lore.freedesktop.org/20260727152821.128432-3-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nvkm_pstate_prog() wrote clk->pstate = pstatei before attempting the RAM
and core clock reprogramming. If either step failed, the software state
tracker had already committed to the new pstate even though the hardware
transition never completed, and a later re-request for that same state
could be skipped (pstate != clk->pstate would be false), leaving the
hardware stuck out of sync with what the driver believes it's running.

Move the assignment to after nvkm_cstate_prog() returns, and only commit
it on success.

Found by Sashiko AI review (https://sashiko.dev) while reviewing
"[PATCH v2 2/4] drm/nouveau/clk: don't use the pstate cursor after the
loop" (20260712123616.1180830-1-postadelmaga@gmail.com) as a
pre-existing issue.

Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
---
 nvkm/subdev/clk/base.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/nvkm/subdev/clk/base.c b/nvkm/subdev/clk/base.c
index 737bec8..91c51d4 100644
--- a/nvkm/subdev/clk/base.c
+++ b/nvkm/subdev/clk/base.c
@@ -285,7 +285,6 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 		return -EINVAL;
 
 	nvkm_debug(subdev, "setting performance state %d\n", pstatei);
-	clk->pstate = pstatei;
 
 	nvkm_pcie_set_link(pci, pstate->pcie_speed, pstate->pcie_width);
 
@@ -302,7 +301,11 @@ nvkm_pstate_prog(struct nvkm_clk *clk, int pstatei)
 			return ret;
 	}
 
-	return nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
+	ret = nvkm_cstate_prog(clk, pstate, NVKM_CLK_CSTATE_HIGHEST);
+	if (ret == 0)
+		clk->pstate = pstatei;
+
+	return ret;
 }
 
 static void
-- 
2.55.0

