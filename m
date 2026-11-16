Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E05606A31C
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JiiRgnob
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 383A910ED91;
	Mon, 16 Nov 2026 09:11:51 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C3E7449339;
	Mon, 16 Nov 2026 08:52:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794819121;
 b=ToSbHB/kB+/vbR/lPEHVqA06Rm9BY51v5UwSnOMWY9ypjb2M9IZwz7ymoognDedZ75uS5
 eUvutur8KhemGCgWaxmDQwXOA/YqO58Osd4nMuvKh3VSYxANYPL3vNikR0Zp6+3ADLOAjBB
 C6+f60mqecChsvC19tCu0eKYkUV91W8SIfYtlDanmI4y8ivr4Y4s2u5IKiiAsec9+LxFQc4
 U5vkl140r3zga/1zacBPS2LQIDBIg92McrNVUwRB1ZjnXfKO1wa2CANshr/L/F3uhRsTU40
 /UsNYKCpMYWl7i02kMIv1vSS/LwKm78rv9uiZF3A1fthyup1CZbjaJytD70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794819121; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LPHb1V9vKbxe+F/1gdos/NIGm5OwnSAkFwKpkBR/LCE=;
 b=rray5pSbMJ5xmbVQPPp9N/q81+yPbEKfPf7JdDraizLyEsdRG2Wxo/CQWyj2OM4bABewa
 lq+X1BZGZy6/Y++TaA1SWgv2o7eVgFcLUPlCJh2jRzkc62b3LVrdIa2vKxjuuwqQfRPklQO
 pyNnuVfamffdDapRN+KuCMWuQOZ7Q8KPSxAyAOily7pKvkYqoJWfjCxduGU6zM+PEI3c5nY
 3taq095eOUHxkxH4R4oPj3XnWpj/EHxCXo9Nf/WwSDZyG9zodWDsMipluLvsagVY72bKvcN
 f1gzDVfmSL9M/dZuUjRrQ+o12NswlXS3ERv6+dnczg0ZKpiWNZdh/utEp2ww==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=intel.com header.i=@intel.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used Org Domain Record) header.from=linux.intel.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0596645E2E;
	Mon, 16 Nov 2026 08:51:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0DC4110ED7C;
	Mon, 16 Nov 2026 09:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794820302; x=1826356302;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=l353EF9EPl54Khh5AMtA/qBDbCWKicb1AKbM4kMTiUU=;
  b=JiiRgnobXQY/vsywjXjWEHZe2DOZDejuwek9/2OJLOdp5kBDuOW1BEEh
   ws32kyiQ2SHFy9JMN6wtztGsDBrsFwvr7EbbP1Jn2q79gN4Ll2468zKM7
   JL4GvEpvJhiknGtRl0JbzaJA22I8oHLl41w0ya/6mj8yQoEuWcaT0tdJM
   VWHRTc+BBoLI9lIGBYG2merIFRN56A1Vdb+7Km2+RZFK9CnZdS70CtdPI
   fW82dchUAgf8R+OoKmklLtLg0EJg29sJE8nUYyY6GWDmsPeZ2JhnngCs0
   bi+tOSdUO0jfYtXAA4s1do6QAM48EWQAXQWkcANXS7nUP3aOTzttrha+O
   A==;
X-CSE-ConnectionGUID: 4ViDgMiCR2iLBiyiiRsvqA==
X-CSE-MsgGUID: vcZHJIQtQWy6Qe/q5AuiaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3441636"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400";
   d="scan'208";a="3441636"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:11:41 -0800
X-CSE-ConnectionGUID: oDjVyYydS6al3Wos2dGXfg==
X-CSE-MsgGUID: 8mptrhgqRVSxBju7Y/d8gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400";
   d="scan'208";a="9636207"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:11:33 -0800
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/12] drm/atomic: Try to make atomic+async usable,
 and clear up the "async update" helper confusion
Date: Mon, 16 Nov 2026 11:11:18 +0200
Message-ID: <20261116091130.13950-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park,
 6 krs Bertel Jungin Aukio 5, 02600 Espoo, Finland
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AZYB6OHSYUUHOR7I6R7A6TVWWIYIKM5O
X-Message-ID-Hash: AZYB6OHSYUUHOR7I6R7A6TVWWIYIKM5O
X-MailFrom: ville.syrjala@intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Erwin Springer <aot.lerwin@gmail.com>, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Christopher Snowhill <chris@kode54.net>,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Dmitry Baryshkov <lumag@kernel.org>, freedreno@lists.freedesktop.org,
 Gustavo Padovan <gustavo.padovan@collabora.com>,
 Huacai Chen <chenhuacai@kernel.org>, Icenowy Zheng <zhengxingda@iscas.ac.cn>,
 Jianmin Lv <lvjianmin@loongson.cn>, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-tegra@vger.kernel.org, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Maxime Ripard <mripard@kernel.org>, Mingcong Bai <jeffbai@aosc.io>,
 nouveau@lists.freedesktop.org, Qianhai Wu <wuqianhai@loongson.cn>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Simon Ser <contact@emersion.fr>, wayland-devel@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@kde.org>, Xi Ruoyao <xry111@xry111.site>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AZYB6OHSYUUHOR7I6R7A6TVWWIYIKM5O/>
