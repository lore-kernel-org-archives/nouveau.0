Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211B3ECD9A7
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5D6D10E0FF;
	Thu,  5 Feb 2026 21:00:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="HcrNBNOs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1102541B49;
	Thu,  5 Feb 2026 20:51:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324667;
 b=BUvEAzZqhqoKDB6M9R5lsczwT7d8OSfPBWfEnXaGEVQOBj2BiBgDy6PdfUCm/ZfyPBL5g
 yZxuwBSjpXQwpYByIqYyeUt8ZJHSiRvzd9Zj9l7K7SOWl/JpCLbBrz8/JYVUoJ2ZH/86bJX
 J3tJonoVZD4LZ9AYiwdiw4kVrSFGikIo0+zk5EhSIXdwGa0Xv5dUq09Vu4z7xIvTxPPO0Pr
 vYklPmKOoW7soHSX2uMxgHifRIRR/XbWYolPpCWEIvzLHHrFtTbLjV2JwGQL2uMs02ZziLR
 1WX/gqZ9AAjEslLB7J9KvnYjQ6lVrm/2sR8hrrxTdWzg4vmhwsN1dJQ38e5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324667; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aJ0fgGiJg3nMFc2XePDEX8wab9GDsnp8jWnAJ4AGTN4=;
 b=JL+IP/SuwS9GaHLshShyHN8YQF0lZ9v7CrmxCsjCsMvHcT1lP/SMm+SlKRi4CqgRmkwkz
 KBlAzKUozSbB4lEEXRZyWPf6FgEhNel7JOJmYPNBMJYyeRCeDJNWZUgubOrQag00uVPOUuf
 4tWA0my6axEgxvak0ugYBfLxcIowV+T0NXW9GcFM6Tc6X/hrB3xX5fqODWFm2L9zlycDVrR
 kjjUGXGdeqFEP9BwhbybtL5XDfL5xqaqOdX6tlKDvBIEC6wYeRY400YzjN3J8SOm55lshw6
 sirQ7gV243e+W14MjoyLoF/9A456eyxrH3+TmMhg76srTZRjhcNcdUrLwfNg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D82BC402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC4710E0E9
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325225;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aJ0fgGiJg3nMFc2XePDEX8wab9GDsnp8jWnAJ4AGTN4=;
	b=HcrNBNOsVHnd7GD5R9PzIhpDt7c9hUdbXkBbKPX7kUX0Av56Mqtca0RO1V1I16fIWsoLlR
	aToCASNHofPgyfke3sLXA3efjWwOq20zj+wh9utoUqh+jkqqFU9QEAFenbSVwutDyT8w3o
	zETUzDJidpw5dyjFTmKlVKaSFUSiEnE=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-jkKGMOIjPf22U_iGXXdtTA-1; Thu, 05 Feb 2026 16:00:22 -0500
X-MC-Unique: jkKGMOIjPf22U_iGXXdtTA-1
X-Mimecast-MFC-AGG-ID: jkKGMOIjPf22U_iGXXdtTA_1770325222
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c6a2ef071dso594078985a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325222; x=1770930022;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aJ0fgGiJg3nMFc2XePDEX8wab9GDsnp8jWnAJ4AGTN4=;
        b=XG4BGDe7Sdl8WOTg7iLgmYf7BFROVthunTfgGKjfylsjOgzSFcbb5ioEgesKemHVSu
         jUHxAPkU5dm/kCyu8tdrA3oK2bdT66qoR7whvf8MqBU3HSlBhYZfjuRVCzwlIK3y+Z7K
         S+ZTp9DXark2PHmQ/LG6kLJwxRVLRcrblxT7P45wIjUVn65HCMf1ke/AONtn+abyAR2O
         8NncwtqHfIx+2jJy1v7KYc7bw6kyFAkJmBi93HE+fUzV05jEwy2chKJ5t9bc02YZaZt2
         3f1NQaTNqMbOs1o8NzsC5DQsiZHMjiZNbTkPn7ZRMP/hK/ofIbVszOB1jYC3PyI8gpcD
         fkCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW++DoGGkeOfmPgLKZ6iKLL9rCXHsodgw746YKBz/P4Hvzvrcprc6W9VEvaLXGGSlkoqDpKmjJv@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBZ9AxMHbkILLtOtdBkHNJJKT4ikYnpddOI3M5yM4cX23RQG/q
	QsefKRgfD+RtoqGLZRl98OwaYtfm8rzmiCbB6qVk8BXDz2MqQ0tOV0Gg0Ubq/3l+sklfqzZel2u
	DaVfnmODy1vMWz6TEo/1LpmqHWoA5jffuIvNAp/KWPMDblHduHPamA3SWHlGhbkjrUIs=
