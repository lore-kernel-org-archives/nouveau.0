Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A85BE9A047
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 02:03:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA9310E546;
	Wed, 18 Feb 2026 02:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="R73iIZQN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5DE4F433A7;
	Wed, 18 Feb 2026 01:54:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771379648;
 b=dHMamQ6MxI/lLFh7Hs0tYNDlMgQPCE0z9a7moPKb1N+zGXOLfuXxsecfIRtskXr1ZdAo3
 e963M6GwvJxo3+4XHgTJulge7PKKIF0cC1KDIkTOK6dH2alpKIrVTJXtHpIK3RVumSRjDCr
 2Qy87UBVPv0VifvaS181jXmoJ9Q82UJFDGx1CV8rRdy3aVonCC+YkqJ7TQ0tfLc37wP32/O
 OWBNER57hZOcOhMRirLB2w7lO2VtxQzRwz5l7umi2jphNZAZ7Tm8NVCmY9FYdP09enQIfGn
 8WSsuHAInS/kxIHUL0UmhaYpwBAjGA+HZrUGDrsKsWPfgQ0bFgeP48oGOxDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771379648; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
 b=O6M1EwRr88n0M4LW9Ph/J10fIc2EyaUbft804zzWjMRzEtAelqLz1LBzYihNbpQRrZpUD
 Nn9Ljq2/VhwBb894/2M927YZKL8Ul1rZ3vx+AfRNlekMFJKFTP/FU/AIAtU/pACDfPSat9o
 VY2kg0sSacwt2j2xH5kaMI4/qTnlX2wM0V78/p0ZhxSioCQv45IOUjjRlISFNaRVFQ5TfRp
 87JaJXfiF4aIyVA9a4UQHwWhGiQbEtUA6bk/Kz807WiOvHXKj/C8pYlWYm39QS9D5jdAbM6
 8lA/84MIt6/QkCVy+Ln/z7sHKeLzJORwN30jFrUAEbx5SyUDnRPgVqqn99XA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6AF9440371
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 01:54:05 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE4AE10E2CC
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 02:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771380232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
	b=R73iIZQNFuwW0gReXiCntsc5CjhZkfg4EPN1dw1iuyx9WyqDGde4FMDCcL7GeGNO2Q7qp9
	4ofjbeGquk5FwsL1qKpeUYNxXyHFtyXVp3DIG4zPb4wzBk5RYZPnig0s94X2d3Z30bf7iN
	ehIgdVZkfl+yOhU5BaHvJmVl6PZvQWg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-yIRftzCpM-O66sKJUEQRpg-1; Tue, 17 Feb 2026 21:03:50 -0500
X-MC-Unique: yIRftzCpM-O66sKJUEQRpg-1
X-Mimecast-MFC-AGG-ID: yIRftzCpM-O66sKJUEQRpg_1771380230
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-896f96458f3so756819346d6.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 17 Feb 2026 18:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771380230; x=1771985030;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
        b=OIMcNiSqA/Ht9NUHFI5nqO3hsZ7OwUcei9lSIlOOSUH1H/JEp7ScvT07xFdrkrihhV
         7dZ+QT9MczzYaGEQN0nqX35jtqsE/wIpfLdIdcw/AvXubTdTaeIL7aco+QSgS1iCVgmB
         8CbTDZ0mR3YhtIiqWMkedfjIWrIqbyDILYOYo9wt2HgbmfpAlqlmHuJ3QPmpxl0+/zq9
         KE3+rYDhH8+wd36e4c0delmIByAkSfnaitBy5gotkd+eeJ9CWackpVxpRa8IeNvWHRsu
         2WBh4lyf/ZubsmuoibGPPC9Fsly0sGTYMKrenhK+EFNSe/O9611UOaAhKoxMHfMU6oy9
         A3/Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUwaJrVQgsoopTi7iOUCjDVdTppGyUhdFZLdWAI1IJyIkVAVn6onodl5UW1A9V//T6F3jJfnNxD@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx9n7Y9bYOvVxd+TSBHViNBoGPvNQKU0qlsYAEmzhto4meNqnjT
	1/ypAnJ9HgKH0ay0DhGOETbZHk2p6c96N6H7tIN1/XUpcNW9l6DMGJCoAYhY22ny5svqRGYEX1D
	goJDYN5IZybPLk09iCFrNBBpV4Iy89AKHH/hHUe0ID7Tf/Pxx00QhqSqMaPrkdPjNz58=
