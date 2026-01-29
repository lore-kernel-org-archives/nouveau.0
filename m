Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2EA4D61020
	for <nouveau@archiver.kernel.org>; Thu, 29 Jan 2026 14:32:54 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 535C210E882;
	Thu, 29 Jan 2026 14:32:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oL16AibZ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CFBFF40F63;
	Thu, 29 Jan 2026 14:23:48 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1769696628;
 b=PegieyGE0w/bYIyS+b3c2acRMuOoPx0Am6LIlY+zQIKDQjIfqzbgw1hlrPgIEAoKnbPHq
 LDQ3xwQlz2UY66TIRih2ybmU+TvpIpuXBQ6T5rEYxRGWZlgpwW9QvZW9YSkLpDIB5T/2QvX
 3QmeA4cDnmfu1F7hPDoU8XtVswcMtA1yp10bEXuGqj6mQwgSdH51b2LINcI4fcMes9A1CVk
 ZlmJhlRY/+DsZEzT1mMu7hgebo+GInM5BPL8OsfR3lGKwV3GEwLuC9hfryarqnHgUd8D93u
 g7FO8xAXkOZ09PeUtp4H517L5yX32mZePJy4sPBtqjr0Dnaw/qdIFbEV93/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1769696628; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0PtBhwNYnHebBz+1q+0weenY+/m/qAYPmDL6d2scpzU=;
 b=y4lNfFGZTpvsd+Hv8L+QkGbQtBwibPYS9KPEeeKwjiEtxmV0w3w4BXFWHa6vFIhE5ZZO6
 hhJ0rHZXk/6aKLYwhQB5xSyZJaZMiazCb8dMAxMv0GHpHArf39apvG13w6Cb6PKw58X2h5N
 MYc3naOR6jJPH6d8eZMucOcHBsshgHsllgIY6irS/CSoauGCAKC6tjsaVwbAbehpLu1Ll+w
 hHwGnuF0/FVmmw4LwWcDhdKdwpIkZh6qRTvgiawRaBGsQi7+jjCfjFBE6DkC8qJi/ukxVyg
 Qeql35lLUdf1jokuB7CzBSqshPp5VbuM3cMfarj+3glThROA0zOkNIm2FOZg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E006440AC8
	for <nouveau@lists.freedesktop.org>; Thu, 29 Jan 2026 14:23:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2C5D010E874
	for <nouveau@lists.freedesktop.org>; Thu, 29 Jan 2026 14:32:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 312A360125;
	Thu, 29 Jan 2026 14:32:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5F13C4CEF7;
	Thu, 29 Jan 2026 14:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769697167;
	bh=W/lQNM+k2nJyyhsWP+iX2X75QmPDfFgQGv2yUuk2t+c=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=oL16AibZN0jHuPACubdWBmgmUVZazIWIHv+mzxXoDb324dpkhbgOCLEkt8AFgOpIq
	 WWe7t5zolX6rkCMn9kER5xaPOWTnocEs8Z4xMZ0Zt5pWCDXCS2N2ED0Ek2CYrPc0FU
	 xRVQE5+QtBZSm8ZvR6IGeTUifTJ4nPKbTjlJk3MkakBObiMEuR2qYY/ZH2oTsw+7nX
	 6RPuCVrlsA5wrrR0bhVJzVIzAPDwVyc/mcsemH+dyp6FEr4Ed/JdfLSt4RIXCny4Yp
	 OabE2XV/iaEYOGI9Nwn9d5RswgvptVSTV736RVcdUc0NMDFMQsQ3DPAkASLZS8q0hx
	 TQ9C3sLDFSV9Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5AF9D6101F;
	Thu, 29 Jan 2026 14:32:47 +0000 (UTC)
From: Jesung Yang via B4 Relay <devnull+y.j3ms.n.gmail.com@kernel.org>
Subject: [PATCH v5 0/4] rust: add `TryFrom` and `Into` derive macros
Date: Thu, 29 Jan 2026 23:32:44 +0900
Message-Id: <20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIxve2kC/32NQQqDMBBFryKz7hSNSWq76j2KixATHWiMTEQqk
 rs39QBdvgf//QOSY3IJHtUB7DZKFOcC6lKBncw8OqShMIhaqEYIhSvv6DkGpHmNGIzliI3Waqi
 Nt952UJYLO0+fs/rqC0+U1sj7ebLJn/3f2yTWKI3S7aDut67VzzEYel9tDNDnnL9JtcWwtgAAA
 A==
