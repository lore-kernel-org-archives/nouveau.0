Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE04BECD9A6
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A4B5410E14F;
	Thu,  5 Feb 2026 21:00:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S0IbEztV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F2FAF41B47;
	Thu,  5 Feb 2026 20:51:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324687;
 b=PvC4gcJU9/r2XGXhHO6CXvO4XTy6bcAnj8JkkyEtaga+AFXa40OAAgniT+Q4q8v14cOI7
 KoB3WScwrY9kA+FbVx1u/wKee3pXCWdK9wRDQKGOX2lKl3kc2w1d9eCBEsiSC1kpvq5RU7+
 r7oi8Kr3ZNEIZkPvSwZSK1P0ARZxoO58jhF6fuJLvFtWZ8wIQpZXXd7kflrZH0jvmgXKsZk
 8yMUsu3xijOY29Fbr13E8HHAc+4ItASyg60WKu0z+em7Vy1CrPYLOMA8NmIS55Zwoj996Qe
 0KqfGDm85orROfL6cmqHQjr0WZoABqd7uhwQpidkcG6MdzfpxnfJPTQCpwyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324687; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
 b=fOed/7zKqjDxRFVsnddZNN5dNVouMHxHs80ZfcZLxI6/9b2jSlneEqUeIsTYHCxqHHtRi
 beEZrZekdz/Wv60c0SsyCOlHVlJPdFDnsqDDEJr+NUaHViYjRaPGuGtCmi4phGJGbPAUz14
 JQ4ErX98haELk9zVY09EAx7GvILY3aogISxQ8FeSCRASLr11VYH4E4pmTiQImx5CJrhWaLQ
 1q3BeHWML9U7k1GAdZ9M2gqrjDUOp9KyLDUGPG0iMXCOyQ/0moOo36MFO+a4CINRMw2z1yS
 3O1aS8vGcJlTOSToxVo5Y7GQp9I1fm8FKqA8WUU8QRlY9DIm9Q1+CsNECwnQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id ED0CC402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6229B10E10E
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325244;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
	b=S0IbEztVcVhNN8/1dEt+sy8KjssmQc7358uF9fWhA/tdEGayTK+MzWk1W9pm1zc1VBwq9X
	XfW9U1cnbBIwGUQAdhR6S4Jh9pTotCo8hoydjOJBytZc4g8WScPtEJvUutMuD3X6m/zKfX
	JSCVPRny5YTVv2ghzsh2hA0jEh7esy0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-33-4U33D5WGMyWAWtM-qyoxJQ-1; Thu, 05 Feb 2026 16:00:42 -0500
X-MC-Unique: 4U33D5WGMyWAWtM-qyoxJQ-1
X-Mimecast-MFC-AGG-ID: 4U33D5WGMyWAWtM-qyoxJQ_1770325242
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c881d0c617so382395085a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325241; x=1770930041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BMqbQ59ZEPX4CdhRYiH6E8cBHnvUegI817wkrdE94SY=;
        b=p05xyCPk/oGGI+aLYZ8zscqXTDFuk99OD14XSpmJivM70JYpUKqa61bEIlTZ0D6H5B
         BWI019JgXGsZhKP2DZG2iLSQVDPf55WmOYYUjTSzXCmUGpF50OV4cIJYJ7CWYZlrdaIK
         hAz/hIVOsVwbLYmmjM8XmC/Vk8Ehri/eqAcKV7h7B7DbKVX1m11rljAtYzREpR3vrhhW
         J0WR/d6/RtqiJyID9uPJ3PYOeTa/mVLCW9DV5RqesbjJ8KI9e69ocUlvKV31/Jj/O0by
         WBiCiDU+JDSt6hhTS9R7NZEHEJhYn1btKtF+L/fkEOGIapvspSa0KPd15Jl62TchAgJJ
         yFkw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoz1X3Rpm62NbFfaR6G0DiMedUaw8MBFRoe3AakOv0Bfg/3JveSmSD5ZzSfVQ1R03KwLSOj5W3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxxTa6ixUA6kqC8uy/8L/cfC5MUCxYOAc2xq+3w5zplBa2heagJ
	OJl4P3hWAivgc0nGo32zYofvbc5fjYfTKvZvMOJbb0xcRiUlfEKIzRJ6YAG8N8qMxM676zuVygR
	nkWOIfV6p0+ngcwqRz+0cJ5qkPuxVi+Bb5BOL/6G+evf7Ga1I4k9GC+uhNc4h+G/YoWw=
X-Gm-Gg: AZuq6aLsJ5T0Bd8yUZqt0VRB5/0kBxeSKrZLvA9aanGXYQc3dbU4qiA1yMz4tF7IUTi
	iHcIiq6zImxIokuoo+IHhnejOiBQPNxjl4lDTXpk1RxSipYQ/w3p0OuGiUni1TpZTbPgYd6tfLD
	+o0nn1kObbV8X+Y8qw05xjOhTuKQVUcbBytGUCZQ8nI2Gnz922KmkdKBS3PfqebPz/hLyZXJ19c
	F3QfeSZzdn/Czjv5td1tCW0Ui4HA/D0Sy3n2IcVIOisooeXvkcMT929phbhz8MeEditlrxXwYMi
	lqI3v02TxCMZlfRHtQSOmKPcvQqwK/LaQCEaamKlE6g9VCgoqmGt4DcAOBZS94XC2UsaoOd4AIt
	Kc6qALz9ur9n/Mgc=
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id
 af79cd13be357-8caf130789cmr57431885a.72.1770325241392;
        Thu, 05 Feb 2026 13:00:41 -0800 (PST)
