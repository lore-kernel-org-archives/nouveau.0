Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64A5B10F2865
	for <nouveau@archiver.kernel.org>; Fri, 27 Mar 2026 20:58:43 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9785110EF8E;
	Fri, 27 Mar 2026 20:58:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="tD/f6+1h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B418445323;
	Fri, 27 Mar 2026 20:47:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774644450;
 b=GFOjc0VJ0IXRo2aUvpHpH5TFf9Vn7HCf/CxnKTwmvf89QJ36ylTRvWyD/PS6w5mCX9KU5
 XAIQfoTxyhClaS6SFz1mdJl2q+CDDzv8vBAG55w4kMzjLodrZpwxnBi7lAjOOfeiDGLFLZE
 kPY1F1Tad3hCo10uDjUetT163Ytnm+xWtMoblE5iUwPGeDjRgx1l9aiLfho5Nlq6nBC2rSN
 2RzCRgyAjReQ9AfLknB9GpVHqTKE+Bup3gVFIKkr1niUjOVKRJt6oSqAzmLIhyc0LnyecWJ
 hJ5ABWJa22T7PScT700yAtQU1oOr8zA+aSY3mT6x0SeA5lz6ZdLoYJlFLSag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774644450; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6jlUKI5SJaZ0+SeYdeQprWB7R4mJ7/L6ni+8RY3kuyU=;
 b=ap/8lUd4flseral6t2uGnim3xj1nETiggWFIIP16g0YamIf0L/Wkls9dfbp/kP892bcv6
 4Yl+mXXMwrl7a9bHtRtflR2QCk/vjZg4zHwQy728agaSsWtXpNxwkdTQxY4oGgTEEOf3RNR
 SYs9u1bZjwubw4tPYBx1IrROzj3mvJjxhzEz+ZFcVQt/m7GurbMIU34s3lQVDte/fL+89SB
 90FytXyrvptip7170XSSIrRShqZBXCLVQ7pWONiIw/R4EhxxWmSeXAy4em1JKXofBPlfGGx
 Yimrkt1gCsTNGEwxysy/JKJXAmv2c2+r2P+izkVIZjBB4UfnREoptbCcNMtw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 88CA0445E1
	for <nouveau@lists.freedesktop.org>; Fri, 27 Mar 2026 20:47:28 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4DAB910EF72;
	Fri, 27 Mar 2026 20:58:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1C770406C2;
	Fri, 27 Mar 2026 20:58:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA31C2BC86;
	Fri, 27 Mar 2026 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645120;
	bh=6jlUKI5SJaZ0+SeYdeQprWB7R4mJ7/L6ni+8RY3kuyU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tD/f6+1hibZ3IBUmKE7XL9cFeHAFRcnB5DyJyH14mdqqiHaza2YHRG8pjd8jyHFTr
	 7xTcoF05LC9gsSp6YLwhwqHT0uefzvsc4697RIdXqKAsm6UlRq58PqUKUANaGL6qLF
	 ZnwVt3Ot8TU8a7i1zge4q9n8rNMyBambKldhBHU5qp8N2Xnbhjl9iXjqI4EYIrv8gw
	 Q/uB7Q6XBW4EznkgU7TYbPRU+fKLjOsDxwY7HbsHpeceBx/fBwRIXj4sHoid4rHBx7
	 Lra2U+Ee0qR63jfEdgPUaAd2sF7m+1cYYTSAyBEMFrdERgt3aj2LHL4Q9vHsXuOc4C
	 VnO0KlFvnL7vQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:58:34 +0100
Message-Id: <DHDV6UZK4LB0.1P98SCT5CMJMZ@kernel.org>
Subject: Re: [PATCH 2/3] rust: dma: generalize BinaryWriter impl for
 Coherent<T>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
 <20260325003921.3420-2-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-2-dakr@kernel.org>
Message-ID-Hash: BQJK3DIOJ2OWPH6QHKBHUWKFTLXEPKVQ
X-Message-ID-Hash: BQJK3DIOJ2OWPH6QHKBHUWKFTLXEPKVQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BQJK3DIOJ2OWPH6QHKBHUWKFTLXEPKVQ/>
Archived-At: 
 <https://lore.freedesktop.org/DHDV6UZK4LB0.1P98SCT5CMJMZ@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 25, 2026 at 1:39 AM CET, Danilo Krummrich wrote:
> Generalize the BinaryWriter implementation from Coherent<[u8]> to
> Coherent<T> where T: KnownSize + AsBytes + ?Sized. The implementation
> only uses size() and write_dma(), neither of which depends on the
> inner type being a byte slice.
>
> This allows any Coherent allocation with an AsBytes inner type to be
> exposed as a debugfs binary file.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next, thanks!
