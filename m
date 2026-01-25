Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51724E63CA4
	for <nouveau@archiver.kernel.org>; Sun, 25 Jan 2026 21:17:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8C20D10E1CF;
	Sun, 25 Jan 2026 21:17:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="J7p6w6CF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4CE7B40AA0;
	Sun, 25 Jan 2026 21:08:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769375313;
 b=uzRJ67OR56omx5WltoX2W0ezZlIAdSL1/koSVVbM02r84jLis5FMrt2gXzJY5eQ5Veu3h
 B+GTX0FIL7GlcDxnx2l2C/EbyiAAFcPc52t8vr4x5dUXYZ0+5+U+qc0gUjtZ6994O2Chal8
 ieyiDbqzmLvFYLlwheAbRTTRgS5iFTUFZCJODS9r6RllHfacGwZftZvaQLyTm92ZnYVIraA
 xWcSSkUXDZlrXlc4Qpfzm2N0iWYExH7yuKAvAzN+Zov6raOMiKA77WFcRgqP7g30+HfC/45
 FP6MM6BK3Mx7I4NVbPqapLPcHNp79WyAYJx3B3EIleeLHuS3yaVDDWbCj0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769375313; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=P2aw8fg1hcqAS5/X9fP1N5WppHckO6H7eqIrLxTjsCU=;
 b=zcV6fJX7TbeHkQ3MOBXsLa5g8+OsAjV973Fc40/W9itvY5ZxBo2CTtWK9J49lR4I5B1Jw
 lBSms8Yt5HqXF4X4DgJl/9kT2yDo8rhf4rQdNFfs2zREm+Yhm5ZSCgD+G6jMq8TGFo1y/zd
 9xwENbybXOuLh84tTMtGTfpgXOQoBjo3s+R4gydvSlolqqSVHBScqZJVlHpgwAdAxovUfZN
 oeDP8r7OVeSpUHzlg+MHAdL3/1QFbZ8VQw86WVgTYIUfeZR9zzdzdpVh3tkZ6BUuTvCfFkK
 AC4sd6LJ69kUxyD2z93+fkBBGzE9dp6xJc+ymRXy+rThFBVnOEzPZQLRV3uQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4DA07400C5
	for <nouveau@lists.freedesktop.org>; Sun, 25 Jan 2026 21:08:29 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9AF10E0FE;
	Sun, 25 Jan 2026 21:17:25 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DF44F40A2E;
	Sun, 25 Jan 2026 21:17:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DD97C4CEF1;
	Sun, 25 Jan 2026 21:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769375844;
	bh=P2aw8fg1hcqAS5/X9fP1N5WppHckO6H7eqIrLxTjsCU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=J7p6w6CFZoRkIeWwp6Nuzqbqt6dn66hyrsPrL2A4LFxDcsb5lzxmRN77VO8bh+jER
	 Os+iazBiCmctL5VX+xVJF+a4GykfLXsjthZUDwykmfch6At6AXCxX+GZfBInmTcRdU
	 DGOromZVRJ9GoZebRKr1wLkTFnOzXjXglgYkNCi+WWaozA4P0HRwYF5ZJmZVoW1mGD
	 eUZ/35uVruMyaIqZheZfkZugICgKo7I8zvtWhaCnDpN76JaleXrsdpe6qac30zXY0F
	 ybdzxAFkeAcs6xcYVmsl3bPFUI+/nth9uPl7dnfhs5j44OXOiEWu2bB4tCI0S7NZEr
	 2qtuVJ575ZWaQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 25 Jan 2026 22:17:17 +0100
Message-Id: <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via
 prelude
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
In-Reply-To: <20260123172007.136873-2-gary@garyguo.net>
Message-ID-Hash: 3B4SOHK3GIW3FD6ITMYDDXEP5QQJP7VT
X-Message-ID-Hash: 3B4SOHK3GIW3FD6ITMYDDXEP5QQJP7VT
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Daniel del Castillo <delcastillodelarosadaniel@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Shankari Anand <shankari.ak0208@gmail.com>, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3B4SOHK3GIW3FD6ITMYDDXEP5QQJP7VT/>
Archived-At: 
 <https://lore.freedesktop.org/DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Jan 23, 2026 at 6:19 PM CET, Gary Guo wrote:
> These imports are already in scope by importing `kernel::prelude::*` and
> does not need to be imported separately.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

I will pick this one up after -rc1 is out.
