Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC674606A320
	for <nouveau@archiver.kernel.org>; Tue, 10 Nov 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BTmEFNoD
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45E0610F4DE;
	Tue, 10 Nov 2026 21:23:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F06C7491F4;
	Tue, 10 Nov 2026 21:04:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794344657;
 b=JVNCE7zR206gaT9j4dyaN0lHUM0LTDkA+I1SPLAWsRT+wl/VVcUki9OqZpw0LdTwtkwI3
 pzPcoMpOll89J6iL9qr1BXGaSH3YT2G9sb9LzD0WHlMtGngKtaTnJ+WodXNUfj7LWt2PrVO
 AFoJsbX/QdyxwWAyRidMFVj/UJpmNIJFPvajYOLE1i4bZ9JXAqN3bSY46DgeJ1VifN+ItXL
 1YKug2+PEZjDIFk9AsYd5MpwRqDtJsT/aAefoS97o1/GHXQ2Kah9SOOO7TVpRWvgLfJS6qx
 EZqZlUbHaPlPflbfQsi/WCfGb9zX3Kpk6muyntDOcxXXdl9iGv31Qk1u+TdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794344657; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
 b=YZ2bIrZKm99oRCM53ivue1EcIaKFBEMojgAZnVSL+9IHUNvAWsQAKb79At1JMEVFqHAXr
 +04QrtjVuOU7MzFuzYx1nxhQKME3BSB0kpNJue1rNh++3fM3QU+DJgncaPcGkhQ67YIg6Pi
 Qz4y3N7h7bEEWSajIyTxgtRgzQB2D62ygfgUQYXCIOfrPrPzaWBzRnrfoNZ48rdEvlaJ3Z3
 ADpkDuI+1AhzQZW+zMGred2rYhG7ICefv2tzt0rPAS/0XADu+oBhfD+ZdwyBVnLGMofE45i
 JHlx/AWr+53O9SALRsj2zVgEartytkpbITXS06ho9P3VrI3BH8342WvEcqig==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4E2B4491E7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 21:04:15 +0000 (UTC)
Received: from mail-oi2-f8.google.com (mail-oi2-f8.google.com
 [74.125.231.200])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 67F1110F4AB
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 21:23:47 +0000 (UTC)
Received: by mail-oi2-f8.google.com with SMTP id
 5614622812f47-53c4858eb76so1055693b6e.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 10 Nov 2026 13:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345826; x=1794950626;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
        b=BTmEFNoDPTHiwZCmteQsr+L/vxYwMwZwrtFgBx5fKjgUnPbJxmnxhg3xqi8uMzpc1j
         +R9+NOEYGc65iGT2dRxWqgXNurTRsErF21VqtXLj3pV9muSQfzIm/aQeVDZ0YFB7NoL7
         nt2ckYjFfIRMcGV9xIJ/14OXm1ih8Kpnwj+lzkl53IfAKHZnT6UNxXZe7Z/9fVDtBAFb
         v4UoyXHgCNAlQOs/PG5K4Gzu1D+nNUma6q+/wqGpIP1Rxtukn5ZWEM1rj5RVshOUs+XP
         oFfYsEC0Ged8m5znzrUH1mBqEdzuc3GSTeIz7zn2pKHllbBzf9pKEFQy3grDa+63Uy5g
         ahGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345826; x=1794950626;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
        b=tfZGuyHydN6aZAhgYE4V93VmhcGWfxOtn+DVcRr+UNXYaIJh+PNUkvcANDl9n8mp4b
         O30cFls474xM0Ue0pCV7gU+ft40u3ej0nJZbsVVZh+VczOSCrwkXhYZwRyc/BCPEK014
         g20KplCk6G+WM8eHgHTFMu8oMDU0sYGFBBNSe7jm408AeyCjL4HnXarVXF1HWDSYx7P8
         Tq/xnktahuuPEbsUZd5IlT0AS0G9tCG6MGEDLXyzoBtZ2ROqsI8dAtRsli1Hy5tzK6+g
         gUJ+klhmc8z5CT3wnJzAr/l6RWUQFZMwyLOhuH045PIJHmPXefNYJTAM4eeUXwEn+S8z
         HIHQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHYbn9DxfJpATSuih1tHzjeOSq6mbrrsvgl1Qb77cN8630dauNyKAbcLm8E8TmPW3LdXzaHiFTm@lists.freedesktop.org
