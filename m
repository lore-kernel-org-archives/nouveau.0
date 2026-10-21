Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C96B606A319
	for <nouveau@archiver.kernel.org>; Wed, 21 Oct 2026 16:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DGQ9n7zR
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 632B210E32A;
	Wed, 21 Oct 2026 16:55:25 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 937E94495F;
	Wed, 21 Oct 2026 16:36:32 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792600592;
 b=btV+60enGZDu67xpOIhHScYcf5AB2Hnx7DTMn9uRZPOKzzLVnBs78D+/5volzgdSmQeas
 kkLbcWIMqSHnSGUV3sNPn1WIuuOyj40emaS5B4/qYXDGUk4LxyhbAf+dtu5PYSQGhFPW8gY
 Yc6rPu9m55f8N0NinUP9hppus1xzXbNx/ZGQRQrCwhCfAuw6/QyOV0r+RNF/TbX1NQI5Dv7
 8cfZ8KKax7fzDYZpUeu+ZDo9oZRfMk0PXUaIhtAZOtNllkWSFIUU45uTgWQLWnWWRx8yF89
 4pZ4GvAu3TAX1SUCeJbOtyToK8vZ765UjRYsyJtkPtg7BlHP56SuBbcHJGfg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792600592; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=C4QyRnGrdWyZezn3sJE3V8gSx7WRk2zAitUEcSJ86rs=;
 b=srYnVujHVg3zmEBCK1wSeZ6/hR3dppzZU96iO5jugLRRwRq5An6OADpNlJ5OGg78rEf9K
 /qf0XYfWUQuOzKqX4TfWkuyRfN1JWH0Rgi+QyYDJxz6ZUFvtY7b4yBn0KjEj9JutsmX5qaV
 TMtSRmkRitj0Y2xbkeJHIm7ylsjUBclQUQl4Gw/fER40wla+TldLPf5Iq+z6YAVEzoiVl2m
 0XAlVk75R7duTRWEwJgaf+ko11HRJ8PfFmRnvMH7nuks1A5kI5cycbbjcmNt/aXS/v1+JuT
 +jgncunT6TdYpvK5/6UfUQXYaMAR/uZ1QDEA4rWnqmWuikWVJPI58CFIJ2uw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=kernel.org policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 16C8D4099B
	for <nouveau@lists.freedesktop.org>; Wed, 21 Oct 2026 16:36:29 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C55B10E009;
	Wed, 21 Oct 2026 16:55:16 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B35B0602C5;
	Wed, 21 Oct 2026 16:55:15 +0000 (UTC)
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792601715;
	b=Z8TDklyvD3dqXjQZkuyMlq8T0vTsPlJr4stVJXIHiRwivOl3SG76HrxhKuSER1JR+TxV
	 VUMDeWHGecsu11DB3EH5VwUQbeLeRLkrH+lr5Ptpt8lMaCNJt5QQ3oUQ+MTPC4+7gwCrk
	 l0432H7FGUHhcLAWSx1fsgZuVLSW3nKonFnfguMaMuEjgPm2ovM2gUPFmWYroxFUmxPyM
	 TZ/PAqxnsbkDOGrwXPKEdUPXpDemx1S6BjW8vtJpXB19NS43dWkYOPBuvXWRRYnQpM6Vh
	 Zu9uqYfLgSv6vsLTl+ht1ttecANRYykSIuJc+wxWP3lvzOaaWYetkRF8dXqBkgydHZw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792601715;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=C4QyRnGrdWyZezn3sJE3V8gSx7WRk2zAitUEcSJ86rs=;
	b=p8srcuw4IPzuyKU/ZxAiooQJEh91Zua21RMdWryUpAPwM8kjG5OM3BWEylpjswTVBkt0
	 jBy7GtOrqLbR88393wdKTVka74lCQ4OPJnsj+mmPX2IXhUghZVSrEmSuuwqVjngXkZSSc
	 8U85Em8EK2Saj3oKAyWzaVD2mZMVlMoKnZTLJNKkMMNDSDKhIjbLQaPCiY0ko1ttnu/he
	 qCCmGBAkDUE7IvcSErSfOIPy1Vcz/W/utGjEUJ6MCTiJC7HFRAKojux+HZGMZgKdj4aiR
	 A72LFKDmfjNnzfJgHkGDeeGZUwgOvD4V0UpG2gRDiiwIgKhEcuflN1xur02BE1N0sWg==
ARC-Authentication-Results: i=1; smtp.kernel.org;
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest
 SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C4F9F1F000C4;
	Wed, 21 Oct 2026 16:55:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792601715;
	bh=C4QyRnGrdWyZezn3sJE3V8gSx7WRk2zAitUEcSJ86rs=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=DGQ9n7zR5pO1CvUnp7ZwfrYzXsuz3l+1IOW+IYKpGJh2ivevmtd14AJNm2Q1KRq8O
	 vnMzaTLrfb5IlxxjSMbPpkLG6LvYXNzL539SbFBD8Se/5LSOEPHx/XlvCT6zc1/skX
	 /vjqmIN2dbel537K/fOe9hcXhIdSl6/hprEaf9Bd7459DCSyUgR/JgHQO/7NOD5/Yp
	 cQ+PoSVJddEUn1bjhRwX0Kq1Wx2fBEkx99euUe+uXNhQDmGFT/JwVxejCMu+bQFDxJ
	 NtX/pE7+VLWozfrHCk1Ydpn2x2fMgDrrvS/TqfQ/3uaWOJke+ouQH5wC0xeHGkbnKs
	 YWE8knpbVKgsw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 271EA4315A;
	Wed, 21 Oct 2026 16:55:14 +0000 (UTC)
