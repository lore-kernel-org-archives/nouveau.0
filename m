Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F97ECD9A6
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0510E12F;
	Thu,  5 Feb 2026 21:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="B838K7RV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2711D41B4C;
	Thu,  5 Feb 2026 20:51:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324678;
 b=pMmWHJoi/NS9dyqw1Y0ELyUGmQn71vWcOQK/SMYTjqxJ6bpOBb0uon/gzMb/j8aIvN59T
 7miPARdKLi0azhhKjUQQR+unGxpSjwQDOeE5PM8K61fk6dJnPnY+S/k5avkQ7P7YHWRr916
 Nr+nshw5HwVLzo9/tLzbHIClpUam2SePcHb+1rKvYToF095/jr0W5afkwBP+oyFggmHIBMo
 nzzlCStaqGTcFuwDPs/OB6xF+OVpXWAARgsh49PRwSnJlE6kfNU2CGl7NPR1tTNiR8U1K2F
 tN3ocqoCsOL6/1gc+DyYrp59FFg52BddUfigZXvcaewnZJ8+3yRgTAwdltHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324678; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
 b=JlhAiie9s0KqbQap3yW5YFv8m09jF692UAdUKBTCv9Y0DnXkKad+XtSx4smr6VYh46dPz
 7PVww+EBkfD90o9oBX3BtSBPd7Lbdx7DQ40lFwm+po1m7AvPvSHRXezv3gv+XD0Igr96Dcn
 Qiq6/58/BLfSe3Aq/81XyCW4MlxuDGHGKP+fqRg+vnJqu7485ayuZieBoNF4ir10z1khpfU
 6zmMqmx4nNB6HVf4NcMLbKks5+PxOhj/RE+zJmHV9COK1kjIdLYyDAwGGyaCuJCHp3EHBBw
 W1JmyPHEqS9J3ZAvBsvjwpQ5/gYIyvJXfna1Zc9DZznZQ3XNAPEAmYPuUvNQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B836241B47
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA3C10E0D9
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
	b=B838K7RVZ3xvEyVUrLjkRi2Mv926uLlnBlH/Jc+7jGLN2q9RyTqfAOEt0Iijwy4e4UWe+/
	9A1FMzTVr3CXgWlv+YhyVsuT+/E/7MWpaLVaLcs3rIMKqYD3HWBhYz7BGsryJG8T4yAFcO
	TDiiEu0dxWIQfEmkXWXxiBMqaySVAWU=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-360-jghEt4q1PDuITJRtUOlgbA-1; Thu, 05 Feb 2026 16:00:34 -0500
X-MC-Unique: jghEt4q1PDuITJRtUOlgbA-1
X-Mimecast-MFC-AGG-ID: jghEt4q1PDuITJRtUOlgbA_1770325234
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-8946f51b8c8so59594476d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325234; x=1770930034;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qEZ/NIGEd7tvljUjuiPoVXU22CsIWWTrf8BQDchgWf0=;
        b=MLM8iyuiwd+IDWQXGGpUj1YVlL7VFJUX1X503jRVYoK9PibUXc3B+SU00FQALQnGnV
         OkxIv1EyI5DGZhP8+93UVcypJrq9oTyAF8gPggVAUD7GKeUP47nHDHUK2UZfYQ9nb2cF
         OPWmMohGdMfqqyM+GSnIgUq7nc5NkuBAor3750eIap4E0ZvZaj+Hy0194solTY75lRAY
         foxiB0E2PwfieJpF2yoDe2w1a2qDUXjHU5nMnXBB+tGJH32VrbeoE+LuaMTj+HZjqEnb
         +dqIGWEn+gHFmDVvyTvIfjTk+7Y7V24kufkMlY9XATABNxHJSDL9rI52IlH2Kz0Z4VUO
         +fDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ7TeKrSoKs7KZi2nfL96uIbTacDriT9KBN8PRcBTXdMM28zd7IfC0dACuBDhWsJJTsN5Q0pZ2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzotygjgkpUVZjZTqvi6FhATJVi/9EHeGWWyrcCUzRTllHMP1bh
	iEzAIfu4vXJ5GncEdwYXae0js1aH+50H9epsuAygi/W18EkqhmLSJRqwI+OOFLU/C9u1MSkP9Uq
	+MFeJZLtUnZOZZyARSpuT0Z5EpGm1NdoOqgv9mmck1ARFy5wBAT2eCu6cCYC8omNJLG4=
X-Gm-Gg: AZuq6aK5G+NO++OTJH6wSHQ60zoIownZF/OmBSm/6NYYuIScRNZNEnblG65mdHYTsPj
	QO+mDa3xBjpJ/5Jd9/7fOXnzD/0hhhK3oEEmgbzUQYho2nIXe4XUyOjkAGLSvGewX7ILgwrWZAl
	xSA5IuysNrNYdnsd6VQGZzvFOElq0SPxAsmf1JjHRZdcsexvOBSbkUqexWQJQpLyJw3Co+Z6WxG
	G5VZP8Ph1ifEmBCsYKgFNQKtZWDP4ir4RDi3RxY22ktf3spBYGGzjVm2ZTIkKUyuSJzkmZ1aJWJ
	PmFSh5fgD8kKS7Xlkye6W3nvZSl3G7Y/b9CuS42YU1di7CCT1De5g55OwA4K9ZnMlaHdy7BD+/k
	i86p22mK3uXay5kU=
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-8953cd9c94fmr5942296d6.63.1770325233504;
        Thu, 05 Feb 2026 13:00:33 -0800 (PST)
X-Received: by 2002:a05:6214:4017:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-8953cd9c94fmr5941106d6.63.1770325232827;
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:32 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:53 -0500
Subject: [PATCH v2 06/10] rust: pci: add is_virtfn(), to check for VFs
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-6-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: 37qKJdrOridhM2Y40M0Ww1rpwekEzxzJD9Wt0wOgHT8_1770325234
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 34OHEFUM46ARFMUL55DJN4GVTEX7NHWE
X-Message-ID-Hash: 34OHEFUM46ARFMUL55DJN4GVTEX7NHWE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/34OHEFUM46ARFMUL55DJN4GVTEX7NHWE/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-6-ef9400c7767b@redhat.com/>
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
2.52.0

