Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764C3C44515
	for <nouveau@archiver.kernel.org>; Mon, 20 Jul 2026 20:56:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C67410E1EE;
	Mon, 20 Jul 2026 20:56:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Jzkz9qky";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 419ED47266;
	Mon, 20 Jul 2026 20:40:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784580056;
 b=FMCVExE0Beds7Bl24/qtrbFVcbXwPLTNJTz9rRGizZ0loWphpvsG66Y5DV4fjmjCp4lBm
 e+FzEeByLYtbbgCvFxu/q/oitohVrjbMgffjHNTy7ENHzf6FRQmTarFP/Q8bX8oGDg8QXUL
 s04VPcALnFG76/KeYvie3XFcE/pNxNJ6WiLi7qrE3cUIxvdlx7ojw3gb8/Wv8pvOr9ydqwh
 IxXcka/Dic6EW8CdOLOMcKIpLe3qf1xRl5ijRCtnOOZ2vHKPwh1njq2LFEoU/HRoxFAS5Wb
 PfOes6X3HGxfeUrlDN6qHzn6akoBzbrUD6+tKiD6q7ZfgbfEJZvqso0Hanxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784580056; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dXAADHKsXSW86fv4wkP9slpyD6ked1bsxf4+jf0fi54=;
 b=qFvN6u1I+8RRc8MXrlcFTi9wWUb0o7Jgfa/oAgWWTR2cmu9074/WpoQD/eaILbVLlvzu7
 K1SHG7qYNLjV8kfayV6hToVKrvToE6uPU/+Djp+nlLqUFm3YEcBm50XAvMyZt92AGDTx5Br
 0/bNFJfUCIKgH/SN2tOMk03fhyvQPdvt/kJZZ2t1w9OcQOXcWO7egxWgLJ4xMK9RCo5mAGN
 ANOnd+huJOmDv7OrHNcFhk8fPlzYnGPDzzm5GTLaONxHBZFHVYiF9T+YoDDemSj4k5CZHxd
 LfA+Aq8GboMSDsAJnDBUanfUSDdnmoPAvleEPj2ApGDicVCYus+Tlm1EfmNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A8ABF466F6
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 20:40:53 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76B8810E1B2
	for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2026 20:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784580979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dXAADHKsXSW86fv4wkP9slpyD6ked1bsxf4+jf0fi54=;
	b=Jzkz9qkym3NsrjqIjR3RcbZIIifG+dvxtwehuMGkai+Jq45F18gLzXwdTc38qBpCetyhSd
	X0fuQ8JRcjCmksq8TzKZ/RD7ARF+KEcfxjxlFeshHZEqSbAg2uT1yzp13NyfMgEBDG7xA0
	YJKxmC/Fuk/lueGuXMNpQiQxGwXtCYs=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-KPgsrJPkMUaAyNaC--BidQ-1; Mon,
 20 Jul 2026 16:56:16 -0400
X-MC-Unique: KPgsrJPkMUaAyNaC--BidQ-1
X-Mimecast-MFC-AGG-ID: KPgsrJPkMUaAyNaC--BidQ_1784580973
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 34313180059C;
	Mon, 20 Jul 2026 20:56:13 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.88.114])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id A09811955F78;
	Mon, 20 Jul 2026 20:56:10 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] drm/nouveau/kms/nv50-: Unconditionally create
 blend_mode prop for wndws
Date: Mon, 20 Jul 2026 16:43:57 -0400
Message-ID: <20260720205541.257781-4-lyude@redhat.com>
In-Reply-To: <20260720205541.257781-1-lyude@redhat.com>
References: <20260720205541.257781-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: aOn8y5wYhv8KOGjBHpWKHysvUwq26b5U4OYag8zJWaA_1784580973
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: MF5F6NNGPZ5JFZ2I4JZKVG52P4GKE356
X-Message-ID-Hash: MF5F6NNGPZ5JFZ2I4JZKVG52P4GKE356
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Leandro Ribeiro <leandro.ribeiro@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Stone <daniels@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MF5F6NNGPZ5JFZ2I4JZKVG52P4GKE356/>
Archived-At: 
 <https://lore.freedesktop.org/20260720205541.257781-4-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since the commit mentioned down below, it looks like we've been triggering
