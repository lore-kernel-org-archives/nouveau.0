Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0404606A327
	for <nouveau@archiver.kernel.org>; Thu, 12 Nov 2026 10:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bhRW52/O
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1A0F3112010;
	Thu, 12 Nov 2026 10:48:02 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 580C849299;
	Thu, 12 Nov 2026 10:28:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794479301;
 b=ap8E5TlNCdkEZXcBHzVaJw1VpIXwaUvoMDx3XPNbh7Wt/GWVPcDVWlgoi7NQkviVktQ4t
 T4L97ocMpxSY/NtZHtB0OZ1nApm3A3OMNuOarNRfgCLrkWjPjQZ+tK8pN0lX0GD28kbLqnE
 HcxdDrR3bzftflk1U10h58axjCuhnFcZl83UXJ7EDTYpNo3xSewjUnK+y06iz+XngSi3YUs
 NLyfDLXCYqchDaVkOKhICiIZy5t/26GPLkQf/8ogfMfGqgb47BDDVDZ6lfsTo4RGatl9blB
 +iS2vr9iPNQu/+DsJ5f1H/JsAPHkfBvlegSNnJ8/ezjQouTp0/zyslz2ogwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794479301; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LaAKKhAngwkFxDGEu7glsCDhQDKP6or5IXQD5q9C6lk=;
 b=WQlkVm3KM/8sAb4Wza8+rsj/bjAhM8qQL/fckn6feYnIbp0Db9YHDO6YgcV1lfINkOXdI
 j2fdMM1FGhPBa3v2w/RskYhnEzSpQ6fpsOXZXK6VrSIe6HyGoDqRrVpG4kvYukCYPsfghOt
 a1P5hbg3tUcNhdt5hkLc0i/Kd1pV/NDGo38BBaazn7AxkIkEPX7H0O0dcRCBnkEIATEh/QJ
 /7NJ+wQ7qcd8Xos35gnDrugeWCqLInaX/Yrtfm36sbJka13SDMjMzRtsUPqbleTCSE8F2I0
 F5BDO6xrVhmQ88kKoHx8TMR8mo+k/RFP0mELYT/pURSJLfU5xMsuK8FQkwuQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C63D646EFD
	for <nouveau@lists.freedesktop.org>; Thu, 12 Nov 2026 10:28:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A26510FFFD;
	Thu, 12 Nov 2026 10:47:54 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2309263629;
	Thu, 12 Nov 2026 10:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85FD1F00A05;
	Thu, 12 Nov 2026 10:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794480472;
	bh=LaAKKhAngwkFxDGEu7glsCDhQDKP6or5IXQD5q9C6lk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bhRW52/OaiERqOjVo+YsX7WenTAM+RkUSYdDbFFgDeELIFl5MCvdrQ4/lrfg3PaBP
	 OJEvlXHrGI0KP6Sf7isOdA90CQUC1tSnbnlL7KMlGmOGy1uOT4Tps4k2NALfzc5lt4
	 GBKdaLdl6Hn4QG7D1jOt3xg+R2SbDhwXqrQ5QTOpBVzV6PCDTf9sB1jcXxmSVYEwEX
	 9k1ve7B7mHoKt9f85FezBUXVhvbLCq9DZT0dTEHtWXQsiFKFjjwdYqhwDGS2C9B8hk
	 PMIxYSXrd0qwW336ZZGtXr/22P+Xd17f+e0rYlMLg9nZUtItJXlZjgdtGYx+r60Y9l
	 +6iWNMqoSTUaQ==
Date: Thu, 12 Nov 2026 11:47:38 +0100
From: Alejandro Colomar <alx+linux-hardening@kernel.org>
To: Bence Csokas <bence.csokas@arm.com>
Subject: Re: [PATCH v2 1/2] stddef: Add offsetofend() variant of
 struct_offset()
Message-ID: <avWY8kNFlkLyxIrX@devuan>
References: <20261112-offsetof-v2-0-276ede839967@arm.com>
 <20261112-offsetof-v2-1-276ede839967@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmbonzz4lyxux25l"
Content-Disposition: inline
In-Reply-To: <20261112-offsetof-v2-1-276ede839967@arm.com>
Message-ID-Hash: PDFQSWWLFLJ337MWQBMYDPQ6JADLU6BU
X-Message-ID-Hash: PDFQSWWLFLJ337MWQBMYDPQ6JADLU6BU
X-MailFrom: alx+linux-hardening@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, arm-scmi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
 linux-hyperv@vger.kernel.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, chrome-platform@lists.linux.dev,
 linux-scsi@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PDFQSWWLFLJ337MWQBMYDPQ6JADLU6BU/>
