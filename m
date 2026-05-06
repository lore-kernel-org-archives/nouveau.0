Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4DB0CD3424
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 08:42:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0916310E528;
	Wed,  6 May 2026 08:42:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CnLCB6nT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6ABDC45DD2;
	Wed,  6 May 2026 08:29:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778056169;
 b=HgkbAv4v3IX9UB3kFvQ5rbBfYdIbIpL+fDV4PWLVb+h3Jhd4HsYOcC48oVqFMWDSmTy+W
 +z+G65FlC8KWaJH/gXGVZRTccMaEy0UWAbznGOuMvlrrDuBG2L5eu36lPIfUNeNAPo8KVPD
 fssBsHWlFRSudxeceMQX9Z7SfJarYXTp4md7ZI9whGnzBcbyKwRRhaA0iVm8nyiLv2XmkB5
 6QY37aBXS+cB7vG8lHFTgHneuNMH8P3eXqHsgvqjTgA0wjpVmtUQtqsAN51oCtaJWX6R3Gg
 RAO+hmmW5URgO954TwKHjXlXQzT7wpFzb+791pBH+4wgZMTCbmd6Ic74mlMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778056169; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=eZYMw0q/cPtOcGIYMwqaXDCNwEMojNCBIGdbhxFqr84=;
 b=Y86/lnmuOg+sBwOZMO44FYR2Ux0AOuuEenZobY1TDiCxycKCTslojIxRAgqWRKux5ReyD
 fL+117WYQjhlVyQuiuNcLZaceBHDpKw27QCocL7gZuTDR/cAmPJchMS1v5OkjY861vjA+9T
 2vV22se1FVxNEcIlISthNxOYL84fmhir19cfV2r1wwW1mQo6zYmoPn6iGdsRsexemDyonpH
 Ew3Ln9Q6+dAK7+2/Qp/Ik2zkYo/ykcxpMBtxmXdol3lFfbRyVFlJQGIMeoUnzzlQIkG8X5u
 dlLsAvhIiUmuj/AykHl5NumXHxyrcFy7reJXmlEYKAm01DsBeV/GtBXFKI8w==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=collabora.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3DEF644F4F
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 08:29:26 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A14A10E50F;
	Wed,  6 May 2026 08:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1778056924;
	bh=hGYWyFzqC/3GRkvl0z9xEYhHVzSFJMs1carF/LBfyWY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CnLCB6nTNAZ7m6o0fOB8BIdr/YS42kDJSB2IodeeI46D1ZwsRCs9RyjwdQv2dkh3Z
	 /a7BHUh8h0D70cGt/0OuxQGM0W9mweAUdD4hxcM6CRn3scpWTLDRoPhfNouwjVoUYa
	 TJXoaS7NVtDSspC+ptCxhRtyhxTiq7QHdW8fE/h7NUBtaD+ObVM097OWUYTQpOAIWq
	 GrDcB7j85l7zvvxIomc9isU4r5yYDPUPUAI5QuBJHyZnVG6aCZsxl7R/xCwmKswyOW
	 kY9OOpTtuye92vtL8DfartQ4f5TNoJ1+QThCmDEa+oGMxdbHIxriaP7QHZlkAekx17
	 buAiXVcI4uqEg==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3B54217E0610;
	Wed,  6 May 2026 10:42:03 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: aliceryhl@google.com
Subject: Re: [PATCH v2 1/1] rust: drm: add RENDER_CAPABILITY flag for render
 node support
Date: Wed,  6 May 2026 10:41:47 +0200
Message-Id: <20260506084147.19907-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <afnMTfVfGq_iLXov@google.com>
References: <afnMTfVfGq_iLXov@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3WAKIKRZ5WSLFBIDJ5QIFVD2574C5XJP
X-Message-ID-Hash: 3WAKIKRZ5WSLFBIDJ5QIFVD2574C5XJP
X-MailFrom: laura.nao@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: a.hindborg@kernel.org, bjorn3_gh@protonmail.com, boqun@kernel.org,
 boris.brezillon@collabora.com, dakr@kernel.org, daniel.almeida@collabora.com,
 dri-devel@lists.freedesktop.org, gary@garyguo.net, kernel@collabora.com,
 laura.nao@collabora.com, linux-kernel@vger.kernel.org, lossin@kernel.org,
 nouveau@lists.freedesktop.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3WAKIKRZ5WSLFBIDJ5QIFVD2574C5XJP/>
Archived-At: 
 <https://lore.freedesktop.org/20260506084147.19907-1-laura.nao@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Alice,

On 5/5/26 12:54, Alice Ryhl wrote:
>
> I think it would be nice for this documentation to elaborate more on
> what this feature actually does. After all, it clearly took us a while
> to understand it, so probably others are confused too.
>
> Something along these lines:
>
> /// Sets the `DRIVER_RENDER` feature for this driver.
> /// 
> /// When enabled, the driver exposes `/dev/dri/renderDXX` render nodes to
> /// userspace. The render node is an alternate low-priviledge way to access
> /// the driver, which is enforced on a per-ioctl level. Userspace processes
> /// that open the render node can only invoke ioctls explicitly listed as
> /// usable from the render node, whereas userspace processes using the
> /// master node can invoke any ioctl.
> const RENDER_CAPABILITY: bool = false;
>

Agreed, the extra documentation will definitely help clarify the flag 
purpose. Thanks for the feedback!

> Also, I'd probably call this const `FEAT_RENDER` for consistency / to
> make it show up in grep.
>

Right, using FEAT_RENDER in the Driver trait as well sounds good to me.
I'll submit a new revision with these changes.

Best,

Laura
