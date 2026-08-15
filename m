Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA8DCC5CFC1
	for <nouveau@archiver.kernel.org>; Sat, 15 Aug 2026 19:54:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B9BE310E61E;
	Sat, 15 Aug 2026 19:54:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AJmWT0e/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 134804783F;
	Sat, 15 Aug 2026 19:38:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786822690;
 b=IeTA5hSGcYamReIKZ0oEz2bQUaF+Hjwul66N3uc5aDj0o+edO+08OHsNf//dJHasK/47f
 ZUtQmxIiYly1YuMTUUc0ecQ5kzXY/wfOexf9LIzpDaMoDo+wjmobx8eLFuMNkrkcUwM0XJp
 zZtIoqVRaxjPG+LDDBhM0A/hWo9o+g7+yg7vUKl6bUWB27B+2Tc0NOSb7jSB42ax13NslfB
 kbKmWMNPhSJDyt2WllFk/T5n/V7eXnCRRSutnFRSG2X5XMbnakXPnyvRJJSg6sF3qwK3uFs
 kWOb6JYlzs5rOu6VnceaAoCXlAerKYelkD29Vv14VBZY6voM+oRo6farntAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786822690; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LRzhc3yRX4X2M0pP9m+t3D39cWjJJWO0zjbMTBO7W2E=;
 b=XfGqSGNjTravpbEjBiFc5Bh1A8WPLAd1I9Rn5Fn27oSWw/0evnnq6WIKxxwQnwYvFwnEW
 zKn1n/4gA5WAethzZ6QfM/Pi4/ogqsYQ2xxXC9yo2D6wSCSpTeJsgu7xFso4DGWCeKunHHm
 +b9LadAlWkQY31bqgohXW9K/obmTBOM+4TTnWDf9PyO77RIpteg7YKszBzYk8Qf575vz1Ai
 L0XTl5ZP8M7lqKbMrmdQ55LHALstf4jdLC2dF9CKddDmv4/jvMGwfB2oa9ZD2bNcWy+JWXY
 LdPOwPu0SXlfJ9Zlu76CyqCWcL+5w/qjKPsPuXsgTZwQ+L7mAS+G6UWfqh3w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 14A2F477BA
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:38:08 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98FC410E613
	for <nouveau@lists.freedesktop.org>; Sat, 15 Aug 2026 19:54:32 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-47f502ff678so247196f8f.0
        for <nouveau@lists.freedesktop.org>;
 Sat, 15 Aug 2026 12:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786823671; x=1787428471;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LRzhc3yRX4X2M0pP9m+t3D39cWjJJWO0zjbMTBO7W2E=;
        b=AJmWT0e/X8gYukuiyWRCWhhhwj1HlHXqdFDaGuFZCC7gi+f1IjAAUKKpONgie04XZl
         SbPrn/f1RC0P/vc5pShPEkJwcpQtXVDvq5KQokojZNRUATXpYS++cpwFIUUUt2Phiz1G
         IvZMXsi/3UvSK0/mKUhwAcKcnxbs8Daek0Y6D7OmXAjOgQ3y4BrxIS8xy8ILJsPSzZif
         zI/Gj1xRRUccRc9tdPRZRRhNXneU490w6BiSyZQLiFMTzvs2Xs9HLvwKt7gSGrK1KmCs
         BxJDadQNTfWv4maKjtyfEvYMr8o9CQ8YZFaARSuOptcsUIkDP1qaCBDuqPfW31HmcDkx
         mVgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786823671; x=1787428471;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRzhc3yRX4X2M0pP9m+t3D39cWjJJWO0zjbMTBO7W2E=;
        b=bBVGSy7JjoqgQGVcU/70umc/nfBCfGH8hcKY2YCOjuyebRe0+KU/g0wYPwRxQ6yEWA
         j4MJvcJb1w4r1Fa9SPpGBzgpTJZbO+FTh+9cYtNDlPkL8f7Sg3u95d5nuZa3NHAKC4mB
         UlD2qLlW+OsqejL1dsv00fVU+uhd9Gt6w9kYmc3RrirkbuxAB7v/+DZGizZ4c8ge9N6N
         xLF4dTDK6Y1CYolkXJ60hLAoFLG2idH5wJ7oFXw9YS9R0ak1KGO0Ap9Q6ZWnHS/jDgSJ
         pY2wYbzSfMmQKDKiNlsMgl9X16qQkjz/m7sUqZWVebYWh6ETR91k3tk3YYrT1123KOWn
         fwQg==
