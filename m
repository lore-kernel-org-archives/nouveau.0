Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3A4C88E54
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C5AF210F54C;
	Fri, 11 Sep 2026 08:52:34 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 267D04198A;
	Fri, 11 Sep 2026 08:35:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115710;
 b=CbAO8F+BoLD3XZqGJ4HqlrRSkUKFiaWKgJkKsgtcZs57q2Gx7J7qc81aVt8J9fLJSIlAF
 i1g7HyOwJfeNLCM9zXb2uhYO49eDGUZY175qaF1M+kzW5whraAOMHNHqiUudy5W1HdJQDn7
 /qiz8p3/Vei5vq0lkoD33Wnu5O6a6Y+O6aFyRJUj6zzYZcmt0yshZ8r36YuwjxFt9kRbQAL
 hviVY9srGS2E77ZZulgojqgRBzd4Rd/cVTu4oiHG3Z65Hywxekanw9DwI0bBchEK27I6SQS
 2SaobXG8/xLUVscJKM5spOHjSKys6m4KRfFghXNm/I1clHrKt6l0OK2OjLMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115710; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1VcAptmH0cqn69pXOdrWbq/K0mt4vJFrGdAfJperraQ=;
 b=iRASJwxhLYAbdpeymIhMQ2vHMegK+NXyzUaZYp6XPbW5KTDk474wH/rnGL8KwZ3Zwxge3
 eh0zkIsRoWhnRPGAJPQOAg1ebf1Q2ODNeD9r8/0JZlr569KXMQTcqpfx2pWEB7czS/msfnv
 hWrshugpEGbMJ0+sEBAXPXpDuAE4trW8KVCjWdKaZohvF6xHBKOIArBm+AJi7rJS9HEmOXQ
 qF7Cfa+3UHFQuFCySB42s4+0pBiSjBGD63AUW+W0p/EmtjE20UGj7XN8ltCowuEgKnf8rRG
 5e3FDFLCFTL7F+ZOWCoI5ra6S4+VGxDE4K13oma26OR+NWH9ri4YnJwIK9ug==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D700E40466
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C294010E7D0;
	Tue,  8 Sep 2026 14:46:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 43B9F43405;
	Tue,  8 Sep 2026 14:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A387D1F00A3D;
	Tue,  8 Sep 2026 14:46:58 +0000 (UTC)
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v4 00/41] drm/plane: Convert all drivers to
 atomic_create_state and remove reset
Date: Tue, 08 Sep 2026 16:46:31 +0200
Message-Id: <20260908-drm-no-more-plane-reset-v4-0-a31b3fcfc989@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XQPW7DMAwF4KsYmstCf7bsTL1H0EGxqERoLKWUY
 qQIcvfK8dAWhcdHgN8DeWcZKWBmu+bOCOeQQ4o16JeGjScbjwjB1cwklx3v5ACOJogJpkQIl7O
 NCIQZC3A9tNxridx4VrcvhD7cnvL+veZTyCXR17NoFst0NQ3fNmcBHBSXbug7j63nbx9IEc+vi
 Y5sQWf5A/VCb0OyQr10cuiUc0Lpf5D6BSmxDakKid6Y0VjbmoP6Az3Wuwk/r/WRZT2eHWxGGNM
 0hbJrFngKeYSItwJLH9QHcFWXH98vrXvkjQEAAA==
X-Change-ID: 20260629-drm-no-more-plane-reset-04950f42e07f
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8156; i=mripard@kernel.org;
 h=from:subject:message-id; bh=l37WHPmKc+pkVQCgzua1uuu+eJaWszMqVMVDI1COPuc=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDFkL5M9+N3zquIldctcjh6zVJ5NmOG1YUWOo2rHq8/q7p
 Zu6P/xZ1jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmYqvHWKchq3FG6ZWx2ie5
 v66F/x6m/m/vrtnPGt4wVbjJMlYwqCgh4+We7Unqft3C12ak/pPvYayvll+1y2BL6adFCRdf+oV
 3G2205BMV38l3xN6RiU+ea418wO6TJ323ShvvKbuzO57tyBcA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Message-ID-Hash: 5KEWYRLZARTR7AJOWIFUGOP3OZQF2355
