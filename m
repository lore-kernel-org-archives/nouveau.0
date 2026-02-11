Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D64EEA3F27
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 10:28:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 231FF10E36F;
	Wed, 11 Feb 2026 10:28:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="WFK2TyZv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 012C041E87;
	Wed, 11 Feb 2026 10:19:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770805154;
 b=sER+zKrvwxBi4wjDUrn3EQ+tjmHr+lkBGUrJNh63oj9bmJ+fYydBiG8cVLI18Rt5UxopP
 Gf/Wl5okPfpgw2gOB+bbLVARTBoPBszV+qwn6+pmomzymIcEscPTyPPTmYHnjWy27qzbPmC
 UabxM7q9Pv3ViOGPsh6mLKa5GXgsds2bkXdGcdv571RuZhE8GhwX15SaqO7jayPIbcfL+uZ
 QNz2mGGauCtfQ5X7td6ZaxJTaGWK48rJugpGuaG8V/EKgHy8rM4njadjQiWGQGJ2ZtJF/A+
 BPff1Ec+9hL1xrTt4+CHlxXoHP3ugb14aBFacEhCJxqOBPi8GeD25226pueQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770805154; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pJVjT4yQPmw4x05oaCz4mJlQeF0bPrqDj8k8bvebsZE=;
 b=QN2T/RsodLrbvpii3mfrU4iKPrDCBc7fAY6dGuvORrbP9gSmuiN7j10814msestud4l/Y
 TLEHm/nSwWO2Rxme2KrXNx+h/lZzPJId7HhA/VmAQ3ZXGLL0M/2+Ob7AQEt9/NR4h2xPGD5
 XtHs/zlzVyCpYwQU9GvvNYiIz2YygovD8qfGxF2VX5i1x/7xl5Ws8GRKAXknv7JwGycDcR9
 HkPzoy4x/TH62D+OwL5mQloT+toZIa383UFnUgdx6K91wcPHUmr1+OLl1OIzodDy/iKrvu8
 iNdL25No5UHmksLIpoXDZcin3FY0gKurtetkrMKhYOUx8+jM8aUsN3zSgrtg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id EA7A1403C3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:19:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2FE510E36A
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:28:44 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8C6B60053;
	Wed, 11 Feb 2026 10:28:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F3D8C4CEF7;
	Wed, 11 Feb 2026 10:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770805723;
	bh=vs+SUfnNTDDq40YnvycZi17YVfWDsZv9ecA5HvwyLV0=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=WFK2TyZvVioU3r2uFFo3og/5ZCE4MhjBlmxP514OxL4hjUi7VqbRk7G14mtLB+19p
	 2c89rJHot4fCH+tDaeHXO2nU+dRclJ7b+LJi2IuyOYooeYsHriq1cuBwPgMeRDM0qk
	 1GvAXvASCwyiYqIWIXUXid2XkwQ790z2b7WahkeCGgjAjK6cAmQozhSEHBR4PDt5iy
	 3dB0kCgHtw2NCCqlwHwCqjZW+VSJsTBijD5X0UUAJnrqp+QGC2wcDsszYNo6JJdSk5
	 aS0J/W4tykH/DRVprnYygSyBuRGh38/yi1R2u/H91rWwJmu2VnM3LF8BR0jMyAXT6t
	 UU5Hb6LGWLwBg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:28:37 +0100
Message-Id: <DGC28K8J39E2.1X173NHT9ZJDI@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 08/33] gpu: nova-core: set DMA mask width based on
 GPU architecture
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-9-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-9-jhubbard@nvidia.com>
Message-ID-Hash: EIN7WYC3RI3O62ZTFA23LAX3Y3NFMXHV
X-Message-ID-Hash: EIN7WYC3RI3O62ZTFA23LAX3Y3NFMXHV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EIN7WYC3RI3O62ZTFA23LAX3Y3NFMXHV/>
Archived-At: 
 <https://lore.freedesktop.org/DGC28K8J39E2.1X173NHT9ZJDI@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> This removes a "TODO" item in the code, which was hardcoded to work on
