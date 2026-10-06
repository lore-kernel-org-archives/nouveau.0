Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B65CA5FFC
	for <nouveau@archiver.kernel.org>; Wed,  7 Oct 2026 13:51:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AAE9010F5F4;
	Wed,  7 Oct 2026 13:51:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="oAiqsCj9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 15EA246035;
	Wed,  7 Oct 2026 13:33:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791380004;
 b=YzNfnYjYrT9rKrk8dgA3wg44I6owhBuo8miH+JrQCees/zwIxCDK9kFwQwcbQBHsY//DU
 JoWpNu+D1oodKnC8ZDOlq1Pa7jE3PdiGjK06MCLqSEW+3Dyz99riUO3KXCosnM8dmgz6k64
 htzUBNj9AnSNrO3vBG48LKzPq6hkwL2RCYC3aU5NRQONNtrjht4ob+aU9J0IwQm4e5SzLMS
 gOFbv/+o+uTsVYit+POBJD1oUJUbPf2gDRg+dUjbBvYWGXgGDfTVE3bfeh8/fOl0y19kz8A
 Cm1RqBcTdnPuqxdqecx1l7MB20XopLrebu/kQ/VUpG6z0eWPJjCYWuSaBhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791380004; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zzBNG15RNJWIVCxEfCEDNKw3ft0cluQEDOTAP62jMkk=;
 b=bRUpF/19fyhOvH3MYl/MN6kBWZr6tzifZKbM2w76K75P9S5OxOlKaRjsUmdCdcVaoAm8Y
 0nY2/6S9LMxwEKuUyQv4Ld5wZvcz4PhEHq81qotPMN2ajziLtUuSozRfrE5ltEp9ARjzxXr
 c5B6ivEyTPZS0It93uVHKgSR/PW04Sboc+klA8vEn3i2dg4BfOZ4EV+gBMaagrURMAk6UJ2
 IDvcF6Xm7dR6t8BLxmWie5x15LugTxdoBaj4Ck/dchtIdLtPELcm+knJxH2yejU5/D709TB
 D3E08PJ9mK8DnWxIH4HQn14/OmcYrgIkA8uZ7yWVxKOsMci6SCXvTXHwpE/Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EAAAC401F0
	for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2026 09:41:10 +0000 (UTC)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com
 [74.125.82.172])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0A7B10F27F
	for <nouveau@lists.freedesktop.org>; Tue,  6 Oct 2026 09:59:29 +0000 (UTC)
Received: by mail-dy1-f172.google.com with SMTP id
 5a478bee46e88-34bb8b31647so4349733eec.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 06 Oct 2026 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791280769; x=1791885569;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzBNG15RNJWIVCxEfCEDNKw3ft0cluQEDOTAP62jMkk=;
        b=oAiqsCj9Y5MYQTaq0kvKP+Hcha0eg/F3hKxQ/yA0LeNMRGORQ54tR7r86CoyPgg3/L
         bUZ2jYbQNfDMH9A3ycBNvV2IB0NO2c0bDdnYE5+9MfJXnfunmNH2LtKpd8facRnVco2Z
         JXkpN/vzcvePKavRMKzm4vzmuv5CLoC+Df3W+JFNIdRcOlp6Z27b4S1h9DLlsd98zzxN
         /50eRoni/4LqnSCUUo0Q5i731jfTZ4QO/Vg8REeFFGFoJyf1ipvi2gsJYhFx8TDKqj8G
         4vzHVxdbLFNDBr9Bz7mJo5+5ejPXHkOhKBgob9k3j8qYQHJcEdAsBx6Siu2ty3Xo3cEY
         XMKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791280769; x=1791885569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzBNG15RNJWIVCxEfCEDNKw3ft0cluQEDOTAP62jMkk=;
        b=NNMhP1LKJjsh/kj20Y8cg0kb15siEtX/8Q/GIhFDl8LFwG5sQ4F4tW1LJr59cNmuZh
         ikvPrxELbitW5OL1rUj1mAVLOWk7WSwu1idQ/DQkZHO+OBZ9EJt549vdpHKSgHo73YZ7
         qZaYNzwy+zXIlq6stdAB3OGDeqCUDJAgFl9t0Z4ynZV3jTvg2IQDjnGyQbpINTpNdNiF
         0BX+zfg4irnyzir4sE5nvLx2+38RXeofiZ8OR4hmi7qMX6Zm9SVxpDoZ6sj/9qUAhsE+
         voo7maou2E++GRR++bVANO6bn4nvBBgCXrIpJBybPfgdFX860YNlVdDjTVMkJKwJ/mbF
         ZV1w==
