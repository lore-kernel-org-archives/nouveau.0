Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FF9C982D8
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:56:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBC4310E4D8;
	Thu, 17 Sep 2026 21:56:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cqWJoRLt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9C4734827E;
	Thu, 17 Sep 2026 21:39:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789681148;
 b=MdUwu1cFN6+/vgdKw5MKp4hA7CM2GUTsZ2auaN+wv0F4/7TUbQ2A3cKTJ2jKYGy3wYWv+
 O3Dn9Lqf80POvQvMraHqCsvOL+WdCXCK4xE3LdciqUYZWKuSVUMbusDmRzRRlS6tH9ct7jT
 kwWSIdtwfNfQS0882ykpfgcQAsmiMeZn2ksgL6waO3TMvatE4rf2xfVGp7IbR+UQTlA7HUx
 pCR2OaSOBqDNsf43FJwAoAnhEID2Oz7/FBwFu6M6joPH43QFubdGjidhNCvK4rZOhbR7nJM
 EZxsuVKfeWrHy1ULxsc8C5JQmwivaZ1WE7IRZWfFrurT7n6jpUdq46xAW/cw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789681148; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
 b=WPcUkHoqTJPbmJFQj1gUkE8u7vInZEHcjGdDufvvg04aEu+6S90nKCnj1jjIBzGpyY846
 3f0LjfPZ+ZRzO9rygPfUfI2q/VG4HQWyZFeRm6BH7aOJ2hiEqrfpKeAinh3KO/jt/34VsV3
 r4fxBJyajrl8gHn3EhQrSt5+KxmOmfLQXgYJOHPyPyAExLkgwv2MRoBaUuIT9PoNn2kJweS
 Od4WeG52SMLTsYP9n5HMC4aTO+iY9Wj1+qwJPRvb8xJfGgxFMG3FJYC3zcExtU1Qt7Fbag1
 Om49NGfZM/zMy98QszcwpkCniOD/AJIN2EUGBs7dNk11gILK0sZS7TecSWFg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D3B95481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:39:04 +0000 (UTC)
