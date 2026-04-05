Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA191E9D826
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:56:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2AA510E1AA;
	Sun,  5 Apr 2026 23:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="D5Jq/KNe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A11BC455E7;
	Sun,  5 Apr 2026 23:44:58 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432698;
 b=C21NBY6bSn8VL2DDCHzyTrGNPfCEW6aEBki5Zd/2V6iBkEbjw9h6KD1Dy1YB4CqTomoTs
 K9wzTMLRmDR8rt7iVwQbC5IlDpX0l+6S3ydEMFIyobctJAS3Ty0s8MGdx7mZ0cwSbfu16zP
 VCEYiQulNX6uOcbcsTdubthuN+1iIMccbx1Uol+YoP2kRg0wfr23/bi3MSdBw+VaaLnqVKw
 bUIQTtcrNEKP3DJnUKmPtW/L2zFJmBqCz2fgnlXAc8u7gZiQ7dlMs9ipPTXIIflnL3LAhW4
 /Rwn48lM08Y0Mf/U+8IX5TDNIZwCMbDn9RjnEOGGmnVy1OQxp5+Nm4TKN2mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432698; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fwdCnGdEe1u+XcXGB8mt8q0I2nOQsZv41hWUFwziGaA=;
 b=g/f9CoW5a7qbjNeCzAtexHQfSFmVzG4w5Umj8qWiKsTe6F1kFUlUmTiGwc4NVaXdaA2fY
 jJoNGFSTQgFO01ri7QcmtGYv5a7plaTpRopoIeBOSo9QIhnCEke/yCgR/C5GV55YoQ+6l17
 ijxXitBqfAeCnhD2UTUdQM85jZ3dHXZ3WNYinV3RrUaL34Xj7/pukOl1UmoHq5YCxkVeAXH
 DIJ9XzmUC968TME5g9oq4npAJkoj1X5lHrhgsSu9hWzgSc2enhvCR5eciWpGueOGl1xqk/C
 MptcrKX8uMhbWOL6TPnwJUsvTbbBjLoifRks7K3C1o+kX24oBVvq1L2c3Oyg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 25CFD448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:44:55 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2363B10E1A1;
	Sun,  5 Apr 2026 23:56:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 062F540663;
	Sun,  5 Apr 2026 23:56:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4322DC2BC9E;
	Sun,  5 Apr 2026 23:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433386;
	bh=epQs3AsyxZ8hhy5ISUPTkOTvgvbeYkZEdG041MVzF80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D5Jq/KNe79Oh6OGcaoN5PmN2FFcrPk6GXdZcnPkCCDQp2UqHYQ9SjPNHV1332T+nF
	 T+EMIfEl65JCvssoBOyMtZZKNAxU8TmRe5HaKPPwK+gBHmI/vYuqdH1BJv358cKnCs
	 j84VKway/sOwJ1457dvilIKK/J+Q/OQaHKwpmKO95nCh4B7yrwTBxi9e0NrjaZTtt9
	 crDuyneI/9sBvcynswhVdLKgIKdEhefPzcWdNZgBm/jAYpMGU+0smar730LDYpqwvX
	 AJij9W0+y1c22mbCnukDGTJao+rlNiw93Km7Z7OnP8ZZkoqeUHZ03Xxf7FbRHImwOl
	 bXVw24EbqtJYQ==
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
Subject: [PATCH v2 16/33] rust: block: update `const_refs_to_static` MSRV TODO
 comment
Date: Mon,  6 Apr 2026 01:52:52 +0200
Message-ID: <20260405235309.418950-17-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CCRX4GYASXDHJ2VLY3SGZI2ZSHBLWM6U
X-Message-ID-Hash: CCRX4GYASXDHJ2VLY3SGZI2ZSHBLWM6U
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CCRX4GYASXDHJ2VLY3SGZI2ZSHBLWM6U/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-17-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`feature(const_refs_to_static)` was stabilized in Rust 1.83.0 [1].

Thus update the comment to reflect that.

Link: https://github.com/rust-lang/rust/pull/129759 [1]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/block/mq/gen_disk.rs | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/rust/kernel/block/mq/gen_disk.rs b/rust/kernel/block/mq/gen_disk.rs
index c8b0ecb17082..912cb805caf5 100644
--- a/rust/kernel/block/mq/gen_disk.rs
+++ b/rust/kernel/block/mq/gen_disk.rs
@@ -140,9 +140,7 @@ pub fn build<T: Operations>(
             devnode: None,
             alternative_gpt_sector: None,
             get_unique_id: None,
-            // TODO: Set to THIS_MODULE. Waiting for const_refs_to_static feature to
-            // be merged (unstable in rustc 1.78 which is staged for linux 6.10)
-            // <https://github.com/rust-lang/rust/issues/119618>
+            // TODO: Set to `THIS_MODULE`.
             owner: core::ptr::null_mut(),
             pr_ops: core::ptr::null_mut(),
             free_disk: None,
-- 
2.53.0

