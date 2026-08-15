Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95ED6C5AD5A
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 17:31:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D1F4610E5FE;
	Sat, 15 Aug 2026 17:31:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="DQPDg5/2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 61A0C47841;
	Sat, 15 Aug 2026 17:14:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786814084;
 b=quiXwAryOVZGG+x8yhPwDqPbS2gVfG26kSVxFD/0jxC5NT/X9fkQaV1mBhGJst0G39oqn
 ujpVjWliwJAEEwAP09lNCkMx9XoE+Q1AvoF5nuGxIAAxbtV5WV6hkm3p72IO5u0+D6ncM1u
 TVac9hWmcMuG3mC+xLm16Kz+6lArqCVki9G4JcZEmbAtQ0uz1WP7IA6ijlBipQaUwj+X56S
 6OiTZZmCMXu9crB5gLog/8Jlz1mAW7JHtrY5+0bTAPA7LPmbVX4H51CJb07H0p5N0XtnW+R
 MNmZhekhf3Hkh0zoVkAyBLCCVGqwf+niKRa8rZcR1GsO5lgkcz0DWoMo9B9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786814084; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=caUxSmF4mOwDWDjpizi0YmdYhbjdvZBNYyy5yHj52EM=;
 b=eCQtTeiMJ3NT61m8Z4zg5qmVh+tx3A16kk+5OWjDidgw9tRAowIZMprHdmCYBChcgsReZ
 rOvmTAdWus/walxZUA9a3C27U2ZxBlKVTSJjmKGNKWRJ0ldh+4vaFpUTpHVsjFcOfn4xyDY
 ZEwmb2hIieG9uPVJiaQZooxGhhNG71FuzNwte0EXbeL4m+OyIBD4ntMBty4jhClxgELg/tH
 xVzI2m5Y4RnIS/XCU6sKbtgWhBynLh58ssBcefNJ9VaRgGcoSltMmvJuwm8lH4bgB1oHhl3
 RuB20R22Ya9cYLp+YuBfr4Hw0fALZTDIchMoHeoxw/4VOuUs+2mf7weLSORg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 04FDE47818
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 17:14:41 +0000 (UTC)
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5265E10E1EE
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 17:31:05 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id
 46e09a7af769-7e9ef94c0e2so1267795a34.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 10:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786815064; x=1787419864;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=caUxSmF4mOwDWDjpizi0YmdYhbjdvZBNYyy5yHj52EM=;
        b=DQPDg5/2Qfe7uYcjzOCsiyUY7BV4I6uEl+0eu+b5FCicFeyWGq7MSvTNXLMXlYVonG
         VIwv1oi1hKx6Pg5bFXkiRGsiF5UB7pYL1alAFFAoy85Wkw28Dx2S9PrDUI6Jj7QdOG+5
         aAKJNof16sUD8JPr1IHK+af+PWDih+c8o0vXLimGc0p8HBFF7zriP/g04h4ZwuAJdJ/s
         hxn6m9E0Q/lIfefJsJRh8ywJk5cF2t6I8xWAod0Jhhs0zm9Pg93o+4CDgf1Ha4p6A226
         1sXu1683ceytDaWjUyNUSy95dMdmRYKFXb5eyBFcj4iRP4ybUIATI2XDTx6ASxkBY1pM
         MxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786815064; x=1787419864;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=caUxSmF4mOwDWDjpizi0YmdYhbjdvZBNYyy5yHj52EM=;
        b=oxZerEEkEz0sZzGfUZXX8KmrKaOWW8mh3IcqOaC3x0/BLtwItQcd8gh6/pNoRopVLQ
         ZErXEHwXuYeHvUnBiDaHxMQBGxCSdPgIOAYyi03/e9R1brRS/V31UZ9KW8LRQ2iHtcec
         taNtxq0UN2T3Ms7R2d8ShF5WcxZyD91nNZ1CXYtzhKwyL6R6ajdr0NaJf+a57DhBhTdb
         eqAATJMSdu4+migaq9QxUgNrCA7cTxElOvkvrdMsVkEFBcsFHRXZ/zvFOA7hwa59r+Yi
         2ruGCnwfop+RTiJa3yQe/USvSgW0bVCiHbnNiMzC2UqtwvRpXy4GLRLBZ8D+2yLCdtNd
         9jdg==
X-Forwarded-Encrypted: i=1;
 AHgh+RrBX+7RkIY3AmiFnVYpPg9LeMj0dYJC78d8vsZhcwyVzxk5OxjIxBGFtd8ZseZ74v8wKAJnBSRS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWsrdN8k40j+B4iq05QeU3I7Nd3T7aR+Or5LognP5vTIiTv9Ei
	dCclZCO40ioApcUaupsT/LJPQVfzbirOMy5UWvZak3zzYi8nzhKH1EfJ
