Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B51606A330
	for <nouveau@archiver.kernel.org>; Wed, 11 Nov 2026 21:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=FX9KeLbH
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2496410FE28;
	Wed, 11 Nov 2026 21:00:53 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A58B749248;
	Wed, 11 Nov 2026 20:41:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794429673;
 b=a8leGB4Z5nej0VHjg+Xpo9dgtbF9o4QhqZbU3cTfzhhpVJXrSWaYOMqMv5H7nHVBKURXS
 qzDGBrtBDo0OpJw/YR8xaXBYDqFWa821ZC61IIktC0B2XU/FaNFETo8gWZv5HBEzraFGmwe
 KjxW4+cyUlZooXLIN5U6py21rtoMUOyZ28kuGCEQ4od5y7q9FP8etiBKwfTmEPLH+N87XQ5
 P3GXHaBynvv3Jpx4hesjXg6m5s8bzc6KgeFVm0MbvCxLdXvCfWS/mISMR3PbKDldvHT7SsF
 xy75mn8XNDqovZOKP2ThFAYbJs3nGsL3r1TfeLjgw7aGppMl2o5CZe8EeSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794429673; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=l5s5mjDwH4MmiZfdgGusyFoAW8kVOLNRcUp5vNbEtB4=;
 b=XjnSxYUgrZRFsBBCT49ZDxi7OPRDjX549ctn1NsOb3Dsz9GHZD5AUKq+BGJsYifatE+Cj
 L4+7YLxM9yssVPMP3nNxD5Ts5FVTL2kKtLOdpL721F3/DveI3jEo4rb/nHHTlziD3578duD
 3EdkTAB6cc/Cf/iuUSb9oUGi5boneOyQPTizMFSlDzHwrr7nZjhZEELMSQlRrcTlh1bQcdz
 YXK9SV5lVykO2yLpLIu1MdY4vAtThnGB+dfONuXueJ4fubWUnCjV9bZLah5stPLTQTVHBXg
 +wuNKExqjvMH1havTFTmA5NEZvJFq6xt/wnIRC2J+yk1jl+qHwuFwJD2MvcA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9452B4920D
	for <nouveau@lists.freedesktop.org>; Wed, 11 Nov 2026 20:41:11 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B238D10E459
	for <nouveau@lists.freedesktop.org>; Wed, 11 Nov 2026 21:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794430844;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=l5s5mjDwH4MmiZfdgGusyFoAW8kVOLNRcUp5vNbEtB4=;
	b=FX9KeLbH5m7IfY7iMuR9pnsSG3pM2Fd2dX+WKZzoIPNO+g3Vweff5ZdvpM472BQ8vNUKZS
	Ad48WppIv/xlYogJ6NLs0gMjiu7Dwpj4G1YEZvyp4vuj+9V/CPwzwRHniuPZ5VQ8W7KZWZ
	GLV4AbSvpjrFDM1RiLF7n2vHIHNvAjY=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-O8RLwGNVPX2sxgo5Nqcciw-1; Wed, 11 Nov 2026 16:00:43 -0500
X-MC-Unique: O8RLwGNVPX2sxgo5Nqcciw-1
X-Mimecast-MFC-AGG-ID: O8RLwGNVPX2sxgo5Nqcciw_1794430843
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-5339739b343so72269731cf.2
        for <nouveau@lists.freedesktop.org>;
 Wed, 11 Nov 2026 13:00:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794430843; x=1795035643;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bfwzc0Soc5yMmxMHyRdKnO8B25Ja28l1t2oGS6mpFwU=;
        b=x/3PbtpsJjeIEiWt9drJ8rPx3J8TwlkWNZxClTr0DpbCOjXiFWI2Yx5y3+1RPehkqo
         vjmo5NbzFm9yDnP9IR6GgScQy9zmDgauwvRroTbnJWYOgEY8oQH9BSMPyyxIfLav99Sw
         DY6AukxzIBVsonfXBGyx726QhpIq+O0nKaK2Iq/qHY4FcLFUBb3w0juLwsTTefvbR1xV
         4nm3D4feDI2GCITrAut43wFy3bL0tiCkYyb5kfEf2pKOANHIimIBe5MuVYXs6fDnRFaN
         QL60/8AnInBjNPzIOBDZCLi4NHKq01uAjYzoZWPgwaXi3p40sk3wD7vn9TkOLKvsWMEj
         x6Pw==
X-Forwarded-Encrypted: i=1;
 AL+hErHJaQ3fmi9T3LAFleBBtyEui5PmSol2ctq8Sw0tuZVDu4sIBffE3a53s+mNHK7qEEw71SRzKMhI@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+BJ4AzBjIBxfHe/IzRT7hxAwKXfv8BJUxK0rF6JWc1yenkQ1/K
	j8flna3NJfX8VSYwdTGPeDWCNPu7RWQBVm4DsadSXbY+b6qfOGUjrOlO7IvWbsC3WoDVXCTwg4x
	K/UiC0J27yvOaqNMVwyJ1TGJzdl4RYqqpnzrjrsLu6gVnsf0fpvICWXzRiVvkk8JUi+A=
