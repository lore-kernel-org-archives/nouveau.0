Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A881C531D0
	for <nouveau@archiver.kernel.org>; Mon, 27 Jul 2026 11:08:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 592A210E39C;
	Mon, 27 Jul 2026 11:08:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Eajgx2UB";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FC31473E6;
	Mon, 27 Jul 2026 10:53:08 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1785149588;
 b=A3oqVAnKp46T2ijn0uy/yt5f4bpug+AaNjx04i67lG5BbLiSjafsrkiTObnaIDW5dTcqV
 dqJIBm22IfrhLY7+BM5iJsPvWL/ZwPPjcrXPPN1B+errvg3Cq5GHX9QDJ8nl0Ail6XjXpFE
 SGY8NsmRn5iwPd377kzOpLeMfJzkSQjc5IWW/lL/y8S75qHS2wsyU/EK2E7GkjRmj6uEMf9
 y3YtLbFJASmMY33OyThRmh2VWvBch4QILltRe/7ADfKCPqwHxocNozzcIUonVngn03ZP9l3
 87RD7P4jnCXoifRWP8QB3XmS1bRlMI82gWUeKQtf7YxttdCLMDqDe+nukvBw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1785149588; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
 b=aqeg74BUuFnRUtJbtub85yUKIFUtKtKuEXnew2BE/4LA6vp6jMQDVaz2utiQfCkYjfGmW
 QocK5XZ0p7Nu7+rewY8SnZFKfTzpIaoOhJV5TbbG0llVH0HLOFfuGssFicB+QhiplYhn4jV
 oH+uTrQ04TBvFnt0XTK16ENbTJ3xA5ndQ/AJQ2NBbMftbhmySzAUojBkJ8ZSVv4MXUFq8XF
 ztSm3PEcQmj2+QWhs0g9nyVno0aekZLN6/IyowN/2ao+HPevyf27Cx/h1smUVYaX/Glo/fB
 6wOiTTKUoUURV7gLCuXZCGujQtRlW8ueg/x6uEhh6xwCI69EyvmN04pEl+pA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5451A46BC9
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 10:53:05 +0000 (UTC)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D454B10E39C
	for <nouveau@lists.freedesktop.org>; Mon, 27 Jul 2026 11:08:46 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-8114a4542b2so34405567b3.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 27 Jul 2026 04:08:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785150525; cv=none;
        d=google.com; s=arc-20260327;
        b=L4gc+/YVNbj4xH5Qkb6bhaczZs8+2VZ2qpeVhyK8mY07uwj8HGrqI8e9Cxi7/Hx7/8
         WnIZVTxXIP1CI0xrfSpCt1ccqco5oBNbergSy8BfmyI+JDYuVGrPKiDIa2GW1TMv4fgH
         lVejKGh2UXr5zR/CFChkpqIHp1jCzf9eUOo3I41U5ljpmy3bihk7hcn8L6YdAZ69yFg8
         BzE+xDwGeNTME6Y2+zIeLhAcfioAqFr40ASPvqv997SplV4Q1zsX+S4mm/KkJPoiKRvU
         W7LJcG+4UiU8dH6RhB2gQQslOg/J0zSrC3YUvR84im7JOxPPL95NClI8tov3OWPH+1Bo
         brkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        fh=VARQAk11/etxWq0Utm/ASxKEx7Ak/nqgMV1csi34iyQ=;
        b=cD8X5Pr6VRjpIbAy4DSIODQAYazWPmF2lFJWD+4qFmD0tt/z0+I6LsdzUe8JgARCRD
         3H49NLuwfcW3AqeNp2rhXWVheJVTwCrM+Zx5BAbjRutRaE2eNGg0RXyw3NmQ9x4n1B+L
         MuwAWebD64wV+el7Oy6ScEwoaPmB2FYc+YigOmDN5cGWqsFmg+w2C6LDT1g7tGp7OTxM
         XfQjrIo4nEYiqEkjDvI1MuenhhbMfOOg4feRBCX+rpSTLEKOBkPwJq9UzSMzYydTHM99
         cCr3vZY3ZVE1KltHS1cVs6FBwZsZZ99stRZ6xCqdp3L7r02prlx4wVY/EDH+61hh8Ked
         3XBw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785150525; x=1785755325;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        b=Eajgx2UBFqoD6xwhfRiBamKVHU6FtEUxQtZZNGG0wApbYBrcw5D5wX4u555xDH4JY1
         UTpxqFv+rk37ZQn39J0gkFIfrIanad/JdRS1U93ai7WMJ33BeWNyllvBZwn3WnDF3KJU
         csTofq/d4AZGzNKnQv6qD7Wcu4nkFVqYfUR3zbUWGWsvKXSQihRILK9OtwC2ViPHDv0m
         Onp8LIyLnh+Z6R4WAAxira/9+UdLAkMXGlSXuV2ugQ15BMPHhY+IZzXpzvbp2ycp6c4N
         f99wkOGwgEpmn0b3C4yesPpxqRov4yLWBe6r/iSPB7J5BmwcKP9m8/IeT12Uv/5JPypg
         NObw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785150525; x=1785755325;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pV1TDUaa2YAV2kxJY3x35Y0FQXGiZRc6WWYevwzWDGg=;
        b=HVjdkWmRM+uAxfRXVUVdeN9YLV5yjSjyGAj5BLHQSRMq6SIDsniWK1/hKIC1pGMufh
         EVuz+AJ/ikD167ENz10g3ptC3L4ZqKamPVKUukuv6TbpJD3523FPlPpBsO5jj2T8Kg0J
         RsdaOhdRZEH4/Gp5cKEoyRIMlKNjPaWcUyYAkX/uFtddN3CkQZ8ox+DitMJ1v3qpTPAM
         S3oJpMDgKowPMV6O2W9xCQtdQIzXgltFfzCJ9Pet5VXkRKHL5/wfd8QFTq5gs+5rCOQC
         rOCBUsu2NxtDF0hDC4HJM1tfmki+taQX8zDcos+ljGV9kbt/C4dnJgUz7sEcqWn6x94V
         BNnw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrHf/aBkkPsvTNnA37tiBwczkxRr5FO+mxXyJAqmCadEONTTi4BAHE83nb7wVYErf7hDEWT8CU+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsI7zN/AlzzZAAwj9JOQ8Ng6QO1n6cSuY3OVIQdBgyeQyRLB2e
	a0xFX76gOmY+eKFni0DUurYWUm5bQluGAUnuO1r7RGZYnPbbOkd4YS7/Mq9j2v0X12ZJdL9f0uw
	cnlVaX7fKSQdrygAd298+DMfyc/ORXeo=
