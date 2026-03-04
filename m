Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A14EB7ED4
	for <nouveau@archiver.kernel.org>; Wed,  4 Mar 2026 11:39:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 854D810E9CD;
	Wed,  4 Mar 2026 11:39:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Hy2HOrsP";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9069344E16;
	Wed,  4 Mar 2026 11:28:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772623737;
 b=Nucqevaa19rYBsh9gm0MDHzaemnOfiAzGnBMGPVWGMsTv7OCzkuIItUu8TFZ7KDzG5Zy5
 UXh+52hHsKP2a9vgq4Rg/e4h5lIiF1qYYHxtZeM9EFTaMPl/7VMH/yH23QDqcUV2OetxTXs
 KRjxzhfZcTBT61pLgqsGzUL5p/D7mxI0qNxrHABLaqt1efh2n5ct78i45Vi04STDpHGjs0I
 cgpMuMFFyl2PHCRa/hS3VJhks02yB4Y0SG6TnV8Qt52SRJxu0Y2GxE9mNpRNarRJK1HDuYj
 skRFMIxRoXguc4FXSCqcPXhBONn6dt5rS1gi3oqKmgINQU9NQ5nRLFWED4Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772623737; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AzFnMZVPG37ubr1XyLwDi0xr2IYWNx2vPyLVknIwSSA=;
 b=PcfritbiACBgnxdpZYhouS3irL7J/TsHwLIj7cVOddYB5l1QSvts3zmFALYpN0Kyw8MYM
 PLIAYnlPS0MEEYSg/bmttw1IVIJ4AD7gQJ3NQ3ZkvUXMo7VHzS3QjFmMEX0k5NHxQc27reA
 49lVmISGjXmvXgx4dPTfttny2oUFuoX3cRsSDo0skUJ8Y1dCdGxTTwGHvI6rmXtseZPBeB6
 X6hMGJSUWYioNILVgVAKMfE5C4DVrzJ4QqjH5SCV3NF5cWz0DSQ+Q0iu3k2EppbAPwyAEOE
 dQPPhn7TvN/BWlFQTfMiWOiXFhsOWNwM1stNxIAvlLo/mZLbRTB3UDkCJnyA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1113C41E96
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 11:28:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BDEB110E9C4;
	Wed,  4 Mar 2026 11:39:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C196060097;
	Wed,  4 Mar 2026 11:39:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FF2DC19423;
	Wed,  4 Mar 2026 11:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772624353;
	bh=UuegjYjNYdFZYA27dchsMoBmg0FJygSXcjoy8zrEaVM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Hy2HOrsPB2b4JElrQXZZO2/AwB1zsGmrhScOPZtBCa7DX8h2EXtAO7CrARdqoG8YT
	 gkSqDunPagYps1kxEXIgVQFw7m2Qbt/sSh62rRVZMi63VwQ1sCfc90uYk1UIDJiWrg
	 /aX1Gt1HLFzk05DW7yhl38EwR7IfUrkqujxbWMAtAJ52X7qKILjLqjVPMQtLLVsK6d
	 h7601dTjKVpm5KTzJT1t5wrf2vvf6/3tFIDuMBhs125oZhEuFm6dpN/LAIp4pCwgRV
	 H8bCOF0aWTK9E+FOROz1kQX6yvoGXDz6nCTg9I2T/8pMd/zI0ZqHl9ncEg9DA84I1F
	 SdR9qICqcPcJA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 04 Mar 2026 12:39:08 +0100
Message-Id: <DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org>
Subject: Re: [PATCH v5 2/9] gpu: nova-core: gsp: add mechanism to wait for
 space on command queue
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260304-cmdq-continuation-v5-0-3f19d759ed93@nvidia.com>
 <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
In-Reply-To: <20260304-cmdq-continuation-v5-2-3f19d759ed93@nvidia.com>
Message-ID-Hash: PL44OPIMZ72UZUDFLUK6RY7DCHJIHZEE
X-Message-ID-Hash: PL44OPIMZ72UZUDFLUK6RY7DCHJIHZEE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Zhi Wang <zhiw@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PL44OPIMZ72UZUDFLUK6RY7DCHJIHZEE/>
Archived-At: 
 <https://lore.freedesktop.org/DGTYVZMRVLLE.3HQVL7ZT6MU7H@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 4, 2026 at 2:42 AM CET, Eliot Courtney wrote:
> +    fn allocate_command(&mut self, size: usize, timeout: Delta) -> Resul=
t<GspCommand<'_>> {
> +        read_poll_timeout(
> +            || Ok(self.driver_write_area_size()),
> +            |available_bytes| *available_bytes >=3D size_of::<GspMsgElem=
ent>() + size,
> +            Delta::ZERO,

Isn't this either creating unneccessary thrashing of the memory controller =
or
unnecessary contention at the cache-coherency level?

I think we should probably add at least a small delay of something around 1=
us.

> +            timeout,
> +        )?;
