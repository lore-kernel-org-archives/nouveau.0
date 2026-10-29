Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40072606A31A
	for <nouveau@archiver.kernel.org>; Thu, 29 Oct 2026 05:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=pe1f/agE
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 162E310E7AB;
	Thu, 29 Oct 2026 05:24:41 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AD45148BC8;
	Thu, 29 Oct 2026 05:05:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793250331;
 b=h4xuZGeZBJPBUw/fxjJrhQwzaCA7Xc1O+AFjB4/kOCXZyugX0qSgSUkCAKeu7bMxIFUmY
 gNeAd1gOr/CxMbC62WupT8uarAZrnnU2qB6ILio+Ae6/XnpjQ56EM48aBAhf9pIArkzBeIc
 lF4sIZwdmsq2MC/ICT5ljf85GJSpqtS8G4E1d7PZHWkrjX5maCK3zlwKZ6PrvktcQcAkfGf
 OtYhBNoPhkiFYQaht2ITegzNxYu2my5aUpCP0Y9pAbR1uTvUno8DviXskNhX9Sv7bNDxWJX
 1Nvec22Rdh5krYKikZ+X7aqt4W4V9MJ2A1PLSKw0lARYNC49qZY5rkyr33Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793250331; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CIEQ9OtPejwKejOtSr3C0xbvZUdg8Vv6JgbdFtJ0FW0=;
 b=jzF8JXJ5Lk4tGLOAB4yAYKRBt7xJooZChmabpN8RZD7GT5DC2DICCM7lfiUxckfhdPvhu
 yBpKK4XrbkYI5EMRRyz7jiwlJOLFmvQ3sxHlzSHxuvPbbAgeus+NGrEA8+PsVNe21Vvt/Ea
 RHZphqlLUFmPa5S0uDg6P//puAnC2bRy5uNlcYeHhuW6HbzHOFHBnuVRmyRn+J0FYMyBElZ
 J/AGUDEAhOnB2XCBKzvEoIY3yLt3FTG/ZFnT3sA+U0U0A+th3eJ/g7lAtKfgpZwW1zf+Ry2
 7GDl/jeAIlRzxBxZFbJe1uouMGMfrGl33ia2/kYjdXNhuq6w4t1jyAFbodnA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=free.fr;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=free.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=free.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=free.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4ABEE46CD7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 05:05:28 +0000 (UTC)
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 54A3A10E1E7
	for <nouveau@lists.freedesktop.org>; Thu, 29 Oct 2026 05:24:32 +0000 (UTC)
Received: from [192.168.0.65] (unknown [91.154.212.51])
	(Authenticated sender: martin.peres@free.fr)
	by smtp1-g21.free.fr (Postfix) with ESMTPSA id F038AB00535;
	Thu, 29 Oct 2026 06:24:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1793251470;
	bh=mmT9sOYbIGj/0XEbOG8eQKrxI4S+bPjVlyXS+Tmalyo=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pe1f/agEBf+kPtruA0NejxpyHjVO6vQB8usxQMDpsQ4U4civmzi4Fkbiyqu61Cpxa
	 eFy8WMnTvYmlV9jmWqM5mnsqsWD2GTkps4UrsO36iKWoUzAaTc7/A7Yx3eExtlKjWL
	 AizWURI6bUzpzi974aY6sMT/m94mUfhGraFeXFIaEF6Q32buLQ9t3dE/52NUiCAb0i
	 zj1W1vKsGcMUBbbh53mUasrEMs1MRmsjpt9t9ZqvKPBFZSHcQKokQlL+9+G7K0YHrr
	 IsW1OI7Fpp3torWrH15SKDkUEByGm+jhNyahy7BrXZr8GBw+/MM6nfkMNZu5PufOcn
	 RO3q6AQFgxnMQ==
Message-ID: <8abb7b92-c16a-47a9-8caf-49773845c246@free.fr>
Date: Thu, 29 Oct 2026 07:24:28 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] Fermi (GF11x) reclocking: a model of the NVIDIA driver's
 clock management, a lab nouveau module, and a call for NVIDIA 390 traces from
 GDDR5 cards
