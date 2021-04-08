Return-Path: <SRS0=c1h+=JF=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C941BC43460
	for <nouveau@archiver.kernel.org>; Thu,  8 Apr 2021 14:01:49 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E0C4610E5
	for <nouveau@archiver.kernel.org>; Thu,  8 Apr 2021 14:01:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E0C4610E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5394D6EB0F;
	Thu,  8 Apr 2021 14:01:45 +0000 (UTC)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C89BB6EB0D;
 Thu,  8 Apr 2021 14:01:43 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 58723B00E;
 Thu,  8 Apr 2021 14:01:42 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@linux.ie, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, bskeggs@redhat.com, kraxel@redhat.com
Date: Thu,  8 Apr 2021 16:01:35 +0200
Message-Id: <20210408140139.27731-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Nouveau] [PATCH v2 0/4] drm: Generic dumb_map_offset for TTM-based
 drivers
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
Cc: nouveau@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The implementation of drm_driver.dumb_map_offset is the same for several
TTM-based drivers. Provide a common function in GEM-TTM helpers.

v2:
	* update hibmc as well (kernel test robot)

Thomas Zimmermann (4):
  drm/gem-ttm-helper: Provide helper for struct
    drm_driver.dumb_map_offset
  drm/vram-helper: Use drm_gem_ttm_dumb_map_offset()
  drm/nouveau: Use drm_gem_ttm_dumb_map_offset()
  drm/qxl: Use drm_gem_ttm_dumb_map_offset()

 drivers/gpu/drm/drm_gem_ttm_helper.c          | 33 +++++++++++++
 drivers/gpu/drm/drm_gem_vram_helper.c         | 48 -------------------
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     | 18 -------
 drivers/gpu/drm/nouveau/nouveau_display.h     |  2 -
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.c                 |  3 +-
 drivers/gpu/drm/qxl/qxl_drv.h                 |  3 --
 drivers/gpu/drm/qxl/qxl_dumb.c                | 17 -------
 drivers/gpu/drm/qxl/qxl_ioctl.c               |  4 +-
 drivers/gpu/drm/qxl/qxl_object.h              |  5 --
 include/drm/drm_gem_ttm_helper.h              |  5 +-
 include/drm/drm_gem_vram_helper.h             |  7 +--
 13 files changed, 46 insertions(+), 104 deletions(-)

--
2.30.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