Archived-At: <https://lore.freedesktop.org/avWY8kNFlkLyxIrX@devuan/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--hmbonzz4lyxux25l
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx+linux-hardening@kernel.org>
To: Bence Csokas <bence.csokas@arm.com>
Cc: Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Philipp Stanner <phasta@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>, Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Selvin Xavier <selvin.xavier@broadcom.com>,
	Kalesh AP <kalesh-anakkur.purayil@broadcom.com>, Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>, Chengchang Tang <tangchengchang@huawei.com>,
	Junxian Huang <huangjunxian6@hisilicon.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
	Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>, Miri Korenblit <miriam.rachel.korenblit@intel.com>,
	Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
	Johannes Berg <johannes@sipsolutions.net>, Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, Guenter Roeck <groeck@chromium.org>,
	Nilesh Javali <njavali@marvell.com>, GR-QLogic-Storage-Upstream@marvell.com,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, "Martin K. Petersen" <mkp@kernel.org>,
	linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-rdma@vger.kernel.org,
	linux-hyperv@vger.kernel.org, netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-scsi@vger.kernel.org
Subject: Re: [PATCH v2 1/2] stddef: Add offsetofend() variant of
 struct_offset()
Message-ID: <avWY8kNFlkLyxIrX@devuan>
References: <20261112-offsetof-v2-0-276ede839967@arm.com>
 <20261112-offsetof-v2-1-276ede839967@arm.com>
MIME-Version: 1.0
In-Reply-To: <20261112-offsetof-v2-1-276ede839967@arm.com>

Hi Bence,

> Date: 2026-11-12 10:29:33+0100
> From: Bence Csokas <bence.csokas@arm.com>
>
> Many call sites of offsetofend() use it for the purpose of pointer
> artihmetic. Thus, a common usage pattern is:
>=20
>   offsetofend(typeof(*ptr), member)
>=20
> Capturing this in one macro helps keep lines short and terse, while
> still making the purpose clear. It also helps discourage spelling out
> the type name on every callsite, leading to more maintainable code.
>=20
> A similar struct_offset() macro already exists, so add an offsetof()
> variant in the same spirit.
>=20
> Signed-off-by: Bence Csokas <bence.csokas@arm.com>
> ---
>  include/linux/overflow.h | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>=20
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index d0f04436343e..060dad4b6f3e 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -464,6 +464,18 @@ static __always_inline size_t __must_check size_sub(=
size_t minuend, size_t subtr
>   */
>  #define struct_offset(p, member) (offsetof(typeof(*(p)), member))
> =20
> +/**
> + * struct_offsetofend() - Calculate the end of a member within a struct
> + * @p: Pointer to the struct
> + * @member: Name of the member to get the end offset of
> + *
> + * Calculates the offset of the end of a particular @member of the struc=
ture
> + * pointed to by @p.
> + *
> + * Return: number of bytes to the location of @member.
> + */
> +#define struct_offsetofend(p, member) (offsetofend(typeof(*(p)), member))

The outer parentheses are unnecessary (they are unnecessary in
struct_offset() too, but that already exists).


Have a lovely day!
Alex

> +
>  /**
>   * __DEFINE_FLEX() - helper macro for DEFINE_FLEX() family.
>   * Enables caller macro to pass arbitrary trailing expressions
>=20
> --=20
> 2.56.1
>=20
>=20

--=20
<https://www.alejandro-colomar.es>

--hmbonzz4lyxux25l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEES7Jt9u9GbmlWADAi64mZXMKQwqkFAmr1mUAACgkQ64mZXMKQ
wqniCg//WgRXXz7luTnHUaMXrHNthttFpY3wBO557jzGIfLwMa+0tJqYgSh8MGS8
7F44pQ7lX8E0qC+aMkDd3ItqdrKeD3McIbqqgpr8iU1VT0ljohr8pnTU7UIyIP/u
bX/o22pWYohJFt/xcJcLxQ63rHmjcfjH2ug2i8ZgZHh/YGX+Biah79nfkcAB+uYX
NI+43mSTP1aHvUK3Jf/z7PJF/v1/vyv1zJ/nsoN74w3JhlYGMggMcXHSu+dp0jmX
qJUkyYJ5SQEzMdU/n2pSgOJFIZl6YS957I6fhU3GxEPXSldcnd/VIH/QRKMpSyjM
jWzBsyjyyink+9RSw7AcmU46DJ28GeWMW5jZdg7jXq6ZGjO0/AKleOtMrevQLN4s
hB7CzUrtofXBv5Oa5javphhfKIEoawgDsDch5eXFQW/Rm9rSflWysbPTCST5n/h0
GfKbUEzD+COFj6I+Y8COEceKp4Xv8Y08A3r6CyyNIPzPwcc0CulK6xAmHbsMxIXZ
c6uz3LLfqukMfbuquIZE4KhlNt+ZLRtnxL6rFfFkvLYdz4KwIsljmiPqoyPQxp9A
OX5vOdZ9ulzmuuNoTY5OeJWSlsI6edzNc17hE6jjR1+wFfJSzVF2cvvv6mRGnpY/
bGpmsQZFuH/KWJutZlHbsMGYEKF7lo42UH0Tqx57oaglMss89x4=
=8quq
-----END PGP SIGNATURE-----

--hmbonzz4lyxux25l--
