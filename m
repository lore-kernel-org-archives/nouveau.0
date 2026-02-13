Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783F5EDF16D
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 14:47:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6FD610E816;
	Fri, 13 Feb 2026 14:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qLGa0ZqO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED5EA42BBF;
	Fri, 13 Feb 2026 14:37:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770993451;
 b=Ai1QfLemDPQToF+KXrrm/R3sHlCls3dy1fWmgzkPFawZpluj6Bhds8h8IGPtOEJG4zT59
 9jXvhgak5Ut5cT/rC2eP1NeubIoZ5vK7BXXhQczYgz1TT5aHG7v+wspDPF1wSDS+2ph42DS
 kbGRmQgkKu34iUN6ZyG1T2viBRKvD9zuvdrvYVZPXD0TN5NFra0jzqMAO4kUk5uFbM66ocY
 jJ90ZD0kpZo071U+GvuMOUR86aFoFhjZo3ihptW2VlkufD6zehzAHRnQG5sJonAJOC9N4lq
 16BjINFKOdgN3Ihqy2uImyDM2k8S0Srr8Yh8T3RDIPamTbrmwaD8pjcRUaTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770993451; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=tbwpLiifq5bBWP8vquQfvXjFugEkQiVgtwZTmVqcWD4=;
 b=KNhlSVbcbA21aNaMbXiwVvtaYKo34FMicmn1mf9D7960R0RWMj2PDbb+xqxiMRkJi88Bv
 6uxvR88L8S5zrB58zJmRtysPs79/M7J9wVerPj39XrGTC6BoFCT9vjg02E+Uk2lTzVDem7b
 b+Pb5Hw/ZMb7kkyrLm1MjAvIpDvvQs4Epmdhw+UegHsCR8zd+ao8LhyQKm/dmdxCwvve6Qw
 RhwtsAIbT+KbKJy5u74tKfJFz/UtUXvymTF5JGdwe04IVJEG2+9O9YT1e2hNXOwvbvv2kUG
 0h67gK2/LOgYE0QnUm4yxvQxYZybIgmbJwAtKJpzQct6A7oUV5QbMt63bahw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F37AB4016C
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 14:37:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B2C9F10E102;
	Fri, 13 Feb 2026 14:47:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 664FD42B35;
	Fri, 13 Feb 2026 14:47:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6E9C116C6;
	Fri, 13 Feb 2026 14:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770994026;
	bh=PfUuTo2C22B502KfiidVcMpl6fd1ZJEdslkaqG2JgXo=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=qLGa0ZqOVOApBCBl9bS3iFM0WK0TiLYX01j2qDqzV+QxNd8Upska8blJ6snj7Kh1/
	 MyJIOCBf5Ucy1ct7yxtw9TsQK/927cYKtZghWawrDKmvR5oUct2EiruQKrLUOWeRiC
	 GMk4q9+mVQiYoClAVfo/RfRwD9popMZL5ORrDYb4xus850SjWtcTOXdArG9hAn57FA
	 LDRSSQSh6Eg9zlxsmFytnFptZAOT4bK972lTEIXUbUCkiYadROP8AphflKTdvg9CdK
	 u9aNAv7ya/aP8cNrN8yStE17ZbQyCw9fp2KAFPKPx/33yVa4vDg0cumdpbNcISc78g
	 0lX4Em1fA84Bw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Feb 2026 15:47:01 +0100
Message-Id: <DGDWZHY8XCLX.19DI18CI9QSPQ@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v9 6/9] gpu: nova-core: add PIO support for loading
 firmware images
References: <20260212-turing_prep-v9-0-238520ad8799@nvidia.com>
 <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
In-Reply-To: <20260212-turing_prep-v9-6-238520ad8799@nvidia.com>
Message-ID-Hash: E7WBUEILVWDZZM6BS3XRRKRCF4PMHK5R
X-Message-ID-Hash: E7WBUEILVWDZZM6BS3XRRKRCF4PMHK5R
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/E7WBUEILVWDZZM6BS3XRRKRCF4PMHK5R/>
Archived-At: 
 <https://lore.freedesktop.org/DGDWZHY8XCLX.19DI18CI9QSPQ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 12, 2026 at 9:26 AM CET, Alexandre Courbot wrote:
> +    fn try_as_pio_loadable(&self) -> Result<FalconDmaFirmwarePioAdapter<=
'_, Self>> {

[...]

> +        let dmem =3D {
> +            let params =3D self.dmem_load_params();
> +
> +            // SAFETY: we keep a reference to `self` for as long as this=
 slice is alive, and the
> +            // device will not access this DMA object since we are using=
 PIO.

How is this guaranteed by this function? I.e. how is it prevented that this
function is never called when the device acesses the DMA memory?

> +            let data =3D unsafe {
> +                self.as_slice(
> +                    usize::from_safe_cast(params.src_start),
> +                    usize::from_safe_cast(params.len),
> +                )?
> +            };
> +
> +            let dst_start =3D u16::try_from(params.dst_start).map_err(|_=
| EINVAL)?;
> +
> +            FalconPioDmemLoadTarget { data, dst_start }
> +        };
> +
> +        Ok(FalconDmaFirmwarePioAdapter {
> +            fw: self,
> +            imem_sec,
> +            imem_ns,
> +            dmem,
> +        })
> +    }
> +}

<snip>

> +/// Adapter type that makes any DMA-loadable firmware also loadable via =
PIO.
> +///
> +/// Created using [`FalconDmaLoadable::try_as_pio_loadable`].
> +pub(crate) struct FalconDmaFirmwarePioAdapter<'a, T: FalconDmaLoadable +=
 ?Sized> {
> +    /// Reference to the DMA firmware.
> +    fw: &'a T,

In v6 [1] I wrote:

	> @@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
	>      desc: FalconUCodeDesc,
	>      /// GPU-accessible DMA object containing the firmware.
	>      ucode: FirmwareDmaObject<Self, Signed>,
	> +    /// Generic bootloader
	> +    gen_bootloader: Option<GenericBootloader>,

	I'm not convinced this is a good idea. We probably want a HAL here and
	have different FwsecFirmware types:

	One with a DMA object and one with a system memory object when the
	architecture uses PIO. In the latter case the object can have a
	GenericBootloader field, i.e.  this also gets us rid of the Option and
	all the subsequent 'if chipset < Chipset::GA102' checks and 'match
	gbl_fw' matches below.

So, I still wonder, why use an Adapter impl on top of DMA memory for PIO ra=
ther
than different base types with a common trait to avoid DMA allocations in t=
he
PIO case altogether?

[1] https://lore.kernel.org/all/DFQBHVTTHZY8.13ASLCJ3FJP81@kernel.org/
