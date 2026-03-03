Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF2C3EDEBF7
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 63F0910E8FE;
	Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ClSPKbLW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C7AD044DB9;
	Tue,  3 Mar 2026 21:05:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571937;
 b=IGbdwsI02Jls4giTG2mDOtg9vFYAihUm+def4vv/+cwPkuG4ZbtlAaiq9dXO2q5TAab/i
 1/AD55RCUbox6aGbDroEVaa17RriVqNuSA0FpyfWMWQJ6lFRu8EZ0BFGNwxZD+GKCx+y+9s
 IvdIGHdR4lG2xWbuoy9hFHnAl+8E0YKJu/3Z5YXubqjPc1nvSo8PinLfEUxChaMxJkTHB2Z
 vG9g+6gokRCS/WYwCPCIdBjQjqBljnBdfPpgQ7+hvYKE3WBjXLdy47yZpva9PBO5+U3LUKy
 K6XKf+GbaTX1MDM82zOikOjW0RwAsBpF9PmUHM6tiC7AB8u1dFYHQgtlQkfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571937; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=62xgaFtJ6odD5MPfFUAjLdRekJQ/qnRaVs4d4H+RycE=;
 b=xzpskcz2fK1CLDrF/yib+u4TrZmPhhhl+4khySXkEcq2w9c7f1HiDu8SDVZviQ1vqJb7e
 BBuxOw4O5ou8Q0g/7w/s66xpoaFAVmXx0dp4c3yenFo2wseephPF63NJwN+3ZhXeLUmEs2l
 SwCeEOUu4foO9iSNr5H0ZvoMaLRTD4RT6AP8tki/7+pYukh19pxgd3/kNYaXj5wckl6YuuV
 1M8oZriB49rddnTtoZX8ugGbpJUj030uZaDdjZXuxojoDRv/DZ1YSywzU8IBuq+j+25YB7l
 8ibeOyU53UlV0GbG+amEoIjywFyuwAKiYJb5xdGsqxwiqL3FU4/JtjTu5njA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CA8F744CF2
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2298510E8DB
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=62xgaFtJ6odD5MPfFUAjLdRekJQ/qnRaVs4d4H+RycE=;
	b=ClSPKbLWZNGN7BuHje3qvLZ7qVruJgZQlQ6Dzt90mRjvMLJOgyuwOe+iLQmRQtehu3M1Eu
	aSQSrjDKm+qViaKWCQQupOBQPImtlkLD1m9E9esi1+5kppZbDOfiVFmiuqnQNeh/b92YUz
	pxiThj/9P3Lw7yb/ihg7WMAwOf58mYs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-416-V19lzCACPZGpM1SKKdWANg-1; Tue, 03 Mar 2026 16:15:52 -0500
X-MC-Unique: V19lzCACPZGpM1SKKdWANg-1
X-Mimecast-MFC-AGG-ID: V19lzCACPZGpM1SKKdWANg_1772572552
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-506b4bdde91so469749811cf.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572552; x=1773177352;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=62xgaFtJ6odD5MPfFUAjLdRekJQ/qnRaVs4d4H+RycE=;
        b=u7RCLXjV0oURzpXm752mmItNgBpoqqEWmLc8hl0zRFxtOehLkaeMeu6NImquIy5jEh
         xqtelcfbabPSlGFd/o5pNfDBEfjevEk3ou6kuqVP/uBD4uYmCNMXnAxQXlHZXGdgSyIl
         LTLjI8TOVx9tPGF2zFLHyt06JcXGVzlryy6c+uZZD1o6C26K3hNKicelQ5kuT8+VJ/K6
         2ZPaxZUymmuyY+pQzjODiKWtwYprP8GuM7p1QbScRG/+3jfrBTHAWzBbifgnzlwcDFCX
         6a7/1yWzOJrjnq6Plgy5gve+wTNh2BYU0mNOXcF/LWQgtRCZ0OvcXpw+ncqLeXDUhawR
         So/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXth6FY9xQszS7VgbYywtAOtBpaA8L+AZ4jtYeYjXdYVkIMgCAMO+wpWi4J6NRK3k7oez0R5weX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwvJN7EIjb5PEKlG49ItSx758xUEhONOrNPKUtosfgjlyVgozgv
	B4O/P+j9Qce7LM85SI2nkn+3QVZlfr1vQaB5jYP/aCQMa5n+a2295aibFn4XIUcL1Fktd+M/XHn
	FSaQxutCCAFX5mNSFpYYcgdchftu9pdHO/3m+3dgiamp8/CyajndavFxK8Rta/IzF8w4=
X-Gm-Gg: ATEYQzz5BfKOuPaa6ilrKt4ej91jtI7j3Yk2+CFX19JJfGgw3LwqXF++TlbZfD9qoba
	Tni99Tu78QI5Ywb772Wth//+SVfDMOr5DgD/YQl7QDSMDfrYEILAx6T9EPU3AaHYjABHVkZqzm0
	yHge8WaO6s22IK8waPCD41S0Vz6DdKaGxfS4S3UX4UnzdytLc2wl4Lpk47CRU0CHIaQ7qKUmbsi
	c5qaHT/jSGQ2UsZ3srJYsK+/Q51vTeQim9y4imIRGD6NMsQVMvv/g1n5HwzQ6gEviq/5jXQ9E8h
	GtWTWPduoRg7YABLyNce9tPIL2VaKYkqBA0WeTOgsZey4TDiv1BtOCyK91trTwr1OvpW6m725iJ
	KHb8oJ7kD/aSDfDAMs/sMgm1iDg==
