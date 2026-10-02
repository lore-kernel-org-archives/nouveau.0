Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF457CA5FDD
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 18:09:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F360C10E673;
	Fri,  2 Oct 2026 18:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FH6x0DJL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1251F488FA;
	Fri,  2 Oct 2026 17:51:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790963471;
 b=ANVDYOprn8WZ6jYmlAKUcb/xG7nfaOQmFrW3xF8jtOotELO4rzbwhsC4RGFndJwh3vOL3
 wALHBtp5e01gpCYtY6X4DvkiqMhPfd4Rtn0NTrxzXmISEFKo4+2u79YspzQwIRZVlueLoup
 huALTSgvpOr+XFEXnGHtcYgbdR07hDD8pjN0CzHrVz5hzZpfzo7FOIsFZ5t0X3LztpCEZPJ
 QwTdqsqCXqKstfdcj5BfV5fBIi73ssJk/a1w+rfzz1xslL72iUyvDpFHp3xEp16G6JT6PHB
 XyPXZv0nADrXeYkHIxVQZo1nPA838w6Vwcygn4xd2JL5mdHM/vNgUuZtZNmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790963471; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EITtSmZkOD9AOMRf3jxu3su3HfPboxCOI62ATET+K2Q=;
 b=E2SSJfuGukIWHiIjh0239PZk3L6y/JqYFDLeiZzyNGr+6w/Ht87FlYDdEpX1uCNTvEuDG
 EHXO3UYSNL8dq4cYE4tDNMzzrk7SAtBUjRPevxB4maTkkUL0WFUHC3vKyUdoWq2CxyBl86A
 UXH2iOkg7VZl7AY6Twc2pN1pLyhiCdgQKW7lrr0T1oxg7tYjYcId+4L/Rh7EidD9WCcOmNX
 5xydoZz40D2Qi6a1JrwwnPULgPN3c9Q/hQ0qNQRernLBoR81IwKeme75j2nRvcXIqmCkqnV
 l2vckCr3kBSpZR7yDI/t95JpMgNRUTIvzoJ8Zy8oujmRAAGquuAMlpgCuHxA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 27005488BF
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 17:51:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD91610E64B;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80AE4440BA;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5AAD7C4AF12;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790964560;
	bh=l1OzNkOrsT4f5QBYOcpWrv54bWAYIeRE0abj+dKKwBA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FH6x0DJLjZ2LgrZL7UKwW2tiMLbMO2JJxqmK9LYxUb1qgZcn2cI4A5au3NcD/TIpV
	 HMLgztaxU3u24+tlLnyvqBG+tuffWfR0QAs4crZ8cOQ/cRWjsFPrJyn+ywKSFDuESC
	 6Y2KzeAwJjR9+yCkP4fpCl9dnPRAmE2dofzRAyoiBA8Pf8LheXafRW9/oEdkJqUAja
	 /fn+6xJCTGO1d0B8vIGR96kPCJ6eMTiZ1u26It09iTqjzCsdQGWeAd4X+0BBeSdOZE
	 jHzurvSJnLJIAAPTy0DbG70IOBTnP12jT9YW9KlgPhICe35OePRNucAZysvWNoXkIj
	 lV4W7OaMpGW7A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36DB8CA5FD4;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Subject: [PATCH 0/3] nouveau: fix 3 null-ptr derefs
Date: Fri, 02 Oct 2026 12:09:11 -0600
Message-Id: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDAwMj3dxK3bTMitKCYl1jI5MUI9M046QUA1MloPqColSgDNis6NjaWgD
 ve9JlWwAAAA==
X-Change-ID: 20261002-my-fixups-324d25f3bd05
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790964559; l=908;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=l1OzNkOrsT4f5QBYOcpWrv54bWAYIeRE0abj+dKKwBA=;
 b=bXg0YQm+JVFbyAzzrzbNaZnEeFWLW14SND0qnTb+OO0T8mgIoGF83EMcWZVbPeVO4LtzhBBXM
 i9k/xEtCNBvA4mTBQOfIKjqqsxuQj6i1jUC56re/dmmCcj4oQxXrNOq
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Message-ID-Hash: AFYDSRNV2DIZPQFVCMCZ6Y524P43VMJ7
X-Message-ID-Hash: AFYDSRNV2DIZPQFVCMCZ6Y524P43VMJ7
X-MailFrom: devnull+jim.cromie.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Jim Cromie <jim.cromie@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: jim.cromie@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AFYDSRNV2DIZPQFVCMCZ6Y524P43VMJ7/>
Archived-At: 
 <https://lore.freedesktop.org/20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

These 3 patches fix NULL ptr derefs I hit while booting kernels with
unrelated work (dynamic-debug) on a 2019 amdgpu+noueau laptop.  One of
them is possibly hard to reproduce, the others are "dependable".

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Jim Cromie (3):
      drm/nouveau: Fix NULL pointer dereferences in GETPARAM ioctl
      drm/nouveau: Fix NULL pointer dereference in GET_ZCULL_INFO ioctl
      drm/nouveau/gsp: Fix NULL dereference in nvkm_gsp_gcx_ready()

 drivers/gpu/drm/nouveau/nouveau_abi16.c           | 27 ++++++++++++++++++-----
 drivers/gpu/drm/nouveau/nvkm/engine/device/user.c |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c    |  2 +-
 3 files changed, 24 insertions(+), 7 deletions(-)
---
base-commit: 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e
change-id: 20261002-my-fixups-324d25f3bd05

Best regards,
-- 
Jim Cromie <jim.cromie@gmail.com>


