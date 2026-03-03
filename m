Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57CA2EDEBF6
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1E16B10E8F4;
	Tue,  3 Mar 2026 21:15:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="dwcPEOXW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8635944DBA;
	Tue,  3 Mar 2026 21:05:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571937;
 b=Ykf4t3k2bsK/qWxlcr3YAZGH9lGZ0Dnv+PW3VoPE1SkrXR4w0LFJ+z1Coy3p02GYjK3ci
 VmMir2oUNJ0uXTdiv9Tfbon+gS838xmyKMDxATScRnhCyiIz5NAyZiVP4KsS8t+945zmDYl
 kyXC82ylO04C5r3mEY5lFQPp8vK+eEYakzaH8Af/bKD5YOg2DOOHrFrqDaBVKls1hQhoeLF
 Oa31B87hIGfXdjNRJ6n25ES06a7lvGydg+Q32y7KNRk+3++VT2ywspZcwNCI9mx142+pNXm
 OjbFCUqffkbIOx53aO24fOlqromFw2FIWnjmo0IOEPsCx1gVXlhNukHWUIEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571937; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
 b=Qknv/jyee79SZXUEfXL5HNHeU8Hjl2M8YS6Xf1SpV9XvANIzNFlt/h2eWvwoA4NPt7yF3
 1Wr10pkIDIBjcIE3QeA1mriSXJtyn0jftjUoYAEA0rvnGwxFhj0I0mQRMAlzg43D2ikuqJg
 ssD5q2MIQXa/1has6sefPea346ffqVtOL0Kh7Ma5tjpZjovgJAcJaaDY3fibyVdaUItBrBZ
 BSkVuFBV5rQTb3Fmyn1usVtHhQwSq5wiLMqYG66Ts3/y24EfFrFQOi/QbMbjM+HwI+ttY8p
 3emEFeJJNWVTaJqNkoJy8tD8qJwRGVPGeMhY47ciKQGmHQWUaVXUSvlQ6mUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B080440469
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:33 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 04C1010E8DD
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572551;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
	b=dwcPEOXWn4opOtp5G4RGm5qe6Qz8rm7pfGdh0iMeUmwtKZG1yxHkIjnz/6sJhozPAg+jGw
	BPhmntvzfQDpKMFQMutl5w4Jxup0LEhbRpr7gCvdTgViYsgeXzt/BoyBXL0C3zI7P4NxJL
	YVXY5CJRUTZn9VOUgJbM7LkXFNyw/XU=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-26-PGGGsiBTPiabKaU6gquHIw-1; Tue, 03 Mar 2026 16:15:50 -0500
X-MC-Unique: PGGGsiBTPiabKaU6gquHIw-1
X-Mimecast-MFC-AGG-ID: PGGGsiBTPiabKaU6gquHIw_1772572550
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-50340e2b4dfso653365271cf.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572550; x=1773177350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Nsl81xXoWOrG7fZ6D3nnOVMYFTWE73QzzhAJNIpS3Uk=;
        b=WRgGJLtlC4+HgrsVa663ggMmdkAgCCOX0aPQZDk9XC+M9FWVlmMVvuw9Ku3ZtyiYmc
         vk5wo0Fi3wDn2vuvR7dD3zBs5yOf6chQ87WebbF+FHvuObV0nvk/D7ph3T22+Syzbxjv
         XGH7+pL5x9PHTCnHWvXv7aq8uDBtr449TvMNxP0Wxpz4sHFHuFgSLWzEFHOqh0+8PXtG
         Bf6Wf5Y17IEyx/o9qrlknXokJhPN2r9RzL+9Yf3gyXR9AEVWXNFyxV5xCCslNoq05vM2
         v500DHVS+8Q4QQx/sKS+RAHKduoviJghAgENev3vudJVM/7zOSpo7c6jhbITw7wQ7nk8
         z2VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/vML44tkOSx3jA0Uc17RT5uxDMNAtOaiOZIxjmVHKJ9PoYuFkUKoBso7uGvOceV4En2rw1REJ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywmq0/+2M9C7u8ksS+b1LiiLEZA9RPb8Q67eoteP77xEnSay2jA
	rnyVBYYUQwbfOr/m+d7TWelU5/yq49NOmwfpqaW7u2tfGVlkXa93/kETBJn7zmSIaW7wYeSfQO8
	aL1UmCpLWD9EGtsAyTYQ4fAUoZaB1hi8tJcULuZjVgxQ35zAPX0xYQj/+BHRTvhSN7rY=
X-Gm-Gg: ATEYQzwxa0ivaUoy21LW35+i1lbgbc/63oxbnXNR9wq788V0u54djhje1m3r13Z5/ct
	11y0xbd+RAQPdszJz55mc4hnQnklsIUNCii6KImuKOOqUHwn3B9qr8sgyPkMaj3OfjS9fK1z4Vg
	Eg+fNqDWzwCOCY2YireJm99HNedSaqPMWyUsFkDKBnKsN5wK+rQqdQ7PJZmo09eHCt1R/ahb85u
	A/8kEnOobrVGUiJFNdS/A6Gf4UsBhSJ2VkhKjFy8LltWWuKkOo9UYFSaCBttv3VmZU/9cMJe6tC
	aege6z8HRBQNZEdlJ0b7dGAEJAQ0o4Xq5KWHwA8N2HnZ+mhVEF/RqAn0UCffAIjyqNlk/FryhQ6
	E6GRfjUl8+hN1HwdejEQuK9H5uQ==
X-Received: by 2002:a05:622a:1895:b0:4f1:ccea:6744 with SMTP id
 d75a77b69052e-507528db6e5mr222734531cf.58.1772572549580;
        Tue, 03 Mar 2026 13:15:49 -0800 (PST)
X-Received: by 2002:a05:622a:1895:b0:4f1:ccea:6744 with SMTP id
 d75a77b69052e-507528db6e5mr222733911cf.58.1772572549028;
        Tue, 03 Mar 2026 13:15:49 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:47 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:28 -0500
Subject: [PATCH v3 08/10] rust: pci: add num_vf(), to return number of VFs
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-8-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: rjitSe29vYgraQW1ju_P9EnEneMtWh0Vbkkcj6t1rU4_1772572550
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: R3CKV3UIM6SUHUN4SLSZZE54HSTJNCTS
X-Message-ID-Hash: R3CKV3UIM6SUHUN4SLSZZE54HSTJNCTS
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R3CKV3UIM6SUHUN4SLSZZE54HSTJNCTS/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-8-4443c35f0c88@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add a method to return the number of Virtual Functions (VF) enabled for
a Physical Function (PF).

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index df39ad3f0d5fd898b034609efb03368f83c2a2e9..581930d0afe98ccc29d729e4d9aab75b4144e46c 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -498,6 +498,13 @@ pub fn is_virtfn(&self) -> bool {
         unsafe { (*self.as_raw()).is_virtfn() != 0 }
     }
 
+    /// Returns the number of Virtual Functions (VF) enabled for a Physical Function (PF).
+    #[cfg(CONFIG_PCI_IOV)]
+    pub fn num_vf(&self) -> i32 {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { bindings::pci_num_vf(self.as_raw()) }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.53.0

