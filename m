Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEFFECD9AA
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDA110E15E;
	Thu,  5 Feb 2026 21:00:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="S5Bnq9Zw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D216741B4D;
	Thu,  5 Feb 2026 20:51:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324680;
 b=bb2egcpneqSiiz5SZBTUDwjbda+SVgbiOSaJj2XRbTp1cSZ1zEnUSfGvOWlJcGQXi1p1S
 rr/LL1CcrDz1B2JwuEYGxL2jBswmb/byenPXMeLg1T5L8t3xQjn8W5KISoNHDkpsqbcgFnR
 fl16kVZAFooF5t/1bgij71Y/YN2hox1zrpfXx5cVoyZ1K1aJwWAZ9z0VG+iNnzhD+uEAXW8
 bLwanb3ezkGRTc+sMwKOl86O4jzKkRUzRbKAOAPBmR/MSEA4IDqugXNXxFeyQULKW/rqRHK
 8u2c7O9K3sFxtBMVbJ+r6HbFAJpj4IR9Kt0oaIPw4cYIqpVCd0xv0kstTz3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324680; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
 b=SKuoD5LuzomUQ9la3ocr+qXT+U92HxNQ3Bx2hIY9Su5gkE2WAypmYmmuSTE6Q4mkx5Ge1
 i8jzerWKSKcpovwi3RWc7xPUvqc6WP/ZNtpWIsVUIxtpUCzRbzN+7ou9UVW6pkLFxW8nXyR
 cHtKWBaPGd2dz/jAERDtBqoRMPdL4HIPvMbqyaKyqPoLIWet2gN5Nn9F8WrrmXSTIUVP9cR
 cWMWxn0gM4fPEU91ntgrZ+gI6/v/aeGZ9IlrW2q0pp6vAeutZ814CcC8bl2TZ2MEuaBJEbb
 KYQPyPok0rICiYpCsLZE9Wvy40AO7xIR5JniwL/jHFMNSpgF82ahjSABvsWw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C61EE41B47
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B7A510E11E
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
	b=S5Bnq9ZwrCaHAWjhsveZG8+FeBF8WPKG05djIc2YY5sjWU6PJ0DHkEWWaVjkacvJCpynza
	colUDhZgNV1Sk5epkD4tZQYrlGbgMatF1pFQHGAiwfNxm3ZFpsGLxkHFkuj/Bnsg5vyW12
	s01Crg7fOXDOmkXzS14aVhhxR3PUFtM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-iuu7P6xtOYiI9ReoIgehFQ-1; Thu, 05 Feb 2026 16:00:36 -0500
X-MC-Unique: iuu7P6xtOYiI9ReoIgehFQ-1
X-Mimecast-MFC-AGG-ID: iuu7P6xtOYiI9ReoIgehFQ_1770325236
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8bb9f029f31so505693585a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325236; x=1770930036;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2gGPFCPOPX/fBbf5qQfZiwEzewT+3Ulk7LVkRWF8dEo=;
        b=t3IeQOlJEADRhFwx1jEDOwfFMPQHct/aIsSi0OAf6e64DftfY2kkAviRaN9D+wHwn0
         PktxRiolQ2cFQuJ3HV7DsSBkJOF6Pf342QxLyY9rbb+ivOtQDUOetMAK9I3gKNBmyKXA
         zCD/PmGyHJhwLpZqtZKUOkVjZjIZTeKwpxYXbnf4Wm+w3DAA3zFX1w9mc4SoFoqw9v5K
         d/XRe1WclQoO4l2N/8VeiP2AhONEH89ARCd42lVlqlLWlkQ+qcrp0uYJAHnt/vhBZBOw
         s8XBcqdahrLWHSgm+yPsncKj7Pdxem/Yv0MNmsqVsrUH5IOqAf1p/mVHongLx+Etv2kd
         u/xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYE5e8C9g0aHDNnne9yIVH1ZV03ealpxHdn5KHull+1sXKP+nwUeRedt5Vimb1dZVYbETDzhd3@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYewJfEqBbjqBeKrIIRsPtWlkHIMCZOB67aq5hFkpmqVTbWP7m
	LP9rRavbtNSe0R18N97WgRL2rzahN0i/e2Qo8BB2TyAzcoCYyr879/SXdd3vjU1WnaQa9xk2QJf
	E5FreLY337IzGrZmyVHsR8P8JwMyoBkmjDju+3HFOTTRCUsm9mLXG9EsczjQUTj35G4U=
X-Gm-Gg: AZuq6aLTNtCAxKA0gWC/YsXW+OqvAOXKorEEl0U2+7v2lUMSN4NE6OWuGcGtHRx/dnE
	bVTMjohynY0bkAL6XgxLHN5ThGQP4pdMjH6IuoY0xQOn8bmi8XAgIwnzoBSo+BeaSbRYo5//2Yq
	jMXRnsTAedaq8Bb7n2zD/zSA0duSlm3uKAkKgDK4JNPvH2QU3LnqiwHbouG+KtmSpaVYSMI9hHa
	C9WjVPusmIGRGsR92C2WxkxjWIgDKwBWlYJtHjemIXAmneRKW5nwBHKh9Er7dzCEP0FF15bsPUS
	APrtxLY7sqptCKFx4MipPYAHj4b3O8YfJ2VOf4xkiJ5y+SQnhJ4/qQFHZI7do7IPc+vzsyt2bUC
	ZkzGuuO2+xI18qHg=
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id
 af79cd13be357-8caf13fedb3mr61793485a.67.1770325235708;
        Thu, 05 Feb 2026 13:00:35 -0800 (PST)
X-Received: by 2002:a05:620a:1a04:b0:8ca:4438:b8f4 with SMTP id
 af79cd13be357-8caf13fedb3mr61780085a.67.1770325234922;
        Thu, 05 Feb 2026 13:00:34 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:34 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:54 -0500
Subject: [PATCH v2 07/10] rust: pci: add is_physfn(), to check for PFs
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-7-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: dYefomHsfs-C14K5gLrM4MWdGugA5kmR7AqzVoRlc30_1770325236
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 2N2OGBMYXXCGPCJUMCZVSO62EFACBSAH
X-Message-ID-Hash: 2N2OGBMYXXCGPCJUMCZVSO62EFACBSAH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2N2OGBMYXXCGPCJUMCZVSO62EFACBSAH/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-7-ef9400c7767b@redhat.com/>
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
2.52.0

