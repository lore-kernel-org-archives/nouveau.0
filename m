Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F8DBC5DF7D
	for <nouveau@archiver.kernel.org>; Wed, 19 Aug 2026 00:11:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A7D810ED0C;
	Wed, 19 Aug 2026 00:11:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="UdTJqcUd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 992394795C;
	Tue, 18 Aug 2026 23:54:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787097276;
 b=Z0jNGb1EQK6I8wXHtK0vd8j8z9euTiPIdIE7jpOP+8myR6SA7Lma/1mBLhUbnoJNjHaqs
 aAX1t3kXXa3IbrhrQtm7nl3fBxdagNMdI4J/dqyppYQQqfySbVcJdglCNUk0d0q21hm6yjK
 mSTAFXJgqvBHPxdcWV54w0PESdu/nvEICrxWd6HygT4RyYD5NHwgKWKiReOCuXYJL3yImC6
 N0Ta+c/psrXyzMurIfRjL2ls81mRSkKPJNeGwCfLUKOM6kv2u5FESShyo0qC6PmGat+opLB
 Fg69b1snOupbSmmWrBJ/tlUnceKPgC2FPRorz+mzEieweth23/5jXXWXRvZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787097276; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6PkDd0UmCahKdu3JZanls061LW3iQXGbXeZcNXkwJrg=;
 b=a8/LIfAub74YrW1rCaroEiuQRM95BpM6Moc0VLgp3EuhHI5+mVd1q9oFgx2v50s2B1E+W
 2YHNSPV0WvEPragrpNGir2ZBqWy1Khz4C5Zq91a2Q/Y5Q+o0I2VzldeAfFpR0dbSkqKpzXM
 QORavkNsIet6deBYMBcW7ZUA+Am6Xw3gd2YZp2BWOaWiCIEoRSDy2x/xlkS/d8U/NE2skiU
 w054C+EH7hw3QCOLuNK9tDkeO/nphhjaSmhR5sYpqTIuoMy1Pqfk6O6/4NRQD457qCI5PBS
 ttU5Q0iqAZ12p3CRASBUmDUCWv1UsAsitD4hPiS4/cOt0+kCy52tQzQFX/yA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 059BF4792F
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 23:54:35 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 665A010ED06
	for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2026 00:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787098265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6PkDd0UmCahKdu3JZanls061LW3iQXGbXeZcNXkwJrg=;
	b=UdTJqcUd54BKD5yvU+axzaaqqfT1WzBSOIih/k4lYV5IMvbtpWuK3ZicES74jfPGNqw+6G
	pcIQ8wp/JWKtZowEjeCLC4THp5uerPKRcNb8Woix1aiVaKR8tYuZYSnTkzv12phJuaOdXB
	5ogdhm7y4qrGDyfj4V4RfEOyh1lMO1Q=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-376-MKluMAoOOmul59ri0nI2EQ-1; Tue, 18 Aug 2026 20:11:02 -0400
X-MC-Unique: MKluMAoOOmul59ri0nI2EQ-1
X-Mimecast-MFC-AGG-ID: MKluMAoOOmul59ri0nI2EQ_1787098261
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8f0f45415cfso5699916d6.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 17:11:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787098261; x=1787703061;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3meVETvNh0oF+MgWc75MBOQm9AMx1Iu8D1AK3Y3rmHY=;
        b=r5PO6yZmvji8JXdnjKs2eGuwgjVD/ukufj4dKAfzg6kDvKBl7dfCPyYSAHS9jE6JVT
         EAaeBRGt3hDEt7gIh1uz5YgnMm5bLSZaEhgpdjbba+dMAd1uE70DpFMcr3bI/32b98+1
         rqTGg3Ip4Px9ShlciqKtL5is1L9FpJH2ZWx9x16gvWjJnLD127AnhqCV2wc5JEevpGUK
         aAHPAFx7gVeWjGs2z+k6ZiJhtXlsvIOSCqrLI5KShrr4JotHk2qA7xC/Zs7VXKrR//ya
         9GDRN5KS5yDRPdDdR7s91tUYaQ2D9tomTc53gZYmkcaxFR1FiKE7RPubaqDjYRpqx2ic
         1bXA==
X-Forwarded-Encrypted: i=1;
 AHgh+RrD6z3F7PzAXhyw1JRzJAwb9a/wNH4QujjhhydJBJa8Jyk7pABYpVeswPg6VuousiVsXDHiBAtq@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyciNM7IrBl4WFOHZEYylSrBYJD987D10conae6xKaQeqLw0Vy1
	oq/dedb1xwiRWimCGM1vRjsOLcW2x9SfPdzqrWtLAIZzcOYlshDTZ7hzlYP2nnp26T6xTE51Thz
	LlhsAy9/GEa+2hBoabbPTccVkKD9w0mQb7DnhdrbGVnqS8CPXL/kfMUqY2qqMxtT1X7g=
