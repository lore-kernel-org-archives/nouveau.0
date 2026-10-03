Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F879CA5FEF
	for <nouveau@archiver.kernel.org>; Sun,  4 Oct 2026 13:45:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 894E410E9C1;
	Sun,  4 Oct 2026 13:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=saltyming.net header.i=@saltyming.net header.b="RvVTvkeZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 904BC4896C;
	Sun,  4 Oct 2026 13:27:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791120451;
 b=GIqKO+BRRsWweoUnbnTczVGb72NNXYuPNKOzaep0D8shxlfRpNxrPzrkRO0dy+47/2COG
 Aal9zj2L+WtxaezR50SiIJevX8YiFbKxPM2G9kE6LHbzNJQDrgXZQfyCIaO2IgLCNVYcqfL
 SJoVms9vnHLhMbt/bufTu0L7aloDwFwy0yz0pSw5UeycdPbVSACE7hewd6JTThDUKSNr+7q
 prGGeHysA4Qpoj6xGI1e5NNYrGVnOfCQiXV90Y7AwaACD0atLeZYmgjDsOhC2X20sRHMa3t
 KEXxvq3rikrpNQ0pGRlIParVSV7EtACbK+CK4xBZzTVBfOHXCxdOqeAwYWBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791120451; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gJau9VyDPFgEfF3hH7ONstNvxWwbZ1HYDG0FOVTR6EU=;
 b=ejyByLkkH0WBV5/6z+qLMePiG5x7Cw2wYISKTJSe7NDhPoYFf3PdZdl9b/uWCPrM0YDYS
 NHOsU3wUkEQBVkkWvnUcR+ZgJ0c4Y6yB9a1733Fl2JZ4aAcXm99XQP9HBlAbPMEkYuhG3+a
 ygk1gbVwGxTDiFT7H751NFNrcijure+kY2LAk7OZ3Pgmqsbr8ZUH5rOEEb6w/vxdPIJ75zF
 QRWN6+wq5rU27HjABROdqqFX2E/mkKBlurpnq8LpijV9M7KA2LUtu5cxEDnFJkElA0fkURV
 c/oNPscp16+0nqDJG8v3KNc9a75mzJGkM93sbkRsQJYE8xLTX29FK1E7BMoA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=saltyming.net;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=saltyming.net; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=saltyming.net
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8E1EE48945
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:26:05 +0000 (UTC)
Received: from smtp-sv1.saltyming.net (smtp-sv1.saltyming.net [152.53.31.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D453310E2E5
	for <nouveau@lists.freedesktop.org>; Sat,  3 Oct 2026 23:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; s=saltyming-dkim-202512; d=saltyming.net;
 c=relaxed/relaxed;
	h=MIME-Version:Message-ID:Date:Subject:To:From:Content-Type; t=1791071058;
	x=1791675858; bh=gJau9VyDPFgEfF3hH7ONstNvxWwbZ1HYDG0FOVTR6EU=; b=RvVTvkeZ5+
	AYyHMjzEQaAkTXE3uLvJI1QVkV+BKzG15iDHpv5114+hmcFNwCe/wiMDFtRq6mq8cju9Cx7BGpU
	hL8lccRfT6NGKlza4w+U9sHxP+dGLVxDnd2Roc7WPINHaebM0b+xdnGVz58o+BTtc5pwh2jeyM+
	3ZbDbBp/tmcL/PlvU1vE+o4+NG1wn7xyaKmScbcdSu3WDLAMWzu2R3WYAi7MMCtRXzt0B6X28zS
	nIWjnSyTaPnS3Hqeob0QfyHLymStUl3ZOtfL5SjHJia0ODEfZgRXPZ4AewNyKTDefF5kTzCOkTa
	MOgZzI85U+P2zvO8Z8mDdsgrYnp/BCwQ==;
Received: by smtp-sv1.saltyming.net (SaltyMail) with ESMTPSA
	(version=TLSv1.3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256)
	(No client certificate requested)
	id c37ef1fc-8f77-45ce-8b62-ee005da47008
	for <nouveau@lists.freedesktop.org>; Sat, 3 Oct 2026 22:32:52 +0000
X-Virus-Status: Clean
X-Security-Tags: spf_none, dkim_none, dmarc_fail, dmarc_quarantine, arc_none,
 av_clean, ham
From: Hamin Sung <hamin@saltyming.net>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH] drm/nouveau: request a privileged CE channel only on Kepler
 and later
Date: Sun,  4 Oct 2026 07:32:44 +0900
Message-ID: <20261003223244.63133-1-hamin@saltyming.net>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: hamin@saltyming.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: TEVNJDA53QUH4ZZ2TZMUXCKNQTFEDOHY
X-Message-ID-Hash: TEVNJDA53QUH4ZZ2TZMUXCKNQTFEDOHY
X-Mailman-Approved-At: Sun, 04 Oct 2026 13:27:28 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-kernel@vger.kernel.org,
 Simona Vetter <simona@ffwll.ch>, Yonatan Maman <Ymaman@Nvidia.com>,
 Gal Shalom <GalShalom@Nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>,
 Hamin Sung <hamin@saltyming.net>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TEVNJDA53QUH4ZZ2TZMUXCKNQTFEDOHY/>
Archived-At: 
 <https://lore.freedesktop.org/20261003223244.63133-1-hamin@saltyming.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since commit 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy
engine channel"), nouveau_accel_ce_init() always asks for a privileged
channel.  Privileged channels are only implemented by the Kepler and
later FIFO code, so on GPUs with a copy engine but an older FIFO (GT21x,
MCP89 and Fermi) nvkm_chan_new_() rejects the request, and every boot
logs:

  nouveau 0000:01:00.0: drm: failed to create ce channel, -22

On Fermi, TTM then cannot use the COPY0/COPY1 classes, which are only
available on the CE channel, and falls back to M2MF on the graphics
channel for buffer moves.  GT21x and MCP89 create their copy engine
object on the main channel, so there only the error message is visible.

The privileged channel is only needed by nouveau_dmem, which requires
Pascal or later.  Request it only where the FIFO supports it, and keep
using an unprivileged CE channel on older GPUs as before.

Fixes: 04e0481526e3 ("nouveau/dmem: Fix privileged error in copy engine channel")
Cc: stable@vger.kernel.org
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/427
Assisted-by: Claude:claude-opus-5-5 sparse # max effort
Assisted-by: Claude:claude-fable-5-1 # max effort, review
Signed-off-by: Hamin Sung <hamin@saltyming.net>
---

Notes:
    Tested on a GeForce 310M (GT218) with 6.18.54: without this patch every
    boot logs "drm: failed to create ce channel, -22"; with it the message is
    gone.  Both kernels report "MM: using COPY for buffer copies", as GT21x
    creates its copy engine object on the main channel.  I have no Fermi to
    test the M2MF fallback described above, which comes from reading
    nouveau_bo_move_init().
    
    Found while setting up nouveau on that machine with an AI coding
    assistant, which also wrote the patch and ran the tests above on it;
    I have reviewed the patch and the test results.

 drivers/gpu/drm/nouveau/nouveau_drm.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 2c7077a49888..ddf6fb74f85a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -337,6 +337,7 @@ static void
 nouveau_accel_ce_init(struct nouveau_drm *drm)
 {
 	struct nvif_device *device = &drm->client.device;
+	bool priv;
 	u64 runm;
 	int ret = 0;
 
@@ -349,7 +350,14 @@ nouveau_accel_ce_init(struct nouveau_drm *drm)
 		return;
 	}
 
-	ret = nouveau_channel_new(&drm->client, true, runm, NvDmaFB, NvDmaTT, &drm->cechan);
+	/*
+	 * nouveau_dmem copies need a privileged channel, but only the Kepler
+	 * and later FIFO implementations support those; older ones reject the
+	 * request.
+	 */
+	priv = device->info.family >= NV_DEVICE_INFO_V0_KEPLER;
+
+	ret = nouveau_channel_new(&drm->client, priv, runm, NvDmaFB, NvDmaTT, &drm->cechan);
 	if (ret)
 		NV_ERROR(drm, "failed to create ce channel, %d\n", ret);
 }

base-commit: bca45af5998a05f34b13a2ef11e639bac9c62643
-- 
2.55.0


