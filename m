Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1A86076F95
	for <nouveau@archiver.kernel.org>; Mon,  2 Nov 2026 16:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SGSFp4cg
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7051410F0D7;
	Mon,  2 Nov 2026 16:49:47 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F89448CAC;
	Mon,  2 Nov 2026 16:30:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793637026;
 b=wyqXFxlMobI6+VRdAxbbHdW3cXE0A784zHyFV/MA816ctGOmWu4LGGSeuDEjTwGsPepE3
 ZD0CvzexCuSeYnRdOWBkDQK5Ev1IcBEpOayWLElpXv84+VqtSvDyh2p2BaAYYIXjN1uoSTo
 GTAjVgBSIBYCXL4JC9ImQ3StTVoZUdmtLQ1ZUyNu0tMTWGv39iXc6V47E3g7fHTh/ZUDdFw
 YhsEf7QxfbI00Zgw6OnPDnhGc19NPy9Ym9FsJCsCABbcUDq3gRNuxBE1kDXdLk6tAGmDBq8
 R4RTaKZJbkT9mHn6uXpCvctOnlTWyxPiNlPUsGYWRuu3dMq6dKkcGO2J5Kew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793637026; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zVpHwEi1acfZUiGgbeCPyTxHSVjEFQmQseYO2YcJPk0=;
 b=fHgUkp+sI97YG9ExH1j8x/Mo+xTNfltXYSyNV2wUjagDjx7w9x38NpIxKwDH3gSoABh+i
 B1DKnvtrxd6jjXWe00XAm5op13ktPbHBw7BSfFyRJZdhouo2fIVoPt87rAb2wiOX9H4C/it
 IWkHrL/adZgzS4mhfweYhXEoKcnhQPDA5LNSu3lew5aJtY04vgXvP/Dl+loICTt9pYv93oO
 y0kvxv7mK68UwP6MatTbm3NAZjhSAW6le1U1ZjYJmP9cwux8a8JpDWIfPKPcKd+fsyqOiE5
 CoY17n32rvtEOA3HiURaGw5QXXrNiYfKeKnOHuLjifz8ABO3kr81KVhc+Crw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E101348CAB
	for <nouveau@lists.freedesktop.org>; Mon,  2 Nov 2026 16:30:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB33210E6B5;
	Mon,  2 Nov 2026 16:49:36 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1F1F436A2;
	Mon,  2 Nov 2026 16:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D6701F00A17;
	Mon,  2 Nov 2026 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793638176;
	bh=zVpHwEi1acfZUiGgbeCPyTxHSVjEFQmQseYO2YcJPk0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SGSFp4cgHWsyT1Zwmaoh2VWhsvYgwsCbG4SdEhQTzPWWYfE/MpDzcaEabYmidhImC
	 YuNMnzT7zBzsTDKJdwC3wLMp6D1v2uGPmPcS00fNymqTPInndUf9JZ1POxg+FHon/H
	 zfc0/1OWRILSY7zBBMbgtO2PtDt4Qk3b73tj/l+8NFzDzQR1HE712xDnSp/zL/92oX
	 23bt69U7Y847IwJZv2MJA316+/YVNEjSl1alG4FlbaqO2CbHIZ/87V5oMJSq31qdUk
	 v8JUayenlZY+t3zWXddlL1DrucZw9rL60wEb2tBePGWMc3ooSWF/Qh2sdJLyoCuRxz
	 0kl++LKj1UqIA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Mon, 02 Nov 2026 10:49:20 -0600
Subject: [PATCH v10 04/15] drm/amdgpu: Check bios_scratch_reg_offset in
 backlight level helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261102-superm1-backlight-property-v10-4-b2a6f24131f5@kernel.org>
References: 
 <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
In-Reply-To: 
 <20261102-superm1-backlight-property-v10-0-b2a6f24131f5@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
X-Mailer: b4 0.16.0
Message-ID-Hash: DUNYVAR2MNJQZWAJOUXMOGZW57MKKU6Z
X-Message-ID-Hash: DUNYVAR2MNJQZWAJOUXMOGZW57MKKU6Z
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DUNYVAR2MNJQZWAJOUXMOGZW57MKKU6Z/>
Archived-At: 
 <https://lore.freedesktop.org/20261102-superm1-backlight-property-v10-4-b2a6f24131f5@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Ensure adev->bios_scratch_reg_offset is non-zero before accessing
scratch registers in amdgpu_atombios_scratch_regs_set_backlight_level()
to avoid dereferencing unmapped MMIO offsets.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
index 27c0dc8f6137a..2d8c2ba04e670 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_atombios.c
@@ -1622,7 +1622,12 @@ void amdgpu_atombios_scratch_regs_engine_hung(struct amdgpu_device *adev,
 void amdgpu_atombios_scratch_regs_set_backlight_level(struct amdgpu_device *adev,
 						      u32 backlight_level)
 {
-	u32 tmp = RREG32(adev->bios_scratch_reg_offset + 2);
+	u32 tmp;
+
+	if (!adev->bios_scratch_reg_offset)
+		return;
+
+	tmp = RREG32(adev->bios_scratch_reg_offset + 2);
 
 	tmp &= ~ATOM_S2_CURRENT_BL_LEVEL_MASK;
 	tmp |= (backlight_level << ATOM_S2_CURRENT_BL_LEVEL_SHIFT) &

-- 
2.53.0