X-Gm-Gg: AR+sD126kyNdWLkUXsawDQkypwELg+itoodHyIV1QCfqmpP/jA+z5FRi4QPPswcLqib
	bsTh8SgOvIJUx+2S+NxKTLX+tQQMa/qVzJOyHcDI3Y6LWcVD4oKC+194xud0WTiPe/WftoEtIWD
	YnR/8F1MpqbJP30EOh32YSnoRdXfY39Y6Dqi4h6+YQucp2BaNJdKcqJ9/doj2td3ryUBKA7R12k
	AwnWUXLmLQZ1Q1qLsE7WL8gaW/ZSyvqGohzA1f31rhf0JjQvOeWpdSl9jR2M2cRBqYsIUzaEfDm
	8arYiQayenHbt0xLudfY7d1cZk8cYjqCn6guozOgzcYKF74IeXAxmv0gGVwhA9DcZjv5xhLgNSs
	1pWYKiWKnn+jcyOW1go51HKbVatQM1lGRz7+0VILEkWonExFR5wKQmP1+oSGoG0C+ggxAJoNibf
	C9S5g8Ws7mN9mmtlE/5rsK1dks3uNuQPx4j+FLhIFXxfI0DpBZO9Hek3VbXS9E83l0EhULxqd6Z
	tEDrpD7/rMfSgKw0RuAUnDGSleep+eK8mmlO0RAYw9wSC4TqT+O8g3v9jRGU3USCmR22NmtXRoE
	NDU+0V2oO2XdH5ussic=
X-Received: by 2002:a05:6830:4488:b0:7e9:e709:44f6 with SMTP id
 46e09a7af769-7f3de679c0dmr12685842a34.12.1786815064517;
        Sat, 15 Aug 2026 10:31:04 -0700 (PDT)
Received: from [192.168.0.245] (c-98-38-17-99.hsd1.co.comcast.net.
 [98.38.17.99])
        by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7f3e86686c4sm4029328a34.23.2026.08.15.10.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 10:31:04 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
Date: Sat, 15 Aug 2026 11:30:53 -0600
Subject: [PATCH 2/2] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-null-fixes-v1-2-0df9dda951fb@gmail.com>
References: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
In-Reply-To: <20260815-null-fixes-v1-0-0df9dda951fb@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786815060; l=2253;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=AYZ9MDfYP+/3hzlU1wrveigPwRkF/U6OUgZWgjhl2yY=;
 b=kzw5BbvnfnMPlkNH1/kbY9HreJCu8O+yyr+c0l0w1aWyb5VnBnAVDh3CzuzCH/TM8DT1w3wLy
 7MHLUYfUez3CfHaoo5Zh8B8H8aU8XTsCV6QG5iNm++64EqxGhbst2cF
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
Message-ID-Hash: QPIYLGQD5IQDKGY5JGD2PQCN77XDKAE6
X-Message-ID-Hash: QPIYLGQD5IQDKGY5JGD2PQCN77XDKAE6
X-MailFrom: jim.cromie@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QPIYLGQD5IQDKGY5JGD2PQCN77XDKAE6/>
Archived-At: 
 <https://lore.freedesktop.org/20260815-null-fixes-v1-2-0df9dda951fb@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

When graphics engine firmware fails to load or initialization aborts
early, nvxx_gr(drm) returns NULL. Calling DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at offset
0xf0 without checking for NULL, triggering a kernel page fault.

Validate that gr is non-NULL before inspecting gr->has_zcull_info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference, address: 00000000000000f0
Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present page
Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Aug 14 09:21:52 frodo kernel: RIP: 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00 00 89 16 8b 90 c4 00 00
Aug 14 09:21:52 frodo kernel: Call Trace:
Aug 14 09:21:52 frodo kernel:  <TASK>
Aug 14 09:21:52 frodo kernel:  drm_ioctl_kernel+0xae/0x100
Aug 14 09:21:52 frodo kernel:  drm_ioctl+0x2e0/0x560
Aug 14 09:21:52 frodo kernel:  ? __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
Aug 14 09:21:52 frodo kernel:  nouveau_drm_ioctl+0x58/0xc0 [nouveau]
Aug 14 09:21:52 frodo kernel:  __x64_sys_ioctl+0xb9/0x100
Aug 14 09:21:52 frodo kernel:  do_syscall_64+0xe2/0x560
Aug 14 09:21:52 frodo kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Aug 14 09:21:52 frodo kernel:  </TASK>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index c9270c5b0fac..f1026a716ff7 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -357,7 +357,7 @@ nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
 	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_get_zcull_info *out = data;
 
-	if (gr->has_zcull_info) {
+	if (gr && gr->has_zcull_info) {
 		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
 
 		out->width_align_pixels = i->width_align_pixels;

-- 
2.55.0

