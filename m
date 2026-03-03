Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7155EDEBF7
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9C76310E8F9;
	Tue,  3 Mar 2026 21:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BTkyQ1MI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0976144DB9;
	Tue,  3 Mar 2026 21:05:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571933;
 b=VyRxZWLV5T9IuxYiscX5ba1Hgpz1i7tpIp9X/cjSRCMzZq9fL3MYxhkXiYclDJ/bKlsD+
 hVCSO0Y7u7/Eb2DF14PCaql9RoPBAabaKP6P2UPLjeycx4z3Tt7l/mrPrt4Kffhxsb1jUGB
 w1aJjHwRdgH+qUjQUk4hRSWlf5xNpMkYKHhmq56/EBGlYqqv2gJgzgSWrGUfqutEdIWz2wX
 TPSoIETl2p0ShztstjdTJI0TR/mjM4suK7JRp5OQMmceH1n0Zfx3SF7V7UEqV2iNOWuTSkJ
 39C0Ktg5iTY00QR7qkfs/BEdG03pP69ToPw95QoyhkHTwXbR/EflElM5QYeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571933; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qLYDkNQ8A4x2T95jGRETa6NwStvleq7OKd2uXV0vocw=;
 b=vUdRkVF9fU9lReKelYMFyti1gN2wU9ZHB9fz9T6fhQ4Alht1kNYOqGl6oceWMuYkrFbzZ
 cGpIWpK0k3vHJ7qYG7cdsXs6h0bGJIw/w2fYPivYH9VoYxXdSfWodu9z8bzNrULXmsXCYcC
 ocD21oa9Bm647psaMVjcN959YJXlvOSXmF8V7aZWvB4JvjMqATnVVD2ikhiO5Nokvw7U/fz
 vt5L4yGCHUJbD5mH3087jRh/nU+MHLZYTSxHgDscp9hjPaVXHS7VV7879ia7oYYY1pKA17E
 STR9JAMy8kgrmVpN6wE12QOPUbRbKeRNbC3wSt56hu7OLUaURLbC0gcFtIeA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 02E5D44CF2
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:31 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5061910E8F0
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572548;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qLYDkNQ8A4x2T95jGRETa6NwStvleq7OKd2uXV0vocw=;
	b=BTkyQ1MIwdUr4SBnXaUoXkx2/qFXyrU5CIbfGcjArGrolbt/qJhAi2ziLVJz6vGm6IY23v
	UryGmw1nwaJVbxhzmYw/2pymwQ8XtHp17lugdIOZ9Q9g6Og820zug/p1Ip5J8SE0Mk91mb
	7FMRsKvQOEObo489Ivyt+Wyxi/oCehw=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-378-9XFY5KGvNCulIPcxZladoA-1; Tue, 03 Mar 2026 16:15:47 -0500
X-MC-Unique: 9XFY5KGvNCulIPcxZladoA-1
X-Mimecast-MFC-AGG-ID: 9XFY5KGvNCulIPcxZladoA_1772572547
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-503342386c7so91937341cf.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572547; x=1773177347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qLYDkNQ8A4x2T95jGRETa6NwStvleq7OKd2uXV0vocw=;
        b=kITdw/YjQwNHbF9GRkJ/BR4WEh9C1pWgKzZETX3GI1ScwV4s9AiWb1m7koKN0AauzB
         PnS7P4sXa+JGaXUM+Iy8XR1ohlNLMKWyl0dTCybLXQYVCHCLY+xSP98hQJHxgyk4lVtz
         ePsHlBKygYFYxlCumE6YskKffpd7zIw6Y8695+p86J7mBIOOzH/nzHEu0UbeLc/pid28
         UPmIvPTAH4LV1KJ0gw4OGFD/LSxaJ2Qbta8vKXFUVLdcOLHOwxyhPQnsAOOmkg1KDmXm
         b/GHUAUiOHM+WGBu30eQQhpCgcVltGVEVf4srcphwkG1jJtVqB6jwBu6s78pR6sZCWpZ
         xPxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVE+EMXP0G9aQXs5ZLjpZUVM6VK8wV83dKbC+Nwq3LzQgBjHB4uWSslc1pcj070+dw36uOgIOV@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzuvGC6KRLyD74PkMGlZqd82g9kdUlNn3un/oKiE1h6zLFMCVQH
	V6Ybvy7giWRIvO77E2uZ+TxGuyS5MumDLa3h+L8pIMpOnhxAr6P6BiyOmblqFFX0elnnEbJ5i87
	BPHtw7IXqBIv1bbgLjFa3rwiV3zNdT8nxEr+ReC/iJH4mugWTG/AtgeEZtEOzi/Ttwic=
X-Gm-Gg: ATEYQzwnmX6kIsjkvaP1E7T0cOre9RkpUS7zTh+BVfkXIKcY1jqUoHOC3AaEhaT+HI0
	qxStZB7Z6F4EGWn6iavw9xwExX8ldcR8hYJCPG4ScfjW8Hzk95e+gqJY2Augs/lp1yJX2pzcxSa
	G9XZIIB0/+3zhbYM97X2vX1eZjFl2IJkOF7Wy24t+cC0GXG602Da9SLqHhPQgX11CvPG5CWE7cM
	q0vv9hVnk9c3rpw4r2XZNz/kcARCGGFoHW4WZvNDuNryKjgoxlxFjaVFxUkpsVkju52SOJzYT8+
	/xbmcG2F49Dr1BFc5ByhJMXtY+OfeC40Z99DTsAXi2+CXbH8PuULOiOmJ8Y0xVwL4YkTF0qNGLp
	s17/f8fmW7mX30H2M4k2WOwkc+A==
X-Received: by 2002:a05:622a:64c:b0:4f3:5652:6743 with SMTP id
 d75a77b69052e-507527cc1c1mr213308921cf.39.1772572546791;
        Tue, 03 Mar 2026 13:15:46 -0800 (PST)
X-Received: by 2002:a05:622a:64c:b0:4f3:5652:6743 with SMTP id
 d75a77b69052e-507527cc1c1mr213308331cf.39.1772572546254;
        Tue, 03 Mar 2026 13:15:46 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:45 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:27 -0500
Subject: [PATCH v3 07/10] rust: pci: add is_physfn(), to check for PFs
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-7-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: lQS-dfHX3hjSKrlgLSyNka8TD2jpmEQ558fR_BP58Gs_1772572547
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: ZRACUQYH7L33LHV5Y5NCX6XI42GP4DKY
X-Message-ID-Hash: ZRACUQYH7L33LHV5Y5NCX6XI42GP4DKY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZRACUQYH7L33LHV5Y5NCX6XI42GP4DKY/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-7-4443c35f0c88@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a method to check if a PCI device is a Physical Function (PF).

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn().
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index db05641186c3a42922e2b6a463de9c1b099a4673..df39ad3f0d5fd898b034609efb03368f83c2a2e9 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Physical Function (PF).
+    #[inline]
+    pub fn is_physfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_physfn() != 0 }
+    }
+
     /// Returns `true` if this device is a Virtual Function (VF).
     #[inline]
     pub fn is_virtfn(&self) -> bool {

-- 
2.53.0

