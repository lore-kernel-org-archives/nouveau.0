Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31432FF8868
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 14:54:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B349710ED30;
	Tue, 28 Apr 2026 14:54:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l74otaXl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5664945CA1;
	Tue, 28 Apr 2026 14:42:14 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777387334;
 b=vLUQecFm32GsU7eBmoSW6pua441xBIHIW7M2XjxVgLwuBm6ds0ZD5lQQPMFnm+dIQ+MZX
 76H9Jdm79fUQ+wJ9EFmSMBW3r5WsnngQ7oBIM6dQtcVBI2PvdR+Ol3JeQVgFMq24bD5GQnM
 5lCIebzijlDI624KYvBdOtUB9h7zZkrDVfNhV6r2TaEBPGAF1mHJMh68xjrggCn9apBzova
 p7+9/iabpXcNx6B7OL5ZqTANQVOExlF2hWAUtLuJj7+VjUYFXt98m8/79Pfbv3hlqJHWw8/
 5BPGz/kasduA6sd1IYaxvIHjctiYCNfCs7NiNeu+ahCngvD9W18QCAOD14dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777387334; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u5DGLyR5HD/1MGBsf8teWYoDSABc+D9y2JX4a/0KSqk=;
 b=FNbcu6gSw+VWfE5Ls+3sxdqKYzFlew1YBtF9fLgWYTKrK5CA+ivoPJaTzZPAFLk9rC5ZS
 5ItxvERVNTQtvTX80LDT+COXQTRoZzbVxHc3cePvmdrFjd53jv3Z8kJEUVrDkoY7Xxdk/rv
 /SrAgIc9q1VPP7qic54/p4heZizAcE7IuyLTTs9UGN/mpGnG+OzFN6Yg5ZilIQ+PKeTdl+/
 ExCKdGkm8kqVTnCn7ZkT+dnEnFijm1DXan4IytmC81mvsDJv7Qin4I5KZqB8OLbDB+tCQDF
 M+3pZTlgYraDhnNDeJ8LoNaqcJPmTHMJF/aq6zmqsyd1O1HvCA4Y/1OSDbug==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 483CA45560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 14:42:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF5C10ED00;
	Tue, 28 Apr 2026 14:54:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 319CC61119;
	Tue, 28 Apr 2026 14:54:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF5CC2BCB5;
	Tue, 28 Apr 2026 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777388071;
	bh=u5DGLyR5HD/1MGBsf8teWYoDSABc+D9y2JX4a/0KSqk=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=l74otaXlxwMDVQrDfF61j4VgU+FzRLy4fUUwF3H6HBpKmA03eU2LCYfmcAlFs/YEQ
	 A2N1h6J59/02mOogggPqpHHk82Ce1qP2xE/ZCsfZEef+E1pkeHtpUwdynt+dd/hogD
	 7nVypud7lcZ+QDTVI4amd84NirO8RXdycMq/D1ns7Bwmvvhca8kww+1hgsdZEQ64jD
	 bbFaUIBwxKuICOndPlEQBoTNK6lzRoET7Kw9ZKmlc+HWWvN7qOVnDPPfSCHs60E1K/
	 STxdm7uT8irGGSRmDMMd9kfbcEcyK5cao7xuoXS+Q78BjU1udkHw/1+ozpaMgH2bje
	 CBrRpKabXGycQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 28 Apr 2026 16:54:25 +0200
Message-Id: <DI4VHH97CABG.3VW1RVS2O10K7@kernel.org>
Subject: Re: [PATCH v2 05/11] rust: io: restrict untyped IO access and
 `register!` to `Region`
To: "Andreas Hindborg" <a.hindborg@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260421-io_projection-v2-0-4c251c692ef4@garyguo.net>
 <20260421-io_projection-v2-5-4c251c692ef4@garyguo.net>
 <874ikvqwyd.fsf@t14s.mail-host-address-is-not-set>
 <vYp32vOGPut322JQ-5jSBZQNd6eXvnOvg8b6YDhYcYzBqTBVUvSajCJng33oXSQ9wiMvb62VLERzLYSa4g2pJQ==@protonmail.internalid>
 <DI4QT2U1098S.3K9K7INQ86M0Q@garyguo.net>
 <87tssvp9sq.fsf@t14s.mail-host-address-is-not-set>
 <DI4SY1NXU1XW.2VHPFEKIFBQVW@garyguo.net>
 <87ik9bp2og.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ik9bp2og.fsf@t14s.mail-host-address-is-not-set>
Message-ID-Hash: 75TBJWVYQ3TTXUEFXU6XIJTEYAKJLZCL
X-Message-ID-Hash: 75TBJWVYQ3TTXUEFXU6XIJTEYAKJLZCL
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Gary Guo <gary@garyguo.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Robin Murphy <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/75TBJWVYQ3TTXUEFXU6XIJTEYAKJLZCL/>
Archived-At: 
 <https://lore.freedesktop.org/DI4VHH97CABG.3VW1RVS2O10K7@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Apr 28, 2026 at 4:41 PM CEST, Andreas Hindborg wrote:
> That is probably a good call =F0=9F=98=85 Going over the pieces again, I =
am not
> sure when and where I decided this was an index rather than a byte
> offset.

This is not the first time I see someone stumble over this, assuming this h=
as
index semantics, i.e. I assume there might be something creating this
impression.

However, I can't see what that might be (probably I'm too used to the C
primitives). In case you know, I'd be interesting for me to know.
