Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667D2EDEBF9
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2A13810E8F3;
	Tue,  3 Mar 2026 21:15:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="d1agVTT1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D4F144DB7;
	Tue,  3 Mar 2026 21:05:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571931;
 b=L4VAOZnBsMfsSI5yZuawJiFKT8qV9J+W4fViMGYeETBytlbKxl3xyxPTCjHveUoNTx8tG
 H3NdG39QTseF+n2C/MplewyYj9NNbKN3KldeIopYJ6tc76RJanA9WVCDRqn7op2wDCQFMJ6
 kAxpAL4uEfCYoWSW1L9zySBEpRJbf/TpHLWqhpdoFw4lTSH8xPsbUzowdgU4p47O/L/CQm5
 EmJ57Mx+9T5PJoKwfDMeKTYZ1dQDQUOp2LKqU/aQPGM20en85VenO0UM7CxlmUi9Hely+oy
 qRRhu0PQgewKy8+fIrERUxCA7QPwfKtjIQZ3bbrIE+ZO7hZTr4IID4u6el+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571931; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
 b=cQotrLHAARIm4WYO9Qcb92PjTGSGqCNqaXDp/ql14ORJffQcmEz5hwGc6W/NCTWJcSSrj
 ptKXHyOMTGXqlxAsKzXemcgchGU8fJv+158GqY+OOh/pSPq0sVIivm/3oaC0+H3i94aP61n
 PFQddTy96SJI1hYOzCUQZ5Br9P8Ynvli+R2x1ME13gpOQtx8dQcxlVr54vCQzUzSIUuSnLo
 St0R6o2eiri2eQvJwx7YZeJL4SzWYr9gBSt16lh2QuTe9Wlho5AV+sAmlvaB9o8Sc6paQse
 WicdiGPZJg+XVSd0D1dFoz+FDdwaQ90nz6Y3xf1/KHec+trR7uccD6trIEIg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 52A4540469
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:29 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9ECE710E8F0
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572546;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
	b=d1agVTT1mdHe2RTcnyqqu47Hr+4NPzeFPlaO7lQyK+XY4kfWdXgMB6RgxkSerwvoVXRE5B
	bzQBh2MkjW8m/GDJNVnETrOz8RimqCb8sEYaJAY+ml/0X9z0zZhuljhtltUpDz67JKk+CP
	zkn9swyNG/bYIi0VCEWI020vrHOh9JY=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-HrcNOI91NHCn67anpK_9ZQ-1; Tue, 03 Mar 2026 16:15:46 -0500
X-MC-Unique: HrcNOI91NHCn67anpK_9ZQ-1
X-Mimecast-MFC-AGG-ID: HrcNOI91NHCn67anpK_9ZQ_1772572545
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-899f619264fso177752066d6.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572545; x=1773177345;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ld6zN/9/7YmG/EDhmcZckbqpb8XwO0ah+2Ai3kR30j8=;
        b=VmatFXFAetiPOHzd/NUU7fgQe08ckn4UZAOyn+HdsctmHh32wosnANAMioIG54B/Bu
         yM6kSOEXPABUvVirHRyqGkTRLugKIl0MXH6ZVkNgfsDDVWlp7tMyuX3xS1vwcweIXOuS
         MjLdvoVawoioaCmMLowTdRYLKtwZrYENQAwF7QtHa4/apiGH4Wh3yl9Cxz1FEBOvBlfA
         70k3zaX/TOM0Ckh3G26iG99peGwCrYw1DvTONerubyRd3b3DNSnBkKh9ZMY1wLixtgc2
         GPKU55Yjw/z9m/qsgfwf3mZr0xPHMYKb+y/MpKnMmHP8t5xr6/kVdSvMB2BqYIKaN0lS
         mIwg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhjlS28TIpdhADct18AFH3Qqg7NqFS9FUkdVKOsDJLUMxNzR6LbS4Qo3mpua+seJh08ZKtNNVC@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwgT2VgJiRmVGf8kh2FLm4YxXbG9LOUTy/emykMSpFwQJdViSae
	qfMHZsEw+Q0sIrj9fv4IY5CY+grb1iT/ROin/Z+mCZsbQiBe4wen/Wluyal0w6Trf5GUNY42jtE
	FNGZU+Ux4gHmwERanBvw5HZGa/5xcZ6tKyQX9rGbRyeLzR0g7OqMYXZx5IBglNzvXtGI=
