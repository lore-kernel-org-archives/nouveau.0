Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AEBFE9A04E
	for <nouveau@archiver.kernel.org>; Wed, 18 Feb 2026 22:24:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 241C210E640;
	Wed, 18 Feb 2026 22:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TwgT2mGC";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 51000433F3;
	Wed, 18 Feb 2026 22:14:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771452861;
 b=cQvQE9ntOPqbnCC8KLjHySkoleAydAV9neMrdqkoxnDY/HMmL9x9e4HVdcX60lsOhr1UM
 +PKo2188EFOb/UH6x6cfJ2r+2eyUj+L5VixQ/rscHX+t5YE6FFcEQO9v4bfgIjvQHxpreX8
 HpyrzSV6iMzAlt1SWlA9ZYy44fDAgDtame8wAyccF051obwjVPBfZDnT69uGlmEBFnPNzLE
 gWw9V6yAqeZYoQIfM+4/sJjJRQA+G1m4NDkze6px9KSCtgUofG9CqwN83AvmAycYtRTeUB7
 fNp7S80LNFpi7UiucxXzJTNjjecrCi/jq/AfIfPAiB31ko5Gqe7GpZayTXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771452861; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/gqAjgslqI7rZOrhoGjfveMcmy2RALeEdm3756GqFEk=;
 b=krnSUvOnuGWeHpgPddBpBSwqK/Ec7SpKZd3QFwtg5/ZlKb5bLCMm9KNuX7vdvnMxRvSKL
 c/EsP3IBoc6t085/HTivwhD2RJ5+jjaapVRzAfd0rEwMf8oYZ+0laKnLstrBrFTdE6T5uIE
 IJeEazmfFZHJ+Bsfp59dIrZZ5hOr3rI2Ji8Nmm565Z80T7nIigcB77ma0nUVE1x0KZVMHyS
 cGyO9ClXp7mK4Fse9BhpV1l6QdmFS3PNZdf86dh1ZlOQc6xi5KWqz3b6tXOTWNWnPEHJxrO
 xTvIUKS8s6fc0pB0/xRdE03/gAqw8LvW4eKefckfGy57107HWhoWDJEljHRw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C6D2341E98
	for <nouveau@lists.freedesktop.org>; Wed, 18 Feb 2026 22:14:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A14210E639;
	Wed, 18 Feb 2026 22:24:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BE8C6132F;
	Wed, 18 Feb 2026 22:24:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FAF6C116D0;
	Wed, 18 Feb 2026 22:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771453447;
	bh=zQn0Q5wZfpk7S2Q8aholhB3Xtns3J/Vj36VDYCIlYi8=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=TwgT2mGCxSaU1yc8PMjqS55Ur7/a+wcxjcuI7d3a/94mTa3Y0AFqYd/8nfUv6vyfD
	 /+3lemhhupa/JVo+a3IYXvGC3201kjnFg5Onw6DBAhhr+vCuKQn7l0gPnfsR94W995
	 UHPgkpQZZVzmhIYLPrJKPweANgPFyY3bDzoh3h3YDbhbiaQTCQJp5tkdlRVQcSuDKB
	 KjxlfU9jFUzFS+N1jySX9rYXvlqjc7b1gKJxkbw4FGrB5wAFqi5HnX/QobLQsLPIPO
	 gavC4Nd3rxv/iSA/ViW2EZlvZmUtgIbD7CtX7eXRN5vl6azqgaCEQMmVPgKEDS5NSP
	 H8QFIWWJvfLkw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 18 Feb 2026 23:24:01 +0100
Message-Id: <DGIFU4JV4U47.QNCVFND4EA40@kernel.org>
Subject: Re: [PATCH v10 0/8] Preparatory patches for nova-core memory
 management
To: "Joel Fernandes" <joelagnelf@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
Message-ID-Hash: C4CTIAL3NAP6SJSJO73ZFTZ6NIJFHWRE
X-Message-ID-Hash: C4CTIAL3NAP6SJSJO73ZFTZ6NIJFHWRE
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C4CTIAL3NAP6SJSJO73ZFTZ6NIJFHWRE/>
Archived-At: 
 <https://lore.freedesktop.org/DGIFU4JV4U47.QNCVFND4EA40@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Feb 18, 2026 at 9:54 PM CET, Joel Fernandes wrote:
> The clist/ffi patches are ready, reviewed by Gary and Danilo. Miguel, can=
 you
> pull those via the rust tree?

I requested changes in the last version and have yet to go through this one=
. I
also think that Alex still has some comments (Cc'd him).

Please note that if this goes through the Rust tree, we have to wait for th=
e
full upcoming cycle before we can land the GPU buddy abstractions.

Alternatively, if it goes through the Rust tree, Miguel can provide a signe=
d tag
for me to merge or we can simply take it through the drm-rust tree in the f=
irst
place, if Miguel agrees with that.

> The non-Rust DRM buddy related patches are already being pulled into upst=
ream

They are in drm-misc-next, I will merge into drm-rust-next once they hit
drm-next and -rc1 is out.

> I will post the nova-core memory management patches as a separate follow-=
up
> series just after this one.
>
> The git tree with all these patches can be found at:
> git://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git (tag: nova/=
mm)

This is now (at least) the third time I have to ask for a patch changelog.

	"When sending a next version, add a patch changelog to the cover letter
	or to individual patches explaining difference against previous
	submission (see The canonical patch format)." [1, 2]

Please, add a patch changelog.

(This also goes for the nova-core MM series, which is flagged as v7 despite
actually being v2).

[1] https://docs.kernel.org/process/submitting-patches.html#respond-to-revi=
ew-comments
[2] https://docs.kernel.org/process/submitting-patches.html#the-canonical-p=
atch-format
