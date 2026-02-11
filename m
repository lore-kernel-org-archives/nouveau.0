Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0906BE9E2E2
	for <nouveau@archiver.kernel.org>; Wed, 11 Feb 2026 10:57:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D95C410E3A8;
	Wed, 11 Feb 2026 10:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sZC8XIlm";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B364041E87;
	Wed, 11 Feb 2026 10:48:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770806898;
 b=wH4bwqSeSoqsZEdXzSuLhV+ytOWqoPqg8JNwMO+CdJQLbcJbwcPP7MDbT97BVq59QqHuE
 leJig52ycNt3v9hfxuIe1SCLGL2nFajjKEeQeXQ0aSdtrNs/6zkCQyHcVjqUVM0cAdDL/pN
 03eRhDTjfZiANC/9UsEHMC+XGKYMjoVzP1EqquyRBY8N73IFCHA6HoSECP24Glrgutu5ECj
 wPyu/nVY2AiG4Sqh6MtKcTqERxST3L6GXnz9KVcpX1FNy33mgdNdSprOY9SM45dMdFBVfSv
 zwVZolpPDvYQ0eSSCX8i6HfnoTktIOaP9w/qnd2bAHLXbgenY8/+KbUJnPkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770806898; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=REyflrzPevWhywY6SNoLv9ktMhH1pNx1zGM1kTPEEO0=;
 b=WW2AFZG+xaxjcJd55SdsoMVLBEmTz+q8ynIlMy6A5MRI3nRwBaZ3kDvig5et0n3QH2b97
 bfjsaLYvf1et45A+nGTUNJye8RnkBFF/+chLu0fAUzTjyezKCQp/djOV2CGUp7CGJNRdW8C
 SDZS6xkAZ67HlIDIkzPHPoGwqxWs/qANZvWPdxaLWfiZYUT+V1QZCHYCyoNZ469+eHMlh5O
 GPUEg+rN3FX2ZvQSsaEYxX7TRljC+YenxuAcE8F5BImbVNV9E4Sdlia+Pbmv5UmrLLPCD6H
 8xogh7sfI7I5kP5Met0x1wwkQL+1Q9Eu3mlKLfwYd50ULA1lxBLjUvuO2giw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F02774053B
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:48:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF4D010E01F
	for <nouveau@lists.freedesktop.org>; Wed, 11 Feb 2026 10:57:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2562260018;
	Wed, 11 Feb 2026 10:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9B20C4CEF7;
	Wed, 11 Feb 2026 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770807467;
	bh=g0VhMpCjJVOxUuxV/Ef95Alaq/jqb1kCB0wJN9jxepY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=sZC8XIlmxKD5BgqOgM9VwnZBzXaFFqjJQMHI7040VOT6otoReT3pewjACwbWKPqlH
	 AQjQfvnIcSkBpWxZTzJ3p1Fr9PBrAVH8Dg8uecKAMlhNbOXgzc11dI7SkzTsN07Ads
	 WfvfZ7vo5mDGGFQLFL2YymRbygGBGHTieM4zN6qhKroIp1jctVPgBuYf3+v7RBd2Xt
	 OnWrg7X9AXz6H+v2c2DUoHzWVqnp/HvbinwRM30yAS3mArj6qk4NMZzXFy7ydEyqaC
	 LkAaU+Zqo5kHYOvufdU6sw3kIdEy8va+aDnT5jbtLDUC86PIw1K6qitC3Q19R4W/JR
	 bpPvgDfKOdxgQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Feb 2026 11:57:42 +0100
Message-Id: <DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org>
Subject: Re: [PATCH v4 17/33] gpu: nova-core: Hopper/Blackwell: add FSP
 falcon EMEM operations
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-18-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-18-jhubbard@nvidia.com>
Message-ID-Hash: C2AM6B3YDZPUOSXSM4HK4UWBOJ5RD6CT
X-Message-ID-Hash: C2AM6B3YDZPUOSXSM4HK4UWBOJ5RD6CT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C2AM6B3YDZPUOSXSM4HK4UWBOJ5RD6CT/>
Archived-At: 
 <https://lore.freedesktop.org/DGC2UTPTU2ZH.3Q5E9OW3ZRPLP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> Add external memory (EMEM) read/write operations to the GPU's FSP falcon
