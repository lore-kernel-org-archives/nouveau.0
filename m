Return-Path: <SRS0=598a=HM=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A8D4C433E0
	for <nouveau@archiver.kernel.org>; Wed, 10 Feb 2021 10:51:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32AFD64E37
	for <nouveau@archiver.kernel.org>; Wed, 10 Feb 2021 10:51:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32AFD64E37
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43686EC4E;
	Wed, 10 Feb 2021 10:51:08 +0000 (UTC)
X-Greylist: delayed 628 seconds by postgrey-1.36 at gabe;
 Wed, 10 Feb 2021 10:51:06 UTC
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D9F76EC4E
 for <nouveau@lists.freedesktop.org>; Wed, 10 Feb 2021 10:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1612954262;
 bh=paESHhGdxaMJReEYpSaz/aynwepipVdSG6B9lmgKyrg=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=fxhe2yz1fFa08QPkbw02li7RgBBAXmL+bexIx1sigQ1XFmyW4+nZjQhdK9cQ8BRhp
 33dM+DEVsBJiCETsPkuYf1huavlWXyxSgbnh9E1Drvo/LPXXlkqiTeQ5CJ58jReSyo
 Tk0kjwUJNTeGNKyiDH0cak7S54SstufB2RGGqXyw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([185.191.218.231]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M9Fjb-1lES9B43fz-006Nsa; Wed, 10
 Feb 2021 11:40:31 +0100
Message-ID: <9d221e6160813fd188de26d3b56443129e9f8003.camel@gmx.de>
From: Mike Galbraith <efault@gmx.de>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, lkml
 <linux-kernel@vger.kernel.org>
Date: Wed, 10 Feb 2021 11:40:30 +0100
In-Reply-To: <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
References: <1d663cd74af91e23f4f24ebbdd65ef3ba72c15fc.camel@gmx.de>
 <43924195-c4e1-fce4-5766-aaefe2d6f766@amd.com>
User-Agent: Evolution 3.34.4 
MIME-Version: 1.0
X-Provags-ID: V03:K1:l+VEAe66+pl3U3UrZ14BhCYiNOYg1SQgtKRrwYe5Wz02JMOEoaU
 EYnAGsn/WpHlCTmHGk9gINOHBSIQIUkowYVB8BnxCa29wQ3iiW96qm1YpQIIKsPCsF7ivSq
 0iy+ABDl3EwDy+rcHFHlq46XaQ4RWTdan7+vPRDxUEWPNG/k2PrZ9DYB3aVEYPqyy9rdR0x
 NybQ9Kj5RIJYyoBSBMaSQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XkmN8bvZQ40=:iT8Hm4S5vVuSX1xmiseyCQ
 t1S8oN0tqh0E1hbpqqsA1T5y0Ou4cmUlznEOMTUWwxOOxLSznvWBipjzQkLh3+n0YJmjfsYgZ
 eY9xYHLaDN5LkbWPDbVetG0nPtlJOXd73jzfrEd8UcvNypVgLA+fZdfUPoKVKsTQSMvjpeXJe
 u1S7T9zFbWdghICZz1yfsAQwG1U0jmdH6iwe+LD7cvzyDU/YQxXF2lSXgGAoT2KBnsjsYTg/q
 B2cvPB3k4ge6bcXVKl4HdH8E8ZOO3NyCrXDNxj654KIHAS8LrBqC96rEiItPvJNgzdUltfqOI
 C35tqzCwywEI6+ipYbAkn3jnsxH0MfwSzAr/EE7HIsC+MBLWweaLlvkqaicdJhGpo87p9xdUG
 6PdF9KTCcC/JJ46XgejgkYUd55tqufF59hY09TGeLxoWPlMsdw2vxf7FcQkYKEgOUJNDhE4LO
 cAjOUw29eiNGv3glijHX3brlElBHq4DTY4+ueLJeX3M9bXKfK/gse19EUvd+EHIAKHHJzKVJp
 202/RtDvDaVt2pwaEoyGvrCidhqhIi5kgMzG9u1K1p4tmk9AUvbdNM8xfnnufK+Y1RiTcmk0i
 jzVJ/OSDnymOgRT2XnXVk65hzX5WyVGR84SsYFH7EpP8VGLlot2meg+aZ5TLe2ZZsvbqjKsAK
 wXhgc+pzzBkreClVPUseY1m/oAEAD69YwuKzz2NV0MO0JVyeI/7SrihgHYevbOsNrQT57a5AL
 6z/NRR9X0/gnpFtislsKH27QD2pwiWYSbdOJTfFMIV9Bmwrj3Pl/ObVwWI/rQguET6dEnHuLW
 VJS6KuIt8IjEoFHCpi9OEDcc/j6nk0qPngk/mDkZ/f7KBTpJrmoPTM7DimN0tJN9BJCEXpKZk
 BcsPm7TV86tXWl2SCn9Q==
Subject: Re: [Nouveau] drm/nouneau: 5.11 cycle regression bisected to
 461619f5c324 "drm/nouveau: switch to new allocator"
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 2021-02-10 at 11:34 +0100, Christian K=F6nig wrote:
> Hi Mike,
>
> do you have more information than just system stuck in a loop?

No, strace shows no syscalls but sched_yield().

	-Mike

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
