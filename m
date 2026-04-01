Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FEDD3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:46:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 15D0310EFA3;
	Wed,  1 Apr 2026 11:46:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UKtBIcp6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id DC7CA45338;
	Wed,  1 Apr 2026 11:34:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043285;
 b=SRS0PL/zt1wx0em5fututMruN2es6RHyKXhPUmQQIgmKRtWS9Ma5+J/u9+8iapTWJ2aSE
 JIwYNUKn4UlPF8zvYfwZ5u141kzuHNYCiZN+tSRDN98bad8TtA/bCN6H3zqfUTqKqw+6N3Z
 /nPlgWYLbtg7TYIFpQYLPQRJVnYPXu11Sy8+Mt+yam1x4yH8zqmjd6bak0ZmyTSaEsbf3DS
 VnS2r3HRf9jZ84OGpxFyPze/lu4gDnwZn9wyfoFayHC0cKLqBxwCvB1D8EAGstnD5VTOlw1
 w1froSH031P/mwUJDM5fWxKSFgHD9Op/m7+hHYjkm5MjAHUk7qAjOqGbCuYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043285; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LMx8xzHD8HGiNdqXDuwuV1jETvHHqRbVV/Gw7TH2le4=;
 b=MIfBhhmv8YsvcTueY9sDL6QypxPw7vvoeudUpUOm0YTvdqN6+CLR2Oz4eX/AlAe6havAH
 alJ+N7RRip/7BFG11ycpcZt91QHL1Wtu3CDVkuDQXyUhrlI/XOatYhUGLfye8BO5Az4oeBu
 CPxhi6dkKoHeSCw9h3Wqif7DltocatcbeHwpl695xVLWnDWlArUX+/YV8ctiwE355PXaA9Y
 juXra25j7aa9/dlr7yWM2oJlOo/YA6egjVVvIwDzULfAEyl+gogM8rq1IZ9TkHkpGYJ113D
 ZtP+jOA8qqcUHb98aAm+266Dj92+PfZdjbquB5sMWTiPg345ExkkVti9wVow==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F313840545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:34:43 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4CB6D10ED53;
	Wed,  1 Apr 2026 11:46:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C0ED740508;
	Wed,  1 Apr 2026 11:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3116EC116C6;
	Wed,  1 Apr 2026 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043963;
	bh=apDv3G69tLYZxT0bsmSXFtUS1fsRBTuuV0MdIXy1tSE=;
	h=From:To:Cc:Subject:Date:From;
	b=UKtBIcp6XElrr1armeetFGSTEl8V4WONvd6rK4wvltL6YwavS1wFRnN7GpYLEHceN
	 1WbY+wtKHDLemajvmizAsRcZNLu6IBBbkMjRD+ZxpQHOYdzxmcTRqUrQPNLkHG9G1I
	 JhbACz6m0h9hIYsdf6/u0BqrMh/IzmOVno+iZyKwE9XuciKRg3kRCdpMGJRHL+z75U
	 gf+thvdBUY8rXoqFg5PKG9M0+8tFcZiB9pPlGXEEBqnrgJTFOZevdkklUbnUWAQbOW
	 A3Okudgp0+6IACGDs+Fy3Mfyl2ug75BV8kmRZaKVtZzx9GCX2MnTESl/o9lq/ct0OO
	 wSZvnFKBbOrQQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 00/33] rust: bump minimum Rust and `bindgen` versions
Date: Wed,  1 Apr 2026 13:45:07 +0200
Message-ID: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ISDNWR24BJSZDRXF4DWSQILUSRFDS2OF
X-Message-ID-Hash: ISDNWR24BJSZDRXF4DWSQILUSRFDS2OF
X-MailFrom: ojeda@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 moderated for non-subscribers <linux-arm-kernel@lists.infradead.org>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rae Moar <raemoar63@gmail.com>, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ISDNWR24BJSZDRXF4DWSQILUSRFDS2OF/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-1-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
we are going to follow Debian Stable's Rust versions as our minimum
supported version.

Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian Trixie was released with `bindgen` 0.71.1, which it also still
uses to this day [4].

Debian Trixie's release happened on 2025-08-09 [5], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new versions, i.e.

  - Rust: 1.78.0 -> 1.85.0
  - bindgen: 0.65.1 -> 0.71.1

There are a few main parts to the series, in this order:

  - The Rust bump (and cleanups).
  - The bindgen bump (and cleanups).
  - Documentation updates.
  - The `cfi_encoding` patch, added here, which needs the bump.
  - The per-version flags support and a Clippy cleanup on top.

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
Link: https://packages.debian.org/trixie/rustc [3]
Link: https://packages.debian.org/trixie/bindgen [4]
Link: https://www.debian.org/releases/trixie/ [5]
---
The cleanups should cover most of it -- there may be more we can do
later e.g. in linux-next.

