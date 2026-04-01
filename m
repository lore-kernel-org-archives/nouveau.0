Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDAED35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:51:49 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B58DD10F092;
	Wed,  1 Apr 2026 11:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Rzw1kaCE";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8D46C453A7;
	Wed,  1 Apr 2026 11:40:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043627;
 b=UlBwQ/5M9MubKflRs/3oPQEas6ASfjfMhf0TWjiHU7BQfHH28X2g0zetmrcSnmRQGGQ0v
 y51Mz6oLSnVOjnjMsZWu3QxgPThCJv/JgdrZFUCyV9tdD8JdDScN71YuzEi16TZx0GbPOE7
 u543MtQ1GhRvPJvo+MW8IO8xHshrv17zNhn/5slzj/2xpxbZiah22lLcRJtKXm1Nvln65zD
 an9OY+g/9PVjNNcsI5eEnUJAtHjFPzSNLEbWdytRmjvcbx1at+sRinw/bUDF0v+/nOEYV8m
 TaPFfmtMV8AGUMPVlszYucONBmGnP16P0wwo3SEXNU2eet9MQ83dhUMneErQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043627; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5BoduCRxrhl1ZN6wyFIsKfipd4p3VQ5yQxQKGfI7zC8=;
 b=bP6w40fobjY/dYeMG7nAVi/8yLBm22vp5Y4uyFzlxDs5DLpUsT9bznd3yRskYda7gf3Cz
 Q5nmmkdE/KlVtfkzv8LZ5wqdER3xDUeXi+BwhRL7sdz+tJpILawS7tcrpj5yT+8nVHH0iIk
 2bWyfSSVPRhGNkccLe5TJkLsnSUY5XTC3B8RdAqb4RaAt8d1PYpd9mGO75cxnXOOdFXJJdv
 0xQ/sSruzLkv2YroDFOcscBWk9iQ2OJVr+5FlV+cilnY4MCVAgqhCOlROy8sToMn3OzMtzb
 30D0rklzyuFIBeHhamTz/VQ1uye/G32aUQIr+Gs/ZIxX+KGVdt02DMp2uNMA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E697B45374
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:40:24 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD4F910F088;
	Wed,  1 Apr 2026 11:51:46 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 60A056013F;
	Wed,  1 Apr 2026 11:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC33FC4CEF7;
	Wed,  1 Apr 2026 11:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044306;
	bh=hwrpFVeGAL5GC09atZjTVNJE6Ow3imO9X2morwqR56Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rzw1kaCEQHUMV8e2JhQRZ0slowyGy7FMm4tP6h9JKv2f1/pjKA/CgbLPmqJSfwYW9
	 XpjqdVAQSA7tGhxbEGXHSOp/b4ykgFgY9+afWac2nDN+7rfydkcDZpWR8hxb/XS02j
	 LNBRkTa0ZCJ8Ct7VSdEoSy0AjoAeVUdW2NIf9cHqHXqPRJVw10D2vW/WD8KAcd4+X9
	 adeYuW0+L8tLudnViZX5MEfIqqFc301C2pW4Ki+5taOqHHUTBnQwc2GJaFeET7o+/8
	 HquRyfA0XF2MWJo5hgtDXCWTUfmcnrUxW/us7Td3H6gTg1P4obsqnA35gxHSgJmIa7
	 NPNA/tvRJKfsA==
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
Subject: [PATCH 29/33] docs: rust: general-information: simplify Kconfig
 example
Date: Wed,  1 Apr 2026 13:45:36 +0200
Message-ID: <20260401114540.30108-30-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: Y5FGB5MCUOMRTAPLOKVTZZQ23XHKTAX3
X-Message-ID-Hash: Y5FGB5MCUOMRTAPLOKVTZZQ23XHKTAX3
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y5FGB5MCUOMRTAPLOKVTZZQ23XHKTAX3/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-30-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

There is no need to use `def_bool y if <expr>` -- one can simply write
`def_bool <expr>`.

In fact, the simpler form is how we actually use them in practice in
`init/Kconfig`.

Thus simplify the example.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/general-information.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
index 6146b49b6a98..91535b2306ed 100644
--- a/Documentation/rust/general-information.rst
+++ b/Documentation/rust/general-information.rst
@@ -158,4 +158,4 @@ numerical comparisons, one may define a new Kconfig symbol:
 .. code-block:: kconfig
 
 	config RUSTC_VERSION_MIN_107900
-		def_bool y if RUSTC_VERSION >= 107900
+		def_bool RUSTC_VERSION >= 107900
-- 
2.53.0

