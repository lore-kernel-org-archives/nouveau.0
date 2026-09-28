Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED2ACA5FD4
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 03:16:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A86610E367;
	Fri,  2 Oct 2026 03:16:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J1J5PxZ2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D9E20488A9;
	Fri,  2 Oct 2026 02:58:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790909887;
 b=fJp6NB4ToChZKucObH5RbH1QmUvJcFQjSNtH99QsaM7fxcLEgAa77Mrs7WoCmUNkgPsMp
 4x3R3d8n4Jdg4vPvQOHX4DtyDuSRwnRhL8Uaro9GAUG2hchL/CKnaMCvSV5AgrHEr7pMS0k
 uqV0hE1EpXyvFY018bb95ephRNyX/PEMjDnpr3lBo8Qj2o9nmBSgh6ftLxXd43pEijoSWsv
 tOUlxyWTOEXreRXz5NHJvb80KARyNwBpVqxRIbfDkhtOdLlGdcr0Kftsutxl6Rvj4ui2RHe
 2LN0s3I0TiHpk6JlxwqIEvBqM5OM8+nb9HyHz2sMT9iIUnthGIUzmdSNK5uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790909887; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3PGFMLkqPdnEjr3rj+p66S6V4/orGCF5/967SLXqniU=;
 b=uvREjR06cGVSDxoRaHF2hgAq5vK4gKLK7p64pE91E/PucAotBF/P7X1c4i67rVvWTQ6NY
 7NWlCMfmVeAKQMZ5ffQkSHwF9VEEiD1AsIy177P9Eiq8Cc3QS37G8kXwMpqrUT/Ucu3WtGI
 usenhsLbAoZVQ6H6b8J93WW9H+Ws6vAPUQ02uhXaVH0miqWSSb3U/n9q6NQgYaPvYWNX4HV
 KTEU/VW3GyIBwyNpdksY2UqwdKN65pNL6AmURD2VV1twKF4uxC/vPTGClto+BVJraHKo8or
 vXzIr8Dxo11se0Ky9KqWB4eO5XJFCW5qhxwzSgX4DFe+krtl/qhPDcRWHXDA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 199404764D
	for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2026 07:57:10 +0000 (UTC)
Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com
 [74.125.227.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1107910E7F3
	for <nouveau@lists.freedesktop.org>; Mon, 28 Sep 2026 08:15:11 +0000 (UTC)
Received: by mail-pj2-f41.google.com with SMTP id
 d9443c01a7336-2df90e859e8so8468855ad.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 28 Sep 2026 01:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790583310; x=1791188110;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=3PGFMLkqPdnEjr3rj+p66S6V4/orGCF5/967SLXqniU=;
        b=J1J5PxZ2/e/P6aRtz7OTYySz3VTJSZBID+OooYnwDxc8eXsXsH+4m0rAg2CeKW6H7Z
         SXTI3hBocsn5hEN91VktZh8/9Wqa2PcnS42aAwfC5AZJsRJ0gyyfBGEV8JplJSlgSCWH
         cpFBUs41ABIg8JHsZcLUDv5pjFiRj+YQAtTeQxwrvEHCOTH1lt2t0PKbipZc27XtGJcG
         yxzoPukXa8uyDgmBUgOsBP0moqFjVRdu0TPmHJK9s+G0hrZsY+MdMtk2hIj3uocWD3AK
         7JfEasvCCxQlPPMOyx6mEtlBt3Vbf7MqLfnXVvX+iBLwtlACl6coFIUIoy75P4jQlUzd
         Y64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790583310; x=1791188110;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3PGFMLkqPdnEjr3rj+p66S6V4/orGCF5/967SLXqniU=;
        b=RyC31HzgocouquY9ioUCf9CbDsGsIXu0I4u81CGzhXLus/Nvur1l/xgRjREd69f47p
         azWQPcnEYdLMMKw+uivg0PNUTRtz9zb5kM3QEEGlovPHGjY4RRO+K+uFbxW+1x/vJvKk
         mGqBiWVBzqXTqDAGhwxAArh05Cz7Ba9LjQHuYZ76ZBWArwxIS3Hma5xqZaXSCVGNCCVI
         TqjvJ0fyqWYLv7yEWpVQGdwWue/wvRQvPYHtEBYU95WkpAM7n8N8Ugs3jVzcs7MKVjg/
         Z/DpHP/nqmhAOeexCa9X4Ow29HhxUioGdKno6M+23zq1d941TFnrjwe/xHdcIKwRE4rq
         8H2g==
X-Gm-Message-State: AFq9FYIm4vZZ1Or0YPt/dDMwJxvyN5AKf/IifCoKD2E5Jy8PBBKIrxFG
	EDAHwnGcPTZXs0AR7Eh5aM64hApmV0kEU6/3N4Km9xSsrAcIuIY5ivFdkm85KqW0
X-Gm-Gg: AYBFou3jm67PYXcTPVC4w2Y1gyN3gjRQnvj4netnB3o91ifvW4HBhEaJeCWepQCT+CD
	H8QrBPd0Rgmr6BKPMhWkdu+5KCMRGCNs1mL2V6/EfAhNTET00VrZxy4Oa/J4FR3jkw/VPyIs1Ci
	SNdcF0zZ8TmWyhGhpb8aZOZ1J6D2xofU9o8JEJcM2je5k6kvoPqnWt7oQI79mBZl23o/zy6Wp60
	+b0D3kBtXgCPYLcmfFOuZYaYklc80eeUKudRTFd7NLYBQrTijNn4ONf/VTOraTTvJOgftUXpmOO
	o7U43fwd6GhECD8SWGGZYg5u0/FCiCxBYOSEEt+P0zlHPqrLgyJQV8UO+pJSr4Lh1ouhnzHlof9
	nWcmCHw55efOTJAlvWclP8Ug9w8JdQrSyfV4Az4mh2xkM/vWxbEsM1A1bDX2eLkC4uHT2/6LDps
	BiQM7Ifzy33gT9YU2hvdjWWI/2g2+iMu70QAepkmFUfgwQG5k3jBcmRvkiOiHgjLWz/u2QTPa4y
	XW3b9psQrm4CVJhn+otCkrdIEJkLxm76r0OIu0=
X-Received: by 2002:a17:902:fdae:b0:2df:67e8:4a39 with SMTP id
 d9443c01a7336-2df7dfef6ffmr74050975ad.10.1790583310497;
        Mon, 28 Sep 2026 01:15:10 -0700 (PDT)
Received: from DESKTOP-HOME ([2406:5900:111f:dc2a:3071:69c7:a4c4:6259])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2df90fb675bsm37833275ad.10.2026.09.28.01.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 01:15:10 -0700 (PDT)
From: Beomseok Kim <dilddream31@gmail.com>
To: nouveau@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
Date: Mon, 28 Sep 2026 17:14:50 +0900
Message-ID: <20260928081450.19340-1-dilddream31@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: dilddream31@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: YPU2RROVOLGNQ6TJMY5JKM6ASTO4BMGE
X-Message-ID-Hash: YPU2RROVOLGNQ6TJMY5JKM6ASTO4BMGE
X-Mailman-Approved-At: Fri, 02 Oct 2026 02:58:05 +0000
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Beomseok Kim <dilddream31@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YPU2RROVOLGNQ6TJMY5JKM6ASTO4BMGE/>
Archived-At: 
 <https://lore.freedesktop.org/20260928081450.19340-1-dilddream31@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

nouveau_fence_signal() clears fence->channel before dropping its
reference.  nouveau_fence_no_signaling(), however, removes an already
signaled fence from fctx->pending without clearing the pointer.

The fence can remain attached to a BO reservation object and be used
later in nouveau_fence_sync() after channel teardown has freed the
channel.  This leaves a stale channel pointer that the sync path can
dereference.

A diagnostic build with concurrent short-lived Wayland GL clients
observed nouveau_fence_no_signaling() with a fence pointing to channel
C, nouveau_channel_del(C) returning, and then nouveau_fence_sync()
attempting to read C->cli.  A no-fault read failed after teardown.

Clear the pointer in nouveau_fence_no_signaling() to match
nouveau_fence_signal(), so the sync path uses the fence wait fallback.

Fixes: 29ba89b2371d ("drm/nouveau: rework to new fence interface")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Beomseok Kim <dilddream31@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index edbe9e08b..5b09cf134 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -488,6 +488,7 @@ static bool nouveau_fence_no_signaling(struct dma_fence *f)
 	 */
 	if (nouveau_fence_is_signaled(f)) {
 		list_del(&fence->head);
+		rcu_assign_pointer(fence->channel, NULL);
 
 		dma_fence_put(&fence->base);
 		return false;
-- 
2.55.0