Most patches are optional, so if there are concerns with any, they can
be dropped or be done later. Most are straightforward, though, and e.g.
a couple of them update TODO comments to keep the series even simpler.

The patches have been split as much as possible to be able to add as
much context as possible and to make it easier to review and to drop any
if needed.

All in all, it is a nice `--stat` of deletions I think :)

Alice Ryhl (1):
  rust: declare cfi_encoding for lru_status

Miguel Ojeda (32):
  rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
  rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
  rust: simplify `RUSTC_VERSION` Kconfig conditions
  rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
  rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
  rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
  rust: kbuild: remove `feature(...)`s that are now stable
  rust: kbuild: simplify `--remap-path-prefix` workaround
  rust: kbuild: make `--remap-path-prefix` workaround conditional
  rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
  rust: alloc: simplify with `NonNull::add()` now that it is stable
  rust: macros: update `extract_if` MSRV TODO comment
  rust: block: update `const_refs_to_static` MSRV TODO comment
  rust: bump `bindgen` minimum supported version to 0.71.1 (Debian
    Trixie)
  rust: rust_is_available: remove warning for 0.66.[01] buggy versions
  rust: rust_is_available: remove warning for < 0.69.5 && libclang >=
    19.1
  rust: kbuild: update `bindgen --rust-target` version and replace
    comment
  rust: kbuild: remove "dummy parameter" workaround for `bindgen` <
    0.71.1
  rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
  rust: kbuild: remove unneeded old `allow`s for generated layout tests
  gpu: nova-core: bindings: remove unneeded `cfg_attr`
  docs: rust: quick-start: openSUSE provides `rust-src` package nowadays
  docs: rust: quick-start: update Ubuntu versioned packages
  docs: rust: quick-start: update minimum Ubuntu version
  docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection
    title
  docs: rust: quick-start: remove Gentoo "testing" note
  docs: rust: quick-start: remove Nix "unstable channel" note
  docs: rust: quick-start: remove GDB/Binutils mention
  docs: rust: general-information: simplify Kconfig example
  docs: rust: general-information: use real example
  rust: kbuild: support global per-version flags
  rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0

 .clippy.toml                                  |  2 +-
 Documentation/process/changes.rst             |  4 +-
 Documentation/rust/general-information.rst    |  4 +-
 Documentation/rust/quick-start.rst            | 52 +++++++----------
 Makefile                                      |  9 +++
 arch/Kconfig                                  |  3 +-
 arch/arm64/Kconfig                            |  8 ---
 arch/riscv/Kconfig                            |  3 -
 drivers/android/binder/Makefile               |  3 +-
 drivers/android/binder/page_range.rs          |  6 +-
 drivers/android/binder/page_range_helper.c    | 24 --------
 drivers/android/binder/page_range_helper.h    | 15 -----
 drivers/gpu/nova-core/gsp/cmdq.rs             |  6 +-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs      |  3 -
 init/Kconfig                                  | 15 +----
 rust/Makefile                                 | 36 ++++--------
 rust/bindgen_parameters                       |  8 +--
 rust/bindings/bindings_helper.h               |  1 -
 rust/bindings/lib.rs                          |  5 +-
 rust/kernel/alloc/allocator/iter.rs           |  8 +--
 rust/kernel/alloc/kbox.rs                     | 29 +---------
 rust/kernel/block/mq/gen_disk.rs              |  4 +-
 rust/kernel/lib.rs                            | 30 +---------
 rust/kernel/list/arc.rs                       | 22 +------
 rust/kernel/prelude.rs                        |  3 -
 rust/kernel/ptr.rs                            |  1 -
 rust/kernel/slice.rs                          | 49 ----------------
 rust/kernel/sync/arc.rs                       | 21 +------
 rust/kernel/transmute.rs                      | 35 ++---------
 rust/macros/kunit.rs                          |  2 +-
 rust/uapi/lib.rs                              |  5 +-
 scripts/Makefile.build                        |  6 +-
 scripts/min-tool-version.sh                   |  4 +-
 scripts/rust_is_available.sh                  | 36 +-----------
 scripts/rust_is_available_bindgen_0_66.h      |  2 -
 ...ust_is_available_bindgen_libclang_concat.h |  3 -
 scripts/rust_is_available_test.py             | 58 +------------------
 37 files changed, 79 insertions(+), 446 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h
 delete mode 100644 rust/kernel/slice.rs
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h
 delete mode 100644 scripts/rust_is_available_bindgen_libclang_concat.h

--
2.53.0
