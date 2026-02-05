Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D29BBECD9A8
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 645D610E13E;
	Thu,  5 Feb 2026 21:00:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FoAjm2F0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A8FAF41B4C;
	Thu,  5 Feb 2026 20:51:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324685;
 b=qqturA+pXGwxvJbKQ0u2jw3Jhr6cOBABHFyTz0McC8sKthnF0TDK7T9MM35CBVtvZDv3Z
 2MPaP1mxOupfnf5liQ0hCJOZRoBdYsK0R3czdSQx3akN5rG37bkdxoE8h6nrUtyeE3ym7c/
 l7NJT5WPt/oTPCwnb9er0YIg59AXjDiCDh/k8CH+IifDINWTsOTGP/axpOZzNnI2se85Wk+
 IUrD8rjsFHVIxhE2wXk9YDEgsk4jxmzW4RoXIJL3IO1o/VF2MawZ0otjItW5L51JteJvaMY
 gLkKMg4eKN9NER8E1UxpptkVbgR4TBvuxDZn4wSDyXk3mE55+7nt6Vmu0oZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324685; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
 b=RGiNitR94Zhfgi5DO6Qpqg/55l0O8FkCJeJ0SszOzl+MYUnthUyHJpiJ3RbDNDnGK7xQT
 aA6fNGHNGekl130CWYGoacGhvz/fTAAj00MJPXhWJqfKA39d4/MExXsRMRtFYPK0iYhaYo1
 zeSco/n67FA1IA+mBEfgpK/AQ642wJS/w2OLuy/KZI+rUTSlK4aZuWUL5qQ0A6QnnHpGe86
 2oPMIXTq1cSCjC2VF1SVifeP0/n9SdkFSV5zZqE6F4tdwwWiE7ha75LzNcQsvKIO6PNzVwy
 Or0qv6zqBP0qgqTVQusScIFWmL83NGQ8g8uFUlcmFYT72ZkMeXc7rgFoL+zg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EBE61402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6021810E14A
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325242;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
	b=FoAjm2F0+C0lIDsMprrIgJ8Jwa8OkDVMqK0lixuZ+YVQeY0fqll3qYfI6Hk5ebcu3rnBsF
	NFLpw5V4lpvPfuyE4d0qBhv4K2f3aISa/9jPrHf5TEa6407DKGuTbMG+G1zG9JTGRdDJM4
	HThLzERRi9FNIsfArESOH+OgH4LN/BU=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-350-4JEElGobMm2eAC_TIqybzg-1; Thu, 05 Feb 2026 16:00:40 -0500
X-MC-Unique: 4JEElGobMm2eAC_TIqybzg-1
X-Mimecast-MFC-AGG-ID: 4JEElGobMm2eAC_TIqybzg_1770325240
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52f89b415so363706885a.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325240; x=1770930040;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=swhoxBv4zwo4dFRpNRtMjzIqauuYaXTIl/FyLukXQWY=;
        b=TOWtI/ngeL1h2BFIMUCWrFX4wqc0brAUwiLO9NuU1Zxjt9wk8y0JL/lzH0ZIcPWMEk
         77Dqt+5gAE4TcwGwI8lE0W3GBlWw32Ji/kiBTEBRmeOv48IHN02HuOiJoEIpQHgbAVEL
         3nUh7s7KJ1SafmDzWILo4PIoiMhlyk5b0/emkEU6ck+1KFxuaew640Fpr2iScikYzHgM
         2xzt+5YYqUdjaAXfD7hIttED++asgGWcEekCmMOWKJTK1PvrbsoMdSZ7XrbVq1Ov+0L4
         N5dk3M89qpNs6QfsATGfT/qSn1rQEfWPODyOjQDG/fMjPQMYSs6JVepEnx5NsZSFK6Kd
         SvYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeGbfY4eo5RKRwAcdjb4qxS1ZkWaqIFdShk8Iw4CLzLLllY6abErkEwtaAyrgxIJfavG6zKlG+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXCyY+LSeOY25Giu/C23bHgyNTtuvLzE1wYZgjQCdzoSmo+EP+
	kRrKm5sgvjSjZe/ALMnLJOxsWlY25d5E0CuBzYs0xOkPdq7c6l4qssFtuSu/vWwsend1EEreB0i
	q0BRb/LpHx9psxJChJYtIDjXE4sagIwU++GtSqVQ5QZopLbjiXwLRX5eXpNao+t4ZgWs=
X-Gm-Gg: AZuq6aLbuXCFx8Or0tx08Wpz8HRKhcfgedauMKpn2M+9CtK1HdYw+Uu1cMaqpLXPpPa
	wHnVmou/Gxf8BKDTVRfv3Na91W3wf6fa24W9zeoMeanDy7/ILkPsCqlrpDMzFMaigPKdvoD+xEk
	Hbs6tpAGAqqbKcscIeP88+20EVMbP48h7p9VUQSQIgm6X1LcamBI/z6pTr1gD+E5qrvXsrAS9Sz
	e3kXrNxJmbFtdZh0DDatOiaYsoI0lxAk8nL8HQpLuz2bBa0i0Ewf2tQjgi5puSWtRbzwUdwkQhs
	LObt3kxxgUh/A7TALmDZ+fELyeR/AtjXd5oxevzGTE2l/VF4ecWu5wdOyADMvfb9arkTBBGcKW4
	+Q2ltmScXi7iXTlU=
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id
 af79cd13be357-8caf0487af1mr60629185a.19.1770325239603;
        Thu, 05 Feb 2026 13:00:39 -0800 (PST)
X-Received: by 2002:a05:620a:3953:b0:8b2:eae0:bbf4 with SMTP id
 af79cd13be357-8caf0487af1mr60617885a.19.1770325238937;
        Thu, 05 Feb 2026 13:00:38 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:38 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:56 -0500
Subject: [PATCH v2 09/10] rust: pci: add physfn(), to return PF device for
 VF device
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-9-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 4hooYSrkt5epX3BdPPhZWoowUTSLf6hj3j5vncBRfzs_1770325240
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: JJMACAJU47JU42BNSOR6UI53CAEMVSSE
X-Message-ID-Hash: JJMACAJU47JU42BNSOR6UI53CAEMVSSE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JJMACAJU47JU42BNSOR6UI53CAEMVSSE/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-9-ef9400c7767b@redhat.com/>
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
function pci_iov_remove() is called and forcibly re-disables SR_IOV,
which means the data can be safely accessed by VF drivers until then.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
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
2.52.0