To: Alex <xnderv@yandex.com>, nouveau@lists.freedesktop.org
References: <20261028185052.54427-1-xnderv@yandex.com>
Content-Language: en-US
From: Martin Roukala <martin.peres@free.fr>
In-Reply-To: <20261028185052.54427-1-xnderv@yandex.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: QDXBSXBHJFESHV6P7VHSGRXYYCRZKYHD
X-Message-ID-Hash: QDXBSXBHJFESHV6P7VHSGRXYYCRZKYHD
X-MailFrom: martin.peres@free.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QDXBSXBHJFESHV6P7VHSGRXYYCRZKYHD/>
Archived-At: 
 <https://lore.freedesktop.org/8abb7b92-c16a-47a9-8caf-49773845c246@free.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Alex,

On 28/10/2026 20:50, Alex wrote:
> Hi,
> 
> this is a hobby project, not a patch series yet, but it may interest people who still have Fermi cards.
> 
> Since early October we have been recording the NVIDIA 390.157 driver with mmiotrace on a GTX 560 Ti (GF114)
> and on a second card (GTS 450, GF106, recorded by its owner), plus the last pre-390 drivers (270.x) on a 2011-era
> stand, and turning what the driver does into a written model: which registers it touches in which order, which
> waits it makes, and which of those steps are actually necessary (checked one change at a time, 60+ experiments).
> Everything is from our own traces, VBIOS tables and open code (nouveau, NVIDIA's open Tegra/nvgpu code, open-gpu-doc);
> no decompilation of the proprietary driver is used, so the results can go upstream if they are good enough.
> 
> What we have so far:
> - Core reclocking on GF114 with nouveau's gf100 clock code plus the PTHERM/FSRM "bracket" the NVIDIA driver puts
>    around every domain mux switch (slowdown engaged before the switch, released after). Without the bracket the GPC
>    mux sticks occasionally on our card; with it and a dwell of ~4 us after the "engaged" flag, 0 stuck in thousands of
>    transitions. NVIDIA 390 waits 8 us by its own timer; 270.41.06 wraps only the mux write. Details, numbers and the
>    register-level map are in the repository.

Interesting, I don't remember ever seeing nvidia program the FSRM around 
reclocking... but I barely looked at Fermi+ reclocking as I was more 
concerned with the Tesla and under era.

> - Memory reclocking (GDDR5, 135/324/2004 MHz) by replaying the PMU memory scripts and host writes the NVIDIA driver ran
>    on the same card, through nouveau's memx. A generator that derives those scripts from any board's VBIOS reproduces
>    88 % of the registers on the second card; the rest is chip-level layout and driver-init bits.



> - A VBIOS corpus of 306 Fermi images (with TechPowerUp's permission) that shows what is per-family, per-chip and
>    per-board.

We have a private database of a ton of vbioses + associated mmiotraces, 
I could give you access if you are interested and the repo still exists 
somewhere :D

> 
> What we are looking for: owners of Fermi cards with GDDR5 (GF100/GF104/GF106/GF110/GF114/GF116 - GTX 4xx/5xx,
> GTS 450, Quadro 2000-6000) willing to spend one evening recording the NVIDIA 390 driver with our script (needs a spare
> disk with 390.157 and a kernel with CONFIG_MMIOTRACE) and to send the trace plus their VBIOS image. In return they get a
> build of the lab module with their card's own sequences, and everything learned is published. It is a lab module:
> hangs are possible, no warranty, no support promises.
> 
> Repository and the call with details: https://github.com/xnderv/nouveau-fix (issue #2).
> Comments on the approach are welcome too, especially on what would be needed for an upstreamable version.

Seems like a fun project, I wish you a lot of fun with it! If you need 
historical context, please ping me at `martin.roukala@mupuf.org`, or on 
IRC (in the #nouveau channel on OFTC, please ping mupuf).

Cheers,
Martin

> 
> Thanks,
> Alex (xnderv on GitHub)

