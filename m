Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F08FF8E4A5
	for <nouveau@archiver.kernel.org>; Fri, 17 Apr 2026 04:36:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D494F10E94F;
	Fri, 17 Apr 2026 04:36:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Y9Vjn8q4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CC2EB459B3;
	Fri, 17 Apr 2026 04:24:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776399858;
 b=ApMzvdVPGGJH/QZmbmZpNbvqEL8+7iH2mWhx8j+odDfDsCu9nF6c4GpRTULCyun9JFNv1
 NnfHsSHRKqilEeK7gUCO0z1mdhCBKEVUmOxdr19l5Is92oqGHY/Bj5oAFB6UwPCKXf3b+WH
 +kA+XYbnHx1HqfBZy8UeeFE8+NC2B+fW2szYjQpuPXAmj0ktarxG3KsVgeTAx8QGZ8H/qAf
 1nqCIAfAZ8dVtxdB88D7HzmwOG5kCJ7Jul0YIULdiciguRp4NzZPbjDXuSp9pJIv3AV4ND3
 ByVkHbK2b+8eda4pQ+z5pU/45+XJ/Kuzer0O2drGD8B409yb60MVjgdZ0ORA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776399858; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=wJCWVp8OC7bbbAgdbMwdNkUeylvTtEVIhbLpUvTx1Rk=;
 b=h0NdizFLWYkB4ec51gG4oEkZBNwowYBsc2hBhgSTv+3WcWShkFW4pXYuECnhh5Zs7k5ZD
 AkJyTNP/9bqyleplg1RGCN6mtLosFQ95KvTnUqwt0zYuBatopT//Nm6bV6hGAjhfHZRbYMM
 28X5HKe9fy+nLt76TtpKV5urjxXonV2NK4ok6tkcCiqLhn5WjWihOBkfAprvE2ZmnNJxsC8
 WRhTAJErfu8GNYtTbcKqbukeLBQekIrVMGMqJOJwXLaxtXgv6oShVU8k1958G4sFdpwT6bb
 kNEI0mDnlU1CMYdz2j6VcLV1yQlNwJL7PN74dJnBOCsVgF2zTa5M+Xutj1Pg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AF66F43F8A
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 04:24:15 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8B75E10E28E
	for <nouveau@lists.freedesktop.org>; Fri, 17 Apr 2026 04:36:12 +0000 (UTC)
Received: by mail-qv1-f41.google.com with SMTP id
 6a1803df08f44-8a016799d2cso2852756d6.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Apr 2026 21:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776400571; x=1777005371;
 darn=lists.freedesktop.org;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wJCWVp8OC7bbbAgdbMwdNkUeylvTtEVIhbLpUvTx1Rk=;
        b=Y9Vjn8q46aFuUaOasaLmyIHepBaiMfH4Si7JUZKLTvmilciLU8UPiBl/vBjBk+g6Ts
         E+40wLexVcsZiJ4WFjQrHiYL0Cq9Zjx0hwcEXUU0Zcu01KH/OXIrpCY1heAL/SDMgnAw
         NLIwPmtKDmmnZZgHJLWb39pEoyUPJcaFDPENwxSO7cSDslpqQLZ7wHrNPLy/5SLaRcQg
         Xo1szlhbH3XRAHYZnMfEb9XX+7JS2jPYfeS3AI/+3EcM8pb/Pt6DnUmqQcEsOhW3fYOK
         FAbq3doVUBLuRj72jQAv9KRgflfMQKO2P82Ul6lqmwKc4CWg9+0G84um/81BryJJG3ia
         voVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776400571; x=1777005371;
        h=in-reply-to:autocrypt:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=wJCWVp8OC7bbbAgdbMwdNkUeylvTtEVIhbLpUvTx1Rk=;
        b=ZIAGS8u7tALEvTr8+ahyDsIJrCoLYdtaTV8Y7kqwRRtVOHmmT6qAj8Yy/8jvghbd/T
         993R5Ikc4dSR52HIdfBE/CDT1Txe7gC90p1ps6YgpiCFcsknE4bXOJw5Lmilf2W92Hyc
         Qw56YSj8c6gJZ+Tq49Oq8XjqeLzkWEqhin52xTUw2EUBNobeWASqw3lHocdMKJB0zDYc
         fS1r73G+pmTpFMV8FM7YUWFTAjZHkkTmlQtP8nJoiGSOEiTGzBlP7Bh2HhUfQ4jynm6Z
         EeYQI/DSBRoXdjFsonXd0s6/Lsnvc5iGeJF9FPqaJ3AEGnyH50/oMMZ+ghECkYj50g7R
         4I4A==
