Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A227DC982D7
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 19:15:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E095810F4CC;
	Fri, 18 Sep 2026 19:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Bq96xx+C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B8C2248305;
	Fri, 18 Sep 2026 18:57:55 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789757875;
 b=MZqGiXCIzrjlv2KLb6PEuvYqQA0HJ/KFyz8znzaKMMsGonuGTHDvJgiJ36dazW1uO/9YQ
 yKOZBp4pgmv1QRoviVVhSfmIcXmJlFwOjKlG49ncf4NHVf7+Ir+EstXlvmf27KdlZokM4Co
 Z/qi77AA7NFnDrAUKlnyah2ngRiQ8QjwexMb7ePHQYAaDRirtYADqyFbwBTUxfvzfksjGZc
 dbeoF0Z2xFbLNHmiDUxbtRshM00KxTI1R0czVBFmsBzN9tPOGWvnq0NRxkWvZcWe8GkZ3wt
 33TZmzyIOdBW8mdJakGmhx4LQApZRO/s/BUTkEgSQyS2fkjS7T2mCDKovLjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789757875; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
 b=UM1JXQwM8ywEvZ9bbjRA2x6vVFofbi1Z4ibATiqxUH4hbZBqSAD5SYC3XEGshRFusdnEk
 G4qZFqIhXuji378OJAgNdNJr1s/GpeyWuPOjdkSVVgva/WFpbkFxDeFliVY5obvK+n0oPoQ
 +4vCbAD7GEKqSFzKPwKLA4BAlRAAaZf0d/jrZvcoEBdDCvsJbBkliC3Mg7IT5IDE/LpBlPx
 Jq09lSir8j/FOU6XkM4cg8Fs7lFc1YnvelxUzUZROuWYE9itH9C4BD9d2Z2XNIjYR+clbwV
 5jsxbidKosMonn0tylKFeXja/0pkyu/I8SW3SX0BNQ2injS1FF0iVu5RCGxg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 28CA2482F8
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 18:57:52 +0000 (UTC)
Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com
 [74.125.231.76])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB1410E155
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 19:15:32 +0000 (UTC)
Received: by mail-oa2-f12.google.com with SMTP id
 586e51a60fabf-469fdb78b1cso883741fac.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 12:15:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789758931; cv=none;
        d=google.com; s=arc-20260327;
        b=hswgUD3RwQ4dF79pVnpZdsShWKvYUSDCONfyUXOSGasF1/VVbqv0D15GwkpLkpvkZP
         m6X2pHfMbF6LukKqtNUip7w21hH80qJkM+5uiBaO3AmAzd3kPTqoi+T+6PIVZLh4UIpN
         f2UoF+60SZ/YlAqf0WMCS82tOBScMoBF+9R5n0EVaxiwTlqaqJCY+a5p+vuzYfoI+1nm
         x1BwPlPTgZo41nG5SYuJssVVZwdobaHH9ch5wIVL1um8LCO67xPsN6J9FmSd4tWUvfmM
         txdRgbKUsDUrF59IRZJS1NXkWZuKOc344CdmFNtu3T3XbNfCPJ6xzEyfTN9dUBP/N6lO
         GSww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
        fh=wv0/vO4vh0TIlPnTouGM2TCYIua6XG8dNwLAW5UA1Cc=;
        b=r2mDsKkRrEPc0girpllGKhXzBOYNTPqAt+4MelUzXkdBqpRQy86Si/hVb7L99GJckV
         2L0bAPljug+eli2MSis5vMo/A1DjvCD1RCev+nxS/tZN7ji6trjDb+DNFavKEjVeIRPl
         bmrDuiJY8apThHYc1j399IHGpYzzR69Wz5d25u3xxeSGX8drnnIsmEMI6im0Nzf6Y7px
         zbiOBHu7YrqbaobB7m7ySzV6X6xGKRmQbX9VPPlYU+FURIf9u7lb02X5MhpLnb8kLy77
         T6SAu2BebLa6BPJF7qe9eu/4rZtG+Vq8Js2fOyk9ePGstPjU9UHGyqbM+zt8BbOTWPG4
         exaw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789758931; x=1790363731;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
        b=Bq96xx+CS6niqKJ/GQfskNuyPpwdGpKo+pV3vfg6Ec0UvsjiyMyN7tVNVvndHd0D6P
         YN7QRZTVYl6WA/HPF1yK7gRoSJfZuRfbJBDV4MHUjX8kKxYlXWZov4M7rHJXaQicyACq
         vJI7k1wHb8m7yHsFr02cz1iIAQi/znBhz9vgeZCtGb7nOpcTMrFTVLnDvp86IeXFS6aF
         wAPl/1VNhIiW6nwVOs3UazKbsXx9XxIOof7wuh897Sw/69CJYxhFcoZELa2I/tt/b8wz
         VzwWsgp/Y9FdD5e4PLqRjdjrnTynWlRGaZI3BlijhyRrPs/MzNBETnlkVhcglHgSBtRb
         iN5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789758931; x=1790363731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XvJsVfQVMx1/qqFKk/K/i5edij8GiQUxYcPFjKzVNws=;
        b=ceX3tntkDleZdjOyr44GbIt5zVcaNovX73pT5bo9txGsEYRDx6TGJBa73H/WfzVFtR
         cZzfPi8BVHWcZgIgRsMze+Ad3oDq40NrvIaa5Piv0Ab5jX5LmMm2Ef9DxTl2Vu2Lh/DO
         3xubAnbcm/KDm/d+59jP5q0aENKE7cbElF5HOo6lKE8qNuasSP+GfOTU48p64JoAy+FH
         kiIXTgf6XJD59JJ+FZwIZRtu7qd3Gu9yCgsRVCJvMwahJoBfWa/n9y3HSmUdun1f76zC
         Wz0HTDEszgkHN8gtfMLGiO3e4Esxjf4yBMjoi0kBcL3U/JgRBz0XtFPeUhMxFbE0vn4O
         TcCQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBydGY5E92QrKfoRob1DqcGec6XmnvPVdpfYC8Ev1lfPusmY3yz/rRvDFqCYDUht9Cm6A4+vO27G@lists.freedesktop.org
