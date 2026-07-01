Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50020C43458
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 18:29:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F056010F0B6;
	Wed,  1 Jul 2026 18:29:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="U7TGDtTT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 335A646E19;
	Wed,  1 Jul 2026 18:14:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782929665;
 b=kqvfFgVzPbfsgA/g6y7nHShEUFhgiflf5dPJ+v7uuBHaCq4JYChhgp+cfjqMGojqrbiRD
 2IxTBYBLflxZXgRvd+ulysWnavByxDZH9pSuJkxoS7NT5ZAkxxH7pvu+xXXJR84gi5kSXeY
 yTwZf+/1i/183hhurVcJcO0dpqpB6AcpJlZMTE4445kv2RtiJL3wEVQcr8bavu+kUGQa7eg
 vFiFn9KFb9Y3eCVtydGa1dnaw7k++tyQhbTwvzeP0II9fxGIGjRx5TFzFmKuXxM861GVCLQ
 ZVemw123R6zQFUMX01xs+rGUXOSpE3jFUd++ALKSAvHIuPZ33z18tYW5kA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782929665; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=a7e1k4RF0Xm/tkfPnX0cO2BLntyNgnQLBQqB6vQqdO0=;
 b=hqAScB/O9A3HtJ8xiSqgOsGg0EHrah2xEQ4+FS02uCGews32ObLM+Q5tWZNsEj67wKuiO
 b28t/fdgZan+vuq8r6UK61MIrCklgJTa6LfcfZDOnjY6e/0ZfGEY3cfrwxokB2bfdX/uJpe
 cZlVfPN+Vi9uD4yAjfqNOFL+bVv2mrK51LLbvDjARtj82UtKgCq1YNZjQTM0dC9nhvFRm3/
 pdKHc4uVlnAywh5yv69t8slL0IboJ5hg81kaRzRecmVC8v3P0CpSCqDuCZUBfvKN9x4cjpb
 zVON4c1It+6sc6rxUfdY0MXSGzhwnnsNkB+ZMya/xNU3mgVwD1mmuxd1i4ZQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 954C946DEE
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:14:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0267510F0AC
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 18:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1782930545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=a7e1k4RF0Xm/tkfPnX0cO2BLntyNgnQLBQqB6vQqdO0=;
	b=U7TGDtTTrhDqIUSgS0BkCkkB40+JrI6gHme2IjE1uyBaDpPOiFt+VhmC8AbZ3notEaRDwc
	EiNJgSHbLqI0cvW4Lb9ERVOJpQoI0tti+JZ2Ud/evsjl4H+IT09ervjVVwylzvv/fIIZV4
	o8iPtwCFC7fHHK0B82KHdH2UwKWSFjw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-352-ZdBUyLAoMcSrEgAVTtFZ_Q-1; Wed,
 01 Jul 2026 14:29:03 -0400
X-MC-Unique: ZdBUyLAoMcSrEgAVTtFZ_Q-1
X-Mimecast-MFC-AGG-ID: ZdBUyLAoMcSrEgAVTtFZ_Q_1782930541
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 63CCE193336E;
	Wed,  1 Jul 2026 18:29:01 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.89.127])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 2E1B01800592;
	Wed,  1 Jul 2026 18:28:58 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/3] drm/nouveau/gsp/r570: Fix runtime PM
Date: Wed,  1 Jul 2026 14:17:32 -0400
Message-ID: <20260701182857.190713-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: gI4sHr8c8GQEZ4_0B3S1JUG4ynw8rJNQKQrOI8m302U_1782930541
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: PDEDLACN2TRH7MABB7JW6EU7T2OU4CJH
X-Message-ID-Hash: PDEDLACN2TRH7MABB7JW6EU7T2OU4CJH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PDEDLACN2TRH7MABB7JW6EU7T2OU4CJH/>
Archived-At: 
 <https://lore.freedesktop.org/20260701182857.190713-1-lyude@redhat.com/>
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

Patch-series wide changes since V2:
* Drop the patch for switching oldLevel from LEVEL_3 to LEVEL_4. If I'm
  understanding OpenRM correctly, LEVEL_3 corresponds to PCI D3 power
  state and is intended for use on systems with ACPI. To be clear, I
  mean ACPI support generally - it doesn't appear to specifically refer to
  laptop-specific ACPI handles like _DSM or the like.

  In an unexpected twist, it appears LEVEL_4 actually corresponds to APM
  (as in "Advanced Power Management", e.g. pre-ACPI)! After re-testing
  my local setups I wasn't able to find any significant behavior
  difference between LEVEL_3 and LEVEL_4, so let's be conservative and
  leave this be for now.

  It still may be worth looking into the future why I've seen OpenRM
  specifically call-out APM suspend being requested in debug builds
  instead of S3. I wouldn't expect APM to actually work with modern
  Nvidia hardware, but it's always possible there's some other reason
  they still use this

Tested on a Lenovo P16 G1 (100 runtime PM cycles!), and RTX4000.

Previous version of the patch series:

  https://patchwork.freedesktop.org/series/169457/

Lyude Paul (3):
  Revert "nouveau/gsp: fix suspend/resume regression on r570 firmware"
  drm/nouveau/gsp/r570: Never enter Gcoff state
  drm/nouveau/gsp/r570: Add missing state flags to GSP resume arguments

 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c     | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/fbsr.c    | 8 ++++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/gsp.c     | 3 ++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r570/nvrm/gsp.h    | 8 ++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h           | 2 +-
 6 files changed, 17 insertions(+), 8 deletions(-)


base-commit: cff96362794a5c1f3adb013b4a46c7233149a629
-- 
2.54.0

