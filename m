Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 982D0E9D826
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:54:50 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7A5A810E19D;
	Sun,  5 Apr 2026 23:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CDWPhZSp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5C9FA455B6;
	Sun,  5 Apr 2026 23:43:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432598;
 b=Vp7Kqv04AdHt/0xhTC8hojHMIqwsRD8L2IX9jePaKm1Ga9c2mZTo1eU+si0sGUCsIgmRN
 p4j3qOt4anVVAuJiCQ5gSQkkuYPmrBHYte7hyFQsqXluOToJCbT2kxTSWVO2XbGI6HsEZwy
 58IIJOKIIpEP1WftdCv0q8j8kXWLsbBklXD/frHiDrMWFa/kk+rLPyxfvZ1PQJ2Zsxq1kjj
 pRDh3G+srVeIsjshFGPOB07y10NSWthhFpK2fiO/Zb+76DO9hR02/cLtDjEnTTI6pKz7pTV
 mr/eoXtsHJtXGmRN5n2B9VVek+BHwfWUVYaM8uuWhC9kd1EnL06yVPsXxyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432598; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=QvCu5kmWdcjEz0mG1/ljqN7ZX67pagaq9v8D1axXW0c=;
 b=BycC11uCSs+AJDDoy6mpIFwg0esrPqIJm5vFp80nf16LAovzDj+QWzzoFfW8Cvap4Cjv0
 34bqsZEmMC4UvEk+reRiHdN6yeh70tgPURN2eBe5p972vxqf5Oa9ubHsyBdLcD2TjllnpA1
 i0iTd6o7wRRJPjatTK7ZQ20yE9WHspizZBdE+FlPUZ24WAEm/EfWBHtQZ4DOI1yTzyVbV3L
 cgZa0g8Mmv6KI0PdoKEKMkLBar+s21JsGU7sZ4/48TXms16glqljUuqvXsuKoZOgy5yOVAv
 HlwxvHBzX40xFiu6kPnPWOZfRpurochKweoc7gt16iuJ4XXHe+E6DI650DQQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 97D2B448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:43:15 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7F90110E173;
	Sun,  5 Apr 2026 23:54:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 021EF600AC;
	Sun,  5 Apr 2026 23:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 433ABC2BCB0;
	Sun,  5 Apr 2026 23:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433286;
	bh=kAA62WBPcurVVrTXPGLQy+IyDPvmVjelJYdVSSg7Y/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CDWPhZSpnW+m2srqW9KnMzV7G9L1iRvIsEo8KP7CScPqG1Ifub79N4yj4T0IKrXc0
	 4XmCbJ8zDasSdrjt7qHAlDp9GjyKU1PVePB9pLKwO1yYKuqMmE+zMzS3f8ObYOQMzG
	 Sz8I1kSAf+/0TbbLJC2pKQ0kqL3IFyIPFzgAagHeEGUpcHcDj1c0A7xusZQz9bbfR1
	 FSgviWf3M31Ti8M4qq5aJadgtYloCGN8lrF7uyJTBqns8a/qMIIobVXaSkE/6gLioK
	 tJwkSLx6bxzgYU0l/ny8XpR3fIxVt28+VUtoLh3KPsIh2WOCgv/Dnw0iO3ictk7CMV
	 QrQTXJ8QympQw==
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
Subject: [PATCH v2 07/33] rust: allow globally `clippy::incompatible_msrv`
Date: Mon,  6 Apr 2026 01:52:43 +0200
Message-ID: <20260405235309.418950-8-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: CKMCPQX3KN3UUGN2VXGEAKH3MCWSAJGI
X-Message-ID-Hash: CKMCPQX3KN3UUGN2VXGEAKH3MCWSAJGI
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CKMCPQX3KN3UUGN2VXGEAKH3MCWSAJGI/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-8-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

`clippy::incompatible_msrv` is not buying us much, and we discussed
allowing it several times in the past.

For instance, there was recently another patch sent to `allow` it where
needed [1]. While that particular case would not be needed after the
minimum version bump to 1.85.0, it is simpler to just allow it to prevent
future instances.

Thus do so, and remove the last instance of locally allowing it we have
in the tree (except the one in the vendored `proc_macro2` crate).

Note that we still keep the `msrv` config option in `clippy.toml` since
that affects other lints as well.

Link: https://lore.kernel.org/rust-for-linux/20260404212831.78971-4-jhubbard@nvidia.com/ [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile               | 1 +
 rust/macros/helpers.rs | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index a63684c36d60..78f5ee173eda 100644
--- a/Makefile
+++ b/Makefile
@@ -486,6 +486,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::as_underscore \
 			    -Wclippy::cast_lossless \
 			    -Wclippy::ignored_unit_patterns \
+			    -Aclippy::incompatible_msrv \
 			    -Wclippy::mut_mut \
 			    -Wclippy::needless_bitwise_bool \
 			    -Aclippy::needless_lifetimes \
diff --git a/rust/macros/helpers.rs b/rust/macros/helpers.rs
index 37ef6a6f2c85..d18fbf4daa0a 100644
--- a/rust/macros/helpers.rs
+++ b/rust/macros/helpers.rs
@@ -49,7 +49,6 @@ pub(crate) fn file() -> String {
     }
 
     #[cfg(CONFIG_RUSTC_HAS_SPAN_FILE)]
-    #[allow(clippy::incompatible_msrv)]
     {
         proc_macro::Span::call_site().file()
     }
-- 
2.53.0