From: Joe Finzel via B4 Relay <devnull+joe.sudmix.de@kernel.org>
Date: Wed, 21 Oct 2026 18:55:02 +0200
Subject: [PATCH] drm/nouveau/gsp: skip address-only I2C starts with MOT on
 GSP-RM
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261021-nouveau-edid-segment-v1-1-101dd5aa3ecd@sudmix.de>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MOwqAMBBF0a3I1A4kEb9bEQsxT53CKIkGQdy7w
 fIU9z4U4AWBuuwhjyhBdpeg84ymdXQLWGwyGWUqrYxmt18R48WwYjlg2eBOLsq6UeWkW9SglB4
 es9z/th/e9wNCX9yIZgAAAA==
X-Change-ID: 20261021-nouveau-edid-segment-357805c19e7e
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Ben Skeggs <bskeggs@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792601713; l=3093;
 i=joe@sudmix.de; s=default; h=from:subject:message-id;
 bh=oM+HRdxOHZSWOEGviI42/1A3BImx/Py3uHcns0asV/U=;
 b=jMHvMxK6yddba4p7Pt0fqga8L7DwN8eEuQoeEyw0ST+chY2TqJwgejk6gvqPWkuOMF7j+dIhd
 kwv35tkNSMiDaPEHzJvz4Xx4CmSGsIwK430y+hVswUKYGkUoWQ8e2w7
X-Developer-Key: i=joe@sudmix.de; a=ed25519;
 pk=vaX11uVm57me/1N8otNmzMMnsE+f0U3/Hi9TCPbnvZM=
X-Endpoint-Received: by B4 Relay for joe@sudmix.de/default with
 auth_id=1151
X-Original-From: Joe Finzel <joe@sudmix.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: WWP3M4WHJA32VF2CIW3JAP3PK7ANHW7U
X-Message-ID-Hash: WWP3M4WHJA32VF2CIW3JAP3PK7ANHW7U
X-MailFrom: devnull+joe.sudmix.de@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Joe Finzel <joe@sudmix.de>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: joe@sudmix.de
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WWP3M4WHJA32VF2CIW3JAP3PK7ANHW7U/>
Archived-At: 
 <https://lore.freedesktop.org/20261021-nouveau-edid-segment-v1-1-101dd5aa3ecd@sudmix.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Joe Finzel <joe@sudmix.de>

The DRM I2C-over-AUX helper starts each I2C message with an
address-only request with MOT set. r535_dp_aux_xfer() forwards it to
GSP-RM with MOT cleared, which issues a stop on the DDC bus.

E-DDC resets the segment pointer (I2C address 0x30) on a stop. The
segment write is thus lost when the next message (offset write at 0x50)
starts, and the sink returns segment 0 again: EDID blocks 2 and 3 read
back as blocks 0 and 1. On a Dell AW2723DF connected to an RTX 3070 Ti,
block 2 is its DisplayID extension with the only 2560x1440@240Hz
timing; the kernel saw a second copy of the base block instead, and the
highest mode offered was 2560x1440@144Hz. Windows reads the correct
block from the same monitor.

Forwarding the start with MOT set instead left the display without a
signal on the same system. NVIDIA's own DisplayPort library never sends
GSP-RM an address-only request with MOT: it writes the segment and the
offset as data requests with MOT and ends with a read without it. Do
the same and skip the start; the data requests carry the address and
MOT themselves, and the address-only stop that ends a transfer is still
sent as before.

Tested on an RTX 3070 Ti (GA104, GSP-RM 570.144) with the AW2723DF over
DisplayPort: the EDID read back now matches the one Windows reads byte
for byte, and 2560x1440@240Hz is among the probed modes.

Fixes: 9e9944449023 ("drm/nouveau/disp/r535: initial support")
Cc: stable@vger.kernel.org
Signed-off-by: Joe Finzel <joe@sudmix.de>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index f5f22173fc2..13a27476875 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1072,6 +1072,20 @@ r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
 	int ret;
 	int retries;
 
+	/*
+	 * The DRM I2C-over-AUX helper starts each I2C message with an
+	 * address-only request with MOT set. GSP-RM is only ever given complete
+	 * requests (NVIDIA's DisplayPort library sends none of these), and
+	 * forwarding it as below, with MOT cleared, issues a stop: the sink then
+	 * resets the E-DDC segment pointer written just before, and EDID blocks
+	 * 2 and 3 read back as blocks 0 and 1. The data requests that follow
+	 * carry the address and MOT themselves, so the start can be skipped.
+	 */
+	if (!size &&
+	    NVDEF_TEST(type, NV0073_CTRL, DP_AUXCH_CMD, TYPE, ==, I2C) &&
+	    NVDEF_TEST(type, NV0073_CTRL, DP_AUXCH_CMD, I2C_MOT, ==, TRUE))
+		return 0; /* ACK */
+
 	for (retries = 0; retries < 3; ++retries) {
 		ctrl = nvkm_gsp_rm_ctrl_get(&disp->rm.objcom, NV0073_CTRL_CMD_DP_AUXCH_CTRL, sizeof(*ctrl));
 		if (IS_ERR(ctrl))

---
base-commit: fb26cf4f1df40a462ea65552a3fbcc8cfafab523
change-id: 20261021-nouveau-edid-segment-357805c19e7e

Best regards,
-- 
Joe Finzel <joe@sudmix.de>


