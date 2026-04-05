Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191A2E9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:58:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EF0AA10E1D0;
	Sun,  5 Apr 2026 23:58:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b4G/tCdh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CB69245611;
	Sun,  5 Apr 2026 23:47:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432843;
 b=KoFuundycPlkEQyweKCXVya7t5JMjMNzeCfwIMqYPGj126QFO+AYqS4x5u8DzbyDrM0v8
 VRi96kc0DYAgjok9tORk3JK1p1zTqoRWfKVGKr2OzIkbESSKuiMm3ArwNVr5xPrIO+nwItK
 KtMdOH8nBmwc4CGMgN2S7mgw6aFAPyoiqkHwL7MMmDDK/5cSx/rQB0TK+RuBCUl1WPteGRj
 0ch3fOz9QLLp+3dVTeGk9/fiQKvscvy7AGRe8M0beD16sdral58brBcCpLM8CPJJBKSueT9
 IeiOW8ri5JT789oUtHjygFKaCrvfM1X+f11+DmVj9DQ1AXeI3yz0VO/B0VMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432843; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sG7CkDm9NfwB6OWI+Br4VIW7TIFWUj8EtodiaVhKCpQ=;
 b=c6K14UMpvu9WaQJFYbjrHXSzHDg7x5lhvMxwXIrYDN05BURLU21OU+tj2jWv4W2G2wcb3
 kJKZOAX+LLzVcucNFmf5nzBVE1bmB1IqjpmMKu6vUPbYXWztqCqmCeJY/Jm7+gEEntr8C/G
 vKbW1+TiDUtDHl327EqKrzSAHp6N/sBMCRvOZ74hOTWHlJz7nWR0X7Wyyu9kN8wcQDgbDl/
 B9Kr2bxdzTQbxKFH2j/ujOZqmW4hz5Anaj7s0PDgSjeexUP7jEBXEkYN00qneqUBMhrLaZE
 DvDyMOQExTky0uKlEmGX90egjJDaib/jXdwWMhfLEbnFtgyNzAgpWEnlLNXw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C7CB6455F3
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:47:20 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B07F610E1C4;
	Sun,  5 Apr 2026 23:58:52 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 352A660103;
	Sun,  5 Apr 2026 23:58:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494B1C116C6;
	Sun,  5 Apr 2026 23:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433531;
	bh=paW6MVyC5RLTn5+ATDoZoKrgzNCf+Tz+wEGksZWPCME=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b4G/tCdhMwNTwMVQKUDIDrqWPgkYw0KiJq9u25hGeSPJ/Fo06XMppoxVc3vyC3Zg0
	 SXOrQcKPC52AeI6H6lQE7QRYpx0uRJ5sWvDNnmBL0H0XFaNdd9j2T/Bfi9w8ub7jmC
	 6rduwwEJhBUdftOMJKBE+CncJFa8XaB7TvI7/20GwXEotETkQqvgZF2OjwkfkzHjGF
	 EN4Gw/2Cp9UUQx+5tbW2XMSEMTbGQ9FO9SGecgO/kiWocy8aGKjugZOptUL7F/9KUR
	 4G7K57s+degp7qGSB4gkNZS/usFeLqSef9x3wrQJUa+nKx05VUYRogGivr7rvLNgN+
	 ok6cCQqnaLyOg==
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
Subject: [PATCH v2 29/33] docs: rust: general-information: simplify Kconfig
 example
Date: Mon,  6 Apr 2026 01:53:05 +0200
Message-ID: <20260405235309.418950-30-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QLQJNLUPZG6KGRANPTRHWML6TIH2IHJB
X-Message-ID-Hash: QLQJNLUPZG6KGRANPTRHWML6TIH2IHJB
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QLQJNLUPZG6KGRANPTRHWML6TIH2IHJB/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-30-ojeda@kernel.org/>
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

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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

