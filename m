Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 225F0CC6B16
	for <nouveau@archiver.kernel.org>; Tue, 13 Oct 2026 15:36:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97FAF10ED73;
	Tue, 13 Oct 2026 15:36:21 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9025248A7F;
	Tue, 13 Oct 2026 15:17:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791904666;
 b=pPittYzVtPG1nbFrYzK1SKjaG8ewIlbuljGytTLCUGiV1mBe8W2HxPMfHsABHufFArZIq
 AQe76tZazXlE/J9WJB7RDu0OyGZjKYCcsDIy2/1RkesXVKeXpGXzOBEWMlynrCmEFWD+0Ee
 IVkOD6Kr1squ2+b8UlfWYOM5/CrO4sQ0TF8hkc+wdKQJzAHOwgTElQ8o4TdUvGeIcumnjwh
 QirK7VMZP0nIhI30McNQ0VRaKzWcv4S1xa4nuh5oR+Dr8+8bz0ENmtBaIiZu6c8OaWZGXOY
 Dy97VxenWluIJJ7+87xyUFncB9nASZKALQ+g94WIHORIECSkIQAmwPrcEiWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791904666; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x/r2qWknVX2TAzPiv1tCSqpXAUTpPajkXsHA7HYPXA8=;
 b=bwUp10NNKkNeO/vw554xRyuxRM7TB+3QvLkvmaL2EB/Myk5RD9uE/P9HuakoVIV4YtVSj
 SG2ciatBAvHO5V0Un5h3whRXr8bxuRcCRhVtUe4rNfP950u2WpsTPGqGy3qpwZR/m1ceRB6
 UHr/S2TZpqw4cO65FEhDDowsBxFfEgdJXMlHZhUn2SuSteHv27cQI3C4a8cqWWtic36K23/
 Q7qdcieyOYplUByFMvsisXGywh8/OHXdfnB7GcoFcBosmzzh9+YU+ZKrZqLsXqwn0tM7PzY
 +VO+Gl4vuD+wcv8g6pT6efKNSuvjBM1KAagLGoDbNZ47kxbuK9WgSzLME8iA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 44BCB48A6E
	for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2026 15:17:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0678B10EC8D;
	Tue, 13 Oct 2026 15:36:13 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C43B1433AB;
	Tue, 13 Oct 2026 15:36:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2236B1F000FF;
	Tue, 13 Oct 2026 15:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905772;
	bh=x/r2qWknVX2TAzPiv1tCSqpXAUTpPajkXsHA7HYPXA8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iXwzVNFE9iJoQ7G94gK/qyzvD4nPXrjp2gI+RhH2u/JDsBAW9S9Jd0j3wTJ+6g2P/
	 +KBIeE4v+qFrhldJ8WRBXvguP7p+BD4jv2hvV4bWP3/Z3UyaJjLyvxaOWpuTIGD+Cz
	 hwxwWwAe+h7/MoemGZPI+h3eBCxAEnRWazrw3OigTP9x3lfrjKQAysinZ3KFFqL7Qv
	 c3qUThFA/xM/YbfSWkUYgBiqYCIXmCJuinDLRUHbVxCZ4aH38KN+g8aGVxkoioKyTY
	 FChL2VTbCjZK9eueD7feTUzantIJSs8Ua/MvZG4+J1Tiw4FuNe6UTVmd3WHedV8YLp
	 sznf4tMiD4FjA==
Date: Tue, 13 Oct 2026 17:36:09 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
Message-ID: <as5N73fHztX8hVWh@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="34qab4dj6g2yo5tq"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>
Message-ID-Hash: JKVDC7XS2QXKUWHRHPNXZZGO56OF3LYC
X-Message-ID-Hash: JKVDC7XS2QXKUWHRHPNXZZGO56OF3LYC
X-MailFrom: thierry.reding@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Aaron Kling <webgeek1234@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JKVDC7XS2QXKUWHRHPNXZZGO56OF3LYC/>
Archived-At: <https://lore.freedesktop.org/as5N73fHztX8hVWh@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--34qab4dj6g2yo5tq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 10:52:08AM -0400, Sasha Levin wrote:
> GM20B needs both its reference clock and the fuse clock while it is
> powered, so allow "fuse" as a fourth clock after "ref".
>=20
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml b/Do=
cumentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> index 4d856a8b674c..ecbc20e6adec 100644
> --- a/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> +++ b/Documentation/devicetree/bindings/gpu/nvidia,gk20a.yaml
> @@ -44,6 +44,7 @@ properties:
>        - description: GPU clock
>        - description: Power clock
>        - description: Reference or fuse clock
> +      - description: Fuse clock
> =20
>    clock-names:
>      minItems: 2
> @@ -51,6 +52,7 @@ properties:
>        - const: gpu
>        - const: pwr
>        - enum: [ ref, fuse ]
> +      - const: fuse

Technically this now allows:

    clock-names =3D "gpu", "pwr", "fuse", "fuse";

I think we may need a very explicit version to cover this now, something
like:

    clock-names:
      oneOf:
        # for GK20A, GP10B, and GV11B
        - minItems: 2
          items:
            - const: gpu
            - const: pwr
            - const: fuse

        # for GM20B
        - minItems: 3
          items:
            - const: gpu
            - const: pwr
            - const: ref
            - const: fuse

We may also want to leave out the minItems property because it turns out
the FUSE clock is indeed required, so we'll need to add it to all device
trees anyway to fix this hang.

The exact list of items could also go into the per-SoC/GPU conditional
sections to be very exact.

Thierry

--34qab4dj6g2yo5tq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOT+YACgkQ3SOs138+
s6HSbA/9GTMrx+cAkk1jspRnNnC4NMPsgoLBelda/o0nNLddHezxqjelJQZe2ITB
BcLwHzvG+yZIoqvcobrIM3ub+u150reF93lLkcJhUyIDUzvEEztSfHPVg39ffBVl
5THw3xMl5EXKrpYH2KGpGiYILz9hGsLLE1tVJnzJXUNJNewbMClq9QaCtPw20fqS
tRCrdaRRCgnfckfg4Q8F0Mwy8CHheHdayMY3qX/u67b85pbYfyx54ZNF/Ro/Z0/j
DP4xiuFsdppuYbb9tSJGc9bEPVn6ReFS1VTREGI0S7NRxIRKivktTaLWFSkH7mAc
wREmsx5iMeUxrxmQ443TQLUdY28h13A+pA2Wb+Nc6m+7LKbuw3nEAShix9ifPGv4
KAI3ukE8RV5JRy8whJLTNk1Pph9oBMf1CkyOVCAlZq1Q8uH++2ZBwbBjgEfacKgE
qPgJyiYTHQ+RsuFvXBsKMiFat2hv3YaVvTWsG7NdO2BAzrh5Oi2zMeGG61R5Jcri
X68hLj4z3ooAyGAO0Af9Dn9pFc21nc8e7Nv4wtPWF7FRv9D2aYr1sL9jEBMbMjp2
XE2PM4N9S+w4QQZiqZOMIuqp4bp9IwJNT3f2RPZ93FmED1ZeAc5L2aKCB4u+X51h
JK2KABvBUdzZeLdvPV+A1tfe2nNtMTUQufpUKEsAZIOKgN2EZSk=
=EVv3
-----END PGP SIGNATURE-----

--34qab4dj6g2yo5tq--