X-Forwarded-Encrypted: i=1;
 AFNElJ8tO7fOAjxRiP9NDMsXsFLtKeqaPCtIfNx2InJpLnbsal02T6vD1VD82e6KhYToaGvQgc8W+qFw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvVAooYT/oKtzG7w7r38uvr3qsesUyn/iQ9xZQt78pp5bBeYot
	qWgGCu2EsDP7I8MdyIUWNLKb4gg+309TgQwshxbP/UmiQ0eRgN9Or6c/
X-Gm-Gg: AeBDieu6i4SxaAGIJ/U3HBBMnX3dYbm9+6qwkvCo+lQO2/GxMUWmipV6EEwDQDC3iNf
	h88GiLgrtayuOx7eZsf355z1fjLICKjQirqpQWJi2ylD0KHe12M3cYSlOej2yNj0ch6yE0tj/5O
	jQG98Meyxh05K44iQTFx93+03spkdJTxHB6pt8BO0dJ/JFehyjccVKXgQN8wLAkNZP1AqAzkWV6
	y+z/f+QvnKnrWHA7KeMJNZ83LGuVeW3QpjeM3ZWlBEtMzu9jkuE/4Gweouv5tvrOG0Knbf5j2ny
	sNVHmpF3H2K9YTdZDVOFC5cbunpHPjdevJxYHfc7wvQDPvxhvc2vxmJJUF5+Mk4ebOPZBDUiUdC
	Gqau5cjwf9WuxKf6YDZzKP8zxu7tJZx1MXYV+3O/WtrPqYfxTMBxCbxi8ebb0Tvuq2sOaxQBsxd
	aWVpu/4+yqQ/ryPNmz1kvCTGiPfgdUcO5BQ6ITyRGhQ/pxCs0T
X-Received: by 2002:a05:6214:4a08:b0:89c:ac72:2f6e with SMTP id
 6a1803df08f44-8b02813f8e0mr21757356d6.43.1776400571385;
        Thu, 16 Apr 2026 21:36:11 -0700 (PDT)
Received: from [192.168.2.25] ([184.146.175.99])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-8b02ac72915sm2745626d6.15.2026.04.16.21.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Apr 2026 21:36:10 -0700 (PDT)
Message-ID: <7b4509b0-9c35-40ca-9388-881236c82a32@gmail.com>
Date: Fri, 17 Apr 2026 00:35:58 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:136.0) Gecko/20100101
 Thunderbird/136.0
Subject: Re: [PATCH v2 1/2] drm/sched: Make drm_sched_entity_kill() a public
 function
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tursulin@ursulin.net>
References: <20260415144956.272506-2-phasta@kernel.org>
Content-Language: en-CA, en-US
From: Luben Tuikov <ltuikov89@gmail.com>
Autocrypt: addr=ltuikov89@gmail.com; keydata=
 xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1APnbnnRHN
 Ikx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoAQRYhBJkj7+VmFO9b
 eaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiICBhUKCQgLAgQWAgMBAh4HAheA
 AAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlTMqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfy
 JwktF7REl1yt7IU2Sye1qmQMfJxdt9JMbMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSP
 cCE8uGe7FWo8C+nTSyWPXKTx9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl
 10wVR5QxozSvBQJlOiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKo
 aMDzO9eGz69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA==
In-Reply-To: <20260415144956.272506-2-phasta@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------tyfpZ8tXo0NFX30pwA0Og5IZ"
Message-ID-Hash: 5WSMW44K5QGY4GYKLMPG36I5WA4NUVWF
X-Message-ID-Hash: 5WSMW44K5QGY4GYKLMPG36I5WA4NUVWF
X-MailFrom: ltuikov89@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5WSMW44K5QGY4GYKLMPG36I5WA4NUVWF/>
Archived-At: 
 <https://lore.freedesktop.org/7b4509b0-9c35-40ca-9388-881236c82a32@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------tyfpZ8tXo0NFX30pwA0Og5IZ
Content-Type: multipart/mixed; boundary="------------gaPimzysG4nviCSPOZwz55y1";
 protected-headers="v1"
From: Luben Tuikov <ltuikov89@gmail.com>
To: Philipp Stanner <phasta@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Dave Airlie <airlied@redhat.com>, Tvrtko Ursulin <tursulin@ursulin.net>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Message-ID: <7b4509b0-9c35-40ca-9388-881236c82a32@gmail.com>
Subject: Re: [PATCH v2 1/2] drm/sched: Make drm_sched_entity_kill() a public
 function
References: <20260415144956.272506-2-phasta@kernel.org>
In-Reply-To: <20260415144956.272506-2-phasta@kernel.org>

