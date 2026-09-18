Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A00D0C982D7
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 18:21:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 64DA610F4BA;
	Fri, 18 Sep 2026 18:21:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="i0/kmMTe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 48255482FF;
	Fri, 18 Sep 2026 18:03:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789754619;
 b=Uw81PCI5JTwtL6cmZ+2Cb0DM71sVO0JhlRvDq+ziZjbnHenG/Rz6o9rJPDm4tFSWkVhgi
 uCrux1N/ZZ4zq+cQWgWadJEuMrz8Sqzy7ROtUNvleWuVfJWRqSjurUC98KFq0ybCVacTmtH
 lg5a0hIiYt8SknFuFUV7J5ZYFWXAaDmdvmgUVTvo/NxNXg+9iX9uJppX7aCSOTL1eAGVzom
 FKtv6+aJEVVzOMQuiOXidVfWvyRov9faDjTUdUUIqeydwEJbY21ssfec5VZqzUtANoyZMPK
 ydKv50El44mJ8X7DSBaOCfhMY6ympqX8D4ufMF891v5SuZ+W1mDMJk8ADlNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789754619; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=k/1tWvAWMwG+jeahQKpHn1GFF3Dz4eA11II+ymDKsVo=;
 b=wgTFUJdodA5NhfFb4LcAWArip/3R5CMBTlHgXwfXtWLYkgC9RJPopqXIsOnWda3W4uZmZ
 GNIz7caTObLxD+A01UMlRFwgo+z2odJF49PuwdM1wOkKEuru5WpnUVjBMFZJTEvkI/Cp/DC
 K617P+ewmHXJIpSzY65/vdI/g33SyRBNAgR5K1MxPA2bcPV9lQqTMrvfwvAu8bTx/Cq5rLs
 5X2Q+lY7XzBm1c/v1sSsBMwGAM2P3pMmvZpXBb7smwHbIDu3w6JzUpeUxJalh82y2plOCRL
 fkLWZBnyXohN7mj6A04aVvmZftrqfDfB28kNl+JWZ9+rL56KPKyCXUhmrXdA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 95845482F8
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 18:03:36 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5633B10F4B0
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 18:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789755675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k/1tWvAWMwG+jeahQKpHn1GFF3Dz4eA11II+ymDKsVo=;
	b=i0/kmMTeEKWFkKsxMol9IAbJeEbhA1dx2ig0/wKKz4ffBs835za5DgtylaS6u5GD0JcpBU
	Md3h9uzPbxHr84GvJUSLw0qfOVAvvXMQ8F91BLaGaoVkaz/xigxV1do/hokal400Ahf3+o
	o7II8ad6H4OOjpJAIDjD7kAbQE1LJY0=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-6NdWi69sO_qLB0FTy18hFw-1; Fri, 18 Sep 2026 14:21:13 -0400
X-MC-Unique: 6NdWi69sO_qLB0FTy18hFw-1
X-Mimecast-MFC-AGG-ID: 6NdWi69sO_qLB0FTy18hFw_1789755673
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-912351b220bso18673966d6.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 11:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755673; x=1790360473;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2S6whF13bO6Q8rMa62A4PVjJyOAlHhvbqnUwD5kAdIE=;
        b=Zyi3sLa0SXjB4LeZpxIpW6Ve3lbiREgQnz5upGhH8Ab88f+cNkbn1nA8lW3WW2zvGX
         E0EwpVbHLeUQx4nzEJxwUrpiBSTBVIOzwJR2digBGuK7ylCNo8I3zvxtuIZBjsesShpP
         PFFYP4QyKUgVSe6mFSVe3xgDZ8IBIfXw/zSfXYppBgBZPfIwcmV1qOCOXe4qMH+3wLIA
         byrbb3YimtX4xUhMGUxUmC/EIvad2YgKckr/YXVOTCDDa9Pn1HytWCujKfDQ+MTqAZHy
         wxV4nAVzDfMamaHEgxAqfOEQKQ45YK+ixE4MGsxrIR7vu1qXRCERBDUAiCMhYMq8etOq
         WZSg==
X-Forwarded-Encrypted: i=1;
 AKwUvBxiOPA+jfSt4Wv4VjjU2GNwo+dYXxkHTxfMnUTA87A90nmUorNfeEeUrNgg2IxSOUDIjLeaq4j0@lists.freedesktop.org
X-Gm-Message-State: AFuF++mUH6VmdNHPoC1vrFQr4vJmb1PUaD+mWKvZOKGUp/PxaDt7yWso
	l94HzPiKEEPCRoC2YoHLXz+spwtM/fRXABaMwHxqBUrRZOp6iO3tnmFb4bB0kUebXkmd5xiq/Yb
	stAzJ4/8vASVmoI6OXn1EcznwpUM425gqp9PYsrUbSexAL+4uX937xoffvBPjxxDb2RU=
