Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 374FAE9D82D
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 130E210E1B7;
	Sun,  5 Apr 2026 23:56:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QnGoHDW3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E3FD8455E9;
	Sun,  5 Apr 2026 23:45:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432708;
 b=p0sGeflmI3oqy+i8pdsnAhbOMg23XTBF/BvxWLsYJhHGMRt/sep/raMBendPwhtIU9RT1
 /6sAsDPHzXKf4TJyjsnBpKaakN0HpSNcHrmxHcRaHnn2yBwFy1EkkR5H3IKr5ysYUv/iaIP
 DKK0YCQOHELAysBH0dsZqFWzspU15vFmSZ0U1urbCZgaN4Gz2etKa1rUQdumdQf9j9YV61a
 53+R2yQ7EW006MJJ9S0faCoQNr5yaM1V4NeWf9pM03dqoECCTTYE3stSdH35zTLVLQu6fWP
 NiYXFPg8NBHm4uiyCMp3lfKBvNLASpDEcebTSOoR4h6MIsw1ait0ojGVtbOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432708; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=773x+kju1ryvALqTX8YdY0ziNIs8nn/FqgqTRobgGgk=;
 b=Oy9GuWsvHYcSg7AaSf5NJtcQ111TZ2IY9ZdN1CwUHMT2cyhMQdsfJy7ZDTOFEmIFKlbL8
 W4aCXweeRXMFcHK+cMfHqW0paIDgODWtcu5tej4lOCSCy5rSUEoIqPOBVgAaDrcPmi2cOif
 uXeOhP11IfvqSdlTW0LkfIvOaJgFi7f4ixQldoLlLbnijkgSs19Ct+webBnlGrqBfz5lvwU
 InMStJvoynrdyo53S30OWqDkHZXGio+dqIGzgHuQwUppnmnYInLxs/xhujptoB7PPV5+qm1
 NIn1TSUnXCOHVo+6FWcY5DZpN8V+sIgRaR8bO9DtAFCb6YHbJG4MrduFvz3A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 60F51448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:45:06 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC7D10E1AA;
	Sun,  5 Apr 2026 23:56:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 33E81408A1;
	Sun,  5 Apr 2026 23:56:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60F8CC116C6;
	Sun,  5 Apr 2026 23:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433398;
	bh=5Jab/7lBf0p9Y+zm0mNBBz7PFxQVXiWRK5KI8/o7D7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QnGoHDW3vwcivvmNOjw9o2bOSnSiuXt7aIdxa8w364voeOtuXBDKRMXu1RrUL3xeZ
	 J2FmW1h6MmTnqMjPgvotZtm9XroKgcD0uX7aDtypilDVqaCL8uTlxRvph7lumugK+8
	 iodWD9nftj/RuaRmrf1nUD8TABFk1CZNavco9mtol/2XT+eI/VlknEJJjda7b6Nt6L
	 Rb/8AMVE63lxKAX080HZgZZI2fWBTcVmYtNiB/2T5n5WhsMv6r77G7q/iT2SdggpN2
	 ZuLsqQImLYMozcnF9ceFfZNqKay8184qpW7nCgXBZ5baOyb/Njj3jsrriLjAMaitQC
	 h3qzSTuZ7BE+Q==
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
Subject: [PATCH v2 17/33] rust: bump `bindgen` minimum supported version to
 0.71.1 (Debian Trixie)
Date: Mon,  6 Apr 2026 01:52:53 +0200
Message-ID: <20260405235309.418950-18-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HJQ37LC6ISL45XM6766AERDNETDKYQCU
X-Message-ID-Hash: HJQ37LC6ISL45XM6766AERDNETDKYQCU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HJQ37LC6ISL45XM6766AERDNETDKYQCU/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-18-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
we are going to follow Debian Stable's `bindgen` versions as our minimum
supported version.

Debian Trixie was released with `bindgen` 0.71.1, which it still uses
to this day [2].

Debian Trixie's release happened on 2025-08-09 [3], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new version.

Then, in later commits, clean up most of the workarounds and other bits
that this upgrade of the minimum allows us.

Ubuntu 25.10 also has a recent enough `bindgen` [4] (even the already
unsupported Ubuntu 25.04 had it), and they also provide versioned packages
with `bindgen` 0.71.1 back to Ubuntu 24.04 LTS [5].

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://packages.debian.org/trixie/bindgen [2]
Link: https://www.debian.org/releases/trixie/ [3]
Link: https://packages.ubuntu.com/search?suite=all&searchon=names&keywords=bindgen [4]
Link: https://launchpad.net/ubuntu/+source/rust-bindgen-0.71 [5]
Acked-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/process/changes.rst | 2 +-
 scripts/min-tool-version.sh       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 474594bd4831..84156d031365 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -32,7 +32,7 @@ you probably needn't concern yourself with pcmciautils.
 GNU C                  8.1              gcc --version
 Clang/LLVM (optional)  15.0.0           clang --version
 Rust (optional)        1.85.0           rustc --version
-bindgen (optional)     0.65.1           bindgen --version
+bindgen (optional)     0.71.1           bindgen --version
 GNU make               4.0              make --version
 bash                   4.2              bash --version
 binutils               2.30             ld -v
diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
index a270ec761f64..b96ec2d379b6 100755
--- a/scripts/min-tool-version.sh
+++ b/scripts/min-tool-version.sh
@@ -34,7 +34,7 @@ rustc)
 	echo 1.85.0
 	;;
 bindgen)
-	echo 0.65.1
+	echo 0.71.1
 	;;
 *)
 	echo "$1: unknown tool" >&2
-- 
2.53.0

