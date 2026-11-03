Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34BD1606D809
	for <nouveau@archiver.kernel.org>; Tue,  3 Nov 2026 22:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iftOeaxG
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2E45010F8B3;
	Tue,  3 Nov 2026 22:42:28 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AC8CB48D0C;
	Tue,  3 Nov 2026 22:23:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793744585;
 b=upjlBuGLeO7HrFxU73L+RNUq9zcWq0k7u5dqcGX6Zw4WTRdmyleRgU9AaMjwo1kFtZ9Cd
 rw8KBRPwidaeQJIOQcm9eA/z4ATIcE/Ae0xyCr8f1qYXJsr/FirC1NBZbD1RvabEcbZtKgQ
 WFHKSGvjMdg/Vt27ccFc+5aFTwRL4xOUGLQK3nKYikprQCeNpA+r8bjjm1dhgqH+SoxSAy3
 DJx3NxyE8kK+cMx+8TeiKjLQSv8hueeniA38wN+MaavXoY9q/NWG9XDgKgwhehPh//HC5N0
 RXymVTuHeUHHhHHjSaNszbY8YJmwqQe7dOrzWaVqIWUvffOjZcj4GnccBZLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793744585; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qVqLMAowWNNhyYo56lksEAIwVw7s3n3V0O+bkJsZopw=;
 b=wWaFgaBr9xupd5HjBewh4/ZRFC36T8d/3rmhU8VIeSTycBeiyb1j3Cp6PJV5SL+HNimpg
 0EITRKUnrm4APagN1CN8iO2sp9mGSlvmTCJOm9xzF1rsFvH7PlIWyoSXfGaWpiRR9UVPFHw
 fatk2kvhX9oD0Vnf86SDODMkpTxrGdxag9ehN9l/k9eqF5vYiYK9k5mhPVS/7ZbdUP8P40y
 fNKdpxy6xHEREAuLYnnHa89fIWuKHs356jj0bmiKRaNOEx8QoN1gEAIZp8rxYFR2hUW46no
 CLDWXkZn60/join0Pyua9i7qc/ADhphEenErKksgKeIjYbzVdbDDGckDKulw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 170B548D02
	for <nouveau@lists.freedesktop.org>; Tue,  3 Nov 2026 22:23:03 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0F6110E9CF;
	Tue,  3 Nov 2026 22:42:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4483B60416;
	Tue,  3 Nov 2026 22:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67A971F00A02;
	Tue,  3 Nov 2026 22:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793745739;
	bh=qVqLMAowWNNhyYo56lksEAIwVw7s3n3V0O+bkJsZopw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=iftOeaxGfx9EBOch2JcelLX5nfcthifD4mkbDaBsSwmWLBT/s7L37c3nX/QzFFe6r
	 qC4K7QbarNyv55yrvsV/8cQ7U1LyDD1ifRlTd/ETfHEF6xYGu3Qwo0DxD7LcPFwpu+
	 PKzvIkHU98UVMtON+Cy9Ut/H4mquUjLPx3x58fJrfIySPPiIkgS02A6DZ+dZ8Lzv6Y
	 lHhuyqz2Zu3LrIR+PUphpC6Sw/8rOWan5Z+K23HsfRdkMvP8iDK6I76jHda42rdmfA
	 F5oWG7NeG6eKljVQHqUNrYo4SytuyJxj7+3t211LL8Ub/+lSRPn6yOy7qgCBox7XZv
	 KZoiaUa9hj8VA==
