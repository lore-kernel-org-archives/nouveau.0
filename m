Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B15A8C43602
	for <nouveau@archiver.kernel.org>; Tue, 30 Jun 2026 16:05:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6975510ECD7;
	Tue, 30 Jun 2026 16:05:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ox1lSUs8";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1BCBA46DC9;
	Tue, 30 Jun 2026 15:51:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782834669;
 b=KqIMMJ9Dja5TzNxCLmJ0SsbpiWNkQizhHVpu12IKnmPh+Sw26A+6kGkLwv8ONfK9rbq6I
 Tvd560cGj8Y3/RY7g0OuzYUx2li8ItboRoCsHA8VkiwTAEcqF3+RPYFg31a7YzM8tk4hzyL
 a4s9cQLnHYecCjVvBSxw/VPkB920fE79UmygC9wF8xGPYhaZTC2frgEg1rZGNT566zz08Pp
 +44ZVm2JhX6xSC1XxIowOkQFl1YOEdI9gTkaFoNHzHPBszLYHyqS3eyDzfrB8RkhMNEaTr2
 L3Dgj76jYqlwAx98TRylyl0SRYs+saWthkx14PqgJWATodCL0or564JmpnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782834669; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GRs8WjcQhEYPcY1IkD3TxIAylDmbtFFFSwtcXiK+ZfU=;
 b=jIeVAMfxfq55F9w1aZVGDwlyjJf2IBUdOUOo9mZ3DGo/F2iI+82jEfLvGc1yp7RkagZN0
 yvb22J2NwFI0RL4LNwhV5m9TM/3El2V878yZ5IfUwGQndnvlzsFOrFR6w8EpmmYDoURMJWP
 3dZaiDsKB66rOnut+D9gKHhV05ZbfB2ISkr+zvmtmp/yvMmLoWUdbebC1DCArk0u2Pmi8Rk
 uJ5RJOEGEx59apuCOBFNR/END7zgsxjv7rOB23ujSekYCkGjDsLG42jOIDz2wuVbt8Dv+ii
 NT8N1/+kJWkW8uEjUCBc06IYPAlVHltwkk27lMNFoxsXVpxIr+AXeNuEXd2w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E966C4017F
	for <nouveau@lists.freedesktop.org>; Tue, 30 Jun 2026 15:51:05 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 005DB10ECC5;
	Tue, 30 Jun 2026 16:05:47 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 476CE600BB;
	Tue, 30 Jun 2026 16:05:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F352A1F000E9;
	Tue, 30 Jun 2026 16:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782835547;
	bh=GRs8WjcQhEYPcY1IkD3TxIAylDmbtFFFSwtcXiK+ZfU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Ox1lSUs8APxIsUyMFvQd0DXXHeogkAi4cBq7Nizl0YA0oJsHLXSZrXSDjaUxbf1J7
	 VFdM3rKwRi7eEN9eli1d/LEEGUB/m01MbJEtntsSfXM3plXu7HfFSxaBX6Kaw5eKDC
	 zhRTylalba619x60GkyfjhkL21ZLJRsTAnvKZe137Ed4OVHcBkyEk6wfR2YqOg+JCW
	 9AyXSMhByZlMFpix4KMGX12NfZXZmy1KNndWd0gUt18ZCZYYhve92toImNVQKaDAHX
	 08kQELCc79R8VkaNWXTzXpIFb7diJSou5D9IfOTxeFVu1xTL/EpLnPVKdxS3I2Wlkd
	 /DOnQRMPtcXtQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 18:05:42 +0200
Message-Id: <DJMIGDHFYCIA.271V0T10TID2J@kernel.org>
Subject: Re: [PATCH v2 1/4] Revert "nouveau/gsp: fix suspend/resume
 regression on r570 firmware"
To: "Andy Shevchenko" <andriy.shevchenko@linux.intel.com>, "Lyude Paul"
 <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260629224350.2870201-1-lyude@redhat.com>
 <20260629224350.2870201-2-lyude@redhat.com>
 <akOuPQ37-zxIJWWH@ashevche-desk.local>
In-Reply-To: <akOuPQ37-zxIJWWH@ashevche-desk.local>
Message-ID-Hash: LLUQ6JNHYOLY7IZKHXXDRAR4MPLMAWIW
X-Message-ID-Hash: LLUQ6JNHYOLY7IZKHXXDRAR4MPLMAWIW
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Kees Cook <kees@kernel.org>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LLUQ6JNHYOLY7IZKHXXDRAR4MPLMAWIW/>
Archived-At: 
 <https://lore.freedesktop.org/DJMIGDHFYCIA.271V0T10TID2J@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Jun 30, 2026 at 1:53 PM CEST, Andy Shevchenko wrote:
> On Mon, Jun 29, 2026 at 06:42:33PM -0400, Lyude Paul wrote:
>> This reverts commit 8302d0afeaec0bc57d951dd085e0cffe997d4d18.
>>=20
>> It turns out this looked like the right fix on some systems, but it's no=
t -
>> as this causes runtime PM to actually fail on many a laptop.
>>=20
>> [I have set the fixes to an older commit then the one that is reverted
>> here, because when applied with the other patches in this series, this
>> appears to /fully/ fix runtime PM in addition to the regression]
>
> No need to have this in the commit message, move it to the comment block.=
..
>
>> Fixes: 53dac0623853 ("drm/nouveau/gsp: add support for 570.144")
>
> I'm not sure, actually, that this is a correct approach. You can't revert
> something that never appeared (in time range between 53dac0623853 and
> 8302d0afeaec). Have you consulted with the stable kernel process document=
ation
> and/or respective maintainers?

I think it should be as simple as picking

Fixes: 8302d0afeaec ("nouveau/gsp: fix suspend/resume regression on r570 fi=
rmware")
Cc: <stable@vger.kernel.org> # v6.19+

for this commit and keep patches 2, 3 and 4 as they are.

The commit message of this revert can then explain that the commit that was
attempted to fix with this revert, i.e. commit 53dac0623853 ("drm/nouveau/g=
sp:
add support for 570.144") is fixed with a different, subsequent approach.

This seems correct, as reverting a bad fix does not claim to solve the orig=
inal
problem.

Thanks,
Danilo
