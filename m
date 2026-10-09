Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37602CA601F
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 17:44:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B684D10EAD1;
	Fri,  9 Oct 2026 17:44:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tTgeXarX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5E83C489F9;
	Fri,  9 Oct 2026 17:26:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791566777;
 b=Lh1j/X39Txje3Vx6hy53CVeOJ84LLrLR3GTS8gwha0qHSrtQCkYW2+Vkzfbf15BkORLBI
 ENUldpPYcc+csKAI+mAZn2XY+yaLR38/k1MaP5jhuxU1CY5QBck70eMpXLCO2xmmi2fUyuz
 /C/OEtV+sS6EehPASOH+rIIMErlf24vwvJ2rbDg+Htb3ylpFqjxCvo0npBN4Bmv307v4qGH
 liWacLqZni/8tmGo4mloI2Vy3OP8PQp5PQwzpOmPScSGUImA7jgViVbAlLwoTHSUIQQ+Ps1
 TJztBvLeAtM68BwkwMrGabz2OD+4HYPVH62JuQ+YfKveWFj9S+QhXyvE5PsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791566777; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JGMtRXQTlT+f8b0o4cKGGjXkWHEK7BHt+wgqiRXS4eI=;
 b=A/5tlt/9Ou3G8pMcZs8vJXxfC8dPtYfHle9LdONeF2KcC0Bu9y2fOmJWowthyKWUpo0Aw
 2jya4qoctz9vpi5/on8SZJGkj4Pk+Hqnyqp8FQzgmxLhdJDMzg9Kr5MZYhnRxA/3xL6WP8c
 3fEs+QOWRvqwAs36UF2zFn2TVnBAG6S1Vk/j1iz4PSJcZ5+xOIm52GykXxEHg1p2lz7YI0b
 O4kZcjolFCYi5oaOcJCrmgD3U8ETABY+Z64pgrYTalYpBbJIJLzSo02xR+1mQoLlkgG9Lfi
 yi8/yV7QssfqXcT1XGAxurux4WctcxLHo2ohc0ckT/jZE7AbWcQumlp81s5g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8DE9B48299
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 17:26:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4F8410EAAC;
	Fri,  9 Oct 2026 17:44:39 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CC06A60DA8;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69CB4C2BCFC;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791567878;
	bh=r2YA53IFdz9R8dAyufsM4O4b1qL3eupzQscx+pvgrq0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tTgeXarXEXVhLJBDeAuSMuboeaaNYVSEn8V7azgFXhewdKb3SIFFdq35re1mt2p8E
	 zK5THZfN8d5pKgtt8znTDMowVC0tYukB+5c6MCEeYRO4dD+U9kFasmEbIZp1Vv7duY
	 1FxQKlxZ7iUKWFFT9TkDlSchkdqcN4N8WPC1fKM2fBjpmoRc/m1tOAzRH9WZX2SDFK
	 187OL1CpV3I4fDXIjQ8g89wuygUvlS/olt2R7dLsjC3Ti61e4UVyUTyAfiQEC5+vNp
	 FjKRuVPdnsYGCs2u3225fVNwg0VUoxgHCLIBjAptjxXW369wXti3pymnYjAvcAQ7Ih
	 e4w6az2vJL5Pw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C57CA601E;
	Fri,  9 Oct 2026 17:44:38 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 09 Oct 2026 11:44:25 -0600
Subject: [PATCH v2 2/3] nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791567877; l=2357;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=vxvOz2WI++74W2VmC+Sffut//FMTgYJwzgeJbmMeTys=;
 b=wcZjN7UcC+Gi/K96Qthxe1uoGWMeymDS7Onwsnnsj1th58miyJ58+jRDBgvQBprpXr+D6fVje
 9nvusXT0nXjCn42Cbpjj1QdvqXDPrS1TzEeoOtA5TMd2RgPyB2tkKaj
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Message-ID-Hash: FZSTJJVRFGJFU2EXOE7U5USUBOZWKNPK
X-Message-ID-Hash: FZSTJJVRFGJFU2EXOE7U5USUBOZWKNPK
X-MailFrom: devnull+jim.cromie.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Daniel Campos Ramos <Capitain_Jack@yahoo.com>,
 Jim Cromie <jim.cromie@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: jim.cromie@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FZSTJJVRFGJFU2EXOE7U5USUBOZWKNPK/>
Archived-At: 
 <https://lore.freedesktop.org/20261009-my-fixups-v2-2-839e2bbe514d@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Jim Cromie <jim.cromie@gmail.com>

When graphics engine firmware fails to load or initialization aborts
early, nvxx_gr(drm) returns NULL. Calling DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at offset
0xf0 without checking for NULL, triggering a kernel page fault.

Validate that gr is non-NULL before inspecting gr->has_zcull_info.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
Aug 14 09:21:52 frodo kernel: BUG: kernel NULL pointer dereference, address: 00000000000000f0
Aug 14 09:21:52 frodo kernel: #PF: error_code(0x0000) - not-present page
Aug 14 09:21:52 frodo kernel: Oops: Oops: 0000 [#1] SMP NOPTI
Aug 14 09:21:52 frodo kernel: RIP: 0010:nouveau_abi16_ioctl_get_zcull_info+0x17/0xa0 [nouveau]
Aug 14 09:21:52 frodo kernel: Code: 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 0f 1f 44 00 00 48 8b 47 40 48 8b 00 48 8b 80 70 02 00 00 <80> b8 f0 00 00 00 00 74 72 8b 90 c0 00 00 00 89 16 8b 90 c4 00 00
Aug 14 09:21:52 frodo kernel: Call Trace:
Aug 14 09:21:52 frodo kernel:  <TASK>
Aug 14 09:21:52 frodo kernel:  drm_ioctl_kernel+0xae/0x100
Aug 14 09:21:52 frodo kernel:  drm_ioctl+0x2e0/0x560
Aug 14 09:21:52 frodo kernel:  ? __pfx_nouveau_abi16_ioctl_get_zcull_info+0x10/0x10 [nouveau]
Aug 14 09:21:52 frodo kernel:  nouveau_drm_ioctl+0x58/0xc0 [nouveau]
Aug 14 09:21:52 frodo kernel:  __x64_sys_ioctl+0xb9/0x100
Aug 14 09:21:52 frodo kernel:  do_syscall_64+0xe2/0x560
Aug 14 09:21:52 frodo kernel:  entry_SYSCALL_64_after_hwframe+0x76/0x7e
Aug 14 09:21:52 frodo kernel:  </TASK>

Reviewed-by: Lyude Paul <lyude@redhat.com>
Tested-by: Daniel Campos Ramos <Capitain_Jack@yahoo.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 3f130cd4fbcd..c7ddc54a3c4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -358,7 +358,7 @@ nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
 	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_get_zcull_info *out = data;
 
-	if (gr->has_zcull_info) {
+	if (gr && gr->has_zcull_info) {
 		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
 
 		out->width_align_pixels = i->width_align_pixels;

-- 
2.56.0


