Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09ADFFED9E7
	for <nouveau@archiver.kernel.org>; Tue, 17 Mar 2026 16:06:12 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D397E10E6EF;
	Tue, 17 Mar 2026 16:06:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M1lXcAGl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 88018451F5;
	Tue, 17 Mar 2026 15:55:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773762922;
 b=PW6fe2Qe6Xe28ZtPPxERiMvhxg1cnpBpWHVzj+KdFiH2Zh/3zbFr8xcpGtWcesLeCJtjZ
 h8zeOt0lqHljvlMUlr1lX8sSoqZ73SxOl1wJEAA6M89vm8h9zQgf1y1w6uPxloWmriw0MI0
 RNJpjHqczJonEozOJDaJRuuPO83zbakGc4vv6J/xjXoduqv2A4xyQDCeeOaHe68AVVkVTol
 dZsiDS8elA3vzWWsrLItGcPAnzCTcvUIrJJtE1qIq6ZwVCZ3Lu7eO7zN1qLjsxQCXjj9q9i
 otdxTs72Kbv9dBKtEHvitOT+zfVIUaDcsmqfw5WlX//wHXT5qEoEan9oQRNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773762922; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZcnKYRsUCh3UQuOcj67wbIyQAOKg/hYB5u8C8nBw5Ck=;
 b=lUpCM8DceQqyBebBgmSwO15T6Cb5BzXXZYWQugZIdz7+WtV9twLclulz139MMXezeZG2L
 CRfGxMHKaqRJecqjCsfiX+ChWgk+2L9c9+CDj3ajnb3BL6WcXyDWAdQ6mEcXseOgVtEWw8S
 TfcN1FtSSZhPK2EFpQzJ7lULwCg0RHlM5XIJA80td4WxxE7uZ/kw6cgVp2ifj/gNPa6nThH
 LHnlYd9VfXPXzGFlTQJ8GQeUuTT4luAhRx1BBFvtHWxulkc9hEwVjeBaY1o7AO1Sr4Ci80l
 zYOXSktLsZ8S3goLRVc1DrkFZR89hMgrHzgx6VnwEaeN32Xv1gL5dDVlgjIQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3029E43446
	for <nouveau@lists.freedesktop.org>; Tue, 17 Mar 2026 15:55:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 422B410E587;
	Tue, 17 Mar 2026 16:06:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E62C6416A8;
	Tue, 17 Mar 2026 16:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A8A4C19424;
	Tue, 17 Mar 2026 16:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773763567;
	bh=qC9PeLqfe8qNJHkcVgrneGSMbdKEuQfm8pJUYS6bj08=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=M1lXcAGlcjnnczZdsajXeyav1UDJ4fcFCl/A+Y5OWKYv/lLDNUebzp80Sf1omlvF5
	 dltmhe3zXdNQDUKijwRqO/krkQeG5Uc39Du8Q8s2DDeZVLisLB3qPYgFmE8cgQKDTK
	 b9iImCquwo9M2lTIHtrZPsH9gACuuSR+LB/N2VYytedQNGXrwLzfwT8tSlWHmJE3SW
	 5TQNjt72mBoAUI3M69PwKTlv1Ufl92zXI+PHnQiV/ekbTxmx3JmHlk3gSqvsG7L8lx
	 D1RvPTd04QQnFuu+FufeVB26khTnj2UwM3Cy8cUwplGOl7g+g5B5qWCvJ+TdMePa9N
	 852ZfIDDPxFwA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Mar 2026 17:06:04 +0100
Message-Id: <DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova: rename drivers to use kebab-case
 convention
To: "Cheng-Yang Chou" <yphbchou0911@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
 <20260316120820.2117081-2-yphbchou0911@gmail.com>
In-Reply-To: <20260316120820.2117081-2-yphbchou0911@gmail.com>
Message-ID-Hash: QE5RDI52HOFM3GCAVKHG3Q3P53S2DIE3
X-Message-ID-Hash: QE5RDI52HOFM3GCAVKHG3Q3P53S2DIE3
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QE5RDI52HOFM3GCAVKHG3Q3P53S2DIE3/>
Archived-At: 
 <https://lore.freedesktop.org/DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 16, 2026 at 1:08 PM CET, Cheng-Yang Chou wrote:
> diff --git a/drivers/gpu/drm/nova/driver.rs b/drivers/gpu/drm/nova/driver=
.rs
> index b1af0a099551..e3de04f358f0 100644
> --- a/drivers/gpu/drm/nova/driver.rs
> +++ b/drivers/gpu/drm/nova/driver.rs
> @@ -32,11 +32,11 @@ pub(crate) struct NovaData {
>      major: 0,
>      minor: 0,
>      patchlevel: 0,
> -    name: c"nova",
> -    desc: c"Nvidia Graphics",
> +    name: c"nova-drm",
> +    desc: c"NVIDIA Graphics and Compute",
>  };

Can you please move this into the second patch. Additionally, in the second
patch, please only keep the Kconfig change and use the following in the
Makefile.

	obj-$(CONFIG_DRM_NOVA) +=3D nova-drm.o
	nova-drm-y :=3D nova.o

I.e. keep the directory and filenames as they are.

We can use the same trick for nova-core, so we get nova-core.ko and nova-dr=
m.ko.

Thanks,
Danilo

> =20
> -const NOVA_CORE_MODULE_NAME: &CStr =3D c"NovaCore";
> +const NOVA_CORE_MODULE_NAME: &CStr =3D c"nova-core";
>  const AUXILIARY_NAME: &CStr =3D c"nova-drm";
> =20
>  kernel::auxiliary_device_table!(
> diff --git a/drivers/gpu/drm/nova/nova.rs b/drivers/gpu/drm/nova/nova.rs
> index 8893e58ee0db..1fd454c7e0df 100644
> --- a/drivers/gpu/drm/nova/nova.rs
> +++ b/drivers/gpu/drm/nova/nova.rs
> @@ -10,7 +10,7 @@
> =20
>  kernel::module_auxiliary_driver! {
>      type: NovaDriver,
> -    name: "Nova",
> +    name: "nova-drm",
>      authors: ["Danilo Krummrich"],
>      description: "Nova GPU driver",
>      license: "GPL v2",
> diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/n=
ova_core.rs
> index c1121e7c64c5..90e98380687b 100644
> --- a/drivers/gpu/nova-core/nova_core.rs
> +++ b/drivers/gpu/nova-core/nova_core.rs
> @@ -22,7 +22,7 @@
> =20
>  kernel::module_pci_driver! {
>      type: driver::NovaCore,
> -    name: "NovaCore",
> +    name: "nova-core",
>      authors: ["Danilo Krummrich"],
>      description: "Nova Core GPU driver",
>      license: "GPL v2",
> --=20
> 2.48.1

