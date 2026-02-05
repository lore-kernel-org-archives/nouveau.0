Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623A6ECD997
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38DD510E10E;
	Thu,  5 Feb 2026 21:00:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="H0ZRIEHh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 87E6841B47;
	Thu,  5 Feb 2026 20:51:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324673;
 b=kzITVECDWWMNlkmGxcxGMqfbvo40R1rK4pyNmF7LZyVvptLjJYE1qqZyg8zSdtBo5uK+n
 RWU2776XT3VhpyQzmsiRIBP3G/eC9EMSRYDdrCeyuzwv5yzmq9zC85il4P137JHR7S9KJRE
 EPXcSsqrXaec7EeRvL86tfqS6nnThKhX4cWEazMZxE2MfLPxpt40pDI1ki9AJSgUf50bGpU
 zt/DRa+SBQ6Hltbx0vAuBT68JICQHLIlpwx0Bj8b42MQ/NWe1GBAznnRsK5Tucns59sJRCW
 FM0T478srVlaZuLqGAPljoeshD+s4BRlHPEGfI9AwC/QNkBZkiMOUYECghWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324673; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uwZoKA9DaqBTJxMiA47H9MG2vtbRUN7ZZJ7Lzm/5+UE=;
 b=nHNWgLgwvLWRXkeOdCnxZ28dQGQhfEnMYJWR4RWVFhjKVDraLtFHvquZkBXjRBF7moN2g
 CyD9QQv9eJwu98DgVCAXt1mxu7y+9QT/Jhl3hg0hMUcDCDskaEeGmsKjM9OyBMb9hCire/6
 iY8/8dlT2X7wtBcZL/AKT5vHNZeKduApiF2uwqzeBzI/4Mhh60eiHqu50jKNkt9t+Mk2rCD
 52ieAO8J26IAKDCVE66gXXe4ytao/FgIG3D1m5GAuxm2/crk5B23ujl6PaFZ9C5iv1Pit+/
 AcN4PBP+VuTcexFSKAn5mPjl1o7041hl4Q4OInqSBkium0nAeJ5Wxdy6jfCg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DE8AB402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:10 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 53BC210E0AD
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325230;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uwZoKA9DaqBTJxMiA47H9MG2vtbRUN7ZZJ7Lzm/5+UE=;
	b=H0ZRIEHhn9IClltPaBIxuQgNOIgA6n4dMg7V14ZAq9iDdf/u0MZsJ06n8tPw+bOrmAJ/yC
	OQ12EMW/+jl6mY1PelMIw2sgAkGnM/a6CCkheSuyKR67uWlwy6vRq1tAWHhg7Vr2qINRYH
	mOUwI4wS+fSjt7r9gujmGj5IBZsV9+w=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-btik5K_2NUWC6g5vmcu41w-1; Thu, 05 Feb 2026 16:00:29 -0500
X-MC-Unique: btik5K_2NUWC6g5vmcu41w-1
X-Mimecast-MFC-AGG-ID: btik5K_2NUWC6g5vmcu41w_1770325228
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-89462dd72a6so52557426d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325228; x=1770930028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uwZoKA9DaqBTJxMiA47H9MG2vtbRUN7ZZJ7Lzm/5+UE=;
        b=cStncc+ZmY0mrFjsd3IkXaH1rKFm+untCSuf61d1vpvABmYHhgsERcFKnBBxsESexl
         TluKC6pdYnC4ukGCG/JVvz0gT5Fb+ArF61Q6dHIOND+jqJ4AmRzpk/BRYIuGvy/9YjpH
         dTXzvv4RYNdXq+0fUmguCVsCUeedVu4dQeImxITcbCuJiEprF8N/HSkslXRN3/nYSOu9
         uGq2BaOGRCXDEyyV6wf1jPb6qdF9TZyZ7l0seYIREcuWdRozmSjkxc/TV8QYoW59FnuD
         xfu2GokHqIZRi20hp3jGDpmBkB5WHxF4RRSf3/dDu+s3VwNkTAYXHj/YTML7wXUuGIlN
         eoZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+UJyWyOPZ6A1rjx+OUMDpCFHxwjF5aHDGFUrOhX0hXNB+s62ySUbd/g8ewlu0oskqsjVuTbOS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxdyyuuFJtEUdDimjgC/COkg1dp9MH9y/84Qf5fUsAuyjmpe6Cb
	SvpTJqZiKKXcnL4GTXTlX5b8uUCEoIJCe4QnQAacomcuAq74+kL3+VVANTysO1ImVfKgiXM+kD4
	Ucrag5ZGJL6ymOt49bDURhHPDstXf8Go6gm7sflo7vrz7Za/k7u5QJfbRGeUAr0ripSU=