X-Gm-Message-State: AOJu0YzWVJ4jJhzpfySc32Zf3zPTTnwQKLB/aHEJFu43VjCaRrEzcTom
	8Y3+7pp6kmGMOPtmOWvpGT9lIQLwdrMdZrGDjRgVmUlYk9K8awFfknMq3ptFr3zE
X-Gm-Gg: AR+sD12QsjUCf27aGrDdBTpJgtuUXFS9yXzqhXuS5iO4c1wG262BWppD5jjogfPNP4M
	E813UHSwbPPTFFhjD6VhIJ62+LYpMDKkRvg3fjgyvC38zeZYodzkQ8A1KM2175fftoSb6R4ddoO
	IeRiHwa86Mk0xaLz/GC2kRqBqJACtZsHrsM5zPZLmBxO0SdDi8hu7gaPYx+99K4FqMwXL6bcbEy
	X2elR/dot4wK1kyBNGimpZ/ERcA+6irVuZ8aA3y4JHoQogGzCIQz3jnBIYv7hUJWTANEaAk0ZvM
	hqucInKWM5K66dCvoVkBRnbfr5IqvB4zuuQqVnNMcMyYb4YlJ3tEt8tywJB9pOb5yB6PjWhBPt2
	QrJJu8FGwmNs6WPwI+D9fmNXzIwG9hWBmpbM2qGhg2K0vqqdpVPspDPrNJ6ScCRoE1t7Qg08iIB
	RSJRO8pxX2neFOCOR0VcamnsNNynj0bg7SusTSOFiDrY9HwPFD1seL9LZGSkq9eAUS5dMNlUL28
	1+MKOVw8LDIixu4RLAth0INCsFXZ0zY9s2epovcLg==
X-Received: by 2002:a05:600c:1c05:b0:492:4a7a:e415 with SMTP id
 5b1f17b1804b1-4998795db2bmr142400025e9.2.1786823670870;
        Sat, 15 Aug 2026 12:54:30 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-499899bff2csm133743775e9.7.2026.08.15.12.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 12:54:30 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/nouveau: don't dereference outp before checking it in
 nouveau_dp_irq
Date: Sat, 15 Aug 2026 21:54:20 +0200
Message-ID: <178682366004.3748010.14933649768375463967@gmail.com>
X-Mailer: python-smtplib
In-Reply-To: <178682366001.3748010.7798811159846779765@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: FC4NACVTAQT4POKR7PZULKJ7BLG5AJ6E
X-Message-ID-Hash: FC4NACVTAQT4POKR7PZULKJ7BLG5AJ6E
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FC4NACVTAQT4POKR7PZULKJ7BLG5AJ6E/>
Archived-At: 
 <https://lore.freedesktop.org/178682366004.3748010.14933649768375463967@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Marek Czernohous <marek@czernohous.de>

nouveau_dp_irq() looks the encoder up and dereferences it in the same
breath, five lines before testing it:

	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
	...
	if (!outp)
		return;

find_encoder() walks the connector's possible encoders and returns NULL
when none of them matches the requested type, so the NULL test is not
decoration: it is the author saying this can happen. The initialiser
above it dereferences the same pointer regardless.

The NULL test predates the dereference. commit 773eb04d14a1
("drm/nouveau/disp: expose conn event class") turned nouveau_dp_irq()
into a work callback, and since the drm pointer was no longer passed in
as an argument it was recovered from the encoder in the declaration
block, which put the dereference above the existing test.

Move the drm lookup below the test. No functional change when outp is
non-NULL.

Fixes: 773eb04d14a1 ("drm/nouveau/disp: expose conn event class")
Cc: stable@vger.kernel.org
Assisted-by: Claude:claude-opus-5
Signed-off-by: Marek Czernohous <marek@czernohous.de>
---
 drivers/gpu/drm/nouveau/nouveau_dp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index 55691ec44aba..738802358d85 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -486,7 +486,7 @@ nouveau_dp_irq(struct work_struct *work)
 		container_of(work, typeof(*nv_connector), irq_work);
 	struct drm_connector *connector = &nv_connector->base;
 	struct nouveau_encoder *outp = find_encoder(connector, DCB_OUTPUT_DP);
-	struct nouveau_drm *drm = nouveau_drm(outp->base.base.dev);
+	struct nouveau_drm *drm;
 	struct nv50_mstm *mstm;
 	u64 hpd = 0;
 	int ret;
@@ -494,6 +494,8 @@ nouveau_dp_irq(struct work_struct *work)
 	if (!outp)
 		return;
 
+	drm = nouveau_drm(outp->base.base.dev);
+
 	mstm = outp->dp.mstm;
 	NV_DEBUG(drm, "service %s\n", connector->name);
 
-- 
2.54.0

