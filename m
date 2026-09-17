Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25FD4C88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:15:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D3A3210ECCD;
	Thu, 17 Sep 2026 21:15:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YzXvRGXp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BAF4B48258;
	Thu, 17 Sep 2026 20:58:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789678685;
 b=FmkmeeESsVr8sq1Pie9NT9gTQBcZjEn0BnCPbZ/0i21JXdVB5bOOS7aLRUKPYm8LlZnZT
 lyHbSDif7Q5imxbpYpApbzGZnee3XhfcUnkGYsZ2Chv1NWVHG+45K+Xi3Z8zZXU4xGZcUi5
 FWSePCrcpAmB+7f3CjCY/Anom6t5di3xlUHq/vWfp3pceJXjzrj0IIvaqasFuzLvn+Tdns8
 GH9CK0ugl7hYgn+8jeeOFk2MlUNOpWMn5EO0lrLkoCwimXE9TZxrjtVTgVaDyDoqNbjs7aV
 3ewVm1fBDqFof78TSF1X+n0TMKrpxINKMjWS8Gq0EWQ4sDhG+/o2b0petbuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789678685; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uMX1xa7O2baIigkolBDenb0sPwHls/I6ce8sNPUkCdY=;
 b=R+MWyvRA5JD1c2XuKkrI4BJwbV8iZaxOt7y4viRv4A3NUSlj5BLn6K2bw7X3VWcx4MkKU
 MS0y2VSV8wCROb4dTajnPHqZPHAY6KV4noqtBDX6Ki1X8x4CmkxCUFDUiqvS540YBC7JWny
 UI+xn3kP6/TFXDqJ4xY64EL3r2ZSTHMSzQP35JFbtC+ftSjTWSugFTKlGTFCSn9kJ6VFcwB
 qevA+bEa+xRDB7UcMhXM34+p6ZFTUkN4nqII9CouOmDY7+GlkLiE8US0Ya6/xZDDEZlkHwu
 /94KSz5gqP4ik3uRivYraIaiTCHSzCczlUZebWpSLYZUp5BeUgc2tf7oenuQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B3F06481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:58:02 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8423910E769
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uMX1xa7O2baIigkolBDenb0sPwHls/I6ce8sNPUkCdY=;
	b=YzXvRGXpn0uaWGr+MviBtFvj4OJVOHt6tSok5Db5msZHHmxHWGN2JmJkjSwtD0fsUEkiOd
	tOIjPC2LjWbfmRpFMU6Cx6s9aMIdHZODgQwtL8uUHdTKyRo7aVU0orZG0T0u51M4tenxKO
	L2WnBHHDcvS0Dmlnbe1uikCALnwoWxE=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-586-BdVjPHP0Ps2cpxVUMncYgQ-1; Thu, 17 Sep 2026 17:15:38 -0400
X-MC-Unique: BdVjPHP0Ps2cpxVUMncYgQ-1
X-Mimecast-MFC-AGG-ID: BdVjPHP0Ps2cpxVUMncYgQ_1789679738
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-93a08ff8451so9343185a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:15:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679738; x=1790284538;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :autocrypt:references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FcHAxEYZKIcFoVqZlfPkF3Bn5KNnhL0CKGPEHukkwQU=;
        b=VuBeWinhXD1adVDCiwAv2q54tPZnTD7jRT8z7MW+KPsf6GjH22RrHXBPIyTAve/KNY
         C/XN3MYdZdbhSXHN1LDpWgypMNA0YMFx4UN4eTHDC4YmCVucPF7fd8t3tXryFDaTlVIk
         gVwhVtbZGgoGhzIJXuLaW1ooyytbbqnbX2pevakmDOlGK9p6b0bCQ51Ff/92gQeG06w/
         SmnVr/9rUGakZHnxyZsGirlKX4XCCnJJw6IqU2fEenk8TBwHI9fEsfiOChZPrUO0SSel
         Vyhq5PqC8+WVNDrcOp8I5CtMwp8VEQgmb7erhd/eHe0Lar8A5w1EN6agvIeBCQT8NAgv
         0M7w==
X-Forwarded-Encrypted: i=1;
 AKwUvBxLFBtrfi1oAsMvDMhwXHk2PhtQZhP1rgkYvpT/w1HgJKijGvxRHLKhsJ+QnN5GebbpqpRJJCv0@lists.freedesktop.org
X-Gm-Message-State: AFuF++lbIwqaPsKSmlUCKCpGqUbe0yFbwARjfBE3iYOdXPygvLq+NpcH
	j4yFHzQsKEa4Vm4Kazw4ef0xaK/jQnujPJ1aWZFczVD7B1JwwPQd0NztjAduyLq/jwWixfynbm1
	MCn/4YtzS/8Of5W5Q35wIzv6qUrzvMALDvDSM5O9I6KfcJJI/qZDQPOsWkxfzcbp5KrI=
