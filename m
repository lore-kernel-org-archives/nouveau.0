Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF62EDEBF8
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A878F10E8E3;
	Tue,  3 Mar 2026 21:15:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OCESQA4c";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 18C8344DB0;
	Tue,  3 Mar 2026 21:05:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571922;
 b=pE4Wp+4ggRIE4acOdCzfaxKocAjJW8N7TaPVfTmicdDpfawwvAzJ47Bb2/phiCB2aF6fg
 KGpCO/cbWImT7tawmMLnXP7EKJBU6icrZOk7cgM9E9TWPP8XsZMydu6BBj3vXejQ/C786uT
 Go1QWpMNUdzACe01lKYTxNV/uedX5UYCHNxdK8FeoqnY+Bb2DddM/i9q/9/qYpSCU9tbpVx
 aceya3SiRoFGU5Ss2I8E8WS9oE2mEe2KXUeyDVJegA0IGp2ZboufjC2sHrSqeKTuflemwxt
 gWcp8fJoIO/MoPUnaOYZ4cBng9CoyDEEg/W/NP8Z+4gonP05S8rdA9GNLH4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571922; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
 b=kM+dXJWQFAzlsHM2hC6TL0ktSsKqwJhZW/bxPoeN+NtKIkC+SwcLSgcttPS0OiOIfwIPD
 43wxb8bmnpUnG8Owng8fHS/092Oquejs8fIyW2Y9X0GCblcPtqRqSnjMPeRLb2CBo8QIRfl
 TweE4Tjha2PaIKs4KS8vV3d2gb7lu/WeW7kFOK3vBLFNoK7jTZM1ch4bUwLS4LuA87Ot68U
 wu9EkiA0gi+WpbvOHH/89n8F8HPMtCy+gXavd7qvOg8kEaxpUuBeRANVZgoqEAe5TM0Udtq
 nfJDtEL47A+raKd2l93NGFC872xVSB73PIcjcA3rhskOCooXbK4zExMtwYPQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 895ED44DB0
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:20 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D72A110E8CF
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
	b=OCESQA4clh8Axb1EjczquFMRnGOxVQ0eJn0FXweTVNSIxFkuzc2tNJ9bFvcsjNAOLNxk9z
	Tzwha96xnUDt8Puun9MztQK61kbNN+O9W/1yep/mDbg01mbH1wtQMk3u13R44FXdv7jg+o
	TRHQ8bldEBnrh6Kg+VGFCL1XExIfl38=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-9eDBv1xXOY6-JbyNStXgDQ-1; Tue, 03 Mar 2026 16:15:37 -0500
X-MC-Unique: 9eDBv1xXOY6-JbyNStXgDQ-1
X-Mimecast-MFC-AGG-ID: 9eDBv1xXOY6-JbyNStXgDQ_1772572536
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-5033b62efa7so456789611cf.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572536; x=1773177336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=irBf4YUdN1+vibh8PKUSXKnT1yGXKOqgKyvxp0mJGPY=;
        b=NGEY2i+uK9z2770n1C+OM71N+Aek/HKk3k5LsxD739LPAMWe0A56mx7ieCuOtJE1R6
         d7C/VsRtup42iGVdEO3sRMOoeXOjyOSH7EnUACGNePwiy4XMXNVgqCTGFeVU9VYUGK1R
         Qn2BhxhNAigeRPltU8Ue6EGVmRS43VJ3781kFQ9+9w1v6xUYi9Xyhw3ePHoynwkZSzq7
         B1Usb0jgbr6O61FAEqpLgdtuzAwEGBLJXhL7Zalf+sOczYgn88xEGluU7adxcTstyy3y
         R6KUkETWRQEKMlUM9LMUAD+D+TrfiGzETxc1XjmfIII8pSVKw7y/iLhu5fsnT9KtChYE
         mWkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpr5Ejr4irufedtTF25DZqOE6iFyJs+NkkTvZpQHHWgbnm/obTHQydcjIf6VaIeQQbsTmxR9y8@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw+wbR208besmVtHAKtF0FyH1NCVafYXQYi8fjjW9mNi1E9Qvfx
	WQsNZc2VYFtYAdbvAYWnpi5EyAl25y/JDHp670o9DwGKp2PaEa2WjMAy3ICT8kT4Mi9UHxrXMip
	/NSvhaPVN4m2kIzjbImY0Mswp0/9bRADP8mhx4aKgdfCsLkqXxtOPJy767jJGKskflnA=
