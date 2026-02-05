Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4969DECD997
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 21:00:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66FBB10E0CA;
	Thu,  5 Feb 2026 21:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LF/DtkmP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AEEBC402B7;
	Thu,  5 Feb 2026 20:51:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770324664;
 b=D2XBEKOrasZBrcZGZk8dPYeuHkyuttlzDsUfbKSuHA0vLrIKZOxePrg0BYXXDqviB/7HJ
 MU+yoBKdhM9EYg6aoBCCP52KvopAMyuPdpRbZJzHEFYUyEZ6dF1L+Z2Gb8wcovLgg4ZpZaf
 SrLYFX+C2Fzi7NlF8c/40Mmu19LNOUoaxjdO9nuxYG9/naU2+UCapIIHDIOJJhDLT8cg5kh
 vd2u6SokR/kniSQGh+U4a3PrRPApOdnq8TQyvLCxOd81vq8OOBeYlWc7N7mW9SKx3X/HUOz
 Rei8ElH8Ozwozp7DrXPWhYiSLqk7jovkc12IeVUCL2Isj1TcwFwis4Y6hX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770324664; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zjDxj9GBrwvwoCRGBKU1o8l9D2Apql2Zga2uAnN0TcE=;
 b=HFBWXAekNZRxdBbenqxEaxjHYcXj7ZS7x1gZxfQSfy4r7oEXd7PcjoFTEB0MVa9gt125W
 tUKF1YT8hq7QW587FAHMmyiWw0asVpu/fjO2y9l1YPZjlvwPf5NeEmE1gwRz0UpE7U9vwhj
 NWIlXDNxnlI6YgnSDHDrRHhLE+D0V6GD+wB/nsbAO9h0uCgcHUHtsov5BQ9YRlHkRLYAYke
 Zol3qV6YQ7Z9THYwYOf7ntBIi5JLSn5Mzpo/u0dTEx9CEbLVdg9+gxYobjTgZdJURhCMCvJ
 xNzHvJd4ui2CEClJJ+0AVdj8QSK93gbg0GFzxq1sy5eGOFtEOKMX9JUWQ4WQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9ED61402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 20:51:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EA2C810E0E9
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 21:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770325222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zjDxj9GBrwvwoCRGBKU1o8l9D2Apql2Zga2uAnN0TcE=;
	b=LF/DtkmPa99yuyL3wEyc4ywbP3lJyVjYjTkaHKoWq3sWoQqkp/5wwaJcBR0ZhwvR4t/ZGW
	PDXzKFvsMKlhHE275vkMfc/8yORlrV+tTQNbTnjtKca+7O3nXGmaAOUl/YAZpgDcmcroPE
	YBLLlUZFqFnFy6bmk/8l6jo4WbsqsbE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-112-F0NfKhZNP_ineJQYSjxzZQ-1; Thu, 05 Feb 2026 16:00:20 -0500
X-MC-Unique: F0NfKhZNP_ineJQYSjxzZQ-1
X-Mimecast-MFC-AGG-ID: F0NfKhZNP_ineJQYSjxzZQ_1770325220
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-8c70a08daf3so347360685a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 13:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770325220; x=1770930020;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjDxj9GBrwvwoCRGBKU1o8l9D2Apql2Zga2uAnN0TcE=;
        b=IcRbH5hn+iWIt1pzmO6TpMIyWvYX+kzh8RFBdi/sigTJq8YEDhTn0f/QE+D+KLhcGP
         Qcgah2JnsroQ8KMGE1Aa5fb1YBrHES1lN9a1OWCu2865QWcOdvduffOxS0xLm7YzZh2A
         3LwgIR9AovjnjxdcFGkQAKWf2n6jOnd23YjlYdQ7H2eUnGgH8Sk5Dqd3JFVPYSp33MeG
         PsPoDxafYUmvljYqIaRHyAlik7QLwl9rr5vZqW8hZnrx8gZqj4ZVtSWYYMbJsOfIJR7k
         1wItFBERBvWQyQNsgxvfBZNAH9NM0+g7KL7oeiqli9mS4JrOP22ku9GGGtB263ka+XC6
         Y0bA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/HuqPq8C2zJrRJVykVXXuGPc3KB0RRURLl6W7HSANwNLPaXpKvpq8lUwYdWm3CyfZrLlx63ta@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXs47uaVA2jnHqH8hfzOkOfjjAHGklk5y0TSyF8viKAf3MDqOl
	kcTAUBiEaltBTvhj+FTk/f2c5qtR+VCHjUuy9CjKCvRwGUvz2zl0ujwFqEaoRJtGQueUArPUGO4
	1bXR35qLZCmpnKPoltyaK6s+c73sawf3+hiUqKRj+tO7R9pQ7u4KX1KtxLVn8ITS4YrI=
