Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F92BFD2D68
	for <nouveau@archiver.kernel.org>; Tue, 10 Mar 2026 12:19:22 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D797210E6D7;
	Tue, 10 Mar 2026 12:19:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SdSvCNSF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78CDC45016;
	Tue, 10 Mar 2026 12:08:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773144528;
 b=HaxqObkCnWLkBQs9kt+236A2uA7AAyRF5Va8O58PdhhXcz2ZervQemAKeFDLncBJyv3Ff
 Y/+2LwfUrdwsyZZk4JU49yedXO9zCgfMwj+EqPbWEbzkvxKjGvQFHPy8Cv7v2YKoaqu8Pn+
 U7GOLY5acRbPjGlFEePU7HlWZ3EnuKcQ7Mfn6oA5MuKlbduQWa2Djv+BWa7xPk8ZJ0/ijcO
 2Z42K9d48ljNyjN3MQSnSO78bXt9MWMchujp0a8TC/izF1TDa1JW2QSySoUox+Iysu7vPQw
 kr3ttlbmfhGjHbayboEM/5m8OHAEKZkWmgHrUJTbHuKvXOMKjsF/nCHQGanQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773144528; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
 b=nWXJFYqXOyt8qBBiyY/SCd0oM1CZ+EqEO5YmgfLfvl6oh9Q1hrvnxHTXhlnQP/xuv/KQ5
 63YJMoVNasMVFM9r2kBFpTk8DvrNHNZ4B1il+KlaqQYET2FjvSOUarvqiuoQxCKnSHMgPJn
 0vPdWJfGdO7k7GkJZaNS3lhwsfVqnpbaucqLwNLCMircGvVrguGq987Rd3Mpf4IE+ZNQ2zA
 kFVAWjY9uYakscLdtDP+kmCs1yc8lkAXr6ngVoMUV8ch1r/0FXNMO2irHLon6q9ITcSOZH1
 LxCmFGB9XpAtM/WosW9e1VWFYwyYWgL1d5BXCgH/h/+lxsfvefs19W6geS3g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5EE594016C
	for <nouveau@lists.freedesktop.org>; Sun,  8 Mar 2026 12:49:16 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
 [209.85.221.49])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BA5810E028
	for <nouveau@lists.freedesktop.org>; Sun,  8 Mar 2026 12:59:45 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id
 ffacd0b85a97d-439b9b190easo4729719f8f.2
        for <nouveau@lists.freedesktop.org>;
 Sun, 08 Mar 2026 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772974784; x=1773579584;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
        b=SdSvCNSF5HGbmIbCZrjV+nwxT6tVijagxjQxR0yglPgMDd1ld5kMTerHpV077gwPOK
         B+CAi/ePiknVvI4XqaDlsrC8l89IBjmSUmfdXFzP1NzIoKtqLUAFpB4rjhZvsg1Iaj4H
         RZsGD/FSUrDFEpFeV5bL9xEGNQvtYk1jeMz4pUD2uERxnzOCnP4iYEeSvR7h9O83aGE5
         TtlR5xmthFgMnSIzsMOY4woawZ4wquKMYFDmF0lgjCtpJat72AZhxifr3xsWEAdPCwc3
         hcRGc67WmTWYxzVy6ATX23FPruYu8LqdjtmSmjB+SXRVNmNoNHQ8OPcG3dpRxJ7705EY
         UsXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772974784; x=1773579584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pCcvTZODN6sqyoYdkdvVRxc4wALvjVCgUO6jSwYiCpc=;
        b=MRDgpQBhVcaS/plogsNdyiGBejfRqTQHgwf5d9RWfT6COKz+oYtp3275Wql+xlNyoY
         f1S9dedYpEkpeopkIFG7/Zqm2Q2ki0QTzp+pnmrh/svzNmT1+Am3S18zaUapzCRg0A3Q
         KTMignDuG8aFtIbrBdBEsjZ5+EKwd2Z/v1QK4QxheVBCxSt/MMXfqAMGEm0NOiAC0QGO
         Mbmfc/7VXmJjyqgVQrWIJyUEwiGv/zVlYHNApfN4D3lM1nXBfuCk9W9BnxPfNaW8YyJH
         SI0a8267QzwyLRygWI5tWeiH6IJH2YbcBitIKUer/l0DdUhsEuOWznsdxECnUesN8IbA
         /8PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD3O5u2LLkZx37CzoI15XumW2gjzMHFrrX0czaGltH4WKYe6r/na9COU6gGb+usIchZEq3BKBr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpemhfZ3DUpIAeRWn9DLrbXgeDN4DrV1um9dGxKlRpL06JEwOl
	TdhiW569yThThxptcxv7dYeJq+58SsmFo/YGtz3galOxrAnGZ4NyY6tc
