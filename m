Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93B31C982D8
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 13:16:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 58D8D10F361;
	Fri, 18 Sep 2026 13:16:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="j2b4mXS+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE4E4482BD;
	Fri, 18 Sep 2026 12:58:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789736327;
 b=mvn1s2rh/Lk28oW86vFiLs0JT927BjzcSv/rew++TBsr3VY/vIsiTgl8FY/bG544kc+Fo
 QCnWE1tRkDu9h25cWJiaahe++2xV5Gc0Y9jh3+krLbj6GK2X1IyWxmyCUNMURRlEQm4Hr1m
 YOnw1nmU1bLB1do2Y9yNunaVI7j1cRuUilHBcQ3atOxouGM20md9AaDgSWlwWWpsW4MxmcF
 RfTDvUwZRErAFvCDRrwOIFb9MNL7CmTJtvi90zi+SKc0NWcCR1HOGukfC0lx0jE4ul5GIQW
 bB+M/07dA/X9dLqv03K8jApfDJ5X5D0N0R+pwugbBCMC+32l7oRo2apA+dtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789736327; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5wyvtDe6AEfbt4jvUldi9B/KYnA6W2vv8pFn6fJzAVs=;
 b=ewWVPwO5MpQH06RzHQt7VKV4LheY1xJ2WDV5dXlNckBCxp2hIflC5mV2GDgJD+YYrhm3T
 BkH820Q4ayj7sqJxwr5C2YRpnSlcc6tXTW8ayOY5nOtIuyHKByGK7l5CgCJ02M2CtVdIbdY
 Jdd45q1S1Imn9r0JWvJ4QAESkDg2XuH0AJH/dSZGIUScS3xnV+ARptKkLfr8mQ/MYfyxLRw
 dblV/TzLaChHuI7x7h3Y8x5Ik0nl0VNeC+VLzydekx5K4wAPKWHLQ68zTIQKNpRu6i664uo
 kaPe/VP+BGmszJQAJGzj5OtqI7VdxDefhxHyfgbX5beVWcNFIF9xQ/EOckww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2DB30463F6
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 12:58:45 +0000 (UTC)
Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com
 [74.125.225.76])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7829810E8C9
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 13:16:24 +0000 (UTC)
Received: by mail-wr2-f12.google.com with SMTP id
 ffacd0b85a97d-485933b2522so499839f8f.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789737383; x=1790342183;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5wyvtDe6AEfbt4jvUldi9B/KYnA6W2vv8pFn6fJzAVs=;
        b=j2b4mXS+EUAyLsSeQbVZxhJHsbZq0FDNuH5Qi8hLCs7/7VIveqDlAaVUtfwvRFKVK0
         w2rdBM7t9AuUQm1rSsO66wb/uoUJYWW9Ai31Y+IV35hSTakfUU7/IyDRRqaoMCwmVOC/
         6QZDYDII7fpUB+sL/BFp/3qlmJ5eMEnOLXi+dAz/JgPyAulwrx2Pqpv072gQzxAOwAgr
         AI9P+gib8qhL+c98aLvDnFLxIBYuu4PpiyUZfxyodlDMkMaksBcr52KNNA0x8fnzjwym
         slGi1bdSJmpZSWVxZF1BlDzyDBCCQdDsvZIM8Ns7CdM0X6VppJLYQPdo8EnR4/y/HfBV
         HIiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789737383; x=1790342183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5wyvtDe6AEfbt4jvUldi9B/KYnA6W2vv8pFn6fJzAVs=;
        b=GVPcHkdKi9PxnZvuicehPdgJ3zALnnMZ5rW9IZkC/JH6s/GaxydJWfBoNS1o2GDiG/
         VfNGOTWYfYsOVTrGbBLyleJuxhh4pT0faqzz0V1RfZJyv8WcG+QKe8bxQGr24GRaK1cd
         zHA6t0jD/uH/b/27D8vzOpJqKiRw/fEzdx7PAaJ8vD1mEBaH3nN6rdyQ1+YN4FvY5093
         9tTqpO9GUK1npRi1b+OYGRDxHtEkQyh7U9cAmXsllLZoi4cpHSfD/ORbVl7HM6twxo9y
         fmCi+Y9X5+4jz63xuPS7gZowNRIVifJpDx2/jr8qabMdcADWl9AvCDg3/cRZiXnZJUan
         7pwA==
X-Forwarded-Encrypted: i=1;
 AKwUvBzvN1dxjIaH5Eb44Yz872sfZufztxlCyayW4+FKwFRYrp1Vtc2j1WPcxb8LT/49pFk1CxUjRPJB@lists.freedesktop.org
X-Gm-Message-State: AFuF++n87CTu8vJPr/fmjl4GkeF0mZbS81xm7zTjPuTfIGbMiK0Hm3PJ
	keEvLg0r/bZJI4r8FUu4aeBZWtTxsXv92ZW80rPKibzRxs5b7jxJ2enF