> Ampere and Ada GPUs. Hopper/Blackwell+ have a larger width, so do an
> early read of boot42, in order to pick the correct value.
>
> Cc: Gary Guo <gary@garyguo.net>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/driver.rs | 33 ++++++++++++++--------------
>  drivers/gpu/nova-core/gpu.rs    | 38 ++++++++++++++++++++++++---------
>  2 files changed, 44 insertions(+), 27 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driv=
er.rs
> index e39885c0d5ca..4ff07b643db6 100644
> --- a/drivers/gpu/nova-core/driver.rs
> +++ b/drivers/gpu/nova-core/driver.rs
> @@ -5,7 +5,6 @@
>      device::Core,
>      devres::Devres,
>      dma::Device,
> -    dma::DmaMask,
>      pci,
>      pci::{
>          Class,
> @@ -17,7 +16,10 @@
>      sync::Arc, //
>  };
> =20
> -use crate::gpu::Gpu;
> +use crate::gpu::{
> +    Gpu,
> +    Spec, //
> +};
> =20
>  #[pin_data]
>  pub(crate) struct NovaCore {
> @@ -29,14 +31,6 @@ pub(crate) struct NovaCore {
> =20
>  const BAR0_SIZE: usize =3D SZ_16M;
> =20
> -// For now we only support Ampere which can use up to 47-bit DMA address=
es.
> -//
> -// TODO: Add an abstraction for this to support newer GPUs which may sup=
port
> -// larger DMA addresses. Limiting these GPUs to smaller address widths w=
on't
> -// have any adverse affects, unless installed on systems which require l=
arger
> -// DMA addresses. These systems should be quite rare.
> -const GPU_DMA_BITS: u32 =3D 47;
> -
>  pub(crate) type Bar0 =3D pci::Bar<BAR0_SIZE>;
> =20
>  kernel::pci_device_table!(
> @@ -75,18 +69,23 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdIn=
fo) -> impl PinInit<Self, E
>              pdev.enable_device_mem()?;
>              pdev.set_master();
> =20
> -            // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> -            // the device is still being probed and therefore isn't bein=
g used by
> -            // other threads of execution.
> -            unsafe { pdev.dma_set_mask_and_coherent(DmaMask::new::<GPU_D=
MA_BITS>())? };
> -
> -            let bar =3D Arc::pin_init(

Spurious rename.

> +            let devres_bar =3D Arc::pin_init(
>                  pdev.iomap_region_sized::<BAR0_SIZE>(0, c"nova-core/bar0=
"),
>                  GFP_KERNEL,
>              )?;
> =20
> +            // Read the GPU spec early to determine the correct DMA addr=
ess width.

Hm.. we should move the dma_set_mask_and_coherent() call into Gpu::new(), s=
o all
GPU specific initialization remains in the constructor of Gpu.

> +            // Hopper/Blackwell+ support 52-bit DMA addresses, earlier a=
rchitectures use 47-bit.

I'd move this down to the dma_set_mask_and_coherent() call, or maybe just r=
emove
it as well, since we have the very same comment for Architecture::dma_mask(=
).

> +            let spec =3D Spec::new(pdev.as_ref(), devres_bar.access(pdev=
.as_ref())?)?;
> +            dev_info!(pdev.as_ref(), "NVIDIA ({})\n", spec);

This re-introduces pdev.as_ref().

> +
> +            // SAFETY: No concurrent DMA allocations or mappings can be =
made because
> +            // the device is still being probed and therefore isn't bein=
g used by
> +            // other threads of execution.
> +            unsafe { pdev.dma_set_mask_and_coherent(spec.chipset().arch(=
).dma_mask())? };
> +
>              Ok(try_pin_init!(Self {
> -                gpu <- Gpu::new(pdev, bar.clone(), bar.access(pdev.as_re=
f())?),
> +                gpu <- Gpu::new(pdev, devres_bar.clone(), devres_bar.acc=
ess(pdev.as_ref())?, spec),
>                  _reg <- auxiliary::Registration::new(
>                      pdev.as_ref(),
>                      c"nova-drm",