this WARN_ON():

  [   31.477009] ------------[ cut here ]------------
  [   31.477012] [PLANE:66:curs-0] pixel format with alpha exposed but
  blend mode not setup
  [   31.477014] WARNING: drivers/gpu/drm/drm_mode_config.c:872 at
  drm_mode_config_validate+0x38c/0x4c0, CPU#1: modprobe/1264
  [   31.477125] CPU: 1 UID: 0 PID: 1264 Comm: modprobe Not tainted
  7.2.0-rc2Lyude-Test+ #1 PREEMPT(lazy)
  [   31.477129] Hardware name: Micro-Star International Co., Ltd.
  MS-7A39/A320M GAMING PRO (MS-7A39), BIOS 1.M4 05/10/2023
  [   31.477132] RIP: 0010:drm_mode_config_validate+0x394/0x4c0
  [   31.477136] Code: 41 3b 9e 80 00 00 00 73 bd 49 8b 46 78 8b 3c 98 e8
  c1 3d ff ff 80 78 14 00 74 e1 48 8d 3d 64 e6 e7 01 49 8b 56 18 41 8b 76
  50 <67> 48 0f b9 3a 49 8b 46 08 4c 8d 70 f8 49 39 c5 75 97 8b 95 b8 02
  [   31.477139] RSP: 0018:ffffd48e053bb7f8 EFLAGS: 00010202
  [   31.477143] RAX: ffffffffaf1da9c0 RBX: 0000000000000000 RCX: 0000000000000034
  [   31.477145] RDX: ffff8cd883c1feb0 RSI: 0000000000000042 RDI: ffffffffb069f840
  [   31.477148] RBP: ffff8cd88ea3d800 R08: 0000000034325241 R09: ffff8cd88ea3dac0
  [   31.477150] R10: fffffaf5c4043600 R11: ffff8cd88004f600 R12: 0000000000000001
  [   31.477152] R13: ffff8cd88ea3da90 R14: ffff8cd88b9ec038 R15: ffff8cd88ea3dab0
  [   31.477154] FS:  00007fb934898780(0000) GS:ffff8cd9f3a6a000(0000) knlGS:0000000000000000
  [   31.477157] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
  [   31.477160] CR2: 0000555efff79520 CR3: 0000000122cd5000 CR4: 00000000003506f0
  [   31.477162] Call Trace:
  [   31.477165]  <TASK>
  [   31.477168]  ? nouveau_hwmon_init+0x2d6/0x330 [nouveau]
  [   31.477346]  drm_dev_register+0x19d/0x270
  [   31.477352]  nouveau_drm_device_init+0x17a/0x230 [nouveau]
  [   31.477523]  nouveau_drm_probe+0x13d/0x1e0 [nouveau]
  [   31.477690]  local_pci_probe+0x3e/0x90
  [   31.477697]  pci_call_probe+0x59/0x190
  [   31.477702]  ? srso_return_thunk+0x5/0x5f
  [   31.477706]  ? pci_match_device+0x15a/0x180
  [   31.477710]  ? pci_assign_irq+0x2d/0x160
  [   31.477714]  pci_device_probe+0x95/0x160
  [   31.477719]  call_driver_probe+0x26/0x100
  [   31.477724]  ? driver_sysfs_add+0x59/0xd0
  [   31.477738]  really_probe+0xcc/0x2c0
  [   31.477743]  ? srso_return_thunk+0x5/0x5f
  [   31.477749]  __driver_probe_device+0x85/0x170
  [   31.477754]  driver_probe_device+0x1f/0x90
  [   31.477760]  ? __pfx___driver_attach+0x10/0x10
  [   31.477766]  __driver_attach+0xcb/0x210
  [   31.477772]  bus_for_each_dev+0x85/0xd0
  [   31.477779]  bus_add_driver+0x13e/0x220
  [   31.477786]  ? __pfx_init_module+0x10/0x10 [nouveau]
  [   31.477979]  driver_register+0x75/0xe0
  [   31.477984]  ? srso_return_thunk+0x5/0x5f
  [   31.477990]  nouveau_drm_init+0x8b/0xff0 [nouveau]
  [   31.478192]  do_one_initcall+0x5d/0x300
  [   31.478204]  do_init_module+0x86/0x290
  [   31.478212]  init_module_from_file+0xd8/0x140
  [   31.478223]  idempotent_init_module+0x114/0x310
  [   31.478233]  __x64_sys_finit_module+0x71/0xe0
  [   31.478238]  do_syscall_64+0xe2/0x630
  [   31.478252]  ? srso_return_thunk+0x5/0x5f
  [   31.478257]  ? vfs_read+0x165/0x390
  [   31.478267]  ? srso_return_thunk+0x5/0x5f
  [   31.478271]  ? srso_return_thunk+0x5/0x5f
  [   31.478276]  ? switch_fpu_return+0x52/0xe0
  [   31.478282]  ? srso_return_thunk+0x5/0x5f
  [   31.478286]  ? arch_exit_to_user_mode_prepare.isra.0+0x7e/0x90
  [   31.478292]  ? srso_return_thunk+0x5/0x5f
  [   31.478296]  ? do_syscall_64+0x11f/0x630
  [   31.478301]  ? srso_return_thunk+0x5/0x5f
  [   31.478305]  ? arch_exit_to_user_mode_prepare.isra.0+0x7e/0x90
  [   31.478310]  ? srso_return_thunk+0x5/0x5f
  [   31.478314]  ? do_syscall_64+0x11f/0x630
  [   31.478320]  ? srso_return_thunk+0x5/0x5f
  [   31.478324]  ? arch_exit_to_user_mode_prepare.isra.0+0x7e/0x90
  [   31.478329]  ? srso_return_thunk+0x5/0x5f
  [   31.478334]  ? srso_return_thunk+0x5/0x5f
  [   31.478338]  ? do_syscall_64+0x99/0x630
  [   31.478343]  ? exc_page_fault+0x82/0x1c0
  [   31.478350]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
  [   31.478355] RIP: 0033:0x7fb93410030d
  [   31.478372] Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa
  48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f
  05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d c3 5a 0f 00 f7 d8 64 89 01 48
  [   31.478375] RSP: 002b:00007ffc587ce738 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
  [   31.478381] RAX: ffffffffffffffda RBX: 0000562f5fb3da60 RCX: 00007fb93410030d
  [   31.478385] RDX: 0000000000000000 RSI: 0000562f5fb40590 RDI: 000000000000000d
  [   31.478388] RBP: 00007ffc587ce7d0 R08: 0000000000000000 R09: 0000000000000000
  [   31.478391] R10: 0000000000000000 R11: 0000000000000246 R12: 0000562f5fb40590
  [   31.478394] R13: 0000000000040000 R14: 0000562f5fb3db80 R15: 0000000000000009
  [   31.478404]  </TASK>
  [   31.478407] ---[ end trace 0000000000000000 ]---

