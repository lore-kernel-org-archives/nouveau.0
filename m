Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C247CD2F000
	for <nouveau@archiver.kernel.org>; Tue, 27 Jan 2026 11:30:46 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 76C3310E54A;
	Tue, 27 Jan 2026 11:30:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fSTwDhJa";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9DDA940ADB;
	Tue, 27 Jan 2026 11:21:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769512906;
 b=jT51C/3zS8JARykok9RpAkZNZ/9qQ81ectenJKwqAsXK45BzINJnePqNVYG1rBL8wJ/J3
 MKmaEPJl1Jak31/whjSBolHSrcqnVern0f3Dqo+Ta9fTQbD8LRNJDmrLlopjKg2M5uubWvy
 h2LT1UQ7HQNPdgSycZc7lP16jzUqGD9Hgcp0oFlkRuqGmOFLpJgiyzIH7lmSP0Ex2mkNIMc
 eUt4ctRfwqy1XB0visz+YQr8elvz2X+WyoupT8aUBSuOKCqw/IctVkUYSN42Qhw56TmhLI2
 MghySD3af5WOFApHWQd8N8fNzr1iFNuSPwcvw5EHP1K+72SLAWp7TRVxDZ+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769512906; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SEsermRd9Nzxatg84guRU6bLuZBocBrS5aEf9VTMpgY=;
 b=R1VwVzn4zmr0YEk3Rti+0UyiJN9DrrMd61gb5NEw7+DjB/gjrc6rL8Y5rXJRZQWvAdSLa
 4jLr8+cw5E316w4KeTpwRE/PUXJ9g79BWYuqWxK7jKQcdkefo1T9S+jVsHOT0qPjbbPMOaz
 z0EGCdwZTQyNCbTvl3qF2g78wFi4XDXBKC67l/Ib4GVp2RciEGjZ6YM5yGlPDLXNbqI0o72
 XvkejGw58nIiZoDMV71hAu9g6uJhOgG/Fz6UJgB+KRUNiyLQO9JccW0Zs0n27ikf/Lfu0vd
 82tYt+dMo0Ds/OBEpLSn1ChTBhx5Wgd7vXQBsVx0AAk9+yAV1h+M0vCZAIDg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 65402400C5
	for <nouveau@lists.freedesktop.org>; Tue, 27 Jan 2026 11:21:43 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E980610E53A;
	Tue, 27 Jan 2026 11:30:42 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 42ED2600AA;
	Tue, 27 Jan 2026 11:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6668C116C6;
	Tue, 27 Jan 2026 11:30:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769513442;
	bh=SEsermRd9Nzxatg84guRU6bLuZBocBrS5aEf9VTMpgY=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=fSTwDhJa4RjeUe5bHhmQQIuupYlj6fEX0eDfwIcQntzAqcrzHzHhkMcxlORiie1qs
	 s+O8Vn9rCVgjMk75EFFPaTTKXr1Gb+rCEtN0n7W9KuTr1nC6i58nuk2YyJqZ7/jBBW
	 mE65KODMxKoIBXDfeOdCR4oeGYeDdwQDwP8VF948IdyoQtuCrdgPrDlQWGeZDiliiu
	 dXjFjuvtHYAFScu1Vlkwr5OccP4L/J7A7PgubW6geisn2C0TAXAESx+0Wf2lPM5PQD
	 tA9jq4CJr2D32EwedMWH+v8LBm081BhDROExL8yjRQWZII5tblCjLln9sMB5YMcfEW
	 h1WzEG9GTcTFw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 27 Jan 2026 12:30:36 +0100
Message-Id: <DFZC5UCV59NK.IUELAQIKP5MP@kernel.org>
Subject: Re: [PATCH 1/3] gpu: nova-core: remove imports available via
 prelude
To: "Miguel Ojeda" <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260123172007.136873-1-gary@garyguo.net>
 <20260123172007.136873-2-gary@garyguo.net>
 <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
In-Reply-To: <DFXZDYFOPVZ5.1EM568PBOZI1F@kernel.org>
Message-ID-Hash: WPBNLX7MTWAAP454RBWZZOATQDLKFGKJ
X-Message-ID-Hash: WPBNLX7MTWAAP454RBWZZOATQDLKFGKJ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Boqun Feng <boqun.feng@gmail.com>,
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WPBNLX7MTWAAP454RBWZZOATQDLKFGKJ/>
Archived-At: 
 <https://lore.freedesktop.org/DFZC5UCV59NK.IUELAQIKP5MP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun Jan 25, 2026 at 10:17 PM CET, Danilo Krummrich wrote:
> I will pick this one up after -rc1 is out.

I just checked and there shouldn't be any conflicts, so if you want to pick=
 this
one up as well, please do. :)

Acked-by: Danilo Krummrich <dakr@kernel.org>

Given that klint can do quite some convinient extra checks, should we consi=
der
making it an optional part of the build? Similar to what we do with clippy?
