Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD31AEDEBF0
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:15:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 17D2410E8D4;
	Tue,  3 Mar 2026 21:15:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iGkVIflW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6EF3244DBA;
	Tue,  3 Mar 2026 21:05:20 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772571920;
 b=t738mo1CUs5VP34REI4sOmcSY+33HHGzKbnUQhHl1bLZdQcdoWyZZ1aY0/qvRvlkGAKoM
 AnSxR4PwzzfE3+c79kBeb8eJe87SQEG87RXL5GpgkKehiePPhvOXUvmtgmi2ERQzBCWnLD0
 sObA3HLQw93x+WRB9GHNMOOd68XJgSMC76ZmzbjQbx6Z5EFNrfewR8D7kKtki3+xwoewOJa
 ay9iSlqyldimJRlRcTRreJKLzgpFlFrgVeuVIh5j4qhQKe8dxCcTm47AOqy4OQRLbiZA5E1
 Zy0YwwQ5Obw/j2tcJNx+2bmZz3EI7hBSu+UbvgL/RT2MABP2Scj89NN2Hyrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772571920; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
 b=nfPSbuMmq233uigk15MK5TDO4v62T3KC6z9Ef/nPNaxI6Z0LtnlgA7gDWc6UUlB7+RYRq
 Mga+SSnIFqV9LNpT7JxSO4r7cCI+VObEvo+pg3faCm6xEGWs31aZnztRZuY2yUHn3cWPHjX
 CS8RXo3O8qfqNxE8FMHIJ+glK5dRsbtFyOkKfOpSaZY7480flbCoWSk45LvDRt1/ah4gIDD
 u6wU0rMH3IGB4w70b2xMr04ABkmO6BXx6sq2hKab9GH4stIbhYMagd3XKRl5J4eK2OXOqom
 levomFy9TQ5JwONdj5aAYuEh86+nrXOptUhA8jhRgfeunzE/4B+9yhCZ3HdQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 218B040469
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:05:17 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3F4A410E8D0
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772572534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
	b=iGkVIflW/q203O//UxT3xpDOHkD/nUl7boXfrz/w+3PDbWQIAILlJU1Qa6DGysR6mfLOMW
	Gp3i6LZpxgi8RBwTazB95oC1Vw7FG+qTlRoDq1Iilron7wSZTQ96BBa8ZVbEm3yddp+9b2
	7mAMiBlqhxcDxBHHWbN26vMJAWZgRJE=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644--rwRAGMXMFOyZVYc7CT9Zg-1; Tue, 03 Mar 2026 16:15:33 -0500
X-MC-Unique: -rwRAGMXMFOyZVYc7CT9Zg-1
X-Mimecast-MFC-AGG-ID: -rwRAGMXMFOyZVYc7CT9Zg_1772572532
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5069ba5af5bso391680831cf.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:15:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772572532; x=1773177332;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wrmpWbz/D0LbSjhwAo9Mxe/RiGjDGWcxtMIqyIp8KYQ=;
        b=F4zjUhgPrHSwCZOyDhgUgyKDiUQzBkBq2jk1AN02XJWe+QyCeihIGUp2joA+i6pT8Z
         PQo4lz9TBC0ec3Iot8W3TyzAcCUfIxvNTdUVfE8BXGXcDj2ddGGz/9Rkx6DRgwISDBlx
         aJWfmfSbE/e5Gne6lU1/sb3Sqfgj/3j2buhPrSPtDgBVjSY1g795vDDv/jwhBKuFxnTJ
         +HyXWTGzH/Z7BN6JSwfujheX8aMPxGof8g3D7Z5gpA3vHG1Se1R6MJZijfsSecDFg+yZ
         qsztA3lxA9jPWithOPI1MbwKT6HEW0kMZgXuWPNMc2AVZszbr834qKjPiHlhZSDuVKF6
         ORIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8orwClU09lkTxfQuf19ri6XOIZmQaH/vS2DMoi8SvYEbK2ioe2hKhwK4M/osrww/AEQLWxEZi@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx3wsgjrhGJIrYuoxkZydABegzOC61IPhpv15S1WZbSZxn/6R4O
	HC6hM4AXvgLNbiT3OahND8RKpL5g8sAgD/NQqNXhxnvd3t0oRrMkNKocjrrS6f+U/dkODC2PNMZ
	hLBQrTNVx9SiJ5tjUno9epYg1SdXyyBd1MwoUaerYd39GgOAvR3tZ1GjlptuHTuII6AE=