X-Received: by 2002:a05:620a:28c5:b0:8ca:3854:8110 with SMTP id
 af79cd13be357-8caf130789cmr57425985a.72.1770325240837;
        Thu, 05 Feb 2026 13:00:40 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:40 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:57 -0500
Subject: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: MJWTfSZ8_yKxt3qNAhKau8wm6Fq7uv5s7Et_8lzuJlI_1770325242
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: H4TAA4S2XPGEA66JE5CDQ4UPOXXAIM6O
X-Message-ID-Hash: H4TAA4S2XPGEA66JE5CDQ4UPOXXAIM6O
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/H4TAA4S2XPGEA66JE5CDQ4UPOXXAIM6O/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a new SR-IOV driver sample that demonstrates how to enable and
disable the Single Root I/O Virtualization capability for a PCI device.

The sample may be exercised using QEMU's 82576 (igb) emulation.

Link: https://www.qemu.org/docs/master/system/devices/igb.html
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Use "kernel vertical" style on imports.
- Demonstrate how to reach driver data of PF device from VF device.
---
 MAINTAINERS                       |   1 +
 samples/rust/Kconfig              |  11 ++++
 samples/rust/Makefile             |   1 +
 samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
 4 files changed, 140 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index b277baee5eb6725b3a5126cefb6eef6190b02413..96dffd777c24473063baaeda017f64b15e8c0ab9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20242,6 +20242,7 @@ F:	rust/helpers/pci.c
 F:	rust/kernel/pci.rs
 F:	rust/kernel/pci/
 F:	samples/rust/rust_driver_pci.rs
+F:	samples/rust/rust_driver_sriov.rs
 
 PCIE BANDWIDTH CONTROLLER
 M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c49ab910634596aea4a1a73dac87585e084f420a..f244df89c4fc9d741915f581de76107e8eb0121b 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -128,6 +128,17 @@ config SAMPLE_RUST_DRIVER_PLATFORM
 
 	  If unsure, say N.
 
+config SAMPLE_RUST_DRIVER_SRIOV
+	tristate "SR-IOV Driver"
+	depends on PCI_IOV
+	help
+	  This option builds the Rust SR-IOV driver sample.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_driver_sriov.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_DRIVER_USB
 	tristate "USB Driver"
 	depends on USB = y
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index 6c0aaa58ccccfd12ef019f68ca784f6d977bc668..19d700f8210151e298cc049dacc249a121d0f2c4 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -11,6 +11,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_I2C)		+= rust_driver_i2c.o
 obj-$(CONFIG_SAMPLE_RUST_I2C_CLIENT)		+= rust_i2c_client.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PCI)		+= rust_driver_pci.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_PLATFORM)	+= rust_driver_platform.o
+obj-$(CONFIG_SAMPLE_RUST_DRIVER_SRIOV)		+= rust_driver_sriov.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_USB)		+= rust_driver_usb.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
new file mode 100644
index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
--- /dev/null
+++ b/samples/rust/rust_driver_sriov.rs
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
+//!
+//! To make this driver probe, QEMU must be run with `-device igb`.
+//!
+//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
+//!
+//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
+//!
+//! and append `intel_iommu=on` to the guest kernel arguments.
+//!
+//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
+//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
+
+use kernel::{
+    device::Core,
+    pci,
+    prelude::*,
+    sync::aref::ARef, //
+};
+
+use core::any::TypeId;
+
+#[pin_data(PinnedDrop)]
+struct SampleDriver {
+    pdev: ARef<pci::Device>,
+    private: TypeId,
+}
+
+kernel::pci_device_table!(
+    PCI_TABLE,
+    MODULE_PCI_TABLE,
+    <SampleDriver as pci::Driver>::IdInfo,
+    [
+        // E1000_DEV_ID_82576
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
+        // E1000_DEV_ID_82576_VF
+        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
+    ]
+);
+
+#[vtable]
+impl pci::Driver for SampleDriver {
+    type IdInfo = ();
+
+    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
+
+    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
+        pin_init::pin_init_scope(move || {
+            dev_info!(
+                pdev.as_ref(),
+                "Probe Rust SR-IOV driver sample (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+
+            if pdev.is_virtfn() {
+                let physfn = pdev.physfn()?;
+                let drvdata = physfn.as_ref().drvdata::<Self>()?;
+
+                assert!(physfn.is_physfn());
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "Parent device is PF (PCI ID: {}, 0x{:x}).\n",
+                    physfn.vendor_id(),
+                    physfn.device_id()
+                );
+
+                dev_info!(
+                    pdev.as_ref(),
+                    "We have access to the private data of {:?}.\n",
+                    drvdata.private
+                );
+            }
+
+            pdev.enable_device_mem()?;
+            pdev.set_master();
+
+            Ok(try_pin_init!(Self {
+                pdev: pdev.into(),
+                private: TypeId::of::<Self>()
+            }))
+        })
+    }
+
+    fn sriov_configure(pdev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+        assert!(pdev.is_physfn());
+
+        if nr_virtfn == 0 {
+            dev_info!(
+                pdev.as_ref(),
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.disable_sriov();
+        } else {
+            dev_info!(
+                pdev.as_ref(),
+                "Enable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.enable_sriov(nr_virtfn)?;
+        }
+
+        assert_eq!(pdev.num_vf(), nr_virtfn);
+        Ok(nr_virtfn)
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for SampleDriver {
+    fn drop(self: Pin<&mut Self>) {
+        dev_info!(self.pdev.as_ref(), "Remove Rust SR-IOV driver sample.\n");
+    }
+}
+
+kernel::module_pci_driver! {
+    type: SampleDriver,
+    name: "rust_driver_sriov",
+    authors: ["Peter Colberg"],
+    description: "Rust SR-IOV driver",
+    license: "GPL v2",
+}

-- 
2.52.0

