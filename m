Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 211B3E6816B
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 11:26:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C8C510E237;
	Tue, 17 Feb 2026 11:26:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nwAYnkE4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BE72C42B98;
	Tue, 17 Feb 2026 11:16:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771326974;
 b=S7oVSxTx6n6R2XS+Ygl2PJFT7X7JCVQJBK2yvVd7LN8dfOZPdNHm9Swb6Zjv/PcOmEazz
 8K++Ctd8BEpXmDo83/nfm4R6eBUOc38fnxeaK3wRf1pEOZhE0BTUl2JU9Al9LPyesxbE4hj
 UzB9HpEvlnvH2R6h4yznOt2pLgpaLtOdricBnM5sbjfpRrNMz+EyYD1ESL1dq7SRduvZab6
 8GtaT5Zsz9Z3zGxw/lohwWsZawE067EtP8gLlZMZP0PpUTFeUAYpOUfm21+jM4ZZeudoH7G
 GV9CoV1GkRkknDxR4ZOHer+gm/mCIY8II/FhkJtvM4Cd7hzrvAJR9YbjV7eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771326974; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oNnXIHktY49pn49OzjmuQxYC64bjo0mH7SfbUnH7wj8=;
 b=FwRHzLXNJ1Jn/Ckjp6RDqp5b8k5j3eQjRV7bwE+EkjorgaydLziGjrKlnbOyWdY3kWqrw
 I7oJ2W0V5llWQdmCL/8aWUNmFjaJAvSiCGjJORqvEaOgls+eo9cbkpaf7bL0J5aniuYgAAv
 fJYeR1mhcN5igIDS2oW2XAP5YdAukFxteIFPFqQybncecJ7HygcqfSoS2j5YM40DTrJaGmY
 l1Myn6af/ixvmvBeX9PB/Q2rHtL36+x+Jy0hikwZ0mxn//APCRgQV/sS9XhVZ3T5f8Sxdlh
 wJvAnWAuQJgZzLcJSnpDuDG6Y9aFP35iWQv2JJuPNLGMWGsyClsDP6LZVGPw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 92DBE413CF
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 11:16:12 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D7D6A10E217;
	Tue, 17 Feb 2026 11:25:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F00260128;
	Tue, 17 Feb 2026 11:25:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E32ECC4CEF7;
	Tue, 17 Feb 2026 11:25:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771327557;
	bh=rhJDnIDYzVy7Nc6zkFeLuiD/FS3qE8b5GNKN0t7ske8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=nwAYnkE49RMSxo4ckBFYQgkSuFeY5+Ic/TTqMvZIKN65I1zSEqsOGfyDgXYt1ry42
	 6+6IBq1ZYR6EC/TY5aEFM+92BxB5y9dE/BSeQSCRk18+onhJprXGEo0Bm2Pd9UESFJ
	 4KBlRHZ8wH2k7ivOquqApb8kjew/mSwSKTcKrkjlS+6orsxvdTn+1dWPBzoFZxYKOy
	 ryK1PzGoXiOMj7RiB3n5tMOdCk4Q7MyHmCrthybZralcIz91Cd+kKhgolehtvp10SB
	 ILUE6S4SAfgq/gVLIEGPoOIuzRoHaItzsayjFV/NKUAYdcGXKOHpkDuiCWrbk95xZU
	 dUnsdAQ5/+HIg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:25:53 +0100
Message-Id: <DGH77OGW8BFR.2NV0GJ1890DPF@kernel.org>
Subject: Re: [PATCH v3 7/8] gpu: nova-core: use core library's CStr instead
 of kernel one
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-7-b4e2d45eafbc@nvidia.com>
Message-ID-Hash: 2EGVGG7PDHQ6QJJNJU5IOIKWABD3C63D
X-Message-ID-Hash: 2EGVGG7PDHQ6QJJNJU5IOIKWABD3C63D
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2EGVGG7PDHQ6QJJNJU5IOIKWABD3C63D/>
Archived-At: 
 <https://lore.freedesktop.org/DGH77OGW8BFR.2NV0GJ1890DPF@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> The kernel's own CStr type has been replaced by the one in the core
> library, and is now an alias to the latter. Change our imports to
> directly reference the actual type.
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware.rs     | 2 +-
>  drivers/gpu/nova-core/firmware/gsp.rs | 6 +++++-
>  drivers/gpu/nova-core/nova_core.rs    | 2 +-
>  3 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/fi=
rmware.rs
> index 68779540aa28..2f7249383e51 100644
> --- a/drivers/gpu/nova-core/firmware.rs
> +++ b/drivers/gpu/nova-core/firmware.rs
> @@ -424,7 +424,7 @@ const fn make_entry_chipset(self, chipset: &str) -> S=
elf {
>      }
> =20
>      pub(crate) const fn create(
> -        module_name: &'static kernel::str::CStr,
> +        module_name: &'static core::ffi::CStr,
>      ) -> firmware::ModInfoBuilder<N> {
>          let mut this =3D Self(firmware::ModInfoBuilder::new(module_name)=
);
>          let mut i =3D 0;
> diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-cor=
e/firmware/gsp.rs
> index 9488a626352f..ae3f6581c5b6 100644
> --- a/drivers/gpu/nova-core/firmware/gsp.rs
> +++ b/drivers/gpu/nova-core/firmware/gsp.rs
> @@ -32,9 +32,13 @@
>  /// that scheme before nova-core becomes stable, which means this module=
 will eventually be
>  /// removed.
>  mod elf {
> +    use core::{
> +        ffi::CStr,
> +        mem::size_of, //
> +    };
> +
>      use kernel::{
>          bindings,
> -        prelude::*,
>          transmute::FromBytes, //
>      };

What's the improvement in this change? Both of the ones factored out are al=
ready
correctly imported through prelude. Let's keep it as is.

> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..b5caf1044697 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -18,7 +18,7 @@
>  mod sbuffer;
>  mod vbios;
> =20
> -pub(crate) const MODULE_NAME: &kernel::str::CStr =3D <LocalModule as ker=
nel::ModuleMetadata>::NAME;
> +pub(crate) const MODULE_NAME: &core::ffi::CStr =3D <LocalModule as kerne=
l::ModuleMetadata>::NAME;
> =20
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
>
> --=20
> 2.53.0

