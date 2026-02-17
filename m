Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38329E9A02D
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 18:16:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 613D510E52E;
	Tue, 17 Feb 2026 18:16:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PCPJuQfc";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 297FF433A3;
	Tue, 17 Feb 2026 18:06:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771351598;
 b=r4pGFdeLQw37cmbBY3oo0OmuUSYVcQR8zJk8TuzMSZUapVwQ2MNYk1QPdXwOlbpnMVk+E
 UrxmKw8cqhSyiwE0WKonKu5IQveZgA/Szfy03tmPGQFx369KGejIfHD7jxDC5Ad2kpaPxH5
 LFmo/XaxFzUM9yvM7fsX7wZALQb21ZRdFOYqEv3oTkJfM9kWkseaooON4NZhrV+0lgj1JAw
 6NJklWkP1cJTa4CkVuUpJJ/IO+gfOTOHSBwBERSi6XLLBSHZ6FrL0a7R83BTOz30/oXY4C8
 akk4MxuzqwY1byS68aennuEF+xXQD95b9ug2OBMknbAU1dU2e8p+G15perMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771351598; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=NK9Nrd8PbPVIyrnt0I1+kNFbcxTMFTOgzngQg3uUn24=;
 b=EN/j7zUyPAKYC3RQ9sC3ICnFntdJTwv1mu9gumReGAZmXUJBm85fguc7jdQMYFnW7kxRO
 ZPKf5fzt3oD2/xVSmluuUo1bvwRPLbumG2E1vc7ydHPPOdVzTntkxH8sHbtvyqIxEGqlbgv
 5jteqpY1hTE9RDf/0zrn+SxoKufXpfITNIRsJIPtTOpxnH+2W3/tiY3cBO9ZPuUVQZFJy0O
 +hvtMix2fTH6deKJO9Y+v89VLRpYc41zDmC4wpyIMiS1eXmkVKgBkD1FQPG/AfWnergqNS5
 6wn5FQq3G9ovpH8KGY5AavTdC69iK3SmSsSU9T5zCd/3/aF31h0UlfrGItPw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 247D740042
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 18:06:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F91010E1C2
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 18:16:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B823443624;
	Tue, 17 Feb 2026 18:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A49EC4CEF7;
	Tue, 17 Feb 2026 18:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771352181;
	bh=GGR8mEKIwAKotXY6I6xx8Yr9YWpWwMdyDRXJEclhJeU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=PCPJuQfcOk1iBSw28B+kAXLJ7gJhXovhtBmeorOiNY4d/FzPLzF5/3Tou0vlJnlr4
	 svOkWA7JR7RgSZgsFKitcsIJVL/eImTxu2b5Tjk/afmT4jjzEtPZmAs2VpEgekJ6/1
	 GzkDpZL2YTZODFh2+xa2qUNGoqqAJOX6uDnZH4KKO4s1vwJX3uAiCrKMd03niCumBw
	 ZUGpVhYcH8d0eka4VTnqGcLHrCGKam4E+HKD+ikh/XzR8TFUccQXG1mtXCbpHDpN65
	 Pb+m+bVFoOIS6dZ+gXfYj8blyBV5TUSaLKhw/QaiBWeAUrOv5tx1zTCz45INcG+Wo/
	 tNbAdS67PVXjw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 19:16:15 +0100
Message-Id: <DGHFXVMKDCYX.2WNLOCBRBFCEM@kernel.org>
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 24/33] gpu: nova-core: Hopper/Blackwell: add FSP
 Chain of Trust boot
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-25-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-25-jhubbard@nvidia.com>
Message-ID-Hash: VYPPNVRTP7YAGXZ5AFR25XG244BP4RDU
X-Message-ID-Hash: VYPPNVRTP7YAGXZ5AFR25XG244BP4RDU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VYPPNVRTP7YAGXZ5AFR25XG244BP4RDU/>
Archived-At: 
 <https://lore.freedesktop.org/DGHFXVMKDCYX.2WNLOCBRBFCEM@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> +    /// Creates FMC boot parameters structure for FSP.
> +    ///
> +    /// This structure tells FSP how to boot GSP-RM with the correct mem=
ory layout.
> +    pub(crate) fn create_fmc_boot_params(
> +        dev: &device::Device<device::Bound>,
> +        wpr_meta_addr: u64,
> +        wpr_meta_size: u32,
> +        libos_addr: u64,
> +    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
> +        use kernel::dma::CoherentAllocation;
> +
> +        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 =3D 1;
> +        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 =3D 2;
> +
> +        let fmc_boot_params =3D CoherentAllocation::<GspFmcBootParams>::=
alloc_coherent(
> +            dev,
> +            1,
> +            GFP_KERNEL | __GFP_ZERO,
> +        )?;

I've mentioned this in another context already (where it doesn't work
unfortunately), but I think we should add a constructor that takes a closur=
e
with a &mut [T] argument, so we don't have to use dma_write!() for
initialization. If you want I can prepare a patch.