Received: from mail-oa2-f24.google.com (mail-oa2-f24.google.com
 [74.125.231.88])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D17F910E055
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:56:42 +0000 (UTC)
Received: by mail-oa2-f24.google.com with SMTP id
 586e51a60fabf-482620dc91bso119846fac.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:56:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789682202; cv=none;
        d=google.com; s=arc-20260327;
        b=AtWrSb6rv9FlRqFJtgAKnUdCD6DzAj5gzdKoeL4HdhJpYH17KvZyQXozufxwIDCmRn
         9mcELdek6dVzPl8AOx9q2x8M8IEkKK4I61iDHQcIyO5LwA9o48IvSZvfuCypO+ioxZMk
         2DrdHYIl4+/PYjU2BXCmchVubJmQDQ1RxycFAWrdNaiR8TL70Wb7FtyiXcajnuYxx612
         BgBz/47GEONuWsSOCA9RXoRcKdJOxp4KGf5kJqyOWszpIkP0Bdr7n+Bn9B3b/6CXOnhu
         imidjIQlgBLNCc0KvW4UCoRs+EVag/Y07uS1qnjp9YLeQPCeYSdZ4VQYKmG/B3djkU51
         lDwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
        fh=ce9FTwB5GhQl38RFXx5t9mGdEOpT7A8hWrewAGECm78=;
        b=RByAAPRVZDIZ4ybtIVydjcysd10dZaIncfniCWLALXwSa0Lj5Tm2uy8tzpgdLb+VwA
         jzzb7sEHOblH7ZWeTc1HnDBebtiCRC+QgdflPI8TRSZyxxQ3IA+2k8iI8yt8L7fpb9cP
         6eT/6wkOpCWKRwJanVWLX/z2cP/wOux5n8o41MvkoGjJZoxi+pQYlC1a4Kr93h9qVHvk
         MHML4TfBYQhOZ7XMQ2GqFCU6yx1zkZDk6Pjhxg9ezvExIeXSJ4qSgG7MVZGCwmXk3l9w
         Nc6UFLFy19vtLetdUysTDhhq48ZztqaUlBwh+/HZkzsEemOic4w++djWPKgIKe8m6v5F
         ueXg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789682202; x=1790287002;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
        b=cqWJoRLt436bOgof+JkIZOaDjWVC6y7c+ZcBs3hBQtNVb3ldj66F63QtHlsWS2K5au
         NVlashruLeb9xaFGrAJojVfRHZywKRn2oE797vW698uNDJaonrXGEspbnr/ZuUVX2QME
         F4D4uBxVcJTgx8VOa1JjX5GDYrwovnFYqhUXOVX9cHcuBLQZUriCUCrs5gaYZUs6omHU
         dOAJZVQ2Mvo3FYkHR7UQTKKuhrU8GdmOu80sZNM4WP4DEoPjVsbMK2m999v/hWky2uuL
         iyCfPlmeoo8WGqgt3znnbTPnUpXE+MEMhWEBTZ757k9sKiniQyps03kZ6wQkjkneWu3S
         +33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789682202; x=1790287002;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=er5a82jOE/dMjvQLmdh6qXHLj1Ar/Uat8F/LKGOIt+k=;
        b=alcC1eTNJ4ZSWJ/8zksyevn6lFX5KZS80LkBGMQy3/tmjnOeaYr335to7Nayiph5be
         6pB0yYriKWDUmoVbZ3ngwr7de9Mtd7/Y62acZSnqp8NYDaHfe9Xzs/9FWfVHJxyYwGxr
         aE1lI9RRxiZ0mp84HxWKP5CgwyjwxhXvT9hN3919LZLTsxvxWbhYOf2k7RyD0t27bhyU
         /xLEOmfISZ/AsKDhKKbBO3KTsHUFlBkPNCB1cP2hX24bcLn4T7Ws3SCUaYvoWd36o/7Y
         bth59fSP4GEZ3lfS+Mr3Otwcp9xxV3BEpUXxV0G+1eLCP+KVS3bx9YMxBxi19XVQ8L22
         lhcQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxGfwcSSUZALNxmDiSs9ZH27DPsx2eOD1ykcsLEsits5tzjkK6udfiHc8T+uwv2tOBGm9TY4twr@lists.freedesktop.org
X-Gm-Message-State: AFuF++la05no4hE+eEL/hS4f9JD31Gx/0EUvQfdDgKEnoAikZS8Ea6VW
	x5Ga+qMgw9QTT03A72R1CuaCX7BFo0mxyakVGwhiQDMg5RKu0h7nmfb8JA+/AJlsWz63g2n07lC
	qtL7AsKaLuXxjSNNUOfKENkr9y9E6BSQ=
X-Gm-Gg: AYBFou2AEvUxVJHljeYNkVUG6eAUNIv4kd7Qe9Zk6Cvk0YihUiap72RTocqzYyShSpZ
	Qyy0Wm6ZD0wy69iF5gsK0VAPFvDnSnEyhXFNpeYHJtRHoB8bFGpPwzZKBtQq6NExFBVmgOQHTY8
	DtGJmVbj/c2zitwu5JElvheiSZSkuUmbRCB1gqh47oG0cPVtKT/f7x8YCM/mxjbJXOSwKZBYYh7
	7zo7RwKXZszJLSLG9W8NqucmXO2CyayXFMBoVhMEs1FKZ2N+M+CYfCbHpjBYS1xPHs7d56zwZjF
	LylMDX8RGdpXxrCJwBFoOGgHkqA5gywRSW5vYd3E++w7t6amttGU9NvPpz+YMfI0QOF6Qy2YeZ/
	9Ncn7c3RdOxbPXGaK2HlT0yYHboAQBCFG0tLP
X-Received: by 2002:a05:6820:2219:b0:6b1:61b8:7ed5 with SMTP id
 006d021491bc7-6ca9a132698mr439448eaf.1.1789682201892; Thu, 17 Sep 2026
 14:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260917135051.47683-1-tano.dzhinski@gmail.com>
 <20260917215114.1136715-1-tano.dzhinski@gmail.com>
