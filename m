Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1D48EC1E99
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 10:58:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 120A510E860;
	Thu,  5 Feb 2026 10:58:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a1QnteEw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4061041B4A;
	Thu,  5 Feb 2026 10:48:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770288530;
 b=JCctk0RBeNwaJPkFr9fV0Lcd8jD/YBDhfiJH1llVFKP2U6tc4j6oYVbbc/bSXtM2gx7St
 +3LxknpmcTCItXvJv0ff0jjc7bmyTvQSxYWQUs6gULWE41OTAeTSzKL+e+sTDghiJkxsquJ
 NtSzD8dbhSuFG8hSnzhyiQDPvl8Fh+t14BQX5+2L7Lhc66KwaEgOaIAsqELwvesJfEofHCz
 7MXssTE3f9x3NMIsxCrQ4xmB5WSz7eC9mANKv1gm1krLyQ5Fsc5djPnXNbziw880lfYHIWx
 xxYkx1vU39Dmq5/3Qy5LLvaifLEA8p3YQmCxHfL67UnDR2CoZDs7nJkFKetw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770288530; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2mhGR53KWj8SmcJdwgB83Qri0SzSlGnIgc3bFpwdCcE=;
 b=dytrg6QLFCtsTG4/K364W1lT58WXvY6Kybcp17KPTrcca24AVL6RiAjq0zpSllqqf0Qwp
 4oD3AqSBJovQprZmKajnx0AE/zNEFEr7PCiZPkTtxxPkCBStbucO1o3Xr0nJE8u1llvyMMd
 IHyxNpc9HfGVEgefs9q1AjRpbJ9AMhVt10fQtHIgamqqzMrvA9YDhNcNIX3iu2AbIOq8vv7
 +IR57TaYEfgQQ7oWYhDnaVSD1LiVM7lyJptRMgJ0xtqDn3/AvQFF1P63CNx323UTtPuDrqS
 yE3a/U9t6OP4Fi+JPi9Qlg58to+JkabgYgthoigGnEhc5VgoVVq0Q3G4ipXg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 59C62402B7
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 10:48:47 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB1F910E10F;
	Thu,  5 Feb 2026 10:58:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD82543E16;
	Thu,  5 Feb 2026 10:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1F7C4CEF7;
	Thu,  5 Feb 2026 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770289086;
	bh=2mhGR53KWj8SmcJdwgB83Qri0SzSlGnIgc3bFpwdCcE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=a1QnteEwPbwXYvoI7dJrXlNUEybHmWgN2djLYcVzMbqMeZLHe808HeUV9SBzw2Y8x
	 cP5pkwH+D4qYAUi2E5DLy49JTUsld4pRSb0bq9vvBiPsAwgoiAPuQ4N3c75l4j/EWs
	 RQshuYu0xYVGGhh+S2JdnLzUOozceMDNlr2tdaD/i+705Tt4tq308/Md5GHjguJFbV
	 TywyCpDTnBko9SzKF4VYojsIyMhtzff/ZfXWy8DdvhfSbr+ChLe7vTtKN52rZJ4xUE
	 k/VgvbLzFcyQuoKmbPhxsB73I9AOY70C4G3qDgvol5YXUASOYeYg+chew100q9DtdZ
	 YxohHONlxVpYA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 11:58:03 +0100
Message-Id: <DG6Z3TV6WX2I.17RY4HGCSP6TD@kernel.org>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux> <abcc6ddc-47d5-4970-8fc1-e82c150fbfd9@nvidia.com>
 <Z9x0NLY6HHsvxOFD@pollux>
 <CAAgWFh1VzRnt9QdCR9xOVhar7vEYAGPBcMHfqXGq_QHm0A6H8Q@mail.gmail.com>
 <Z-VK8eeA_7BURiBy@cassiopeiae>
 <CAAgWFh1yGZkEi+Fr9htOp+iXJjLo6Q1B+rszKKAcxgw4Y0D1RQ@mail.gmail.com>
 <Z-aCVZYcEkxJHBle@pollux>
 <CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com>
In-Reply-To: 
 <CAPM=9txDN8NtX2UFfo8KtkaqW_rgM7oE-nLC+XyaOEAS6sj-qg@mail.gmail.com>
Message-ID-Hash: ONXRNLXBEYCAM3KOVUUDZPLLQADRPK74
X-Message-ID-Hash: ONXRNLXBEYCAM3KOVUUDZPLLQADRPK74
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ONXRNLXBEYCAM3KOVUUDZPLLQADRPK74/>
Archived-At: 
 <https://lore.freedesktop.org/DG6Z3TV6WX2I.17RY4HGCSP6TD@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 5, 2026 at 1:43 AM CET, Dave Airlie wrote:
> I don't think we need to go through NVIF, or at least we could do it,
> but there is no gr object exposed through it now and adding a whole
> load of gr code to nvif would be a nightmare,

I mean, we can bypass it, but it would be yet another inconsistency. Though=
, I
do fully agree that there is not much value in adding the required code. An=
d
similar to the other thread, things have changed a bit and we may be able t=
o
afford being a bit more relaxed about those things.

> I'd rather we merged the kill nvif patches.

Maybe we should just do that?
