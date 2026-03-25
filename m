Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52238108B91E
	for <nouveau@archiver.kernel.org>; Wed, 25 Mar 2026 01:36:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2F8D710E682;
	Wed, 25 Mar 2026 01:36:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQbbnYH1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B84B452EA;
	Wed, 25 Mar 2026 01:25:11 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774401911;
 b=IBFhIsUu9npbPF/GyXdrDqfrZxutr8FfRnlYfMQ1G9mmoSpvfXW0olpYoBC/AdRxbOZrV
 KmSs6W3V+vEFxu3WTCxP91la7uXrqvh2lHU8L77q2SDCgpfyT1EoKrsowCoXDOaq9Az8Cpo
 XWed9L7qcF0kTli7p8Ur7B5JzBsg1opbd/jlkLYwK9whVH0nELKAjTSDiEGMSnow0EzkIgz
 ORgqALZDfFuGnsDHyrhpt1d7bKSVqlUnGxbg0v4DHYej3kLA/eFdYgYCT+85rNb0Yz1CR5Q
 X4HJN3TLhpq0s5VNNcnb0pNgJliQkeZj/f4WEzqJd9kFOFbha27HA37j41qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774401911; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
 b=ll5K2b+KsTVB9BlueRb6KMGYrmtgKOHRzUko2+7ADGfdy3YksCm3iT3+tgxzgMeepfJwi
 sB13J0G/fkAdQ8xN3evzqX/TbhUfa2em16QJFroC3seYWHO5iKBnzB0GM9q/d2qemvkOBl/
 J/PGIbtAggQQOJ90H6Qv8dLqERzYk230yeplmJkyQCneW/uRE3c7caRsAUWbE/WSgYNvF3S
 XVjhithMD14mt3qqCQ15dhvr3UJCQMEv/n/DdcpPl4ARHzxuu+S305u8CVHhf3Skll1kfrQ
 s3hL40trRRdmT5s/krluW/+ysWw0JHzv+LtNr/Mr20K6vQfNiw6K/gX8DUKQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 0027544D5E
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 01:25:09 +0000 (UTC)
Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com
 [74.125.82.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6EE5A10E18B
	for <nouveau@lists.freedesktop.org>; Wed, 25 Mar 2026 01:36:14 +0000 (UTC)
Received: by mail-dl1-f50.google.com with SMTP id
 a92af1059eb24-12a6b260693so399047c88.2
        for <nouveau@lists.freedesktop.org>;
 Tue, 24 Mar 2026 18:36:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774402574; cv=none;
        d=google.com; s=arc-20240605;
        b=hVTefkTbMd8F5GITDEqZGyvAK5/aZ1hEewCOkkXGY5bUzkwOuEfmVRV5Cz8TFWhcBA
         hcYlExUgTNplNrBpN2NO4pNCZiDHrKfLnnQW5cX0TODh7bIOI3rgszpv4VEkLWvODh/V
         bniPoAS8xsiwkfYbpFh1VyEvRuHm4yT43vvhdNbjzZyaOuzmuyIt09/MXVMbXMBItTjX
         HDdT94chlRu/OLDWfX+k0qk0NyrylZ/P7qUt5ZwTO4Yzfw9oP11cBFxTLD86dIWZkbqt
         hWUcBgOmcqr+s9qUcO4ho/qX5FTKNmiS75FzPaIwwRxntOYQl8SPvJ5KVk89kU6gCZWs
         E2hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
        fh=Z08Rnlvb3VKhE9IYQ9QW3ChXjt9wsC/6z6L5p5on1lo=;
        b=gYMlA05rKqOyfcgzO56FV6bGanaa8HKtRfuTv5uyNIiX9Bx50YEtKYDK/HmZD61E/F
         ML7HxSISBMKMkXohV8ybB/DD6Cse3B9DpI4dTDmCHJOV5EUJoXvcI/pvOh5Zt6Uettid
         5pkc0+LEUVq7xNdImPlMkrg4AqpbOLRkw2TyHoSlkCD/cDsUEPJML4kk2/q88IIK/FGe
         ubrHIF444FZThcxowm3ObLv5Z5GGfTfnSaftm7GOcqlkvTzvSYGC4gXYl+8aFUhMW7EQ
         Agc2qI3rnmCIynhCFLIFCwzDTZYEMKELJrn+MQ2+EoLy5lYQ5G8j9ak1pKKFV1YkUgSv
         988A==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774402574; x=1775007374;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
        b=fQbbnYH11JRhSYHCaObhly3gzylUSfzw6F/EM/GVrkZMA8l3c7lWedtGew78dDqGFH
         K9FmCZHy4ib83lTaXg7jCOWBIgYTCYjgxDzofCiYm8OUClyqMa2T0zBklfMbdtHFi30g
         n8ISjH3q+cbKN16GF7D04dh1KXV78ACuwZziXXCBexXk1lI4ZpYaKJAqzd8TZ6ytL0LD
         El2Rd4uS4xWpcFBdfpt5oSywZOvlxHVVDQ6NfC3B9TfL0MXvxX/4EvVXQf/yEcENyO2g
         ojIL39bt7BMBODVVhYouXmGWDdv/G+DW/n18e9SYkQR6fm0NdZxrCmBmNbPkNNR/VhSm
         83LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774402574; x=1775007374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0okK9xoYyd+Y7Hl9zukJB+XkCExB+thImigrJn9O0Hc=;
        b=eOl91LRq58OJdMIlHZlX6mt6YyxC1bY2L37si3xCc6jYaJjczDHc9zmeLSaeEdrslO
         //35kt38GI8ALBIgK9efIiuTIxWxGmCBdb1gjkftEHwiYkLx8mhmn3Vg11xs4lnL69TF
         gno3SBwkMrp1RLLab0bghAJkiVHhU5FLl/J10BpwvPJygqQCLoh5zRpI6NUjAFtrIErc
         R8AI5wbVjcDq//xlobdajZxnZzn641bK2bVDmywUWV4oFymnWZ5vCPD7NO25g13N1wym
         5pfSnH3AX+YoP1pK3ISztUIZ3HGL9Yh4A0E/7Je16hhZowOJHhgArtgCqyjGMeje7YSS
         Xlew==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfrQTk4p2QWEmvCsWXh0XNRP4FjpvezkRvWQ9w0z1fYimppb9HZQGt5HnJR75HK561IUIysRHg@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzp/xwqCN3frgeuJNjjGHdkeVQyL043Ha1e0sC3I/fKOqsOhybm
	ibRj9Z6FrnxU+7PZbk5DkgxM+isJOWN3LtAinZcT1s595uoF7fBNCUVjtRT65T2W38igOEIoc1S
	aB58ejh3Na2LkSlw1qsEQp0/UvXp2Dhc=
X-Gm-Gg: ATEYQzxLsD5vQy394GNVHbTc/dqsnhvGZRc3ZPSdl4boOvg3VqyV59bz7/VKSXutEs4
	p5ewsYnWkfnaKHTXtfhusZtCxue2YZTGKF30fvSWjEIEp4sp4IOYdbdXFp6JUoQmVu5LxnBgOe+
	sRZd6Bu5stbJ9oPhCgSSgPjuDLF2BdOYFK3/PBtmFr6pbodVnX3y/lRQgCNLxhwyNnSyhNf8zjW
	3S0rZRRaqWTvIjZ2Tss3OhoRZZG7cenAewGr1W9nW2ebqu6DCuKyvg4AXpGkr05I/oVOisZ0j0V
	hjD7Wj5l8a4Q5mlxjFfHShTN4G4HoU8OiIeAFHgdJTfCC1SMNcj5OzNwqCaV54UttS0vFcY5E55
	0bImdNmDYuMVvcPOogW23+es=
X-Received: by 2002:a05:7301:4e0b:b0:2bd:db75:c28b with SMTP id
 5a478bee46e88-2c15d4125d7mr343033eec.7.1774402573473; Tue, 24 Mar 2026
 18:36:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260323134504.575022936@linuxfoundation.org>
 <20260325013447.66771-1-ojeda@kernel.org>
In-Reply-To: <20260325013447.66771-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 25 Mar 2026 02:36:00 +0100
X-Gm-Features: AQROBzCWO5qPV_1hDuoqGflZm9Y9d8dfbSYWlGNb2lHRGldE_-fw23LWI6Wqy8o
Message-ID: 
 <CANiq72kdozG-2_VBaJyg1SZ1W9s25-=3+ER_qkYAX72avDJ9rA@mail.gmail.com>
Subject: Re: [PATCH 6.19 000/220] 6.19.10-rc1 review
To: Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: ALTTW6TRKF6LUP4RGTSKHNWSFSKXOSZF
X-Message-ID-Hash: ALTTW6TRKF6LUP4RGTSKHNWSFSKXOSZF
X-MailFrom: miguel.ojeda.sandonis@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: gregkh@linuxfoundation.org, achill@achill.org, akpm@linux-foundation.org,
 broonie@kernel.org, conor@kernel.org, f.fainelli@gmail.com,
 hargar@microsoft.com, linux-kernel@vger.kernel.org, linux@roeck-us.net,
 lkft-triage@lists.linaro.org, patches@kernelci.org, patches@lists.linux.dev,
 pavel@nabladev.com, rwarsow@gmx.de, shuah@kernel.org, sr@sladewatkins.com,
 stable@vger.kernel.org, sudipm.mukherjee@gmail.com,
 torvalds@linux-foundation.org, Gary Guo <gary@garyguo.net>,
 Tim Kovalenko <tim.kovalenko@proton.me>, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, nouveau@lists.freedesktop.org,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 loongarch@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ALTTW6TRKF6LUP4RGTSKHNWSFSKXOSZF/>
Archived-At: 
 <https://lore.freedesktop.org/CANiq72kdozG-2_VBaJyg1SZ1W9s25-=3+ER_qkYAX72avDJ9rA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, Mar 25, 2026 at 2:35=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wro=
te:
>
> But 1) this is just for loongarch64, 2) Nova is still being developed
> and 3) it is just for 6.19.y, so that is probably there was no Cc:
> stable@. Anyway, Cc'ing here.

And 4) it would need backporting more bits or a custom backport.

Cheers,
Miguel