Archived-At: 
 <https://lore.freedesktop.org/20261116091130.13950-1-ville.syrjala@linux.intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The weird uapi semantics of the atomic async flip support make it
really hard for drivers to implement. Try to fix that by filtering
out the no-op junk from the commit that userspace likes to put there.

Also a lot of people are apparently confusing the
.atomic_async_{update,check}() hack with async flips. The two
are completely orthogonal, so try to clear up that mess by
renaming the hack to .atomic_bypass_{update,check}().

TODO: atomic+async is in serious need to proper tests, somehow
      all that seems to have gotten skipped when the feature
      was added :(

Cc: amd-gfx@lists.freedesktop.org
Cc: André Almeida <andrealmeid@igalia.com>
Cc: Boris Brezillon <bbrezillon@kernel.org>
Cc: Christopher Snowhill <chris@kode54.net>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org
Cc: Gustavo Padovan <gustavo.padovan@collabora.com>
Cc: Huacai Chen <chenhuacai@kernel.org>
Cc: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Jianmin Lv <lvjianmin@loongson.cn>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: linux-tegra@vger.kernel.org
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maíra Canal <mcanal@igalia.com>
Cc: Manikandan Muralidharan <manikandan.m@microchip.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: nouveau@lists.freedesktop.org
Cc: Qianhai Wu <wuqianhai@loongson.cn>
Cc: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: Simon Ser <contact@emersion.fr>
Cc: wayland-devel@lists.freedesktop.org
Cc: Xaver Hugl <xaver.hugl@kde.org>
Cc: Xi Ruoyao <xry111@xry111.site>

Ville Syrjälä (12):
  drm/atomic: Remove tall tales about tearing vs. "async updates"
  drm/atomic: s/async/bypass/
  drm/atomic: Add FIXMEs around the incorrect use of the
    .atomic_bypass_check() for async flips
  drm/atomic: Highlight that bypass commits need care
  drm/atomic/uapi: Eliminate the confusing
    drm_atomic_check_prop_changes()
  drm/atomic/uapi: Improve the async flip property rejection debugs
  drm/atomic/uapi: Document the non-obvious fence/fb_id prop behaviour
  drm/atomic/uapi: Add a FIXME about colorop vs. async flips
  drm/atomic-helper: Mark drm_atomic_crtc_state_for_each_plane_state()
    unsafe
  drm/i915: Complete no-op "async flips" by hand
  drm/atomic/uapi: Make async flips a bit more palatable through atomic
  drm/atomic/uapi: Extract {connector,crtc,plane}_async_flip_check()

 .clang-format                                 |   2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  12 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   |  20 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_plane.h   |   6 +-
 .../amd/display/amdgpu_dm/amdgpu_dm_trace.h   |  16 +-
 .../amdgpu_dm/tests/amdgpu_dm_plane_test.c    |  32 +--
 drivers/gpu/drm/arm/malidp_crtc.c             |   6 +-
 drivers/gpu/drm/drm_atomic.c                  |  97 ++++++++
 drivers/gpu/drm/drm_atomic_helper.c           |  49 ++---
 drivers/gpu/drm/drm_atomic_uapi.c             | 208 ++++++++++++++----
 drivers/gpu/drm/drm_crtc_internal.h           |   9 +
 drivers/gpu/drm/drm_self_refresh_helper.c     |   4 +-
 drivers/gpu/drm/i915/display/i9xx_wm.c        |   2 +-
 drivers/gpu/drm/i915/display/intel_display.c  |  38 ++++
 drivers/gpu/drm/i915/display/intel_display.h  |   4 +-
 drivers/gpu/drm/loongson/lsdc_plane.c         |  18 +-
 drivers/gpu/drm/mediatek/mtk_plane.c          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c     |   2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c    |  12 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c   |  12 +-
 drivers/gpu/drm/tegra/dc.c                    |  18 +-
 drivers/gpu/drm/vc4/vc4_hvs.c                 |   2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  16 +-
 include/drm/drm_atomic.h                      |  10 +-
 include/drm/drm_atomic_helper.h               |  20 +-
 include/drm/drm_modeset_helper_vtables.h      |  50 +++--
 29 files changed, 482 insertions(+), 201 deletions(-)

-- 
2.56.0

