Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0992C5B572
	for <nouveau@archiver.kernel.org>; Thu, 13 Aug 2026 20:48:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0777510F538;
	Thu, 13 Aug 2026 20:48:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GUU5p0Ez";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8F6A04777C;
	Thu, 13 Aug 2026 20:31:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786653117;
 b=I9zASVt6nU7HyZ/tqxWtb5vn7y99jdsxoVpLYaKjvtuoT0OMk0qQNw71iVjyMFOn21xf8
 j3rafRuh1bTc53jgDi8uykD0WXVHa2yQhjxCJBZJPH9G5ljvdfHFfC9LJ12WGLR4OOIUVRN
 OffdPum/PK+s1CLy9W4ehaPYBb1pH56ChC9tRctyPuE0Kpc2MtUjE+MKqBYdRB65gibHMvo
 pldf8RfONRqqgBFzUhDapC99CetFm1U8WNEYRsf0xza7W4liwuGZOgzDV9+r+fbVJLwaXv1
 xazLuq3gCzgg+WEzvH7FXLOFX4yErMxdB/1tz/Udm4D4T8Auq0KAMExfFd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786653117; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kDuuOkCH2fbUW8QPsk+U/L/tBxogc365sCLb1ANoKiQ=;
 b=dyKhFSNP0B1VQKLN4OzBMLuelWsUS0xkxEf2z1E/kCJzumzqMJU2wV1NBdXCtzoSH/K7C
 RFVKJjphqqizB+FkyD0J41jBFtQB+dOunnksoGfVJYrtcs4YBVxMjnqUy/ANaaKgoBBiFMn
 shIUImdnbwxPgZH++0l4Dj0koR4bwITNJog41Pf43zV3c+n8EtJttPQk2G92+OBA7llWOKd
 uGzrrow0v2kJBp2gkDKlj7FaYMF46nyTy+2STv4C0ljUyLmeUTZR+SnZpOGj5Beqzt1GP/i
 pZJcZI7DhMMUzKrQux9ta0DriMBstW/6aZ+oV/+VnlyyuqY1OCrLGDl/o9bg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 94299476ED
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:31:54 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9557A10F52F
	for <nouveau@lists.freedesktop.org>; Thu, 13 Aug 2026 20:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786654093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=kDuuOkCH2fbUW8QPsk+U/L/tBxogc365sCLb1ANoKiQ=;
	b=GUU5p0EzX8Bck+D2ExkuehuTb1s41/IDLszc+04Hkmr+uyDyC3JPpxz8AttZSkIwIWTeBG
	g0ec2UWxLTExXVwWjRxmHx9GSCtSOe76zoEUXIsRc+ae2ClHJdcDg7iYRcsHPQwkd+ud16
	S9vVkdGssVBBSmfCMnPpXZpG1HRTusY=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-158-YeC5sBgxPx64q1wyXftKoA-1; Thu,
 13 Aug 2026 16:48:10 -0400
X-MC-Unique: YeC5sBgxPx64q1wyXftKoA-1
X-Mimecast-MFC-AGG-ID: YeC5sBgxPx64q1wyXftKoA_1786654088
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 397D3180028A;
	Thu, 13 Aug 2026 20:48:08 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.207])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id B04EF422;
	Thu, 13 Aug 2026 20:48:06 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	nouveau@lists.freedesktop.org
Subject: [PATCH RESEND v7 0/5] drm/nouveau: Enable atomic modesetting by
 default
Date: Thu, 13 Aug 2026 16:46:46 -0400
Message-ID: <20260813204803.2097176-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: bgfyVjQwExNBdJUhYk88gIqoQ6d11yDScuC-XYp0xOc_1786654088
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: QJCDQ3UR447PUGPPZ6B7SZIOPFASNEVC
X-Message-ID-Hash: QJCDQ3UR447PUGPPZ6B7SZIOPFASNEVC
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QJCDQ3UR447PUGPPZ6B7SZIOPFASNEVC/>
Archived-At: 
 <https://lore.freedesktop.org/20260813204803.2097176-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nouveau is one of the very few modern hardware drivers in the kernel that
doesn't have atomic modesetting enabled by default, in part because when it
was originally written by Ben there wasn't much in the way of good atomic
modesetting clients to actually test things out with.

Nowadays however, atomic modesetting is very much the norm - and support in
userspace for non-atomic drivers is starting to bitrot a bit - leading to
its own set of issues. At the same time, many of those issues are fixed by
just turning on atomic in nouveau. Plus, I've been running nouveau with
atomic modesetting on by default for most of the machines I work on, and
I've already fixed quite a number of issues to the point where things seem
quite stable (excluding a single screen flashing bug on my desktop, which I
am not particularly convinced has anything to do with atomic modesetting).

This patch series enables atomic modesetting by default, at least for
NV50 and newer. NV04 is left unchanged, as atomic modesetting was never
implemented for it. This series also enforces leaving atomic modesetting
disabled on <NV50, and adds the value of nouveau.atomic to our kernel
debug output.

Previous version of this patch series:
	https://patchwork.freedesktop.org/series/171310/

(Resent, because of a formatting error on one of the patches)

Lyude Paul (5):
  drm/nouveau: Fix cleanup bug in nouveau_drm_device_new()
  drm/nouveau: Print the nouveau.atomic parameter in
    nouveau_display_options()
  drm/nouveau: Fix drm_driver struct/nouveau.atomic parameter handling
  drm/nouveau/kms: Only allow enabling atomic modesetting on nv50+
  drm/nouveau/kms/nv50-: Enable atomic modesetting by default

 drivers/gpu/drm/nouveau/nouveau_drm.c | 116 ++++++++++++++++----------
 1 file changed, 71 insertions(+), 45 deletions(-)


base-commit: 9b388fc3d0e63a4f5b022d326151e176e8d82e25
-- 
2.55.0