X-Gm-Gg: ATEYQzyC12xDTGlX4c8/FMyUp534a9/pmGlfQx7ICn4qLuq/fncVjPvLp4pqpVFLB9m
	DChv2PEjcSAoclamqXZULCNHguATUMQbGmQk7A2AsjA/aXpcFdkfUShr3GquVbzva+2VaIuWpkw
	e6l5At41oUvsXB1Rq293Egqe+MBEiUznIJaS7Vv7AhD+w3F7vV3abfJKcRkhx+cyxOXrJ8Ro5hx
	65xIxDH2R8EujDIJoNw5M57BEz6h7+cWaC7odnhtVzGmORe/Ss8JE8wqAOFfkYDHKystjw97yoS
	59gTKcQUgVoT1EBwY6Cq6zZytKuM5YOMkN+5r1I1b9GbMjKOidYFkbUW9s3rTXWDWpDDXuXKuUP
	NVQ1fmhaTztjkzBbRqBP7WN34Vw==
X-Received: by 2002:a05:622a:1891:b0:502:9abb:c919 with SMTP id
 d75a77b69052e-5075287910dmr225478201cf.10.1772572536442;
        Tue, 03 Mar 2026 13:15:36 -0800 (PST)
X-Received: by 2002:a05:622a:1891:b0:502:9abb:c919 with SMTP id
 d75a77b69052e-5075287910dmr225477351cf.10.1772572535732;
        Tue, 03 Mar 2026 13:15:35 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:35 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:22 -0500
Subject: [PATCH v3 02/10] fpga: dfl-pci: set driver flag to disable SR-IOV
 on remove()
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-2-4443c35f0c88@redhat.com>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
In-Reply-To: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nN6hxCqn8kv4He5FdPHZSKlMOj7D2NJe7ae5zdZLck8_1772572536
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: HOKU6N6UCASY7UYNSKP53RKTJS6X6PMA
X-Message-ID-Hash: HOKU6N6UCASY7UYNSKP53RKTJS6X6PMA
X-MailFrom: pcolberg@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HOKU6N6UCASY7UYNSKP53RKTJS6X6PMA/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-2-4443c35f0c88@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Set the flag managed_sriov in the pci_driver structure to show how a
PCI driver may opt into disabling the Single Root I/O Virtualization
(SR-IOV) capability of the device when the driver is removed.

Merge the function cci_remove_feature_devs() into cci_pci_remove().

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Demonstrate flag managed_sriov for dfl-pci driver.
---
 drivers/fpga/dfl-pci.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
index e25205c6d8f00cec579016acade28e743812c924..2410e6f3efe100a635eebfdb21f28f62a3759890 100644
--- a/drivers/fpga/dfl-pci.c
+++ b/drivers/fpga/dfl-pci.c
@@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
 	return 0;
 }
 
-static void cci_remove_feature_devs(struct pci_dev *pcidev)
-{
-	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
-
-	/* remove all children feature devices */
-	dfl_fpga_feature_devs_remove(drvdata->cdev);
-	cci_pci_free_irq(pcidev);
-}
-
 static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
 {
 	unsigned int i;
@@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
 
 static void cci_pci_remove(struct pci_dev *pcidev)
 {
-	if (dev_is_pf(&pcidev->dev))
-		cci_pci_sriov_configure(pcidev, 0);
+	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
 
-	cci_remove_feature_devs(pcidev);
+	/* remove all children feature devices */
+	dfl_fpga_feature_devs_remove(drvdata->cdev);
+	cci_pci_free_irq(pcidev);
 }
 
 static struct pci_driver cci_pci_driver = {
@@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
 	.probe = cci_pci_probe,
 	.remove = cci_pci_remove,
 	.sriov_configure = cci_pci_sriov_configure,
+	.managed_sriov = true,
 };
 
 module_pci_driver(cci_pci_driver);

-- 
2.53.0

