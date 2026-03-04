Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E383EF8FF3
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 14:58:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9209010EA3A;
	Wed,  4 Mar 2026 14:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ym9EQcZf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 538EE44E3A;
	Wed,  4 Mar 2026 14:47:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772635670;
 b=l0JAL/vYRSJNdEebYZ24WmA9BG9C7DMAdSrw8tpVkMcC5UcTYnvUW2hdAN/mx4mJZeNgW
 G83o5RestGjeCbm70+UIRrNSmKOftDhiGEG9ra4DIuigI661o35+h55UigO/CTM3hAflgWH
 /j1D2tH56BWPF2l1H5nT50nEG/VqRQRsczKZH+vO7fxwRIfnciconqudJ9CvM8A5SR3StvP
 2BST5xgTBh1ehJWh+29mClgepZbkwJco4qshxJbwD3yEpEtYuZfqLFvlS82bMzkPEe9YyII
 W4UZLux0LUzwLsEn0fr9ARcpeBKKb3XLd+zxS5cPLCL6SbwCkEqx9o6yCVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772635670; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=dOS1j2epf5TPYMaiUEFBxK4GWJCF7AnlRNLv83KiR6E=;
 b=Wwr3FTiA1npMeLwjmd9JgWM87v7vMlyOYiAlPrBIR5cIgPoLgHWAUwAx5SWCpQuNNsqEp
 DkcS6Wqvw2xswX4R/WGAeFwD/9wvJrij3349P8dsCwJKeKfnJ8m14ZpWnKYEhYhr5YLqL5e
 pEtRDXkwUp5SpgjaDB7MLvkGW7eL5wdO0dvjvwZ0tjXzv++QKdW5ld/HzWJXB5HeMor61WY
 PeHWPdHhx/wfSKN61t//ge56lzp32faGFRj5rtNghc1Gl2vxWb/kbInBPjVPWfuVEx2qDtd
 JPQdYIgfpipkIs/3aBtj/nLpWwyrXUzqdQWVBn+JLmDoZDueplxXfnZPU7Gg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D2A9543112
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 14:47:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA32710EA34;
	Wed,  4 Mar 2026 14:58:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1457C60097;
	Wed,  4 Mar 2026 14:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46750C2BC9E;
	Wed,  4 Mar 2026 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772636286;
	bh=dOS1j2epf5TPYMaiUEFBxK4GWJCF7AnlRNLv83KiR6E=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Ym9EQcZfkOKBQHZvEQz/FhHVNSqmg+h+6mOr4awZN6lqVP89047H95oA7hDTD8Lxp
	 3/zrrsmHItaW0dHSdzHTPMNUEEPPrdDoAQGGe9wmG6r942WlV+NEL+DcbydsnltayO
	 SnkhnV7y40XDZUGJYiA6FsWGZM40iGremynvaU5Cw1rh8jc4wDHWy/miN2N3sbvfLc
	 Rn1TTCZbSsbm8xMotdnloy7atDTjiCMTCuYwLsPrm4P+VZShXKneJTrYQO7TL2CS2W
	 aGLtKXusmSvGJfMzJsY89VPeZZyDFz0aM8vrKSLF2R5CeTp1fFyviINf8C+4nr6mjK
	 wEsHpF7yuJvaA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 15:57:57 +0100
Message-Id: <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
To: "Leon Romanovsky" <leon@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
In-Reply-To: <20260304142600.GB12611@unreal>
Message-ID-Hash: RT57IGV3ADBYMTEHACUXTHMWYJ3Z6F34
X-Message-ID-Hash: RT57IGV3ADBYMTEHACUXTHMWYJ3Z6F34
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jason Gunthorpe <jgg@ziepe.ca>, Bjorn Helgaas <bhelgaas@google.com>,
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
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
 Moritz Fischer <mdf@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RT57IGV3ADBYMTEHACUXTHMWYJ3Z6F34/>
Archived-At: 
 <https://lore.freedesktop.org/DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
>> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
>> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
>> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV=
)
>> > > capability of a PCI device. Provide a minimal set of wrappers for th=
e
>> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
>> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
>> >=20
>> > <...>
>> >=20
>> > > For PF drivers written in C, disabling SR-IOV on remove() may be opt=
ed
>> > > into by setting the flag managed_sriov in the pci_driver structure. =
For
>> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandator=
y.
>> >=20
>> > Why? Could you explain the rationale behind this difference between C =
and
>> > Rust? Let me remind you that SR=E2=80=91IOV devices which do not disab=
le VFs do so
>> > for a practical and well=E2=80=91established reason: maximizing hardwa=
re
>> > utilization.
>>=20
>> Personally I think drivers doing this are wrong. That such a driver
>> bug was allowed to become UAPI is pretty bad. The rust approach is
>> better.
>
> We already had this discussion. I see this as a perfectly valid
> use-case.

Can you remind about a specific use-case for this please? (Ideally, one tha=
t
can't be solved otherwise.)