--------------gaPimzysG4nviCSPOZwz55y1
Content-Type: multipart/mixed; boundary="------------5h2gFf0j1Vd2PHE5Iw2i7zdd"

--------------5h2gFf0j1Vd2PHE5Iw2i7zdd
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 2026-04-15 10:49, Philipp Stanner wrote:
> Some drivers do not care on teardown whether the last jobs pending in a=
n
> entity are actually executed before teardown completed. For such
> scenarios, drm_sched_entity_flush() is not the ideal function since it'=
s
> intended to wait for jobs to complete.
>=20
> Make drm_sched_entity_kill() public for that use-case and update the
> documentation.

This is a good patch and great suggestion by Danilo.

>=20
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
> Changes in v2:
>   - Improve wording, fix typo.
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 13 +++++++++++--
>  include/drm/gpu_scheduler.h              |  1 +
>  2 files changed, 12 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm=
/scheduler/sched_entity.c
> index 61a4818cc87b..7be5811b90cd 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -267,8 +267,16 @@ static void drm_sched_entity_kill_jobs_cb(struct d=
ma_fence *f,
>  	schedule_work(&job->work);
>  }
> =20
> -/* Remove the entity from the scheduler and kill all pending jobs */
> -static void drm_sched_entity_kill(struct drm_sched_entity *entity)
> +/**
> + * drm_sched_entity_kill - kill an entity's pending jobs and remove it=

> + * @entity: the entity to remove
> + *
> + * Removes the entity from the scheduler's run queue and kills all pen=
ding jobs.
> + *
> + * This function should be used over drm_sched_entity_flush() if it is=
 not
> + * desired to actually wait for all pending jobs to finish.
> + */

I felt that the email body above describing this patch was somewhat clear=
er. Perhaps something like:
(Notice the change "if" --> "when".)

"Use this function over drm_sched_entity_flush(), when the caller is not =
interested to wait
 for pending jobs to complete. This function kills any pending jobs."

--=20
Regards,
Luben

--------------5h2gFf0j1Vd2PHE5Iw2i7zdd
Content-Type: application/pgp-keys; name="OpenPGP_0x4C15479431A334AF.asc"
Content-Disposition: attachment; filename="OpenPGP_0x4C15479431A334AF.asc"
Content-Description: OpenPGP public key
Content-Transfer-Encoding: quoted-printable

-----BEGIN PGP PUBLIC KEY BLOCK-----

xjMEZTohOhYJKwYBBAHaRw8BAQdAWSq76k+GsENjDTMVCy9Vr4fAO9Rb57/bPT1A
PnbnnRHNIkx1YmVuIFR1aWtvdiA8bHR1aWtvdjg5QGdtYWlsLmNvbT7CmQQTFgoA
QRYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJlOiE6AhsDBQkJZgGABQsJCAcCAiIC
BhUKCQgLAgQWAgMBAh4HAheAAAoJEEwVR5QxozSvSm4BAOwCpX53DTQhE20FBGlT
MqKCOQyJqlMcIQ9SO1qPWX1iAQCv3vfyJwktF7REl1yt7IU2Sye1qmQMfJxdt9JM
bMNNBs44BGU6IToSCisGAQQBl1UBBQEBB0BT9wSPcCE8uGe7FWo8C+nTSyWPXKTx
9F0gpEnlqReRBwMBCAfCfgQYFgoAJhYhBJkj7+VmFO9beaAl10wVR5QxozSvBQJl
OiE6AhsMBQkJZgGAAAoJEEwVR5QxozSvSsYA/2LIFjbxQ2ikbU5S0pKoaMDzO9eG
z69uNhNWJcvIKJK6AQC9228Mqc1JeZMIyjYWr2HKYHi8S2q2/zHrSZwAWYYwDA=3D=3D
=3DqCaZ
-----END PGP PUBLIC KEY BLOCK-----

--------------5h2gFf0j1Vd2PHE5Iw2i7zdd--

--------------gaPimzysG4nviCSPOZwz55y1--

--------------tyfpZ8tXo0NFX30pwA0Og5IZ
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQSZI+/lZhTvW3mgJddMFUeUMaM0rwUCaeG4rgUDAAAAAAAKCRBMFUeUMaM0r6j4
AQDr7lP/kQhrH/SqboZz98qXO5P5Ea7iUmqRubR6r9+G/gEAqaquNDOvBw2OUFmYIobPxbdWZ2if
glf+8pI8YLWZ9g0=
=vuh+
-----END PGP SIGNATURE-----

--------------tyfpZ8tXo0NFX30pwA0Og5IZ--
