Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D86DC5DF7D
	for <nouveau@archiver.kernel.org>; Fri, 21 Aug 2026 19:50:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3373110F4D8;
	Fri, 21 Aug 2026 19:26:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SniKoX6M";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 900A147AB1;
	Fri, 21 Aug 2026 19:10:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787339411;
 b=XKYuSV5HaOTtx8/0ImgPJjUggej80sYJWzTIg7cELPui1WGXLICcJ7SNMjRt3hoqz6+S1
 bZEguxd/UoI+qVCiNPtEsyXVv8vvx0LI7jqTSpj8lV9YQiDOKYbVaMioCxQaJX4n8he2RTW
 /h/XtmnmjWFGlh5O48VY8OF1fmmMgf3Zb/O/od4C4WurFigM/Hm8LRyiRILmcyvMugPeMzH
 CzgUt0Kq+Mlq9ZzgDGo2W+ka9uiQLOdMEjhAE7pzRNdSoMY1G0VDJ3yedBBdzPytni3MSJV
 oRv8PVPOqLxugdK+JXtyJwW3++fSafdZgDZ0Q1bPgSm9XthjcdYyhQDgwI+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787339411; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IcYpvMnU+f4BloPrmC94lFULP58QvHDNnxfJki4ZTvo=;
 b=QUcHO58p6XOeMd8AQRG5UeLSydZVZnD+RoK7MHsY/evyx1X39oO/bN/i7SxnNtpgU7Rp5
 I+NT7lDsgDHTpyzaQYtsyFOZag28MFDUivcP5sJmliOH/SQuvZ+w3JumCG8aaicM2LgpgNn
 NuoCA9Rp/lyRZJhw1gFWHTKE4T5YZbB/d+kz6vuM0vBlefDTpQfym9ziAHhnGkQvl2LCl2O
 aSbKGgegqoBf68NYNrb9s5ZXwGpBVeBsrIRpHHpJZs7/6e1E0r2i5kaQeilounrEu6Nf1dX
 dRVxZeDZuMuckKNN9av/77SWWmD6h/W24BHMezKtKd14+JhzlQCEwzcvaRPg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=redhat.com;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C3B5F47A97
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 19:09:55 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com (unknown [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C04A510F47C
	for <nouveau@lists.freedesktop.org>; Fri, 21 Aug 2026 19:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787340364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=IcYpvMnU+f4BloPrmC94lFULP58QvHDNnxfJki4ZTvo=;
	b=SniKoX6M8EqEzhFxRPNP2GjyCdcDkflKVNzQWXuCe29hIaEiC7Ec18tLHepgKKCgcYiIGN
	o8fQDA2FizKJedzhBuOUEgGr0C1H103dHP0nfuRcHu2PJFh+fQpEI8N9u1gUULphn+1au1
	E7Xt1Vf5bBCOW9iwXchD2FBez8xagIE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-175-TPEhSOn1PcatEO2OR-pqVA-1; Fri,
 21 Aug 2026 14:12:18 -0400
X-MC-Unique: TPEhSOn1PcatEO2OR-pqVA-1
X-Mimecast-MFC-AGG-ID: TPEhSOn1PcatEO2OR-pqVA_1787335935
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 403A1195423A;
	Fri, 21 Aug 2026 18:12:15 +0000 (UTC)
Received: from GoldenWind.redhat.com (unknown [10.22.80.7])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id 64CE61955F70;
	Fri, 21 Aug 2026 18:12:12 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pci: Add broken-GPE quirk for Lenovo Legion 16APH8 and 16AHP9
 Nvidia GPUs
Date: Fri, 21 Aug 2026 14:11:59 -0400
Message-ID: <20260821181203.82722-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 7ZpffmYt8KhXkynFvCxsC_L8n1s0ju0dHQKy5HDXrko_1787335935
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
Message-ID-Hash: 2BZXYKODI243TTOYYCZTWO5KBFUKX62O
X-Message-ID-Hash: 2BZXYKODI243TTOYYCZTWO5KBFUKX62O
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Mark Pearson <mpearson-lenovo@squebb.ca>,
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2BZXYKODI243TTOYYCZTWO5KBFUKX62O/>
Archived-At: 
 <https://lore.freedesktop.org/20260821181203.82722-1-lyude@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On the Lenovo Legion Slim 5 16APH8 and 16AHP9, the firmware appears to enjoy
firing a GPE on the parent PCIe port of the nvidia GPU very shortly after the
GPU enters D3Cold. This means that every time the GPU is runtime suspended,
ACPI firmware immediately wakes up its parent PCIe port, which then wakes up
the GPU. Once it falls asleep again, the cycle repeats.

See: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905

Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
nova as well, and it even seems possible for this to happen without any
driver loaded.

This seems to simply be a bug. Luckily, there is nothing that we actually
need ACPI wakeup events for on the GPU. Events such as display connector
hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
affected by this quirk.

Reported-by: Ryan Brue <ryanbrue.dev@gmail.com>
Co-authored-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
Cc: stable@vger.kernel.org
Fixes: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
---
 drivers/pci/quirks.c | 76 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index b09f27f7846fc..4d1f1565b61d3 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6165,6 +6165,82 @@ DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x13b1,
 			      PCI_CLASS_DISPLAY_VGA, 8,
 			      quirk_reset_lenovo_thinkpad_p50_nvgpu);
 
+#ifdef CONFIG_ACPI
+#ifdef CONFIG_DMI
+static const struct dmi_system_id nvidia_dgpu_broken_gpe_quirk_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "16APH8"),
+		},
+	},
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "16AHP9"),
+		},
+	},
+	{}
+};
+
+/*
+ * On the Lenovo Legion Slim 5 16APH8 and 16AHP9, the firmware appears to enjoy
+ * firing a GPE on the parent PCIe port of the nvidia GPU very shortly after the
+ * GPU enters D3Cold. This means that every time the GPU is runtime suspended,
+ * ACPI firmware immediately wakes up its parent PCIe port, which then wakes up
+ * the GPU. Once it falls asleep again, the cycle repeats.
+ *
+ * See: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
+ *
+ * Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
+ * nova as well, and it even seems possible for this to happen without any
+ * driver loaded.
+ *
+ * This seems to simply be a bug. Luckily, there is nothing that we actually
+ * need ACPI wakeup events for on the GPU. Events such as display connector
+ * hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
+ * affected by this quirk.
+ *
+ * So, workaround this by disabling wakeup events for the parent PCIe port of
+ * the GPU.
+ */
+static void quirk_nvidia_dgpu_broken_gpe(struct pci_dev *pdev)
+{
+	struct acpi_device *parent_adev;
+	struct device *parent_dev;
+	int ret;
+
+	/* Just to be extra safe and make sure we don't try this on an eGPU */
+	if (pci_is_thunderbolt_attached(pdev))
+		return;
+
+	ret = dmi_check_system(nvidia_dgpu_broken_gpe_quirk_table);
+	if (ret == 0)
+		return;
+
+	pci_info(pdev, FW_BUG "GPU PCIe port has broken wakeup events, disabling\n");
+
+	parent_dev = pci_physfn(pdev)->dev.parent;
+	if (!parent_dev) {
+		pci_err(pdev,
+			"Can't find PCIe parent? Your Nvidia GPU will have broken runtime PM\n");
+		return;
+	}
+	parent_adev = ACPI_COMPANION(parent_dev);
+
+	/* The spurious GPEs will be sent from the ACPI device for the PCIe port this GPU is
+	 * connected to, so remove our PM notifier to turn them into a no-op.
+	 */
+	ret = acpi_remove_pm_notifier(ACPI_COMPANION(parent_dev));
+	if (ACPI_FAILURE(ret))
+		pci_err(pdev, "Removing PM notifier failed: %d\n", ret);
+}
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x28e0,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+#endif
+#endif
+
 /*
  * Device [1b21:2142]
  * When in D0, PME# doesn't get asserted when plugging USB 3.0 device.

base-commit: d3d1e0c4343385fb343a552e4f3b6b97d5762fc2
-- 
2.55.0