X-Gm-Gg: ATEYQzxCvLfKpiaxFjzjf4VGcNsMYM8ut2wZnPFMI1PqNN+E2KDl14OJdbudynamOrP
	61EZ56Y0b3HFPJJwo1+gAfu4KOO8E9wFEyZxzVn5GWycmMq9RnrjDWiRX+nzRFGzBxhY8iE3S3t
	7U07kb0JBkhmUMHYXkzVlzrndr7s8rgxz+2pBfSFTlqxWChaiWywp1BJvgsHkudCmAKQiG6GTkS
	P/1iVB1WlX520/y/Y78tMYBXeDg5FHJebcXy8A8DUxH68jh+Cz7Nmd01H2PxmEVGROrnc7Ys5ge
	udGhdBf8ALFserxV1Lq7P1SvZdGGG67COcC3YWR3X3ztKEata/QP76/FPsjzb6hW9XtsMt9kck0
	34OuMuVZNFPxCLOmBhxwdGDIAOnJyIuF4ATPFNZiN00DULmhpLV09DcAi9F3kYU49hdh1Z1pzrx
	PiigjZgqFcgrqLsl11/zIPrIuvR/DjpflKzpjp6ll0vl2ByA8xdaOgrogWS40amVDYwo2oArLeq
	RSWxSrhL0w=
X-Received: by 2002:a05:6000:2911:b0:439:beee:43aa with SMTP id
 ffacd0b85a97d-439da351b41mr14651067f8f.16.1772974783363;
        Sun, 08 Mar 2026 05:59:43 -0700 (PDT)
Received: from timur-hyperion.localnet (5E1B97DE.dsl.pool.telekom.hu.
 [94.27.151.222])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439dad8dbb3sm16332342f8f.4.2026.03.08.05.59.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 05:59:42 -0700 (PDT)
From: Timur =?UTF-8?B?S3Jpc3TDs2Y=?= <timur.kristof@gmail.com>
To: events@lists.x.org, xorg-devel@lists.x.org,
 wayland-devel@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 mesa-dev@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 libre-soc-dev@lists.libre-soc.org, elections@x.org, members@x.org,
 xorg@lists.freedesktop.org
Subject: 
 Re: Reminder: Deadline to renew X.Org memberships for 2026 is March 16.
Date: Sun, 08 Mar 2026 13:59:41 +0100
Message-ID: <5818436.IbC2pHGDlb@timur-hyperion>
In-Reply-To: <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
References: 
 <0070f3dd-a521-40ee-b6e7-8b1f82e48b66@amd.com>
 <77e280436ec5b54973a11303dd0446e9f3ab2ba1.camel@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-MailFrom: timur.kristof@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: JDJFBWCWSKV6PTG24UCFJSZUGHMUPVZS
X-Message-ID-Hash: JDJFBWCWSKV6PTG24UCFJSZUGHMUPVZS
X-Mailman-Approved-At: Tue, 10 Mar 2026 12:08:46 +0000
CC: Mark Filion <mark.filion@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JDJFBWCWSKV6PTG24UCFJSZUGHMUPVZS/>
Archived-At: <https://lore.freedesktop.org/5818436.IbC2pHGDlb@timur-hyperion/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi,

This seems to be not working. I am not getting the confirmation email (yes,=
 I=20
checked the spam folder and it isn't there either).

Is this a known issue?

Thanks,
Tim

On Wednesday, March 4, 2026 5:12:37=E2=80=AFPM Central European Standard Ti=
me Mark=20
=46ilion wrote:
> Hi everyone,
>=20
> Just a friendly reminder that the deadline to renew X.Org memberships
> for 2026 is March 16.
>=20
> Membership renewal ensures you maintain your voting rights in the
> upcoming foundation elections, but also helps strengthen the foundation
> by giving it more credibility.
>=20
> https://members.x.org/
>=20
> Thank you for your continued support of the X.Org Foundation.
>=20
> Best,
>=20
> Mark
>=20
> On Wed, 2026-02-04 at 16:22 -0500, Harry Wentland wrote:
> > Hi all,
> >=20
> > it's a new year and with that a new X.Org Board of Directors
> > election. Please take the time to log in to members.x.org
> > and renew your membership for the new period or sign up for
> > the first time.
> >=20
> > These board members' periods will end this year:
> > - Mark Filion
> > - Erik Faye-Lund
> > - Simon Ser
> > - Neal Gompa
> >=20
> > The election dates will be as follows:
> >     Nomination period Start: Mon February 9th
> >     Nomination period End: Mon March 9th
> >     Publication of Candidates & start of Candidate QA: Mon March 16th
> >     Deadline of X.Org membership application or renewal: Mon March
> > 16th
> >     Election Planned Start: Mon March 23rd
> >     Election Planned End: Mon April 13th
> >=20
> > If you have questions or encounter issues don't hesitate
> > to reach out the Elections Committee at elections@x.org.
> >=20
> > Best Regards,
> > Harry




