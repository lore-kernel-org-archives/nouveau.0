Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8751DCA9EBB
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:48:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DA1971122EE;
	Fri,  9 Oct 2026 21:48:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="frc3MO0o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2C1C248A25;
	Fri,  9 Oct 2026 21:30:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791581427;
 b=XcxAt/v/V72lH0UozLjIsizcpukRrdSIj4yPck9Lu92FYyoUfOHqwiYC9/aG9IFApXK7p
 7Q8AcPlTcHO9XLdWT/r6dPbUgRMkNbwKbux9ZQArOTQmomgAJya/SezlJ/R/DyDTTlw8u9E
 cTB6mm6CL0rHHCZ5/7GMJoEkMYxAeIBQB350maQfawFDPUNzsiaAqwxlICoz4XMVnhuWwfB
 /xLrCsYFHMo49fE7066sLAZYmH4pvBlRdZ1QiBfX/ZHBEtygHTwSRAuujaMQdHlGESL/RzQ
 T9n77BTUJUY4vAi1DIVQD8v53V9zFR47juKzubN++KGkjm5KFo1u3WhjgBmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791581427; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nhLyzFLbeYwxkREFnGh9PJAu9SCFWSJxG53+Un2C+Xs=;
 b=qZzk1hewfuBHd6J/HW2Jk5YFFNxJcLJQnPDzyU6kgexuGtBctsT8uj4ZBFihQ6WGT9u02
 EDUc0eVrQsog1Zj/nStHgwqxyaqLoFCPuVbRketeQKLKf2dmz1ZPuXIisQS2XK9jksauiA1
 IdXsNsD76j6PoBFOXML4ay4pLhCdsZIK9vKY2RsvKD+UBU1bebiHh8xjedkOENrVmEUppmR
 yeAU63fn3jkDLzRfWrp07ifJh2ivIe2sOfCB+WBOF7Zh2qkNUxctV1+gIjASLYwWHbwhH+B
 lh5uw33Uf0P0pkYL3WnmJuQ9cVF2QTU62JfZg5AIDrZr5Wtl0LLRErl6Nb4Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7E01048299
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:30:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14FC910EB43;
	Fri,  9 Oct 2026 21:48:51 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C4152414E7;
	Fri,  9 Oct 2026 21:48:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0827A1F000FF;
	Fri,  9 Oct 2026 21:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582530;
	bh=nhLyzFLbeYwxkREFnGh9PJAu9SCFWSJxG53+Un2C+Xs=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=frc3MO0oLwoW78KYn9WR2TYojNVZyRylZGUJvnECnSjMLbzA9ex6iqrviOc0mk+p7
	 RNSblRdShqysDtvAJgj2HjufYQ+5RSpbV0Em1490xs8Bq0rWS125mUAceqGZZx0NN3
	 1Q8oCLnt/zw/JFdleVZp7gY/t4fbefTiYa+lgbK7K/q8aUY7NEau5lYgHbWlRwZeKA
	 Wmu5/nGXWS0hvoys/dXmStdNptC0Xv4jiTqu5gQVvV2DXbS6Lx3wXqTxnuai+PBf4i
	 wbhzHoquWJoqn9dmgIrFGRczQKiBoiRO06CFIt4P6bpmqAXV1zRQ2FsyijEdbqMvMH
	 W7CYwke/YM3YA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:48:46 +0200
Message-Id: <DM0N02GT1YII.Z30F7OBT9XKX@kernel.org>
To: "Jim Cromie via B4 Relay" <devnull+jim.cromie.gmail.com@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 2/3] nouveau: Fix NULL pointer dereference in
 GET_ZCULL_INFO ioctl
References: <20261009-my-fixups-v2-0-839e2bbe514d@gmail.com>
 <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
In-Reply-To: <20261009-my-fixups-v2-2-839e2bbe514d@gmail.com>
Message-ID-Hash: JSK3KCHPRA7LTMURAKO23GXNWPPPPJDK
X-Message-ID-Hash: JSK3KCHPRA7LTMURAKO23GXNWPPPPJDK
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: jim.cromie@gmail.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Daniel Campos Ramos <Capitain_Jack@yahoo.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/JSK3KCHPRA7LTMURAKO23GXNWPPPPJDK/>
Archived-At: 
 <https://lore.freedesktop.org/DM0N02GT1YII.Z30F7OBT9XKX@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Oct 9, 2026 at 7:44 PM CEST, Jim Cromie via B4 Relay wrote:
> From: Jim Cromie <jim.cromie@gmail.com>
>
> When graphics engine firmware fails to load or initialization aborts
> early, nvxx_gr(drm) returns NULL. Calling DRM_IOCTL_NOUVEAU_GET_ZCULL_INF=
O
> causes nouveau_abi16_ioctl_get_zcull_info() to dereference gr at offset
> 0xf0 without checking for NULL, triggering a kernel page fault.
>
> Validate that gr is non-NULL before inspecting gr->has_zcull_info.
>
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>

Please add a Fixes: tag and CC stable.
