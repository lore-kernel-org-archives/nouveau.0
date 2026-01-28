Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D9A4D2592A
	for <nouveau@archiver.kernel.org>; Wed, 28 Jan 2026 10:54:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 933A110E64B;
	Wed, 28 Jan 2026 10:54:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MQQqeZn/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 98AE040B86;
	Wed, 28 Jan 2026 10:44:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769597098;
 b=p+omAMj0ZKSPcutM9bL8ln+vsnbidtjMtQ1pa6q98hiL/dUchJW+DWuWflS6Z1Sq3KKW/
 1FCRIB1LTvjHhVA+7oJnTKrGyEAT+Yv6A8ceeczJZzpsIXiV30lMpLI2u4lILngiJLnLD3n
 iSK/KC5JTgwmle2xQJUytxs5i8vfUgCzvMgP3MZRngODeUNpYCmZIjt9xAUsp7/2WJmzrub
 nmhAiWXjdWjPqVhl94bjeWLRX1aV0rx0dy2BT0EdxEz5v8xnAUgdToje1xlQYGKusBtSQSo
 8p2cgBXkNQr7VFr/tfk55nw2zYB8akI3BsuEa7QgrsCfjxzrp7u7JXU35LLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769597098; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=w3df7WxTd1E5PicIQ5FWEHWK5xN5bE78+m3fL4xVID0=;
 b=H75HyoeoV++GPFJYISf5ZY/JRBeIKcrDHUnkbxQcgHuTV8lEzwAoFR5DreayaPhmH1OXE
 NhgoJ5OJEhdzQEMQvUoNUCUB/IfKLBds1Swr+6hHEzwisjDVBvThI9B8gGDdn+tpPy/ChZr
 42n1XnRTxTr/slZGGSXx0lXQpc9f5SOP0UPTlAsVVIYSpPhY6/MPGuNxeXVzh7r8OFFYel0
 jNxZuqP0Vr1hCZjmmrJJzoUXFLMVAmEzdRaBwI8sQta7UjmFngDvumWzyNFu0JifExgdMY5
 jUQ42DWiwidNUgzT99nM8PjsHIdefA3mK+nnBeknw84CGPvvMQFs9Y+hN7XQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E2A4B404D9
	for <nouveau@lists.freedesktop.org>; Wed, 28 Jan 2026 10:44:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E3D010E642;
	Wed, 28 Jan 2026 10:53:57 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F17BD600AA;
	Wed, 28 Jan 2026 10:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1510AC2BCB0;
	Wed, 28 Jan 2026 10:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769597636;
	bh=VTLd7vd+WPNn7NR0v8u7rGagToa/9uYN3+K/raVxK/Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=MQQqeZn/PS82H2I0BiwGmgQ0Es/plFXiloDRMKmpxzUhvqPevwbL542+5QITNyZtU
	 up/j2BkdX6VCiLztlMVnpPhqwdy/BhsErmW0jHE2rVRNULmxfLtrZ0skQN27sluyP6
	 a95zFRg1votKHCV6STIz1NUYtanysA/u9krLZ7CX0hKyiG1PUn6ZE+vHeARq0xVehX
	 sXXnInrrgikf+WNsUYJqhwIlbS65UdHhXdx/hEwE5PHDMEkhzwm1W0tR/NgOwkhJwr
	 logbW9QpMlEbl5C2uoY/5E6fCXt1GBQDTD6BWIqUVTnykJkc0f/oEGVzYl63/LjXtF
	 wlaKiS7SLYHvg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 28 Jan 2026 11:53:48 +0100
Message-Id: <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
In-Reply-To: <20260126202305.2526618-2-joelagnelf@nvidia.com>
Message-ID-Hash: TT2AVTGKZZAPU6PBMWAP3FP3ZL6JUAXH
X-Message-ID-Hash: TT2AVTGKZZAPU6PBMWAP3FP3ZL6JUAXH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>, Dirk Behme <dirk.behme@gmail.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-riscv@lists.infradead.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TT2AVTGKZZAPU6PBMWAP3FP3ZL6JUAXH/>
Archived-At: 
 <https://lore.freedesktop.org/DG0607SU943F.1FDOPYPN38FCS@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbi=
os, cmd: FwsecCommand) -> Re
>          let ucode =3D bios.fwsec_image().ucode(&desc)?;
>          let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
> =20
> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size() +=
 desc.interface_offset());
> +        // Compute hdr_offset =3D imem_load_size + interface_offset.

I do get the idea behind those comments, but are we sure that's really a go=
od
idea? How do we ensure to keep them up to date in case we have to change th=
e
code?

If we really want this, I'd at least chose a common syntax, e.g.

	// CALC: `imem_load_size + interface_offset`

without the variable name the resulting value is assigned to.

But I'd rather prefer to just drop those comments.

> +        let hdr_offset =3D desc
> +            .imem_load_size()
> +            .checked_add(desc.interface_offset())
> +            .map(usize::from_safe_cast)
> +            .ok_or(EINVAL)?;
>          // SAFETY: we have exclusive access to `dma_object`.
>          let hdr: &FalconAppifHdrV1 =3D unsafe { transmute(&dma_object, h=
dr_offset) }?;
