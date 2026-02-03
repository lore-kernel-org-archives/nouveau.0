Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98FB8E8783F
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 15:37:16 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BB04210E6C3;
	Tue,  3 Feb 2026 15:37:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aRbMDmyE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F0A6641B48;
	Tue,  3 Feb 2026 15:27:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770132478;
 b=Tm1uRIn6rAO+fgLSVxGBdF65Km9V1KWi7O3I+HqUaHQiyW2D//U4uhlgsmR9xpY852Ga8
 bi54UhgjzMIpIx4hI0UwutvDj+JK3zT9EFg+T7GhO8r6/HGzoYTvYCzDOpx6rxKDZDwV/Ta
 yNJl1uZzYjTFaoTH/WW9gpr3m0Mi2X5lxEntYrUC6wjlGMEKoTVZC3THKKgI/lq9AXpvC9/
 2UnD42DFA7EyC64mpQbGJ+NKGC2q3n/qb9nMPyEpaC9tWZQNUnEZQio5UC4ryjQIR1Y8BnC
 g1j0UAK+MgHX8NHedqhT5sULEojKmQc0hW71uHspGRrLV7fYe+KNSSfDGeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770132478; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=++Tnz+aC4LoJecSrY+WFni3DUGzRjrvBaiChog/RHPY=;
 b=S1Sp86Hur8FEwEaiA3APM7bY6kh+yO5McwaES3AE5qFsnKjq0FEG9GfWxDXBKEvtZ/Qj2
 t891RUl6yBJcj6zG4h32v/I93GEeU4KS/N94m46bu4sR9wkEr91jlaXKq47jAR43ahO894w
 0+mIWIgvqY0EQS92fXiOwT8yHYcjgWMAFzh0wDe3F/r+cKNcJwkG7rNK/1ej/BWRRDQATI4
 NcSmCfFe/8+PRswS8O4NI/RA01s47J3QuVewt7I9flGy1NspKb/xaB1gAk9Uh5MuFpoAlgU
 UCl0gZJ8VDbxn6zZ+ReliyZv0DtAt06bL38PBEuO4JDIQ4zqLITM9PoSknJQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1929540B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 15:27:56 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7C0EB10E28A;
	Tue,  3 Feb 2026 15:37:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 72BC660144;
	Tue,  3 Feb 2026 15:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EC35C116D0;
	Tue,  3 Feb 2026 15:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770133030;
	bh=+92HvwUv0D9Te2Lzog9lTtSDIhdyomwaTdqHn2cdgqY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=aRbMDmyEJUJJxr/uuq9hcztqChiHwbrX2U52O2ZmrE6uR3ctLPeQ9E2wa/T9I88KK
	 h6jos09N/q+B6uWsRbAOUkebuRVDIwVBEz+dxI+R9+Qz6w+Gm5xbcvjRWalh2nwNC6
	 GuBaNEkzsOMTvNmsLUGL+O0oWRTmNRPSKY4Rbq0Urbbv6dqdnnL3Q8pOVdL8M1hKlv
	 Tc3lvlJ55yLP4G4nl1I5FU23GGW6Gxe5dyQt25A2XGgkAY+s1HymyAMM6j1zmIeVwN
	 S73w2taQiUNrdTQu3nf7y2ES+4KrH9dNWVpo0p8XQyclAfKMl1kwx0YRLZv9Tb8Yej
	 LCbAK8wTUCiLg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 16:37:06 +0100
Message-Id: <DG5FSE0B706U.1VFSJLK4DOD5C@kernel.org>
Subject: Re: NV04, 6.18.8 crashes on NULL pointer dereference
To: "Greg KH" <gregkh@linuxfoundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260201185705.0c5364f1@hemera.lan.sysophe.eu>
 <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
 <2026020353-running-unhelpful-fbd2@gregkh>
In-Reply-To: <2026020353-running-unhelpful-fbd2@gregkh>
Message-ID-Hash: CEDSQUK3QDJPU275NOHMBZ47AR36PQ6G
X-Message-ID-Hash: CEDSQUK3QDJPU275NOHMBZ47AR36PQ6G
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: =?utf-8?q?Bruno_Pr=C3=A9mont?= <bonbons@sysophe.eu>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CEDSQUK3QDJPU275NOHMBZ47AR36PQ6G/>
Archived-At: 
 <https://lore.freedesktop.org/DG5FSE0B706U.1VFSJLK4DOD5C@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 3, 2026 at 3:38 PM CET, Greg KH wrote:
> On Sun, Feb 01, 2026 at 11:14:51PM +0100, Bruno Pr=C3=A9mont wrote:
>> Bisect completed.
>>=20
>> The offending patch is:
>> commit 448a2071a843831fe5fa71545cbfa7e15ee8966d (HEAD)
>> Author: Lyude Paul <lyude@redhat.com>
>> Date:   Wed Jan 21 14:13:10 2026 -0500
>>=20
>>     drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
>>    =20
>>     commit 604826acb3f53c6648a7ee99a3914ead680ab7fb upstream.
>>    =20
>>     Apparently we never actually filled these in, despite the fact that =
we do
>>     in fact technically support atomic modesetting.
>>    =20
>>     Since not having these filled in causes us to potentially forget to =
disable
>>     fbdev and friends during suspend/resume, let's fix it.
>>    =20
>>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>>     Cc: stable@vger.kernel.org
>>     Reviewed-by: Dave Airlie <airlied@redhat.com>
>>     Link: https://patch.msgid.link/20260121191320.210342-1-lyude@redhat.=
com
>>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>>=20
>>  drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
>>  1 file changed, 2 insertions(+)
>>=20
>>=20
>> It landed in 6.18.8. Seems like not all chip generations are ready for
>> atomic modesetting.
>
> Is this also a problem in 6.19-rc?

I did not test it, but a different mail [1] suggests that John did reproduc=
e
this in 6.19-rc7 too.

I've already picked up a revert [2], which should be in linux-next and shou=
ld
soon be in Linus' tree as well.

[1] https://lore.kernel.org/all/87h5s34d36.fsf@jogness.linutronix.de/
[2] https://patch.msgid.link/20260130113230.2311221-1-john.ogness@linutroni=
x.de
