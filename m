Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0B7606E562
	for <nouveau@archiver.kernel.org>; Thu,  5 Nov 2026 16:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xjm4H4Qm
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C0A8310F1F8;
	Thu,  5 Nov 2026 16:03:18 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0BC2C4908F;
	Thu,  5 Nov 2026 15:43:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793893432;
 b=bfGEDLm+NTXuEK6XyoDQFcJNrrO/0ZlgpZZ4pR5UT4AGMRg3eXoCwGaYF2YzPMocbT/9I
 QpT5D4BNjtrFwWL6+Aojv+EhqbS4BHMQf/Pl40ET4Q4C1RsNcI0j+y0bfb7GqDdtJoJ8RM4
 GaGafqkr+qtRpYWXJ/tbaH3unyDek3WK3pv77gM24wX5fE3TDVxcn5HcPyBP8S4XkW362Fx
 nCRqL0cDnjhVZ4ouL2XiSOprwu4stq3Y/SsxLjyYYPVrH0q127+kR31FFqur5dG59Q5GF83
 Ujpe+nrNbxEkwmC1OrALHzpyOL3gieWcN09bbbb+LyECe/BIblRy2lG462rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793893432; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=S79orR8sh/VRy4ZBp1BOwCOaPxQC8KlPYB0b3TyEp7o=;
 b=utmaeiylT7KxIcNeL0mw8+ubLaRSwEVyJYEH0MN4oMyIhzYuMcfwavQHkzFY3YO7peKBv
 NAl1W4B90ZqspQie85kPDnVCTNNqnOaSeqRNiUV929aNrcOhQ1QEeUKeDvQW/bQ/TUN/vWg
 xfO0sgvHVSh7v+IwtUDA+RkGqjbF71RDKruM15ygzIgd/7c7nf+JA0kQaJCzrEnM1r+7BEW
 CMOtQOqL+h68lrrrZ+TLlob1i5i6mcNVRmV+nwRqmJHwKv7JxfErn/GBqeYKFL8a8UIpeom
 Sj4LCJdBEw5zs84d717pagGQBgRYJVqRe+HmDTNkZHWVPMi84zpjLHCTaN1w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1694049076
	for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2026 15:43:50 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3B610EA3B;
	Thu,  5 Nov 2026 16:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793894591; x=1825430591;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Yt+X6muNHMLgu1O1MKYqnePC8ViPj2x2LzLKslrnZLc=;
  b=Xjm4H4QmuxFv7zQdoUQURuDuP2qujxfChU2/OgK4/HmZjlrxGzow0YXL
   kZRYwfzxlXG/JaNuhO1wxWFTj1N46dALHTzRcTqToBbD5z6hVtIUIAHgr
   ydGl4221E7Cj8g5Jq4YK3rJ+PdI4BVBe7blaY4erZtRtX0BpbhNiMmzt0
   yaY4zJ0vEEelV4VavsQuEi34B+UmoQFsu48WFP5QrubqMSCNS5O6MVqbJ
   DjwSQeXKyRmHYPWHL5YxUMHVvWCaaAI2UYo+B8HuX37QYMJT0NKCFPBF3
   H4ahk8+gk86dgdNJnQS2D2zuWs/ZT6VJyo5gReg0k0T6yy3SbUC0HyGM9
   g==;
X-CSE-ConnectionGUID: BE7R3PsCQjOP1R9e9ppxuA==
X-CSE-MsgGUID: 2HXMVV43TCubIkhO1bmn0g==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2706074"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="2706074"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:03:10 -0800
X-CSE-ConnectionGUID: 6jYhGjCnSxauTpJ2FDMGJg==
X-CSE-MsgGUID: mso2wZdGSna/GDMgWlYX+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400";
   d="scan'208";a="8795694"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO
 kvehmane-desk1.ger.corp.intel.com) ([10.245.244.200])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 08:03:04 -0800
From: Kai Vehmanen <kai.vehmanen@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/eld: Add drm_eld_set_port_id() helper
Date: Thu,  5 Nov 2026 18:02:39 +0200
Message-ID: <20261105160240.2850042-2-kai.vehmanen@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
References: <20261105160240.2850042-1-kai.vehmanen@linux.intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AUPWFMUVLAZMFVPFF642VG2RRFFTJYIE
X-Message-ID-Hash: AUPWFMUVLAZMFVPFF642VG2RRFFTJYIE
X-MailFrom: kai.vehmanen@linux.intel.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 linux-sound@vger.kernel.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 amd-gfx@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?q?Tom=C3=A1=C5=A1=20Hnyk?= <tomashnyk@gmail.com>,
 Wim Taymans <wtaymans@redhat.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Kai Vehmanen <kai.vehmanen@linux.intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AUPWFMUVLAZMFVPFF642VG2RRFFTJYIE/>
