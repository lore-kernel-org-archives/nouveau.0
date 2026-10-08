Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29A01CA6017
	for <nouveau@archiver.kernel.org>; Thu,  8 Oct 2026 22:04:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 518CB10EA43;
	Thu,  8 Oct 2026 22:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="I4KUbjwR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B3568489D1;
	Thu,  8 Oct 2026 21:45:43 +0000 (UTC)
ARC-Seal: i=2; cv=fail; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791495943;
 b=jdO6xiVz0iK2Y/Ah7wTTSlQDuyehIOcUyq26ogee3gDoBC1AUfq8pdtdw7/3C7C34wxuQ
 V2ZstUkcqm90tu83Zc7iFACKq9l1U/9EFnoJLb8UK61ZnWIdj33bcybYNWDMVAmxZshJhMt
 7sME5GR4eMtf217tXWDDfoy0WT2CWHRsGusJR0y+bRnsieHVRVuk3BTtBoeII3/3gJOgjC2
 eZIEtTvAlhjRchdWJMsQ49Dtna7ga0NdJ7Zjp3YuFgU72CVEASyer60inqlhO06tLY23J1v
 4uRLnrIj2KzJ9Bf7reprHS6IH02eWSdq7AQsq7Jeyb4XGR0JNft42J7aFVGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791495943; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=1IdyAD+6eJaw51gazvh2AzyurM3uxUxl45xkK9GGQSw=;
 b=WtGx8GOaMlx0bTFsszFuy7oAbpOVzEKVRmo1x/LhjmIpu8MIrEhRjyYnKP1QprzwlDAx8
 wrpbOIXx7I/6SJcPhO0u/D2tCHnIYzV3FsljCI5Pv+XHLiaBAI93Pow67Q8l09oB+ov8aEf
 CsI+VkFpOnDr/CTCWDqCH9dhAK/jPmIrqVzLcEgfPjKmawMw6zD96lLAbAErEgGdbQlMlM3
 /Gf5FGdt+xLD+e7fSNTYtj0nHne704qbz0iSzG9EBwk2eDgSFXvEk6QcJpBW66ssQFawZC/
 42vQ9Q3B8JTqu0VekXjvllaAQJDL9KelyHztlsKX3ZsCtqCU8o2a6LGSfzIA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
  arc=fail (Most recent ARC-Message-Signature did not validate);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com header.i=daniel.almeida@collabora.com;
 arc=fail (Most recent ARC-Message-Signature did not validate);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B5C2340634
	for <nouveau@lists.freedesktop.org>; Thu,  8 Oct 2026 21:45:40 +0000 (UTC)
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com
 [165.173.182.11])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0047610E15E;
	Thu,  8 Oct 2026 22:04:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1791497039; cv=none;
	d=zohomail.com; s=zohoarc;
	b=G4AieDmk+ieHFzhAsuVWjTKnnCT5+jbUNvQUTThWMPS9kpqZG7ZLwDR01tU3ojd8kyZHWasM6E7X33pa9FXHxwGkXXOPs+FVeHEbDqJ8gCaGVmpiT4qPLyjB9s2JsXvhP2AKGmqAfOepOjyvV+RCVQ9GbesTt7MsxMVhnD6Z9AM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc;
	t=1791497039;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To;
	bh=1IdyAD+6eJaw51gazvh2AzyurM3uxUxl45xkK9GGQSw=;
	b=clfolC4Uel3D9ldJWAL9+ExsrOwE3yiUOdqns4op1lzxiIIvqLtCknYN8kl9g7uPk/OKyFkm0NNEb4fuaru1edhI2tZXCJZSVifREb+XwD8G/CXSA43jWg1mhx3nwTKZ3yhKtJOsj5yGQhT1xm6GDUSwoiiDIXROb3EgXOxIHos=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791497039;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Content-Transfer-Encoding:From:From:Mime-Version:Subject:Subject:Date:Date:Message-Id:Message-Id:Cc:Cc:In-Reply-To:To:To:Reply-To;
	bh=1IdyAD+6eJaw51gazvh2AzyurM3uxUxl45xkK9GGQSw=;
	b=I4KUbjwRo8Vp8xxxlBsfFSperY5OObd/p8Nc3nkzZ6u2baVDDynNGUNDo4wV2nmb
	2mfKtGHCLA7V547LxC9Tda0GHEX6zt/RFEHG++Hc8gP6SErPoubIg9z/g9kqYBxy1QE
	PbjIZdvArw1fS7DwbYLat2OCNAdvwB6m851sybLk=
Received: by smtp.zohomail.com with SMTPS id 1791497039246856.5585967911123;
	Thu, 8 Oct 2026 15:03:59 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Daniel Almeida <daniel.almeida@collabora.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH] drm/nouveau: Skip the Turing CE workaround object for
 non-GR channels
Date: Thu, 8 Oct 2026 19:03:43 -0300
Message-Id: <FDA5DD6C-28C2-4A88-AF4B-366856512515@collabora.com>
References: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
In-Reply-To: <20261007-turing-async-ce-fix-v1-1-12ee6ccd1a3c@mary.zone>
To: Mary Guillemard <mary@mary.zone>
X-Mailer: iPhone Mail (24A437)
X-ZohoMailClient: External
Message-ID-Hash: LSYJPE4FKAL7EDKM6S3OXO7PU7NHICOA
X-Message-ID-Hash: LSYJPE4FKAL7EDKM6S3OXO7PU7NHICOA
X-MailFrom: daniel.almeida@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LSYJPE4FKAL7EDKM6S3OXO7PU7NHICOA/>
Archived-At: 
 <https://lore.freedesktop.org/FDA5DD6C-28C2-4A88-AF4B-366856512515@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>




> On 7 Oct 2026, at 11:36, Mary Guillemard <mary@mary.zone> wrote:
>=20
> =EF=BB=BFThis workaround is here for the old Gallium driver and predate as=
ync CE
> and NVDEC.  Instead of only skipping it for NVDEC, let's only apply it
> in case of GR channels.
>=20
> This should make async CE work properly on Turing by stopping the assign
> of a GRCE. (here CE0)
>=20
> Signed-off-by: Mary Guillemard <mary@mary.zone>
> ---
> drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nou=
veau/nouveau_abi16.c
> index e907c1d07887..e876f154963d 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -488,7 +488,7 @@ nouveau_abi16_ioctl_channel_alloc(ABI16_IOCTL_ARGS)
>            goto done;
>        break;
>    case NV_DEVICE_INFO_V0_TURING:
> -        if (engine !=3D NV_DEVICE_HOST_RUNLIST_ENGINES_NVDEC) {
> +        if (engine =3D=3D NV_DEVICE_HOST_RUNLIST_ENGINES_GR) {
>            ret =3D nvif_object_ctor(&chan->chan->user, "abi16CeWar",
>                           0, TURING_DMA_COPY_A, NULL, 0,
>                           &chan->ce);
>=20
> ---
> base-commit: 70456f05d4b6396b22048c4b8cd3cb98ecf9f9e3
> change-id: 20261007-turing-async-ce-fix-42e179e27d4a
>=20
> Best regards,
> --
> Mary Guillemard <mary@mary.zone>
>=20

Sorry, it didn=E2=80=99t occur to me to do this instead of the NVDEC only fi=
x.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=