X-Gm-Gg: AZuq6aKWDxiBc7/qH5f7AEb945ECWg0YnoEX9jES+cKy/xXaE/HJUWwiAgCe8Lqxm5A
	nP2gvyqMHe3CnTQIR+yORk/FApg72v7ITeIDkL7fbhJxGO8m70Kf9Uz5TeQGt/d/DgU9OLcifUn
	8sRdERZ1Yv7XQZ/61smafvSJFRipaHgecPdhz9DF1vNSJ+r4kGTkuD/gdjd8/trmxSDXiiglo4X
	m61yoJMvdZ+yVUPbbGE1rxTw3SrJCtdwtUm4aAOGmUpx4ZBZo0KIlzMZqpSH2rXVoSIcbKX9qhI
	UTXC+UirhOES/A5Urdt9059PytNoQTQ1BleiPyZaoCXBz7v2EtItAlfVZbVWFgEi6RfQHnShVW0
	EgikJhTIAzRArx9w=
X-Received: by 2002:a05:620a:460a:b0:8c7:1952:7894 with SMTP id
 af79cd13be357-8caf0581494mr57920985a.23.1770325219957;
        Thu, 05 Feb 2026 13:00:19 -0800 (PST)
X-Received: by 2002:a05:620a:460a:b0:8c7:1952:7894 with SMTP id
 af79cd13be357-8caf0581494mr57908285a.23.1770325219041;
        Thu, 05 Feb 2026 13:00:19 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b010:9000:4c85:f148:4c91:943a])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-8caf9fdf692sm17571285a.44.2026.02.05.13.00.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 13:00:18 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH v2 00/10] rust: pci: add abstractions for SR-IOV capability
Date: Thu, 05 Feb 2026 15:59:47 -0500
Message-Id: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/13MMQ4CIRCF4atspnYMsKKLlfcwFiM7yhQuBpDEb
 Li7RDurl7/43gqZk3CG47BC4ipZ4tLDbAbwgZY7o8y9wShjtTJ7TK9c8OkFc5JY0dN0s0pfDfE
 IHQXJJab396/qPucf1dr906pR4TSN5HbWOXKHU+I5UNn6+IBLa+0DunqYvZ0AAAA=
X-Change-ID: 20251026-rust-pci-sriov-ca8f501b2ae3
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
X-Mimecast-MFC-PROC-ID: ij-UMTvU_r4IUe0is6_cxw1jRRuM3K6mOQkntrW97r8_1770325220
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: GBILHXKGY32JRTCHNHYXTOQBHO5XLBR2
X-Message-ID-Hash: GBILHXKGY32JRTCHNHYXTOQBHO5XLBR2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GBILHXKGY32JRTCHNHYXTOQBHO5XLBR2/>
Archived-At: 
 <https://lore.freedesktop.org/20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
capability of a PCI device. Provide a minimal set of wrappers for the
SR-IOV C API to enable and disable SR-IOV for a device, and query if
a PCI device is a Physical Function (PF) or Virtual Function (VF).

Using the #[vtable] attribute, extend the pci::Driver trait with an
optional bus callback sriov_configure() that is invoked when a
user-space application writes the number of VFs to the sysfs file
`sriov_numvfs` to enable SR-IOV, or zero to disable SR-IOV [1].

Add a method physfn() to return the Physical Function (PF) device for a
Virtual Function (VF) device in the bound device context. Unlike for a
PCI driver written in C, guarantee that when a VF device is bound to a
driver, the underlying PF device is bound to a driver, too.