Archived-At: 
 <https://lore.freedesktop.org/20261105160240.2850042-2-kai.vehmanen@linux.intel.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-16.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The ELD baseline block reserves bytes 8..15 for a 64-bit Port_ID that
identifies the source port of the audio endpoint. drm_edid_to_eld()
leaves the field zero, and no driver fills it in, so it carries no
information.

When two identical monitors are connected, their ELDs are then
byte-identical, and userspace has no passive way to tell which HDMI/DP
PCM belongs to which DRM connector. The only workaround is to toggle
the connector audio property and watch which ELD goes away, which
disrupts the endpoint.

Add a helper that drivers can use to fill in Port_ID with a common
layout:

  bits 63:48 - PCI domain of the DRM device
  bits 47:32 - PCI bus/device/function of the DRM device
  bits 31:0  - DRM connector object ID

Userspace can read the connector object ID directly from KMS, and the
PCI address tells GPUs apart in multi-GPU systems. For non-PCI devices
the upper half is left zero.

The split between a 16-bit PCI BDF in the upper half and a per-device
display identifier in the lower half follows the Port_ID layout
documented for the AMD Azalia sink info registers in dce_audio.c.

Signed-off-by: Kai Vehmanen <kai.vehmanen@linux.intel.com>
---
 drivers/gpu/drm/drm_eld.c | 42 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_eld.h     |  3 +++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/drm_eld.c b/drivers/gpu/drm/drm_eld.c
index c0428d07de53..baebece7b4ed 100644
--- a/drivers/gpu/drm/drm_eld.c
+++ b/drivers/gpu/drm/drm_eld.c
@@ -4,7 +4,11 @@
  */
 
 #include <linux/export.h>
+#include <linux/pci.h>
+#include <linux/unaligned.h>
 
+#include <drm/drm_connector.h>
+#include <drm/drm_device.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_eld.h>
 
@@ -55,3 +59,41 @@ int drm_eld_sad_set(u8 *eld, int sad_index, const struct cea_sad *cta_sad)
 	return 0;
 }
 EXPORT_SYMBOL(drm_eld_sad_set);
+
+/**
+ * drm_eld_set_port_id - set the ELD Port_ID for a connector
+ * @eld: ELD buffer
+ * @connector: connector the ELD belongs to
+ *
+ * drm_edid_to_eld() leaves the 64-bit Port_ID field of the ELD baseline
+ * block zero. Drivers can use this helper to fill it in with a value
+ * that identifies the audio endpoint, so that userspace can associate an
+ * ELD, and the PCM device it belongs to, with a DRM connector, even when
+ * identical sinks are connected to multiple outputs.
+ *
+ * The Port_ID is stored in little-endian byte order, with the layout:
+ *
+ * - bits 63:48 - PCI domain of the DRM device, truncated to 16 bits
+ * - bits 47:32 - PCI bus/device/function of the DRM device
+ * - bits 31:0  - DRM connector object ID
+ *
+ * For non-PCI devices bits 63:32 are zero.
+ *
+ * The connector object ID is only stable for the lifetime of the
+ * connector, so userspace must look it up at runtime, and not store it.
+ */
+void drm_eld_set_port_id(u8 *eld, const struct drm_connector *connector)
+{
+	struct device *dev = connector->dev->dev;
+	u64 port_id = connector->base.id;
+
+	if (dev && dev_is_pci(dev)) {
+		struct pci_dev *pdev = to_pci_dev(dev);
+
+		port_id |= (u64)(pci_domain_nr(pdev->bus) & 0xffff) << 48 |
+			   (u64)pci_dev_id(pdev) << 32;
+	}
+
+	put_unaligned_le64(port_id, &eld[DRM_ELD_PORT_ID]);
+}
+EXPORT_SYMBOL(drm_eld_set_port_id);
diff --git a/include/drm/drm_eld.h b/include/drm/drm_eld.h
index 0a88d10b28b0..de0478720721 100644
--- a/include/drm/drm_eld.h
+++ b/include/drm/drm_eld.h
@@ -9,6 +9,7 @@
 #include <linux/types.h>
 
 struct cea_sad;
+struct drm_connector;
 
 /* ELD Header Block */
 #define DRM_ELD_HEADER_BLOCK_SIZE	4
@@ -80,6 +81,8 @@ static inline int drm_eld_mnl(const u8 *eld)
 int drm_eld_sad_get(const u8 *eld, int sad_index, struct cea_sad *cta_sad);
 int drm_eld_sad_set(u8 *eld, int sad_index, const struct cea_sad *cta_sad);
 
+void drm_eld_set_port_id(u8 *eld, const struct drm_connector *connector);
+
 /**
  * drm_eld_sad - Get ELD SAD structures.
  * @eld: pointer to an eld memory structure with sad_count set
-- 
2.43.0

