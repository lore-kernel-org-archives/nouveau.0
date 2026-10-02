Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF3ACA5FDD
	for <nouveau@archiver.kernel.org>; Fri,  2 Oct 2026 18:09:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 47B3510F954;
	Fri,  2 Oct 2026 18:09:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="k6mTLjdJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 58507488FB;
	Fri,  2 Oct 2026 17:51:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790963473;
 b=hz/v5USkLTI3dwS5sSv0jhQ6ygS48oIthYjI+usNvzAHrQ4SSDFQncl2z2+e+hpAjFjBp
 HDc/vtqNzhTZZn9KCi+r7KNaLJk9W2VaAA+KPXGaoi8I/jSX+Jw0sp9dJZawS00D6WGEBtE
 Bg6G9hqoaNPu7iDnKCplPUpB0Ge5aMcNWhxe37HOa9RE7a0IHVNnh3CVYR/afJ6PPwGOSP+
 J1Z+jGmWzTeaSQ87R4IfirVE2piVgj3WHP3GST4r+GghCfSOZkru/6wygiE9/xCyU4jENuy
 FWGxDzSBGQhtBvQkJ+hHOmhnokuAoFbHzp/6wQN054ak3+UA/GOlK6en/85g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790963473; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LkE96oV7DzHeW/R+9dSoQo/RCz5Kr7ioa4+AmleuS6I=;
 b=gjoD2G0MQmLHz05hcjbSnJs7B6nt+L6foOSoHR5+9KYiQ24q8uAC/6Pe0ezUGf+Fqdjdf
 0PkwXeJ8btyBlKxxLTg9RmJvW1fkjdAGcqPilftGhcrVrckSwW7JkmPwAuBeb5D2taPQjPf
 XDfcZ3P3tG9qnmTWz4BvS7Llqb2rWW6OxJY3e2k2vRZlqgucycxgdnFFe3vTm04sTVfEXSB
 OwoU+CTakdYoxbj0D+lwxIFPH5yFjXKuQyLV1pVJPccKQqCstzvdNikOyEVfKawD9eZMdFF
 NnNt3QmC+yeqYJAN585yJmPE4m1fjSAm6nE2yWDwFjrc/v0A+BvbucH65zyA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2A6A3488F2
	for <nouveau@lists.freedesktop.org>; Fri,  2 Oct 2026 17:51:10 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD88210E5B8;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92FB9444FC;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 687B2C2BCF4;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790964560;
	bh=pQzzHR1jSf1LBsKukhQEQQTDXjFcfjyH63mZMWAgoCE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=k6mTLjdJvmqcP2qeO+IsdWzawc9vhvyWLdSIzfVhxX9mHF78NT4fSxLpn2Ncygpsn
	 jrNyqHs+icjCPKC00BbSdEE3Bw+8cXdG8axeobAczOXaVq3Qjg44Yd7R02pVJBIcIH
	 YF3tqEQqLTG6nHvm0zqdWDTsTw16RnooI1WEbjyRL8DagAl+JNVh/s5NDGxZf1ph23
	 2CYJn7Kc7b+jQYBRIr33mlXqu37uZzfzyUK9o66KbLOojnDb2RwX1Oua8uaARkuV8X
	 oop1JWMShHf9Mw4ljJci99ZXP6jgaxB84/YousYl44ceVmTrNR97EDrKBdfFOw8CHZ
	 dhUSB+trnVgmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48AE3CA5FDD;
	Fri,  2 Oct 2026 18:09:20 +0000 (UTC)
From: Jim Cromie via B4 Relay <devnull+jim.cromie.gmail.com@kernel.org>
Date: Fri, 02 Oct 2026 12:09:12 -0600
Subject: [PATCH 1/3] drm/nouveau: Fix NULL pointer dereferences in GETPARAM
 ioctl
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261002-my-fixups-v1-1-a83d20f9d3fe@gmail.com>
References: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
In-Reply-To: <20261002-my-fixups-v1-0-a83d20f9d3fe@gmail.com>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790964559; l=2785;
 i=jim.cromie@gmail.com; s=20260203; h=from:subject:message-id;
 bh=QHT6F9bRsCSK/nFg+Kli1okkZmR+V1raU8PhoZi19tE=;
 b=jCTioNWp4bpW+8/Rv2da8zzMOJzc47Xua1VM24gOao1j0jRAfP7tCtNaZwRDbIWc8J0/SOERO
 6K6oJKdgucSDqzBbg4WQzXJsv+i5pPWdTvBDp+9vexqnBhIRFjEHJdG
