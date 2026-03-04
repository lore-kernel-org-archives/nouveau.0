Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04B40EFCE21
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 17:50:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 66F9D10EA88;
	Wed,  4 Mar 2026 17:50:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="BnxaPJez";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D61AF44E45;
	Wed,  4 Mar 2026 17:39:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772645994;
 b=tjb4J2HKZbVqo6hSbPa7Gd0bb4qG6H+MZLDbZyYQp3iN/lbasqjjh76DVpk77jmp/5Fr7
 GplEPgSATqNfO+u7xz3gv4n/sFrZ9dMZb3XToAI8pLpvf+lIOwAKeFoYiVUZf2u6rNc1uyG
 Tqw3yhG8KKIGkPiVuU9RUXRYD+t/iRp0ZW7cxmCH3Hle3adzBDVMLnv40vVgGFkijp5sfhB
 Ka8IkSa18E/hKZZNpmRylcizymNiVke9RgFkmuNC42NL6NemxQYDdoJKPDD9UhyM3fvq1St
 HguPsKOKBhoYxV7eAlCUnD1UhRlCLDn9diLZ9C3rMzJbSCCRrHkFLtACzClg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772645994; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=E4znfVinBg671eglK8T1taFw+aFY5/rXYKUjl3WI3wk=;
 b=U55aJHw5T6Kr1BpuMVYdsvMM87xXpR6982OVgCvtrpQnXHWxDlYVy5Vqg8c/vipvm8mHj
 gvfHelB18fIMtX3JuwacfWP9HxrAIpiaMcYL0zpN2+/pP5g9ym61DzO2hnByvRvNWqnbGTu
 n/MmC3yQ2jXhyKDmF/b4R5Y+OPO0k1kVwX0M+hDq+DlR1IAKUu68iYpalootp6N02Stzraz
 qRae+Nqq21hxaCcJOzPfAFS80+JuqdjJKMyLHWB0QVHGRZwo1LF/sN7wFCTbiMkVG/ooxkT
 /u2pPCYq6GCFG0pJzvgXMyG/HTNron1IaeiWVhTECpSw1XtrV1Z7BXPiWQbg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E713A41E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 17:39:51 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 42F6C10EA81;
	Wed,  4 Mar 2026 17:50:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CFDBF412ED;
	Wed,  4 Mar 2026 17:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F283C4CEF7;
	Wed,  4 Mar 2026 17:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772646611;
	bh=E4znfVinBg671eglK8T1taFw+aFY5/rXYKUjl3WI3wk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=BnxaPJez/SGvWsdn9rFcxp1SWi2seMtpjZi8xUe0Em3idKqLKyZUYNWYn5P8zZSAL
	 J1sdpkcRmZ5TJ03pG7ShVlWlXqP2po1Dqta5bAqqQBQeiFn8l1In6EXafPYi9hNSWj
	 7LkWlTwuYY6dQNI6zjtrp0cVxXMR+r53gJCFfTVOKZWm3HmOa2KWXuE0c4v3e6XegB
	 DO3RcT+4GZS9MPpiApeygGxi09mPDKR3qNT/v4y3tgtK3WQdKd1km1ffLByhFC4zf+
	 q4DWNAG1ulOiDVZOpKolL38Gdck7at60opVYY6NlMIViFWDgQvDP7APYg2Nf+MhV78
	 S6Jpfw8wqH5YQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 18:50:02 +0100
Message-Id: <DGU6RZ7MWNAV.21PQC3NNK05D6@kernel.org>
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
To: "Leon Romanovsky" <leon@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal> <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal> <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal> <20260304164551.GG964116@ziepe.ca>
 <20260304170249.GJ12611@unreal>
In-Reply-To: <20260304170249.GJ12611@unreal>
Message-ID-Hash: DJV7EGYICNZ7QMM3672J6BOKDWCO7L5C
X-Message-ID-Hash: DJV7EGYICNZ7QMM3672J6BOKDWCO7L5C
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DJV7EGYICNZ7QMM3672J6BOKDWCO7L5C/>
Archived-At: 
 <https://lore.freedesktop.org/DGU6RZ7MWNAV.21PQC3NNK05D6@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 6:02 PM CET, Leon Romanovsky wrote:
> On Wed, Mar 04, 2026 at 12:45:51PM -0400, Jason Gunthorpe wrote:
>> On Wed, Mar 04, 2026 at 06:27:11PM +0200, Leon Romanovsky wrote:
>> > On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
>> > > On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
>> > > > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
>> > > >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
>> > > >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
>> > > >> > > Add Rust abstractions for the Single Root I/O Virtualization =
(SR-IOV)
>> > > >> > > capability of a PCI device. Provide a minimal set of wrappers=
 for the
>> > > >> > > SR-IOV C API to enable and disable SR-IOV for a device, and q=
uery if
>> > > >> > > a PCI device is a Physical Function (PF) or Virtual Function =
(VF).
>> > > >> >=20
>> > > >> > <...>
>> > > >> >=20
>> > > >> > > For PF drivers written in C, disabling SR-IOV on remove() may=
 be opted
>> > > >> > > into by setting the flag managed_sriov in the pci_driver stru=
cture. For
>> > > >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is m=
andatory.
>> > > >> >=20
>> > > >> > Why? Could you explain the rationale behind this difference bet=
ween C and
>> > > >> > Rust? Let me remind you that SR=E2=80=91IOV devices which do no=
t disable VFs do so
>> > > >> > for a practical and well=E2=80=91established reason: maximizing=
 hardware
>> > > >> > utilization.
>> > > >>=20
>> > > >> Personally I think drivers doing this are wrong. That such a driv=
er
>> > > >> bug was allowed to become UAPI is pretty bad. The rust approach i=
s
>> > > >> better.
>> > > >
>> > > > We already had this discussion. I see this as a perfectly valid
>> > > > use-case.
>> > >=20
>> > > Can you remind about a specific use-case for this please? (Ideally, =
one that
>> > > can't be solved otherwise.)
>> >=20
>> > You create X VFs through sriov_configure, unbind PF, bind it to vfio
>> > instead and forward (X + 1) functions to different VMs.
>>=20
>> No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
>> will blow up the half baked SRIOV and break everything.
>
> The FLR can be disabled. For example, PCI_DEV_FLAGS_NO_FLR_RESET flag
> will do it.

But this is a quirk and not a feature, no? So, we shouldn't use it as a bas=
eline
for actual features.
