Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46D29EDEBF6
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4C33110E8DC;
	Tue,  3 Mar 2026 21:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="KsqeXmYs";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B442944DB9;
	Tue,  3 Mar 2026 21:05:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571920;
 b=kfVfpQhLkPGYy6KrT7/Xo+C/fr53TZovDJ5UZnGRJZKakdkzKSqFwFeteXAFrcgQ1hD6r
 edYOXGbFBFFaIzXu/MNBUR9sv9a5kWGyNay/fwarLXKZEPKqLPhfWFZJOj4ruWFPWj72jN5
 EmhapNcqzr2nJFXi2bcecFujcMI5Q7cv4BxiIcbUjc7glvBHqzU9siNeDPtNr89lFrhpnew
 y/S4mUmFObilB46/d/ZrpoREsOtknS26jhxBzmBWIL4TnM3euQIhYVJ0Srg+rEo2N324knW
 8JYax88XJX5R76yYc9wvsFLMe7jxKqwyZem0eOzHfMH9EG5WHD7fyc5ISCxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571920; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0eBeiZqE9TXbxZv4w/1cPbOmShRF2lMY9/B+OMDvXLw=;
 b=RT2hy7drpraOnOcLLa4483bCX7tj5FpLq0o97jv6SKd0X3tAdwXY/STQ8R+Te7r6v3Dhv
 Do6BbFEsaYHLLtnctwqbmbP6dYeDYbDkGOK8eD6ajYbxBpCj8ZtJz9dal5z6IuM6bAp2yCA
 Yl6FJcuzJ+LLj5MQJEcMRC53n5CFp8hwYdGVvvWDmDbW4O6tz3u56S1UBccmS2lFErDrfHH
 etjNUUyCMkXqahC+x9fLi4hPPczQVAU+kNgSdOQ4aQTcOUWBP//1ozidpBoiNHU8Kcxyq47
 2MTFS4impoNN6I8aZtekDRz/Ig8fiDfsShBm4xc0l9otFOPQH5AEWUlulrUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5B1EA44DA3
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:18 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AA44A10E8CE
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0eBeiZqE9TXbxZv4w/1cPbOmShRF2lMY9/B+OMDvXLw=;
	b=KsqeXmYs19oLNt/fKJR7xlLsjGxnkv4I1zH5KRXnkBUMVtH3uYfG7fRyVNBuVRaM6X/JYv
	yDA0wLzt7atqZCgePy9cpkqrD7Ub3cEYBGaDmOfnQbkZZPKa9d5/i9/DBYL/NNnrG2/VIv
	9PycSl8bzR2mDBkessw0HQIWcJkZ/YA=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-xZQTySrlM2qaah7UQTHlfw-1; Tue, 03 Mar 2026 16:15:34 -0500
X-MC-Unique: xZQTySrlM2qaah7UQTHlfw-1
X-Mimecast-MFC-AGG-ID: xZQTySrlM2qaah7UQTHlfw_1772572534
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-506b4005ab7so666655031cf.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572534; x=1773177334;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0eBeiZqE9TXbxZv4w/1cPbOmShRF2lMY9/B+OMDvXLw=;
        b=msp7NYD5y/b5X/WpxGO+10VbR24vj3WZ5AahqkVAh7BBytS+1wr3awiBwwaxY3D2Ow
         kex8KAFx+Rz7JTXNcWBX9Tn2NYYLS4RJajkgTq1zGiS9ID/FFJhq1Icr+1kn3Ymi1P2M
         yH5aFggZ+XQmWH6BVwOfvyYhl1f88qFYRI/k5mhu/oLjFuOw3vPB5V9sfU725efJ0wWw
         DQUJprDGVhSoBQfsi2Fh+APNGiOWvuiUHq/sjEGKIoURs+0GS1ohXE8Zw5L5nDbARe77
         ErDuu8NfcKL6R6TiYd1nxFG7bOgnjmG5DRHOMupUSGhcs70xeqfr0cgqYOrApLThA6xx
         qJqw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwEad429rizDpNj1S3tGbbM2IsZ9R/5nhgTiTrkCLfDQYX3hxCtZOaCepGoYypMAWbthPvx31n@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzG3bSYuIS89gOouUGhx5oeOGaLPvMa8PGQWwn+XIFhYSVWweLy
	4JUZH69XeAQU3zGPknPs7+yqhXUYNxjc+ZGrp0bGXg/YZKBXGSPJ92X58GVjI8bUo1htZlSix2P
	ZmqVicQ9ZJMpQIdhRDKhIcHNbO0vwJhd5d3xZiRpzj6Pzn4wrYGYBK1hg1enJCOmEClg=