> engine. These operations use Falcon PIO (Programmed I/O) to communicate
> with the FSP through indirect memory access.
>
> Cc: Gary Guo <gary@garyguo.net>
> Cc: Timur Tabi <ttabi@nvidia.com>
> Signed-off-by: John Hubbard <jhubbard@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon/fsp.rs | 59 ++++++++++++++++++++++++++++-
>  drivers/gpu/nova-core/regs.rs       | 13 +++++++
>  2 files changed, 71 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/nova-core/falcon/fsp.rs b/drivers/gpu/nova-core/=
falcon/fsp.rs
> index cc3fc3cf2f6a..fb1c8c89d2ff 100644
> --- a/drivers/gpu/nova-core/falcon/fsp.rs
> +++ b/drivers/gpu/nova-core/falcon/fsp.rs
> @@ -5,13 +5,20 @@
>  //! The FSP falcon handles secure boot and Chain of Trust operations
>  //! on Hopper and Blackwell architectures, replacing SEC2's role.
> =20
> +use kernel::prelude::*;
> +
>  use crate::{
> +    driver::Bar0,
>      falcon::{
> +        Falcon,
>          FalconEngine,
>          PFalcon2Base,
>          PFalconBase, //
>      },
> -    regs::macros::RegisterBase,
> +    regs::{
> +        self,
> +        macros::RegisterBase, //
> +    },
>  };
> =20
>  /// Type specifying the `Fsp` falcon engine. Cannot be instantiated.
> @@ -29,3 +36,53 @@ impl RegisterBase<PFalcon2Base> for Fsp {
>  impl FalconEngine for Fsp {
>      const ID: Self =3D Fsp(());
>  }
> +
> +impl Falcon<Fsp> {
> +    /// Writes `data` to FSP external memory at byte `offset` using Falc=
on PIO.
> +    ///
> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
> +    #[expect(unused)]
> +    pub(crate) fn write_emem(&self, bar: &Bar0, offset: u32, data: &[u8]=
) -> Result {
> +        // TODO: replace with `is_multiple_of` once the MSRV is >=3D 1.8=
2.
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
> +            .set_wr_mode(true)
> +            .set_offset(offset)
> +            .write(bar, &Fsp::ID);
> +
> +        for chunk in data.chunks_exact(4) {
> +            let word =3D u32::from_le_bytes([chunk[0], chunk[1], chunk[2=
], chunk[3]]);
> +            regs::NV_PFALCON_FALCON_EMEM_DATA::default()
> +                .set_data(word)
> +                .write(bar, &Fsp::ID);
> +        }
> +
> +        Ok(())
> +    }
> +
> +    /// Reads FSP external memory at byte `offset` into `data` using Fal=
con PIO.
> +    ///
> +    /// Returns `EINVAL` if offset or data length is not 4-byte aligned.
> +    #[expect(unused)]
> +    pub(crate) fn read_emem(&self, bar: &Bar0, offset: u32, data: &mut [=
u8]) -> Result {
> +        // TODO: replace with `is_multiple_of` once the MSRV is >=3D 1.8=
2.
> +        if offset % 4 !=3D 0 || data.len() % 4 !=3D 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        regs::NV_PFALCON_FALCON_EMEM_CTL::default()
> +            .set_rd_mode(true)
> +            .set_offset(offset)
> +            .write(bar, &Fsp::ID);
> +
> +        for chunk in data.chunks_exact_mut(4) {
> +            let word =3D regs::NV_PFALCON_FALCON_EMEM_DATA::read(bar, &F=
sp::ID).data();
> +            chunk.copy_from_slice(&word.to_le_bytes());
> +        }
> +
> +        Ok(())
> +    }
> +}

Technically, we could represent this as a separate I/O backend and use IoVi=
ew /
IoSlice (once we have it).

So, you could have Falcon<Fsp>::emem(), which returns an &Emem that impleme=
nts
Io [1].

This way we would get IoView and register!() for free on top of it. IoView =
will
allow you to modify fields of the FSP structures similar to what we have fo=
r DMA
with dma_read!() and dma_write!().

I just briefly glanced at the subsequent patches, but it looks like this co=
uld
save quite some code.

We may not get the full potential right away, as IoView is still WIP, but I
think it makes sense to consider it for a follow-up.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core=
.git/tree/rust/kernel/io.rs?h=3Ddriver-core-next#n303