X-Gm-Gg: AYBFou3jdoLdC/0mJXoYs1t8rI5Kdw/BhF4jCYiPQlmg3RWB6rMGQC9r+Eh/wQgz0t5
	OUt6CSSRHBbTF+XsKDlPfvTmOr4yFRWkhJF2u7DhZLjLOoYJHQ8AGXS2Drcru1nBVv625sjcDFk
	L5aSh71kN5eXRUXJCim7m57WzI7NvDbsQHgFJQKk9wPzV+p9yRvFM7Y4ZHw3u8xAPUifl3aIn1O
	RlPBgRXwG1wE+qXsdQPoDaGQhiBO/BEcN98Oh7azjYKg1PmMdvyxEq4YE2co+zJpDO8WF3eMUDe
	vOMjkoY5Tx8Zpu7NZ0VnW6NkeB7Xo9umY6MwRNZOlT2M430rrbJTnehAQenS/hejpXDt0Bp/CNu
	nfo+MbbWVjnGgGcWGwFt5y630taItQBi+ZV/gppNlCmeUQ9ybFJ4YxIphS1L8YF4uDMmyP4zrGv
	AmEqK1RQTEiY3hEA==
X-Received: by 2002:a05:622a:590b:b0:536:663d:18ca with SMTP id
 d75a77b69052e-556c0ea966fmr54823211cf.48.1794430840086;
        Wed, 11 Nov 2026 13:00:40 -0800 (PST)
X-Received: by 2002:a05:622a:590b:b0:536:663d:18ca with SMTP id
 d75a77b69052e-556c0ea966fmr54822201cf.48.1794430839462;
        Wed, 11 Nov 2026 13:00:39 -0800 (PST)
Received: from [192.168.5.11] (pool-108-49-8-41.bstnma.east.verizon.net.
 [108.49.8.41])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91f03ca6548sm29611306d6.9.2026.11.11.13.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 13:00:38 -0800 (PST)
Message-ID: <5b9d4fa7e29fa7ef780f5a6386de6ce9f6ee7bab.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/disp: Set
 drm_mode_config_funcs.atomic_(check|commit) (attempt 2)
From: lyude@redhat.com
To: airlied@redhat.com, Danilo Krummrich <dakr@kernel.org>, David Airlie
	 <airlied@gmail.com>
Date: Wed, 11 Nov 2026 16:00:35 -0500
In-Reply-To: <20261111-nouveau-atomic-fix-v1-1-118e65d3a2f5@redhat.com>
References: <20261111-nouveau-atomic-fix-v1-1-118e65d3a2f5@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UE7UNUaxLuTDNQlklwm6dWqquFCtCO9CPwqtKWqBIDg_1794430843
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: BIEQ7P5DOJXXZHI5MYTFEJV4PKGY733N
X-Message-ID-Hash: BIEQ7P5DOJXXZHI5MYTFEJV4PKGY733N
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Ruben Wauters <rubenru09@aol.com>, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BIEQ7P5DOJXXZHI5MYTFEJV4PKGY733N/>
Archived-At: 
 <https://lore.freedesktop.org/5b9d4fa7e29fa7ef780f5a6386de6ce9f6ee7bab.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2026-11-11 at 16:00 +1000, Dave Airlie via B4 Relay wrote:
> From: Dave Airlie <airlied@redhat.com>
>=20
> commit 604826acb3f5 attempted to add these flags but
> commit 6c65db809796 reverted it due to it
> failing on hw from pre-atomic times.
>=20
> So use a second set of functions.
>=20
> original commit msg from Lyude:
> "Apparently we never actually filled these in, despite the fact that
> we do
> in fact technically support atomic modesetting.
>=20
> Since not having these filled in causes us to potentially forget to
> disable
> fbdev and friends during suspend/resume, let's fix it."
>=20
> Reported-by: Ruben Wauters <rubenru09@aol.com>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/517
> Fixes: 6c65db809796 ("Revert "drm/nouveau/disp: Set
> drm_mode_config_funcs.atomic_(check|commit)")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dave Airlie <airlied@redhat.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nouveau_display.c | 11 ++++++++++-
> =C2=A01 file changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c
> b/drivers/gpu/drm/nouveau/nouveau_display.c
> index d71dcfc6ee66..07882624a7f6 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -354,6 +354,11 @@ static const struct drm_mode_config_funcs
> nouveau_mode_config_funcs =3D {
> =C2=A0=09.fb_create =3D nouveau_user_framebuffer_create,
> =C2=A0};
> =C2=A0
> +static const struct drm_mode_config_funcs
> nouveau_mode_config_funcs_atomic =3D {
> +=09.fb_create =3D nouveau_user_framebuffer_create,
> +=09.atomic_commit =3D drm_atomic_helper_commit,
> +=09.atomic_check =3D drm_atomic_helper_check,
> +};
> =C2=A0
> =C2=A0struct nouveau_drm_prop_enum_list {
> =C2=A0=09u8 gen_mask;
> @@ -654,7 +659,11 @@ nouveau_display_create(struct drm_device *dev)
> =C2=A0=09drm_mode_create_scaling_mode_property(dev);
> =C2=A0=09drm_mode_create_dvi_i_properties(dev);
> =C2=A0
> -=09dev->mode_config.funcs =3D &nouveau_mode_config_funcs;
> +=09/* this only gets set if the driver has the ATOMIC flag */
> +=09if (drm_drv_uses_atomic_modeset(dev))
> +=09=09dev->mode_config.funcs =3D
> &nouveau_mode_config_funcs_atomic;
> +=09else
> +=09=09dev->mode_config.funcs =3D &nouveau_mode_config_funcs;
> =C2=A0
> =C2=A0=09dev->mode_config.min_width =3D 0;
> =C2=A0=09dev->mode_config.min_height =3D 0;
>=20
> ---
> base-commit: 067c5c24cef23d913b67eaaf71ae67e7169a6620
> change-id: 20261111-nouveau-atomic-fix-7478260ce6a7
>=20
> Best regards,