X-Gm-Message-State: APuU4Z8aQz0Y2tZFI/xh6R9fpV261TziS5ph4B21goeisdi3J95PjFwO
	jjINbsu6P8h7wnuX91KzY1lbQZ+lpggayZgKa7SiKxALlLntkmr97Duu
X-Gm-Gg: AYBFou1gMOv69tVaQKWo6QqfadblUOOaqmEvIriXlMeoOPVilVwuvhDvp53MXoh9JGI
	dg8G/Nco+B9FlqRZS58JWpmwt+hbAAoSd+PqFHdoLeuWV6D3sOPZ35V143OC1KVx7ixda5wftVy
	mxffYbLm3sXkIUq2H4ftTeM0SQm4/vVJbHy220JIlBkGbIy511JfcnYFnLRCVYzl1XD5sX10ZEL
	bp9peQTCVYLcLaL7502J3/I3NG28RRi4hJ7+XJq4l6e7NpcZRxhNKOVVgbQQDsNEyoFOahxeFVI
	dUeEcOO5PxMSj3Z4nH49WqSh14kWsiA8yfZYD1dUpTK1rJtHZUSai3Wy3ogRK9Idadmuxsg87es
	KAS2nQ2HxYS96QGO+1wWfurhsEGHbpK/vGYaqmZwU3uDD25CeZy1S4/mInNhO7FvOugNVVEkr3K
	F/ojjWV0EXcvw1DLpWHuA9UK3ORgDT1xB0pIQiN8j1bTLuncQneP99fIPkZhkd2fJyCxhTPB/JB
	gZRnTCXuk/B9SvihoMhbPfCqti8W7c66DhXPwyvOWKYNlueaHke9mvu4cNtwdeJDKTR15qwsUy+
	1sEPKeJF4WP//shB1OYMQz706w==
X-Received: by 2002:a05:6808:c3ea:b0:4ab:230c:5faa with SMTP id
 5614622812f47-56b963a7115mr210675b6e.18.1794345826045;
        Tue, 10 Nov 2026 13:23:46 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id
 5614622812f47-5690504c276sm3229558b6e.4.2026.11.10.13.23.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:23:45 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 15:23:44 -0600
Subject: [PATCH v4] pci: Add broken-GPE quirk for some Lenovo Legions with
 Nvidia GPUs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-broken-gpe-legion-v4-1-3668ce0c2efd@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32OQQ6CMBREr9L8td+0pWBh5T2Mi1p+oQrUtEgkh
 LsbMHHpcpKZN2+BRNFTgootEGnyyYcBKqYODGxrhobQ11AxkFwWgvMcbzE8aMDmSdhR48OApS2
 dPplcl9rCgcEzkvPvnXm5fnN63e5kxw20NVwMPY5tJPNjcy2F5Lzgp2MhRaYECuzmV03nSHVrx
 qMN/TZtfRpDnHffKdsu/qlNGQp0qnSqyGulyZ6b3vhuh13Xdf0Ap2dkPP8AAAA=
X-Change-ID: 20261005-broken-gpe-legion-9c9f87a5898c
To: Bjorn Helgaas <bhelgaas@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794345824; l=6414;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=4fzh2Kt6hyJZoUipRYGxY1lLhGP5S0v640iNKn5d27A=;
 b=BreNeT4+5sRjWVoRkW2qHGfabP2EUtz4OE0rjq6itQKYCjr7cFCA+NpiP84bvcym91Vki98hM
 81kllDoWdsfCN/wa1RID/Ws+3CTH0kaYEW50aB9mvRfV9V82p0OPCD2
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
Message-ID-Hash: C7D3CPNCWRGVLO6G7HJZ6E2BD5BIIUR5
X-Message-ID-Hash: C7D3CPNCWRGVLO6G7HJZ6E2BD5BIIUR5
X-MailFrom: ryanbrue.dev@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>, linux-pci@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C7D3CPNCWRGVLO6G7HJZ6E2BD5BIIUR5/>
Archived-At: 
 <https://lore.freedesktop.org/20261110-broken-gpe-legion-v4-1-3668ce0c2efd@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Lyude Paul <lyude@redhat.com>