X-Gm-Gg: AYBFou0ESoupvNPEg7XG2Db3/5qrFGaoE9RVUI7pEQl9KV/GRpNj8UaX2r9z8RZagg8
	+zonl8PVDWYohh1R70qzx3RvfSFhxYBxt6Gc6j1KrECvD4NY+cF6Cd334kLxU7tcZTbANeJe2WV
	iUvDldwY2ept3yKLAQQYRMZ9EZBxjbw3sSgavXXga9s7fcgLhZU8dNX9HTPhupcusYY8KCNBCLC
	vHNrURLaxbYTinMzoHoFVhrVo6O64Qr+6kyVmD9udiY5tXSICF7yZ54Soj0Ck2a6I0DVfnSLN/p
	Yp3aRX9/BvptFzoHzatFfofbc74GEAEoyYXlbBTSdfcoEqV6PgscQcvLr3Yk7I05sRaM5PdC88F
	nA5kIZHWHRm6xhFAyEOzxj3oDiFfQxVkpuL7FRds3h4jqIwuLJZecFPrMNvaFJB/W9Apm7oCtPq
	JyH+dOOLM++F8eSCCGADJfC7XZZTWVRY0m0rI3uHPQ9ECx+79GU0H6qFl9PQ+cuT1zsz4J6EBUs
	tFgjPHycq8=
X-Received: by 2002:a05:6000:2f87:b0:487:c3e:8df8 with SMTP id
 ffacd0b85a97d-4871e20f764mr6206001f8f.5.1789737382476;
        Fri, 18 Sep 2026 06:16:22 -0700 (PDT)
Received: from fra-x8664.wind3.hub ([151.16.209.67])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-487200829e1sm4487572f8f.34.2026.09.18.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 06:16:21 -0700 (PDT)
From: Francesco Magazzu <postadelmaga@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/4] drm/nouveau: fix list cursor use after loop in the clk
 pstate paths
Date: Fri, 18 Sep 2026 15:16:16 +0200
Message-ID: <20260918131620.405133-1-postadelmaga@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BA7IE3A54JRJQ6AGI4FTQ2BEQJ2WGZWW
X-Message-ID-Hash: BA7IE3A54JRJQ6AGI4FTQ2BEQJ2WGZWW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BA7IE3A54JRJQ6AGI4FTQ2BEQJ2WGZWW/>
Archived-At: 
 <https://lore.freedesktop.org/20260918131620.405133-1-postadelmaga@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This series deals with the three places in the nouveau clk pstate code
where the list_for_each_entry() cursor is used after the loop, plus one
unrelated fix.  They are exactly the three sites Dan Carpenter listed in
2022.

The only change in v3 is the one Lyude asked for: patch 1 is Dan's
original patch again, with his authorship and his Signed-off-by
restored.  The code is unchanged from what he posted; I only expanded
the commit message and noted that below the ---.

His Signed-off-by is kept with the address he signed it with in 2022
(dan.carpenter@oracle.com); .mailmap already maps it to the address he
uses today, and I did not want to rewrite someone else's tag.  Say the
word if you would rather have error27@gmail.com in there.  Dan is Cc'd
at that address this time - the v2 went to his old linaro.org one, which
is dead, so he most likely never saw it.

Patches 2, 3 and 4 are unchanged from v2 and carry Lyude's Reviewed-by.

Only patch 1 fixes a bug that can actually be triggered:
nvkm_clk_ustate_update() takes an arbitrary pstate id from the user and
never checks that a matching entry exists, so if it does not the cursor
ends up pointing at the list head and the code reads past it.

Patches 2 and 3 fix the same pattern in nvkm_pstate_prog() and
nvkm_control_mthd_pstate_attr(), but neither is triggerable as the code
stands: the callers of nvkm_pstate_prog() clamp the index against
clk->state_nr first, and nvkm_control_mthd_pstate_attr() already rejects
args->v0.state >= clk->state_nr before the loop.  Both are hardening, not
bug fixes, and they carry no Fixes: tag on purpose.  The point is to stop
the two functions from being correct only by virtue of what their callers
do.

Patch 4 is unrelated and is a real bug, though a modest one:
nvkm_cstate_prog() overwrites the reclock status in 'ret' with the status
of the voltage/fan restore calls it makes afterwards.  The only consumer of
the return value is an error message in nvkm_pstate_work(), so the
observable effect is that a failing reclock is never reported in dmesg.

Compile-tested only.  All the affected paths are reachable only by root,
through the 'pstate' debugfs file, so I could not exercise them in any
other way.

The two follow-up patches for nvkm_pstate_prog() that Lyude also reviewed
apply on top of this series and are not resent here:
https://lore.kernel.org/dri-devel/20260727152821.128432-1-postadelmaga@gmail.com/

v3: restore Dan Carpenter's authorship on patch 1 (Lyude), collect the
Reviewed-by tags, rebase on drm-misc-next.
Link to v2:
https://lore.kernel.org/dri-devel/20260712123616.1180830-1-postadelmaga@gmail.com/
Link to Lyude's review of patch 1:
https://lore.kernel.org/dri-devel/ad023b5df1495ced25aa681d10f57628df41ac13.camel@redhat.com/
Link to Dan's original patch:
https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/

Dan Carpenter (1):
  drm/nouveau/clk: fix list cursor use after loop in
    nvkm_clk_ustate_update

Francesco Magazzu (3):
  drm/nouveau/clk: don't use the pstate cursor after the loop
  drm/nouveau/device: don't use the pstate cursor after the loop
  drm/nouveau/clk: don't clobber reclock status when restoring volt/fan

 .../gpu/drm/nouveau/nvkm/engine/device/ctrl.c |  8 ++++-
 .../gpu/drm/nouveau/nvkm/subdev/clk/base.c    | 31 +++++++++++++------
 2 files changed, 28 insertions(+), 11 deletions(-)


base-commit: bc47d5937f21c5fc94504f03e18f1adb56d97634
-- 
2.55.0

