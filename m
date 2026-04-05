Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C38FFE9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:58:44 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A63E510E1D0;
	Sun,  5 Apr 2026 23:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VhX7OHEk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 886344560B;
	Sun,  5 Apr 2026 23:47:12 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432832;
 b=kEOQitLC7aMUEb0haxC8oGetvocT85+s/+pvUwdimEmtO6ixwk9NT3DB9WPq7U0sK0ulj
 fNB63MgXHVjUZPTamBC42+BZMgXoZLcrrlnVEeXi4+eQZnJGv1cOt60C7hXGEgGGABUWeiG
 OYFGVwKY5PmF5xUSl6FfHv83tgSDnT4mLIFmRd037ofXAtHZBCEIruWMiv07iI97i/vmA3+
 2/Jdx+k/tP5jULNipZVyZxQAST30/mL910cb6iXqxzTEnStriY/Kb7yfcSqodBxwFEPbrpa
 5RNB7vBe/RqKAj0IUSKDbvZHGG4wV3cwtTn0Egign4O+YRKNejzgvS9d6cfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432832; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0dGVR2S73MeUMne6MDdHWW4l0LS+AwSqyTr7Wuuou64=;
 b=QBKaL1jS5wHYqZ3apZOa0wwrWOLSweFijPEcYcHn9X7qzQeFASqGmmbIemG2HbZDaaRbj
 yRBwvzfV81Id9K5x+i9zmmFukr1BYaXInbpZvVYBNrw8a+xNWuD7BxIuUcbo4jPCBKcNBko
 7bzbVKssGr3lyoSEYbPmquusBzI5w0b9p7AbcUUb+zp2tZClyMbYC58+C8Z3ylldCNrpNIt
 ET7ZqRTNlrwkrb+CqIppP2dVPIFAuN4CP1AMbhup155nx3M5mKp2qLcfBNYKSjzUyZko38F
 pLLq03liwobxd3h1OCfeeXslSRGIs/PAzewD8AE/Ufjhc0wnfNvMmvX5cyoA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AA32E455F3
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:47:09 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 931CB10E1B7;
	Sun,  5 Apr 2026 23:58:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 17510600AC;
	Sun,  5 Apr 2026 23:58:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21757C2BC9E;
	Sun,  5 Apr 2026 23:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433520;
	bh=o4Ra+oAdw7COOhgL+wfXvUxGOM6cAL7opNxNq4hxAf0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VhX7OHEkRS4TngsHiqyFImNeylvupb9nev5vB3T1m4+yQd8SUeAkjDWjcjK0U0vln
	 tpolgmzKqd+q1FhWnq23lvcfT5UiW9ffCGs1MQDRgTwPKT4sE6zhhgIPGmQu6nDZon
	 tXnbT+DvezPf3MGHuw3kcd2PCZiBpCtiGUxvuAcu1hnl4rebmizvzZh71GYihzW3Hq
	 vW0UlPFQQSIheVr/MRAMdM0bPzbwzTtAAP2pBTunipsyJDhE99HZsUoCxTq9e8uW7A
	 w/SejrIbLFy4g8UyPixRpdq489fMG1PQAkc6d3WQaSgh0mCjPwvfmP+2fHNfVBrb3n
	 a7e5Xs+tjrNGQ==
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
Subject: [PATCH v2 28/33] docs: rust: quick-start: remove GDB/Binutils mention
Date: Mon,  6 Apr 2026 01:53:04 +0200
Message-ID: <20260405235309.418950-29-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: O6AZDTZYTV3H2C5V6GC4RZPKBO3BQG22
X-Message-ID-Hash: O6AZDTZYTV3H2C5V6GC4RZPKBO3BQG22
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O6AZDTZYTV3H2C5V6GC4RZPKBO3BQG22/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-29-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The versions provided nowadays by even a distribution like Debian Stable
(and Debian Old Stable) are newer than those mentioned [1].

Thus remove the workaround.

Note that the minimum binutils version in the kernel is still 2.30, so
one could argue part of the note is still relevant, but it is unlikely
a kernel developer using such an old binutils is enabling Rust on a
modern kernel, especially when using distribution toolchains, e.g. the
Rust minimum version is not satisfied by Debian Old Stable.

So we are at the point where keeping the docs short and relevant for
essentially everyone is probably the better trade-off.

Link: https://packages.debian.org/search?suite=all&searchon=names&keywords=binutils [1]
Link: https://lore.kernel.org/all/CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com/
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 5bbe059a8fa3..a6ec3fa94d33 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -352,12 +352,3 @@ Hacking
 To dive deeper, take a look at the source code of the samples
 at ``samples/rust/``, the Rust support code under ``rust/`` and
 the ``Rust hacking`` menu under ``Kernel hacking``.
-
-If GDB/Binutils is used and Rust symbols are not getting demangled, the reason
-is the toolchain does not support Rust's new v0 mangling scheme yet.
-There are a few ways out:
-
-- Install a newer release (GDB >= 10.2, Binutils >= 2.36).
-
-- Some versions of GDB (e.g. vanilla GDB 10.1) are able to use
-  the pre-demangled names embedded in the debug info (``CONFIG_DEBUG_INFO``).
-- 
2.53.0