X-Message-ID-Hash: 5KEWYRLZARTR7AJOWIFUGOP3OZQF2355
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 hamohammed.sa@gmail.com, louis.chauvet@bootlin.com, melissa.srw@gmail.com,
 alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, alison.wang@nxp.com, stefan@agner.ch,
 John Stultz <jstultz@google.com>, sumit.semwal@linaro.org,
 xinliang.liu@linaro.org, yongqin.liu@linaro.org, Frank.Li@nxp.com,
 Sascha Hauer <s.hauer@pengutronix.de>, festevam@gmail.com,
 imx@lists.linux.dev, kernel@pengutronix.de, victor.liu@nxp.com,
 anitha.chrisanthus@intel.com, paulk@sys-base.io, chenhuacai@kernel.org,
 jeffbai@aosc.io, lvjianmin@loongson.cn, wuqianhai@loongson.cn,
 xry111@xry111.site, zhengxingda@iscas.ac.cn, marex@denx.de,
 airlied@redhat.com, kraxel@redhat.com, spice-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, andy.yan@rock-chips.com, heiko@sntech.de,
 hjc@rock-chips.com, linux-rockchip@lists.infradead.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>, orsonzhai@gmail.com,
 zhang.lyra@gmail.com, alain.volmat@foss.st.com, rgallaispou@gmail.com,
 alexandre.torgue@foss.st.com, mcoquelin.stm32@gmail.com,
 philippe.cornu@foss.st.com, raphael.gallais-pou@foss.st.com,
 yannick.fertre@foss.st.com, jyri.sarha@iki.fi,
 tomi.valkeinen@ideasonboard.com, hansg@kernel.org,
 dmitry.osipenko@collabora.com, gurchetansingh@chromium.org,
 olvaffe@gmail.com, michal.simek@amd.com, harry.wentland@amd.com,
 siqueira@igalia.com, sunpeng.li@amd.com, linux@armlinux.org.uk,
 Dharma Balasubiramani <dharma.b@microchip.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 nicolas.ferre@microchip.com, alim.akhtar@samsung.com, inki.dae@samsung.com,
 krzk@kernel.org, kyungmin.park@samsung.com,
 linux-samsung-soc@vger.kernel.org, sw0312.kim@samsung.com,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, dakr@kernel.org,
 nouveau@lists.freedesktop.org, geert+renesas@glider.be,
 kieran.bingham+renesas@ideasonboard.com,
 laurent.pinchart+renesas@ideasonboard.com, linux-renesas-soc@vger.kernel.org,
 magnus.damm@gmail.com, tomi.valkeinen+renesas@ideasonboard.com,
 Biju Das <biju.das.jz@bp.renesas.com>, linux-sunxi@lists.linux.dev,
 samuel@sholland.org, wens@kernel.org, Zack Rusin <zack.rusin@broadcom.com>,
 bcm-kernel-feedback-list@broadcom.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5KEWYRLZARTR7AJOWIFUGOP3OZQF2355/>
Archived-At: 
 <https://lore.freedesktop.org/20260908-drm-no-more-plane-reset-v4-0-a31b3fcfc989@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is a follow-up to the bridge reset removal series, and part of a
larger effort to remove the reset hook from all KMS objects.

The plane reset hook is overloaded: it is called both at probe time
to create the initial software state and during suspend/resume to
reset hardware and software state. These two roles have different
requirements, and the reset hook is not fallible, making error
handling difficult for the initial state allocation path.

While reset has the semantics to reset both the software and hardware
state, the vast majority of implementations and all the helpers only
reset the software state, making them equivalent to
atomic_create_state in practice. The atomic_create_state hook makes
this explicit: it only allocates and initializes a pristine state
without any side effect, and returns the state pointer or an ERR_PTR
on failure.

This series first adds the necessary infrastructure in the simple-kms
and GEM atomic helpers, then converts all 51 plane drivers tree-wide
from the reset hook to atomic_create_state. The conversions were done
using a combination of Coccinelle semantic patches and manual
adjustments. Once all drivers are converted, the old helpers and the
reset hook itself are removed from struct drm_plane_funcs.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Changes in v4:
- Fix a NULL pointer dereference with vkms
- Rebase on drm-misc-next-2026-09-03
- Link to v3: https://lore.kernel.org/r/20260831-drm-no-more-plane-reset-v3-0-1877c7aa57b3@kernel.org

Changes in v3:
- Drop leftover state destruction in sun4i
- Rebase on current drm-misc-next
- Link to v2: https://lore.kernel.org/r/20260814-drm-no-more-plane-reset-v2-0-82d2963dd134@kernel.org

Changes in v2:
- Rebase on latest drm-misc-next tag
- Fix sashiko reviews
- Fix atmel-hlcdc breakage
- Link to v1: https://lore.kernel.org/r/20260709-drm-no-more-plane-reset-v1-0-302d986fe5f0@kernel.org

