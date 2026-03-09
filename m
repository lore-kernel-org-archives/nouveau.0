Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1913EFCA188
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 21:16:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0771010E5C5;
	Mon,  9 Mar 2026 21:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=ik.me header.i=@ik.me header.b="ZPyjEyv4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0AE0F44FCD;
	Mon,  9 Mar 2026 21:06:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773090377;
 b=c/erS6dAUwk0vMlATpeyvAHhQkKcMihzTTKT3w5bMAt/qIORK8Ho9k/gvH82ZC695PKzT
 fhXMqmgUoa+4ON9BgMwWEhCD1AM9NJL4ON6hmC4/euPFBYJ+z6wD89V2m2iUgQF0gYK4ktA
 zwYPn/cdNpksmyFtvUvgnnmWgIPDguPPOyZbSWZ6/PBBis0mEyc2BAxcy3Vxp1RW8TRP04X
 osdlhNLDXMWYHlVWTqeffU/oxy9/+ka9vexOLsOHe99aSVaXwHhgE4h/4ui+5JrguF/GU5x
 EYkrunRzsm85NtUbaMXaTEuw034Iy8gkrUCmJQ9NF0WVTZQPybZaMF2fswqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773090377; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=53430ld6TuOhPe06CqOr6FSTQYKWdBF9o2ZOnQ454dI=;
 b=rAWeHSoZcHncX1f5dl5QooJ4V2YdGo99s50hV5kTsa/hEKULsJ1iFUGDBTXXX8cnJMOZo
 8gkZkCXij0uSof92t6e3OFk4oxrrISVpaksnnGlni9AdodsbFpA9fQbnf6qKKmQVh8kIKe+
 j+Q/2Ki4CT+Cd4g7k1MlHmCCvUjdvkSfxzHYJv5N9jpmIorDSAtl9/aRyb3y37r6i+igEXd
 H3EEc1SJ9sTpK0Tu2GNjXzTRwhqI1OMJn38TzPzTIxaSdiwwWRlC8Qi5+T3ae9bOiyWTBIu
 I8xBREhRvlBOciFU+JymUKhdW6Yu3RXNT1ZRqKSI79yVXFsuC+21/0KrhzlQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ik.me;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ik.me;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=ik.me policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 06658404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:06:15 +0000 (UTC)
X-Greylist: delayed 5285 seconds by postgrey-1.36 at gabe;
 Mon, 09 Mar 2026 21:16:46 UTC
Received: from smtp-bc08.mail.infomaniak.ch (smtp-bc08.mail.infomaniak.ch
 [45.157.188.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 81E2510E5BF
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:16:46 +0000 (UTC)
Received: from smtp-3-0001.mail.infomaniak.ch (unknown
 [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4fV8vx0X8lzPMG;
	Mon,  9 Mar 2026 22:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ik.me; s=20200325;
	t=1773091004; bh=53430ld6TuOhPe06CqOr6FSTQYKWdBF9o2ZOnQ454dI=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ZPyjEyv4HE7KJmDTEVH+QqE3n8wAIA0Ro1jil9TZoNSQZxyMbyrYW/e7LzScv7RQr
	 o5Uz6DDlBd02ieGQHeMdQBvTwkp238+0ASvpUwt/NT6nmRXeel/9YcIXmpYr746jRm
	 gP1ZUv8Cqa9MVPxtVLG2KWxA9oRRDZsOS8PwcCD4=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA
 id 4fV8vv4BwqzBGL;
	Mon,  9 Mar 2026 22:16:43 +0100 (CET)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 22:16:43 +0100
Message-Id: <DGYKAXUZE263.3VQZGY7KJ5FEY@ik.me>
Subject: Re: [PATCH v11 00/12] gpu: nova-core: add Turing support
From: "Ewan Chorynski" <ewan.chorynski@ik.me>
To: "Timur Tabi" <ttabi@nvidia.com>, "ewan.chorynski@ik.me"
 <ewan.chorynski@ik.me>, "Alexandre Courbot" <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "airlied@gmail.com" <airlied@gmail.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "simona@ffwll.ch" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260306-turing_prep-v11-0-8f0042c5d026@nvidia.com>
 <DGYIFHP99CQ3.2XWVRPO9O1E1D@ik.me>
 <282984b6-a0e1-4e3a-bb57-db817b7e9249@nvidia.com>
 <864ab8a502db872468d7b01e0adfff386d2187cc.camel@nvidia.com>
 <fa3c5390-aea2-45c2-89ef-05a64070a44b@nvidia.com>
 <DGYJY8VKR9EK.1XPGZ34UPJ0B2@ik.me>
 <5390ee90b722b29e686d948bc855da1eb62a4f6b.camel@nvidia.com>
In-Reply-To: <5390ee90b722b29e686d948bc855da1eb62a4f6b.camel@nvidia.com>
Feedback-ID: :52330b22a40e583:ham:e74197f626dda86
X-Infomaniak-Routing: alpha
Message-ID-Hash: VYYLGBUK3ZDEWIICPC6G27ETDM4VKIYE
X-Message-ID-Hash: VYYLGBUK3ZDEWIICPC6G27ETDM4VKIYE
X-MailFrom: ewan.chorynski@ik.me
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alistair Popple <apopple@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VYYLGBUK3ZDEWIICPC6G27ETDM4VKIYE/>
Archived-At: <https://lore.freedesktop.org/DGYKAXUZE263.3VQZGY7KJ5FEY@ik.me/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 10:05 PM CET, Timur Tabi wrote:
> On Mon, 2026-03-09 at 22:00 +0100, Ewan Chorynski wrote:
>> On Mon Mar 9, 2026 at 9:29 PM CET, John Hubbard wrote:
>> > On 3/9/26 1:18 PM, Timur Tabi wrote:
>> > > On Mon, 2026-03-09 at 13:04 -0700, John Hubbard wrote:
>> > > >=20
>> > > > I have that exact card available, so I'll give this a quick test a=
nd see
>> > > > what's missing or wrong, now that Alex has pushed the entire Turin=
g support
>> > > > set up to drm-rust-next.
>> > >=20
>> > > The TU117 is technically a mobile chip, and its VBIOS is different.=
=C2=A0 My initial version of the
>> > > Turing patches would "ignore" the problematic VBIOS sections, so per=
haps this changed.
>> > >=20
>> >=20
>> > No repro on the latest drm-rust-next branch:
>>=20
>> I guess I may have an issue with my linux-firmware. I have no stable
>> right now so I can't download the latest one but I'll try
>> soon. On which commit on linux-firmware are you ?
>
> There's only one version of linux-firmware that works with Nova, and you =
didn't have it, it wouldn't
> boot at all.
>
> Although, now that I think about it, I'm assuming that on Turing, if gen_=
bootloader is absent,
> NovaCore will not even try to boot.  That file was added recently and is =
missing in most distros
> today.
>
> /lib/firmware/nvidia/tu102/gsp/gen_bootloader-570.144.bin  (or its zstd c=
ompressed version)
>
> If you have this file, then you have everything you need to boot NovaCore=
 on Turing.

I had this file installed but I think I broke something when I updated.
I tried to redo my installation from the tarball I had and now it is
probing, so the issue was indeed on my side with my firmware.

Thanks for trying the repro and sorry for the false alarm.

Have a good day
Ewan

