Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C339EE9D826
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:57:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9E79610E1C4;
	Sun,  5 Apr 2026 23:57:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fZa94a2g";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78CBC455F7;
	Sun,  5 Apr 2026 23:46:04 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432764;
 b=DMrqDXFMlqchoddmrDRL4pV+0RIWvmNtEHSi+jaU5oYvA/M4N8/UdRKrj+vJyoCHMkvrM
 59ClSn4/atvzDoLLxDZMWBV+jC3pP/r7NsyIr2gwzpQtJVBPmH6z1m2UzSBhJyQo6OUNGtf
 d8Dpai0JZ67h5yLaMkAeDylmXT/RtJTq9GOUFLkHzYfNCP9i9SQZpinSHVSJ2zptvbprQpM
 UZ+zHsRQyGVbbazgHk1GnnKWRHnFqZUvjvEF4ZYr78t0iOq6eV+DsYEP2FXw3PgDLBn3AfE
 YjtEB49uxBV2xoZODewNn0Tsw9pML2S3dsf0uBCk0fkY82UQN1J+IxwYURxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432764; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LihupHl558U9au/Muz7fZTVLp69aQso3Enov/jPPxR8=;
 b=e/frHS742DOGtztNTdq4rJmdBUeG/WKo4KRlNn5zixIF7xU9YRbrhRqGXlaZd3emYfYzh
 qmMk4H1x52sCodlW4bSkf2tKv9DBtS+vnRZkaXoHL9IQgjnlUXgu/AvG0kqfL2OPaDlrm0E
 4X6hiqpBY9YiArFZYGUB+s5gkEgjh2+zY4si2EIL4v6GXh16+bN5BuEgj3s1PCFO2HfKkSR
 jUsFrtNYwbrb34PoABAty8q2JWN1upxdOfNIBsqKkdPnoZc7Qrsmwrtt37yBVLqdjUwASgF
 uwKC3eeGCvYtNM7OTKI83Vq7jcNYQJ9oX06rHULWxehH5B6BKy8ORgpkQLqA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2C76C42DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:46:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2BD0C10E1B7;
	Sun,  5 Apr 2026 23:57:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05C80435E5;
	Sun,  5 Apr 2026 23:57:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E412C116C6;
	Sun,  5 Apr 2026 23:57:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433453;
	bh=y0xktRKRs5ryJC+G01aE6htP3MJxSFsUvP6UYzkishw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fZa94a2gUM+1/bUwa8Gk/haFENqG5HQ/kAPWfZKfoOpgs9LPvPn+5SYdTLlTrdqBN
	 KhCyK2P/VjNgBuSBZRXH3t/NjrffsRCHyuBlWMIBQFw1QoF5qZOq0Fan1XeP/C9mwN
	 mSmbpbCFTZr9ULdOVc2ZcG2LEkvGQJ8xFnLh+51z3NbAT8m8LjGsjXlDkeOe8MrFSS
	 pua0Sbcn0dOpLzsRowI5EISEDL74bEj9qX5mI82scX4NoyYe3aG+R/HAcXyIsZeQm+
	 9Z0TPjgH5LdiQErUVz5M6qCBLJlmLC7RcmmO+rD7FdR+Z/0Ev92RuP1DJXKaj2QiNp
	 MCtFh4b1E1+eg==
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
Subject: [PATCH v2 22/33] docs: rust: quick-start: openSUSE provides
 `rust-src` package nowadays
Date: Mon,  6 Apr 2026 01:52:58 +0200
Message-ID: <20260405235309.418950-23-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: D4AXJ4RCE5YNQMRQAGMMRMD4G4AJYC2K
X-Message-ID-Hash: D4AXJ4RCE5YNQMRQAGMMRMD4G4AJYC2K
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/D4AXJ4RCE5YNQMRQAGMMRMD4G4AJYC2K/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-23-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Both openSUSE Tumbleweed and Slowroll provide the `rust-src` package
nowadays [1].

Thus remove the version-specific one from the Quick Start guide.

Link: https://software.opensuse.org/package/rust-src?search_term=rust-src [1]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 152289f0bed2..642efce04ee8 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -84,7 +84,7 @@ openSUSE
 openSUSE Slowroll and openSUSE Tumbleweed provide recent Rust releases and thus
 they should generally work out of the box, e.g.::
 
-	zypper install rust rust1.79-src rust-bindgen clang
+	zypper install rust rust-src rust-bindgen clang
 
 
 Ubuntu
-- 
2.53.0