X-Received: by 2002:ac8:7d53:0:b0:503:2ea0:ef2a with SMTP id
 d75a77b69052e-507528a83e7mr213703771cf.18.1772572551551;
        Tue, 03 Mar 2026 13:15:51 -0800 (PST)
X-Received: by 2002:ac8:7d53:0:b0:503:2ea0:ef2a with SMTP id
 d75a77b69052e-507528a83e7mr213703051cf.18.1772572551032;
        Tue, 03 Mar 2026 13:15:51 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:50 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:29 -0500
Subject: [PATCH v3 09/10] rust: pci: add physfn(), to return PF device for
 VF device
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-9-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: aNVRgOL8yRGCvtGyTjExVIHmJsOrES3AFMzmSrDfmM4_1772572552
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZWEFELJCIYVQ4V4NVW6POMPHC364EI6L
X-Message-ID-Hash: ZWEFELJCIYVQ4V4NVW6POMPHC364EI6L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZWEFELJCIYVQ4V4NVW6POMPHC364EI6L/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-9-4443c35f0c88@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a method to return the Physical Function (PF) device for a Virtual
Function (VF) device in the bound device context.

Unlike for a PCI driver written in C, guarantee that when a VF device is
bound to a driver, the underlying PF device is bound to a driver, too,
by always setting the flag managed_sriov in the pci_driver structure.

In case SR-IOV has been enabled by a C driver that has not set the flag
managed_sriov in pci_driver, return an error from physfn().

This change depends on commit a995fe1a3aa7 ("rust: driver: drop device
private data post unbind") to also uphold the safety guarantee in case
a (broken) PF driver re-enables SR-IOV in its unbind() callback. That
commit extends the lifetime of the device private data beyond the
remove_callback() wrapper. In particular, that commit ensures that the
device private data for the PF device is still alive until after the
function pci_iov_remove() is called and forcibly re-disables SR-IOV,
which means the data can be safely accessed by VF drivers until then.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v3:
- Replace SR_IOV -> SR-IOV in description.

Changes in v2:
- Uphold safety guarantee when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
---
 rust/kernel/pci.rs | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 581930d0afe98ccc29d729e4d9aab75b4144e46c..3b11f73a9f2b69a02fe003b8feadd61864adc8c0 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -525,6 +525,59 @@ pub fn pci_class(&self) -> Class {
     }
 }
 
+impl Device<device::Bound> {
+    /// Returns the Physical Function (PF) device for a Virtual Function (VF) device.
+    ///
+    /// # Examples
+    ///
+    /// The following example illustrates how to obtain the private driver data of the PF device,
+    /// where `vf_pdev` is the VF device of reference type `&Device<Core>` or `&Device<Bound>`.
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci};
+    /// /// A PCI driver that binds to both the PF and its VF devices.
+    /// struct MyDriver;
+    ///
+    /// impl MyDriver {
+    ///     fn connect(vf_pdev: &pci::Device<Core>) -> Result {
+    ///         let pf_pdev = vf_pdev.physfn()?;
+    ///         let pf_drvdata = pf_pdev.as_ref().drvdata::<Self>()?;
+    ///         Ok(())
+    ///     }
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn physfn(&self) -> Result<&Device<device::Bound>> {
+        if !self.is_virtfn() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `self.as_raw()` returns a valid pointer to a `struct pci_dev`.
+        // `physfn` is a valid pointer to a `struct pci_dev` since `is_virtfn()` is `true`.
+        let pf_dev = unsafe { (*self.as_raw()).__bindgen_anon_1.physfn };
+
+        // SAFETY: `pf_dev` is a valid pointer to a `struct pci_dev`.
+        // `driver` is either NULL or a valid pointer to a `struct pci_driver`.
+        let pf_drv = unsafe { (*pf_dev).driver };
+        if pf_drv.is_null() {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `pf_drv` is a valid pointer to a `struct pci_driver`.
+        if !unsafe { (*pf_drv).managed_sriov } {
+            return Err(EINVAL);
+        }
+
+        // SAFETY: `physfn` may be cast to a `Device<device::Bound>` since the
+        // driver flag `managed_sriov` forces SR-IOV to be disabled when the
+        // PF driver is unbound, i.e., all VF devices are destroyed. This
+        // guarantees that the underlying PF device is bound to a driver
+        // when the VF device is bound to a driver, which is the case since
+        // `Device::physfn()` requires a `&Device<Bound>` reference.
+        Ok(unsafe { &*pf_dev.cast() })
+    }
+}
+
 impl Device<device::Core> {
     /// Enable memory resources for this device.
     pub fn enable_device_mem(&self) -> Result {

-- 
2.53.0

