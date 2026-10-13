Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC9FCC6B19
	for <nouveau@archiver.kernel.org>; Tue, 13 Oct 2026 15:37:58 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1236E10F483;
	Tue, 13 Oct 2026 15:37:53 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 18A5F48A83;
	Tue, 13 Oct 2026 15:19:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791904757;
 b=buaWDT9ZdUs7t9Un23IdzV9i7HHV1/FQ60fdCQQIqYi+B2hiMNoRAnT3RLNSqGykWAYfJ
 ipbNKrQO88RuzVcq5FJkVgNbwJGtSDrQsaR0TNYTKq9sTALl+zUW5Rm4L1grLMmR3GqfU2l
 srwygnYRmUudnNWidbdF4wDt2GZefarG2JBdLwikF6SKEgE+7MCss6Ms//lZWtr805qFKK1
 JKIV0TppD81WYcNxMuYTqZxuaiyDwsJjmV0x+TLS+94Mff/DB+H00iIq5zr3Ktq2+Ny8L5y
 DecLj2Q4fiWA8vhKMCJvPeFdM5Xv2JPK2me12daBrWlcTb2691Kt3FgtkR3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791904757; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=g0v0j3GPIoV5WBVJgFz4OFgpQ37qSKo1OS4tG1mcDzU=;
 b=F9oFbWIZPVRcnYbhw2dOQDnQZMdmbA37xAO0MTfHRmzh7F1HWEkXr2vyYtNDYkSmo7Kb4
 VaZQMgwdjx3UXVbt3oBJYfXTa5Qgh7GjXnzVGj5diFkD/vUjJtVjuW77zj05HbkyOQlobga
 vKpgR30E+9sOYSuSqWpGwvFC5Wwgh5vnGBFWmaQbBkUEw9GAcfHgkdOqkKokBvadeg2MWfO
 0PfnVzO6MiPBscb8aikPHu2M01AfarzyqyrnNRT7TVn6YSoZzCD7ajDvIUeK6KK/LVgq5R5
 CWKbsz3S7lcr5/5eES/4KbfS1QF7GmqiHr71RHPQo7WZ6DCb7aEeYcBWOo2A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6446D48A72
	for <nouveau@lists.freedesktop.org>; Tue, 13 Oct 2026 15:19:14 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F0A010EC03;
	Tue, 13 Oct 2026 15:37:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 77BD6602C3;
	Tue, 13 Oct 2026 15:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DFA71F000FF;
	Tue, 13 Oct 2026 15:37:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791905863;
	bh=g0v0j3GPIoV5WBVJgFz4OFgpQ37qSKo1OS4tG1mcDzU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ibMAGARpuyRzxeZsfJ1ZxatPqrJ3ScinioYonSVO9G5Y+ttiP1lSQUS8Coty6Tyd5
	 eJp5DjdFsuoH1CXveQT4IrIh0t7I5bl/cPngZlGH/t54AIs+g2l1WwHG4ogDOACwL9
	 qFRoS6CizbEWrMgHp6cTJxLN2dEjLFdT9WlSKO6ma8ihv7gQX4t2TfvG88A5PXX5u7
	 UqozSzgAu1Svpn0Eo3v2QDv3uia6CvR2umW5sl7jnJIm3ufv4F1U+2IBc5NcIjkBXR
	 weGjUF++il9ye/LPhsfISms3ysDQkvRqh7c48xaTMjImIZ9z/PXo/WL2dVOkPrQjar
	 7EUE45XGUsP/Q==
Date: Tue, 13 Oct 2026 17:37:40 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Sasha Levin <sashal@kernel.org>
Subject: Re: [PATCH 2/3] arm64: tegra: Add the fuse clock to the Tegra210 GPU
Message-ID: <as5QBASu4BxhZfdK@orome>
References: <20261013145210.103565-1-sashal@kernel.org>
 <20261013145210.103565-2-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rpi2rmgxu3mrx2a6"
Content-Disposition: inline
In-Reply-To: <20261013145210.103565-2-sashal@kernel.org>
Message-ID-Hash: 5IJ3NQSYGFM6CCA73ZUI545GMCBIK26Q
X-Message-ID-Hash: 5IJ3NQSYGFM6CCA73ZUI545GMCBIK26Q
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5IJ3NQSYGFM6CCA73ZUI545GMCBIK26Q/>
Archived-At: <https://lore.freedesktop.org/as5QBASu4BxhZfdK@orome/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>


--rpi2rmgxu3mrx2a6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/3] arm64: tegra: Add the fuse clock to the Tegra210 GPU
MIME-Version: 1.0

On Tue, Oct 13, 2026 at 10:52:09AM -0400, Sasha Levin wrote:
> The GM20B GPU on Tegra210 needs the fuse clock running while it is
> powered. Describe it so that the GPU driver can keep it enabled.
>=20
> Assisted-by: LLM
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

We already have that FUSE clock in Tegra194, but since this is now
needed on older models as well, I think we need to add this as far back
as Tegra124, since it likely has the exact same requirements.

Thierry

--rpi2rmgxu3mrx2a6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmrOUEQACgkQ3SOs138+
s6FLiQ//UlzHqdcmdtoM754i3mPSyncNcmwBSxfIHSasCUhBfrQLOYpvkc/c9CWX
RkWIx6MjZCZ2ryapXPPcMUQbt0C2fp8y+CClREKndIsiUadLSxSctfW/oDlmp8Iq
mozxwUjxr8LIHbRfhrgrL+MFQ7BPr2CQkj3hAJR6SsW6G4GycHp31Ctxsyl6BeRb
lUKjXI7zM/mvJJ/GLiMvWWct2195NueigYugWT+U4/co7CuekhyxltODj3zQ3DnC
UaFmi48VYOSTdXvcJH1AeSG4d56JUK22NkUmI06/d8N78B7bdAF/xJcW9Lb0G69k
536QVNX+vb4M36sxRKU1A36/Z1aIdDz0uvtTuU/AxqOzp95fPw7SHC2VaoHhGD/S
OaxXKVxvAwFH0kZ5E/6hZ9H8SPfVTxeBmlF5xivct+X1xm+3Mt0c0NYGYOpEiEv4
v20HR+wxs3JFpSIRhg3HoUgPkeJ8F42XTcrmYxUNee7gfYpjoMn6b2mLNtbPf93R
NifsPLgSAfwigv8UgGQGVWbEbwKr7D8vmG7tNWiGxlz1VGhEMQxOYEB4W1ORyaEI
Sn/nyHHRWVoMCLVVLADlOYHBy+1RLu3lye517qiozoDiF5cMUSSQrk0cTEXDG8nV
rHKdk2aVlW757CtgPzhTGuDoWr38eAix5qFBOpK8NKpR7XTtz5A=
=mQbV
-----END PGP SIGNATURE-----

--rpi2rmgxu3mrx2a6--
