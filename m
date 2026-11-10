Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B79F606A320
	for <nouveau@archiver.kernel.org>; Tue, 10 Nov 2026 21:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RCWrf7xW
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9DF10F0E4;
	Tue, 10 Nov 2026 21:24:30 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3F36C491FA;
	Tue, 10 Nov 2026 21:04:53 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794344693;
 b=iUY3w3TMX73b9WqA6P6iqNpausn1vD+DXubvolb8RWHx2bqPdRyGx7x2aTVDLIIlbqowT
 wZSLciDpGRP6/XVlh2ISkSgpRUqYDnQOMT9czDY4N8tRk9YHbi2E4buSXvKsscQieuIymYN
 An8tGqCjB0ct8cZwwtzvpWBF46Ptk5ake9RGt4x4Now50Pe6oMeWyiqK9viGKim5rCwdIAn
 5IZou479eRvdSZ8HHM7E5b1bMekjNZCZE1efP5HpWLzjanXZr+WpevDzDaX5FUfJGynaEnO
 KY88UYuakGjZV8fci0lzdLuCFhJfWc2ACC4Uci1I/5C4jbSxU29u8J6arU7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794344693; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
 b=ozgQgDOCXQSXnvrvEqbMu65i10xX4L8PNpX7s3SHGL13iiYzCVx67qZgtzaJ4tieXdbIy
 o7A2Bj0GjW8FH3JxRqoprsLbmKI56BhH8H/M9afBXeqomAWIGZSo+OlhzNzcRF+0Hq2eW7T
 sygVr4zzao7I0zfSdyJCO/6i1/4CfwW0otDeIoF6ygJVmmqzTQImCT7lSdg4Ea6N3m7mSQn
 bStFJEvL9blpa1Rv4v8TS/GLsrV9DbZR/WUJBTqn2Loy5CT+j9NwWYVZV9yZwXUdh98Q4yb
 7GILkvDEclHfhsY6SOcEGJiTROKujP6N0WfTuYANLzU2f0hB+JvYYxrzI1SQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 875D5491E7
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 21:04:51 +0000 (UTC)
Received: from mail-oo2-f5.google.com (mail-oo2-f5.google.com
 [74.125.231.133])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A339010F006
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 21:24:23 +0000 (UTC)
Received: by mail-oo2-f5.google.com with SMTP id
 46e09a7af769-8458555b6a8so794190a34.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 10 Nov 2026 13:24:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794345863; x=1794950663;
 darn=lists.freedesktop.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
        b=RCWrf7xWgEeisPORpJliRFfYcu3KfDfKADqy18FZDZK1FC0UFiyXI9+ZZFQRfi2FYI
         pqZNABLfUCv0mbXKF4pF2wIiDxeCo40Z1mhSo6dCaQDGJAeTcaOzGBOizg8p3SKO32g6
         lCKXGu+m8WXAl+jCigR5rti5GkpRiFfH0itKU9icjJbPOYn3ccpDV+oL5XmWAmGF78y+
         qS2ebry87QumSyZaHKZ/20H6k3j9nWVHMNpITS21U024k6WZXit4NOlaMl0jbuRVLGhW
         aZE5l6dF6jkjJyEH8x3eU02ffjBj5xzDBiOGF6bv6g87CSSh+vi9NyDvnhPJXqvPF72+
         epyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794345863; x=1794950663;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=WjjLn9OW/dh8Ooz1Del+NUReCfrVoH+dbIK19cMu41M=;
        b=S7Mohhfqezsk/nyGF0KKX4k5pVFL5+JEdlH5o0LgU4rIpXK1C9/U2A5EEXtKo8y5qd
         ygNWHvayCgL30fGhxA+yj0/iKBdTd8lxDJWydtkoKm1aKlDW32b+Z8xapRu9gV29L6Us
         pMQj00E4blBCR08cy/Zr8O6vxjbmtXcGbLk8Rtl/JDQBq/PqM30t8ChbLOig4dNeEBYe
         HbM8/19xDGQcaspOyJC1cPJcyof7ugg6nMJ4o38Wsd0aoWCTM2ECFYuzMT3DdON3TN39
         ir7LA5068DLFLyhUbtUbyCcBURfsl/7MWKDQReunW3bu6I4XVGjpZKIuxtQ3KUqKjNyf
         2RkQ==