X-Gm-Gg: AZuq6aJm4iyQqS9Tm2FMR1PGMPXZK0dbZFuf497AhWvnXEGTUnbQmvZ2H3xaeTnMXyV
	3F8jTbNIJmvedwcEoh2Xw/2FHuPzZJ2nSVO89q7WcVfdBt6jxps0ERE22n3jrETSQqGtyvKnYcK
	ENi4kjQotnh0Axil8c3H1jQ5t7g4JVhcpVgkDC8LPfAdFzvUa06Sc4YTxbQI0PRrAtR8nzAqxzt
	b6VF8QTBPZH7RNy4tP7NosLZeGxXOHzbaHbrzik53CD2vh2luo212A2fkLDQ5//VA/wEi/AY9rJ
	3k/hTgrC6kbSULMV360OlrQXHZsNRRbhVfUbm9kPcf5ikWVfA6Fgyr3Pcmd08hFN7DVWnTKUuWm
	xbABd0gBocvqwDoA=
X-Received: by 2002:a05:620a:7085:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8caf0d3d77cmr64314085a.44.1770325221606;
        Thu, 05 Feb 2026 13:00:21 -0800 (PST)
X-Received: by 2002:a05:620a:7085:b0:8b2:e70c:427a with SMTP id
 af79cd13be357-8caf0d3d77cmr64305385a.44.1770325220994;
        Thu, 05 Feb 2026 13:00:20 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:20 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:48 -0500
Subject: [PATCH v2 01/10] PCI: add driver flag to opt into disabling SR-IOV
 on remove()
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-1-ef9400c7767b@redhat.com>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
In-Reply-To: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
To: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
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
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>
X-Mailer: b4 0.14.2
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: JL3r3Htc1OZOZ-ZW5i_i-dWD8R_3JKbMQKJuQWb9u_U_1770325222
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: NAAZ5KEHZGNWEBYGDUIEEOJRRLXFDEIT
X-Message-ID-Hash: NAAZ5KEHZGNWEBYGDUIEEOJRRLXFDEIT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NAAZ5KEHZGNWEBYGDUIEEOJRRLXFDEIT/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-1-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a flag managed_sriov to the pci_driver structure that allows a
driver to opt into disabling the Single Root I/O Virtualization (SR-IOV)
capability of the device when the driver is unbound.

Add a new function pci_iov_disable() that is invoked before the remove()
callback of a PCI driver and checks for the presence of the new flag.
If the flag is set, invoke the sriov_configure() callback to allow the
driver to gracefully disable SR-IOV. Warn if the driver fails to do so
and forcibly disable SR-IOV using sriov_disable().

Since a (broken) driver may theoretically re-enable SR-IOV during its
remove() callback, extend pci_iov_remove() to forcibly disable SR-IOV
after remove() if needed and only if the flag managed_sriov is set.

Altogether the flag ensures that when a Virtual Function (VF) is bound
to a driver, the corresponding Physical Function (PF) is bound to a
driver, too, since the VF devices are destroyed when the PF driver is
unbound. This guarantee is a prerequisite for exposing a safe Rust
API that allows a VF driver to obtain the PF device for a VF device
and subsequently access the device private data of the PF device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Move logic to disable SR-IOV on remove() from Rust to C.
- Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
---
 drivers/pci/iov.c        | 41 ++++++++++++++++++++++++++++++++++++++++-
 drivers/pci/pci-driver.c |  3 ++-
 drivers/pci/pci.h        |  2 ++
 include/linux/pci.h      |  8 ++++++++
 4 files changed, 52 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/iov.c b/drivers/pci/iov.c
index 00784a60ba80bb55ff2790d8f87e15a90c652a24..5b6ed251b4b1e940ec5781bb10dd5c58d3609fc8 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1011,20 +1011,59 @@ void pci_iov_release(struct pci_dev *dev)
 		sriov_release(dev);
 }
 