X-Change-ID: 20251225-try-from-into-macro-1665d0afcfc8
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5049; i=y.j3ms.n@gmail.com;
 h=from:subject:message-id;
 bh=W/lQNM+k2nJyyhsWP+iX2X75QmPDfFgQGv2yUuk2t+c=;
 b=owJ4nAFtApL9kA0DAAoBhnBYoOPQ2LoByyZiAGl7b47aya1K7Gld9Pr15f5ILWyBdh7l0GBPa
 6HOxnu/aM43uYkCMwQAAQoAHRYhBNJuBqTTLsbEgOaQ0IZwWKDj0Ni6BQJpe2+OAAoJEIZwWKDj
 0Ni6aioQALMVekoonpoiaF5wtL63jMIje/TKyxuKccuJJgghAmjDvYFM4Ij7lhMP9rjvb4NJ0rE
 BQw56rPhtTrad1s2AeJkx8Aie2GJd0fyrjwdSFUG3OrlAdZgqrVAP3irlL5ZJ+FK3FHr6nbgE18
 JEyiO4/UF21wCOi1YaF9nWSjj2uLisRsPUdlDaAqHzgSHGVbahFctM0006DjSIZ8d3Mzv3ualFl
 KJubhQGMISfbbqAlc1iU/WTInrVhSpUuHDvk40aQhwdVyfBmsEK0UxybwYgsW6Z/FooynBug22r
 QXXSpKORx8PldH4mlr7smdXgfAdqOBs5oa0hUs+yrbfqozj7gw9RsNes+KdiSYRxVbrQhmwYtcm
 7PFwGpYnazCtS1IwFYP3f2nuXgFlDGbNapgxI5qGObbnoe5DvWhMZA6owKOfC9KJ07+7mulQwts
 aCXS6J2y5yTIVLb4pSfUgrD9+MEWu8rvh8oW873hdc5Lq8qGOYe7KP+zXsXhEemm6BTkLxaKE9T
 VZI3lE85DzjmFW+sbbeo/Edf8/6yCl/iHgJS7j+P1Omf4bB6Rw9HdB+1J0ngAxBZQN8n3DiABQh
 1cveTR6Nm29OnkogajCL53/BC+89P9xNdlOnBuEXCZAbokQ/yF/IRRzShLHx9UdViEPSpUYRe4q
 O1VgLCpp6xCsEOkH5dbAwfw==
X-Developer-Key: i=y.j3ms.n@gmail.com; a=openpgp;
 fpr=D26E06A4D32EC6C480E690D0867058A0E3D0D8BA
X-Endpoint-Received: by B4 Relay for y.j3ms.n@gmail.com/default with
 auth_id=602
X-Original-From: Jesung Yang <y.j3ms.n@gmail.com>
Message-ID-Hash: YZMKX6SVJU6RW55HCXAZOC3VRMFZXP4X
X-Message-ID-Hash: YZMKX6SVJU6RW55HCXAZOC3VRMFZXP4X
X-MailFrom: devnull+y.j3ms.n.gmail.com@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, Jesung Yang <y.j3ms.n@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: y.j3ms.n@gmail.com
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YZMKX6SVJU6RW55HCXAZOC3VRMFZXP4X/>
Archived-At: 
 <https://lore.freedesktop.org/20260129-try-from-into-macro-v5-0-dd011008118c@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch series introduces derive macros for the `TryFrom` and `Into`
traits.

I dropped support for `#[repr(C)]` fieldless enums (i.e., disallow
deriving `TryFrom` and `Into` on those enums), since the actual
representation of discriminants is defined by rustc internally, and
documentation around it is not yet settled [1][2].

I would like to highlight some feedback from the previous series where I
have decided to retain the original behavior in this series. In part, I
feel more community feedback is needed to reach the right design; I've
also elaborated on my personal reasoning for each point below:

1) Require explicit `#[repr(..)]` for enums using the macros.

Given the drop of `#[repr(C)]` support, I believe defaulting to `isize`
when no `#[repr(..)]` is specified is safe, as it follows the
compiler's (documented) default behavior [3]. By "safe", I mean I see no
potential regressions or hidden issues; we even have a compile-time
overflow assertion which ensure all enum discriminants fit within the
types involved in the conversion.