X-Forwarded-Encrypted: i=1;
 AL+hErHU9UsIUroWIXeIbyINHHaxiW8H/WFjyxxdf+zevFBhhJChVxR5dKYwW+fGfDxlMl2+CZ5/Zzv1@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+J7gnn0C2igaUytW9O0LmjWz/ubjeQ1YdApks3SBNQyO04MSiF
	/sjJRhEho1saiNcadaCUww7ixDSMHcIVEY3D+vNyJLnHr3GVTS+7kDDp
X-Gm-Gg: AYBFou1n4SZt6SSm9jZeZwdoNCYoDPa8JfxCnTE3aV1zVecuC9lR9DaOKXQJr/tfoA1
	A4ycv/GsWY7J+EspHr/QsoroPTo1XVk/zR2PYwe6v/K46RgKTnzq8UtBUNkYoKlFsMP1Tj+ZKr9
	/PC5nceSI93/tmNtmXlqENShNw2YS6Jxi4zywR+Azuf3adDAz8fvdIHZFJcPPrANW3acRVh2ejO
	Nkn4u4FWrRZYdmkvDIVvPG04EVe9d7hijH0VAeDu0P8mF/doDvtFTVkgNQ1HwOkFh5ygz+d/az1
	/u1RuOJ8WYEqlPC7ELibHTM3ZnBwCzf2rDajUjgkueO4xAIqzpQHoJGjQSCHXFKecciTyqrsKQM
	V+e9lXh3kN88hicZDJbXejAWGY1l5M38GluEyrbS+UKhnutA8MzbaPULGrmM3EO29qLsbCVLcUC
	K0O57C6ErVQ/Fq229kP+F6oX7X2awStRmQ7whRMGlcRwDjCh0hHPPSW6IYsiCjeUzrXVdFODvO2
	k+WXbJlGVJJofIMq2tLamXaiWfSIPjf3uU/Q7D7P7qhhcAr67bdBL56Gt4vhUgGB85AgiqfNUgk
	vkaHhYD44mRK1i6s01dDEoAn9Vi+Ntn3+Fjd1Os/k531VQ==
X-Received: by 2002:a05:6830:4424:b0:80b:6f52:3629 with SMTP id
 46e09a7af769-860f25e8e97mr185419a34.1.1794345862778;
        Tue, 10 Nov 2026 13:24:22 -0800 (PST)
Received: from [192.168.18.164] ([2600:8804:5716:d800::f01a])
        by smtp.gmail.com with ESMTPSA id
 46e09a7af769-860dcb5f7b4sm2845528a34.4.2026.11.10.13.24.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 13:24:22 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Tue, 10 Nov 2026 15:24:16 -0600
Subject: [PATCH v4] pci: Add broken-GPE quirk for some Lenovo Legions with
 Nvidia GPUs
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-broken-gpe-legion-v4-1-c672bb1c4d91@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/32OQQ6CMBREr9L8td+0pWBh5T2Mi1p+oQrUtEgkh
 LsbMHHpcpKZN2+BRNFTgootEGnyyYcBKqYODGxrhobQ11AxkFwWgvMcbzE8aMDmSdhR48OApS2
 dPplcl9rCgcEzkvPvnXm5fnN63e5kxw20NVwMPY5tJPNjcy2F5Lzgp2MhRaYECuzmV03nSHVrx
 qMN/TZtfRpDnHffKdsu/qlNGQp0qnSqyGulyZ6b3vhuh13Xdf0Ap2dkPP8AAAA=
X-Change-ID: 20261005-broken-gpe-legion-9c9f87a5898c
To: Bjorn Helgaas <bhelgaas@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794345860; l=6414;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=4fzh2Kt6hyJZoUipRYGxY1lLhGP5S0v640iNKn5d27A=;
 b=9YJQTspVWw3SNIHz6DL8fo+E22qGFlOGPsa0xkwd+6tDhnlXfgCbGXQcYPGp4N3hDZTZY7I7z
 YY7fTaOLSYWCVHkiWRKOfP4aVMy0h7QLlgwP6QYEzPL6vHuIQCvyKv/
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
Message-ID-Hash: 3MIXCSM2IFODZWUK22P4N64E2ZKAW5KQ
X-Message-ID-Hash: 3MIXCSM2IFODZWUK22P4N64E2ZKAW5KQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3MIXCSM2IFODZWUK22P4N64E2ZKAW5KQ/>
Archived-At: 
 <https://lore.freedesktop.org/20261110-broken-gpe-legion-v4-1-c672bb1c4d91@gmail.com/>
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