> +
> +        // Configure ACR boot parameters (WPR metadata location) using d=
ma_write! macro
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.target =3D GSP_DMA_TAR=
GET_COHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(
> +            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset =3D=
 wpr_meta_addr
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_=
desc_size =3D wpr_meta_size)?;
> +
> +        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_si=
ze to be zero;
> +        // it obtains WPR info from other sources.
> +        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gs=
p_rm_boot =3D 1)?;
> +
> +        // Configure RM parameters (libos location) using dma_write! mac=
ro
> +        kernel::dma_write!(
> +            fmc_boot_params[0].gsp_rm_params.target =3D GSP_DMA_TARGET_N=
ONCOHERENT_SYSTEM
> +        )?;
> +        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_of=
fset =3D libos_addr)?;
> +
> +        Ok(fmc_boot_params)
> +    }
> +
> +    /// Boot GSP FMC with pre-extracted signatures.
> +    ///
> +    /// This version takes pre-extracted signatures and FMC image data.
> +    /// Used when signatures are extracted separately from the full ELF =
file.
> +    #[allow(clippy::too_many_arguments)]

Maybe we should just add a FmcBootArgs type with a corresponding constructo=
r.
This should also get us rid of the helper function create_fmc_boot_params()=
.

> +    pub(crate) fn boot_gsp_fmc_with_signatures(
>          dev: &device::Device<device::Bound>,
>          bar: &crate::driver::Bar0,
> +        chipset: crate::gpu::Chipset,
> +        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image=
 section
> +        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootPara=
ms>,
> +        total_reserved_size: u64,
> +        resume: bool,
>          fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
> -        nvdm_type: u32,
> -        packet: &[u8],
> +        signatures: &FmcSignatures,
>      ) -> Result<()> {
> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
> +
> +        // Build FSP Chain of Trust message
> +        let fmc_addr =3D fmc_image_fw.dma_handle(); // Now points to ima=
ge data only
> +        let fmc_boot_params_addr =3D fmc_boot_params.dma_handle();
> +
> +        // frts_offset is relative to FB end: FRTS_location =3D FB_END -=
 frts_offset
> +        let frts_offset =3D if !resume {
> +            let mut frts_reserved_size =3D
> +                if let Some(heap_size) =3D crate::fb::hal::fb_hal(chipse=
t).non_wpr_heap_size() {
> +                    u64::from(heap_size)
> +                } else {
> +                    total_reserved_size
> +                };
> +
> +            // Add PMU reserved size
> +            frts_reserved_size +=3D u64::from(crate::fb::PMU_RESERVED_SI=
ZE);
> +
> +            frts_reserved_size
> +                .align_up(Alignment::new::<SZ_2M>())
> +                .unwrap_or(frts_reserved_size)
> +        } else {
> +            0
> +        };
> +        let frts_size =3D if !resume { SZ_1M as u32 } else { 0 };
> +
> +        // Build the FSP message

This comment seems superfluous.

> +        let msg =3D KBox::new(
> +            FspMessage {
> +                mctp_header: (mctp::HEADER_SOM << mctp::HEADER_SOM_SHIFT=
)
> +                    | (mctp::HEADER_EOM << mctp::HEADER_EOM_SHIFT)
> +                    | (mctp::HEADER_SEID << mctp::HEADER_SEID_SHIFT)
> +                    | (mctp::HEADER_SEQ << mctp::HEADER_SEQ_SHIFT),
> +
> +                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
> +                    | (mctp::VENDOR_ID_NV << mctp::NVDM_VENDOR_ID_SHIFT)
> +                    | (mctp::NVDM_TYPE_COT << mctp::NVDM_TYPE_SHIFT),
> +
> +                cot: NvdmPayloadCot {
> +                    version: chipset.fsp_cot_version(),
> +                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
> +                    gsp_fmc_sysmem_offset: fmc_addr,
> +                    frts_sysmem_offset: 0,
> +                    frts_sysmem_size: 0,
> +                    frts_vidmem_offset: frts_offset,
> +                    frts_vidmem_size: frts_size,
> +                    hash384: signatures.hash384,
> +                    public_key: signatures.public_key,
> +                    signature: signatures.signature,
> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
> +                },
> +            },
> +            GFP_KERNEL,
> +        )?;
> +
> +        // Send COT message to FSP and wait for response
> +        Self::send_sync_fsp(dev, bar, fsp_falcon, &*msg)?;
> +
> +        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
> +        Ok(())
> +    }

<snip>

> diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
> index f04e2a795e90..88b1546e3cb4 100644
> --- a/drivers/gpu/nova-core/gpu.rs
> +++ b/drivers/gpu/nova-core/gpu.rs
> @@ -124,6 +124,18 @@ pub(crate) const fn arch(&self) -> Architecture {
>              | Self::GB207 =3D> Architecture::Blackwell,
>          }
>      }
> +
> +    /// Returns the FSP Chain of Trust (COT) protocol version for this c=
hipset.
> +    ///
> +    /// Hopper (GH100) uses version 1, Blackwell uses version 2.
> +    pub(crate) const fn fsp_cot_version(&self) -> u16 {
> +        match self.arch() {
> +            Architecture::Hopper =3D> 1,
> +            Architecture::Blackwell =3D> 2,
> +            // Other architectures don't use FSP COT
> +            _ =3D> 0,

I think we should use a new type to represent this version and use Option, =
i.e.
return Option<FspCotVersion>.
