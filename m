Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DF8EC54EFC
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 12:59:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 35D1210E3BE;
	Mon, 27 Jul 2026 12:59:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N30p2EaF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 52D6B473F8;
	Mon, 27 Jul 2026 12:44:04 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785156244;
 b=tWxURpN9JX76SXVoujsVON1fpy7F1nfWpOt8CnCD7YSgMm/VBMZU0WcJ1xgY8eKKTADME
 FyM6KYbZzawNPe/9mlwdrF8s3cE0ectVoMTBZLXN+HmftPAcNtLp5lEmN51peUydrayebxc
 53x82gqSYtxwdyruKCgFPjc647mK08XaholDVtr73Ry4JAuIzUmKliPu8E9D3C2+F2fIo5W
 Usl8DDIMbtQDPl+r7KuBunWcjdAFkUNXM5LSMAMxkZcTC3arLplWas2OLwrAXCCt14hiDdw
 kAjYLnE0T2MiX3Q/4BqXGk2cizdNjwgWYWIwljZMUx5B7BLUiO9VRBUyhziw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785156244; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
 b=mVZKmMQxWdl5ueSbxZzVMkCkxHd08x5gy6gbtx+69kWJtT1aCSvSSG2ecfl0uwax+TfC0
 wbRXIIgGnN/1uBK8UBlk3pXcqKOHs/4w9zGFwlDRMeC8Aa8t2hfY/wPrs5OB+HHIyzBvHhB
 Qh8aFUdMal+0E8vw1Q3+6H+EkzyK9ofBqpaDReDrlCEjTj8eaf1NRqYOGgHyGGE8EgxQif8
 t78Bemx68Il9DXN/s/vAm6itT0vK1sthN2RXLuTCA70lcIlWRVdF3stdKejsJjajl5EgZg7
 Og5H1vERnHbtDmsAXdWotImw5qUTGMSo7XphsGoGOohUuP9Dsb9S9q/jJ6wg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B4E4E473C4
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 12:44:01 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2B710E3BE
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 12:59:43 +0000 (UTC)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-81f36179d72so31143987b3.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 05:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785157182; cv=none;
        d=google.com; s=arc-20260327;
        b=lVwHgOXmuxkiAAaBXY20pG4xn0GTh63HxNpP/NOdYqQlLEZ8sNQl3Nw+Z6X7pmwtS6
         ppqhl6ov6JyoBgq9duxMla+rK2AuaasdQgiVYyVSdXPwV2EIvyhvYVBvN0BPL0iYGgIa
         WIzsEyXYUbNnaMVRjbiy+cUM1Ry96lxAV1IXHGBd2eNDiNMLeWsTxwdjYGbcKCFFo/xf
         fgbGMHOW1FxUhShVBGMEOQ86sIQXqJUArmaEwKjysrs2CTebD2UTmXHArPxa0wriGSWT
         3e8VoUehB7YwWZlIjj6ufErDS31fCCWqEWDLLE6IF3togbBzKlj/rCB5xeZFZYSGGh0r
         yUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
        fh=+ci8FnaD9Fa5vNl5QMKBYTQ/uvTZadiIdsL6ci6rNMM=;
        b=BSlM+MoiF+rPNL6MFbMu5VAZjefqOJdSnOmVSAZTuRNq+x9DuMzV0TyfGz0fHGY9i/
         VAyPERVQ9jFVtgUZ8djPWXu0M2cEK6wsgOvCTtHNXOBp2vx9ytLC/mvQyKSfRJk/V2h8
         UNYzTznuIe+kuZ5nF1MGKYbP7k/5iJrtJEC/QdSTlXrilTl8A2md6Zx8xOzKX7TasLsP
         tWBUvh1ZhDwG7ziXS2WORNJxpUWHD4pd/biXRc281JFR6k8yyLyyEV4pQ7VZaS7X5dRT
         uH8qG7Gs6JxptT3rIG9OlOzpYoHg6iskeJ69DV13ehmD6xvD5MyfjWiMrdcbnucxgtkK
         /Z7Q==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785157182; x=1785761982;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
        b=N30p2EaFvc61AFTMgqpoZYzLFGiI4Lcy/DkWwATXldnfQApmxIEqUj7Uy5YcuVhVtt
         dAQ98xGvRDEPrGFK+wiMCSF0xVJjozT1oQi2tb4CD+i3I6wfn44PlDtkInUg+ZNbRD8w
         92lepeQ4DL+7luMbBhJ4P9vZGi5RN+fq/8JDP7gzE/Pq/BsfZr3SrZwKw47o5eRW/z/m
         /AU0YpZsvgbgeUrotQM+Ju6eC/0HX5UVxwEmdUO69HsdKbiFRDDmnDzVbSD0dBAbFb0t
         WLlbz38VBFj5daT1ul3EIoFr2MzvQZrejFVMCfC1FRgSck7S7ikx50gG9flD10hd8FJL
         XRDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785157182; x=1785761982;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ix29oOBbLOf7nlyiJN1FbRfyq7KaaHwmDtcPHELsDuI=;
        b=HL3tiIXmpRk93KJ5n9LIAUWxZGLrJOxCdwJKv2rkLi8DNrPy5oFJ+pbRiQwwrer69D
         KA3EP/kljjU9HYqhnKcwnmRJVnN2karnYpd2By7fCWDQfZCMJGTsOs7SsafimrPgMyex
         CvhydtGq7iVSE0+YWIEAW2bKGPmRRrf/Mnc2XNWkCRmlAqWyxAj7Xbtw+ey1akA18qLk
         z4lPfGzl0jFo2d6PrkQaqCyHZrtKtQNErBvJAgHEkVUmSMODGyoT5Qm2wKs9NEn91Wkw
         iB96x48V0pN8pVun+1PP3asoBUBlYuvJSJ19W56ph7kpNOVqmYc8YJIALQX0yuorz4rc
         BhRg==
