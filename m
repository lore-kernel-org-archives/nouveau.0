Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045D1E8784A
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 16:44:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4EB0110E712;
	Tue,  3 Feb 2026 16:44:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=cock.li header.i=@cock.li header.b="wlN/RpH6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6877941B48;
	Tue,  3 Feb 2026 16:34:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770136499;
 b=MV/oU2WbZslfhPRarKqw/tWNYZNrFeIdT1YuvaFIGX/WXUykrhgRahu+DLfVgPq76VjmM
 P/Z7bIT27pMokEghrlZbvAtZxaz5KiG5Z9sgR4aCB+N2s6a7W+Wdc/bH1GY94p7xpZhgHPm
 WRDz69MyTtx2aUBHbKBM/jXoU/71KJ+GAUlEA3nhYQunbHXPWIy13dxotmxJCusqPQStwZV
 axeWManmKnRLWLSECBkYTOGgWlgsK/54igEyo3PRMe8lfnWzEQfalC1dmPY9EUf2v1kemFb
 BNk1crd082HMFV5qohfeWs+EaqWvhZkh6r33SXI4mVwge3WvP8R7KhRxNcSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770136499; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zEzzU93fmlIHX1iUXcpWvTiKm8fwFYxC6DI0VfTCkBI=;
 b=TDVzWQ0KhNLZRoNzeGbGbGmgEfR+Y54CSfK5qYH4U5fZbSLnFp+z2bIWEMug3YNEGimjC
 9axR5TH1vJy8CRq0fwXetaas0ikBklHYgDK7FLvJXJQ1MQO5BMj6sVLKRWdZpxGy2knRoBb
 3WJnMcbBSP6gKiItTx/s42CQBekKncBso1Gi/MNazNXaOEfThJRRmUg9ct9mOc/0fa/CyMp
 XZuPmCy2B3LZsiU1M96A91kCuE+GFivbdk1cKAm9wg35E0F2cnIOSrZPnRMD2rdU4dEfnbo
 xlU70Om8zOqhvPN/vCo8GENyGexfm7ju0gZDqQnx53Kr8uH7FhM6+wVbDxsg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=cock.li;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=cock.li
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=cock.li;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=cock.li
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 25786415C6
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 12:45:25 +0000 (UTC)
X-Greylist: delayed 361 seconds by postgrey-1.36 at gabe;
 Tue, 03 Feb 2026 12:54:35 UTC
Received: from mail.cock.li (unknown [37.120.193.123])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 11D8E10E320
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 12:54:35 +0000 (UTC)
Message-ID: <92485ea9-18cb-4000-8d77-9c7ab1eb63b8@cock.li>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
	t=1770122909; bh=ucC9pd3ssQ0M5diG2gyt/eOQ+i1zDYq7MyYPlbv5jN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=wlN/RpH6kH3LyVcSrYw6kC1MUdltNVx/ItdAvo4PfReO+CBa0BuD+WNaWV8YN7JW1
	 MDYhg2rT2xcknAXzT/oqSgxD5Mq+IKhwFaktpYCeU2TaJS/xGAZR5Dsb9nPZiQeyRa
	 qN1piNhTCX6pbMk8ETwrQp3oEo+dBNXcaFnA1/IxIAj/B0uKueoNhbgBH/WspTf46K
	 1dPv6ig6SnQqE9DIR3B4PbU9P3H5xBUVG63SBHg/GqTsbzUDJZRZO+8VBR68iB7s+Z
	 lpP0poFISAm8ig03CCvEcC3O1MIsyGGjkA2UIE+FGnh6IiG4J5EredMivkJlMdqlpB
	 XBh9ON3zj7yfw==
Date: Tue, 3 Feb 2026 18:18:21 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
To: Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
References: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
Content-Language: en-US
From: shivam kalra <shivamklr@cock.li>
In-Reply-To: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-MailFrom: shivamklr@cock.li
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: PHSZX5IKM7QWR2SHQOWSJ35X7BKQXC63
X-Message-ID-Hash: PHSZX5IKM7QWR2SHQOWSJ35X7BKQXC63
X-Mailman-Approved-At: Tue, 03 Feb 2026 16:34:54 +0000
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PHSZX5IKM7QWR2SHQOWSJ35X7BKQXC63/>
Archived-At: 
 <https://lore.freedesktop.org/92485ea9-18cb-4000-8d77-9c7ab1eb63b8@cock.li/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 29/01/26 20:02, Jesung Yang wrote:
> This patch series introduces derive macros for the `TryFrom` and `Into`
> traits.
> 
> I dropped support for `#[repr(C)]` fieldless enums (i.e., disallow
> deriving `TryFrom` and `Into` on those enums), since the actual
> representation of discriminants is defined by rustc internally, and
> documentation around it is not yet settled [1][2].
> 
> I would like to highlight some feedback from the previous series where I
> have decided to retain the original behavior in this series. In part, I
> feel more community feedback is needed to reach the right design; I've
> also elaborated on my personal reasoning for each point below:
> 
> 1) Require explicit `#[repr(..)]` for enums using the macros.
> 
> Given the drop of `#[repr(C)]` support, I believe defaulting to `isize`
> when no `#[repr(..)]` is specified is safe, as it follows the
> compiler's (documented) default behavior [3]. By "safe", I mean I see no
> potential regressions or hidden issues; we even have a compile-time
> overflow assertion which ensure all enum discriminants fit within the
> types involved in the conversion.
> 
> 2) Generate trait implementation for a type in `#[repr(..)]` even when
>    the helper attribute is present. For example:
> 
>      #[derive(TryFrom)]
>      #[try_from(bool)]
>      #[repr(u8)]
>      enum E {
>          A = 0,
>          B = 1,
>      }
> 
>    make the above snippet generate both `TryFrom<u8>` and
>    `TryFrom<bool>` implementations.
> 
> However, sometimes users might want to prevent generating trait
> implementations for the type in `#[repr(..)]`, especially when the enum
> encodes types like `bool` or `Bounded<u8, 4>` that cannot be used in
> `#[repr(..)]`, like the above snippet. If we were to follow the feedback
> directly, users would end up with an unnecessary `TryFrom<u8>`
> implementation. Therefore, I think it is reasonable to treat the helper
> attribute as an override that ignores the type in `#[repr(..)]` when
> present.
> 
> One last point: the current `Into` implementation relies on
> `Bounded::from_expr()`, which utilizes `build_assert!()`. So the
> expanded result looks roughly like this:
> 
>   impl From<Enum> for Bounded<u8, 4> {
>       fn from(value: Enum) -> Bounded<u8, 4> {
>           // Compile-time assertions to guarantee `value` fits within
>           // `u8` (Omitted)
> 
>           Bounded::<u8, 4>::from_expr(value as u8)
>       }
>   }
> 
> After some experimentation, it appears that the compiler correctly
> optimizes out the assertion if (and only if) the `Bounded` type covers
> all enum discriminants, though I'm not 100% certain of this behavior in
> all cases. Can we approach this better?
> 
> Appreciate any feedback or suggestions.
> 
> [1] https://github.com/rust-lang/rust/issues/124403
> [2] https://github.com/rust-lang/rust/pull/147017
> [3] https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust
> 
> Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
> ---
> Changes in v5:
> - Drop support for `#[repr(C)]` enums. (Benno Lossin)
> - Allow `#[repr(C, {primitive_int_type})]` for future-proofing.
>   (Benno Lossin)
> - Parse types in helper attributes into `syn::Type` prior to validation.
>   (Benno Lossin)
> - Replace doctests for `TryFrom` with correct examples. (Benno Lossin)
> - Reorganize error reporting structure.
> - Add documentation about `#[repr(C)]` fieldless enums.
> - Rebase on commit a7c013f77953 ("Merge patch series "refactor Rust proc
>   macros with `syn`"")
> - Link to v4: https://lore.kernel.org/r/20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com
> 
> Changes in v4:
> - Fix typos.
> - Link to (broken) v3: https://lore.kernel.org/rust-for-linux/cover.1766544407.git.y.j3ms.n@gmail.com/
> 
> Changes in v3:
> - Use the vendored `syn` and `quote` crates.
> - Support `kernel::num::Bounded`.
> - Add compile-time overflow assertion.
> - Add a comment about `#[repr(C)]` enums.
> - Drop Tested-by and Reviewed-by tags, as the code structure has
>   changed substantially. (Thanks for the previous reviews and testing!)
> - Link to v2: https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/
> 
> Changes in v2 (no functional changes):
> - Split the patch "rust: macros: extend custom `quote!()` macro"
>   into two separate patches.
> - Remove unnecessary spaces between tags.
> - Use a consistent commit subject prefix: "rust: macros:".
> - Add Tested-by tags.
> - Link to v1: https://lore.kernel.org/rust-for-linux/cover.1754228164.git.y.j3ms.n@gmail.com/
> 
> ---
> Jesung Yang (4):
>       rust: macros: add derive macro for `Into`
>       rust: macros: add derive macro for `TryFrom`
>       rust: macros: add private doctests for `Into` derive macro
>       rust: macros: add private doctests for `TryFrom` derive macro
> 
>  rust/macros/convert.rs | 1599 ++++++++++++++++++++++++++++++++++++++++++++++++
>  rust/macros/lib.rs     |  349 ++++++++++-
>  2 files changed, 1947 insertions(+), 1 deletion(-)
> ---
> base-commit: a7c013f779530190d0c1e1aa5e7c8a61f0bd479e
> change-id: 20251225-try-from-into-macro-1665d0afcfc8
> 
> Best regards,
Tested-by: Shivam Kalra <shivamklr@cock.li>
Tested on rust-next with:
- make LLVM=1 rusttest (all doctests pass)
- make LLVM=1 CLIPPY=1 rust/ (compiles without warnings)
- make LLVM=1 -j$(nproc) (full kernel build succeeds)
