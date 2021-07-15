Return-Path: <SRS0=PqbD=MH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F456C07E96
	for <nouveau@archiver.kernel.org>; Thu, 15 Jul 2021 12:44:12 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD3E61380
	for <nouveau@archiver.kernel.org>; Thu, 15 Jul 2021 12:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBD3E61380
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929576E83A;
	Thu, 15 Jul 2021 12:44:11 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F3E6E83A
 for <nouveau@lists.freedesktop.org>; Thu, 15 Jul 2021 12:44:10 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 09620613C1;
 Thu, 15 Jul 2021 12:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1626353050;
 bh=H7Qxpr3YbwdD3ndp4wj0xvbWjNUn3HW+f1a16zuSDHg=;
 h=Subject:To:Cc:From:Date:From;
 b=HgdanaQ9JkB0KYC/dgBAiuY6FOoSMOYWDPKXTvGTrksOsuSCVOzUbtCV1HsIkoUYh
 lNNAe9r88SCUKE9qnCv5DyUmSFS2wKn9WVTQap7T2RwnseoAGtKsV5T3LdgItMIzBF
 kBhx1lIpobxAn0OlFg3UVj5CaZZ4lmnXo23jU0P4=
To: bskeggs@redhat.com, daniel.vetter@ffwll.ch, daniel.vetter@intel.com,
 gregkh@linuxfoundation.org, lyude@redhat.com, nouveau@lists.freedesktop.org,
 paul.kocialkowski@bootlin.com, pekka.paalanen@collabora.com
From: <gregkh@linuxfoundation.org>
Date: Thu, 15 Jul 2021 14:40:58 +0200
Message-ID: <1626352858326@kroah.com>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
Subject: [Nouveau] Patch "drm/nouveau: Don't set allow_fb_modifiers
 explicitly" has been added to the 5.13-stable tree
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/nouveau: Don't set allow_fb_modifiers explicitly

to the 5.13-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-nouveau-don-t-set-allow_fb_modifiers-explicitly.patch
and it can be found in the queue-5.13 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From cee93c028288b9af02919f3bd8593ba61d1e610d Mon Sep 17 00:00:00 2001
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 27 Apr 2021 11:20:16 +0200
Subject: drm/nouveau: Don't set allow_fb_modifiers explicitly

From: Daniel Vetter <daniel.vetter@ffwll.ch>

commit cee93c028288b9af02919f3bd8593ba61d1e610d upstream.

Since

commit 890880ddfdbe256083170866e49c87618b706ac7
Author: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Date:   Fri Jan 4 09:56:10 2019 +0100

    drm: Auto-set allow_fb_modifiers when given modifiers at plane init

this is done automatically as part of plane init, if drivers set the
modifier list correctly. Which is the case here.

Note that this fixes an inconsistency: We've set the cap everywhere,
but only nv50+ supports modifiers. Hence cc stable, but not further
back then the patch from Paul.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org # v5.1 +
Cc: Pekka Paalanen <pekka.paalanen@collabora.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: nouveau@lists.freedesktop.org
Link: https://patchwork.freedesktop.org/patch/msgid/20210427092018.832258-6-daniel.vetter@ffwll.ch
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/nouveau/nouveau_display.c |    1 -
 1 file changed, 1 deletion(-)

--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -697,7 +697,6 @@ nouveau_display_create(struct drm_device
 
 	dev->mode_config.preferred_depth = 24;
 	dev->mode_config.prefer_shadow = 1;
-	dev->mode_config.allow_fb_modifiers = true;
 
 	if (drm->client.device.info.chipset < 0x11)
 		dev->mode_config.async_page_flip = false;


Patches currently in stable-queue which might be from daniel.vetter@ffwll.ch are

queue-5.13/drm-tegra-don-t-set-allow_fb_modifiers-explicitly.patch
queue-5.13/drm-msm-mdp4-fix-modifier-support-enabling.patch
queue-5.13/drm-mxsfb-don-t-select-drm_kms_fb_helper.patch
queue-5.13/drm-arm-malidp-always-list-modifiers.patch
queue-5.13/drm-amdgpu-change-the-default-timeout-for-kernel-com.patch
queue-5.13/drm-zte-don-t-select-drm_kms_fb_helper.patch
queue-5.13/drm-nouveau-don-t-set-allow_fb_modifiers-explicitly.patch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