In-Reply-To: <20260917215114.1136715-1-tano.dzhinski@gmail.com>
From: tanodzh <tano.dzhinski@gmail.com>
Date: Fri, 18 Sep 2026 00:56:26 +0300
X-Gm-Features: AcwNN1UdQBWI62Niu39vnc_MepV5q8WTyFHhbRmt4e0Z1fYt3vUYBBKqOEmd_No
Message-ID: 
 <CAJhzm-8wFgQoAt3gYHnKg-f-dVCiUycdcs38CUOa-rSrmT2NFQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/nouveau/disp: don't reject HDMI config on cards
 without SCDC
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: AXSV3GI7XJYVMYJAMKHGNGSRTDEWABHL
X-Message-ID-Hash: AXSV3GI7XJYVMYJAMKHGNGSRTDEWABHL
X-MailFrom: tano.dzhinski@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Giuseppe Ranieri <giuseppe@ranieri.dev>, Simona Vetter <simona@ffwll.ch>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AXSV3GI7XJYVMYJAMKHGNGSRTDEWABHL/>
Archived-At: 
 <https://lore.freedesktop.org/CAJhzm-8wFgQoAt3gYHnKg-f-dVCiUycdcs38CUOa-rSrmT2NFQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

FYI - the CC to Giuseppe bounced: ranieri.dev no longer resolves
(NXDOMAIN on the MX lookup), so he can't be reached at that address
anymore. Possibly why the original posting went unanswered from his
side too.

The From: and Signed-off-by: in v2 still record him as the author,
which seemed right to keep regardless.

Everything else on the CC list delivered fine.

Tano


=D0=9D=D0=B0 =D0=BF=D1=82, 18.09.2026=E2=80=AF=D0=B3. =D0=B2 0:51 Tano Dzhi=
nski <tano.dzhinski@gmail.com> =D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0:
>
> From: Giuseppe Ranieri <giuseppe@ranieri.dev>
>
> nv50_hdmi_enable() passes the sink's SCDC capability from its EDID
> straight through to nvif_outp_hdmi(). On pre-Maxwell-2 cards there is no
> hdmi->scdc callback, so nvkm_uoutp_mthd_hdmi() rejects the whole
> configuration with -EINVAL, and nv50_hdmi_enable() returns before
> hdmi->ctrl() runs and before the AVI and VSI infoframes are sent.
>
> The result on such a card driving an SCDC-capable HDMI 2.0 sink is that
> HDMI audio silently stops working. Video is unaffected, and nothing is
> logged, which makes the failure hard to attribute.
>
> SCDC is optional, and the hdmi->scdc() call further down is already
> guarded against a missing callback. Requesting it on a card that cannot
> do it need not invalidate the rest of the HDMI configuration, so drop
> that term from the condition and let the existing guard skip SCDC alone.
>
> Fixes: 6c6abab20b99 ("drm/nouveau/disp: add output hdmi config method")
> Signed-off-by: Giuseppe Ranieri <giuseppe@ranieri.dev>
> Co-authored-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Signed-off-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> Tested-by: Tano Dzhinski <tano.dzhinski@gmail.com>
> ---
> v2: restore Giuseppe Ranieri's original authorship and Signed-off-by
>     (he posted this fix to the nouveau list on 2026-01-17,
>     https://ratatoskr.run/nouveau/2026/01/16963412), per Lyude's
>     review of v1. Added Co-authored-by and Tested-by.
>     Tested on GK104 (GTX 670MX) with BenQ PD2700U and EW2790U.
>
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/uoutp.c
> index 377d0e0cef84..9887b3898505 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
> @@ -253,8 +253,7 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *ar=
gv, u32 argc)
>
>         if (!ior->func->hdmi ||
>             args->v0.max_ac_packet > 0x1f ||
> -           args->v0.rekey > 0x7f ||
> -           (args->v0.scdc && !ior->func->hdmi->scdc))
> +           args->v0.rekey > 0x7f)
>                 return -EINVAL;
>
>         if (!args->v0.enable) {
> --
> 2.43.0
>
