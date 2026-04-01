Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 201D3D35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:52:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F012010F0A4;
	Wed,  1 Apr 2026 11:52:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="a2tJ6c9W";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CA061453A8;
	Wed,  1 Apr 2026 11:40:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043638;
 b=IMKd3K1AOfx3ptcwKg6m7ChUE4C2PpbPPQPbGjYTUE/A5uX/0KqLDqip3S6Jcm4w2twQA
 7f1ms2ygJLBhAAhr40lVaGrbyAf00MO+qdISI1hk19Ml0B96LM4h0QlF3a5wCMyEgWfzbEO
 LB0Gq4ddvH0pRnmrC9hIjfsyjEJx8L0CORKR6fPQ8fe01SZ719EAN9CGm4odOYib4wgP7Iu
 xsciUsFUiEcnmY816ZOvjACCSjVsfcDTx20vVAC8ZS3LfHdZ4za3LW23CVOlrIlt0MN002V
 P5evfxI8BkYI+S1Qdk03bo03WaAt4oACDhMc+lQWj+KHT7ntzuk8AwHzjAQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043638; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=r3mxjFFO2Y93Wv3FsX31SAqouVteB5Kqt+bvkPFKp+0=;
 b=tULivakx1/GloIsyqONOWFbdFieTwdardKF93lscQCEVH8JPJt098Ep+6vN0eM9qvaMoO
 QW9QTEeQT7Ud/WCM6WxbufHsYiE1saAGBAEwlJ5FY5m2GMpz3PWV7WaLHDUvup++cHvUyLT
 Wa26fsGE6S6ObVI8rQMh7xl+up7+xRSPlz40v2/Pb6miRWkKesOVUTnTQnhFuqu/2NMYyzL
 4PRwn6/UWeg16E2OCL0l+FW5CX6ZnFzqWoRzJF632QhduRhCjT/uVUlEWNBn3RhcCy3RfSD
 RXh8c/91+9WhEtGK1YRzBKrRaXejARiwo9SGuwu23ZrWaxdtaQFKGIaMSUjQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A82EA45374
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:40:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1EC7E10F0A4;
	Wed,  1 Apr 2026 11:51:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04B9C408B9;
	Wed,  1 Apr 2026 11:51:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C070C4CEF7;
	Wed,  1 Apr 2026 11:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044317;
	bh=aZ7CkV02m73TgymHW6id2ohHebQcMp+UooNV/WCpxYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=a2tJ6c9W9iABHNjYNfL/0mBtFgGwAUtGo9jT4oJbjkTLOc0Yo+AEpPKIParMZ1LNj
	 0sANrmLte5HVlY/RSowfUU1n6HJVpsbzGcrRxFYwfBYM+mr5AsX8sQv1gk5sj4H7wt
	 Dw7M4GzLoUzHr41RJA4HSozfVBTZlvmb01WCmT7Cpg4oqA0MoM9u8F3rYEJ84ZlHa/
	 l6ZHQwkSMoXTmsP6WHnxky2MzbKxBsA9VRTh/QtS8r/wLVDjLYI1nc1ywv3yacbrWe
	 OUhyb3YotIxHBUCZq8fmNmrB8uzKk1sfz69jzjTz+KCMR7GzlinoB3zsZ7EklUMIKY
	 cppDn06YQZSHg==
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
Subject: [PATCH 30/33] docs: rust: general-information: use real example
Date: Wed,  1 Apr 2026 13:45:37 +0200
Message-ID: <20260401114540.30108-31-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: BAIX7Q7YYU57XH4BMBCYUHMW23V2ZUVB
X-Message-ID-Hash: BAIX7Q7YYU57XH4BMBCYUHMW23V2ZUVB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BAIX7Q7YYU57XH4BMBCYUHMW23V2ZUVB/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-31-ojeda@kernel.org/>
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