X-Gm-Gg: AYBFou2CcXiocDuT++/mY4HormFFPR3TzyhFVILtuV7QA3GZuwzVgU7tc/nNSTO0Q5p
	QEczT2+aZnRnuZ9aahmn2umKMutQCe5GmxWY+r7hCHEJkn4yoPiHcvEmeS1uoW2dZsJNlu9Hc9Y
	qQvYJ9f/plFD7Pw5x74p1JwQO/isc0XgxficAV01N9hbe8SChjkeAIgvY4QonKtlWL1eMWzu87i
	nETW9xZHPHpj/HdYIkGY35tU4ldY76lnEHBrCDS2+RZhbbHozdSPxgI1uWP65PfpeEyVDL1YLA5
	s1z+uqx9ABFpGDMj7tcOvpVfGFKOBxVjPH00bjAL1xc5bx9xJDIuof1EGDk6srpCdNZBz8Eo
X-Received: by 2002:a05:6214:20ad:b0:907:be64:6b76 with SMTP id
 6a1803df08f44-91254e8dfc5mr49888416d6.12.1789755672491;
        Fri, 18 Sep 2026 11:21:12 -0700 (PDT)
X-Received: by 2002:a05:6214:20ad:b0:907:be64:6b76 with SMTP id
 6a1803df08f44-91254e8dfc5mr49887826d6.12.1789755671848;
        Fri, 18 Sep 2026 11:21:11 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91260a85c7bsm1762376d6.32.2026.09.18.11.21.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:21:10 -0700 (PDT)
Message-ID: <f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
From: lyude@redhat.com
To: Tano Dzhinski <tano.dzhinski@gmail.com>, Danilo Krummrich
 <dakr@kernel.org>
Date: Fri, 18 Sep 2026 14:21:09 -0400
In-Reply-To: <20260917215114.1136715-1-tano.dzhinski@gmail.com>
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
	 <20260917215114.1136715-1-tano.dzhinski@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: q0Zb7BQxkB-Vu9gUfKIqkec9PluMObPZ6tiC9S0LCYA_1789755673
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OU3L5HV5K6ZKG3ZB5LGSAQPLAJYSY6HE
X-Message-ID-Hash: OU3L5HV5K6ZKG3ZB5LGSAQPLAJYSY6HE
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Giuseppe Ranieri <giuseppe@ranieri.dev>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OU3L5HV5K6ZKG3ZB5LGSAQPLAJYSY6HE/>
Archived-At: 
 <https://lore.freedesktop.org/f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment, thank you!

On Thu, 2026-09-17 at 21:51 +0000, Tano Dzhinski wrote:
> From: Giuseppe Ranieri <giuseppe@ranieri.dev>
>=20
> nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> no
> hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> configuration with -EINVAL, and nv50_hdmi_enable() returns before
> hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
>=20
> The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> that
> HDMI audio silently stops working. Video is unaffected, and nothing
> is
> logged, which makes the failure hard to attribute.
>=20
> SCDC is optional, and the hdmi->scdc() call further down is already
> guarded against a missing callback. Requesting it on a card that
> cannot
> do it need not invalidate the rest of the HDMI configuration, so drop
> that term from the condition and let the existing guard skip SCDC
> alone.
>=20
> Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> method")
> Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> ---
> v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
> =C2=A0=C2=A0=C2=A0 (he posted this fix to the nouveau list on 2026-01-17,
> =C2=A0=C2=A0=C2=A0 https://ratatoskr.run/nouveau/2026/01/16963412), per L=
yude's
> =C2=A0=C2=A0=C2=A0 review of v1. Added Co-authored-by and Tested-by.
> =C2=A0=C2=A0=C2=A0 Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW27=
90U.
>=20
> =C2=A0drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> =C2=A01 file changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 377d0e0cef84..9887b3898505 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> *argv, u32 argc)
> =C2=A0
> =C2=A0=09if (!ior->func->hdmi ||
> =C2=A0=09=C2=A0=C2=A0=C2=A0 args->v0.max_ac_packet > 0x1f ||
> -=09=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f ||
> -=09=C2=A0=C2=A0=C2=A0 (args->v0.scdc && !ior->func->hdmi->scdc))
> +=09=C2=A0=C2=A0=C2=A0 args->v0.rekey > 0x7f)
> =C2=A0=09=09return -EINVAL;
> =C2=A0
> =C2=A0=09if (!args->v0.enable) {

