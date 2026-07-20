Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F79C44520
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 20:55:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C74DB10E1C8;
	Mon, 20 Jul 2026 20:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JtxoQhaZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 866E34725B;
	Mon, 20 Jul 2026 20:40:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784580032;
 b=at41eVRWk8dkXLwwCdMWVKMCZXL6Q3rtJlVukFtQOaH5r+vmE55KwuglD15NK2CwpCC3g
 qOo8k3vwTdSqAk8rQkBiWfueXNRfVyEYpwsy5CTp88rTFnEFrZG2thSRij7CW9CdSVwx8Rm
 gcc50HFCGmZLk7aiZnxGrhk/Luo9gJ6Z+M6KvqAJfNU/kNZ/+nNjyrVyoskxfr5kHCfVbVP
 JTAaPmsbIyiCHe3voBcrEQnbNjas7up7AQrLBZ53z/dBEzZS0WFY6N0mg4Wdjbvz63UGesr
 7awQi8X+twvOwKhaCo1EmR1ck3KtztSfZ+BTps01bnG1AjZXi5+LaKrClqrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784580032; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=lCLvRbAHrPlYXHkE86DNtpFaHEAL8XnsKtuQKxI5YcE=;
 b=AwnOwkOYIANqY4PnzTjJFCatSgCneVRpNqiV4fTd89fKIuu++rHCW+vj57xkug/DbRoE2
 XXCeFQsG1ZhpXVQF/LiYRIetEEKnCnC3SLe47vv4wRjLp4RaMh/ptAwOAJILtFh2SR15ti/
 U0PsScaEJXlQFvPWCyV95szWckVlqkD8Ip869nODhMtDnEBEpSZ35nfuLlJm6g/kpKG5kL4
 +fzl6bS7PaT9RuFL0GoTkt8sYH/60dHuBbd7WOryyz/+fKN1Bxd4opoH0AStrAzFjFK37F+
 8Jhs9tXUzSgl1pkPkToD5QhNSwQ4VblESu9Yo0ZTkV2HdnAZzPdKxXeE2S1A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A6AA40408
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 20:40:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F422010E1B0
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 20:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784580954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=lCLvRbAHrPlYXHkE86DNtpFaHEAL8XnsKtuQKxI5YcE=;
	b=JtxoQhaZekKujSmABG9n1sUC1/Da93AlorzaTp9rqh/gyNQwjhNH8AUFrsuH+v87X/EHv0
	bzErfgHa6Uq+do6u5huMNvT9ebWA3B/pi1Dz3wnt5tL+7Abctu6c/3z9OpCTahcPHDU1XI
	rnNrFWCMeid7e/Pe7wyuEWKKFplzp5g=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-611-vIWM6IfIOYGM-CXIYFmv-A-1; Mon,
 20 Jul 2026 16:55:51 -0400
X-MC-Unique: vIWM6IfIOYGM-CXIYFmv-A-1
X-Mimecast-MFC-AGG-ID: vIWM6IfIOYGM-CXIYFmv-A_1784580949
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 953BD180061F;
	Mon, 20 Jul 2026 20:55:48 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 337EE1955F7A;
	Mon, 20 Jul 2026 20:55:46 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] drm/nouveau: Fix WARN_ON() from missing blend modes
Date: Mon, 20 Jul 2026 16:43:54 -0400
Message-ID: <20260720205541.257781-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: dAlhusuiiHxhN7ovt4wmD7XBbQarQo60P6bsDr1Dqq0_1784580949
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: WTYROI5EPKLTTWDB2HH7NQOV2QPZQLP3
X-Message-ID-Hash: WTYROI5EPKLTTWDB2HH7NQOV2QPZQLP3
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WTYROI5EPKLTTWDB2HH7NQOV2QPZQLP3/>
Archived-At: 
 <https://lore.freedesktop.org/20260720205541.257781-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Recently a change went into the kernel to ensure that drivers which
expose color formats which have alpha channels. This would cause nouveau
to hit a WARN_ON when setting up cursors, since they do support blending
- but we never bothered trying to hook up the controls for it to
nouveau.

This fixes the issue by ensuring that nouveau always exposes a blend
mode for any planes with alpha channels, regardless of whether or not we
have control of the blend mode hooked up. If someone wants to add
control for this in the future as well, it should be fairly easy to hook
up with this.

Previous version:
	https://patchwork.freedesktop.org/patch/741031/

Lyude Paul (3):
  drm/nouveau/kms/nv50-: Add .blend_modes to nv50_wndw_func
  drm/nouveau/kms/nv50-: Introduce nv50_wndw_default_state()
  drm/nouveau/kms/nv50-: Unconditionally create blend_mode prop for
    wndws

 drivers/gpu/drm/nouveau/dispnv50/curs507a.c |  3 ++
 drivers/gpu/drm/nouveau/dispnv50/disp.c     |  4 +++
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     | 40 +++++++++++++++++----
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     | 11 ++++++
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c |  1 +
 8 files changed, 55 insertions(+), 7 deletions(-)


base-commit: b0a652436b892eb9a036a031b33099dca036faaa
-- 
2.55.0

