Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1A50ECD9A7
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8FE8810E121;
	Thu,  5 Feb 2026 21:00:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="BVLbSJos";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DD96641B4A;
	Thu,  5 Feb 2026 20:51:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324675;
 b=VDGhQVwJaIY0WP9vLMoffa/i4cf1B/BxpyIb0zgiSpEnltearbvAJSGUWH3O/0ML98Mhm
 OUuLbO5BG62x3ChsT/ANhJUuSdQdV+9qugyrsx16mRtS+nvGrkNxVwxxTxyvE50AxmH9cr9
 joX+BIwPfxlMm9uyjsc77HNi0OLvjrS8LivcSsI0z1wN9JqlsK/WtXzqydPCioNPKJ0/Yno
 8qwLpF63v/ti69crF6zlrQahDifibMjjYW6SFdXubStR8La9bRRQ/lFPjXW2QtiySdzLzzl
 8KCmbHyVbBVa3jvY348dqrhCMjPtu5l9ZfLm7pwcCkvhP8cCrKDvwLjTwVEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324675; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ADQ8gPT48rFRIIyS12cDuNBpt1e1vav+7FNrnrbDyrE=;
 b=sYDJHEhKnq9rUfrMNpfFUvkSX4zWi8oA2HJIdqiftL+YwxtSLLyL/BCN55Ct3FY0vtkHf
 iXPPLaEW2T1V+uWIWIOtjUf9XEUu5GR90umhyK47kdibq59s4UuclT+VLhUW+OkjWi/QCTN
 6ItRz9/AH2ZkRPCitMgGUGy086U4h2arz6hdQPhCNNta/5aQPycbkEJ/pXihURqAGZt1B1g
 GfCO0E/gF23G8DL3afcxRfUAO7ujG7Tyf/b+zkj7uDPBnv0RRJnRv3VQd/jpHyq3QgQu8Du
 2xMiLFpDxwgzpB/Rrq/xKDZM1CXOVdT/mdyIBOVOHnNhSQadC0Mmuz8+iQkA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 055B3402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:13 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6D77C10E0F9
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ADQ8gPT48rFRIIyS12cDuNBpt1e1vav+7FNrnrbDyrE=;
	b=BVLbSJosjyduorSE6ghsZloHUt4JxspXuT7fClRGmWcpavJVoWj7UnJ0IY4wMXhuUx5uFC
	V1CxgS6CiP4IhrsWTMte4n1N6XEc5vPRWSdO+NOFDfPCvcrTgtnUy80POZFSjmtncHVhA2
	pxIcSaQ5QTiKE5dVAOH2Ar/2WWpKiK0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-22-G2D9UQs1M4OjQFGGz9hx_Q-1; Thu, 05 Feb 2026 16:00:31 -0500
X-MC-Unique: G2D9UQs1M4OjQFGGz9hx_Q-1
X-Mimecast-MFC-AGG-ID: G2D9UQs1M4OjQFGGz9hx_Q_1770325230
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-8c70e610242so380967185a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325230; x=1770930030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ADQ8gPT48rFRIIyS12cDuNBpt1e1vav+7FNrnrbDyrE=;
        b=IBuyqvYGTmkMfsbscQAzkHnIO5crkqnU/pK+0HE9dDS+909jj9NmdwgCTM4wosS3tr
         jokwL1Q2IcREGBszolxpoDPM0IYvO/+IiD15d1PQSorjH3ivM78IbrIs5V5UTkvX4I49
         YtKC53fDLmcq+it6+A+zIWseuFu/tmUTukDyLpu4F99QmrMvh1Our4dHXsKtqOouxff2
         P+s8Bi90kvgcW9HWhf0HopY5KVvmr+1tHi7XqmxZnoFtUhH8IN6xeV92RFKU2dTGc9Gc
         AxsyoC/YjGqLwuZuS0TmsZ3YGPxB1uurA4v5NGAG/aF23x59EsaqCrTWQZVABj5bqxaC
         kZWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZOPoh/T83RrVvYi3SAU+iu3FisGdfaMowwIEBJUhG3IpY8U4LKEoOUeFaJw9lujA2E89d+uMm@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyWJdJLrLEYkB9W0BAzHFzQLQ7PbEHNpKlbIgHaE8u06lMtoFck
	YcnaSIxb9vCqFK7TDAp8KbVHwveKI9iE4msEA02WmfMTIQ0RczZGTqF5UtcCx+ZZuk547K4eZ89
	9fCv/HJKVjDdoWobEmUd3vnopzYqFlPpZyQVwl9u22UxpQgnd0Pb3So9v0lhVCBFVuz8=
X-Gm-Gg: AZuq6aLU9kfJsTNUcX3Sfepa2f4jIr/RLdppSBgrkJ3diGgWE3B6KRSXM0v4L0vDpZP
	7EJCNBb907JJjjYzFr963SgZrUpGIJ47QzhLzzCJtls3An71UrXggZztnV3xofimhXGa8wInEo1
	3l/s7AMmgxZemv75YiF/hVRlNI8pN/Nb2RVMSQyxukgzJJEgij9hmnqU0qKQFD5XYbzwlxme6V9
	DokCSbEfH4KMftlqP+nrJmDEt48b234AWKM2o9ps/oCIy673i9lqXOMAmywclJAsSTRXCNuB7oL
	MJOM++hq8zcLFdx0NTUijU+4ZNyk5JHKz9x6QrC1rfI/P/fLRycQA2L5jk93v1Frj+jCGSv5xRw
	XkHX+34sEXuV/gxw=
