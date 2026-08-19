Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63665C5DF85
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 16:00:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C3DF10EE53;
	Wed, 19 Aug 2026 16:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Db5P/FPB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 030994796D;
	Wed, 19 Aug 2026 15:43:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787154210;
 b=kXUzbijlYp7ITzuORBZlaLL/SPEM3M8I4pYrrRHILSH6zAgcoEOhCHXv63MASCag/PCLb
 mV0M7wCo/80dgXhxe4KVScvFlyHSOW4GeGNTTbhi+WBholFoOdRNINBDpLcPdrHp2IUcXeB
 MYHrCo1PfDeLP2ah34Z3cFoZCN48hpJ0zYhHZpJXji04vU+Q1qkm5qmcVvIdGyFsFpaBxJ8
 Jqugx2vyadOl3rIsDWx+245IHfjyVQ2ttOcYS4aBQECfN7lgRGFNETsR5hZY8Age9BVJM7Q
 jc/MoDZvMJYjz+tFobfdAFFLAoHrjyB2IcEpNlFS5vHHbyE9uanYLXAZS6Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787154210; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3Iz/4jWyINOcI8ZACwTPuDHgHiq9U8jasCe3dns6TY8=;
 b=a/mSbVgmQHQ8M2ksWWVtCT2tPT/kVaEjowzrMpob1ajUOqiNm5fkR+bjh4NCJ7XruuFDF
 Taf+C6xXOfth5fio/enBKs7n2ZY/ghhVx/MfKv4M7YmXCWCeKVHbN0ehEYpU3x21ZSFwAKa
 g+oLxFzLSUtGyQ9dw+vMxQ7alDp5dIUm/xqEN7HdHjZhcA0aUOaJ+Mp8OBQN+D+Krc+geyS
 jKRdYsMbuL4e/g11UyD4SftzGDdwmnaY3F4QPBhhhFVH222y9ZgXHCeSvGr24oUqOSVc8UE
 goVeJcYil6oc0ony+R7WQMd5QmjNCXVhHjExuaHxgQFR2BvhDsmntS61bW0g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B0C28450AA
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 15:43:28 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92F3A10EE5E
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 16:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787155200;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3Iz/4jWyINOcI8ZACwTPuDHgHiq9U8jasCe3dns6TY8=;
	b=Db5P/FPBRwfWVL7C5QgKndVWF3ENkYiF+4DRarfzkV/FTvc7NJqaswpjB3jzdKLPQEl13M
	llSwFaCy08xGJcbkrvxiy402QxzCekwy0oGzOmHgCc2DDEovo6jnxIR0mBIhncxEAKWRiE
	ksGkQVenrLXWyXnr0O3TItBF4sAeumY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-641-axtJ9z8wNKiQactqz3rnBQ-1; Wed,
 19 Aug 2026 11:59:46 -0400
X-MC-Unique: axtJ9z8wNKiQactqz3rnBQ-1
X-Mimecast-MFC-AGG-ID: axtJ9z8wNKiQactqz3rnBQ_1787155182
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 189DD1955F1D;
	Wed, 19 Aug 2026 15:59:41 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.72])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DD8EE1800346;
	Wed, 19 Aug 2026 15:59:36 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Marek Czernohous <mczernohous@gmail.com>
Subject: [PATCH v2 0/6] Obliterate nouveau_encoder->crtc
Date: Wed, 19 Aug 2026 11:43:47 -0400
Message-ID: <20260819155934.154125-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: Oj5D-DPFSwge0sEFI8erOFxTPVj3igEvJ-PtLD_lS8k_1787155182
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: WVRWLKTUMKC35BPW5FIQ4Z2L5ACQRGSV
X-Message-ID-Hash: WVRWLKTUMKC35BPW5FIQ4Z2L5ACQRGSV
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>, Marek Czernohous <marek@czernohous.de>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WVRWLKTUMKC35BPW5FIQ4Z2L5ACQRGSV/>
Archived-At: 
 <https://lore.freedesktop.org/20260819155934.154125-1-lyude@redhat.com/>
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

Previous version of this patch series:

	https://patchwork.freedesktop.org/series/172417/

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

 drivers/gpu/drm/nouveau/dispnv50/disp.c   | 78 ++++++++++++++++-------
 drivers/gpu/drm/nouveau/nouveau_encoder.h |  4 +-
 2 files changed, 56 insertions(+), 26 deletions(-)


base-commit: 0e118b936dc5904cf0d9859882a40c96057b083d
-- 
2.55.0

