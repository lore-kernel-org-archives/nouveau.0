Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68001E9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:59:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4A74910E1D2;
	Sun,  5 Apr 2026 23:59:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SleieeVb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2826645615;
	Sun,  5 Apr 2026 23:47:33 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432852;
 b=R5yQQ9kZZtnNV4w0b7fj07ts4/FMMe+0eelAv1drlpLJouTJ1jTcW5tUYeaWtQ5XX4bY6
 srtQZJFQNKO/Ale0VC8+R+62pJff4xZXG7MEz7KI3lFcMTlueEpRy4rMm5grorc40EogUaT
 iriywBY/OS+SQDBq3skH9J5DQ0wjElpM1SQdTPK8drcVZbpZkEhrBNEGOXru7djQQa575v+
 DniZiCSrJ3URkdMoPMM39X2+VS7Lqkqq5c9UsJHD4nRWYf31t3l4FdMSSED5KWQ562sI7v9
 dJrvnRoXfn2d1LR6/FxUATV8JbxvARtvCgsWUmLVqi+nRIdtfYBfCOegG84A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432852; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=aRQZuKlj/BxzDzjzotdXJ8myKFyK6w+9ZZ48Ivf+tHM=;
 b=mpkEmuGHclO+qQE2DR3OQCqdS8IYsMqb29LnW7TA7efaM6BG7QS4HLz1oYuK2zZ6BLs5G
 f6LgcDFAli1Xlxmm9eUv0rhrATfwsFMM386FBHTwu7WmT2xylmn64qFW2a00Pum/ej/Rhms
 117/oXqbsgdyVQQddKIyggTQNsSGsy5KmnMzpaK6l454FOEaKWwaxIw8fOyBmFB4XE+X8xG
 AnByuEU+xxElZe89WlFQUN80qTGFvtBk2sRtkxaIjQsSBh9W/lm14aQgHtND5iuuxwJ1ekR
 4w/BNg90ljxy6A6InBg6B5kg+FqpRCWp9w/dw3xnwDtsWM1e5+cD++GOABVg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 723F2455F3
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:47:31 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7233D10E1C0;
	Sun,  5 Apr 2026 23:59:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 372C043A4D;
	Sun,  5 Apr 2026 23:59:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A143C2BCB3;
	Sun,  5 Apr 2026 23:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433543;
	bh=Ob0EURwaNkw6X3vyMiyVx5p4YA+R0YJVDz2zrJCrIDo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SleieeVbsMR48SE9BcctZ4YV0A0xEVGFjeoRP6GlHQMyvsnA+Z+eNY5M1nRYNvIZt
	 7KJKQ1eAS0XN4P+7lZYxCRTlGoT4Yo6REAwIeZ15tntbQLU27l4ezJWgkxjeMMr/49
	 LUF6GOW7Da3+WTlOzlrnKsKoO7exsEoWRh8TNQ1lC3JrAaPRLWxkbKeyJMdVY4AYOX
	 aLQBpaVJsAIJR4zR+We0+w1ur56cpRNmQxQ438r8TqBp37meh5kqpX7pe1SRcsFYO+
	 HWQOezfhNcBXwhtyS3rgo86owQzO6/Z9B0U3MGgKB0QRTYuSuZ7fERNWVNUOdSqPpM
	 eiUz4x+u5NrLw==
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
Subject: [PATCH v2 30/33] docs: rust: general-information: use real example
Date: Mon,  6 Apr 2026 01:53:06 +0200
Message-ID: <20260405235309.418950-31-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 5H6RTGCLIZ7JRPY5CEUCFU2HWNTORF7V
X-Message-ID-Hash: 5H6RTGCLIZ7JRPY5CEUCFU2HWNTORF7V
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5H6RTGCLIZ7JRPY5CEUCFU2HWNTORF7V/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-31-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Currently the example in the documentation shows a version-based name
for the Kconfig example:

    RUSTC_VERSION_MIN_107900

The reason behind it was to possibly avoid repetition in case several
features used the same minimum.

However, we ended up preferring to give them a descriptive name for each
feature added even if that could lead to some repetition. In practice,
the repetition has not happened so far, and even if it does at some point,
it is not a big deal.

Thus replace the example in the documentation with one of our current
examples (after removing previous ones from the bump), to show how they
actually look like, and in case someone `grep`s for it.

In addition, it has the advantage that it shows the `RUSTC_HAS_*`
pattern we follow in `init/Kconfig`, similar to the C side.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/general-information.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 91535b2306ed..09234bed272c 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -157,5 +157,5 @@ numerical comparisons, one may define a new Kconfig symbol:
 
 .. code-block:: kconfig
 
-	config RUSTC_VERSION_MIN_107900
-		def_bool RUSTC_VERSION >= 107900
+	config RUSTC_HAS_SPAN_FILE
+		def_bool RUSTC_VERSION >= 108800
-- 
2.53.0

