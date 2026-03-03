Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B787EDEBF6
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EC91010E8E8;
	Tue,  3 Mar 2026 21:15:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dEE53Au0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5F9DD40469;
	Tue,  3 Mar 2026 21:05:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571926;
 b=zn4/nTTmvmk8xa3e9WNe5sMjr4g/pHimvW2hzm2ftdVwbla2y/ShFLzNWmVBfDAumPA4A
 4/vGnq9DVTpfSN6v9T/T1LRV4h9jTnRasHqisL/5OI5jNryRvlgV7BrMvuOlTv7a8aIa8my
 usDxvWDEYrIc1XOWO+sL7DKBCGQQ8rwxwUS1ES603w87sQnodE/cZywLKfRFhuT7eXvV2Gv
 KiNKoOuxNkKpF0yBWJKBsEbyUJfuG47W/0mtY1l9xSkfRNBc1lQAygLEe+vhQiySMa5giHq
 OMq35+ZIxU7XjG2ij73sA6LQdN1OPzmlKeHAFkGMR/zv8VB2m9SEKelkk9ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571926; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dKSiyMf0ynPRuLtK//gTM+BGK6ixt+B/8DTHGEJv69g=;
 b=o5eD+1iSoG2hKqyOZzfz8CQTBDNoTz+tM81iNa9biumMobJnC/qJQgKa/5CeLoCYc5ar7
 k2W6EKXMeyEV04piPT/jqzo7kaG0jz5WZQ0eF/zSQ0zAF73JuBsVqqSe8uZm5w9iiN9sBuU
 DtZjjaK/djcgaECxD29K2urXUcgF99afcYOr7sVKvQ/EN+8uqSjKLp2OdTsXQ9cSEWQu5Fp
 IsW43i67I8IvL/dGrtRRJ7T16sW+zYbF0Y2yxSXEaRqALm23ib/FodL1E2TqyK7gsZmMq0U
 GGVB3GodZHZpxY+mNDOr1KR34Jren3M5aYYLrT4fZCpZhEaGWS9FOe6zfjYg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 95BD640469
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:23 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E073410E8E6
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dKSiyMf0ynPRuLtK//gTM+BGK6ixt+B/8DTHGEJv69g=;
	b=dEE53Au0HE/cSAZbZnk11r/yCRHPX2UwNv1Y2PDuERCXWDEFvPkHBjiCZcPLRFFfW/espn
	WhNwyLS1fzx+MWIB3g8mtbXkKQUAo+z7yCd9qjdZNL7JPzhLE9gIaF9P4SnurQgf6obexe
	QJiqx9KPCPViz9Z7IA/eHHwJMm5WcMk=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-gZACaefBPoaa_Taz3Tf3WQ-1; Tue, 03 Mar 2026 16:15:39 -0500
X-MC-Unique: gZACaefBPoaa_Taz3Tf3WQ-1
X-Mimecast-MFC-AGG-ID: gZACaefBPoaa_Taz3Tf3WQ_1772572539
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-506bfa0441aso883641541cf.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572539; x=1773177339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dKSiyMf0ynPRuLtK//gTM+BGK6ixt+B/8DTHGEJv69g=;
        b=VXp6Le2wOyxT6rFUiPCQ/TKP4V495i3DSVpwrKK/9ap/CDEZliqYre7DDgFyedoLq2
         ddieG0qchTJD59HHNp2W7Wo4DRMuAT4y9PHAQq4B3wVDtNOCXGNygp1pXZrDFAgu6dTt
         BgPAnc6Iddc0dE3VJrS7AdWXBrV3sf+JLmL6VRQNyYG1ALL7jDRVMAC1Hbu1YdbszSpI
         TWhApQLse46TG2wsb9jC5Ay6kNluUtSy5xs6z2jSIeOPX0MUfAPUapW/QRBwk4iKyqMF
         GynnpKnTAoYjqoTjxdrVOkyXBcI4Fv8NKkSM0kNtgIw3GQHYlmwXl66ziph35u+4dXJR
         75YA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUEWpy64TGbjKNImO1trCVcihwzRtkvx5sJPwExFgg4zr2XcZCC5c9WZiCWnsy6HMJKGviOdIG/@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzJ67BvT9ZZp+pU5hAMhvYHLnMjjrYfJtuULl2DUrO5CEJijyRZ
	UEQn9Y9xXW5HaSIgM+eqqibj93qecUrbfILyhZXYoo75d4o8ItH7hHlnjCNmH6PpfaMUzTdiljd
	+OUJL7Eg4a+6WBiCMKwd651c238q0e6iVVYJPqHrGrN/flIbMBIj4aLDsHpXM/1XjOCQ=
X-Gm-Gg: ATEYQzxrzgyftu+RBZRDIWmuE6l/a2qAuAbyHVKb74fCGx9Te93W6How5X4VNLFzGTn
	Q9ZY2iGRrXc3rTghHIZTd38Vz4FEXm7nOeCg9x5pUMNPNS+LFUEnxkaah1ZI6QRyiUubSCj8iut
	Z7kwFpOisOIKoNi0aBo3KCdBJrrmM6sNxTBKXblAkymxbjf1P2v1TOacXEMloI7tTdi/Fxeosrd
	ZqQ7s503IqDcDbSDPEppsrfMpVpDNUAY22oZ24N4ukrHDP6kt9ICUtAxYtBF4yt0/lizW4HJHnP
	VaYcKGISQGn8Vze13k0Ihu85cmQUcSYXx8hIGp2Yk2oBzYNLjwuitcAcn1isJXAlk3D8SQRvSvb
	ZSG9NR5+FtoW832LfpLLYjzfesA==
X-Received: by 2002:a05:622a:50b:b0:4f1:b9ec:f6a4 with SMTP id
 d75a77b69052e-507527b8798mr223872571cf.33.1772572539241;
        Tue, 03 Mar 2026 13:15:39 -0800 (PST)
X-Received: by 2002:a05:622a:50b:b0:4f1:b9ec:f6a4 with SMTP id
 d75a77b69052e-507527b8798mr223871711cf.33.1772572538483;
        Tue, 03 Mar 2026 13:15:38 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:38 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:23 -0500
Subject: [PATCH v3 03/10] rust: pci: add {enable,disable}_sriov(), to
 control SR-IOV capability
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-3-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: beAv50qXLd6e2wo8Gzjc3HVhPehYsRik1Gv7IygVWCw_1772572539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: MXSQHTW2Q2NPH4VP4747H3QYLY2FCMZ5
X-Message-ID-Hash: MXSQHTW2Q2NPH4VP4747H3QYLY2FCMZ5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MXSQHTW2Q2NPH4VP4747H3QYLY2FCMZ5/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-3-4443c35f0c88@redhat.com/>
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
2.53.0

