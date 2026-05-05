Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACF97FF885A
	for <nouveau@archiver.kernel.org>; Tue,  5 May 2026 10:14:03 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BAD010EA70;
	Tue,  5 May 2026 10:14:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="UKoldRSF";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9D6BC45DC0;
	Tue,  5 May 2026 10:01:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777975283;
 b=wCrso2hkikfjfYth3DjHZjGTrTBROSKjMKG7z53QlmPqcCvodlcO7lNSu61aOTzXYIIvP
 WZLS0qLD+hdM7rVSfUoST9f+/EWHK7Jmzm7pVRmHPXNlru7X9Y/C99h0K/Rp2eW/eHUZzNy
 mX9TZGcm/UQ/xPu6eihahzW2uXjxzwhncmKdsaoozYxC84paAufcgfq7PgC2zyDLFqR92s1
 lRfj90uW5zpe/aCP3+L+B47hRZ/Y92Dhu2vu8aeO+kBtEb4B0cjDhMub0p9s8Ga/wJG7iyX
 jIAtQjNVQw+3KRTVUnedWiPwx+mI2poPxYvhgJV1vFuaXuj1gOcvuvxLEe2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777975283; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9mDFV4imTk9efPwPbclFyRFiYMie/MCOWGLGWz5ijJE=;
 b=YAsZjLyHWzZMy9xgwcPsnt1t2CjqqCQprIuiyDb3SprtskkXLewvgRSU1rWTmHOy7jhg2
 xGiDO1pz+AAGiVEGR4I16pF9f+1o7tZmkqMfxGsip4GiqJEn/8HO79mKLv2OjPrXoKqqZ3i
 06kHo0i8i2nuitFCT1lcHzA+YSFkhxi8eEqBbksyKqfj/loQ1CpRgePeoo0fdqPcyC2un3y
 F5YvZZVT3I4xTF1d7wUrks4r3XS+XLDMItFB+/gwxdCgftSS/q9tPgDIx503L1tBdP3/dR5
 7CjnmV9xaUUypttyjXvFRPj0AyTNVY0bqanzdMdxw4tqH41+KGeEbyQscdBA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=collabora.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=collabora.com; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=collabora.com
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 606F645D98
	for <nouveau@lists.freedesktop.org>; Tue,  5 May 2026 10:01:21 +0000 (UTC)
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F55110EA55;
	Tue,  5 May 2026 10:13:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777976037;
	bh=4+5LaA19bF6n+wKsL6C3LO/pYMD+m4nVLA1CA1l9jeA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UKoldRSFdvvlZNwY0033CxwsUCPDMDORXECiyGTvEE8agFaszVyO9XVtcMahfpUYe
	 9LSDp9VOyIOmyvRpt/jrzc4fT5I+AMQd9awRY0kOTtnUErvqHLsfh5Mk9PwbF4qZ+O
	 yPxYU1DS3MsPC9KIZlF3efn9HDY3nWFCgDe1rBjDb+RaWc+CqC3h7K0lanUnrDIbKJ
	 omYM026D+RhBoKBr9N7Q+AgBk6rFuqdTDVoTwE3HEqIfI3hLwIlGZOK7FCyX6kPgZ7
	 OTLdbLlhbwMd9h3y2m3C/0jJ+7XViSf+oL/hIXSJr0lFAajVv03yuTVT5O4E0nbL59
	 qPFAENw7DRYtw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest
 SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 64AC117E0698;
	Tue,  5 May 2026 12:13:56 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: gary@garyguo.net
Subject: Re: [PATCH 1/2] rust: drm: add support for driver features
Date: Tue,  5 May 2026 12:13:45 +0200
Message-Id: <20260505101345.112368-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
References: <DFUG2U4PVVTN.1DVPXGJK735F8@garyguo.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Z35B2LSIMQ2ZVPL7WS6L5GPFSSEIDRXC
X-Message-ID-Hash: Z35B2LSIMQ2ZVPL7WS6L5GPFSSEIDRXC
X-MailFrom: laura.nao@collabora.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
 boqun.feng@gmail.com, boris.brezillon@collabora.com, dakr@kernel.org,
 daniel.almeida@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, lossin@kernel.org,
 nouveau@lists.freedesktop.org, ojeda@kernel.org,
 rust-for-linux@vger.kernel.org, simona@ffwll.ch, tmgross@umich.edu
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Z35B2LSIMQ2ZVPL7WS6L5GPFSSEIDRXC/>
Archived-At: 
 <https://lore.freedesktop.org/20260505101345.112368-1-laura.nao@collabora.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Gary,

I just submitted a v2 [1] with DRIVER_RENDER modeled as a single
constant bool flag, as using a trait for this specific feature seemed
unnecessary.

This doesn't prevent us from modeling other features such as
FEAT_MODESET differently later, possibly with a trait and a constant
type that can only be constructed when the relevant trait is
implemented.

One thing probably worth noting about your previous suggestion, in case
it's useful for future feature implementations:

> On 21 Jan 2026, at 14:31, Gary Guo <gary@garyguo.net> wrote:
> 
> When building, you can use `TypeId` to check if it's actually implemented, and
> set bits in the feature flags automatically.
> 

Taking FEAT_MODESET as example, I believe this would translate to:

const fn compute_features() -> u32 {
    let mut features = drm::driver::FEAT_GEM;

    if TypeId::of::<T::Modeset>() != TypeId::of::<drm::driver::NoFeature>() {
        features |= drm::driver::FEAT_MODESET;
    }

    features
}

However, this results in a compiler error as PartialEq is not yet
const-stable:

error[E0658]: cannot call conditionally-const operator in constant functions
    --> rust/kernel/drm/device.rs:87:12
     |
  87 |         if TypeId::of::<T::Render>() != TypeId::of::<drm::driver::NoFeature>() {
     |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
     = note: calls in constant functions are limited to constant functions, tuple structs and tuple variants
     = note: see issue #143874 <https://github.com/rust-lang/rust/issues/143874> for more information
     = help: add `#![feature(const_trait_impl)]` to the crate attributes to enable
     = note: this compiler was built on 2026-03-25; consider upgrading it if it is out of date

  error: `PartialEq` is not yet stable as a const trait
    --> rust/kernel/drm/device.rs:87:12
     |
  87 |         if TypeId::of::<T::Render>() != TypeId::of::<drm::driver::NoFeature>() {
     |            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     |
  help: add `#![feature(const_cmp)]` to the crate attributes to enable
    --> rust/kernel/lib.rs:68:1
     |
  68 + #![feature(const_cmp)]
     |

  error: aborting due to 2 previous errors

As TypeId comparison is currently unstable, I think a different approach
would be needed if this pattern is adopted for other features.

Best,

Laura

[1] v2: https://lore.kernel.org/all/20260505092304.108262-1-laura.nao@collabora.com/
