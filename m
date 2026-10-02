Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26856CA5FE5
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 18:09:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 91C3510F975;
	Fri,  2 Oct 2026 18:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JW1KR6lw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A48ED488F8;
	Fri,  2 Oct 2026 17:51:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790963473;
 b=sJI2cB8LlnfFK2C/ZAfYVZ2RekbK8fUqmgsCZUapUPsGQ2UrzaapURqra1xQn4dPIiyTH
 MmGL6wDBgImabQzucmd1qlLpGVOr7iYnQfez12n5EFuSIdStOz7armwHorsVu5KYxpbdyTj
 jGj0ST5w0c298/drQPjKIGwTuFHVq0ANntNtuarzxCxQgecH/Pt8OF6ICG+adwGtCwN5zkr
 lcyrdHXQjT6DSIY850Ahw7lMvGQDChtGUngHLfdXxsDHzJbcycRuplFOhEiQfM7P3VJmMoz
 ZMbxYlLAF1t4o992Y8CPCV6nWqopaS54/BIiQFOpvU5yzPoeZ7On/TJd6ePQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790963473; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pgY5+GlNY/GS7kyyprN78FypnDJIgG4SMLW4P6avIpY=;
 b=IzC+9n4aO7EnnAbQQOeyNkIJktL/c2OZiv+dAmC79gB/qvHWqfqtpzQhysV6ZsH88WO82
 UAjRb2eLYYUKkfiPrBXtDSbUpAqQUD1Q9CLurq+hAh20EVy51BHYIbmv0jLDbuGZlrytU2I
 sGEleG6hWeG75JOTnipwbWsfFSCKvuWz9sVku/jeEnijMiU4SZIXkEG/ins6XWMkXGQgc+C
 1b0ZsISQ4NkIggSmUUOe+38C91AMttzLnEnJvKoZVUWg497kRQ58eVo0aHTHnpe1vPdDSTe
 XOFv4bvpD8mWHgwBJlkKFqpyRsRBfA1DnWEDE8k/aP6v7RkFKN/9nk31AG5g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2CB27488BF
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 17:51:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CE3B210E650;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 992A044514;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76D8FC4AF14;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790964560;
	bh=Zxi8ngAQE4N498c9vJY+1kq/fCnMAbsmZCNLE2Mkets=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JW1KR6lw8U30fdg7lnerzmKHzWDaPSvAsrfrrKgnswlIoJvw+7mgUMrpOa5CIWiqz
	 z6LCUsc9dh34/H1HJ9pEH7CdWUFFcBjAvM1Uy7VH0eomE/F121+GkTK9z3lSJ2qqzJ
	 Nv30gkDJNz4nxYkHi0efrxA6aM0vXIKQ3akeFajBarOOj1swj3SWmaabirEvXiic08
	 5UIyIIXCeCUH/ct435upHaJWK+dKBCm0Q/Mf4QcN4rkxL74IJIDpF4GWDyNPbPA1Lk
	 DVt8pbBPoN4lsy/RNpH5oL9tb4Z3HZ00VLxeqnN+N1izL8jtc5lqwvykbfTEuNWgom
	 5zYdoTcgAq3lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592A5CA5FE2;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 12:09:13 -0600
Subject: [PATCH 2/3] drm/nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
In-Reply-To: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790964559; l=2253;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=L2BiCR5h7zbMn466+3toqqoccEcp+N08ZHOKB4ykJHg=;
 b=4trrWqnFSWvbtlBEh0oeA1WGLJkQkvPLNvZc26k6fM08kA0otSAlnbpbG5LmUZQ7LKRjpMoKS
 yTaR7AD+jH5AmyNRrVZet8zuAASC1MLXOz6wePMPQG8dMyAhbdGHRK5
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Message-ID-Hash: PBEKVI43ZZI7LWR7CBQ2AKLCVFWUIBIR
X-Message-ID-Hash: PBEKVI43ZZI7LWR7CBQ2AKLCVFWUIBIR
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PBEKVI43ZZI7LWR7CBQ2AKLCVFWUIBIR/>
Archived-At: 
 <https://lore.freedesktop.org/20261002-my-fixups-v1-2-a83d20f9d3fe@gmail.com/>
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
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index cb1810dee8e5..0871ac025ace 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -357,7 +357,7 @@ nouveau_abi16_ioctl_get_zcull_info(ABI16_IOCTL_ARGS)
 	struct nvkm_gr *gr = nvxx_gr(drm);
 	struct drm_nouveau_get_zcull_info *out = data;
 
-	if (gr->has_zcull_info) {
+	if (gr && gr->has_zcull_info) {
 		const struct nvkm_gr_zcull_info *i = &gr->zcull_info;
 
 		out->width_align_pixels = i->width_align_pixels;

-- 
2.55.0