X-Gm-Gg: AR+sD12nXoSFYgZaGdPnJrOjJLJ0ZfHiG3oewG2HYPLTg1x0ffgwGBEFwX2utPFyvce
	cxXkT39LJvEuDjCBpBwgBO65g0ynI1NpgxdTSnH9w+Bm8FjH4+3jzwYBL2+Mth3UdtfGwq7RWPR
	u+CRjIk5ZGGQ0DXVHCFEaEtUcOY0jqv0MHONJUPajy4t7/bPvxhjDW4gR1xp12yzTdp+958efPK
	Gg4LRFRgpzyw7qhf06G9PhIDRrjo79h18V3hnur8HVHbkn+z3wHajEJpaa8TfLEXDJogevO0cz2
	+9G7ywjYslepGwSCbSB/LxZzcWstauBTk4USeuCuBBLRmS92cNUJxTmBetbBMAiLUm30IhCb
X-Received: by 2002:a05:6214:4186:b0:8fd:d5a7:f970 with SMTP id
 6a1803df08f44-90c5e6cc420mr7993496d6.11.1787098261464;
        Tue, 18 Aug 2026 17:11:01 -0700 (PDT)
X-Received: by 2002:a05:6214:4186:b0:8fd:d5a7:f970 with SMTP id
 6a1803df08f44-90c5e6cc420mr7993056d6.11.1787098261046;
        Tue, 18 Aug 2026 17:11:01 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90c5f2911a5sm1572226d6.30.2026.08.18.17.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 17:10:59 -0700 (PDT)
Message-ID: <ff6ff03c9150d84c02042f6d810cab9b0c9db51b.camel@redhat.com>
Subject: Re: [PATCH 4/6] drm/nouveau/kms/nv50-: Stop using nv_encoder->crtc
 in nv50_disp_atomic_commit_core()
From: lyude@redhat.com
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Marek Czernohous <mczernohous@gmail.com>
Date: Tue, 18 Aug 2026 20:10:58 -0400
In-Reply-To: <20260818235637.1738055-5-lyude@redhat.com>
References: <20260818235637.1738055-1-lyude@redhat.com>
	 <20260818235637.1738055-5-lyude@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ZQs-vB9Fjcm7MictxIWaxWj7oA0y0ITxKlCDj4bFybU_1787098261
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ERY6DJRBGGPMMMYL2BLGZ3IA6RY7XPPG
X-Message-ID-Hash: ERY6DJRBGGPMMMYL2BLGZ3IA6RY7XPPG
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Marek Czernohous <marek@czernohous.de>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Kees Cook <kees@kernel.org>,
 Marco Crivellari <marco.crivellari@suse.com>,
 Simona Vetter <simona@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ERY6DJRBGGPMMMYL2BLGZ3IA6RY7XPPG/>
Archived-At: 
 <https://lore.freedesktop.org/ff6ff03c9150d84c02042f6d810cab9b0c9db51b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This is wrong and I only just noticed it before getting ready to finish
up work - whether we need to use the new or old state depends on if
we're enabling or disabling - otherwise we'll end up with an unexpected
!nv_crtc

Will send a respin of this tomorrow

On Tue, 2026-08-18 at 19:48 -0400, Lyude Paul wrote:
> Another leftover spot where we still use nv_encoder->crtc. Get rid of
> it
> and do the right thing: get the currently assigned CRTC from the new
> atomic
> state.
>=20
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reported-by: Marek Czernohous <marek@czernohous.de>
> ---
> =C2=A0drivers/gpu/drm/nouveau/dispnv50/disp.c | 8 ++++++--
> =C2=A01 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> index f19820dc055ae..63d554e97fb62 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -2171,10 +2171,14 @@ nv50_disp_atomic_commit_core(struct
> drm_atomic_commit *state, u32 *interlock)
> =C2=A0=09list_for_each_entry(outp, &atom->outp, head) {
> =C2=A0=09=09if (outp->encoder->encoder_type !=3D
> DRM_MODE_ENCODER_DPMST) {
> =C2=A0=09=09=09struct nouveau_encoder *nv_encoder =3D
> nouveau_encoder(outp->encoder);
> +=09=09=09struct nouveau_crtc *nv_crtc =3D
> nv50_outp_get_new_crtc(state, nv_encoder);
> +
> +=09=09=09if (drm_WARN_ON(drm->dev, !nv_crtc))
> +=09=09=09=09continue;
> =C2=A0
> =C2=A0=09=09=09if (outp->enabled) {
> -=09=09=09=09nv50_audio_enable(outp->encoder,
> nouveau_crtc(nv_encoder->crtc),
> -=09=09=09=09=09=09=C2=A0 nv_encoder->conn,
> NULL, NULL);
> +=09=09=09=09nv50_audio_enable(outp->encoder,
> nv_crtc, nv_encoder->conn, NULL,
> +=09=09=09=09=09=09=C2=A0 NULL);
> =C2=A0=09=09=09=09outp->enabled =3D outp->disabled =3D
> false;
> =C2=A0=09=09=09} else {
> =C2=A0=09=09=09=09if (outp->disabled) {

