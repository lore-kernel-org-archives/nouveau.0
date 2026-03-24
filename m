Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3C29F54AB8
	for <nouveau@archiver.kernel.org>; Tue, 24 Mar 2026 14:02:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EBFCF10E6E9;
	Tue, 24 Mar 2026 14:02:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ASZzrdr6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 53301452B0;
	Tue, 24 Mar 2026 13:51:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774360309;
 b=w0jxn6GcGtSmnESNzHMzcoFnnFeeUrPCQi9nbW6CJL4m2ZdomcPBAsuCfz9nodFD33YIM
 WrWXn85g7JOAMsGYK/3O/W+xYIpYRbLnqBdRqgGeSujz9TUYJukpOA5OcZaVSMIkINsNbTW
 ZGcfirNzokEiRRhFVaLs5iAdmlAxu0Uh7A5FyZH5iIUePrSRNs4oz8j6sv8RWmQtUsBSq7I
 YM9lcbLDPWvtUQNgNLZNne52cujCYLb8PiWSzFusMB4Y7RDBHHEaHbZQjv72YwgZ6/3lzbo
 wWeSBzi+Uk5AwSHKWiF+dD0pfrzHgJDx9CLbhb6sbeJ5FYvY5QzIdPA44NdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774360309; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=7PpyUgaN+hR/mcrAloIqkwPScbhc6VOuFnHSKYwmy0A=;
 b=D5+SrkqfsJsxkvDThNsm+GSNBR36VDfoy9AdezZvOfVhquR3USxWLUMkS59ilI9X3C1IJ
 G6xkmObGq2Nb5kE0s1b406Ku1xvOQdQ4gBabEPzzyGoePd1s0HnYEEHesrusK/lnFQhYfG3
 sv/00pvuD5wojvB4uPuOl8Ie9yXSQ/olc9o8vadgUV3Bl+x/yll+hwI0LQyK1nA1L5IMvjR
 vmHLqWd1yyjxwPlOfpDuHwshs6Pd674YCLOJKzb/XEZ07eki/viFzyRkhZ3cjmmK0NsLsFV
 p3Fj76llTihj86qDukVr6SvOCQ51tHl6O7mUWrR3yjhRBU2f53to4dV5QSww==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5144F433BB
	for <nouveau@lists.freedesktop.org>; Tue, 24 Mar 2026 13:51:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AF65F10E152;
	Tue, 24 Mar 2026 14:02:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EC87600AC;
	Tue, 24 Mar 2026 14:02:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45611C19424;
	Tue, 24 Mar 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360970;
	bh=7PpyUgaN+hR/mcrAloIqkwPScbhc6VOuFnHSKYwmy0A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ASZzrdr6G1YNdy3VIWR9h0H2RO8QVyj7F4ekz66mXysHYPnmBf0CCRwv2TQz/vKd7
	 lowjFRVVKzhi/0+pguVkixUKuJVDT45+GxZph9cbkMNa4iluXzAaUGIFGzs9BFtJat
	 6hO5u1g49YHUDCxiC6tOzTETGItBOKB6o0p0kyw6cGzM4Q/c3u43XdBF36DNw9d0vW
	 qfpgMcvLwZKl4Ie1tca7dqy5WwHH/GoRr9bPUY3rCx4G8nXWaXkWPyLMJs8DjBhlpl
	 cJ9/uFyvZMLV7TI/8QHYtZF+M+Ms0hE7t0KpwqY9j81ySN7dZjVnFifkhQCf3Aw+a3
	 5Ub764AMu1Lkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Subject: Re: [PATCH v2 1/8] rust: dma: use "kernel vertical" style for imports
In-Reply-To: <20260320194626.36263-2-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <IFgpz7BJ1u0FZfIVnNpmhnmvYDK9ZkoGMuAsmVCXaQKcwPA9Mx40rNBRqxfG-PXr_fCNXYsWcjqWSrFvUdzo3g==@protonmail.internalid>
 <20260320194626.36263-2-dakr@kernel.org>
Date: Tue, 24 Mar 2026 15:02:37 +0100
Message-ID: <87v7elpbpe.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Message-ID-Hash: 3FXKAB5UC22NKI5LTNY3OCPTELDMPASE
X-Message-ID-Hash: 3FXKAB5UC22NKI5LTNY3OCPTELDMPASE
X-MailFrom: a.hindborg@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3FXKAB5UC22NKI5LTNY3OCPTELDMPASE/>
Archived-At: <https://lore.freedesktop.org/87v7elpbpe.fsf@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

"Danilo Krummrich" <dakr@kernel.org> writes:

> Convert all imports to use "kernel vertical" style.
>
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>
> While at it, drop unnecessary imports covered by prelude::*.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



