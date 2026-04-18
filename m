Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66269F99C7E
	for <nouveau@archiver.kernel.org>; Sat, 18 Apr 2026 17:35:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 49CC910E373;
	Sat, 18 Apr 2026 17:35:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="GPkTURJL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA1B845A49;
	Sat, 18 Apr 2026 17:23:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1776533003;
 b=dVNFB5l62TG07JgVaD8xZyKCVvQKcbEJv4mmlGuI9tqWWXHbXizx1RuI5SNXIKciZCs/C
 9+WR7apS5JEqmS1gf6475E2mFaQjyptZ7g7R+ZUQQ+C8rqVngRPxa3M8dQwC3Ln+mxUqqQI
 XA9snR8THMFgDqPnzE8iQeKvtgLJzxoYbWdOf4TlcT0ymVfD9jl4v4kgoq5Kng2ANlppXZS
 2g0HpsWbryRkj7z4Syqybf9WNexmIbr5xgUe4my6v37jsetLeWCOZU1EaX9dQsgesBpIJE/
 IjqOCaX0BmPcGHSR9mZEUEqNvKLBtRUi61iChX2CHLfzgtCZaZlU12icRLoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1776533003; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0nMSY9ojN/laeGBVFPfHXV3p2jeJgDRul27pbnNPBvI=;
 b=0c1vg/EZ5U13wVNUx+nlDK2LWjQnRqFZrsvETC0u8NR69TcIpU6EtngS3QkCU5Po+Lm+l
 09PjfhLuv70puLqquFg5Mgr0/WqydgF+yOncrL4ZMVibi5HS5N+tWTAV+FfdNhHBWMscGqm
 MVP36teGvh/EglW16RpRe/LHAtJxi/TKn2GGgDApmLj3gg+JsQneD7sJS18WmaIeUQQ8rvz
 /HFCpmTHcLQWD/XRlbDu6fa7dSMECQredDGBI0mAcOvyvalSGPzt5mqBG34t4yDyBmzZ5Hl
 2vfXu55WVp4Hl3VmJg3pCPTH/CO0MweT2wFx/nxi5gq3h/XX+5OX/OPbx3Og==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1C9BF45A3B
	for <nouveau@lists.freedesktop.org>; Sat, 18 Apr 2026 17:23:21 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3185810E376;
	Sat, 18 Apr 2026 17:35:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C40D1444CA;
	Sat, 18 Apr 2026 17:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D707BC19424;
	Sat, 18 Apr 2026 17:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776533720;
	bh=6zlWUhd+ODi0eJZfqAbsxg62XBlwsUK0bjyq54H5TEc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=GPkTURJLGcthqXyT8SfCkzCkb0wGxSy6cXAnSiRlC4XR05KqRU23oH1AxSr3ldcVR
	 HOf70d7SynZE8JREm/vEwcl22eqqQK/V4uPfNl1DkYmxgCcG/Cd/Nqq+aovIhioaXD
	 uafFjrbWaTYVUj2/cq7vLhpbOfAln9dL5tqW6zqo9McgqZfktzHvZjXqMd/lHuE/vN
	 4tchy7YwBMp1SB2MQ2pNrQJYDl3n27Tto6FTImGBLRZavoD+C4my5RAJvEX/duRW4S
	 /OCTmHstyN5IAveDaL2Q0p+lm/8Tgek00TPCWt+IP/JCBdQYK/xVBTwfazHRnCS1Ii
	 9UoL17f24DY0w==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 18 Apr 2026 19:35:17 +0200
Message-Id: <DHWGN6Y2J9X6.3FMWWDU2NQ2LV@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/gsp:  Fix possible NULL pointer dereference
 warning in r535_dmac_alloc
References: <20260418071412.86022-1-sunliming@linux.dev>
 <DHW9RZVWDN6Y.2G2RKSJMF5ESB@kernel.org>
 <abb12ec2c8d72d6a369ef7b29d0453736a07f90c.camel@nvidia.com>
In-Reply-To: <abb12ec2c8d72d6a369ef7b29d0453736a07f90c.camel@nvidia.com>
Message-ID-Hash: HKQ6DKKT3W4A2RHHX22MDY6QVZ64VG6J
X-Message-ID-Hash: HKQ6DKKT3W4A2RHHX22MDY6QVZ64VG6J
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "sunliming@linux.dev" <sunliming@linux.dev>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "sunliming@kylinos.cn" <sunliming@kylinos.cn>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HKQ6DKKT3W4A2RHHX22MDY6QVZ64VG6J/>
Archived-At: 
 <https://lore.freedesktop.org/DHWGN6Y2J9X6.3FMWWDU2NQ2LV@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sat Apr 18, 2026 at 7:24 PM CEST, Timur Tabi wrote:
> On Sat, 2026-04-18 at 14:12 +0200, Danilo Krummrich wrote:
>> Are we sure that this can ever return NULL in the first place? I know th=
at
>> nvkm_gsp_rm_alloc_get() internally checks for IS_ERR_OR_NULL(), but I co=
uldn't
>> find anything within the callchain that would actually return NULL.
>>=20
>> That said, I think IS_ERR_OR_NULL() checks are misleading.
>
> I posted a patch a couple months ago that cleans up an IS_ERR check, but =
it was never picked up:

Thanks! Can you please make sure to send patches to all maintainers? If the=
y
don't land in my inbox, I can't pick them up. :(

> https://lore.freedesktop.org/nouveau/20260103000756.1002890-1-ttabi@nvidi=
a.com/T/#u
>
> I'm quite certain that there are other similar issues in Nouveau w.r.t. I=
S_ERR_OR_NULL.

Yeah, that sounds likely.

> I think an audit of the Nouveau error paths is in order.  I suspect that =
Ben's big refactors
> over the past year have resulted in some invalid error paths.

Are you planning to look into this?

Thanks,
Danilo