X-Gm-Message-State: AFq9FYKIQCcPUGdQlZISAGKDMLNRHihMUHEwe2AijXFWwniXBHq7aY4J
	3ePSeRnizpJkz+rG+Y36U2ubM5rQbIWPKhAL0ZEpFKPUyLWp4yo5HPV7
X-Gm-Gg: AYBFou39J3TrFMbhWrpDZ6R7ENdqqjdeqlFXuQUk6GEELu2qJ897sI6dP3Bon/pwj52
	y8aU2NlhNQnrNUyO7bsK5K5nFACOVhny21bUUPanqn5h/sOyDUMN+AGQeIOZZzr6njEWQv3uc77
	zWRecRFd+hIf2FPUku2Phzw5VmLHuhw8GyW7jcggYE8XMjA4AdkwonojSayynzOtmSrplgWCbZc
	9dU5PHhjTpbNMoerGt+/A/cO0ZQbGSOzWXsjV9IUv58dvLokHtfu12dAoCqZIYbyDrdRo8T/kos
	QUIh14s5CXboRlJJQAsbtB1lLBDHEDviccCnTX3kib5yVD44i//gB9Brygx/tgzRuZ8+D7VaX8K
	ZHr+18lXHOWenNUmkRFrmnnlF9BKUsuV1ughgYMeNtO+IGAid7eGaW9/tzYcDf4DafQEH364eP0
	40MqSPW8YzK5nLDXQGNzwIpcT2kw1d00qfq7/MnmL8ShXBbU1XpzQPpWS5z3F+mAp2x0pKY5SBt
	CgId1IhL3uAp6XX3vDJn/Pm7/3hfSi6PmfTJWI=
X-Received: by 2002:a05:693c:62d9:10b0:340:e422:fd40 with SMTP id
 5a478bee46e88-3514e2a5419mr1086417eec.16.1791280768761;
        Tue, 06 Oct 2026 02:59:28 -0700 (PDT)
Received: from DESKTOP-HOME ([2406:5900:111f:dc2a:3071:69c7:a4c4:6259])
        by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-351464fd465sm9305276eec.0.2026.10.06.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:59:28 -0700 (PDT)
From: Beomseok Kim <dilddream31@gmail.com>
To: emmanuel.fleury@u-bordeaux.fr
Subject: Re: [PATCH] drm/nouveau: Fix NULL pointer dereference in
 nouveau_fence_sync() when prev->cli == NULL
Date: Tue,  6 Oct 2026 18:58:41 +0900
Message-ID: <20261006095841.35167-1-dilddream31@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr>
References: <1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dilddream31@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: X2VFIUMOICEQGOXAP77D2DGRDYMN6VVG
X-Message-ID-Hash: X2VFIUMOICEQGOXAP77D2DGRDYMN6VVG
X-Mailman-Approved-At: Wed, 07 Oct 2026 13:33:22 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dakr@kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/X2VFIUMOICEQGOXAP77D2DGRDYMN6VVG/>
Archived-At: 
 <https://lore.freedesktop.org/20261006095841.35167-1-dilddream31@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Emmanuel,

I have been looking into what appears to be the same NULL dereference in
nouveau_fence_sync(), and I found a path that may explain how prev->cli
ends up NULL.

In the failure I traced, nouveau_fence_no_signaling() removes the fence
from the pending list, but leaves fence->channel pointing to the channel.
The fence itself can remain alive through a BO reservation. After the
channel is torn down, the same fence can later be encountered again in
nouveau_fence_sync() through that stale channel association.

The normal nouveau_fence_signal() path clears fence->channel when removing
the fence from the pending list, so the no-signaling path appears
asymmetric here.

I also did not find a normal path that explicitly sets channel->cli to
NULL while keeping the channel valid. If this is the path leading to the
crash, checking prev->cli here would prevent the dereference, but the stale
fence->channel association would still remain.

The existing fence/channel lifetime handling seems to rely on clearing
fence->channel once the fence is detached from the channel. If that is the
intended invariant, preserving it in the no-signaling path seems preferable
to allowing a non-NULL fence->channel to refer to a torn-down channel.

I sent a separate patch that clears fence->channel in
nouveau_fence_no_signaling():

  [PATCH] drm/nouveau: Clear fence channel in no-signaling path
  https://lore.kernel.org/r/20260928081450.19340-1-dilddream31@gmail.com

Thanks,
Beomseok