---
Maxime Ripard (41):
      drm/simple-kms: Remove unused reset_plane hook
      drm/vkms: Move frame_info into vkms_plane_state
      drm/vkms: Convert to atomic_create_state
      drm/gem-atomic-helper: Remove __drm_gem_reset_shadow_plane()
      drm/amdgpu: Convert to atomic_create_state
      drm/fsl-dcu: Convert to atomic_create_state
      drm/hisilicon/kirin: Convert to atomic_create_state
      drm/imx/dc: Convert to atomic_create_state
      drm/kmb: Convert to atomic_create_state
      drm/logicvc: Convert to atomic_create_state
      drm/loongson: Convert to atomic_create_state
      drm/lcdif: Convert to atomic_create_state
      drm/mxsfb: Convert to atomic_create_state
      drm/qxl: Convert to atomic_create_state
      drm/rockchip: Convert to atomic_create_state
      drm/sprd: Convert to atomic_create_state
      drm/sti: Convert to atomic_create_state
      drm/stm: Convert to atomic_create_state
      drm/tests: kunit: Convert to atomic_create_state
      drm/tilcdc: Convert to atomic_create_state
      drm/vboxvideo: Convert to atomic_create_state
      drm/verisilicon: Convert to atomic_create_state
      drm/virtio: Convert to atomic_create_state
      drm/xlnx: Convert to atomic_create_state
      drm/atomic-state-helper: Remove drm_atomic_helper_plane_reset()
      drm/amdgpu_dm: Convert to atomic_create_state
      drm/armada: Convert to atomic_create_state
      drm/atmel-hlcdc: Drop spurious csc_init call from reset
      drm/atmel-hlcdc: Convert to atomic_create_state
      drm/exynos: Convert to atomic_create_state
      drm/imx/ipuv3: Convert to atomic_create_state
      drm/mediatek: Convert to atomic_create_state
      drm/nouveau: Convert to atomic_create_state
      drm/omap: Convert to atomic_create_state
      drm/rcar-du: Convert to atomic_create_state
      drm/rz-du: Convert to atomic_create_state
      drm/shmobile: Convert to atomic_create_state
      drm/sun4i: layer: Convert to atomic_create_state
      drm/vmwgfx: Convert to atomic_create_state
      drm/atomic-state-helper: Remove __drm_atomic_helper_plane_reset()
      drm/plane: Remove reset

 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c           |  2 +-
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c    | 28 ++++++++-----
 .../drm/amd/display/amdgpu_dm/amdgpu_dm_plane.h    |  2 +-
 .../display/amdgpu_dm/tests/amdgpu_dm_plane_test.c | 30 +++++---------
 drivers/gpu/drm/armada/armada_overlay.c            | 39 ++++++++----------
 drivers/gpu/drm/armada/armada_plane.c              | 15 +++----
 drivers/gpu/drm/armada/armada_plane.h              |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c    | 33 +++++++--------
 drivers/gpu/drm/drm_atomic_state_helper.c          | 41 ------------------
 drivers/gpu/drm/drm_gem_atomic_helper.c            | 20 ---------
 drivers/gpu/drm/drm_mode_config.c                  |  4 +-
 drivers/gpu/drm/exynos/exynos_drm_plane.c          | 22 ++++------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c        |  2 +-
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c    |  2 +-
 drivers/gpu/drm/imx/dc/dc-plane.c                  |  2 +-
 drivers/gpu/drm/imx/ipuv3/ipuv3-plane.c            | 19 ++++-----
 drivers/gpu/drm/kmb/kmb_plane.c                    |  2 +-
 drivers/gpu/drm/logicvc/logicvc_layer.c            |  2 +-
 drivers/gpu/drm/loongson/lsdc_plane.c              |  2 +-
 drivers/gpu/drm/mediatek/mtk_plane.c               | 22 ++++------
 drivers/gpu/drm/mxsfb/lcdif_kms.c                  |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c                  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.c            | 15 ++++---
 drivers/gpu/drm/omapdrm/omap_plane.c               | 13 +++---
 drivers/gpu/drm/qxl/qxl_display.c                  |  4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_plane.c    | 15 +++----
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c      | 15 +++----
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_vsp.c       | 15 +++----
 drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c | 15 +++----
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c        |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c       |  2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c                    |  2 +-
 drivers/gpu/drm/sti/sti_cursor.c                   |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                      |  2 +-
 drivers/gpu/drm/sti/sti_hqvdp.c                    |  2 +-
 drivers/gpu/drm/stm/ltdc.c                         |  2 +-
 drivers/gpu/drm/sun4i/sun4i_layer.c                | 21 ++++------
 drivers/gpu/drm/tests/drm_kunit_helpers.c          |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_plane.c              |  2 +-
 drivers/gpu/drm/vboxvideo/vbox_mode.c              |  2 +-
 drivers/gpu/drm/verisilicon/vs_cursor_plane.c      |  2 +-
 drivers/gpu/drm/verisilicon/vs_plane.c             | 14 +++----
 drivers/gpu/drm/verisilicon/vs_plane.h             |  2 +-
 drivers/gpu/drm/verisilicon/vs_primary_plane.c     |  2 +-
 drivers/gpu/drm/virtio/virtgpu_plane.c             |  2 +-
 drivers/gpu/drm/vkms/vkms_composer.c               | 30 +++++++-------
 drivers/gpu/drm/vkms/vkms_drv.h                    |  2 +-
 drivers/gpu/drm/vkms/vkms_formats.c                | 48 +++++++++++-----------
 drivers/gpu/drm/vkms/vkms_plane.c                  | 36 +++++-----------
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c                | 17 ++++----
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.h                |  2 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c                |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c               |  4 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c               |  4 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c                  |  2 +-
 include/drm/drm_atomic_state_helper.h              |  3 --
 include/drm/drm_gem_atomic_helper.h                |  2 -
 include/drm/drm_plane.h                            | 12 ------
 include/drm/drm_simple_kms_helper.h                |  1 -
 59 files changed, 236 insertions(+), 381 deletions(-)
---
base-commit: 17c6b88e85ffe5de5720004ae8c2176d52944aca
change-id: 20260629-drm-no-more-plane-reset-04950f42e07f

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