2) Generate trait implementation for a type in `#[repr(..)]` even when
   the helper attribute is present. For example:

     #[derive(TryFrom)]
     #[try_from(bool)]
     #[repr(u8)]
     enum E {
         A = 0,
         B = 1,
     }

   make the above snippet generate both `TryFrom<u8>` and
   `TryFrom<bool>` implementations.

However, sometimes users might want to prevent generating trait
implementations for the type in `#[repr(..)]`, especially when the enum
encodes types like `bool` or `Bounded<u8, 4>` that cannot be used in
`#[repr(..)]`, like the above snippet. If we were to follow the feedback
directly, users would end up with an unnecessary `TryFrom<u8>`
implementation. Therefore, I think it is reasonable to treat the helper
attribute as an override that ignores the type in `#[repr(..)]` when
present.

One last point: the current `Into` implementation relies on
`Bounded::from_expr()`, which utilizes `build_assert!()`. So the
expanded result looks roughly like this:

  impl From<Enum> for Bounded<u8, 4> {
      fn from(value: Enum) -> Bounded<u8, 4> {
          // Compile-time assertions to guarantee `value` fits within
          // `u8` (Omitted)

          Bounded::<u8, 4>::from_expr(value as u8)
      }
  }

After some experimentation, it appears that the compiler correctly
optimizes out the assertion if (and only if) the `Bounded` type covers
all enum discriminants, though I'm not 100% certain of this behavior in
all cases. Can we approach this better?

Appreciate any feedback or suggestions.

[1] https://github.com/rust-lang/rust/issues/124403
[2] https://github.com/rust-lang/rust/pull/147017
[3] https://doc.rust-lang.org/reference/items/enumerations.html#r-items.enum.discriminant.repr-rust

Signed-off-by: Jesung Yang <y.j3ms.n@gmail.com>
---
Changes in v5:
- Drop support for `#[repr(C)]` enums. (Benno Lossin)
- Allow `#[repr(C, {primitive_int_type})]` for future-proofing.
  (Benno Lossin)
- Parse types in helper attributes into `syn::Type` prior to validation.
  (Benno Lossin)
- Replace doctests for `TryFrom` with correct examples. (Benno Lossin)
- Reorganize error reporting structure.
- Add documentation about `#[repr(C)]` fieldless enums.
- Rebase on commit a7c013f77953 ("Merge patch series "refactor Rust proc
  macros with `syn`"")
- Link to v4: https://lore.kernel.org/r/20251225-try-from-into-macro-v4-0-4a563d597836@gmail.com

Changes in v4:
- Fix typos.
- Link to (broken) v3: https://lore.kernel.org/rust-for-linux/cover.1766544407.git.y.j3ms.n@gmail.com/

Changes in v3:
- Use the vendored `syn` and `quote` crates.
- Support `kernel::num::Bounded`.
- Add compile-time overflow assertion.
- Add a comment about `#[repr(C)]` enums.
- Drop Tested-by and Reviewed-by tags, as the code structure has
  changed substantially. (Thanks for the previous reviews and testing!)
- Link to v2: https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/

Changes in v2 (no functional changes):
- Split the patch "rust: macros: extend custom `quote!()` macro"
  into two separate patches.
- Remove unnecessary spaces between tags.
- Use a consistent commit subject prefix: "rust: macros:".
- Add Tested-by tags.
- Link to v1: https://lore.kernel.org/rust-for-linux/cover.1754228164.git.y.j3ms.n@gmail.com/

---
Jesung Yang (4):
      rust: macros: add derive macro for `Into`
      rust: macros: add derive macro for `TryFrom`
      rust: macros: add private doctests for `Into` derive macro
      rust: macros: add private doctests for `TryFrom` derive macro

 rust/macros/convert.rs | 1599 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs     |  349 ++++++++++-
 2 files changed, 1947 insertions(+), 1 deletion(-)
---
base-commit: a7c013f779530190d0c1e1aa5e7c8a61f0bd479e
change-id: 20251225-try-from-into-macro-1665d0afcfc8

Best regards,
-- 
Jesung Yang <y.j3ms.n@gmail.com>


