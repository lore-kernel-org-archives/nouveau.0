Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36C57106289B
	for <nouveau@archiver.kernel.org>; Wed, 11 Mar 2026 13:04:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9310E8F6;
	Wed, 11 Mar 2026 13:04:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aC3gA8+l";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1F03145081;
	Wed, 11 Mar 2026 12:54:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773233641;
 b=oA8fLdpjXQ3ZgxUsa8IpjigWwI699c5LSGOfyqbBT1q5B/IDjN4ymQiRlTNrMUkjuiwAV
 LJzL1DKim7BzU41BLvRgKAqZ6d7al7qJS35VrJ/CXo4t5VApqn+VJrrysCHq5+Z+4gbE6Wi
 qatiZGBJ9fLk+OmJiKppD+5mM1+oW3LEUOa/SsNrVovhzI1oRo8rzk7jBhOHAp5RtMkAwXw
 LezO/V4/VQyAD2K575dFT5FQSIZZNP1DvBFmtFOwDqBIVUn1rLEXE4UKQc+5Mw4bd6etdhI
 T1KnKkN3ETrp7OL6YwtXeYAhL0nQdtTo4veYWzb72FB95IbXekwN6aEADSbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773233641; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=x2f2kLLNlfREhUaFvz8oTtk0blO9no/cjE2kqFA7jwc=;
 b=f1pnKdM94hd6Elxvrw4i2Wwshooju6PLj4I2Fuwt/YljUjhXb6QIqQc3zoazUcom76rmI
 soCLxm88SWdcM1ZUQ39B3fi9wIs4Nb56LhSDcdI99KqQnQSLemRLkZzRiAJgKcOtb3KzhAJ
 Ufr4RPDBM+xKYM73n78MZfct3UldAkki5510+fYSRvFW9gLTeScgvYxhp+4gN+FUuoBn/13
 2L2ghJR3DRodYmHiVKtAjqLujoq/9mNUl6E2yDj8EuHPrvumB+wXIpZm2KUAwqMfdcYDDF2
 VZXx2MkIFjLxgAjvDn1vVm+K3hjd6gUYd5Yq9izFCFrqK55p8UUxqelGK3LA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A35B642BB3
	for <nouveau@lists.freedesktop.org>; Wed, 11 Mar 2026 12:53:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC1B10E8FA;
	Wed, 11 Mar 2026 13:04:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 43B4C60054;
	Wed, 11 Mar 2026 13:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370DDC4CEF7;
	Wed, 11 Mar 2026 13:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773234273;
	bh=x2f2kLLNlfREhUaFvz8oTtk0blO9no/cjE2kqFA7jwc=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=aC3gA8+l19+CTnNAquVjKHf6H9F150rQAK6jgOTV5ZvkMINjX64kRcDP+XiYnWyfK
	 qDpwvxRe7weHnPgybTkkV4TLwGF0LUWlpV3xGQKywzXxOjk7waDJOQ34PtzJBnGPco
	 hJoan1VBoMYr+s4i0NS+KOzd5psMWIDiNtouPu7JPFxqWjGFEm0wHecpWpOesDuCeC
	 uPn2ux8QL0ZaOTrXEl3qxXxUopQxwFmf7DI9JWLE6C1weT8xwtoWVRqykWi3eOrL7s
	 SrmYPh2QzovY8qTCvu4/tsp+3+vJSAljdZ8PVmJgPN2IJnYfGZgI4BK5q4MXTzmple
	 d56LLAFWkQ8vw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 11 Mar 2026 14:04:29 +0100
Message-Id: <DGZZ35ONHS0Q.N6Q05IA0T0IB@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] gpu: nova-core: gsp: fix UB in DmaGspMem pointer
 accessors
References: <20260309225408.27714-1-dakr@kernel.org>
 <DGYQCXD2VH23.3D54NHJH6I0VA@garyguo.net>
 <DGYSTBMF931L.3OV1I4IWUW4ON@nvidia.com>
 <DGZYYB7XDN4N.3L7ZRCJSQH2QE@garyguo.net>
In-Reply-To: <DGZYYB7XDN4N.3L7ZRCJSQH2QE@garyguo.net>
Message-ID-Hash: XONPNOTO33RP2OFY6DWBH5RS3V57DFA2
X-Message-ID-Hash: XONPNOTO33RP2OFY6DWBH5RS3V57DFA2
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Eliot Courtney <ecourtney@nvidia.com>, acourbot@nvidia.com,
 aliceryhl@google.com, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 dri-devel <dri-devel-bounces@lists.freedesktop.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XONPNOTO33RP2OFY6DWBH5RS3V57DFA2/>
Archived-At: 
 <https://lore.freedesktop.org/DGZZ35ONHS0Q.N6Q05IA0T0IB@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Mar 11, 2026 at 1:58 PM CET, Gary Guo wrote:
> If this patch is intended to go through -fixes, then we should really lan=
d your
> series via -fixes too, otherwise it is just causing unnecessary conflicts=
 on
> linux-next.

It has already been merged in drm-rust-next, so we will have the conflict
temporarily. I say temporarily because I will backmerge once the changes in
-fixes hit Linus' tree anyways.