Fix it by making sure we unconditionally call
drm_plane_create_blend_mode_property for all types of wndws, including
those (such as cursors) without a blend_set function.

Fixes: 860e748bddcc ("drm: ensure blend mode supported if pixel format with alpha exposed")
Signed-off-by: Lyude Paul <lyude@redhat.com>

---
V2:
* Address Sashiko issue regarding pixel_blend_mode defaults
* The cursor uses DRM_MODE_BLEND_COVERAGE (I think), not
  DRM_MODE_BLEND_PIXEL_NONE
* Start using the new blend_modes vtable entry

 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 0f331f47bded8..84b9a16bdb8ab 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -930,13 +930,6 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 		ret = drm_plane_create_alpha_property(&wndw->plane);
 		if (ret)
 			return ret;
-
-		ret = drm_plane_create_blend_mode_property(&wndw->plane,
-				BIT(DRM_MODE_BLEND_PIXEL_NONE) |
-				BIT(DRM_MODE_BLEND_PREMULTI) |
-				BIT(DRM_MODE_BLEND_COVERAGE));
-		if (ret)
-			return ret;
 	} else {
 		ret = drm_plane_create_zpos_immutable_property(&wndw->plane,
 				nv50_wndw_zpos_default(&wndw->plane));
@@ -944,6 +937,17 @@ nv50_wndw_new_(const struct nv50_wndw_func *func, struct drm_device *dev,
 			return ret;
 	}
 
+	/*
+	 * DRM requires that we have a blend mode property for any type of plane that exposes color
+	 * formats with an alpha channel. So do this, even if we don't actually have control for the
+	 * blend property hooked up with blend_set.
+	 */
+	if (func->blend_modes) {
+		ret = drm_plane_create_blend_mode_property(&wndw->plane, func->blend_modes);
+		if (ret)
+			return ret;
+	}
+
 	return 0;
 }
 
-- 
2.55.0

