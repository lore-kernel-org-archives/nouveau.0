Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AD6D35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:46:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4BA9810EFB9;
	Wed,  1 Apr 2026 11:46:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KRqDupu+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 292D945331;
	Wed,  1 Apr 2026 11:34:57 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043297;
 b=f2zZ8sUyiDfCTLKzkj+4vZGsJ7kI7Em9bCi7m3bMr+q3J5KNh3YSlG7HCa/tXMZ0IJL2w
 zmZcykRTZ9cgiU+bCZoCXeFNTl6ItTb6wDD78HHHvUOzLuytqvPdPpb30Hr50beXnqxUkmm
 eA2xppUxrwnYobB3zs/swUODUgLupwS1syfEklLhQQrfPftq7J7zVDRMRJrBWI73NbQk/V0
 2Cot8gg08NneUaUUAsA2rrXXI/jPl3Z0h7snMuK4DK06/4uWs7sm7G7VJqrBiuk5lSm+Nst
 akbgEOIhm8GHk1fmqDQF9pc6JnSh5HN0t1m4+o0zwmZjyf/APLXCE001G4NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043297; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UmcE2Emp0jMK5c/Og3V+Lfl1X3OoDZG0HQKPlUV3Wl8=;
 b=KpVPjWygajf4zes5OdPX56ejsVlDJL1DeEmmuEDRUpfsIyECZqunxi4h2VTx+57AT4ENA
 e0GJ+yrnAEQfM34UIp3x3MTCFc1JcmVuEtF2wqNtCc57NpgjWyowyZmuk7PGoS7HH2J5u48
 J//izCWUMvyuTwm2bf04xzjesLDoxawCFqUTLqIRpRLfzaW2m7FLNNCja8Rkj0i8k2msw0z
 fa8lBlWtS1mXsy/h4UDdkGn11LDU9W105UK1S/CIkoR/F+xnlwSHkzNrE8PAxZOrukbXtUg
 tTU888ss7vZQIuWEKI4Yh8upt9kUOSPOPhdX/minZFZX44pvvHMCpcaD3mQw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id BDA9F40545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:34:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BCEC610ED76;
	Wed,  1 Apr 2026 11:46:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96607402E0;
	Wed,  1 Apr 2026 11:46:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314CBC4CEF7;
	Wed,  1 Apr 2026 11:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043975;
	bh=ee9ui+LCdpJHl0TldbW+Hj1cIbucU9apUqrPLbY+gwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KRqDupu+DKvNmwW+4j5ymsnMQyV8FjWKLKLMuRfJUaFNjjRl8TChFt1O49A4LriR4
	 aCxNadQPRYWuZCjWbo1G44JNcreCgipEpTp25HG8+WRGEQpYq7kENnhi95ZvkothfB
	 1r+PascAFPeFUZ3UdnavVyKxTrY5sFckDghBLAV95wFV/7g0t8aY2T6Fli7cVnPYN5
	 rkQQwfKcvN45XkZT1HU8FQsC/R0ookEadJs+Fu2CukxnkXqGoBe7jjSw5pUxfGmltp
	 jaO17kwZAxx2dXVmEEDxPcOzWr8F1PnIUzJ/2t3S/iYg3yjijoVzP0yNPKxQ0FAq8T
	 OxPArPyTGQbbQ==
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
Subject: [PATCH 01/33] rust: bump Rust minimum supported version to 1.85.0
 (Debian Trixie)
Date: Wed,  1 Apr 2026 13:45:08 +0200
Message-ID: <20260401114540.30108-2-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 7ZBLEHI5T4ASMDHHDL7722BORWFLOOEQ
X-Message-ID-Hash: 7ZBLEHI5T4ASMDHHDL7722BORWFLOOEQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7ZBLEHI5T4ASMDHHDL7722BORWFLOOEQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-2-ojeda@kernel.org/>
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

Debian Trixie's release happened on 2025-08-09 [4], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new version.

Then, in later commits, clean up most of the workarounds and other bits
that this upgrade of the minimum allows us.

pin-init was left as-is since the patches come from upstream. And the
vendored crates are unmodified, since we do not want to change those.

Note that the minimum LLVM major version for Rust 1.85.0 is LLVM 18 (the
Rust upstream binaries use LLVM 19.1.7), thus e.g. `RUSTC_LLVM_VERSION`
tests can also be updated, but there are no suitable ones to simplify.

Ubuntu 25.10 also has a recent enough Rust toolchain [5], and they also
provide versioned packages with a Rust 1.85.1 toolchain even back to
Ubuntu 22.04 LTS [6].

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
Link: https://packages.debian.org/trixie/rustc [3]
Link: https://www.debian.org/releases/trixie/ [4]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=rustc [5]
Link: https://launchpad.net/ubuntu/+source/rustc-1.85 [6]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst | 2 +-
 scripts/min-tool-version.sh       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 6b373e193548..474594bd4831 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -31,7 +31,7 @@ you probably needn't concern yourself with pcmciautils.
 ====================== ===============  ========================================
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
-Rust (optional)        1.78.0           rustc --version
+Rust (optional)        1.85.0           rustc --version
 bindgen (optional)     0.65.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index 99b5575c1ef7..a270ec761f64 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -31,7 +31,7 @@ llvm)
 	fi
 	;;
 rustc)
-	echo 1.78.0
+	echo 1.85.0
 	;;
 bindgen)
 	echo 0.65.1
-- 
2.53.0

