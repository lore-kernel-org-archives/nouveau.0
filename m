Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADCEEDEBF1
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D52D710E8EB;
	Tue,  3 Mar 2026 21:15:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UatT3xYS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48FCA44DB4;
	Tue,  3 Mar 2026 21:05:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571930;
 b=G2zFl9MAwk8F+FP5Ow+y8x0k/pRw43Xk8XhCDEBj3wVgup5WmvNqknCG71gJVdnFMwJNf
 qrL4BltxmfqIe4ow6nwq+6gkOKKc39xueqHZtWypQJGAajWN0nxFxLZ/dcGcAbYW9AU6dPo
 5HQJxc4pvhwKzCeoZy2/vsz1SHqGQnFXAkLaJzdFAA2rGLalqLgZyysk3EpOLr78pmcmEHT
 XJa8HK5GbMBco2ECXATnDSIq9WvtLH3rNc0Av2c6ypvdWO/X2D8gp9+wpIc2PRusecKRhkT
 lPW0wHPCH7swS2GtYtbqVVKQ+Iuv7afwNYh0yh0F81auQkL7afWYZEuXsY0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571930; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XjMC0WxfV6FSNfe+9wyhxlyiyTMxjfq8oevr0CbOGEQ=;
 b=EOPf5NNwIUQKyEOTNbVTkWZT/C0kE1uJcT5cqyPK7VswAkKgABxiTNtzZ9upoT+wRsTlX
 6A3Ca/nO9ZBjumLV5kkYec/oMrbX6kaUQvcU7+kGaYh+S6QPrwUdFCUe+/T22S546bNP8am
 cispWirS39WxFBP8V8YzFdTPH9N91ESmrOehWSFr9Ty2NrdHs+/x4t6mB3PPYVaZE69/zJC
 505eP5i5itzcm2xfvv6eFL5g1oNvGHwBfH6gLFZQaM0AjEc+GXqJn3ysJb8cfHB984ycZBD
 /BB9f/Adi8ZXoXMOAkOkJzjqXfTs3Pus41RmBvzP9PLFpKQaoNsyvH6iA2rQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F025E44CF2
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:26 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49DC910E8D7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572544;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XjMC0WxfV6FSNfe+9wyhxlyiyTMxjfq8oevr0CbOGEQ=;
	b=UatT3xYSruZfpjqVDf4AAd2t9EzKJjXY55MRpcvFzjVonc0uZncFQejFys8eSBcI1rWH3M
	LJgBE4oaR+/GpzYhH8O6n8m8t94J6OMCvSH0/UK7sQb+gU/IehSfGxBs3tq/4d18CJww70
	LxOFvkEbdZYQY9RX5syMnylNNlHDtuk=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-689-nOrYUfeQNKGXr1yVlMV1OA-1; Tue, 03 Mar 2026 16:15:43 -0500
X-MC-Unique: nOrYUfeQNKGXr1yVlMV1OA-1
X-Mimecast-MFC-AGG-ID: nOrYUfeQNKGXr1yVlMV1OA_1772572543
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-506bf83258bso87546541cf.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572543; x=1773177343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XjMC0WxfV6FSNfe+9wyhxlyiyTMxjfq8oevr0CbOGEQ=;
        b=Ia/ykUeTxtCa5Xd8ddrzi74rmxFEeSzzyumI3/sTsfc06qI9qMHEf5RMaUxHmrwEKK
         j9bmLBbC4ekfCuF5U3yIXd1dlsYDC2vkTccdUKR3/rv+lPgorOPwUcmfR31iY8FYpNTz
         /Q4ntCUf7q9aTYiN0G0HSnWUa+iT+H3qpHr4p4Ql19JWPuDxmEsFnrClUDPMa72lMeF2
         qFDmbOJKTRmGgunYjSO+eu1PFRJyVFS4bWO6tv6fQ919/sTkqwHLzR+dW197HAek0B+H
         L3bwgxZ7KW2SNZ1VSJzI+h6U6EbIULw+2sA6UOVVDUwXbKN/4OMtSFprDfLOJBAVvfmf
         5iSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEbawPnq1hmFN+RS5n8Q3CYIYlg3CxL6Xa7vMwLv/XCgErTs7y7Vg2L33nQBiw3yAtQ8n8SGnO@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxUpemVxdsteAcvZZIprAvc7RChIkgZGV2t6xm5b3L9xpNq+biI
	HiTsWY5FhhP6rgjJ2EV0hOKxQ4eFK/Fm4rBq1WvC3ieOsGsr8nu4lbncMOgZ1vbu6rX1kPjwBkF
	lhcRJUvtK06Wg1edgbEu7vUr5S7tU1wD++RyKh+gZ2J8TW9AIWi1x3ivLN4N53daptck=
X-Gm-Gg: ATEYQzyelUllyhdnUZ/x7ApPV55Mxs0eh0n4cN2Xu5ggCByJYp3DnpK9Q/2r3KJ+xZW
	z+ANzLlK96G6ugsl7gyIbP+glj60jBYG0hPDAnVBZsQ2Hgx1RivjRe3oWB9SNdQBqaJqquL63KX
	3ek+tzqb2+dydoWC5FEmXfc5yjyHTAgBuAQ1LWubvn88SYWM4cseni5jeDw9AV0Wl2xRlCCInNm
	qc6kQjaXLoQCaJMRL6nTG8AcAn8HPZNMDQYPXZZfCmbTM9iPWTwasY+Qvqu89+ptFdGOcCxxeto
	8PJzHR46XuEMrHZKtQi8qkzUCrS6vzhg5h6OuQ4ckHpyVvpCfeN9C3+zZrf4xVgE6nl2cH0CN2F
	595+NcqxYcC+aH0nPeigxs2whiw==
