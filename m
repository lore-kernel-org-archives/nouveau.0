Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 306E1CDE00E
	for <nouveau@archiver.kernel.org>; Thu, 25 Jun 2026 23:15:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0FF210F3C5;
	Thu, 25 Jun 2026 23:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="DEDgME9c";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DB72346CDA;
	Thu, 25 Jun 2026 23:01:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782428484;
 b=Upbz9xnWf9tb7DhiiGnwvnUBBZ54xaMGW7zLSZEfcAx4tBS7XK0506uSOqVMTTdP/xIj7
 46DXlvkT7wjAssZQqmiuMc3anVDNunOARcDk8JIMIJrVV+ZKLVanA6gFHSFMGyM+KwG8NDa
 /nXUQo+vV88NFsbKreeeIiMe5dT+HF3h0KxX56yWJifd7X5F3x9DtH60VN9H6QNXZZt0NNA
 P6gWo5bnR/ZtBhCh5SL+tGih7PQmhziyMub7q8LjGr2QSA7iWRSdTky32EAy4SRBtn526Z2
 6GcYQYT24QW1f4K7Y6xKK33cMkSFBQAxpt13yKiS7KAhYLFobaK5po79UM6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782428484; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IQJuwmjCMriVgu9tnR+e4ZlOFzJ/2hWV605ZycK4pno=;
 b=ydHB3/DszDEEz2kmRgOl6BqOkyEWnP05Ruxfsbv1uoNIh/VvY3ZWqyvgiLQoHZDWciULC
 Qd5s6YvNqSNnyjKhlccBzEpFKSXZl7mWjwjJ8KsSrs2VeoB2ckwposh0u/RB+SEAHUFjEvD
 JCIiLB8b5HzpusUcWSjqpPQtpJg9GxlPBU0swWAJLJNidX+V+zjEsLzKnPik1UlXhPF7PRd
 c/3nXpsdObF63D7h2tjseidhX2hfgDIo7lLPRhhtqQFEnGZvnuwVVZXCe3aZLtkjOxdetbj
 Kz5kirVarungBaYbZWrbYOQuY1d0CGAEDUjJmpjKWLGcTdRo7EHiH4a1wvtQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0DFFA4684D
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 23:01:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 938D510E167
	for <nouveau@lists.freedesktop.org>; Thu, 25 Jun 2026 23:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782429352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IQJuwmjCMriVgu9tnR+e4ZlOFzJ/2hWV605ZycK4pno=;
	b=DEDgME9ctxv6Q4X3pKXVEup09D6fIt50dT5EWk4NmPICx+TEwggvA2xbt4YAZwPdSg53Pc
	TPtu2vsG9EQp7emhldd+qdpVdf6LYe18+mrIO8OUVkk8agVUrAJoHzheH0Rccuy12sIMgE
	fCxvcuRlQH6OHKUjdnyhFSBnflTV3Do=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-17-YoWaABW5NdKysRV71eYB-w-1; Thu,
 25 Jun 2026 19:15:50 -0400
X-MC-Unique: YoWaABW5NdKysRV71eYB-w-1
X-Mimecast-MFC-AGG-ID: YoWaABW5NdKysRV71eYB-w_1782429348
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 4933D1955F44;
	Thu, 25 Jun 2026 23:15:48 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.18])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 989A536918;
	Thu, 25 Jun 2026 23:15:45 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] drm/nouveau: Fix runtime suspend on R570
Date: Thu, 25 Jun 2026 19:10:53 -0400
Message-ID: <20260625231252.89684-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: 2xXuaublg3nEqsbQ8PaOSwk-6J3VccOlD7M-EvElQ14_1782429348
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: SPN33OD6VTPDYK3WWQDTRBQO3GJ67MDS
X-Message-ID-Hash: SPN33OD6VTPDYK3WWQDTRBQO3GJ67MDS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SPN33OD6VTPDYK3WWQDTRBQO3GJ67MDS/>
Archived-At: 
 <https://lore.freedesktop.org/20260625231252.89684-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turns out our last attempt at fixing suspend/resume was not entirely
correct, only partially correct. This reverts the partial fix, while
leaving the piping of suspend/runtime suspend/etc. that we did in
preparation for this originally, since I have a strong feeling it will
come in use again in the future.

Lyude Paul (2):
  Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
  drm/nouveau/gsp/r570: Never enter Gcoff state

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 2 +-
 4 files changed, 7 insertions(+), 7 deletions(-)

-- 
2.54.0

