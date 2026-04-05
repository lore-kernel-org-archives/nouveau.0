Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFFAE9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:53:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 608AE10E116;
	Sun,  5 Apr 2026 23:53:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="FW6z9J1N";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2F52E455AB;
	Sun,  5 Apr 2026 23:42:01 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432521;
 b=QtgjnyDQSw7Y9IF+FKuLtozXDud2akQe+Q4fahnVvishc5Yb0Iv40eodkjBdpCu5O3wp2
 VLQa3Gzquh2YE2YJLOCqw8CVkTYSJ8qQ6zwLBPKyljVY09OshCTKH0bLdW0Y+2ZxyTvAy7/
 ZAiKUr0RvL5fNrtWyDHaxI+Lk1RlbhhXnf7ZfyJaoKpupG7oYfX3oGE3UU5TrcUTWS8vTKC
 11Oz7a+48SXy1xipdGG9+Mks+zztl3ZKfqXShic3NHusRtBcTy/l90SCNzlWgspq9+KQB2f
 xYpa3yCQWmV9bQaqH4dVTH2TpdGHGzgI0Q7+ufXk50kt9pDOf+qpgS9rb8PA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432521; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=A/p48kjsxXCH/YIoS1tP3uPNOOaPySYHdO5V7r7j4+A=;
 b=bfmUrmVqTrsvp8J0iE2AHbORzl2W+hXOkzJfcRNW217J94KEkwv/po+FPaIzUO7R34hxs
 WQZoLkJKb0u2D+CrNsZ/6OyJPrp7+zgLZ9rKqngGGbrIOI6l7Z2a56bDvoXg4oYAaSyQ4+o
 8y3L4qSBGogBmvqjxbbeMPMEuYP1qGYTewTQvRlmtqfNQqmjoj3Fj4mYZNseMPk+VVsI+GS
 WU3/34noKZ/uIF+S9iZSAvovZmfqK/xp7HFXBIZ0H1mkMiRBwKdi+mB17SZuIoO+c0GRHQ3
 uCNjUH6UoctEcjz4MC74h5xfFSefNTkcNfhSCq0H52AUKX61yjaFwXh4SvUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 7381E448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:41:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1D45310E07A;
	Sun,  5 Apr 2026 23:53:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 22985600AC;
	Sun,  5 Apr 2026 23:53:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DA1C116C6;
	Sun,  5 Apr 2026 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433208;
	bh=JAgJZFrMOloqmqyTb3ysTwYFFmGQXVklMDUj4fGUfVo=;
	h=From:To:Cc:Subject:Date:From;
	b=FW6z9J1N/hUJ0BeVzTBIhlbqevS07zFml8CRLdT0rW/zH88ihAk0pUy+w0G1GfFEX
	 n5ab3kkEG0K4k7PxOUY/h8Bq2q/zWhCqsvPLdjpxOIj3D/0Mr+vn6eQcZs+HLXhIbs
	 PHJkvyyo1e71xVAw68Tk2LiW2uWqyCWEA92GAhgpKPJlvuDnuDN/yKeTJ+Wy82e9Sz
	 Y33dDioEDQduesWsl7o/C9suZFqKR2eo2ZK7AkEoxj4xw1Q1ms9xa1UoCTcOx9ZAVy
	 vLQm6kEC7entkKZRd7IbqPmAhcDzrGbl6LB1YLuU9CV6JUuVSk4R/KEy9saT8OUx9T
	 pTjTV4GlNb6pg==
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
Subject: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
Date: Mon,  6 Apr 2026 01:52:36 +0200
Message-ID: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: EK44JN6STDVMNLOM6B5BUB7LTCRVPMG3
X-Message-ID-Hash: EK44JN6STDVMNLOM6B5BUB7LTCRVPMG3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EK44JN6STDVMNLOM6B5BUB7LTCRVPMG3/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-1-ojeda@kernel.org/>
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

  - A few cleanups that can be performed before the bumps.
  - The Rust bump (and its cleanups).
  - The `bindgen` bump (and its cleanups).
  - Documentation updates.
  - The `cfi_encoding` patch, added here, which needs the bump.
  - The per-version flags support and a Clippy cleanup on top.

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
Link: https://packages.debian.org/trixie/rustc [3]
Link: https://packages.debian.org/trixie/bindgen [4]
Link: https://www.debian.org/releases/trixie/ [5]
---
v1: https://lore.kernel.org/rust-for-linux/20260401114540.30108-1-ojeda@kernel.org/
v2:
  - Added patch to globally allow `incompatible_msrv` and removed the
    last instance.

  - Replaced `--remap-path-prefix` patches with one that drops the
    workaround entirely (and place it as the first one) and summarizes
    the discussion.

    I also noticed that `--remap-path-prefix` for `rustdoc` is still
    unstable (unlike `rustc`'s one), so I added it to our list as usual
    (https://github.com/Rust-for-Linux/linux/issues/2). There does not
    seem to be a tracking issue, so I asked upstream about it.

    We will need these two lines as the resolution for the conflict:

        $(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \

        $(RUSTDOC) --test $(filter-out --remap-path-scope=%,$(rust_flags)) \

  - Reworked the `extract_if` patch to use it (unstably). The feature
    last major change happened in Rust 1.85.0, so that is fine.

  - Moved `$(HOSTRUSTFLAGS)` below so that per-version flags (like
    lints) can be overridden too. Please see the details in the commit
    and my reply to v1.

  - Added `feature(extract_if)` and `feature(non_null_convenience)`
    items to https://github.com/Rust-for-Linux/linux/issues/1223.

    Then reworded the commits accordingly to include the references
    to tracking issues and PRs.

  - Other rewords, e.g. the "beyond" typo.

  - Rebased on top of `rust-next`.

  - Picked up tags.

Alice Ryhl (1):
  rust: declare cfi_encoding for lru_status

Miguel Ojeda (32):
  rust: kbuild: remove `--remap-path-prefix` workarounds
  rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
  rust: kbuild: remove unneeded old `allow`s for generated layout tests
  gpu: nova-core: bindings: remove unneeded `cfg_attr`
  rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
  rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
  rust: allow globally `clippy::incompatible_msrv`
  rust: simplify `RUSTC_VERSION` Kconfig conditions
  rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
  rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
  rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
  rust: kbuild: remove `feature(...)`s that are now stable
  rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
  rust: alloc: simplify with `NonNull::add()` now that it is stable
  rust: macros: simplify code using `feature(extract_if)`
  rust: block: update `const_refs_to_static` MSRV TODO comment
  rust: bump `bindgen` minimum supported version to 0.71.1 (Debian
    Trixie)
  rust: rust_is_available: remove warning for `bindgen` 0.66.[01]
  rust: rust_is_available: remove warning for `bindgen` < 0.69.5 &&
    libclang >= 19.1
  rust: kbuild: update `bindgen --rust-target` version and replace
    comment
  rust: kbuild: remove "dummy parameter" workaround for `bindgen` <
    0.71.1
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
 Makefile                                      | 12 +++-
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
 rust/Makefile                                 | 31 ++--------
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
 rust/macros/helpers.rs                        |  1 -
 rust/macros/kunit.rs                          |  9 +--
 rust/macros/lib.rs                            |  3 +
 rust/uapi/lib.rs                              |  5 +-
 scripts/Makefile.build                        |  6 +-
 scripts/min-tool-version.sh                   |  4 +-
 scripts/rust_is_available.sh                  | 36 +-----------
 scripts/rust_is_available_bindgen_0_66.h      |  2 -
 ...ust_is_available_bindgen_libclang_concat.h |  3 -
 scripts/rust_is_available_test.py             | 58 +------------------
 39 files changed, 83 insertions(+), 451 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h
 delete mode 100644 rust/kernel/slice.rs
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h
 delete mode 100644 scripts/rust_is_available_bindgen_libclang_concat.h


base-commit: 36f5a2b09e650b82d7b2a106e3b93af48c2010d9
--
2.53.0
