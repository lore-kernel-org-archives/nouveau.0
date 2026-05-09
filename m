Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 381E8CD3447
	for <nouveau@archiver.kernel.org>; Sat,  9 May 2026 22:06:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 61A2410E089;
	Sat,  9 May 2026 22:06:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ejB7i+Kw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B6B6D45E2A;
	Sat,  9 May 2026 21:53:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778363610;
 b=C3ziFiNi+5R/yRWwPL3M7BuVXlmc9mx8wxkVwVns1UK7WKrBpoSBmvKOHW/XjmVMecQbw
 A8SyWWeT8avlxWfLxqrXNOCasPoXJA6MxZla0bSs55XaQ79YAJTDLhdYzgwhvB7ebP/3m0k
 5PJwJaVd4oGHScXBoMUcerIdXanAA3IZim8OeoIE+kLwOYir9mQ2uqz9W33bgRt7IuX9FFr
 EiPA4GvpnE+2Uz3I+boGfIx8IQdNTZ3/J5AWzV9HX/xjbOPI/vyt+hepEEqMylWpOl8Y6xx
 rvGF/KkDRTRYYzH3aIXEIKwZik9KL+O8YV1i6YuqCA5o+Y8BGXuGOBZ7IaDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778363610; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Gg+TmvKnEKsF+0dw8uYMyEIkSq+hY+ZSL+TVRFDXQ/k=;
 b=g/w20xRs0uGjcR3RvWCbxPbNTIOkmpPDCU/BLtrvbnyhGpv0PNMX8uE64MbWD6ri7aQig
 IwUw4+R6kkcq1z+2vdnFoHsMeGchAIAhK37SeksYNkRIFFET8aZfZa8JJ5rSFjnAJKhBdUt
 +5l/xF4Pv85UvE8jD+gQN3QsGyZRz+XpxvUJCkMDuEIY5OZzaFGBV9C1Et7d29oTwuxQkFa
 hqQ7dgsMGNmGVwdp5cOiSSY2Ldgbg0yk7gi4f+ykcsDJwuh0hO2uDfNV975nHPaBnwqMxC3
 oeTjkA0GpH2Fv7emZOHRFKGAJh/VH7KAP/0Do4ekxb/1S8egnNpIx5oUEeGw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C151D45ABD
	for <nouveau@lists.freedesktop.org>; Sat,  9 May 2026 21:53:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 16E0110E011
	for <nouveau@lists.freedesktop.org>; Sat,  9 May 2026 22:06:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A630343A66;
	Sat,  9 May 2026 22:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F4EC2BCB2;
	Sat,  9 May 2026 22:06:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778364374;
	bh=jLebB78faaTO3ezfY+EGtQDqkly2LZoS0VU36P6SUW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ejB7i+Kw4CMk7qvF/DIVGuidG6ch8qHLfVJmS226VI8koN5/KS5lTOE3us9dWK2TM
	 kPHV2RKvMb6/TkM0V7dKPmtPpeL+fLTjakEI+SLiEnZpvnz297LAGfd+rcn1k3ZRBR
	 BVdkkprIGwJfTGVULKFrEczBfNfJETmNfFkveg8arTz55iAy1z71l0VtmPgp1ArEZU
	 2i+TT0bwswJO0HY1K02X4B3aOkEf0mutonLNAKu3VHy7ysDMHYyNhYJN2oHp387RWx
	 QcMRMZsdomnMNpQyOUBWwuuF2upW8UHC3ft5bLvZWMrTw25XO+qKCTi58+GE6NbiWF
	 RRR/WhvweXHCw==
From: Danilo Krummrich <dakr@kernel.org>
To: Cheng-Yang Chou <yphbchou0911@gmail.com>
Subject: Re: [PATCH v3 0/2] gpu: nova,
 nova-core: rename drivers and directory to follow kebab-case
Date: Sun, 10 May 2026 00:05:11 +0200
Message-ID: <20260509220510.43922-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260507185012.1527139-1-yphbchou0911@gmail.com>
References: <20260507185012.1527139-1-yphbchou0911@gmail.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: OWAZ3YNZPARKEFFRP2ST6A3JFWCANFU3
X-Message-ID-Hash: OWAZ3YNZPARKEFFRP2ST6A3JFWCANFU3
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/OWAZ3YNZPARKEFFRP2ST6A3JFWCANFU3/>
Archived-At: 
 <https://lore.freedesktop.org/20260509220510.43922-2-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri,  8 May 2026 02:49:24 +0800, Cheng-Yang Chou wrote:=0D
> [PATCH v3 0/2] gpu: nova, nova-core: rename drivers and directory to foll=
ow kebab-case=0D
=0D
Applied, thanks!=0D
=0D
  Branch: drm-rust-next=0D
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git=0D
=0D
[1/2] gpu: nova, nova-core: Rename to kebab-case=0D
      commit: 4f3491f6ec85=0D
[2/2] gpu: nova: Use module names consistently=0D
      commit: 8bfe9d72cf20=0D
=0D
      [ Change commit subject to "gpu: nova: Use module names consistently"=
;=0D
        slightly adjust commit message. - Danilo ]=0D
=0D
The patches will appear in the next linux-next integration (typically withi=
n 24=0D
hours on weekdays).=0D
=0D
The patches are queued up for the upcoming merge window for the next major=
=0D
kernel release.=0D
