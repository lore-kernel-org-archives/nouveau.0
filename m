Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 063BBCA601E
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 23:24:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D7411112326;
	Fri,  9 Oct 2026 23:24:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZlM3Ws5I";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0858948A49;
	Fri,  9 Oct 2026 23:06:24 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791587183;
 b=I7uLahwHxFJKQIvgksG/WfQ+EzBGdBh8yc+wadDlZE+yi3MRq+P5iXumrkwHfpyNBcf2F
 60y4bX0UM4gWy8yO0j0uZJ9j9aMMZ90USpXpTptIXbaOhLuwv1c/loGQaNdCsQrdkfxrZ0y
 +df3vImH9+Ey5h90WD1MvL7CJ+RCMo1W3jMxlW999dstEb4+aHoNn2HEv17KnHyNqPjmR15
 CjTj7tWZtjk9aUe8gBmY62MfDubbldUIcnfKpIniLRHt6oE9Nx40DyrbBtb1zwhcMUcHoNE
 DrSG9YPuTYlGJS0T+e1/1qISjbkHNEh5i2A7miH1irrPAeus6mnsByZB6hJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791587183; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=c13MuhXT24Rb6zhv5dO/7ybzw4u9qtSVSio9SfsGxY4=;
 b=At/YchQz0JesDoqyyOUaaNs3bVRK04vTRjH/JZq9xda90lAB+CIb6/FbGeQ+Y8rXX68eG
 9srQ2fejJAdscJQAbI1da4+HrLhrLswjnio71pjbH2AO/WHU9FMGc451d0PbFwT2MB5Syi9
 6Dc3rTn0nt2gVBhneL0IB6y/sFFb+wNQRIxHjiVmZ+kHQGgaaM2/eBIa2boWMlzQ+xtPrEw
 JvqBJ3nJrirzMWxAIu3Aj7IiedTgKLyRMCtsXcNlVJbVCAJU7Xsr2jW9SsAKP5zL+LC/J0G
 /0/DBZDE+0oWCMorTER1YCfeUM2j7aXjErZTvj8Hc/48BfyptuXCwWBqFbXA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8191E48A14
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 23:06:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B895112320
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 23:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1791588287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c13MuhXT24Rb6zhv5dO/7ybzw4u9qtSVSio9SfsGxY4=;
	b=ZlM3Ws5IfnsCQCizY6qRFl5t6hagStNqRdibxqr0YixRC9PqeYY4FoaYxeBrSDn1UNU560
	ebQI0Fw7n4U2HhRPv0WXLeoS8T9EO9bdfPoFX+bAh9KvS7hwfsNNGYzMSQ+dUE4jLgqLhH
	8hwKjgkeSYkBgfp+SJQ0Aw8VfOIQqyA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-AjyMBuCbPSebO-P6XKB8WA-1; Fri, 9 Oct 2026 23:24:45 +0000
X-MC-Unique: AjyMBuCbPSebO-P6XKB8WA-1
X-Mimecast-MFC-AGG-ID: AjyMBuCbPSebO-P6XKB8WA_1791588285
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93ca9b53afaso52217685a.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Oct 2026 16:24:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791588285; x=1792193085;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T5sL1IN+vEe3uRvA6b5GRf1/o9Y8z+Hb4XnuY1HXzNs=;
        b=JWafpliGi3k46AWOQ0XDLqmAIO3BmlGL8JhZDq99ZXifCWoWxjwQtZURplid0/nD8/
         S3jMSv1+wVUg8UYhbjVWJ/A3CcWEgS8p3AL3lYAg/EacD8V5HqiweekZyULbptqetSik
         o0PYwO1X23CIXj42xxsdgCxX86CzrJszWaUUuyIiHJ4OgLVVStcKMY5hH8VYzw5neJKp
         DLsyayQKqYLpCm4+vd3VhRNovGgEKtNJYFi4EOYfy/aMR5H2bK6sQHsYNylcQOYybB0M
         HghA8vU11p9WLSd2VyWzUGtc+NHyf8FgfDhrEkqiViMMOMlafOnKtybXxQNQPQPzzLUC
         3cgQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxPG4cb4FiM+cUPOjyZewd+5DYj+putELSz7hu8yqV3kwxabsLKav4thAFdzmeUznYxj+hAsxH4@lists.freedesktop.org
X-Gm-Message-State: AFq9FYJuTPL9J3Ilp8kKNcnr4OsN/9otXN/5rW0i7O6ni+2WRfn28e5e
	H1e7U3sk04tA+kP+C+wNn5QDxyeNjOqolw1fn0zFo1+y+wccnygBWSdfKkw7Vi/cBqx7Zv7KFqo
	puaqvegJjdim+XLQYWoBrWwIJChDQ9H3qVvm9Cyru6UnCOUKo2O0+lyiwFa/EXuPHyDE=
