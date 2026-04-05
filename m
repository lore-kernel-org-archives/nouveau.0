Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B5ECE9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:59:39 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 44B6310E1E0;
	Sun,  5 Apr 2026 23:59:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Q/niYW5o";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2392F4561F;
	Sun,  5 Apr 2026 23:48:07 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432887;
 b=aW7D2D4r2fdPwRcU9olJPfS58gmuwuX9g4SpEYiWQo1oAodoy5N6vl9YSkyqDEees5qIB
 PTEZ3zPD1kiNIU7++3IPXijpbQq6SlvnsEtJC+Vq4CRfcGT/QgzuA4+F6aBBCmDO+rDt+jE
 n4AWahiw41h8z6A7b5F6Wlq3hiyIbqeM2cmHlJZKe2khMvxS1QxGmyB1tbMPAg/vx6UkmQM
 NhBRF+JK4aKzmmVI6zGbwGS5TpTe+mOKqi5BTZhbvpKEJ9T2hfiDb7RqBLFtMfIR9E3htPQ
 0opSHQ5tbokrroYyr6xq6xEEpy2KMep18ysnpSBqUReWk/PGLLVpsiypxqAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432887; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pu2+gnsm6h3PjQsS6GO+EXHhXfHndC5dvk4gZFW8SdA=;
 b=SH1b1eF2ImjZDxR5QCmOMqFNTSM+Yvy7Pna0o+j9bTnm4mXZNl2gDG5JmulI1Wz9vPYiF
 MnldCsbQ+RNe4/18mipPSBwn7lYtDgQFc4OwNKQlfqAwSZx0sNH1bGDK7KJE3KU0fYI8mw3
 05XwgRTYDSkcxg5d7q+LkMbw45ibCGsAv6hu4+k2eCvta+jIR9LS6t8YrT+q7pxlrDVmHEC
 U+Nj1pz0jWbuZQdmaJpFy7DOh2pD4hKIuTQo7cBPBzwX7suyB9OgFr5g82DnnP6z7GZ9cN5
 s4/Al/DzA/B4eNL+WCI26C2Lw3JaNz50zdNOr9HIJdaPNlNb3dhmZ+M6OkAw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 63EE6455F3
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:48:04 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 63F0E10E1CF;
	Sun,  5 Apr 2026 23:59:36 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4743F4078F;
	Sun,  5 Apr 2026 23:59:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C50EC116C6;
	Sun,  5 Apr 2026 23:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433576;
	bh=2Y/2ZsxukLFUeyt5kaUbOgODi2Fd7rXroVSx/UF2oZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q/niYW5o9kq4CIk+KISZoZr73cBvrFp7xOgl300ftkoj5yEiq4mi9hUZUG9wJrOv+
	 LaGbnyH2cbkgtfwDE2ULrSo70uidF2nRVcyCprr/DU1e1LrxTrWpPSqYOrd/b5v+pI
	 vOJs5KWVWeSegIrtH7pNTmgR4B3f8Em0ddPnhF/0hvNjcmD/GNMNZZR9sO/6pyDC8l
	 J00GH2pYJiTb1LuIWnlKsXbnu5aaWOq5VidlqrS6OtTBgrSnGC29aYauevXa7ZXa5s
	 hvE9DHd51uuzsjeydQ/ToRRg+tMim8vYyTCl+sxSxVJ+3eYGI1FrqpdIrkWkqhUHLN
	 LBKSjFseYSZiw==
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
Subject: [PATCH v2 33/33] rust: kbuild: allow `clippy::precedence` for Rust <
 1.86.0
Date: Mon,  6 Apr 2026 01:53:09 +0200
Message-ID: <20260405235309.418950-34-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 4C57NFAYE6WORQYYW7PIHB43LRDFB2IK
X-Message-ID-Hash: 4C57NFAYE6WORQYYW7PIHB43LRDFB2IK
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
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Tamir Duberstein <tamird@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4C57NFAYE6WORQYYW7PIHB43LRDFB2IK/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-34-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The Clippy `precedence` lint was extended in Rust 1.85.0 to include
bitmasking and shift operations [1]. However, because it generated
many hits, in Rust 1.86.0 it was split into a new `precedence_bits`
lint which is not enabled by default [2].

In other words, only Rust 1.85 has a different behavior. For instance,
it reports:

    warning: operator precedence can trip the unwary
      --> drivers/gpu/nova-core/fb/hal/ga100.rs:16:5
       |
    16 | /     u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT
    17 | |         | u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
    18 | |             << FLUSH_SYSMEM_ADDR_SHIFT_HI
       | |_________________________________________^
       |
       = help: for further information visit https://rust-lang.github.io/rust-clippy/master/index.html#precedence
       = note: `-W clippy::precedence` implied by `-W clippy::all`
       = help: to override `-W clippy::all` add `#[allow(clippy::precedence)]`
    help: consider parenthesizing your expression
       |
    16 ~     (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::read(bar).adr_39_08()) << FLUSH_SYSMEM_ADDR_SHIFT) | (u64::from(regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::read(bar).adr_63_40())
    17 +             << FLUSH_SYSMEM_ADDR_SHIFT_HI)
       |

While so far we try our best to keep all versions Clippy-clean, the
minimum (which is now Rust 1.85.0 after the bump) and the latest stable
are the most important ones; and this may be considered a "false positive"
with respect to the behavior in other versions.

Thus allow this lint for this version using the per-version flags
mechanism introduced in the previous commit.

Link: https://github.com/rust-lang/rust-clippy/issues/14097 [1]
Link: https://github.com/rust-lang/rust-clippy/pull/14115 [2]
Link: https://lore.kernel.org/rust-for-linux/DFVDKMMA7KPC.2DN0951H3H55Y@kernel.org/
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a305ae4be522..b8c38aa49cf4 100644
--- a/Makefile
+++ b/Makefile
@@ -838,7 +838,8 @@ export WARN_ON_UNUSED_TRACEPOINTS
 
 # Per-version Rust flags. These are like `rust_common_flags`, but may
 # depend on the Rust compiler version (e.g. using `rustc-min-version`).
-rust_common_flags_per_version :=
+rust_common_flags_per_version := \
+    $(if $(call rustc-min-version,108600),,-Aclippy::precedence)
 
 rust_common_flags += $(rust_common_flags_per_version)
 KBUILD_HOSTRUSTFLAGS += $(rust_common_flags_per_version) $(HOSTRUSTFLAGS)
-- 
2.53.0

