Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A34ECC6B12
	for <nouveau@archiver.kernel.org>; Tue, 13 Oct 2026 15:47:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 144A710ED35;
	Tue, 13 Oct 2026 15:47:08 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0C34F48A8D;
	Tue, 13 Oct 2026 15:28:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791905312;
 b=1ACPgyXa0mKdbMlpBjKPxFrFHE8XC3EbygftyA7xVtuxptv6tDtOoYJULuOdJmSNEswg8
 aoRfaeOEwga3HqdCdqYxr9oTKYCNxsCf2nj2K/kMnEal7xebV+4Rc1tL9iAwLnCsgSnSEcm
 3FLKL0/jY05GssOIrJULYv4JzmCwXwy0ytueaqVrLJwmC39XuYu2kR30wR/WJCfb44Fm+rD
 z9NGfCpWS+QP/OjGgySB60nLzspITIx2NAVcqu3vbWdd/62IxJLp/hanbY5DLIwD+/WgOH7
 kaUtpRp4+yap5xixarum1zJONSDErNMYRIu9b2OP+ZNKS42VZz6yyX0wtf/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791905312; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zrrwM+OoTQ5n+oUmClj8UHVrIw8n458ireLa+GKP5qM=;
 b=a/00GYZDXBlmKhUIc0LsUoBylV09JnscAGWWVEGyGIfOwMuEIFy6DpJ+X24VfUc05d2Ci
 zWEltur0Cg11Zx2sR9vfXVQyq8xzHX34EQxEqK013jE5xo1gHEmVqDqHtcsdCbgODzoQM+1
 v8Jfv4Xqb17JCUTck4aCJ6qj+IwAhlrOpPBZ4q6Nd2LjwXqyK12tMi2saAB8FJf5twAN+X0
 wwZ65voCm/OLz07BqB6J7QDts0f1vcAagM69KteJWyhVs0QWHLWkXZ7kJar5/YHVWecXgHm
 T4vQBWHlRmuJa0wrqAMBqPP5tw4dZvFgJJd/EeVnH+3mZAY+k+QetbThv14A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AD68E48A67
	for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2026 15:28:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D77C10E4C7;
	Tue, 13 Oct 2026 15:46:59 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4EA2440F7D;
	Tue, 13 Oct 2026 15:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EB201F000FF;
	Tue, 13 Oct 2026 15:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791906419;
	bh=zrrwM+OoTQ5n+oUmClj8UHVrIw8n458ireLa+GKP5qM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BdqC9gMjE6f5EWWl1Xlpzgq2aOqELdaPtElELJu1ZCWu54KCsQoAD9g8r5t2rDi4o
	 djw2jbEX0/MkPGgXpPDTCGuKmo24p0IuekQLxf6x1cuLJdDC3cunM45pw8Az2kWEfM
	 ePK9sXqi3/K6TN1zi7I0dicxeuCMvq1uXcQUYNiL1HyCx5QjqM9G9Dnajn4MMimxwt
	 JyEWcIJ1rbyqOG0SOgwVo+XP4LXaRm4mDWWNR/Agx7cClMcB7mcsuVYj4ZlED/P7Yd
	 murSJvxLGW7OiJnPcKNfmu+pcczAFox3+JODJeTxENdI/IH+xarXL8w2KS7H0NrGug
	 w0poGpFVwgbfg==
Date: Tue, 13 Oct 2026 17:46:56 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>, Aaron Kling <webgeek1234@gmail.com>,
	Diogo Ivo <diogo.ivo@bootlin.com>
Subject: Re: [PATCH 1/3] dt-bindings: gpu: nvidia,gk20a: Allow a fuse clock
 after the reference clock
Message-ID: <as5R_xrDv4eVPdtz@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nnyddv2boxnoq3dq"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-1-sashal@kernel.org>
Message-ID-Hash: BLL77UOA3UYWJXTTLAGXLSI64THTK4NY
X-Message-ID-Hash: BLL77UOA3UYWJXTTLAGXLSI64THTK4NY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BLL77UOA3UYWJXTTLAGXLSI64THTK4NY/>
Archived-At: <https://lore.freedesktop.org/as5R_xrDv4eVPdtz@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--nnyddv2boxnoq3dq
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

Aaron, Diogo,

I'm fairly sure I remember at least one of you mentioning that GM20B
wasn't always working reliably. Would you mind giving this series a spin
on your devices to see if it fixes any issues you were seeing, too?

Thierry

--nnyddv2boxnoq3dq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUnAACgkQ3SOs138+
s6E07xAAhV16aE/vTmdXCWNQFDANmFHYGGkbT8iB51pQecVSkYApSpthdGshj822
8aL9r+P3JKo6enP2M0iITNX71JEw6W/s7btdKO9ur0lAmT7OQkZbr0cBbHFDkeek
Rx5fZYDM8M/Xf5t3/Yka+rQTJpmPSWwqljLYcqcQBChdPkG35VuWS/Df5PwTK5tu
9j+SWtpNRg1CPCNIvNiZzltE8Vdkp662vSrucQyzTp9UWws5DIgPI3qhPGTQlbjt
rZVi7cWLawCw2Tnl4WeXOlEPDS0s0sh+w9dmQhpgjeJWBGJYhTms06X7qX7lJ0fd
2ncmditmQrBk0JCu94YQFx7tjSxjUSXTXSPPw+HzZXDtPuHaRAp5+75jqeqg2wIg
zG6Tv3+QIpEONMXKZtdu72/o8cPJuXFnXNTWqMY2GITRFmBR+3zt+DnVgXXwvj7V
JHr0iYWp40CRIZTgq9lcNlQdMnqzjm1g8oV7g1RAXdhZHp3FU6RBpAoe0kUOmyFw
RAqb6V/lXF89WgzrZ0qlSG9s/8NkjmJaMj04wiU7YA3xLNCeBPw4rzR8hMNzteV0
VyK7BQeV8T39SBG+D1Muwyq4quFQO0QLHen6YmPSf3SMdEikNwl5JT2ZGziUGtKq
X/IOENvD1mK9kvYwQFnZ6YCdez2KwN45NDtWe+Tm6MFviXE0WNU=
=ovYf
-----END PGP SIGNATURE-----

--nnyddv2boxnoq3dq--