X-Gm-Gg: AYBFou0PiZ+Iu/O2OCKc18nkTWFtLV50zstKP+3r9Z4OdUaemN6pM0yU8zaJOGqKHEs
	YE5BmhxjEjSSPnHnUW5ZruKeldLrU9ZsasUuJglHDclNp8ImKyH2NeHslE7G+sCX2Ax68eIBee3
	SwdL+r3x1NURSvLjUyUBgqwkfQcViazDuGndYrSXJEAOWYRop+ko/Rtw+RICi1lkXq0fWqbpRxP
	voQdmrhaw/BKb9GzR8yaUj+U94EtU4D9WeZrK4b3SQkvUlvbrILWX+PShoKvXV/rhxTLshD+78z
	wuTzQJ1QDqoQUvNS23v3U6Jt6dHvsEt13kOezZptdajC7bcflK+0N9PZ3HoxGhpsRLjD6sc=
X-Received: by 2002:a05:620a:a419:20b0:93e:c12c:f145 with SMTP id
 af79cd13be357-93ec12d06ddmr330166985a.79.1791588285220;
        Fri, 09 Oct 2026 16:24:45 -0700 (PDT)
X-Received: by 2002:a05:620a:a419:20b0:93e:c12c:f145 with SMTP id
 af79cd13be357-93ec12d06ddmr330165185a.79.1791588284801;
        Fri, 09 Oct 2026 16:24:44 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93eb98e3a33sm297469885a.40.2026.10.09.16.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 16:24:44 -0700 (PDT)
Message-ID: <a6f23983895d0d09b9c2c6a02160c5e3949a6a81.camel@redhat.com>
Subject: Re: [PATCH 2/2] drm/nouveau: prevent NULL deref of gr in
 GETPARAM_GRAPH_UNITS
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>
Date: Fri, 09 Oct 2026 19:24:43 -0400
In-Reply-To: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
References: 
 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-0-7e057f6aeba0@gmail.com>
	 <20260812-nouveau-nvkm-absent-subdev-null-deref-v1-2-7e057f6aeba0@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UfOnHRZ0_0yxICinxvEYJYhM4beEF5oap0aQtTRyt18_1791588285
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: I2DYRH3CDZOX4AOTE5MPVVVU6LRMWF2R
X-Message-ID-Hash: I2DYRH3CDZOX4AOTE5MPVVVU6LRMWF2R
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/I2DYRH3CDZOX4AOTE5MPVVVU6LRMWF2R/>
Archived-At: 
 <https://lore.freedesktop.org/a6f23983895d0d09b9c2c6a02160c5e3949a6a81.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Since this kind of relies on driver initialization having already
failed (which I'm sure breaks many other things we haven't found yet)
I'm going to push this to drm-misc-next

On Wed, 2026-08-12 at 23:00 +0800, Zhenhao Wan wrote:
> nouveau_abi16_ioctl_getparam() fetches the graphics engine with
> gr =3D nvxx_gr(drm) (i.e. drm->nvkm->gr) and, for the
> NOUVEAU_GETPARAM_GRAPH_UNITS parameter, passes it straight to
> nvkm_gr_units(), which dereferences gr->func with no NULL check.
>=20
> When graphics-engine construction returns -ENODEV, NVKM treats it as
> an
> optional absent engine: the NVKM_LAYOUT_ONCE device constructor
> deletes
> the subdevice, leaves device->gr =3D=3D NULL and continues probing, and
> Nouveau still registers a render node. An unprivileged client holding
> a
> /dev/dri/renderD* fd can then issue DRM_IOCTL_NOUVEAU_GETPARAM with
> NOUVEAU_GETPARAM_GRAPH_UNITS and oops the kernel on the NULL gr.
>=20
> Report 0 units when gr is absent. This matches nvkm_gr_units()
> itself,
> which already returns 0 when the engine exposes no units callback.
>=20
> Reported-by: Yuhao Jiang <danisjiang@gmail.com>
> Assisted-by: Claude:claude-opus-5
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_abi16.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> index 291203121f0c..dd3f8d386377 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
> @@ -306,7 +306,7 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
> =C2=A0=09=09getparam->value =3D 1;
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_GRAPH_UNITS:
> -=09=09getparam->value =3D nvkm_gr_units(gr);
> +=09=09getparam->value =3D gr ? nvkm_gr_units(gr) : 0;
> =C2=A0=09=09break;
> =C2=A0=09case NOUVEAU_GETPARAM_EXEC_PUSH_MAX: {
> =C2=A0=09=09int ib_max =3D getparam_dma_ib_max(device);