When a device with enabled VFs is unbound from a driver, invoke the
sriov_configure() callback to disable SR-IOV before the remove()
callback. To ensure the guarantee is upheld, call disable_sriov()
to remove all VF devices if the driver has not done so already.

For PF drivers written in C, disabling SR-IOV on remove() may be opted
into by setting the flag managed_sriov in the pci_driver structure. For
PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.

This series is based on Danilo Krummrich's series "Device::drvdata() and
driver/driver interaction (auxiliary)" applied to driver-core-next,
which similarly guarantees that when an auxiliary bus device is bound to
a driver, the underlying parent device is bound to a driver, too [2, 3].

Add an SR-IOV driver sample that exercises the SR-IOV capability using
QEMU's 82576 (igb) emulation and was used to test the abstractions [4].

[1] https://docs.kernel.org/PCI/pci-iov-howto.html
[2] https://lore.kernel.org/rust-for-linux/20251020223516.241050-1-dakr@kernel.org/
[3] https://lore.kernel.org/rust-for-linux/20260107103511.570525-7-dakr@kernel.org/
[4] https://www.qemu.org/docs/master/system/devices/igb.html

Signed-off-by: Peter Colberg <pcolberg@redhat.com>
---
Changes in v2:
- Move logic to disable SR-IOV on remove() from Rust to C.
- Add driver flag managed_sriov to opt into disabling SR-IOV on remove().
- Demonstrate flag managed_sriov for dfl-pci driver.
- Uphold safety guarantee for physfn() when PF driver is written in C.
- Let physfn() return error if driver flag managed_sriov is unset.
- Use "kernel vertical" style on imports.
- Use to_result() to handle error in enable_sriov().
- Note Bound device context in SAFETY comments for {enable,disable}_sriov().
- Demonstrate how to reach driver data of PF device from VF device.
- Add missing #[vtable] attribute in PCI driver trait example.
- Add missing #[vtable] attribute in nova-core driver.
- Define struct MyDriver such that physfn() example compiles.
- Replace VF -> PF in doc comment of is_physfn().
- Add #[inline] to is_physfn() and is_virtfn().
- Link to v1: https://lore.kernel.org/r/20251119-rust-pci-sriov-v1-0-883a94599a97@redhat.com

---
John Hubbard (1):
      rust: pci: add is_virtfn(), to check for VFs

Peter Colberg (9):
      PCI: add driver flag to opt into disabling SR-IOV on remove()
      fpga: dfl-pci: set driver flag to disable SR-IOV on remove()
      rust: pci: add {enable,disable}_sriov(), to control SR-IOV capability
      rust: pci: add vtable attribute to pci::Driver trait
      rust: pci: add bus callback sriov_configure(), to control SR-IOV from sysfs
      rust: pci: add is_physfn(), to check for PFs
      rust: pci: add num_vf(), to return number of VFs
      rust: pci: add physfn(), to return PF device for VF device
      samples: rust: add SR-IOV driver sample

 MAINTAINERS                           |   1 +
 drivers/fpga/dfl-pci.c                |  17 ++--
 drivers/gpu/nova-core/driver.rs       |   1 +
 drivers/pci/iov.c                     |  41 ++++++++-
 drivers/pci/pci-driver.c              |   3 +-
 drivers/pci/pci.h                     |   2 +
 include/linux/pci.h                   |   8 ++
 rust/kernel/pci.rs                    | 165 ++++++++++++++++++++++++++++++++++
 samples/rust/Kconfig                  |  11 +++
 samples/rust/Makefile                 |   1 +
 samples/rust/rust_dma.rs              |   1 +
 samples/rust/rust_driver_auxiliary.rs |   1 +
 samples/rust/rust_driver_pci.rs       |   1 +
 samples/rust/rust_driver_sriov.rs     | 127 ++++++++++++++++++++++++++
 14 files changed, 366 insertions(+), 14 deletions(-)
---
base-commit: c5048ddee936ca5ce0aeb79172ce512130779d31
change-id: 20251026-rust-pci-sriov-ca8f501b2ae3

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

