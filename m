Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39440C5CFCF
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 20:36:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C53EF10F4EC;
	Fri, 14 Aug 2026 20:36:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TWIL7uLY";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3849C477E2;
	Fri, 14 Aug 2026 20:19:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786738784;
 b=H2YM9AgJbqkw5a1fkou0OUmlaZWiwoowCFuvJ8PUxI1Q7OjutYWw8XZdmGf46IPnJz8FS
 eQGRDqlimBlNMt8jGcAZhCdMcZdXMYLrVypIqU/HzSxa3CupVcNeUqf7Ho+WZSpuykzO0/g
 UvKHhKkh7kIpoRjl682EQVKBSd3kc/CVDwjzF3d5JHRdM/kE6obJcO2nVJuXcfqP1pYKbyn
 cvYjxKzyOq/9uHqaBQ3zPxdZh1mCe1BIR/XkLAWPcPfG7hghjZOM3ktW/pykNe4ynIT2Ewk
 4v6d57pEzl9QSlpvevHpb3Bvako7vtrY0h8PGW+vxnqlQSQF6jyfraNoVELg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786738784; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XmXy8TGZMtUdUflzhbcwpO5PBzlQNsR1Xi5VVFI9N3E=;
 b=JXD8ebcI4jH1KRO5p4aDkSObnRdJrCozFu8WKuv24k5frzT9jqAQmkQtsxUUma3NOiXK5
 y+gDQq1sYtwoBOEkD1pcsDQhFRCuxUtC6OvHv+4g/NUvTijpMXwIhLJZOdpXaMlNURLUOA3
 dcV/Z6cxxtSCip+PfwAfpIy8NTnWzF5WTsVmgKfidDgP725WUwFBs8IWK14CsD1cJHrJ2eK
 rnkeUkXkTWPjEloBuVn04krGBk5qvItZdazV33RNUteJgapvjNzNSF1YQV/zgzusG/MhYjI
 AT3PPbbeXQKtn75ZBJaCibXUuiOgkKQ2rvIRvYRZnTfx1kEJM8MwAVCwIoiQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A55B5400C5
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:19:40 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E0D5910E5A7
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:36:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786739762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=XmXy8TGZMtUdUflzhbcwpO5PBzlQNsR1Xi5VVFI9N3E=;
	b=TWIL7uLYoy7YvCD8dgTsuQSzkL9Ob3VrEjz2aQB9ICJXssTwslakwB5v+2uYWJcV6m50OG
	wfZZOR5jRNdliVmL1H3A0I2H1pWR/frDdDfmgReunQ6t8K7ADDezVQGNNxEYI1nAQOUKfJ
	S+4wFh5IBc/AJmXhNRVBdThhr9Ut5Sk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-500-zePa_GbsMtmTsuH5SevbYw-1; Fri,
 14 Aug 2026 16:35:54 -0400
X-MC-Unique: zePa_GbsMtmTsuH5SevbYw-1
X-Mimecast-MFC-AGG-ID: zePa_GbsMtmTsuH5SevbYw_1786739751
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id D6B6219560AE;
	Fri, 14 Aug 2026 20:35:49 +0000 (UTC)
Received: from GoldenWind.lan (unknown [10.22.64.233])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 02CAB197750F;
	Fri, 14 Aug 2026 20:35:44 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-samsung-soc@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	intel-gfx@lists.freedesktop.org,
	linux-aspeed@lists.ozlabs.org,
	linux-rockchip@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-mips@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	spice-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH 0/5] drm/vblank: Enforce all-or-nothing vblank support
Date: Fri, 14 Aug 2026 16:35:28 -0400
Message-ID: <20260814203542.1405135-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: DKjcxoHagZhdzl-vBR86OXmB_vHmWlBoENfEE5aG7RU_1786739751
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: JKEERU5IZHLFL3H5ANLWFGGSQ2N54HHS
X-Message-ID-Hash: JKEERU5IZHLFL3H5ANLWFGGSQ2N54HHS
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JKEERU5IZHLFL3H5ANLWFGGSQ2N54HHS/>
Archived-At: 
 <https://lore.freedesktop.org/20260814203542.1405135-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One of the oddities with DRM that is leftover from the old days is how
vblank support is implemented by drivers. This has caused some minor
issues for the rust bindings for KMS which could be worked around.
However, it seems like a much better idea to fix this on the C side.
Those oddities are mainly:

* There's nothing in the vblank core that actually ensures that all
  CRTCs implement vblank support if one of them do. On Rust's side, we
  can't have this and have to ensure either the whole device has vblank
  support or not - otherwise it would be quite painful ensuring we don't
  expose vblank methods to drivers that can't use them.
  This additionally means such a situation would lead to UB.
* There is a second variable for keeping track of the number of CRTCs
  and it's kind of broken and confusing. Even worse, we currently allow
  the vblank API to allow a driver to specify a different number of
  CRTCs then it actually has.

So, let's just go ahead and fix this across the whole tree, and enforce
that a driver must either implement hardware vblank support for all
CRTCs or no CRTCs.

Lyude Paul (5):
  drm/vblank: Add drm_device.has_hw_vblank
  drm/vblank: Remove drm->num_crtcs
  drm/vblank: Remove num_crtcs argument from drm_vblank_init()
  drm/vblank: Use drm_for_each_crtc() in drm_vblank_init()
  drm/vblank: Require all CRTCs implement vblank support in
    drm_vblank_init()

 drivers/gpu/drm/adp/adp_drv.c                 |  2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c      |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v10_0.c        |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v6_0.c         |  2 +-
 drivers/gpu/drm/amd/amdgpu/dce_v8_0.c         |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  2 +-
 .../gpu/drm/arm/display/komeda/komeda_kms.c   |  2 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/armada/armada_drv.c           |  2 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
 drivers/gpu/drm/drm_vblank.c                  | 60 ++++++++++++-------
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 drivers/gpu/drm/gma500/psb_drv.c              |  2 +-
 drivers/gpu/drm/gma500/psb_irq.c              |  4 +-
 .../gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/hyperv/hyperv_drm_modeset.c   |  2 +-
 .../drm/i915/display/intel_display_driver.c   |  3 +-
 drivers/gpu/drm/imx/dc/dc-kms.c               |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
 drivers/gpu/drm/imx/ipuv3/imx-drm-core.c      |  2 +-
 drivers/gpu/drm/imx/lcdc/imx-lcdc.c           |  2 +-
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
 drivers/gpu/drm/kmb/kmb_drv.c                 |  2 +-
 drivers/gpu/drm/logicvc/logicvc_mode.c        |  2 +-
 drivers/gpu/drm/loongson/lsdc_drv.c           |  2 +-
 drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
 drivers/gpu/drm/meson/meson_drv.c             |  2 +-
 drivers/gpu/drm/msm/msm_kms.c                 |  2 +-
 drivers/gpu/drm/mxsfb/lcdif_drv.c             |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
 drivers/gpu/drm/nouveau/nouveau_display.c     |  2 +-
 drivers/gpu/drm/omapdrm/omap_drv.c            |  2 +-
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/qxl/qxl_display.c             |  2 +-
 drivers/gpu/drm/radeon/atombios_crtc.c        |  4 +-
 drivers/gpu/drm/radeon/radeon_irq_kms.c       |  2 +-
 drivers/gpu/drm/radeon/radeon_legacy_crtc.c   |  4 +-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  2 +-
 drivers/gpu/drm/renesas/rz-du/rzg2l_du_kms.c  |  2 +-
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  |  2 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 +-
 drivers/gpu/drm/sprd/sprd_drm.c               |  2 +-
 drivers/gpu/drm/sti/sti_compositor.c          |  2 +-
 drivers/gpu/drm/stm/ltdc.c                    |  2 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/tegra/drm.c                   |  2 +-
 drivers/gpu/drm/tidss/tidss_kms.c             |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
 drivers/gpu/drm/tiny/bochs.c                  |  2 +-
 drivers/gpu/drm/tiny/cirrus-qemu.c            |  2 +-
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/vc4/vc4_kms.c                 |  6 +-
 drivers/gpu/drm/verisilicon/vs_drm.c          |  2 +-
 drivers/gpu/drm/virtio/virtgpu_display.c      |  2 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  3 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c          |  2 +-
 drivers/gpu/drm/xlnx/zynqmp_kms.c             |  2 +-
 include/drm/drm_device.h                      | 10 +++-
 include/drm/drm_vblank.h                      |  2 +-
 64 files changed, 114 insertions(+), 92 deletions(-)


base-commit: 568d4cb5dcc5ec4e22975699b6ea67a30806884c
-- 
2.55.0

