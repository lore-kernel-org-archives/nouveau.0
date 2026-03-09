Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA72CF41812
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 17:00:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 875FB10E573;
	Mon,  9 Mar 2026 17:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l2RNgURe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E3FCE44F7B;
	Mon,  9 Mar 2026 16:49:44 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773074984;
 b=czsUKt/dF3AXf2YeruaBM5liW7w33w9fJUqKT1Yuasjebn2hNWs7p9CjYn8tdk7l3dh6R
 Y5gl5u9WB+kJDIuJWcP506nct3yptU/Es+aB81MJRZ4bcvu8lMK4FPmZ5v1JvTNEFLxYvHq
 5mSOhPr89qyKStlPiB52B+eT4NO7/OLMjJQ2Q9+i3rxxfQ+fDoQ756MUkJahYUKxBGinCo/
 lw+FotbD09HD8kDIZ4R8RenbKICs5tszLnOaWb9o1Q9p2zPIQ51EdlZJv4vLfUVVUOXOy6b
 2iS6wieCMFJufOo8sOt51joezB5p5wDYy0aP0/pe4l1rnr8jyOXbyKCis66g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773074984; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CtqSZRrtQ086u71AP2P/+EeQ4W/0e0n5IIi6cp4D3LY=;
 b=b6vhT9ok/kmLqS3GbJQI4s8K8flJDdFwwT8aTBTCW+eFAjKj8F3pjTAgp6KZ4RdPDqfeG
 UXaYq3Vqvoqf6PLyIOSTm635eTRGZMlowKPoqbEkCvEe9f+vdYlcv/iPxevCaIowHXQN/vz
 bE7xbcYsFrveVCnXbGq1hM5kPYDLtZz7TzyJeTWrGy6ndUafFDspF6qIWSOxNbfLuH9HUws
 6thvfux4XtJkDCIzBahGfKZ8RMTXLzqZE0zowjevkvypZn4AtoFbVwEhOcMbzFEPwgdRVlu
 1/ZUX9qNsiWTfVyviDa/dVj1M3zRbVtd2gbmNhPtU18KjLfqUefc1bCFCm3Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 16309404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 16:49:42 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7565F10E569;
	Mon,  9 Mar 2026 17:00:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4C89344307;
	Mon,  9 Mar 2026 17:00:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 874CFC4CEF7;
	Mon,  9 Mar 2026 17:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773075613;
	bh=CtqSZRrtQ086u71AP2P/+EeQ4W/0e0n5IIi6cp4D3LY=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=l2RNgUReeisohSOqQEi1BMesOrHU+atDi+li0Bc300RhI+QPC2Hopn5Wj/HRuh4Pg
	 ItbtBP6b1VQfrr7w9JldiQ1teAdj9+afnY21kw23oSVfQs8DyshNBv9HH+w+8VsNu3
	 WwQUYY2APS0OPRF5rEwOPS3PwvkpijnT5ZbEdnMRuQ6a7JqKeDTZHX0Ww4VDljs/7K
	 hg3JqnKbcCQf/Cz5Qzo9PxxVtc2WuScrKdSjCWh7kQRwg87/N8D1P+gSVyNddQ6Nbm
	 /UpnDyfZpdPRagImRsaaoWg4tYIdkMNMrAhbB8hqoQZ7asbYB7li9ARgGRmC3Lh1qn
	 pFyBh1bwqOJRA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Mar 2026 18:00:06 +0100
Message-Id: <DGYEUGRWCLZK.2325N9QPODXTP@kernel.org>
To: "Tim Kovalenko via B4 Relay"
 <devnull+tim.kovalenko.proton.me@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/4] Fixes the stack overflow
References: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
In-Reply-To: <20260309-drm-rust-next-v4-0-4ef485b19a4c@proton.me>
Message-ID-Hash: ZNJV4LJAF5WXQUQ6VL6BZ4ONLKN6EGUH
X-Message-ID-Hash: ZNJV4LJAF5WXQUQ6VL6BZ4ONLKN6EGUH
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: tim.kovalenko@proton.me, Alexandre Courbot <acourbot@nvidia.com>,
 Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 driver-core@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZNJV4LJAF5WXQUQ6VL6BZ4ONLKN6EGUH/>
Archived-At: 
 <https://lore.freedesktop.org/DGYEUGRWCLZK.2325N9QPODXTP@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon Mar 9, 2026 at 5:34 PM CET, Tim Kovalenko via B4 Relay wrote:
>
> ---
> Changes in v4:
> - Rebase on top of projection changes

Thanks for the quick follow-up!

There was no need to include the series you rebased onto, i.e. it is usuall=
y
enough to just mention that your patch is based on another series and provi=
de a
link.

But don't worry, I just mention this for the next time, there is nothing th=
at
needs to be done on your end.

(One additional thing to note, in case you will actually have to (re-)send
patches of other people in the future, is that such patches still need to h=
ave
your Signed-off-by: in addition, since by sending them you are involved in =
the
handling of those patches.)

Thanks,
Danilo