X-Forwarded-Encrypted: i=1;
 AHgh+RpEYB2WTxlRF8cToFKDSHgQN9Ce/jEPNxhhcwbbPvZtnHawB0KiE85PmaW4XtEyVMSNUrRzt76N@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyEZR2Imy3QriEfAxT6UADKbhN2RIT281VuCaSp4UFDpeq5uuB+
	0DMpehLuVLEMxITVeDbDMjwg6K/AdcepTM29CgeXDigWYXCg6pkd6F64nHJeTMf+puMwepb2OjG
	dx70be8YEZl0GYjSSqwVNTDWFHILADdw=
X-Gm-Gg: AR+sD13ZwhKsKGyrPgsn9ignVCqSCi9uK3TcMgur9hgRofce6ycC6V3R0zN8PXRe/R1
	94n74Lhy6ZS3JdPsE8xEr14wkVQmhsjhjviB5BQpnygmKF4nzL+gfxL21xQGnR+uCI0hzTytiAO
	h14OQdIi68iXplltUmWeUhmeeS13nUmRyhF3ZAkrXyzYNBnE3pXV6nEy2d7/g0C73/LnKLX7aQF
	1qIX+n8e48BFzNeKatvFz35Tf12ZwUyTKgdB5q0W15sjOmTrpK/L0qIcbDfTsJoTjVxHQ==
X-Received: by 2002:a05:690c:6f02:b0:81e:97e2:2210 with SMTP id
 00721157ae682-81f69ebac17mr31274727b3.69.1785157182142; Mon, 27 Jul 2026
 05:59:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <adcfc6f2-3309-4496-8331-1ae31e85d363@sirena.org.uk>
In-Reply-To: <adcfc6f2-3309-4496-8331-1ae31e85d363@sirena.org.uk>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 27 Jul 2026 21:59:30 +0900
X-Gm-Features: AUfX_mxOitBR08KsPWHGWKTOhvBmlqBsOevQYdsbBN1kI3uyZROYcZJFQfRk1pk
Message-ID: 
 <CABFDxMEmB=5UZx6RZgFNZyB5sg-+e2hgx_T1QjV0JzqP+auTFQ@mail.gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
To: Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: NY72HY7JPRJAJYOHSRVIHQ7T2CSBYCTX
X-Message-ID-Hash: NY72HY7JPRJAJYOHSRVIHQ7T2CSBYCTX
X-MailFrom: ekffu200098@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Julia.Lawall@inria.fr, Alex Deucher <alexander.deucher@amd.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Morton <akpm@linux-foundation.org>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Borislav Petkov <bp@alien8.de>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Lezcano <daniel.lezcano@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Eric Dumazet <edumazet@google.com>, Florian Westphal <fw@strlen.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Hans de Goede <hansg@kernel.org>, Hans Verkuil <hverkuil@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jakub Kicinski <kuba@kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaroslav Kysela <perex@perex.cz>,
 Jason Gunthorpe <jgg@ziepe.ca>, Jiri Pirko <jiri@resnulli.us>,
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Johan Hovold <johan@kernel.org>,
 Jonathan Cameron <jic23@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Julian Anastasov <ja@ssi.bg>, Leon Romanovsky <leon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthew Sakai <msakai@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Mike Rapoport <rppt@kernel.org>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Pablo Neira Ayuso <pablo@netfilter.org>, Paolo Abeni <pabeni@redhat.com>,
 Ping-Ke Shih <pkshih@realtek.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Shuah Khan <shuah@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Simon Horman <horms@verge.net.au>, Stephen Boyd <sboyd@kernel.org>,
 Steve French <sfrench@samba.org>, Takashi Iwai <tiwai@suse.com>,
 Thomas Renninger <trenn@suse.com>, Tony Luck <tony.luck@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>, Vinod Koul <vkoul@kernel.org>,
 Will Deacon <will@kernel.org>, Yazen Ghannam <Yazen.Ghannam@amd.com>,
 cocci@inria.fr, amd-gfx@lists.freedesktop.org, dmaengine@vger.kernel.org,
 dm-devel@lists.linux.dev, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-wired-lan@lists.osuosl.org,
 iommu@lists.linux.dev, linux-cifs@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-crypto@vger.kernel.org, linux-edac@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org,
 linux-rdma@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, lvs-devel@vger.kernel.org,
 netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
 nouveau@lists.freedesktop.org, platform-driver-x86@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NY72HY7JPRJAJYOHSRVIHQ7T2CSBYCTX/>
Archived-At: 
 <https://lore.freedesktop.org/CABFDxMEmB=5UZx6RZgFNZyB5sg-+e2hgx_T1QjV0JzqP+auTFQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jul 27, 2026 at 9:12=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> On Fri, Jul 24, 2026 at 03:45:02AM +0900, Sang-Heon Jeon wrote:
>
> > All patches are independent and can be applied separately, but for
> > everyone's convenience, it would be nice if they were merged through
> > a single tree.
>
> Please don't do this, it does not make anything more convenient - it
> results in huge CC lists and makes it more difficult to work out who
> will actually apply things.  If there's no dependencies just send to
> each subsystem independently.

Thanks for letting me know. I'll keep that in mind. In v2, I will send
the cleanup patches to each subsystem independently.

Best Regards,
Sang-Heon Jeon
