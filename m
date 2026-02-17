Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76BAFE9A03E
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 20:12:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5264010E51A;
	Tue, 17 Feb 2026 20:12:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CVUbjyk+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F1E87433AD;
	Tue, 17 Feb 2026 20:02:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771358556;
 b=kGZ+9o/GJPz2YmU4QCm+Rva6FoqIH4NqqcQYuBaORkCMLFGM8Ssr+pi8wic11RkhTcGwp
 AMRHljIauFiyaVo/cVU4omm+oL7q6UKKgZ27axySLhI04eWBTryeiWxZcqMyMEu8b6i0y0m
 w6PO9geqvfQ6LJ3QnWkPRJ31MI+j7NodqXiNUWPV5NU4AfV5sD18aW9mWxma13XF23a55wo
 PafRksNcQTF8cCfoUh8y3Tx3+ZJcZTKHL4NjwnBLg3u0aOMdrcAbDwiqCIf4R6l+oWXBHoP
 6pqrT+kxwkV/kkZp4RpYBKRkSXvIp5vkaobyW+JI1kcmumqPsp9qkWoImxbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771358556; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=edSMDKh3CHrezRf/E1A+94rE4cNllV4twn+rdDvIo50=;
 b=LsJUXvG/Bi9RIFef056AEre29oGAQMohP5jxBqU8Ttg3Wd9+DEcKEffXEHZ2G1LRrM9Sf
 x7sxOBmeult6IuqIlLgTIYUVLpSIvFQXkSmT1LYdKGK56apeHtNpmaewZpfXkrdPsIPtCFa
 dFehulHMPc9sphuWteu/Uw4O4kAnvaGCf/PUZ/u8d4dXGjbJMcBP7Atf5BwEmg+z7I9xmZ4
 yvCS2/9db96Ps6yUVSa+ofDwPmVRUtT3YxW04Lzl7DQRWT8pRecQkMUxPyWQenr43JWZzis
 mo3ykTTw6gUN7CKsaxIGX69eMAEhHjmFIfdPjxvE7GX+0e4eTawSIJ8lJhzA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0145C403B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:02:35 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 33A0110E4E5
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 20:12:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 130EE43837;
	Tue, 17 Feb 2026 20:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9D71C4CEF7;
	Tue, 17 Feb 2026 20:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771359141;
	bh=ZcC5YWdcb8ht0sD/VHqGWITAQtnYdshDayFlHAhQmI4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=CVUbjyk+orcZKfrNR2YbC3C98sTInR04S9r19EANwNUCrxKpIyxlpfu+Q4ycJ6BVh
	 LtzrTqlfzlUFCKnPvcqTjf6UtM2pQETR+1J5P40HxTfLwnWfARFU674G51ZtM9mP1E
	 iwRluzb+HhYzZl8GfQvq3AemPYuic9Q3y7GhuKRD/OxSd6b/eW/lY3DtAFrWOfTpTd
	 fveAtdSnGBzX7vbSiEIogJ45Z6KowHaYR2vDG4tJSyd/IhwT7P5ZsLBWamIgOEkSih
	 zRfQDbCk4xM0PBg4dxIr/b9Fg64uZdrke2ZAvb0H8fIkNErSwtBL15MBOLKUQBKWax
	 nkPLfiSVq7kFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 21:12:16 +0100
Message-Id: <DGHIEPBEHSC1.1G155LGII83R1@kernel.org>
Subject: Re: [PATCH v4 28/33] gpu: nova-core: refactor SEC2 booter loading
 into run_booter() helper
To: "John Hubbard" <jhubbard@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260210024601.593248-1-jhubbard@nvidia.com>
 <20260210024601.593248-29-jhubbard@nvidia.com>
In-Reply-To: <20260210024601.593248-29-jhubbard@nvidia.com>
Message-ID-Hash: BMJL6PLGHJASRFIIUCOCXB5FY2NCPPR7
X-Message-ID-Hash: BMJL6PLGHJASRFIIUCOCXB5FY2NCPPR7
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BMJL6PLGHJASRFIIUCOCXB5FY2NCPPR7/>
Archived-At: 
 <https://lore.freedesktop.org/DGHIEPBEHSC1.1G155LGII83R1@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 10, 2026 at 3:45 AM CET, John Hubbard wrote:
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 465c18e4c888..6191986fc6b5 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -120,6 +120,40 @@ fn run_fwsec_frts(
>          }
>      }
> =20
> +    fn run_booter(
> +        dev: &device::Device<device::Bound>,
> +        bar: &Bar0,
> +        chipset: Chipset,
> +        sec2_falcon: &Falcon<Sec2>,
> +        wpr_meta: &CoherentAllocation<GspFwWprMeta>,
> +    ) -> Result {
> +        let booter_loader =3D BooterFirmware::new(
> +            dev,
> +            BooterKind::Loader,
> +            chipset,
> +            FIRMWARE_VERSION,
> +            sec2_falcon,
> +            bar,
> +        )?;

Maybe we should just make the part below a method of BooterFirmware, i.e.
BooterFirmware::run()?

> +        sec2_falcon.reset(bar)?;
> +        sec2_falcon.load(bar, &booter_loader)?;
> +        let wpr_handle =3D wpr_meta.dma_handle();
> +        let (mbox0, mbox1) =3D sec2_falcon.boot(
> +            bar,
> +            Some(wpr_handle as u32),
> +            Some((wpr_handle >> 32) as u32),
> +        )?;
> +        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1)=
;
> +
> +        if mbox0 !=3D 0 {
> +            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0=
);
> +            return Err(ENODEV);
> +        }
> +
> +        Ok(())
> +    }
