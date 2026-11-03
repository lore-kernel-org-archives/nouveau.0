Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D52606D825
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 22:42:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=j3OODWw5
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 09D7310F8CA;
	Tue,  3 Nov 2026 22:42:29 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EFC9148D01;
	Tue,  3 Nov 2026 22:23:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793744587;
 b=p2DHWEK9yzFsh6BU5AspE1urZAGKnWPevO2nrE7ijn5wIZt1jxk8OvGOP9k/qxsVMqsnh
 gF7Xu4h5YYQuLbCVDxPPSFwf+KmA+gclI1A+9Ay1otAtCQqRcvoHijzI4zIqYtx7PFoxqQ0
 7I/wwhi2jR5X74MTmmH+B9NYC8ZPdNahATfYnDTK662nadEBO+a8Ic5YT22MzGIAZFm5TDb
 bSvCxjLMzACqlog/41LHn9gPPoeWDfrXshx9S3S1ea8W2mG+1Oqk0QKaH4b0ZVBO9jpLfc/
 oevcoudIFO2Ul0EV0Y3Io6/xKH4T76YNKuhS49pQFLeg7zeKuOEy+Iaz6L4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793744587; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0sdOH+ree5IgSPVQKTOIGghF0UA7yYGr+BoCWpeeYkw=;
 b=Os9luJEAnglo2P3T2/GJYtkV88y9sB+whCXhBQ1s+OlMeIkzxk3/xuMQwUB5rDLa5WCgf
 GzSwNwePuDRxwGfU01nQ8j/+M6mk3DNOW8egGf4SByXjXs4Qsv5nl4wZ9xwZg+kr2bI1HY1
 7Qjnly3tAZ3KMOm5g2FK7Er5SNjbWLheHLPomUpmvZePfLdHdSgJ1jDGVjF5z+TPbie5MBP
 RVF0IfJDIB+06exgNI0u3tRfmYkI+l2mRPPsaif0FCYvbI4TwNTwYUNH1EL70ywL2vD1cSp
 QmUQit0hPtueto9aVBnzkvhQovs9B2toyKCgFpjy+ZNskfFAeUO95avAyD5g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1710348CFD
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 22:23:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C665010EE3E;
	Tue,  3 Nov 2026 22:42:21 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA6A60A6A;
	Tue,  3 Nov 2026 22:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5523B1F00A16;
	Tue,  3 Nov 2026 22:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745741;
	bh=0sdOH+ree5IgSPVQKTOIGghF0UA7yYGr+BoCWpeeYkw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=j3OODWw5Srwk+0gbX4fyeLkLjZvFoO6R0yB4+xMzR8P/p///RRFdepCpbPXSBgM3l
	 +yNqBT9AaqMvua1u+Mi/APYqqzvs+QC5lEMqPR2VJu9jUsuGlRaK2mmH5+Z/jrQS5I
	 S2IvZmvzmEuWMHa8M5I8Yot7Mc/NF+DQP1sItWdZgS3GeQuF4pyy0XWKKo6OcJlirU
	 HXZBrslBY8ifd31JeUokHTeUfyRgHNvpfgg8mMqT4h+nIsTHwxdiRAvwVibOHwurAY
	 8VHKoF+iwJ6VVxZ/cgyd42tihAf3cQaIb/ihdiYteZrSH8HKjopnyJLihisQOReD87
	 dlHd5wuE8ChNw==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:04 -0600
Subject: [PATCH v11 03/12] drm/amdgpu: Check bios_scratch_reg_offset in
 backlight level helper
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261103-superm1-backlight-property-v11-3-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
To: Maxime Ripard <mripard@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
X-Mailer: b4 0.16.0
Message-ID-Hash: RJAOQPOATRIDONIMSTMPLA54FZIDUS6H
X-Message-ID-Hash: RJAOQPOATRIDONIMSTMPLA54FZIDUS6H
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RJAOQPOATRIDONIMSTMPLA54FZIDUS6H/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-superm1-backlight-property-v11-3-00cce7b2ba22@kernel.org/>
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
scratch registers in amdgpu_atombios_scratch_regs_set_backlight_level(),
so they are not accessed when they were never set up, such as in KUnit
tests.

Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
---
v11:
 * Clarify the commit message
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