X-Gm-Gg: AYBFou0jrIhRXV6hzpuySbmRH4aebQT9JMySk2qI2FnE1baj76dpGtfE0YVY6axmkMg
	30wkPhdG9Kh77YKXLe9biMn1YGDItJ3hzlxnLY/COW6r94My1IGe3RflnzgfFx3hcEnvLtf/F3a
	fxUfFLvEjv/764U2vr8FfZBmT1zKZ4oMeg8iLhvU13T+L+2n5XSgTkGJYw6+25DjBfGbGUX9Lq/
	+PV9tlH+9LsaMKrJ0241XTvNg2Bk0cWdy0imbVBMgSntXiNWm5iMj1hMPLH30b4LC1xT7z68YeT
	jgVYbt1jYih1+iTJny/pX+ijKOfXkjYMAQRyXOVqaVd3/ZoL9sGoRK/+pDGib9YXPkDodsJd
X-Received: by 2002:a05:620a:6288:b0:93a:14c:3296 with SMTP id
 af79cd13be357-93bdc64eb85mr39107285a.15.1789679737755;
        Thu, 17 Sep 2026 14:15:37 -0700 (PDT)
X-Received: by 2002:a05:620a:6288:b0:93a:14c:3296 with SMTP id
 af79cd13be357-93bdc64eb85mr39102785a.15.1789679737318;
        Thu, 17 Sep 2026 14:15:37 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b780ca630sm542828685a.4.2026.09.17.14.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:15:35 -0700 (PDT)
Message-ID: <67d769ba8addf5a1c4aa052fa5907453a0d5f529.camel@redhat.com>
Subject: Re: [PATCH v2 4/4] drm/nouveau/clk: don't clobber reclock status
 when restoring volt/fan
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 17:15:35 -0400
In-Reply-To: <20260712123616.1180830-5-postadelmaga@gmail.com>
References: <20260712123616.1180830-1-postadelmaga@gmail.com>
	 <20260712123616.1180830-5-postadelmaga@gmail.com>
Autocrypt: addr=lyude@redhat.com; prefer-encrypt=mutual;
 keydata=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
 8doKQgPpApRcFGaE=
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: t_BJCoc73TPFqGhRuB-WUlVeWriYl-xZFbSDZC8rNLY_1789679738
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LLUF7TQTOJFNRCLMXD72A2B5LXSGQICO
X-Message-ID-Hash: LLUF7TQTOJFNRCLMXD72A2B5LXSGQICO
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@linaro.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LLUF7TQTOJFNRCLMXD72A2B5LXSGQICO/>
Archived-At: 
 <https://lore.freedesktop.org/67d769ba8addf5a1c4aa052fa5907453a0d5f529.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sun, 2026-07-12 at 14:36 +0200, Francesco Magazzu wrote:
> nvkm_cstate_prog() reuses 'ret' for the voltage and fan-speed restore
> calls it makes after reprogramming the clocks.=C2=A0 Those calls almost
> always
> succeed, so the status of the reclock itself is overwritten and the
> function reports success even when clk->func->calc() or clk->func-
> >prog()
> failed.=C2=A0 The converse is also true: a successful reclock is reported
> as an
> error if the final restore call fails, even though that failure is
> only
> logged and otherwise ignored.
>=20
> The only consumer of the return value is the error message in
> nvkm_pstate_work(), so in practice a failing reclock is simply never
> reported.=C2=A0 Nothing else changes, but a function that returns success
> on
> failure is a trap for the next caller.
>=20
> Keep the calc/prog status in 'ret' and use a separate local for the
> restore calls.
>=20
> Fixes: 3eca809b3c05 ("drm/nouveau/clk: cosmetic changes")
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 16 +++++++++------=
-
> =C2=A01 file changed, 9 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 4d546b07f..05336fc7d 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -199,16 +199,18 @@ nvkm_cstate_prog(struct nvkm_clk *clk, struct
> nvkm_pstate *pstate, int cstatei)
> =C2=A0=09}
> =C2=A0
> =C2=A0=09if (volt) {
> -=09=09ret =3D nvkm_volt_set_id(volt, cstate->voltage,
> -=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pstate->base.voltage, c=
lk-
> >temp, -1);
> -=09=09if (ret && ret !=3D -ENODEV)
> -=09=09=09nvkm_error(subdev, "failed to lower voltage:
> %d\n", ret);
> +=09=09int err =3D nvkm_volt_set_id(volt, cstate->voltage,
> +=09=09=09=09=09=C2=A0=C2=A0 pstate->base.voltage,
> clk->temp, -1);
> +
> +=09=09if (err && err !=3D -ENODEV)
> +=09=09=09nvkm_error(subdev, "failed to lower voltage:
> %d\n", err);
> =C2=A0=09}
> =C2=A0
> =C2=A0=09if (therm) {
> -=09=09ret =3D nvkm_therm_cstate(therm, pstate->fanspeed, -
> 1);
> -=09=09if (ret && ret !=3D -ENODEV)
> -=09=09=09nvkm_error(subdev, "failed to lower fan
> speed: %d\n", ret);
> +=09=09int err =3D nvkm_therm_cstate(therm, pstate->fanspeed,
> -1);
> +
> +=09=09if (err && err !=3D -ENODEV)
> +=09=09=09nvkm_error(subdev, "failed to lower fan
> speed: %d\n", err);
> =C2=A0=09}
> =C2=A0
> =C2=A0=09return ret;