X-Developer-Key: i=jim.cromie@gmail.com; a=ed25519;
 pk=C6E5ODlPQo7ZBynATXH9wg7K6HxP0pIXyf4s38Qw0XE=
X-Endpoint-Received: by B4 Relay for jim.cromie@gmail.com/20260203 with
 auth_id=958
X-Original-From: Jim Cromie <jim.cromie@gmail.com>
Message-ID-Hash: NIVD2M3VISDB5RWU2NXXZBC4RS5A3MPG
X-Message-ID-Hash: NIVD2M3VISDB5RWU2NXXZBC4RS5A3MPG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NIVD2M3VISDB5RWU2NXXZBC4RS5A3MPG/>
Archived-At: 
 <https://lore.freedesktop.org/20261002-my-fixups-v1-1-a83d20f9d3fe@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Jim Cromie <jim.cromie@gmail.com>

When hardware or firmware initialization fails, the graphics engine
(gr) or device functions may remain NULL. Attempting to access these
during the GETPARAM ioctl (e.g., NOUVEAU_GETPARAM_GRAPH_UNITS) results
in a kernel NULL pointer dereference, causing a crash when userspace
(GNOME/Mesa) attempts to probe the device.

Add safety checks for 'gr', 'gr->func', and 'nvkm_device->func' in the
ioctl handler. Return -ENODEV to signal the missing hardware state to
userspace, and use NV_ERROR_ONCE to provide diagnostic proof in the
kernel log without risking a console flood.

NOTE:

I encountered these crashes while booting unrelated code (in
dynamic-debug) on real HW.  There was also some fwupd updates around
this time, so it could all be transient/unreproducible.  But it did
happen, and could happen again in unforseen circumstances.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 25 +++++++++++++++++++++----
 1 file changed, 21 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 4542d5f4ded8..cb1810dee8e5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -306,7 +306,12 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		getparam->value = 1;
 		break;
 	case NOUVEAU_GETPARAM_GRAPH_UNITS:
-		getparam->value = nvkm_gr_units(gr);
+		if (gr && gr->func) {
+			getparam->value = nvkm_gr_units(gr);
+		} else {
+			NV_ERROR_ONCE(drm, "GETPARAM_GRAPH_UNITS: no gr engine or func\n");
+			return -ENODEV;
+		}
 		break;
 	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
 		int ib_max = getparam_dma_ib_max(device);
@@ -315,11 +320,23 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 		break;
 	}
 	case NOUVEAU_GETPARAM_VRAM_BAR_SIZE:
-		getparam->value = nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
+		if (nvkm_device && nvkm_device->func && nvkm_device->func->resource_size) {
+			getparam->value =
+				nvkm_device->func->resource_size(nvkm_device, NVKM_BAR1_FB);
+		} else {
+			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_BAR_SIZE: no device func\n");
+			return -ENODEV;
+		}
 		break;
 	case NOUVEAU_GETPARAM_VRAM_USED: {
-		struct ttm_resource_manager *vram_mgr = ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
-		getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
+		struct ttm_resource_manager *vram_mgr =
+			ttm_manager_type(&drm->ttm.bdev, TTM_PL_VRAM);
+		if (vram_mgr) {
+			getparam->value = (u64)ttm_resource_manager_usage(vram_mgr);
+		} else {
+			NV_ERROR_ONCE(drm, "GETPARAM_VRAM_USED: no vram mgr\n");
+			return -ENODEV;
+		}
 		break;
 	}
 	case NOUVEAU_GETPARAM_HAS_VMA_TILEMODE:

-- 
2.55.0