X-Gm-Gg: AZuq6aJWOFxPDmnITzsCmobNF1QnrlLvOgmm/DJcq/SmEc/ka0LENQQnBxqGdbVbqAW
	twbAU4BO8/sBDF06XY60uxwVLiDFwVJBQ3zLuzi/mNJfmbo0rSzgDDl77kdHyUO7urETNRsLjHn
	l56bFT0embLMKdtWIq5EX/jx0Bd4OiDbdcQ0pAZscLXuG/qNMksY9n4NM4h1Yf1uHBRfEmehtuK
	FSbO9uammaef8U8IG2/IEeVZk9pd67B80umWeWr+gpHBYFFBWbfDP+bHx6evl5fkxmSDIVRAJ5d
	AIjsUx0ZpxSKPcPynLYI7or3xIyP+E4Gw401LofS0zjgfX9k9E7QXCZq4Oyx4eyD48EM+tDU9wA
	7ZOwZt1zUuHF7aFToBUK+6w==
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id
 6a1803df08f44-897402c95aamr190213146d6.8.1771380229551;
        Tue, 17 Feb 2026 18:03:49 -0800 (PST)
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id
 6a1803df08f44-897402c95aamr190212556d6.8.1771380228953;
        Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Received: from localhost ([2607:f2c0:b1e3:9a00:3d5c:8422:4052:e7a6])
        by smtp.gmail.com with UTF8SMTPSA id
 6a1803df08f44-8971cc7dc1csm176656526d6.10.2026.02.17.18.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Date: Tue, 17 Feb 2026 21:03:47 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
Message-ID: <aZUeA1hmYlZIILQg@earendel>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
 <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
MIME-Version: 1.0
In-Reply-To: <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Jd-LdF6RM5-dn0klW3eDqKCbN2NTzB_dxp76Z6RwlSw_1771380230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID-Hash: CTPQKVX6I4MJGKEWQGNYIQ7VDHSRCRP5
X-Message-ID-Hash: CTPQKVX6I4MJGKEWQGNYIQ7VDHSRCRP5
X-MailFrom: pcolberg@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Leon Romanovsky <leon@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
 Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev,
 Jason Gunthorpe <jgg@ziepe.ca>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CTPQKVX6I4MJGKEWQGNYIQ7VDHSRCRP5/>
Archived-At: <https://lore.freedesktop.org/aZUeA1hmYlZIILQg@earendel/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Dirk,

On Mon, Feb 16, 2026 at 09:27:44AM +0100, Dirk Behme wrote:
> Hi Peter,
> 
> On 05.02.2026 21:59, Peter Colberg wrote:
> > Add a new SR-IOV driver sample that demonstrates how to enable and
> > disable the Single Root I/O Virtualization capability for a PCI device.
> > 
> > The sample may be exercised using QEMU's 82576 (igb) emulation.
> > 
> > Link: https://www.qemu.org/docs/master/system/devices/igb.html
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> > Changes in v2:
> > - Use "kernel vertical" style on imports.
> > - Demonstrate how to reach driver data of PF device from VF device.
> > ---
> >   MAINTAINERS                       |   1 +
> >   samples/rust/Kconfig              |  11 ++++
> >   samples/rust/Makefile             |   1 +
> >   samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 140 insertions(+)
> > 
> ...
> > diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
> > --- /dev/null
> > +++ b/samples/rust/rust_driver_sriov.rs
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
> > +//!
> > +//! To make this driver probe, QEMU must be run with `-device igb`.
> > +//!
> > +//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
> > +//!
> > +//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
> > +//!
> > +//! and append `intel_iommu=on` to the guest kernel arguments.
> > +//!
> > +//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
> > +//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
> > +
> > +use kernel::{
> > +    device::Core,
> > +    pci,
> > +    prelude::*,
> > +    sync::aref::ARef, //
> > +};
> > +
> > +use core::any::TypeId;
> > +
> > +#[pin_data(PinnedDrop)]
> > +struct SampleDriver {
> > +    pdev: ARef<pci::Device>,
> > +    private: TypeId,
> > +}
> > +
> > +kernel::pci_device_table!(
> > +    PCI_TABLE,
> > +    MODULE_PCI_TABLE,
> > +    <SampleDriver as pci::Driver>::IdInfo,
> > +    [
> > +        // E1000_DEV_ID_82576
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
> > +        // E1000_DEV_ID_82576_VF
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
> > +    ]
> > +);
> > +
> > +#[vtable]
> > +impl pci::Driver for SampleDriver {
> > +    type IdInfo = ();
> > +
> > +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> > +
> > +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> > +        pin_init::pin_init_scope(move || {
> > +            dev_info!(
> > +                pdev.as_ref(),
> 
> The `as_ref()` in the `dev_*()` prints can be dropped. Example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/samples/rust/rust_driver_pci.rs?id=600de1c008b2302b56d69ff27d12a9d8d14892ac

Thank you for the pointer, dropped in v3.

Peter

> 
> Best regards
> 
> Dirk
> 

