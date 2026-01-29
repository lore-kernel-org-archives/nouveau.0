Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAAE8D46C01
	for <nouveau@archiver.kernel.org>; Thu, 29 Jan 2026 00:20:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AE43010E790;
	Thu, 29 Jan 2026 00:20:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bJVinoa0";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6CCF340B8C;
	Thu, 29 Jan 2026 00:11:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769645486;
 b=jUEWtCtPVN1XV8jMqnSKoIyC3N6xei3JRyfSXB8oRvOc64lkufv/VHMBV/A75Zz+9LLdO
 ZtTca6LVpLMoREguIZJW48XKvAlSO9bsUuqz3ZiffBmx7ZOwOUCiaVoxQS2MFXt9iN9CdkU
 JTMDO8T/l6QrBLtIv/TWNvUUL6/VSJUSf4vdjCGbcSlBfIKRvrkNO6dYd4DfKbPVbi2pbQS
 mw8VH31/+uYwFRRTCzY1Vam4PCGG0Im3w8pEIRcg8yakdqWQ0FF85JQ7/RyUyFDVGb/D7S/
 LIWlCYtf9FSxSI8I5B2tP5QLp7AEx1LJRT+2T2sPSC3B7VQ018RfC4GUM6Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769645486; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i50DZmDSRzJ5dUTG8XRhu2N0pniDJQ/fJ1njJPC3wfU=;
 b=mq2kBE1Gpvqo6hFZSUsrWkx5UdTs16iCUjkV0FQ5WfYMkFW8i3yU8jnyAtlgyLL08mtEo
 MdiM5f5a8mYnGOnIBOJ4dJCSfGU5jBOWhiJPuCurPGLRwt0ZWgrQCwdgcUeqjFU47Fxc5J9
 ga6ODcpZJ5run7fmlHef7gxL0AxKnKDxTBO4uip0Bqh2k36MO4NwFVZNzdC8Yd9WYIZsIvR
 ljyCt7OVIkt1iO+D94A/6nJIa8zed9D4dQQXShN1y/2hkyxSMl6RH4aLCgJLLhbUN+siW+4
 3KnuKMqBiIsNFcDt1tFbIDA0o65ZQ/5lxFKOqvFcTcOFTBFv0jRlzDOWbpPA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7ED4040AA6
	for <nouveau@lists.freedesktop.org>; Thu, 29 Jan 2026 00:11:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 69CF010E2F0;
	Thu, 29 Jan 2026 00:20:26 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71F7A6001A;
	Thu, 29 Jan 2026 00:20:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5174C4CEF1;
	Thu, 29 Jan 2026 00:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769646025;
	bh=Lpd9kC+1aougw4btdvzon7ENBBCLCGY+Jd5QG33v4yw=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=bJVinoa06mK4xDCvuVXnFC/HzeXb5E5HreC05Ge7Gbap+2Ww2i1UazpaSSuCwpbxX
	 prY4MV0AbboQIm7vAP+TP3ycwQ0JJMqBwzQqF/3LWLYE25Cvi/QLp3qZjaHPMubdAl
	 RHrTVZI5hWzMVTNqcYq4RSuckDQCz9eYgIceqaB9e5CsCzioNaOl2vsIjQb2x936Q5
	 yvt6K+CGz0VTgy45y+Wm1TbAEerZjmxQkMUQsCoI3qii5c+y9JlOI9R9aGW84ddTNl
	 6xA7u54/EFrClsJyDkB8/vijBmalgJ3b/wVJcQL1pQwZoK+tLWgF21G12W1J8RxAi3
	 fR/ne5i7l1Zsw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Jan 2026 01:20:18 +0100
Message-Id: <DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/5] gpu: nova-core: use checked arithmetic in FWSEC
 firmware parsing
References: <20260126202305.2526618-1-joelagnelf@nvidia.com>
 <20260126202305.2526618-2-joelagnelf@nvidia.com>
 <DG0607SU943F.1FDOPYPN38FCS@kernel.org>
 <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
In-Reply-To: <259bdacf-d16e-4fff-9f6b-f860feb40aa8@nvidia.com>
Message-ID-Hash: K7JGYT3TOFRU4AW7DLD3OJN36F4BSJGT
X-Message-ID-Hash: K7JGYT3TOFRU4AW7DLD3OJN36F4BSJGT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/K7JGYT3TOFRU4AW7DLD3OJN36F4BSJGT/>
Archived-At: 
 <https://lore.freedesktop.org/DG0N5PNS1ZQ0.13WMT4XYDXNUS@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jan 28, 2026 at 4:14 PM CET, Joel Fernandes wrote:
> On 1/28/2026 5:53 AM, Danilo Krummrich wrote:
>> On Mon Jan 26, 2026 at 9:23 PM CET, Joel Fernandes wrote:
>>> @@ -267,7 +264,12 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &V=
bios, cmd: FwsecCommand) -> Re
>>>           let ucode =3D bios.fwsec_image().ucode(&desc)?;
>>>           let mut dma_object =3D DmaObject::from_data(dev, ucode)?;
>>>  =20
>>> -        let hdr_offset =3D usize::from_safe_cast(desc.imem_load_size()=
 + desc.interface_offset());
>>> +        // Compute hdr_offset =3D imem_load_size + interface_offset.
>>=20
>> I do get the idea behind those comments, but are we sure that's really a=
 good
>> idea? How do we ensure to keep them up to date in case we have to change=
 the
>> code?
>>=20
>> If we really want this, I'd at least chose a common syntax, e.g.
>>=20
>> 	// CALC: `imem_load_size + interface_offset`
>>=20
>> without the variable name the resulting value is assigned to.
>>=20
>> But I'd rather prefer to just drop those comments.
> The idea of adding these comments was to improve readability. However, I=
=20
> can drop them in the v3, that's fine with me.

Yeah, that's why I wrote "I get the idea". :) But as I write above, I'm
concerned about the comments getting outdated or inconsistent over time.

Besides that, it more seems like something your favorite editor should help=
 with
instead.

> Do you want me to wait for additional comments on this series, or should=
=20
> I make the update and repost it?  Thanks,

As mentioned, I tend to think we should just drop them, but I'm happy to he=
ar
some more opinions on this if any.