X-Gm-Gg: ATEYQzwL929xR0lDxIVjytNAdeTYRT4cVZ4SAzPCvCH0fynkzlFusPtUgiNW684N/1F
	Tqley3du2u9y60SXQ2qmlP9xetX1/kR0H0O+bR7kANbiHu/o0LYkgnmC+Kyu8xRTuGJ4elVumux
	ondJsbFGqSWsyqFFH7rO7rGO0Sr/MWp+ku4f1ne842NYaevWIintAV/0IQVZ+GD+KPuLStOeHOo
	CHjS2+Z/TywSHltkKir3Ov8xMx9VS7BN5+LrzybFWTX4K6smZkTWSbya0q+dOREw/k4tG0MW5ca
	b0glSuWLuA6nmCLuwEjWu7sPZUGhy/erBZGpy7u5Di7WJSCJcCnq+3xFtmvoFqMkrxoj9ngkR4C
	vqJBy1aL9q8cYKir/brJc5sF8ow==
X-Received: by 2002:a05:622a:214:b0:4f1:83e4:6f55 with SMTP id
 d75a77b69052e-5075273cf0dmr220407751cf.16.1772572532265;
        Tue, 03 Mar 2026 13:15:32 -0800 (PST)
X-Received: by 2002:a05:622a:214:b0:4f1:83e4:6f55 with SMTP id
 d75a77b69052e-5075273cf0dmr220406951cf.16.1772572531594;
        Tue, 03 Mar 2026 13:15:31 -0800 (PST)
Received: from [172.16.1.8] ([2607:f2c0:b1e3:9a00:3c7:56c2:f819:96d2])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-5074481c0e5sm156286991cf.0.2026.03.03.13.15.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 13:15:31 -0800 (PST)
From: Peter Colberg <pcolberg@redhat.com>
Subject: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV capability
Date: Tue, 03 Mar 2026 16:15:20 -0500
Message-Id: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/2XMQQ6CMBCF4auQrh0zLZRSV97DuChlkFlITYtND
 OHuNhoX6urlX3xvFYkiUxKHahWRMicOc4l6Vwk/uflCwENpoVBpiaqFeE8L3DxDihwyeNeNGmW
 vHNWioInTEuLj9ZdlmdObSml/aZaA0HW1s4221llzjDRMbtn7cBXn8pXVx7eoUP95VTyNtkH0x
 rSm//Lbtj0BNUVq1N0AAAA=
X-Change-ID: 20251026-rust-pci-sriov-ca8f501b2ae3
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
X-Mimecast-MFC-PROC-ID: MM_Bc6dMHRSAsMNOMybqGT9GwMz4C8uEQvuuSghtHtU_1772572532
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID-Hash: A6JUUUGT6YTVQSXSXKUJFGAM33VJJ3SE
X-Message-ID-Hash: A6JUUUGT6YTVQSXSXKUJFGAM33VJJ3SE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/A6JUUUGT6YTVQSXSXKUJFGAM33VJJ3SE/>
Archived-At: 
 <https://lore.freedesktop.org/20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com/>
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
Changes in v3:
- Replace SR_IOV -> SR-IOV in description.
- Drop redundant `.as_ref()` for `dev_*` prints.
- Link to v2: https://lore.kernel.org/r/20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com

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
base-commit: 1b9a5bc8513d081c1bfe2c096b6dc502a4660f47
change-id: 20251026-rust-pci-sriov-ca8f501b2ae3

Best regards,
-- 
Peter Colberg <pcolberg@redhat.com>