X-Gm-Message-State: AFuF++lrY22ULAAx6pi9xPQXqS/ObwSXQueUF3xAhjLSJgILOKN95nqY
	ABEIklfrRY9uGXFALoHRPIaN5kVPiN3Jk+pHHAF3KZfVsPw4qunRPN9v+n+KCLNKzNoBxxKpTdM
	oOZYsGXMaeVYk+JZnEjKvgIZoK7pfHLk=
X-Gm-Gg: AYBFou3xj9H48FuFkVz+zZwMBweUptX35sVMSd6u1IVMJCBc+++9ypetEi+mugBwwdE
	KoMAZab3ChmQiW2cz+ekcPkQs2n0dUF3cW3neCu4nMI5w8BRI7SawXYvDEu+sW3UDVvo2nTYix/
	C356o+GYs2QHQy1mld/odHEXLUAerjMqY+t5v4LXFvQhWWLo0+MnCe7xAej7QtE4bYxu1ycH3x6
	tJ5UYLri5LayaFT4NGLiCLfjDhdKpKC0IbRzR8bikMQH7cPCbhHM2VdjgnMM2A0cOoeatWo1cIv
	21BV+yVfE36mNki3bMcOz0vUSbwlZXb6H+j4ho217a9lnAUdOBiT/DjofcUEZm/Ht/AU5OfHit5
	TDgIwjTZCdv5YKOZ6u5lAurACrEtcb9LgKio7h6i8YQzaJqo=
X-Received: by 2002:a05:6871:cfc6:10b0:487:958f:e35b with SMTP id
 586e51a60fabf-48795900e6amr1424971fac.34.1789758931211; Fri, 18 Sep 2026
 12:15:31 -0700 (PDT)
MIME-Version: 1.0
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
 <20260917215114.1136715-1-tano.dzhinski@gmail.com>
 <f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com>
In-Reply-To: <f8a34420ac2bfadda23ef6812933ae64510972e4.camel@redhat.com>
From: tanodzh <tano.dzhinski@gmail.com>
Date: Fri, 18 Sep 2026 22:15:13 +0300
X-Gm-Features: AcwNN1WoeEiIJqasT-7K-vP0zJa-u7OJgPUeY7USwoX3XqPRXTuUa60V6-sDLws
Message-ID: 
 <CAJhzm--KvAUbTxpMMmy_ye4mYfJOViHJ21SNONqdy_Ab55oXPA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
To: lyude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: HK5YD3AL7RVMNKIP3AI7THKLXN2VY4G7
X-Message-ID-Hash: HK5YD3AL7RVMNKIP3AI7THKLXN2VY4G7
X-MailFrom: tano.dzhinski@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>,
 Giuseppe Ranieri <giuseppe@ranieri.dev>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HK5YD3AL7RVMNKIP3AI7THKLXN2VY4G7/>
Archived-At: 
 <https://lore.freedesktop.org/CAJhzm--KvAUbTxpMMmy_ye4mYfJOViHJ21SNONqdy_Ab55oXPA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Sounds great! Thanks for the update.

=D0=9D=D0=B0 =D0=BF=D1=82, 18.09.2026=E2=80=AF=D0=B3. =D0=B2 21:21 <lyude@r=
edhat.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will push to drm-misc-fixes in just a moment, thank you!
>
> On Thu, 2026-09-17 at 21:51 +0000, Tano Dzhinski wrote:
> > From: Giuseppe Ranieri <giuseppe@ranieri.dev>
> >
> > nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> > straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is
> > no
> > hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> > configuration with -EINVAL, and nv50_hdmi_enable() returns before
> > hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
> >
> > The result on such a card driving an SCDC-capable HDMI 2.0 sink is
> > that
> > HDMI audio silently stops working. Video is unaffected, and nothing
> > is
> > logged, which makes the failure hard to attribute.
> >
> > SCDC is optional, and the hdmi->scdc() call further down is already
> > guarded against a missing callback. Requesting it on a card that
> > cannot
> > do it need not invalidate the rest of the HDMI configuration, so drop
> > that term from the condition and let the existing guard skip SCDC
> > alone.
> >
> > Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config
> > method")
> > Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> > Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> > ---
> > v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
> >     (he posted this fix to the nouveau list on 2026-01-17,
> >     https://ratatoskr.run/nouveau/2026/01/16963412), per Lyude's
> >     review of v1. Added Co-authored-by and Tested-by.
> >     Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW2790U.
> >
> >  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > index 377d0e0cef84..9887b3898505 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> > @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void
> > *argv, u32 argc)
> >
> >       if (!ior->func->hdmi ||
> >           args->v0.max_ac_packet > 0x1f ||
> > -         args->v0.rekey > 0x7f ||
> > -         (args->v0.scdc && !ior->func->hdmi->scdc))
> > +         args->v0.rekey > 0x7f)
> >               return -EINVAL;
> >
> >       if (!args->v0.enable) {
>
