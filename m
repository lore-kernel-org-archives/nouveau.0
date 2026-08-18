Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C53FC5DF81
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 23:56:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 28C5E10E8E0;
	Tue, 18 Aug 2026 23:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="P+ZgkIVn";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6DDA247924;
	Tue, 18 Aug 2026 23:40:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787096422;
 b=ptP6xJOgVhz/Ugl5oxX3cjP4VxkzDshk5VAlVY6sQiHs8kcoc/H85iFRc9kYmxT3VeLVL
 wdAOKuZSfKu9aF6/4vFP+hMz8Lu5meOTc70V48u/kA53Mt7DpyabI2rN65IZX8wFj5ZEAVN
 CcZiMY9v2Rg2iAruyTJgDZXnU/VwFvikP/ijyZVMLoJeJQidhgRFR4cWIIowlX4y29LTvxE
 HmtnGfDlCkE3feb+wUYsIoCoWfsA9UTpHHrJOYkZASoyzk1KQXlLB/X0ux2i8ZhXIdAOef5
 ACXEcxrzbn5+S6eaQkciaiLPmM85QAhVVLnu6A9qiUkg8F0v2nq7fyJrcPkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787096422; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EBdI45sl5vzkzgSUGZ8nG97oSK40+7Mn/qyNVVY6zbs=;
 b=IcY2Dc4r4VeEastHnHyQDwC3uxl7nj6ssCAA5GAAYLErd+i3EueKJtQBaQcv6Jm6JzeaQ
 VCiM7Ol8aRC7/zc1pEQZiwGSyQ1KBy3bOKSqVtcgnVzZE/om0Fzoi3IyiyupeW70S4zj1gv
 q7BRYEbYuN+4CaWrdX7C39SRttgr3S3yF/11Lb3YbV3nEUuPFSZexLXieNbJhrFtmnTjDF9
 2nxb0EXPBz2PaF/rVKm17AqTY0h1hBZN65h3lxHMbHyfuH1MFXf+w5cxXgzRocnST+zJ96i
 iOmoE3DVbJphV6HX+NCCiut2wG0dom3zLbWZQ3c5C92NlzemSoqZu1pZ73UA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 552FD43E5F
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:40:19 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9AC110E089
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787097409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EBdI45sl5vzkzgSUGZ8nG97oSK40+7Mn/qyNVVY6zbs=;
	b=P+ZgkIVnjX4Br1qdFaRBhWvoN5AZdpSo7gosyQvk8j5u//DXTookyyQs+quYRJ+seTSFqn
	kZ5rN53tACLgnKafvD+PVge38HkcFeQatT8lCUKBpk3i7H/3Bqi2zwXqLhAGz5wbcFHaom
	YHp9goCPrUwTFdhzJ0Cc4WRa4zxwF+Q=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-76-u_5p8ACBOiiltTiNlBIbAg-1; Tue,
 18 Aug 2026 19:56:46 -0400
X-MC-Unique: u_5p8ACBOiiltTiNlBIbAg-1
X-Mimecast-MFC-AGG-ID: u_5p8ACBOiiltTiNlBIbAg_1787097404
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A2B218007EA;
	Tue, 18 Aug 2026 23:56:43 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.80.100])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id AA2F4180049F;
	Tue, 18 Aug 2026 23:56:39 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH 0/6] drm/nouveau/kms/nv50-: Obliterate nv_encoder->crtc
Date: Tue, 18 Aug 2026 19:48:42 -0400
Message-ID: <20260818235637.1738055-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: gCxBJxU87nsMjdQtNQXbGVDRdi7WMQ_K3FxbI5AMqzw_1787097404
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SXWFUOSGQZU7U2S6MXFF2HP27ZOOTVWB
X-Message-ID-Hash: SXWFUOSGQZU7U2S6MXFF2HP27ZOOTVWB
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>, Marek Czernohous <marek@czernohous.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SXWFUOSGQZU7U2S6MXFF2HP27ZOOTVWB/>
Archived-At: 
 <https://lore.freedesktop.org/20260818235637.1738055-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is mostly a leftover artifact from the pre-atomic days, and while
we've been using it for a while now - it isn't great. Mostly because having
redundant state tracking for things atomic already keeps track of is pretty
much always error prone, as anyone working on nouveau who isn't already
very well versed in atomic modesetting isn't going to realize this isn't
the right way to see what CRTC is assigned to an encoder.

Also - this patch series does fix an actual bug (patches 1-3).

Lyude Paul (6):
  drm/nouveau/kms/nv50-: Move DPCD backlight disable into its own
    function
  drm/nouveau/kms/nv50-: Add nv50_outp_get_old_crtc()
  drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc in
    nv50_sor_atomic_disable()
  drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc in
    nv50_disp_atomic_commit_core()
  drm/nouveau/kms/nv50-: Add nouveau_encoder->audio.crtc
  drm/nouveau/kms/nv50-: Obliterate nouveau_encoder->crtc

 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 83 ++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  4 +-
 2 files changed, 60 insertions(+), 27 deletions(-)


base-commit: 0e118b936dc5904cf0d9859882a40c96057b083d
-- 
2.55.0