X-Gm-Gg: ATEYQzwjHxmeffTYa7MLMY4pSbFv/dS/EYIclreEIY4OA4GhVrnw8GJFGTdC8zD3P/7
	8mhJQJ9/TV+SpMP0natUDGEZWP1gI64Es8P5Fj7OzLw6s+IO9KjpmgGcN3myjQvaLhmVFgMRY8s
	yE4n2HDvK3/ztyxnK7HjlRiuIGFyjId7F14is/2BEBcj9WRhtvry2WaLkgxcxwF2kP3Jky0KItp
	Ah7n51FKsVHQvfdCoyZ5BjchaePlmqn63sCw8td+7F+NL75xw5+ov6u+aa/rWKQtlNzLmjlbcQ1
	l9N7cBh+YrFbVpYdG17fQ4ec51acibSeTCv4yS8NfxRoGuJRHovtPD5DcEas1RKEG53Ytokh0PM
	gSQ70GHDsO3I8KfZhMkLsiWZBkg==
X-Received: by 2002:a05:6214:509e:b0:899:fdd6:9ada with SMTP id
 6a1803df08f44-899fdd6a682mr113463846d6.4.1772572544975;
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
X-Received: by 2002:a05:6214:509e:b0:899:fdd6:9ada with SMTP id
 6a1803df08f44-899fdd6a682mr113462916d6.4.1772572544344;
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:44 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Tue, 03 Mar 2026 16:15:26 -0500
Subject: [PATCH v3 06/10] rust: pci: add is_virtfn(), to check for VFs
MIME-Version: 1.0
Message-Id: <20260303-rust-pci-sriov-v3-6-4443c35f0c88@redhat.com>
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
X-Mimecast-MFC-PROC-ID: Qgn9BNWbVCn0nTCiP6wFFvjaAo_demDkVc2c5cLjcEc_1772572545
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: BVQ3P23TVQREOB3L6SHRSSOQRHEJMURT
X-Message-ID-Hash: BVQ3P23TVQREOB3L6SHRSSOQRHEJMURT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BVQ3P23TVQREOB3L6SHRSSOQRHEJMURT/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-6-4443c35f0c88@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: John Hubbard <jhubbard@nvidia.com>

Add a method to check if a PCI device is a Virtual Function (VF) created
through Single Root I/O Virtualization (SR-IOV).

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add #[inline] to is_virtfn().

This patch was originally part of the series "rust: pci: expose
is_virtfn() and reject VFs in nova-core" and modified as follows:
- Replace true -> `true` in doc comment.
- Shorten description and omit justification specific to nova-core.

Link: https://lore.kernel.org/rust-for-linux/20250930220759.288528-2-jhubbard@nvidia.com/
---
 rust/kernel/pci.rs | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index 88bd114970431bf8c3edef94c1d48567d895eaf6..db05641186c3a42922e2b6a463de9c1b099a4673 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -484,6 +484,13 @@ pub fn resource_start(&self, bar: u32) -> Result<bindings::resource_size_t> {
         Ok(unsafe { bindings::pci_resource_start(self.as_raw(), bar.try_into()?) })
     }
 
+    /// Returns `true` if this device is a Virtual Function (VF).
+    #[inline]
+    pub fn is_virtfn(&self) -> bool {
+        // SAFETY: `self.as_raw` is a valid pointer to a `struct pci_dev`.
+        unsafe { (*self.as_raw()).is_virtfn() != 0 }
+    }
+
     /// Returns the size of the given PCI BAR resource.
     pub fn resource_len(&self, bar: u32) -> Result<bindings::resource_size_t> {
         if !Bar::index_is_valid(bar) {

-- 
2.53.0

