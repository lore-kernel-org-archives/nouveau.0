Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD7A2C43458
	for <nouveau@archiver.kernel.org>; Wed,  1 Jul 2026 21:53:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 99D7210F0D1;
	Wed,  1 Jul 2026 21:53:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="njkDg/k1";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7D64346E2A;
	Wed,  1 Jul 2026 21:38:16 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782941896;
 b=yjnJvE+Ynr5p7wZoQ9VRVv7V81AHb32UhVrK/FNoDB5zWsWXmgTSOwYnzIfuym2va7QOu
 WIL7lRiMcaJivNQEh23eKlNVYKeFbXQ3KTO+PkAl8ZJ4gNI0mbVf7mOjxcF0VYBoyVcS16M
 xZDf4u4swA0TyZqbBVaNOdCIqgQ63C2IozQkjQwWVraqaNCdnTZaQhdKd98nlMyp23of/mb
 pJXyf2s0OOsgg34o9WozNVg2UcVd3/+VZQmfsxKdIpx9cTw8NgLDob/5N0qfrEbouI9YS52
 YeDMVgiIqoG32qm9ezrC4mPqAufvWI1OZt8nKq6UsmdYAssQMTtWdX0dgDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782941896; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WxLJxKFpUA0kAUkIQ6mS7yvA+8HJGo7B22jNIaZOi6g=;
 b=vFuxYLUT5AvlNeX9mMXFsuROJyQ7ieaW/3vCu5M3sPbIV2p9Z4knCV/mOCRHdecNpIWxR
 dzaNlqNh5iRBifql2AY1zFY5PTjaPn8KMvG7VFIRfOMHNadRzWNUuZ9NX7JvRHS6aHCDACe
 +oSk4zf3NixLAldyp4mPeWD90GI9sWM923bX42uH7oGqZxnWXXparT6S4Q4A/Qp9qzYXIPW
 F04wHhQAA5UrouyWl/u8FNs6+XafyptZtCGcXPS09xTrtwi8qWl0ynymcqKho87Sm5MUQUM
 c+Vlet1S9wf9H86OGR+i1DR4W+yNaTOc198hOEL/KojaTOevtq6SY70fjYPw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A908C46E25
	for <nouveau@lists.freedesktop.org>; Wed,  1 Jul 2026 21:38:13 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 77EC110E174;
	Wed,  1 Jul 2026 21:52:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B65086001D;
	Wed,  1 Jul 2026 21:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDB5B1F000E9;
	Wed,  1 Jul 2026 21:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782942777;
	bh=WxLJxKFpUA0kAUkIQ6mS7yvA+8HJGo7B22jNIaZOi6g=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=njkDg/k1sBTK4PF9q016m9mONKxrqizl4XhE4icxmXHbl+YGkhRaGiE+u7f7Ll/ad
	 MIkPZjyXfN5LKw8zDKync8/jLHo20qcaGBXqQW4kUPoES7ZD/L7ZRWuIC++GbNgvBx
	 k4O1uNA2gIyFw4piRNmL4IpG2RvQ2sMPKK6C5YPMjNkrJcOw/rkSR/s2p36tulNaYH
	 idVBXaPKcC0wJ3BldiAhxDN1B6NPKWQuTwfhtEP2nBnzEuq66dV5vAgsF7VPuUU+tT
	 rTWCDGJ/jgWGgLriEkdMgy0wu8nxrkpKHEmej9c9YmgkQuAibRByt3Q/P0OCxOC6xF
	 bTQYrdn5O3S2Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Jul 2026 23:52:55 +0200
Message-Id: <DJNKGRGHSFEA.2KYSDR2HKUEC4@kernel.org>
Subject: Re: [PATCH] nouveau/instmem: use iomapping interface for instmem
 handling
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260623223320.3837840-1-airlied@gmail.com>
In-Reply-To: <20260623223320.3837840-1-airlied@gmail.com>
Message-ID-Hash: XK5PHI2Z6PQN4XQJ3A5EVJNWWVKMEH2T
X-Message-ID-Hash: XK5PHI2Z6PQN4XQJ3A5EVJNWWVKMEH2T
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XK5PHI2Z6PQN4XQJ3A5EVJNWWVKMEH2T/>
Archived-At: 
 <https://lore.freedesktop.org/DJNKGRGHSFEA.2KYSDR2HKUEC4@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jun 24, 2026 at 12:33 AM CEST, Dave Airlie wrote:
> @@ -172,8 +175,7 @@ nv50_instobj_kmap(struct nv50_instobj *iobj, struct n=
vkm_vmm *vmm)
> =20
>  	/* Make the mapping visible to the host. */
>  	iobj->bar =3D bar;
> -	iobj->map =3D ioremap_wc(device->func->resource_addr(device, NVKM_BAR2_=
INST) +
> -			       (u32)iobj->bar->addr, size);
> +	iobj->map =3D io_mapping_map_wc(&imem->iomap, iobj->bar->addr, size);

Apparently, the u32 cast was there for a reason. nv50_bar_oneinit() creates=
 the
BAR2 VMM with a 4GiB base, so iobj->bar->addr includes a 4GiB offset that w=
as
truncated by the cast.