X-Gm-Gg: AZuq6aI6KvHTC5NbtiYOWRVDT0tMt1jyJLN/lSN8cPqpIv8K+yQ5xewuPxYnJJGRHua
	iskqhmReKo4aocAzgVoViG7edzS5rV7TFeDx7qudH+hPkn5kslY3FcaWNLWel9U8Cy6ygi/u7HD
	QP2WWSXxKyQcWDZTJG7rhBUaeIsn795THFa/Fh5xlfyGO30lm5VTtkq4osH+SewvJZe5KJgvmRP
	QoNCYlaJ/70uFHoNyWpxtel0xdyYG1OQIhr78sujhBfLmKHUBwBgJcyi/5spiMlc9WkWta4mKws
	ONQMIfBiOn7qF5A2gxktwugNpP6mu5vlu+6KwfNjArkWh3EKdwCSCSG5fIEUsqNXAfXfqlszP0G
	N4MJkOLxg08aOc34=
X-Received: by 2002:ad4:4ea6:0:b0:894:61c8:947f with SMTP id
 6a1803df08f44-8953c83ab92mr6627786d6.25.1770325227638;
        Thu, 05 Feb 2026 13:00:27 -0800 (PST)
X-Received: by 2002:ad4:4ea6:0:b0:894:61c8:947f with SMTP id
 6a1803df08f44-8953c83ab92mr6626756d6.25.1770325226981;
        Thu, 05 Feb 2026 13:00:26 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:26 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:50 -0500
Subject: [PATCH v2 03/10] rust: pci: add {enable,disable}_sriov(), to
 control SR-IOV capability
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-3-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: gjI7i3IZ6_adYdupYkB4TU90i5HAtq97OIE9p_7Kfmw_1770325228
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: XJSR6UA4NIA6HIQXCUPVUVFOCBWVVF6I
X-Message-ID-Hash: XJSR6UA4NIA6HIQXCUPVUVFOCBWVVF6I
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XJSR6UA4NIA6HIQXCUPVUVFOCBWVVF6I/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-3-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add methods to enable and disable the Single Root I/O Virtualization
(SR-IOV) capability for a PCI device. The wrapped C methods take care
of validating whether the device is a Physical Function (PF), whether
SR-IOV is currently disabled (or enabled), and whether the number of
requested VFs does not exceed the total number of supported VFs.

Set the flag managed_sriov to always disable SR-IOV when a Rust PCI
driver is unbound from a PF device. This ensures that when a Virtual
Function (VF) is bound to a driver, the corresponding Physical Function
(PF) is bound to a driver, too, which is a prerequisite for exposing a
safe Rust API that allows a VF driver to obtain the PF device for a VF
device and subsequently access the private data of the PF driver.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Set flag managed_sriov to disable SR-IOV on remove().
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments.
---
 rust/kernel/pci.rs | 33 +++++++++++++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index af74ddff6114db3c2ce8e228c5a953cd0769e8a5..e1cab1574a3d309d25bf5267c0b0d8da8fb66d44 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -82,6 +82,7 @@ unsafe fn register(
             (*pdrv.get()).probe = Some(Self::probe_callback);
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
+            (*pdrv.get()).managed_sriov = true;
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -458,6 +459,38 @@ pub fn set_master(&self) {
         // SAFETY: `self.as_raw` is guaranteed to be a pointer to a valid `struct pci_dev`.
         unsafe { bindings::pci_set_master(self.as_raw()) };
     }
+
+    /// Enable the Single Root I/O Virtualization (SR-IOV) capability for this device,
+    /// where `nr_virtfn` is number of Virtual Functions (VF) to enable.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn enable_sriov(&self, nr_virtfn: i32) -> Result {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_enable_sriov()` checks that the enable operation is valid:
+        // - the device is a Physical Function (PF),
+        // - SR-IOV is currently disabled, and
+        // - `nr_virtfn` does not exceed the total number of supported VFs.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        to_result(unsafe { bindings::pci_enable_sriov(self.as_raw(), nr_virtfn) })
+    }
+
+    /// Disable the Single Root I/O Virtualization (SR-IOV) capability for this device.
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn disable_sriov(&self) {
+        // SAFETY:
+        // `self.as_raw` returns a valid pointer to a `struct pci_dev`.
+        //
+        // `pci_disable_sriov()` checks that the disable operation is valid:
+        // - the device is a Physical Function (PF), and
+        // - SR-IOV is currently enabled.
+        //
+        // The Core device context inherits from the Bound device context,
+        // which guarantees that the PF device is bound to a driver.
+        unsafe { bindings::pci_disable_sriov(self.as_raw()) };
+    }
 }
 
 // SAFETY: `pci::Device` is a transparent wrapper of `struct pci_dev`.

-- 
2.52.0

