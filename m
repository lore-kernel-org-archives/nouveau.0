Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CBB8CD4F54
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:29:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E91CC10F5D4;
	Thu, 28 May 2026 19:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FGAIB3Is";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 787F14660B;
	Thu, 28 May 2026 19:15:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779995737;
 b=Jr7oYIxPHGDriE+2KZapPHSwJQ37LvEQvApTBBVG9FVWcrFE3A50Qdf3GVQuW8Dl2v5oq
 aa5YyYW8ayQUmqPGlpk7JDbSgzc5IfvVKSjvBB+dEZxnucQkv2QqCTQBh7eXG1FnqbkWLf5
 qCRrej9D/E456MYKufUcKSEi2rTRnsVLw8oW8WnOK6pEAu9AK91/rXtdHyjyEVxoUnsPiQF
 0DVk6lSf4PdkLtWaDJ7WYASYWySKn3fE9i0vEDkWioTz7jHfT2MXvCg6fWbQpv4NhDAChnR
 oIyLu6Hl4ChshM1iEY1HUgVQrlGvsSFZhMYrogvi/+VxKvIJmces9Q7tS4BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779995737; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=un0qT9UfflvdsJEC1BMIIMI+/6gVV+1+FOlpjGHGdnQ=;
 b=EaNXkriyE/ta7ZtoHMMNSN2etoaAa028EqzZ8GZaT6sDrFsSzWmcTibKhm/+y0MJzhBf9
 kqX0GEywdhh7e/7bdDi8pIiFdUgBgwNE5ChE53Iq4po6S9+Wpcd8DmjApeHkq1hSvqBKARL
 40ma9IYFLDfgT+v0q6Hr89XFvrRWeBwulVv5QTr4zacYwVaJMQPMHPqg2O1qKiVNs5QLQ+h
 rQbOH/govaHlNDnMeM7fZ4ozYDrgVRRmp0vSTtSb0WZ4cBpgvHPH97ZdvXnBmYNRQ4MGDlS
 QVQS4qIR805C8qlane01/bIsBZXvRYYSQnzN8YzvN+dtoCE2VZemAPQS0QIg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 14210401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:15:34 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 24D1910F5CF
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779996542;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=un0qT9UfflvdsJEC1BMIIMI+/6gVV+1+FOlpjGHGdnQ=;
	b=FGAIB3IsOvgZmH3djazdeIG5PP3s6cJI6cIIjSrHOQB1PMGn60UidaNwk0kOQMX7ZPrdr5
	zag+WEIBWJnwQGaGIyvaeTi/w74nstMYLl/g/+b9gAiZa5NHbS1U1tm3zZn4poeX0tqYhM
	qgcGUKibOx/4KNyGjF0pjgfN+xLKsxQ=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-569-ZH_aRNPMMj-XE2tEH8i_UA-1; Thu,
 28 May 2026 15:28:58 -0400
X-MC-Unique: ZH_aRNPMMj-XE2tEH8i_UA-1
X-Mimecast-MFC-AGG-ID: ZH_aRNPMMj-XE2tEH8i_UA_1779996535
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id CD80F195609F;
	Thu, 28 May 2026 19:28:53 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.89.248])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 0ED2019560AD;
	Thu, 28 May 2026 19:28:50 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	Timur Tabi <ttabi@nvidia.com>,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Revert cleanups for IS_ERR_OR_NULL() usage
Date: Thu, 28 May 2026 15:27:14 -0400
Message-ID: <20260528192847.4077458-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: qOxKa95_6-mBgHzcrno4xZ67-kAkDFJbdBraclXV43E_1779996535
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2LYDD63VLFJ3IHQEIWF3S3I556ISWIPS
X-Message-ID-Hash: 2LYDD63VLFJ3IHQEIWF3S3I556ISWIPS
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Dave Airlie <airlied@redhat.com>, Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Danilo Krummrich <dakr@kernel.org>, Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2LYDD63VLFJ3IHQEIWF3S3I556ISWIPS/>
Archived-At: 
 <https://lore.freedesktop.org/20260528192847.4077458-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turns out there's many good reasons for this!

Lyude Paul (5):
  Revert "nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage"
  Revert "nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core implementation"
  Revert "nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)"
  Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd"
  Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc functions"

 drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h      |  8 ++++----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c    |  4 ++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c  |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c  | 10 +++++-----
 5 files changed, 13 insertions(+), 13 deletions(-)


base-commit: 61de054a772a1feda6364931ab1baf9038abf1c8
-- 
2.54.0

