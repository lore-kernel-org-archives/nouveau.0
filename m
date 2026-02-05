Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BCBECD9A7
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C15B10E164;
	Thu,  5 Feb 2026 21:00:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="GFpt83LN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7FC4C41B47;
	Thu,  5 Feb 2026 20:51:19 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324679;
 b=C0tolYIFQSE7nH13sUXyx2QZI3ScfXq9M4eHeMuKPyTsJKn267WgbdHYXmuj490khF1oT
 2ZaKkoJUTsrK/mmDumjZ6KGSSisgnpRH3cY6Ki/2myxJ6vRXRXxxx7X1vMCpG8vKR7zanOh
 ylM+LyeHK6mhLYvF9LzFSquM3Q/eSevP/HMQoPERw34pBdlR67hBvsUeMwbp/lo5/y/FT3t
 F4udbD6LMx0XDo2CldGGz/ZG5NqSxdtz8Lx9BtKhHU1GrCWXsedlkxvYdqoxerkyfMiTKmx
 B+Ml6SWVUp9+5FbtMp1OCn404nfwVRvA27pTV64PhxIEYwJEAHdRePps8EyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324679; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
 b=zaiz9DI/u93s2EkR7GcA88sIcPyJ8JeiQezzqYv/QI3SkfhMoEGik/w7Q1Iox35NJ6L7A
 WQz68EyHSjbWUmBtC/msscYwaMd+VDQZNF8tAqfW4d9np76R4wbiF7tESRYPcC2uQ8AtZd5
 uOs9nPn/CCE0RMS4iYTiCCZSvWYGb1z2WmNtJE0od/UR2tGMPNTtN5x6nm8u80Aot6wrqUk
 JwbY9iG7K1Bge+8GBhcnDst+lPwiMU3NyHyEzZ8WUgygE+uuTuaPYBpk/8/BBbVJaGDvYZU
 btsbXyfPTYZ/TdgxUUVrDczplu77XnYVIiTgKhxFeLAHKDTpmExw7WxWL3Mw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3AB3341AF5
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A27AC10E0F5
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325236;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
	b=GFpt83LNKNlnjAsuVB4/dbbHVnIBkHq+Ab7D86FL2RTudfnBj8DQ4Dzd7wpfkbpimHsw7r
	IwXCcKDp+0PRlTpEJc6LPMh7kgOKggyDpKMZMV6u/c5RfD8YTKEFK/SJkx8DY1PIvp0nPm
	Tl+tsnuIkVzJg1V6NzkKUSX4TYe46D8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-p_pWqad2MPuvWs-viAS7nA-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: p_pWqad2MPuvWs-viAS7nA-1
X-Mimecast-MFC-AGG-ID: p_pWqad2MPuvWs-viAS7nA_1770325234
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c71655aa11so469328185a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325234; x=1770930034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uO9Iu/KQjA0pe5Uf917htRnrSxjGLQG0IESxKRcUlqo=;
        b=B1RKc+83PCr2VNh2UMawKoc5CGJ+A2qYk8AHTef0JOQRX5x2rnU7TO/P1Hec6KbD8d
         OY0fT1IY9ZMorXR1+D6as1OgLnZqneozksTrSgoh9+GReNmtk5VdN2aINx19DI9mkjsl
         prkLiQFkzGNhPDWYjlDm4J5xadmQr/UnjI5GK+xRM34qweq6Xdmnvcp914WF5kvimOpy
         Ed39PO0+S0VP16HIomK5rzsu1odWiwyF7/ROpNy264v+FNV5BjBwT7TaQRuRVuuYcgzO
         XOrfx4yla1KhycWTV0z8Dzv2dRqMYftS+yiP39JWRitRLkOmTsuuYAviNZrXAOqvPQ+Z
         +KGQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW3R9mDDHwV0Xb730qvQ/4nuiDDX8eOHb58/U4u1qczErrdwA/IiX64q9o1/sm5niI1J3eh/RSh@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzGJMFwZwtJWYNKziwF1T676MW636ZHOgTqgdDK+2cntAsIcx59
	xaA/ZnHgzlZ5+eOanbP2e7DONhxtw45F3SFgdRftN6w5lt1pNQiBCmP2WyfeF58jbtcxclF6+3c
	eYoaTuxBw69cK7cfAuzWyuw1mb/y9UdBoERASeJgby58S/qb0dZktXoTKZZBJMlF23jU=
X-Gm-Gg: AZuq6aK71vQPMiA19G9K54C/S6VH1Tn44wKCOAHS2STXzL2LvflBlBnGEwzL2d2fER4
	QXxlYOixcf4jKmaN0DPfvaXhjZc6xTHtara3aL8mmkXQU00xdSf/xeZkxq40+bm8uCeqh58ILXd
	BgVfKcqMarkJTGV/KKPwKRTPQtrL796tWYNK1dSURSI5yXjRY5YEUW8h7Nq5SU3TidnYyfY+3Uo
	+Bx8XO8ST+l5VRXvHIw9TBCZ+FJiS8Jmzq96TF6S2kIciQOccfr01RSjmsMqG/Hnqwl4oc0j4y6
	vhyB0RSe6UhzyDnzKqafx8czHIGKeg1Q9V1B95XofXIXxReAzmjqAT+o+UQx3o5yDE1qmghIvcV
	BPU6pXPmaZ4GR2SM=
X-Received: by 2002:a05:620a:bc9:b0:8b2:f35c:16df with SMTP id
 af79cd13be357-8caf1bc2af6mr57818085a.79.1770325232329;
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
X-Received: by 2002:a05:620a:bc9:b0:8b2:f35c:16df with SMTP id
 af79cd13be357-8caf1bc2af6mr57795985a.79.1770325230865;
        Thu, 05 Feb 2026 13:00:30 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:30 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:52 -0500
Subject: [PATCH v2 05/10] rust: pci: add bus callback sriov_configure(), to
 control SR-IOV from sysfs
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-5-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: OHZLa2OeeWs7xJ4cSSwCvmF53TQge7jR4LcxfSEkcLk_1770325234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7EW5NCZYDWBVPRFT2I2WJT5NCWQAW27L
X-Message-ID-Hash: 7EW5NCZYDWBVPRFT2I2WJT5NCWQAW27L
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7EW5NCZYDWBVPRFT2I2WJT5NCWQAW27L/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-5-ef9400c7767b@redhat.com/>
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
2.52.0

