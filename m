Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A424BCD4F3D
	for <nouveau@archiver.kernel.org>; Wed, 20 May 2026 21:07:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1637710E41F;
	Wed, 20 May 2026 21:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VXhG8Bwg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3A9E9460F0;
	Wed, 20 May 2026 20:54:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779310441;
 b=qcFCUSicIzr1moBevHW9bEf+JnNez+sL1aw3rGBBpRyNmNrnqJbr1Hs1y66RZFn6JWERF
 RJd37Z967e6TS3YnCH7J+gIW51XTVgUnze0t+hqQMhDX6cq8taKeiSi3lt3J6G0w/Wj/8xa
 +758B4WrNEjuhzfKJDj6SRUQ6En/VaCvefNDNpKYmY5XBjgNVrkhRsrHgzf5xOqaXubkOL3
 Z7GonldHQOUp2D/2VdNi8UUWP3iAEoirA07hmNuciSCIE+LxLlyR+UNXsnhTBegW+4zK9tz
 bx0SUmXhnzKYJO+PlUy6yzk4ljCwOygMVgAZ7Jk5Kx04GZltGnwkrXtF0JcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779310441; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=bcECVCpFU7BpkJZFGft2geN8gNvITVW39UlZOnQOlvs=;
 b=XulcJE1HQw0nIRgX0PmNMtSJrjUN37L7W06K8L6eHzYYU/9/Z45jcw6g/7XyVeRNZXDBq
 MyVCm66334LYkkwLb+jCe04wjrRrW+p78p2t70V88TENwOEC3y9ieZCoJkwhas2LvcHI2ON
 +3446mm0+sY33KZ9XQhHwCOQ8H2bSei/MkFgaQlipZ272iV7pDdleSlren2OJUImslrr4xg
 J0SK3D1uPLAPZaNbhP3PJc2QOPf8QLZMBsmVEB4SPN6iH5Y94zJGb76gmiP2ncvTcuWpEBE
 5QlcvtjwrfnFW8T2/c0iXK9J0n8zrhizx2zwo6gyjUhfyy4sUha2IzSqwOMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3693F4603E
	for <nouveau@lists.freedesktop.org>; Wed, 20 May 2026 20:53:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9F29F10E0C6
	for <nouveau@lists.freedesktop.org>; Wed, 20 May 2026 21:07:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C061B600FC;
	Wed, 20 May 2026 21:07:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 222151F000E9;
	Wed, 20 May 2026 21:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779311228;
	bh=bcECVCpFU7BpkJZFGft2geN8gNvITVW39UlZOnQOlvs=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=VXhG8BwgEnTg71rpVuaIJimLWa5KiClc1AtqISPKLGGXftv02Lo4DBLMEH4BmntA/
	 WkXiuFOHBQagdFiDNaNkMfhAtz6SjrnDbCBKft34WiVGEUdnwbAN6njMLkh13HIHZ9
	 2ndBb/BiWtUcmbFVlZ1uH3bE6zq1SWTtXmafehI9Ex5A9/6ePWsKj+UH0qtsI0F4XM
	 PSYi9ukdRAzPimgPL9UXJtN/8XT50rD+mOfLM4kmfd8bIBxIddH0K+fN1OhY+IZWKX
	 AAnkuOLa0BH92+bks8ZpHz9XJVJ6Fz5HHTMfBfYSc0Vpsg7SfrBDqzCnvUMQoXH05W
	 5CW0V25NSL5Jw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 20 May 2026 23:07:05 +0200
Message-Id: <DINT6SMFR28W.3P32OZYOA5GRU@kernel.org>
Subject: Re: (subset) [PATCH v2 00/10] drm/nouveau: fix GA100 issues
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260430223838.2530778-1-ttabi@nvidia.com>
 <20260430231025.5063-1-dakr@kernel.org>
 <0079fcd18a9840c45f751d86dfb870cd1f36655e.camel@nvidia.com>
In-Reply-To: <0079fcd18a9840c45f751d86dfb870cd1f36655e.camel@nvidia.com>
Message-ID-Hash: UEH7N3XBI5JECNBGHJXBRC4K5NYAAT4C
X-Message-ID-Hash: UEH7N3XBI5JECNBGHJXBRC4K5NYAAT4C
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UEH7N3XBI5JECNBGHJXBRC4K5NYAAT4C/>
Archived-At: 
 <https://lore.freedesktop.org/DINT6SMFR28W.3P32OZYOA5GRU@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Maarten, Maxime, Thomas,

On Tue May 19, 2026 at 3:36 PM CEST, Timur Tabi wrote:
> On Fri, 2026-05-01 at 01:10 +0200, Danilo Krummrich wrote:
>> On Thu, 30 Apr 2026 17:38:28 -0500, Timur Tabi wrote:
>> > [PATCH v2 00/10] drm/nouveau: fix GA100 issues
>>=20
>> Applied, thanks!
>>=20
>> =C2=A0 Branch: drm-misc-fixes
>> =C2=A0 Tree:=C2=A0=C2=A0 https://gitlab.freedesktop.org/drm/misc/kernel.=
git
>>=20
>> [1/10] Revert "drm/nouveau/gsp: add support for GA100"
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 commit: c9e3878ae2f5
>>=20
>> The patch will appear in the next linux-next integration (typically with=
in 24
>> hours on weekdays).
>>=20
>> The patch is queued up for Linus's tree and should land in the next -rc =
release.
>
> Danilo,
>
> What's the plan for the rest of the patch set?

Can we please get drm-fixes-2026-05-08-1 (commit c9e3878ae2f5 ("Revert
"drm/nouveau/gsp: add support for GA100"") backmerged into drm-misc-next?

Thanks,
Danilo
