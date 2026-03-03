Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE72DEDEBF6
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B516410E8FA;
	Tue,  3 Mar 2026 21:15:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="g7FiJDyC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2319D44DBB;
	Tue,  3 Mar 2026 21:05:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571940;
 b=XGV0GKZVmawSD67WR0mmJDemwn8MRfbw8+47OVQKZZ4W9C7D4qoY+2I9K+EEmnxTPAh1G
 Bz3ddchJsVy9uJmLX7SPTm3L6lDuIzNC0hqFh2PR/sZbfrqvAcjeQ3M5wDv2mTA4jzmM1m6
 2HbDBJaHB+TIHG0I4NHW87zJjhYdDJtxSCnqgJ6xUhVl0xC/utXnOO6S910g8hWTrchgS+C
 LlFR4UDWAz3y2T0k4AAxMN4ZKTlQ6X0ePE9yVPsTWFzp+3uOQPKDQ7LXrBjUpb4Tk6buij8
 StFa3Sx51o3J0gsxsou3wvn6kqurBVh1zqTOkhzKpB64yUBE99eSU1zhyG6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571940; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
 b=fGitIPYhmuN7Ii05laCPiFd+Ly/MGpaqNFCU67hf4uBJae15s/P1vKFIcXqUdkH1Pezah
 W+S70WacKgjCDbji/Qad4xYUEfZEY/g0OAfufR/El5zJUOSkbgDHtV0DduL1stFoOPuVbZ2
 NmEFqh4+sM8R9ySs2DxhA/LCQ5108fEmzdJU7gpbGlS0p+0AnfYqcCfmUGuVEDCz+tCFa7X
 Thosa5zXjN4oM3ksRW0xyTk42sXjU9jhxZsX7znxW79Bs4I5S52hPo4Gr6E0WYIdela+cYd
 YI+5d6QFZnxi+O4OtzQD2c+V1lP8Aw7FrND7/N1LsH0UE0W2RkXO6wc+EBhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CD44744DBA
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:37 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 19F1E10E8EF
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572555;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
	b=g7FiJDyCEV4nBjJ5GEeqwP4/sqGLNKQgLqzVff7r6/MxcGzpwHqT5edfIoHMEWSQ2QNWV9
	1YGG3klrAzaE/EJCvswkul8USCrlzgc93chvli/KgvzqV0uNhHhjbck7585KyQYnP+gsnU
	nUbvYREUuCzvGoNWIpr6Rv0kb+cLDnE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-34-HudeiWT6MyahVvz_4pzXVw-1; Tue, 03 Mar 2026 16:15:54 -0500
X-MC-Unique: HudeiWT6MyahVvz_4pzXVw-1
X-Mimecast-MFC-AGG-ID: HudeiWT6MyahVvz_4pzXVw_1772572554
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506b839cafaso83203521cf.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572554; x=1773177354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iFUtofMKhN11SJynmnwd1bk8v/kag6AshDn9xvNUK9Q=;
        b=eBmFQ1H0XXWu02CBVo7IHuqtAoJVLWfBJPmJpjBmgdzUTzsSIvbtWU8uCa9yYTyoIs
         7/Hcb8RK9nLzus9NrPrXK8Wcfb71+Fk3rj0N0nnjUSgD5ngH6jrY2MJ7/DtNH4os/zmi
         5M4esZgXGj5lLiG2bMD5AT41GDAmlgg5iN0p8b+pqgrqVHRyIMebxd01hS7bp7xWEjMJ
         6LnY6bXLlA1sVv3Ih0rCS5/Ic8wFgIE3OUlZCOWD4S68dEJfePAP+BWwkMjRi7l763+l
         st6ecWjg2OCXR5bVz05xurFYFiVPjuNLXCtyUTiIIM69aPl0/vaCE2kSIcLkkbShuVBY
         689Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvYzraMxfqCjs9+9i4AibMSG8NUjmJt72fKZ0lVcchDcF1X0I22+AM6e4lGN6mTI5zvLxlUnWX@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyG/Lu2tVL7JevqhabG7N3vZVB5+nk+qRddrE7IJ2BE2d7Qao8L
	aI2BjqEHDWMI1I8NSMN/ybV75NuveOSr0MwfBPUM3UMGvAWSv3Y8t9MlmgS34BvYtWfF3mTsSPk
	6x5/CECzYTvKhgXyLa0Yf3XhbxfP+4SYoVN3SyG03q7f4/jCbswnwI8KUYh3+MkXEkU4=
X-Gm-Gg: ATEYQzyC/+UnmM80FmO+DqpT6qsNaPz7vnYxTyDlyf/uCbsbt3FjFTGhhb+oBcJQ8lI
	pwkZEvQDt2azd2Faq9J5t5y+QzYlem3ZnlEarYuYdHa4vq3WPfl4yBFlWNH3sak6hPfyaa2Unma
	lZmtuCleSJshLW6caupmZt+0/+yy46WtL6uioS9uAx++Ntu3+/IVmoBjVtc5nN74YBgvLM01eLw
	LoT4OSzJTzMRcvgtLD1AeIzCYV9n9GGAI5u2Qw8+yGOdwUlIcbayXWR+0NTNB92mMHw/rq3cV+W
	NqfEWbPmAmpWr03x1o+kygcMgX3RFFOPSsoCu8v7Gt4qcAqgI5zlN9ngdaP6wbiitLBXojKaazX
	0aWnNwfCU6n1iAQPQPUZLVE1eQw==
X-Received: by 2002:ac8:57d0:0:b0:4f1:ba0b:90 with SMTP id
 d75a77b69052e-50752840191mr212431891cf.8.1772572553711;
        Tue, 03 Mar 2026 13:15:53 -0800 (PST)
X-Received: by 2002:ac8:57d0:0:b0:4f1:ba0b:90 with SMTP id
 d75a77b69052e-50752840191mr212431321cf.8.1772572553025;
        Tue, 03 Mar 2026 13:15:53 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:52 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:30 -0500
Subject: [PATCH v3 10/10] samples: rust: add SR-IOV driver sample
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-10-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: yI-6ci8URRw6FEbe40xap6ujD7UOzGNoRL5cAVOY8q0_1772572554
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-ID-Hash: LLNAALYWG7TZ3YD5XCCA3GOTNKIOYMZY
X-Message-ID-Hash: LLNAALYWG7TZ3YD5XCCA3GOTNKIOYMZY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LLNAALYWG7TZ3YD5XCCA3GOTNKIOYMZY/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-10-4443c35f0c88@redhat.com/>
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
Changes in v3:
- Drop redundant `.as_ref()` for `dev_*` prints.

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
index 61bf550fd37c274843e516e00068bb2ab1e152ac..8551a9474fc26309d0714aafa104a5e1ed29156b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20454,6 +20454,7 @@ F:	rust/helpers/pci.c
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
index 0000000000000000000000000000000000000000..a4f7b99d9490f8fed2ab1fedb238c53304af89ee
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
+                pdev,
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
+                    pdev,
+                    "Parent device is PF (PCI ID: {}, 0x{:x}).\n",
+                    physfn.vendor_id(),
+                    physfn.device_id()
+                );
+
+                dev_info!(
+                    pdev,
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
+                pdev,
+                "Disable SR-IOV (PCI ID: {}, 0x{:x}).\n",
+                pdev.vendor_id(),
+                pdev.device_id()
+            );
+            pdev.disable_sriov();
+        } else {
+            dev_info!(
+                pdev,
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
+        dev_info!(self.pdev, "Remove Rust SR-IOV driver sample.\n");
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
2.53.0