On certain Lenovo Legion devices (including the 16APH8, 16AHP9, and
15AHP9), the firmware appears to enjoy firing a GPE on the parent PCIe
port of the nvidia GPU very shortly after the GPU enters D3Cold. This means
that every time the GPU is runtime suspended, ACPI firmware immediately
wakes up its parent PCIe port, which then wakes up the GPU. Once it falls
asleep again, the cycle repeats.

Note, this bug doesn't require Nvidia's driver. It happens on nouveau and
nova as well, and it even seems possible for this to happen without any
driver loaded.

This seems to simply be a bug. Luckily, there is nothing that we actually
need ACPI wakeup events for on the GPU. Events such as display connector
hotplug events in D3Cold come through as ACPI_VIDEO events which aren't
affected by this quirk.

Reported-by: Ryan Brue <ryanbrue.dev@gmail.com>
Link: https://github.com/NVIDIA/open-gpu-kernel-modules/issues/905
Co-developed-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
Signed-off-by: Lyude Paul <lyude@redhat.com>
---
Bjorn, please pick this up if it looks good. Derek J. Clark graciously sent
a message to the Lenovo team on my behalf, but noted that the Legion side
of the business doesn't have a fully fleshed-out Linux team, and that Mark
has been helping out in their free time.

I imagine this patch has been missed by them. The patch has been tested by
many users in the linked issue, and I have been running it personally since
the patch was made.
---
Changes in v4:
- Rebased onto v7.4-rc2. No functional change.
- Ccing stable, as well as other addresses I missed when taking over the
  patchset from Lyude.
- Link to v3: https://patch.msgid.link/20261005-broken-gpe-legion-v3-1-f49f465d48ec@gmail.com
Changes in v3:
- Add the Lenovo LOQ 15AHP9 to the quirk table (@jindalpratik on GitHub)
- Also match Nvidia RTX 4070 Max-Q (0x2860), which similarly refuses to
  stay in D3Cold (@inigo001 on GitHub)
- Link to v2: https://patch.msgid.link/20260821200607.621341-1-lyude@redhat.com
Changes in v2:
- Don't forget to actually use parent_adev with acpi_remove_pm_notifier()
- Check if parent_adev is NULL (could happen if booted with acpi=off), just
  consider it a no-op if it is.
- Base the patch off Linux master instead, I based it off drm-misc-next by
  mistake because I'm too used to working on DRM drivers :).
- Link to v1: https://patch.msgid.link/20260821181203.82722-1-lyude@redhat.com
---

Tested on all the modified Legion devices. The Nvidia dGPU properly goes
into D3Cold with the patch, whereas without it, the dGPU will wake up
shortly after going to D3Cold. See the linked open-gpu-kernel-modules
issue for more details.
---
 drivers/pci/quirks.c | 88 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 7f1f47ea2ee4..c2269c367279 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6336,6 +6336,94 @@ DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x13b1,
 			      PCI_CLASS_DISPLAY_VGA, 8,
 			      quirk_reset_lenovo_thinkpad_p50_nvgpu);
 
+#ifdef CONFIG_ACPI
+#ifdef CONFIG_DMI
+static const struct dmi_system_id nvidia_dgpu_broken_gpe_quirk_table[] = {
+	{
+		.matches = {
+			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "15AHP9"),
+		},
+	},
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
+
+	parent_adev = ACPI_COMPANION(parent_dev);
+	if (!parent_adev) /* No ACPI? That means no GPE, and nothing to do here. */
+		return;
+
+	/* The spurious GPEs will be sent from the ACPI device for the PCIe port this GPU is
+	 * connected to, so remove our PM notifier to turn them into a no-op.
+	 */
+	ret = acpi_remove_pm_notifier(parent_adev);
+	if (ACPI_FAILURE(ret))
+		pci_err(pdev, "Removing PM notifier failed: %d\n", ret);
+}
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x28e0,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+DECLARE_PCI_FIXUP_CLASS_FINAL(PCI_VENDOR_ID_NVIDIA, 0x2860,
+			      PCI_CLASS_DISPLAY_VGA, 8,
+			      quirk_nvidia_dgpu_broken_gpe);
+#endif
+#endif
+
 /*
  * Device [1b21:2142]
  * When in D0, PME# doesn't get asserted when plugging USB 3.0 device.

---
base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
change-id: 20261005-broken-gpe-legion-9c9f87a5898c

Best regards,
-- 
Ryan Brue <ryanbrue.dev@gmail.com>

