Return-Path: <SRS0=i17k=IP=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F250C433E0
	for <nouveau@archiver.kernel.org>; Wed, 17 Mar 2021 23:01:58 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A0F764D9F
	for <nouveau@archiver.kernel.org>; Wed, 17 Mar 2021 23:01:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A0F764D9F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E11336E05D;
	Wed, 17 Mar 2021 23:01:57 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 446B56E05D
 for <nouveau@lists.freedesktop.org>; Wed, 17 Mar 2021 23:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616022116;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=zvK3quNDB9BH9ZKDxJ8CDcwA/1Nv2URIXURU9nMd888=;
 b=XRa/jPLXXrjUE+3QCW/3JIvRzzng8++VIBX9db/bJWcbTa9j0SHzHoK/8dDHTktpmCYkbJ
 cIA8cqjSVUShAgp0kcIxNlxWzdlCFJl4N6Txou8RfK3QVdc0HJQYzEbSHgQ76Bp4/TuUjz
 dy0cVtE4LLpm4Gw3JDM0AYMXXp7Kve8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-535-q__wXVwLNLSY4lsKszUbVA-1; Wed, 17 Mar 2021 19:01:52 -0400
X-MC-Unique: q__wXVwLNLSY4lsKszUbVA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 14F2481746B;
 Wed, 17 Mar 2021 23:01:51 +0000 (UTC)
Received: from Whitewolf.lyude.net (ovpn-119-60.rdu2.redhat.com [10.10.119.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 92D4C610F0;
 Wed, 17 Mar 2021 23:01:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Wed, 17 Mar 2021 19:01:44 -0400
Message-Id: <20210317230146.504182-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: [Nouveau] [PATCH 0/2] drm/nouveau: LUT fixes from igt
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Some fixes for how we handle LUTs in nouveau that I came up with while
working on getting the kms_color igt tests working in nouveau.

Cc: Martin Peres <martin.peres@free.fr>
Cc: Jeremy Cline <jcline@redhat.com>

Lyude Paul (2):
  drm/nouveau/kms/nv50-: Use NV_ATOMIC() in nv50_head_atomic_check_lut()
  drm/nouveau/kms/nv50-: Always validate LUTs in
    nv50_head_atomic_check_lut()

 drivers/gpu/drm/nouveau/dispnv50/base907c.c |  6 +---
 drivers/gpu/drm/nouveau/dispnv50/head.c     | 38 +++++++++++++++------
 drivers/gpu/drm/nouveau/dispnv50/head.h     |  2 ++
 drivers/gpu/drm/nouveau/dispnv50/head907d.c |  6 ++++
 drivers/gpu/drm/nouveau/dispnv50/head917d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c |  1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c     |  5 +--
 drivers/gpu/drm/nouveau/dispnv50/wndw.h     |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c |  6 +---
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c |  7 ++--
 11 files changed, 47 insertions(+), 30 deletions(-)

-- 
2.29.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
