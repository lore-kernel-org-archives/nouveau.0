Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1BA10F286F
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 20:58:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D357710EF92;
	Fri, 27 Mar 2026 20:58:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="H1croIWx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ED2D14532A;
	Fri, 27 Mar 2026 20:47:36 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774644456;
 b=HbWxmh2dE2aZuP5WLAaBWMJw6d/PNrGADkJI7QXqj0j/BfjRaR/xguUfflDxpF1KSuyGz
 V0XtvwoltZ0GUlgutbP78GPZK99oZ9SSUK8LVAi3nJ6vUCfpoSYzmQWn9BHAUoDWNTNdkvN
 3qNLhs1srUJuQ7XhM+xPtuRh0sO/rwiViWVjCuuaIyU6o1AuX/ifwCfYdBrcPEBZuys/1VC
 EbiRkxqpFMbCKRq2HZbvRnlSCBCcNDo7n+F3hgjl7YydfPBa0Su84O1y10nAnso7lKHjaYM
 X59cj78m78PEKQUza89HMsq8+nVIJhvkWFOOun6XEO/kows0BWdGiRXvHb/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774644456; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XlLsEYpYc3Vn4BgPPTHxnqP+JoOWIUm9HXvlVN0npB8=;
 b=C62sh7R6NLnmmhmYHagMQaO8p8zhra9fAE238zj3OUcWCK3OAPCVt8MLOOxENaVbXCn5Y
 1A1eJvMcirYb/UhaZ76ZvWxYuZGJUz0fQmEd3CDLtZs9mH/TLvz6aQus1m0M5qPSouX/eU5
 kit32Z70uP9xFxuDeaZzQyn88Mixg+59UsM//QptXO3rilpvnuY434KZbdvMRmx1ErHEliL
 lOcI5nmj2f8YRDJ/Hscg0RkzjTD252vdor98XOahXunkOI8+hvsRSKfzyIsMpVrwZbHXUXy
 5bjFuMJaTi6KFY6W2uwtQAI8vgphGWRS8d7zQ7VFc4xt3NyeQ7nfVYyd/WhQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D5737445E1
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 20:47:34 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9A9D410EF8F;
	Fri, 27 Mar 2026 20:58:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8284A434E8;
	Fri, 27 Mar 2026 20:58:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92E5C2BC9E;
	Fri, 27 Mar 2026 20:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645126;
	bh=XlLsEYpYc3Vn4BgPPTHxnqP+JoOWIUm9HXvlVN0npB8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=H1croIWxsEJ20G4Gy7O3hhhngoHXMBTUmNYSsKkKGmiV+t2lO72QbEHcVYKRfJDVM
	 Y035/OIt2XP2763dUGyjfa3ULjb6KOrYSZFaHBv9Vp3e0t5gp6DBCqIXgpKecOT12m
	 wEO3egtP7TTjNxyUcVeDtxb5ADFusrXREyuCXsBOuOcgOvzhs02kUVuiZA7TUVqcp/
	 pG58TmvQXwSrPRguQVYCfoujBFMM0+6OihTrREW1pIdy2Z8wwKpDQooLFuTp0ByYrx
	 cNBAqAvfg6ZeKl7I/1hyue2AcP5s8fHaX52JdPt0672z1h/aYsRGHZuX2uEgMCo+H4
	 icWnUDgHj01Kw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:58:41 +0100
Message-Id: <DHDV6XWT2WII.14MZGICR8SYIZ@kernel.org>
Subject: Re: [PATCH 3/3] gpu: nova-core: use sized array for GSP log buffers
To: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
 <20260325003921.3420-3-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-3-dakr@kernel.org>
Message-ID-Hash: FC3DXHVGW6AC5FRWH5USTBE7U5RL6SHS
X-Message-ID-Hash: FC3DXHVGW6AC5FRWH5USTBE7U5RL6SHS
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FC3DXHVGW6AC5FRWH5USTBE7U5RL6SHS/>
Archived-At: 
 <https://lore.freedesktop.org/DHDV6XWT2WII.14MZGICR8SYIZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 25, 2026 at 1:39 AM CET, Danilo Krummrich wrote:
> Switch LogBuffer from Coherent<[u8]> (unsized) to
> Coherent<[u8; LOG_BUFFER_SIZE]> (sized). The buffer size is a
> compile-time constant (RM_LOG_BUFFER_NUM_PAGES * GSP_PAGE_SIZE), so a
> fixed-size array is more precise and avoids the need for the runtime
> length parameter of zeroed_slice().
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next, thanks!