X-Gm-Gg: ATEYQzy3kUTQeAQ/v7QIqwtxL67HkuJAxHFeiVx3O+FjRW8KvnTbDMbMUvJdL7uOoQA
	nGUDv+J7Qp7tBhBzwtvpWmglr6bzO8ol56fFAJcWMP5EFUMG4Rl21lHroIoirfYNEpZIWh+PPjn
	v0G2cpZiD/WDmdlXvuEPO+Vdq8DwoXz7tTZhwiXwOLjSa2nDUvDIkFExfjzb1atgLhQ5qtmjjt0
	k3nm5VZ91ZCZmkXbt6AJdv+WhzkqPsteJ2cDVUZKp/nCDSv5fhi/SNhjfmFxyg6W5IvR3YwXNbD
	AAuY7wIApH8PrRxbvmI5bl5gaCbxHbR5Vjqnpak+sHLyYEqKpwfT4YGrDVnFXMq4B/hZ3MABjm3
	vlk37MhdplinF2Rkgh4/ba5b41A==
X-Received: by 2002:ac8:5f8f:0:b0:506:a1a8:c6fb with SMTP id
 d75a77b69052e-507528765a2mr213886571cf.2.1772572534153;
        Tue, 03 Mar 2026 13:15:34 -0800 (PST)
X-Received: by 2002:ac8:5f8f:0:b0:506:a1a8:c6fb with SMTP id
 d75a77b69052e-507528765a2mr213886271cf.2.1772572533578;
        Tue, 03 Mar 2026 13:15:33 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:33 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:21 -0500
Subject: [PATCH v3 01/10] PCI: add driver flag to opt into disabling SR-IOV
 on remove()
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-1-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: AW5JHgEMrJ_aAnoDBUUt3Tr2BogkT_NYE84BoKjhuhs_1772572534
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: N3OU3536U3RIFGJMAG2QD3XAHEBCBX3B
X-Message-ID-Hash: N3OU3536U3RIFGJMAG2QD3XAHEBCBX3B
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/N3OU3536U3RIFGJMAG2QD3XAHEBCBX3B/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-1-4443c35f0c88@redhat.com/>
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
index 91ac4e37ecb9c0c5265aa40c235e84b430f43a96..da64d6ce5d30de8a52089b36fcb013937cf8b6fe 100644
--- a/drivers/pci/iov.c
+++ b/drivers/pci/iov.c
@@ -1010,20 +1010,59 @@ void pci_iov_release(struct pci_dev *dev)
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
index dd9075403987d84e068014b35745e8872e93fdae..3fe43711565a3eb61a06cc3700e5ca953961fbe9 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -491,6 +491,7 @@ static void pci_device_remove(struct device *dev)
 	struct pci_dev *pci_dev = to_pci_dev(dev);
 	struct pci_driver *drv = pci_dev->driver;
 
+	pci_iov_disable(pci_dev);
 	if (drv->remove) {
 		pm_runtime_get_sync(dev);
 		/*
@@ -504,8 +505,8 @@ static void pci_device_remove(struct device *dev)
 		pm_runtime_put_noidle(dev);
 	}
 	pcibios_free_irq(pci_dev);
-	pci_dev->driver = NULL;
 	pci_iov_remove(pci_dev);
+	pci_dev->driver = NULL;
 
 	/* Undo the runtime PM settings in local_pci_probe() */
 	pm_runtime_put_sync(dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 13d998fbacce6698514d92500dfea03cc562cdc2..66308f5126ff9e4bebb537a541f1dd8717bccbfa 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -943,6 +943,7 @@ static inline void pci_restore_pasid_state(struct pci_dev *pdev) { }
 #ifdef CONFIG_PCI_IOV
 int pci_iov_init(struct pci_dev *dev);
 void pci_iov_release(struct pci_dev *dev);
+void pci_iov_disable(struct pci_dev *dev);
 void pci_iov_remove(struct pci_dev *dev);
 void pci_iov_update_resource(struct pci_dev *dev, int resno);
 resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev, int resno);
@@ -977,6 +978,7 @@ static inline int pci_iov_init(struct pci_dev *dev)
 	return -ENODEV;
 }
 static inline void pci_iov_release(struct pci_dev *dev) { }
+static inline void pci_iov_disable(struct pci_dev *dev) { }
 static inline void pci_iov_remove(struct pci_dev *dev) { }
 static inline void pci_iov_update_resource(struct pci_dev *dev, int resno) { }
 static inline resource_size_t pci_sriov_resource_alignment(struct pci_dev *dev,
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d512301de4d462fe7e5097c32af5c6f8d..859f767b30f726bd157a6080f5977c17c4827a1d 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1015,6 +1015,13 @@ struct module;
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
@@ -1033,6 +1040,7 @@ struct pci_driver {
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 	bool driver_managed_dma;
+	bool managed_sriov;
 };
 
 #define to_pci_driver(__drv)	\

-- 
2.53.0

