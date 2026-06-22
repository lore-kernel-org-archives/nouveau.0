Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F26CCD98F2
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 17:51:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 41E7F10E7C9;
	Mon, 22 Jun 2026 17:51:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="N0SQLaX7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8791646C94;
	Mon, 22 Jun 2026 17:36:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782149808;
 b=BnMSUYMB0olH58ZCGL1S+g65qFKRRlEOtMBm/jHVnnTmqBHO7Z82vwlZaq2gQ+WGk9aW1
 F/exRtKKXJCGw0FvpFmMgLFpY/N4xNy4tZKW98a9uX02QvhpHIX68qrULwHXedDNC9M3KNB
 vfAl7zLH7etxGeuKT3RlGoCAu4Wg1ZqeOC3/FkCVKtCbn3KCr/tAWt9U3GtZiFIUx5Jo0b8
 qEZuZXn5PjEyu1h/HuMCASYFdZiWR2ep8Q01hicuVnh1nk7JXckvKVWTnhD8IHxTEsn5I8c
 4zWGgvUJMhRQnFw+enMeAV57QxAQ3MXawyfHLWS+ygeRqa5JeLPvm2uJM8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782149808; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qaTMOMArbJO9+bFRaoOprCcsGyBpTalp5WHHmMeRU3U=;
 b=BzF1sFqrT/PH+haRXpZgnxyy4VIuE1AnzDkN5UIz1SXYKx9JmFfSyIFCICWEhn41HG04b
 VHrmf5h9+QWLo5dpnfHARp20onx+v21D8ohmwhVMQt6ItDWRV923KnqbOuvSdsdTLPnYZv1
 IOpImmDzAUZljlQhBGfuOx4PZwZRBTI+yabvfVU3FGpQf+kNkoisiEANTzaccC3L2+GYOmA
 abamU1u1KZy/TTCiGhaiyA6GBT4l7OMGoU1XCHjDaUl9U0ro9RIIuelbPz9E1I2106LD2MD
 RZbP03BNHGUdGneIagJWOOZs9c+HGAffe4AmABQVu4hQp7cPAL5K35l22OqA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 27CFB46C6C
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 17:36:45 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 864F710E7C1;
	Mon, 22 Jun 2026 17:51:09 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A2F7601F3;
	Mon, 22 Jun 2026 17:51:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF1421F000E9;
	Mon, 22 Jun 2026 17:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782150668;
	bh=qaTMOMArbJO9+bFRaoOprCcsGyBpTalp5WHHmMeRU3U=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=N0SQLaX76cjgaI9P7c6P9J3nP3brat1Paxtb+UVWEat1qvWnzi15leZm7Tg+04lSm
	 goxLZB0NlNTy35HWzcayeCfMWC/zGJtB2FbgxL19bOm1O8zjTLHknQJFkBlx/nW0Ir
	 rch1tOg6I17/FjZrXpypqrTW4fqwJsyscJ202J4nFAgkrYOKiiLT4cXOM5Ce4Hu5co
	 Tse+7Fwln4MiJoQfgA5O+ZRZQlfo9+DdHafud8qaVyxkOeAGyIrZOpVXywamN9KRKI
	 +5TlXfhdKgDnD2h4nvdVS4w/er2w77EpzBDUNn3LVu76XMmGc7DjyobfT9ZASyrdqs
	 3tVBy9J0cstUg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 19:51:03 +0200
Message-Id: <DJFROOH493EG.1ODJ1NF6VVMPV@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
To: "Philipp Stanner" <phasta@mailbox.org>
References: <20260612165409.54447-1-tvrtko.ursulin@igalia.com>
 <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
 <DJEU27KUZRNN.3R1F8AL6UL30S@kernel.org>
 <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
In-Reply-To: <d3e27b911dd1c0261c2c4d7d65d12d6c1aef58ff.camel@mailbox.org>
Message-ID-Hash: HSVB7ZWD6Q4CRYVOPQX5GB6J44JDVXZJ
X-Message-ID-Hash: HSVB7ZWD6Q4CRYVOPQX5GB6J44JDVXZJ
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 nouveau@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HSVB7ZWD6Q4CRYVOPQX5GB6J44JDVXZJ/>
Archived-At: 
 <https://lore.freedesktop.org/DJFROOH493EG.1ODJ1NF6VVMPV@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Jun 22, 2026 at 10:57 AM CEST, Philipp Stanner wrote:
> Tvrtko's patch does not address the RCU issues you mention, nor does it
> address any other fence related issue except for adding the comment that
> should have been added back then with the fix in nouveau_cli_work_ready()=
.

I described exactly that, with the goal to discuss a proper solution rather=
 than
arguing about which hack is the better one.
