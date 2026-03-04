Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21792EFCE4D
	for <nouveau@archiver.kernel.org>; Thu,  5 Mar 2026 00:00:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 518B810EAE2;
	Thu,  5 Mar 2026 00:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="mGCQXwhZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2B86444E6F;
	Wed,  4 Mar 2026 23:49:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772668181;
 b=cQZtnPNccqMuTtyVGfLqzLy/IsyNbYSLO+0O/GudJTGIZnxhf7JS+r1NH2wJ4ggR13ASe
 db4R7d2AplG57LK+SRu1Plg9e0Rv8/rBMPFZrnqtVwg03a8bDlMAbwzX+lr7LhzIuQpMNeB
 VlcK+PHxcJWgSoP7UYPlKU+BOWoXIwCn6cELSiXZf0TyG5wsLSJ1pkjVcgn4n+z2H8jTS6t
 2qTwfiXGSiCw9CM7oEnph908fRSTQ/PeeptIdFOZHFTrT2xNlb+/SlVTmS3c6zV7FHGvT3u
 TZ3+oEdrRK4aiPsRAB4a3y3qAqYj5I0vQzgTfA30vxMdcnrwD8K5OydOoHCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772668181; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7GqYw5Pu87/AffcDaoPwsaMLaPL9JlCKUhGyzO/+gKg=;
 b=fw6y9I9mWgAfTKFKwoni5dxyXSkMXDftkNww9D2NIJy0KajXkZjBtSSGTNXzf8YaO9VYN
 VWHm5naei+ore+rYC+60GNJ8b1OCWgIbhh4gIrC4hTmScmLc86vPp8Ig/hypQDOxXZopeR8
 9+uQpauAfjIQwndh1yVOHIq2LJeOyaThGAwLnIYDQcuaZIFFemPaVty7DxwiiIYiPjXERwy
 mliU+D32mLJBQ9fg5LonOcBVCD95j2Jz2QcyHi6CKzAjcuxMsLKBBaoALox7dZuOOQohTKM
 BCSZTYkuecS70iKTMJV4BbH1cS64gXdX5Pkqqb84QO+NzJJZCSsQ1Vjcx4cA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 19D4044E37
	for <nouveau@lists.freedesktop.org>; Wed,  4 Mar 2026 23:49:38 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD14310E157;
	Wed,  4 Mar 2026 23:59:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E31D261340;
	Wed,  4 Mar 2026 23:59:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37832C4CEF7;
	Wed,  4 Mar 2026 23:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772668797;
	bh=7GqYw5Pu87/AffcDaoPwsaMLaPL9JlCKUhGyzO/+gKg=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=mGCQXwhZhhcR3WYvFKs84pAGb7agdeLh5/c+ksgy0GuMEwmxLSorkaTOjT78a+JpF
	 IlEh3tnFFCCWhoh64LTD1OLK7ZypbdnPD+eIjqEyujT0iztCA42CNid3IIkXkxN7ng
	 lyYAObhK8/r8Et4skyxG3e3H4wak7mxzGLDmGgt7xV0lTxWf2C6NvSkf3poJSz6Jnd
	 bTNuwpvB1rKZcXnveYhTOa+MjWJSaAyxdZAEdXKA/7wZhL27gpOPwhuSU++ESi3GJu
	 QflIUl4JlpD3zDZbErRg2frxRXmp9uvW0sF/jur0n1c4I0RT0iBLKp7A6kenB7ir/t
	 ptJjq+i7OWW5A==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Mar 2026 00:59:52 +0100
Message-Id: <DGUEN4UNMUT0.3GQ73H7YWHQNL@kernel.org>
Subject: Re: [PATCH v3] gpu: nova-core: fix stack overflow in GSP memory
 allocation
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
In-Reply-To: <20260217-drm-rust-next-v3-1-9e7e95c597dc@proton.me>
Message-ID-Hash: WCOPTZJ75SYWSNJHDETTECK7WPXS3Q5W
X-Message-ID-Hash: WCOPTZJ75SYWSNJHDETTECK7WPXS3Q5W
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WCOPTZJ75SYWSNJHDETTECK7WPXS3Q5W/>
Archived-At: 
 <https://lore.freedesktop.org/DGUEN4UNMUT0.3GQ73H7YWHQNL@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 5:01 AM CET, Tim Kovalenko via B4 Relay wrote:
> From: Tim Kovalenko <tim.kovalenko@proton.me>
>
> The `Cmdq::new` function was allocating a `PteArray` struct on the stack
> and was causing a stack overflow with 8216 bytes.
>
> Modify the `PteArray` to calculate and write the Page Table Entries
> directly into the coherent DMA buffer one-by-one. This reduces the stack
> usage quite a lot.
>
> Signed-off-by: Tim Kovalenko <tim.kovalenko@proton.me>

Can you please rebase your patch on top of [1] and use index projection?

[1] https://lore.kernel.org/rust-for-linux/20260302164239.284084-1-gary@ker=
nel.org/

Thanks,
Danilo