+/**
+ * pci_iov_disable - disable SR-IOV before PF driver is detached
+ * @dev: the PCI device
+ *
+ * Invoke sriov_configure() callback to allow the driver to gracefully disable
+ * SR-IOV. Warn if the driver fails to do so and forcibly disable SR-IOV.
+ */
+void pci_iov_disable(struct pci_dev *dev)
+{
+	struct pci_driver *drv = dev->driver;
+	struct pci_sriov *iov = dev->sriov;
+
+	if (WARN_ON(!drv))
+		return;
+
+	if (!dev->is_physfn || !iov->num_VFs || !drv->managed_sriov)
+		return;
+
+	if (!drv->sriov_configure) {
+		sriov_disable(dev);
+		return;
+	}
+
+	drv->sriov_configure(dev, 0);
+
+	if (WARN_ON(iov->num_VFs))
+		sriov_disable(dev);
+}
+
 /**
  * pci_iov_remove - clean up SR-IOV state after PF driver is detached
  * @dev: the PCI device
  */
 void pci_iov_remove(struct pci_dev *dev)
 {
+	struct pci_driver *drv = dev->driver;
 	struct pci_sriov *iov = dev->sriov;
 
+	if (WARN_ON(!drv))
+		return;
+
 	if (!dev->is_physfn)
 		return;
 
 	iov->driver_max_VFs = iov->total_VFs;
-	if (iov->num_VFs)
+
+	if (iov->num_VFs && !drv->managed_sriov) {
 		pci_warn(dev, "driver left SR-IOV enabled after remove\n");
+		return;
+	}
+
+	if (WARN_ON(iov->num_VFs))
+		sriov_disable(dev);
 }
 
 /**
diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index 7c2d9d59625868886d61d8d4045d656ee0165776..e44593c67d147cd70d2d1a8a436a26857b0e446a 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -462,6 +462,7 @@ static void pci_device_remove(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
+	pci_iov_disable(pci_dev);
 	if (drv->remove) {
 		pm_runtime_get_sync(dev);
 		/*
@@ -475,8 +476,8 @@ static void pci_device_remove(struct device *dev)
 		pm_runtime_put_noidle(dev);
 	}
 	pcibios_free_irq(pci_dev);
-	pci_dev->driver = NULL;
 	pci_iov_remove(pci_dev);
+	pci_dev->driver = NULL;
 
 	/* Undo the runtime PM settings in local_pci_probe() */
 	pm_runtime_put_sync(dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 0e67014aa0013a7086c3a45d576d4b1ca2bb159f..53692e138ed347bfcf6d5923ddd418e9860399d7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -826,6 +826,7 @@ static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 #ifdef CONFIG_PCI_IOV
 int pci_iov_init(struct pci_dev *dev);
 void pci_iov_release(struct pci_dev *dev);
+void pci_iov_disable(struct pci_dev *dev);
 void pci_iov_remove(struct pci_dev *dev);
 void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
@@ -860,6 +861,7 @@ static inline int pci_iov_init(struct pci_dev *dev)
 	return -ENODEV;
 }
 static inline void pci_iov_release(struct pci_dev *dev) { }
+static inline void pci_iov_disable(struct pci_dev *dev) { }
 static inline void pci_iov_remove(struct pci_dev *dev) { }
 static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
 static inline resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index b5cc0c2b99065d4a1ee4581275362e79726a2145..768a02b12ff73aeb4dc3dc33fcca7c46b524c3c0 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -997,6 +997,13 @@ struct module;
  *		how to manage the DMA themselves and set this flag so that
  *		the IOMMU layer will allow them to setup and manage their
  *		own I/O address space.
+ * @managed_sriov: Disable SR-IOV on remove().
+ *		If set, the Single Root I/O Virtualization (SR-IOV)
+ *		capability of the device is disabled when the driver is
+ *		unbound from the device, by calling sriov_configure()
+ *		before remove(). The presence of this flag guarantees
+ *		that when a Virtual Function (VF) is bound to a driver,
+ *		the Physical Function (PF) is bound to a driver, too.
  */
 struct pci_driver {
 	const char		*name;
@@ -1015,6 +1022,7 @@ struct pci_driver {
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 	bool driver_managed_dma;
+	bool managed_sriov;
 };
 
 #define to_pci_driver(__drv)	\

-- 
2.52.0