X-Received: by 2002:a05:620a:28cf:b0:8ca:d5cb:6842 with SMTP id
 af79cd13be357-8caf0c44afdmr60944685a.44.1770325229718;
        Thu, 05 Feb 2026 13:00:29 -0800 (PST)
X-Received: by 2002:a05:620a:28cf:b0:8ca:d5cb:6842 with SMTP id
 af79cd13be357-8caf0c44afdmr60935085a.44.1770325228925;
        Thu, 05 Feb 2026 13:00:28 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:28 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Date: Thu, 05 Feb 2026 15:59:51 -0500
Subject: [PATCH v2 04/10] rust: pci: add vtable attribute to pci::Driver
 trait
MIME-Version: 1.0
Message-Id: <20260205-rust-pci-sriov-v2-4-ef9400c7767b@redhat.com>
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
X-Mimecast-MFC-PROC-ID: gm5B1JDoxVQGK5AON_N7-DhHmgQzh_3M6_8W_b8IHlY_1770325230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: DNU5UNUFD4PWLOHBWYVCROUFKKCPDUEI
X-Message-ID-Hash: DNU5UNUFD4PWLOHBWYVCROUFKKCPDUEI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DNU5UNUFD4PWLOHBWYVCROUFKKCPDUEI/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-4-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add the #[vtable] attribute to pci::Driver trait and implementations,
to prepare a subsequent patch that adds an optional bus callback
sriov_configure() to enable or disable the SR-IOV capability.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
---
 drivers/gpu/nova-core/driver.rs       | 1 +
 rust/kernel/pci.rs                    | 2 ++
 samples/rust/rust_dma.rs              | 1 +
 samples/rust/rust_driver_auxiliary.rs | 1 +
 samples/rust/rust_driver_pci.rs       | 1 +
 5 files changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index b8b0cc0f2d93599358c8cd6562d23c27e4654a87..3944077adf550ac91422ca1cb235365b8502586e 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -65,6 +65,7 @@ pub(crate) struct NovaCore {
     ]
 );
 
+#[vtable]
 impl pci::Driver for NovaCore {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/rust/kernel/pci.rs b/rust/kernel/pci.rs
index e1cab1574a3d309d25bf5267c0b0d8da8fb66d44..a4c27c674bd8bdf5e3316789d38d566e90b93fe2 100644
--- a/rust/kernel/pci.rs
+++ b/rust/kernel/pci.rs
@@ -278,6 +278,7 @@ macro_rules! pci_device_table {
 ///     ]
 /// );
 ///
+/// #[vtable]
 /// impl pci::Driver for MyDriver {
 ///     type IdInfo = ();
 ///     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
@@ -292,6 +293,7 @@ macro_rules! pci_device_table {
 ///```
 /// Drivers must implement this trait in order to get a PCI driver registered. Please refer to the
 /// `Adapter` documentation for an example.
+#[vtable]
 pub trait Driver: Send {
     /// The type holding information about each device id supported by the driver.
     // TODO: Use `associated_type_defaults` once stabilized:
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 9c45851c876ef33414eb0071c42a2fb4ac3f1e78..ae6f7328b830e32bcaf7f8b5f8b1f117135ebf8e 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -51,6 +51,7 @@ unsafe impl kernel::transmute::FromBytes for MyStruct {}
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for DmaSampleDriver {
     type IdInfo = ();
     const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
diff --git a/samples/rust/rust_driver_auxiliary.rs b/samples/rust/rust_driver_auxiliary.rs
index c20961f168356c6bbe0faefc0079d7a90b013684..67a17f4b4657b5f91a4fc603ca7025478d79df2d 100644
--- a/samples/rust/rust_driver_auxiliary.rs
+++ b/samples/rust/rust_driver_auxiliary.rs
@@ -66,6 +66,7 @@ struct ParentDriver {
     [(pci::DeviceId::from_id(pci::Vendor::REDHAT, 0x5), ())]
 );
 
+#[vtable]
 impl pci::Driver for ParentDriver {
     type IdInfo = ();
 
diff --git a/samples/rust/rust_driver_pci.rs b/samples/rust/rust_driver_pci.rs
index 4dfb8a6a47077d2c565b09f7c7822f7f5e2641c8..fe4db08d42a74abb5865c75968249b58bedc01fd 100644
--- a/samples/rust/rust_driver_pci.rs
+++ b/samples/rust/rust_driver_pci.rs
@@ -92,6 +92,7 @@ fn config_space(pdev: &pci::Device<Bound>) {
     }
 }
 
+#[vtable]
 impl pci::Driver for SampleDriver {
     type IdInfo = TestIndex;
 

-- 
2.52.0