From: "Mario Limonciello (AMD)" <superm1@kernel.org>
Date: Tue, 03 Nov 2026 16:42:03 -0600
Subject: [PATCH v11 02/12] drm/amd/display: Pass up errors reading actual
 brightness
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: 
 <20261103-superm1-backlight-property-v11-2-00cce7b2ba22@kernel.org>
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
Message-ID-Hash: YFVFL772JH37UAHVQQPZ4EG35TJ2RDAY
X-Message-ID-Hash: YFVFL772JH37UAHVQQPZ4EG35TJ2RDAY
X-MailFrom: superm1@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YFVFL772JH37UAHVQQPZ4EG35TJ2RDAY/>
Archived-At: 
 <https://lore.freedesktop.org/20261103-superm1-backlight-property-v11-2-00cce7b2ba22@kernel.org/>
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

From: Mario Limonciello <mario.limonciello@amd.com>

[Why]
If the DC API fails to return actual brightness when backlight control
API requests it, then the wrong value may be returned.

[How]
Change return type of amdgpu_dm_backlight_get_level() to an integer
and pass an error code up to the caller.

Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c | 13 +++++++++----
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h |  2 +-
 .../amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c  |  4 ++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
index cb74b00723fda..0f664c658a127 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.c
@@ -438,7 +438,7 @@ int amdgpu_dm_backlight_update_status(struct backlight_device *bd)
 EXPORT_IF_KUNIT(amdgpu_dm_backlight_update_status);
 
 STATIC_IFN_KUNIT
-u32 amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx)
+int amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx)
 {
 	int ret;
 	struct amdgpu_dm_backlight_caps caps;
@@ -451,14 +451,14 @@ u32 amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx)
 		u32 avg, peak;
 
 		if (!dc_link_get_backlight_level_nits(link, &avg, &peak))
-			return dm->brightness[bl_idx];
+			return -EINVAL;
 		return convert_brightness_to_user(&caps, avg);
 	}
 
 	ret = dc_link_get_backlight_level(link);
 
 	if (ret == DC_ERROR_UNEXPECTED)
-		return dm->brightness[bl_idx];
+		return -EINVAL;
 
 	return convert_brightness_to_user(&caps, ret);
 }
@@ -469,8 +469,13 @@ int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd)
 {
 	struct amdgpu_display_manager *dm = bl_get_data(bd);
 	int i = amdgpu_dm_backlight_get_device_index(dm, bd);
+	int ret;
+
+	ret = amdgpu_dm_backlight_get_level(dm, i);
+	if (ret < 0)
+		return dm->brightness[i];
 
-	return amdgpu_dm_backlight_get_level(dm, i);
+	return ret;
 }
 EXPORT_IF_KUNIT(amdgpu_dm_backlight_get_brightness);
 
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
index 9ad888d3ae7b2..891749322191c 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_backlight.h
@@ -57,7 +57,7 @@ void amdgpu_dm_validate_backlight_caps(struct amdgpu_display_manager *dm, int bl
 struct dc_stream_state *dm_find_stream_with_link(struct amdgpu_display_manager *dm,
 						 struct dc_link *link);
 int amdgpu_dm_backlight_update_status(struct backlight_device *bd);
-u32 amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx);
+int amdgpu_dm_backlight_get_level(struct amdgpu_display_manager *dm, int bl_idx);
 int amdgpu_dm_backlight_get_brightness(struct backlight_device *bd);
 ssize_t panel_power_savings_show(struct device *device,
 				 struct device_attribute *attr,
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
index 28dda5324dfa7..8fc1c2f997688 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/tests/amdgpu_dm_backlight_test.c
@@ -382,7 +382,7 @@ static void dm_test_backlight_get_level_pwm_error(struct kunit *test)
 	dm->brightness[0] = 4321;
 	dm->backlight_link[0] = link;
 
-	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), 4321U);
+	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), -EINVAL);
 }
 
 /**
@@ -424,7 +424,7 @@ static void dm_test_backlight_get_level_aux_error(struct kunit *test)
 	caps->caps_valid = true;
 	caps->aux_support = true;
 
-	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), 6789U);
+	KUNIT_EXPECT_EQ(test, amdgpu_dm_backlight_get_level(dm, 0), -EINVAL);
 }
 
 /**

-- 
2.53.0