X-Received: by 2002:a05:622a:14d2:b0:502:ad63:e15e with SMTP id
 d75a77b69052e-5075281833dmr229350891cf.55.1772572542938;
        Tue, 03 Mar 2026 13:15:42 -0800 (PST)
X-Received: by 2002:a05:622a:14d2:b0:502:ad63:e15e with SMTP id
 d75a77b69052e-5075281833dmr229350471cf.55.1772572542372;
        Tue, 03 Mar 2026 13:15:42 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:42 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:25 -0500
Subject: [PATCH v3 05/10] rust: pci: add bus callback sriov_configure(), to
 control SR-IOV from sysfs
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-5-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: X8x4I3dROlKri5pi2QaqH4WVKwSz_v5BNJ0ZFR8oL3Q_1772572543
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: LINCLSXVSXHW5OKRBCEGEKTANXLPTMC5
X-Message-ID-Hash: LINCLSXVSXHW5OKRBCEGEKTANXLPTMC5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LINCLSXVSXHW5OKRBCEGEKTANXLPTMC5/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-5-4443c35f0c88@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add an optional bus callback sriov_configure() to pci::Driver trait,
using the vtable attribute to query if the driver implements the
callback. The callback is invoked when a user-space application
writes the number of VFs to the sysfs file `sriov_numvfs` to
enable SR-IOV, or zero to disable SR-IOV for a PCI device.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index a4c27c674bd8bdf5e3316789d38d566e90b93fe2..88bd114970431bf8c3edef94c1d48567d895eaf6 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -83,6 +83,10 @@ unsafe fn register(
             (*pdrv.get()).remove = Some(Self::remove_callback);
             (*pdrv.get()).id_table = T::ID_TABLE.as_ptr();
             (*pdrv.get()).managed_sriov = true;
+            #[cfg(CONFIG_PCI_IOV)]
+            if T::HAS_SRIOV_CONFIGURE {
+                (*pdrv.get()).sriov_configure = Some(Self::sriov_configure_callback);
+            }
         }
 
         // SAFETY: `pdrv` is guaranteed to be a valid `DriverType`.
@@ -135,6 +139,20 @@ extern "C" fn remove_callback(pdev: *mut bindings::pci_dev) {
 
         T::unbind(pdev, data);
     }
+
+    #[cfg(CONFIG_PCI_IOV)]
+    extern "C" fn sriov_configure_callback(
+        pdev: *mut bindings::pci_dev,
+        nr_virtfn: c_int,
+    ) -> c_int {
+        // SAFETY: The PCI bus only ever calls the sriov_configure callback with a valid pointer to
+        // a `struct pci_dev`.
+        //
+        // INVARIANT: `pdev` is valid for the duration of `sriov_configure_callback()`.
+        let pdev = unsafe { &*pdev.cast::<Device<device::CoreInternal>>() };
+
+        from_result(|| T::sriov_configure(pdev, nr_virtfn))
+    }
 }
 
 /// Declares a kernel module that exposes a single PCI driver.
@@ -325,6 +343,44 @@ pub trait Driver: Send {
     fn unbind(dev: &Device<device::Core>, this: Pin<&Self>) {
         let _ = (dev, this);
     }
+
+    /// Single Root I/O Virtualization (SR-IOV) configure.
+    ///
+    /// Called when a user-space application enables or disables the SR-IOV capability for a
+    /// [`Device`] by writing the number of Virtual Functions (VF), `nr_virtfn` or zero to the
+    /// sysfs file `sriov_numvfs` for this device. Implementing this callback is optional.
+    ///
+    /// Further, and unlike for a PCI driver written in C, when a PF device with enabled VFs is
+    /// unbound from its bound [`Driver`], the `sriov_configure()` callback is invoked to disable
+    /// SR-IOV before the `unbind()` callback. This guarantees that when a VF device is bound to a
+    /// driver, the underlying PF device is bound to a driver, too.
+    ///
+    /// Upon success, this callback must return the number of VFs that were enabled, or zero if
+    /// SR-IOV was disabled.
+    ///
+    /// See [PCI Express I/O Virtualization].
+    ///
+    /// [PCI Express I/O Virtualization]: https://docs.kernel.org/PCI/pci-iov-howto.html
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// # use kernel::{device::Core, pci, prelude::*};
+    /// #[cfg(CONFIG_PCI_IOV)]
+    /// fn sriov_configure(dev: &pci::Device<Core>, nr_virtfn: i32) -> Result<i32> {
+    ///     if nr_virtfn == 0 {
+    ///         dev.disable_sriov();
+    ///     } else {
+    ///         dev.enable_sriov(nr_virtfn)?;
+    ///     }
+    ///     Ok(nr_virtfn)
+    /// }
+    /// ```
+    #[cfg(CONFIG_PCI_IOV)]
+    fn sriov_configure(dev: &Device<device::Core>, nr_virtfn: i32) -> Result<i32> {
+        let _ = (dev, nr_virtfn);
+        build_error!(crate::error::VTABLE_DEFAULT_ERROR)
+    }
 }
 
 /// The PCI device representation.

-- 
2.53.0

