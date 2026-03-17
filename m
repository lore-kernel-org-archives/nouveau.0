Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4401FED9E7
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 15:34:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7D9610E6C6;
	Tue, 17 Mar 2026 15:34:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lloHfF9u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AE4E9451E8;
	Tue, 17 Mar 2026 15:23:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773761005;
 b=OUrAFL5SlxSIoxOnmwHHd34iOzbU7qnHEBaAT8T+52FYU8sOSPj8L0xG30OSTJzvvl05O
 v6/TUoW7wXd8Njw+WinXTXenqjB5AGuPF2Y7/fDxPsr+0KAdZSOSPYNiuDq/82FyyviOF2H
 SY2PK7ApajAysT5YKJb+I8+h6u8c8PMj76tnw34v+LSDqqsNc/5+UeatLqUlJ9JmufsJSeA
 oV4D8RIYLwhj+H5uwVoA2cVgzs4rQLn1AEo56lhD2N5vFY4RAODRlYF1/IeKfKpMycCBROg
 +1M+uTIO2siZTIfcyoQmGkddu50/+POhh4ns0eShIXeg4J3nHuTFBK4ir0dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773761005; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pc3chlHOepIuVW0A0WIWwe7lqM0eIgh2jPKrdmTPR4g=;
 b=IABLNrbbdgGjx8hfgzJ/v5h7cAYQzLmOU85Wq0EsdwGt2gKJNct/IxbTmCwHedBC7F1Ju
 FMi09XLs7AWTa0ShsHgxPWs43ClCyhV4NKeIF4CrcdsdogIhplpn1E2CyDFj/L3lRKFBcxA
 cETHma5G0w9JnDR2ZTILtFGSBFHLBu9V/c0IbBXBIbA6Kc0GEJJR2lS2WUN/9A1LJk/e+61
 TMWFAryYKbMNf1LedbNBTKxCOlHeFyKHZTbNhzyxjd0BmuG6vmFMi2b/61luG9Ex/ChTPKw
 bPTKoPQYhhM436r44hFPBPOIQLg+LxfH3U5AtgaHJOENL0eM2FZ+5BzFlgwg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 73D4E43446
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 15:23:22 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C13D10E6C3;
	Tue, 17 Mar 2026 15:34:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0780D4340C;
	Tue, 17 Mar 2026 15:34:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E16ADC4CEF7;
	Tue, 17 Mar 2026 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773761650;
	bh=K88ELa4YxbOs7MjkjeqZu/qU8bBxF2QdgopZVhmZDuo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=lloHfF9uR2+D9irKZ+QqRQ3bjpmX1CItoqdE7Pr1fEySw6jkQA+8XV0knu2uMMdP6
	 b32te5vMsjUovTfWxXubXftgV6wAT26VtyACVcwzFo6iJgyG406C7UqEyh+0hGme+8
	 0dtyhidxBKuhOPZay1TUALmi+NwAQmLkOxi9N4cnrDhIBzxE6E5aSShiMniQ9WXBrR
	 aLhuQJjTPYVV8e2aLp/EDAYkrjRVCJr6/tAY4bqtJPwmAa3FlTXNS7aJ0B2fjDkfIw
	 TDLeW1bPsVvz4EBA8zPGh3Hy01VXWo8P0ux8oOWEGfHbxt8dbzwXiODpkON3iEeVcT
	 K1845x970s2+A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 16:34:07 +0100
Message-Id: <DH560ZMNK76A.1YFRKZ6FDU4I2@kernel.org>
Subject: Re: [PATCH v3 2/2] gpu: nova-drm: rename nova to nova-drm
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
 <20260317092304.424377-1-yphbchou0911@gmail.com>
 <DH536IWQDX23.22R0P6FT091LH@nvidia.com>
 <DH53WAJHTQFS.ZSO15BGJLQ8M@kernel.org>
 <DH55S9CU9YCB.2Y3G50LUGSAZF@nvidia.com>
In-Reply-To: <DH55S9CU9YCB.2Y3G50LUGSAZF@nvidia.com>
Message-ID-Hash: 3MQG52F32N625DCDWGDFSECZQ3KSZ5VY
X-Message-ID-Hash: 3MQG52F32N625DCDWGDFSECZQ3KSZ5VY
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Cheng-Yang Chou <yphbchou0911@gmail.com>, aliceryhl@google.com,
 chia7712@gmail.com, dri-devel@lists.freedesktop.org, gary@garyguo.net,
 jserv@ccns.ncku.edu.tw, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org, simona@ffwll.ch
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3MQG52F32N625DCDWGDFSECZQ3KSZ5VY/>
Archived-At: 
 <https://lore.freedesktop.org/DH560ZMNK76A.1YFRKZ6FDU4I2@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 4:22 PM CET, Alexandre Courbot wrote:
> On Tue Mar 17, 2026 at 10:53 PM JST, Danilo Krummrich wrote:
>> On Tue Mar 17, 2026 at 2:20 PM CET, Alexandre Courbot wrote:
>>> On Tue Mar 17, 2026 at 6:23 PM JST, Cheng-Yang Chou wrote:
>>>> Rename the nova-drm driver directory from drivers/gpu/drm/nova/ to
>>>> drivers/gpu/drm/nova-drm/ and the top-level source file from nova.rs
>>>> to nova_drm.rs (matching the object name nova_drm.o) to follow the
>>>> kebab-case naming convention already used by the auxiliary device name=
.
>>>>
>>>> Update MAINTAINERS, Kconfig, and Makefile references accordingly.
>>>> Update the Kconfig help text to reflect the new module name nova-drm.
>>>>
>>>> Link: https://github.com/Rust-for-Linux/linux/issues/1228
>>>> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
>>>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>>>> ---
>>>> Changes in v3:
>>>> - Rename subject line (John Hubbard)
>>>>
>>>>  MAINTAINERS                                            | 6 +++---
>>>>  drivers/gpu/drm/Kconfig                                | 2 +-
>>>>  drivers/gpu/drm/Makefile                               | 2 +-
>>>>  drivers/gpu/drm/{nova =3D> nova-drm}/Kconfig             | 2 +-
>>>>  drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
>>>>  drivers/gpu/drm/{nova =3D> nova-drm}/driver.rs           | 0
>>>>  drivers/gpu/drm/{nova =3D> nova-drm}/file.rs             | 0
>>>>  drivers/gpu/drm/{nova =3D> nova-drm}/gem.rs              | 0
>>>
>>> That `drm/nova-drm` reads a bit awkwardly to me and feels unnecessary.
>>> Even `tegra-drm` is in `drm/tegra`.
>>
>> Well, that's why I named it "nova" in the first place, but I don't want
>> KBUILD_MODNAME to diverge from the directory name and I also don't want =
the
>> driver name to diverge from KBUILD_MODNAME.
>
> What is the rationale for that? I like consistency too, but also think
> it is not particularly difficult to figure out that "nova-drm" resides
> in "drm/nova".

It is consistency. But why are we discussing this, what is the concern bein=
g
consistent here?
