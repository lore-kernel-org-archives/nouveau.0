Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 274B1FD8777
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 13:54:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E90F10E655;
	Tue, 17 Mar 2026 13:54:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZRMw4Ufx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6F3BD451EB;
	Tue, 17 Mar 2026 13:43:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773754994;
 b=yzSK7dCHwTis7h5DehAXvD0SupYPk3Pm9clkepHMS06mGF5NEqdrN1FHtO3hFVDRhoQJb
 WLDBQY1BkP9wDUTdbFBMhhRA4LVfAvefjtip3O4BcQ2JUkRIsdPi7KgB7imR0jY7ZmQUCJP
 8ED/ovBfbo06VqnyyWWkXCQnFDaT2d7RGgF8KgwvgNy2aHRNUHJrxjXbQ46e8bGL2DrzHwM
 AfW1zr5vdayOY2KkmZwl+ifWUOQrDEOoHPoGoXFTcyvS7RNsxFWWF7JieRz1dHrXmPtvlOx
 CjB3j3u1D7vz+xmVGBrFu88M74WCfSxnj/5+4CdljNggsiklpCVMV63Fktig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773754994; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ptNrXQCaJlNepLm4fbpOCryH1ndXZ2yUvAtozKQ9deg=;
 b=NxLwVYTeGVTluOuGnFxFUbHWYSjyL7oyUeqXzz0aiD7Kn/YjipEOAFeUpBNAeXsi+vrAp
 rsuUSmSbCbwhmkDHZ3+bwKpJGbAHvdtKJ2sHFLsNoAAf1D8AMYlDZ9xj3mN5ooEhuxD2chR
 QBf20s5zjZprB5YUDPa+yzx+BVfN9A9dZNsPdm4NjuEqRtyOEMkQFl/4yMoXlujS1BYTdo7
 sb0Zw7oJ2NoSlqrINlzuuPNNIAvQvFv4cg9wuay5IRFP4akBL4NMxVhuNYFlVn4bGRzLr00
 YG9VW6UyVlJE9DkdeInLcR80AZnVOe/Q5kVR5DCAQ8A2dQVUsa6zvBU4OVGA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 34213451E3
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 13:43:12 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B88610E650;
	Tue, 17 Mar 2026 13:54:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B966143E0B;
	Tue, 17 Mar 2026 13:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C3C6C4CEF7;
	Tue, 17 Mar 2026 13:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773755640;
	bh=oQnJBliy4UmovXuKIGveUoP+6zPRGCmE26dZ5bvfz2Y=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=ZRMw4Ufxj1mjyu8BeFWxKR67PKXAlqkTNAxh0t7lvwIJdAaKSXCZ9SiOBN7CJTDlB
	 NRGhJoKO/cVU/ULnHzFzQEOkZBuQxZKi8rduAwauMq/iHI4bBa6pLeB1tYWwGEbs5/
	 +FNyUKr8oK0xk5Fw4dV4psuN/vb2EBy81JCnJw3i8ldWLleG4oqELE9MQQB6dmFCNe
	 vz9k06m2t7W35d00bL3wgsmhBhniIxYA7pQWXsH5oZ9oghzgC15oK3WzUfPNQXQtbN
	 V1q0yHFYx2oF8Ils1MY13c09t7ze3H7C0bia5PAsnAtOIpK/uGtssG0T9v5lrNs8QT
	 kZCh6PA5XrsHg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 14:53:57 +0100
Message-Id: <DH53WAJHTQFS.ZSO15BGJLQ8M@kernel.org>
Subject: Re: [PATCH v3 2/2] gpu: nova-drm: rename nova to nova-drm
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <e7539fd5-9a0d-4a06-aa02-ec3dcd235926@nvidia.com>
 <20260317092304.424377-1-yphbchou0911@gmail.com>
 <DH536IWQDX23.22R0P6FT091LH@nvidia.com>
In-Reply-To: <DH536IWQDX23.22R0P6FT091LH@nvidia.com>
Message-ID-Hash: 373O2GZLZLBUC4G6WCJJINBJIA5VUAQT
X-Message-ID-Hash: 373O2GZLZLBUC4G6WCJJINBJIA5VUAQT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/373O2GZLZLBUC4G6WCJJINBJIA5VUAQT/>
Archived-At: 
 <https://lore.freedesktop.org/DH53WAJHTQFS.ZSO15BGJLQ8M@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 2:20 PM CET, Alexandre Courbot wrote:
> On Tue Mar 17, 2026 at 6:23 PM JST, Cheng-Yang Chou wrote:
>> Rename the nova-drm driver directory from drivers/gpu/drm/nova/ to
>> drivers/gpu/drm/nova-drm/ and the top-level source file from nova.rs
>> to nova_drm.rs (matching the object name nova_drm.o) to follow the
>> kebab-case naming convention already used by the auxiliary device name.
>>
>> Update MAINTAINERS, Kconfig, and Makefile references accordingly.
>> Update the Kconfig help text to reflect the new module name nova-drm.
>>
>> Link: https://github.com/Rust-for-Linux/linux/issues/1228
>> Signed-off-by: Cheng-Yang Chou <yphbchou0911@gmail.com>
>> Reviewed-by: John Hubbard <jhubbard@nvidia.com>
>> ---
>> Changes in v3:
>> - Rename subject line (John Hubbard)
>>
>>  MAINTAINERS                                            | 6 +++---
>>  drivers/gpu/drm/Kconfig                                | 2 +-
>>  drivers/gpu/drm/Makefile                               | 2 +-
>>  drivers/gpu/drm/{nova =3D> nova-drm}/Kconfig             | 2 +-
>>  drivers/gpu/drm/nova-drm/Makefile                      | 3 +++
>>  drivers/gpu/drm/{nova =3D> nova-drm}/driver.rs           | 0
>>  drivers/gpu/drm/{nova =3D> nova-drm}/file.rs             | 0
>>  drivers/gpu/drm/{nova =3D> nova-drm}/gem.rs              | 0
>
> That `drm/nova-drm` reads a bit awkwardly to me and feels unnecessary.
> Even `tegra-drm` is in `drm/tegra`.

Well, that's why I named it "nova" in the first place, but I don't want
KBUILD_MODNAME to diverge from the directory name and I also don't want the
driver name to diverge from KBUILD_MODNAME.

So, if we rename the driver name to nova-drm, then the other parts should b=
e
renamed as well.
