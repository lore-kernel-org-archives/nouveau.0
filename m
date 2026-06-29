Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0187EC43458
	for <nouveau@archiver.kernel.org>; Mon, 29 Jun 2026 22:44:32 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 613BB10EA78;
	Mon, 29 Jun 2026 22:44:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JkL2oi+3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A69C446D9E;
	Mon, 29 Jun 2026 22:29:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782772190;
 b=fvBhUelYobdArLQjHDmMhF5MUEJ0OKLZpBE9n404jtN4E7aO42njVEdiLusvWz3S2i/kv
 j/osQWV0XKvguy6dLZQ02T3OIfqgJZrx2yUbjXgbh7bCbqjaG9Lf/47sNiGLtrUk5KLEtxb
 SsHiD6Ij7F+EoZu3p9ZSPbUeax2IrSDuSy1vb0v1rTnjsJu08dwMkIFYniUNdZSiEOhl0tI
 PJzMGlNnvzfikr+QfzTAi8SGJZw/fRBJtUpvlBtW8r8diTgB6INovMkcL0wJBbqKJ/Yqh4c
 lbMk57x07yuRdVc20bctDcRmhrAC/+8nPuBzWQUsy37d+cLDYWUykAsth4tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782772190; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ev+eZIVZSyaCdYull75busCd4hGRRpJg1XtF6MPERrI=;
 b=zHUaJwWkcQ45esLU3CtKrvj5Vsq7t+xEhmPCeyiFg4NIXPA0Q1i7+WgLetN6gNyhzHzGP
 1fSxKGYnm/nTlzvpz/9P1prznAb9S4+T7VXNVnUYjMMWUnLZ58Cts7ACl2pOMwJ9kY+J/h4
 qb0heGWfmzayIHV5acnlrz6vskiRFDXjnzHI3tERo5K0Yu3r1EUJuOJI89pHkyXBE3F1zAf
 iWqmR834lEuevOG/56MMGD6X5t9d/nwkceKhYXw6xhssQpq9RzHab6v3lFHE2kCFLQqiaCm
 cqdkoMP6UHKG3W8/oU24nw3Z9/nQ09PAjUgrhzyrjd2EffOpMCet5W9ISqPw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EDFB346D51
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 22:29:46 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E0B910E13B
	for <nouveau@lists.freedesktop.org>; Mon, 29 Jun 2026 22:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782773066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ev+eZIVZSyaCdYull75busCd4hGRRpJg1XtF6MPERrI=;
	b=JkL2oi+3HnxE17SltniMKaKxUua/D41RxtfNptcJ/ByJegMaaKubtWc3uRw3CJAIxxd818
	RYT5DnwY/5kN1wfIcMKo7f862h6RVghfcCbcLoYXcF+FudsTCJp3XlSiZ5pURxdJuvM5gB
	4Fm+191OfKMxRjCfQVeLB6SiN03207c=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-npEv8sj_NhquFKVgPVF8VQ-1; Mon,
 29 Jun 2026 18:44:22 -0400
X-MC-Unique: npEv8sj_NhquFKVgPVF8VQ-1
X-Mimecast-MFC-AGG-ID: npEv8sj_NhquFKVgPVF8VQ_1782773060
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id C15B319775F9;
	Mon, 29 Jun 2026 22:44:19 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.88.59])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 53A573691B;
	Mon, 29 Jun 2026 22:44:17 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/nouveau/gsp/r570: Fix runtime PM
Date: Mon, 29 Jun 2026 18:42:32 -0400
Message-ID: <20260629224350.2870201-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: O9jhSOGDNAC5YKcz9JdCbY32wT47J4hLhcyIoSu80W8_1782773060
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 5LVCIC3THJ27WQLGSPCCHKPM6VJPDVIW
X-Message-ID-Hash: 5LVCIC3THJ27WQLGSPCCHKPM6VJPDVIW
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5LVCIC3THJ27WQLGSPCCHKPM6VJPDVIW/>
Archived-At: 
 <https://lore.freedesktop.org/20260629224350.2870201-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Runtime PM has been kind of unreliable with GSP for a while. It works
well enough to shut the GPU off and turn it back on, but more often then
not it ends up leaving the GPU in a broken state on resume - which makes
it impossible to really do anything else with it.

Recently however, I discovered that it's been failing much harder on
some ampere systems. This lead me down a rabbit hole that lead me to
figure out one of our previous fixes for runtime PM wasn't correct.
After fixing that and combining it with some fixes we had tried in the
past without success, I finally managed to get nouveau to handle runtime
PM with the GSP perfectly. These are those fixes.

Tested on a Lenovo P16 G1 (100 runtime PM cycles!), and RTX4000.

Lyude Paul (4):
  Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
  drm/nouveau/gsp/r570: Never enter Gcoff state
  drm/nouveau/gsp/r570: Set oldLevel correctly in GSP resume arguments
  drm/nouveau/gsp/r570: Add missing state flags to GSP resume arguments

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c |  8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c  |  5 +++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h | 10 +++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        |  2 +-
 6 files changed, 19 insertions(+), 10 deletions(-)


base-commit: 8fca3d8dbebf8d960dad7b10db3cb4a61139454b
-- 
2.54.0

