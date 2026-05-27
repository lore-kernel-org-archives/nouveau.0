Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C801CD5BC9
	for <nouveau@archiver.kernel.org>; Wed, 27 May 2026 10:39:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4B72610E77F;
	Wed, 27 May 2026 10:39:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Ke4tNRza";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DC89A4648B;
	Wed, 27 May 2026 10:26:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779877581;
 b=HBy2HhUFkz2l7U1FGvoBh/1cDpTmlhQd+zKrocw2vsFBb3eSv092CcXSlNtsi5zyx78ri
 QItpoKcp46vPAWQyG3vJa9/ZmxQ3AIjl5SBi7zXn0IWTCCPbWgjeDPBLX7Ks6ziStG67nhm
 YCLHNGr1NxVQpZmrwqAielu7dlumOppbZHLPzf8/uVI69raheuBwzbLpENDHOCdXZOnYR+f
 XIoUHE42WcYzqFQj2Zj3OV1BqqXR+1zdLtA9qFE/T3183IULDzpu0EDHknzWRPxiHFagnw9
 8zMUq4OE3IeWYcIqId3SQb5rJHHx29+MPtWvbGAQ7H4AYTs2sHcYZKhq1cSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779877581; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2amUF8cUcwPqh6wqAPS+j6IJ8uflyM2KHb04cXCLNDU=;
 b=nn+xuwgTK8PfU1WXrD/CKbd1KRqZ/VVjv+TQ50L8887xw2HS04kAi90Gbpv2/0Rqr8UfR
 k+g5lnigo8Q8JGNU1wmxM6DHko4jTLzlh0RqbXYlheNj3fgPbCoGqmWGYE3VZavaSafnzWG
 bYqDrMAGRqux1MmdLgAkEI2kPL1jJK0pHazSyQKHUFgyvGOZwL1p2aEwGFfiBXKvgdxfOX/
 MApzqLuiLDfB9kvlI5GET3MUpo8Lqrt2kHwpom5WUNZIlPdJjQKrQQXclPgS+n3t/QSWy52
 qkySjyQruWU6vDJlOVkjxeaRL5S7bcMq4MeeGmbuu+H6vAKgs+4QSWeMGHMw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6F3FC462C2
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 10:26:18 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6770910E793;
	Wed, 27 May 2026 10:39:44 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id F267544146;
	Wed, 27 May 2026 10:39:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FBF01F000E9;
	Wed, 27 May 2026 10:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779878383;
	bh=2amUF8cUcwPqh6wqAPS+j6IJ8uflyM2KHb04cXCLNDU=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=Ke4tNRzatvlJpxtx9OjYInrW/RNqXnKGl9/CtlAQJaO6INh5bScnEnf95Jaiq6DOO
	 ao5bE+daMCUsquaHEzqgtOA/S0pMmDAI9OYtPZ0DbRMzNgcs4gVblfrsoQZgE+f98W
	 MocZH0pE7/5xbt+Xezagn/HW6ZhUrTjrQZE+EPJ+NjOYYhbm2+od+Oaim0wJIUbVx3
	 FlfGusVcXGa3X5peOynmHjEMVdywfF8RMQxY4YoY6STG9JzD3cTaK2Rz+qWKT2yDZs
	 FGe0E96wdcDQWjPirZ9Ix2KrFUiacDeicn+D9c7OW6jUoKHEGTtDUU1nXs95BSYfyJ
	 i1s9syzAznfeQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 12:39:39 +0200
Message-Id: <DITE87NC3I9L.QHBKWC4PEMX4@kernel.org>
To: "Hongling Zeng" <zhongling0719@126.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] nouveau/gsp: fix NULL pointer dereference in r535
 nvenc/ofs alloc
References: <20260526014721.13299-1-zenghongling@kylinos.cn>
 <DISMY2BS8E1D.Q85V8DKCPM1C@kernel.org> <6A164F51.7010203@126.com>
In-Reply-To: <6A164F51.7010203@126.com>
Message-ID-Hash: 2JDQNMBLDVSP3R4KBCMA7XJZJ5YUW3ZW
X-Message-ID-Hash: 2JDQNMBLDVSP3R4KBCMA7XJZJ5YUW3ZW
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Hongling Zeng <zenghongling@kylinos.cn>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@redhat.com, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2JDQNMBLDVSP3R4KBCMA7XJZJ5YUW3ZW/>
Archived-At: 
 <https://lore.freedesktop.org/DITE87NC3I9L.QHBKWC4PEMX4@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed May 27, 2026 at 3:56 AM CEST, Hongling Zeng wrote:
>    Should I submit a patch to clean up the IS_ERR_OR_NULL() checks in:
>    - nvkm_gsp_rm_alloc_get() / nvkm_gsp_rm_alloc()
>    - nvkm_gsp_rpc_rd()
>    - All the callers

Sounds good. Ideally, where it makes sense, do it in separate patches and s=
end a
series.

Thanks,
Danilo
