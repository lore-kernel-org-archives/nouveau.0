Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0555EE909D9
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 16:40:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D1B5F10E51A;
	Tue, 17 Feb 2026 16:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X6Nu6Gb4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C60734339C;
	Tue, 17 Feb 2026 16:30:17 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771345817;
 b=L1qqR9w0Nx7iVkdY/nsMIXieiPfnWaMOIfI7Nz6wG9XRe+BlOUXgurLyLcmE/0FCV5thJ
 Lyl+fP79txDVfsH/drSisb00ukKUmkCTcyyu3cwFTzgrpS13+TTqVY5G7fO5yRw41KyCtof
 BH+GN5LUmLfVtAnoI1dClAr7R+3s1HPdwFcs+svPLbpmHhSKHyBOuyU00cdq/uGDJks62XL
 02PppQnvJcburOMV/nP6QPeQ9hhDqNUsGEzglirMV9DSiFf0bBz3LrE/IXLSIniSXHvYIdP
 9T6Jc4UQl2IEOhzuXyMxZp32nnPbPEFIa2aZ0bmczkHz96SRV3XJMPxZaOOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771345817; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ngePkKfwkQmwZQdS4jIv/NCquyOXHZPixtRUnHusta0=;
 b=QFvejfuBDlCUJropysGNFl78mD+cpskeOb58M792RAPfLNlDoyzYjIOLOp6NmubOc6iix
 p1OLTtIWkBVe2VoHDOzVBEbMhlw4dR4L7i0cx98jA1W5UxkEd64nVv9WZsjChUQiHWwiLHu
 0JYl03WsosTtoJ93w6AOc2geKA63Vvg/mLTfVQF5OXUTXXZ4dDZCEvr7KxJEi2rjSNwOGs0
 Yh7b3HVtF/4KBGfuaT8an/T1+woa/PF3bNMSC6TGEsq2pzaUC48ONVHdJcBny5/GJJzOVzz
 UKkPpkX/3rndlHRwJSYpvJrMI1bnR6OQ5eni4SaPgWbwgleNKgunckRDTkrQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 18A0C413CF
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 16:30:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CECB010E531
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 16:40:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E87FB61850;
	Tue, 17 Feb 2026 16:40:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA83EC4CEF7;
	Tue, 17 Feb 2026 16:39:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771346400;
	bh=m6umUwBBv9/auyVPuVMCugum+ga3ss3G/aSJmQ9nxf0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=X6Nu6Gb4dhdhxYaZ6UOoYs311hIKIgyk1hBpt3rnHu/9ML1Q+PjRKRj+Ms2PAL61t
	 VpQnN2kMAU7/3TPUu9S2BF8yvNEP9JX9NpQENfDs6DVnNadPhyLJttjSNgqP09DXlo
	 A1Rd8kYkRRxjEWre7miuzb0m0WRhiW2IHI1dae0K1oQYUL8AJIOPb7nwgByuvfg9Cj
	 m4WMakmA0HhuRQBXc8TLp8VrzJKGr0Ul5UIyIdtuVCe/Zxj7mh3clPiuCPlwLP8Bt4
	 YdSqpPwjy8VNdFmFIWzhF+SNHvUQZdG/3x0w4OuXNs2ViFIg0L0nP9uGmREA0ACZRY
	 wAlxv80AeSAxA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 17:39:54 +0100
Message-Id: <DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org>
Subject: Re: [PATCH v4 19/33] gpu: nova-core: Hopper/Blackwell: calculate
 reserved FB heap size
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-20-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-20-jhubbard@nvidia.com>
Message-ID-Hash: KLPLGW2X6EPTIILJMDKM4VNRJNVJXCOT
X-Message-ID-Hash: KLPLGW2X6EPTIILJMDKM4VNRJNVJXCOT
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/KLPLGW2X6EPTIILJMDKM4VNRJNVJXCOT/>
Archived-At: 
 <https://lore.freedesktop.org/DGHDW3YKM7L7.C75AZ8DY9K51@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> diff --git a/drivers/gpu/nova-core/num.rs b/drivers/gpu/nova-core/num.rs
> index c952a834e662..f068722c5bdf 100644
> --- a/drivers/gpu/nova-core/num.rs
> +++ b/drivers/gpu/nova-core/num.rs
> @@ -215,3 +215,13 @@ pub(crate) const fn [<$from _into_ $into>]<const N: =
$from>() -> $into {
>  impl_const_into!(u64 =3D> { u8, u16, u32 });
>  impl_const_into!(u32 =3D> { u8, u16 });
>  impl_const_into!(u16 =3D> { u8 });
> +
> +/// Aligns `value` up to `ALIGN` at compile time.
> +///
> +/// This is the const-compatible equivalent of [`kernel::ptr::Alignable:=
:align_up`].
> +/// `ALIGN` must be a power of two (enforced at compile time).
> +#[inline(always)]
> +pub(crate) const fn const_align_up<const ALIGN: usize>(value: usize) -> =
usize {

We should probably just add this as a function to Alignable.

> +    build_assert!(ALIGN.is_power_of_two());

ALIGN is a const generic, hence this should be:

	const { core::assert!(ALIGN.is_power_of_two(), "ALIGN must be a power of t=
wo") };

> +    (value + (ALIGN - 1)) & !(ALIGN - 1)
> +}