X-Gm-Gg: AR+sD12x2gL79/VYhbh0IuDmdZ7YM1BpZSWWokdAizCzPzQaYNoFTncnVbJDaU5CDOk
	5Uh4bNdX1jjNdRYGCdmszoFTj1Thr7FeJT8LMhzJCp3SOpsb+vQ5Ep4AS/NOl8Tx9LzMkb7dJQc
	8BT47b4CX6cCtRYYDDUSLZ6P4wAWK6kqQDHv1Mwuvueu047xfIywAk4JazbW18Az16tp5zhY49q
	WMLGVSc6lOk5pKjtSCW4xboTDnJTbnIOlR2ZasoNkkawAiEA7mfo/WM6KI=
X-Received: by 2002:a05:690c:3747:b0:809:86c6:ee18 with SMTP id
 00721157ae682-81f69e3978bmr27868337b3.37.1785150525277; Mon, 27 Jul 2026
 04:08:45 -0700 (PDT)
MIME-Version: 1.0
References: <20260723184538.3888637-1-ekffu200098@gmail.com>
 <20260724144822.6af8213f@kernel.org>
 <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
In-Reply-To: <0ee1ef4aa7daa908bf28397ccc639c89b6aabd9c@intel.com>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Mon, 27 Jul 2026 20:08:33 +0900
X-Gm-Features: AUfX_mzhfgKW48GB4CRuyNKliFu1x1EH8aDGDqYePXeE0rGOBX3Wid5IOU1hKpc
Message-ID: 
 <CABFDxMFMOAZ_3kYxEGCutnGt1OSSmgvmwx-=M1RxGc3VGKORYQ@mail.gmail.com>
Subject: Re: [PATCH 00/36] treewide: remove conditional returns with no effect
To: Jani Nikula <jani.nikula@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: DOZIT2EMCO4P6IBBSN3UHAZSILL76P5N
X-Message-ID-Hash: DOZIT2EMCO4P6IBBSN3UHAZSILL76P5N
X-MailFrom: ekffu200098@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Jakub Kicinski <kuba@kernel.org>, Julia.Lawall@inria.fr,
 Alex Deucher <alexander.deucher@amd.com>,
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Jaroslav Kysela <perex@perex.cz>, Jason Gunthorpe <jgg@ziepe.ca>,
 Jiri Pirko <jiri@resnulli.us>, "Joerg Roedel (AMD)" <joro@8bytes.org>,
 Johan Hovold <johan@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Julian Anastasov <ja@ssi.bg>, Leon Romanovsky <leon@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Linus Walleij <linusw@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mark Brown <broonie@kernel.org>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DOZIT2EMCO4P6IBBSN3UHAZSILL76P5N/>
Archived-At: 
 <https://lore.freedesktop.org/CABFDxMFMOAZ_3kYxEGCutnGt1OSSmgvmwx-=M1RxGc3VGKORYQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello,

On Mon, Jul 27, 2026 at 5:30=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Fri, 24 Jul 2026, Jakub Kicinski <kuba@kernel.org> wrote:
> > On Fri, 24 Jul 2026 03:45:02 +0900 Sang-Heon Jeon wrote:
> >> Patch 1 adds a Coccinelle script that matches the pattern, including
> >> negation and constant-comparison variants. Where a local variable is
> >> assigned right before the check, the assignment and the two returns
> >> turn into a single return of the assigned expression.
> >
> > Huh, I thought we already had such script. Various script children have
> > been sending such "cleanups" in the past.
>
> We did, and it was removed, I believe in 1a617a8475e8 ("coccinelle:
> misc: remove "complex return code" warnings"), because people just don't
> want this constant churn.
>
> It's perfectly fine to have the error case and happy day scenario
> separated.

Thanks for sharing the history.

I checked the mailing list. The removed script looks similar to the
new one, but it is different. The removed script reported a
conditional return followed by an explicit return 0, where the error
case and happy day scenario are separated as you mentioned, and Johan
also complained about this 10 years ago.

But the new script only reports when both branches return the same
variable, not the explicit 0. So, I think the new script is close to
the restricted version that Julia mentioned 10 years ago, and it
should be acceptable.

>
> BR,
> Jani.
>
>
> --
> Jani Nikula, Intel

Best Regards,
Sang-Heon Jeon
