Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 748FDE9D828
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:57:59 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 491FA10E1C6;
	Sun,  5 Apr 2026 23:57:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XiOSfC+X";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2872A455FD;
	Sun,  5 Apr 2026 23:46:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432787;
 b=THeyAMz+LTnwChys/x1eA1hQ4Z3MSaT2gl92bPMRAkHrNxfYUEgUcMrfJYQEa3f5XZRSS
 XyQqGJ6y7oCy+TvmSPj7461dc7ZPJTWZaYsv4YsU/fsGXiO0bmaIU+vuuwRN8RoXWU3suNI
 JorysXvESdHivraGzDGzTBUkO9Fg0zHv9mxqEpE3UhDDBHlRQyRE5Hey5NxjYFc0uGLCUhL
 9CaXhtqHPr8WQ2jw+hB2erRSHAr0gnCTQMB/ANw0RNQzucwODvMBCcm4ZTYVtAamZSOCwq/
 gOqB+EVSgGc8mn69gZijEYiuHg0iYrQkyE96wvs0YWyiHBOVndo66qQVvZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432787; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=9C1p3WEG4BaT9j9bZbD82zE3LOtfmgSzk+xvgO0HSXQ=;
 b=QA7tA8ud+KCyT1WNFijlUN74n/p71rY8iveU07Hs5bv5bGpSaAFmGTCwNwN/u8qpHiGzf
 0WBP2BPE6NmDbTUqcwUIfTQo7EhJo/x0WnPmIfz5orGW4Tw/6GUCef75YoNr64F9W2h4JVL
 zwFg9416IDLq4HskzdPemwlfrSzY6d/sdMi+KhofdlnFDQhvq/o7LjfhPw58gPzeqGLKArm
 RuXxlWmhFucNsmDo5Hlm9VhCDVtiVNdp2C0Jh/aJFik5V6O0Q/PWSXO7nHqpeQgiLy9c9xI
 1Ewud207APKPMeKw22gZjR2ehP5HOVk9cGaqqyky51toM65B6Dfg52YgCDtA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6EE5A42DA9
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:46:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6DB4810E1B8;
	Sun,  5 Apr 2026 23:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5240640247;
	Sun,  5 Apr 2026 23:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E81C116C6;
	Sun,  5 Apr 2026 23:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433476;
	bh=hONqXGkyEohBL0ahIaQ2+zaacCn47+UE6bNDPSd6pjs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XiOSfC+Xv1sTVseVZ+geqBfsHGu2S9tl0gRfo/vbe06Y7lYJl1eZTbQ/jQ+e8PpUz
	 j11NauOb1/DscQFZ/kQ4vUbkyrUztRKZWLClePiLa6/m2CD7IfQr4O8rUe8dAqmc3m
	 DvTZ+r6H6ksBl8QGEjgLMWjH6COz7TCiqTRRUOskvgVYAsLLFh/VUu5IR1qxtGNhuy
	 oIGZWw1pyBfb4s7PXByYBPY8c+02Qdo2xBcvLDNWHjL3PTLliie1ikz9WSA/nF5LA5
	 tGpam/Qo2OdKWQ2nVfh7Y234TT+6AtOA/72q6h8NA84SL53Cl1WJ1aroNaFIgVm+Fu
	 7AemkWrwOJeUA==
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
Subject: [PATCH v2 24/33] docs: rust: quick-start: update minimum Ubuntu
 version
Date: Mon,  6 Apr 2026 01:53:00 +0200
Message-ID: <20260405235309.418950-25-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: SA5DE6GK2OZ7XT4KRDTUNQY2XZGX7NS5
X-Message-ID-Hash: SA5DE6GK2OZ7XT4KRDTUNQY2XZGX7NS5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SA5DE6GK2OZ7XT4KRDTUNQY2XZGX7NS5/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-25-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Ubuntu 25.04 is out of support [1], and Ubuntu 25.10 is the latest
supported one.

Moreover, Ubuntu 25.10 is the first that provides a recent enough Rust
given the minimum bump -- they provide 1.85.1 [2].

Thus update it.

Link: https://ubuntu.com/about/release-cycle [1]
Link: https://packages.ubuntu.com/search?keywords=rustc&searchon=names&exact=1&suite=all&section=all [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 54fe491deb7d..34c39f208333 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -90,7 +90,7 @@ they should generally work out of the box, e.g.::
 Ubuntu
 ******
 
-25.04
+25.10
 ~~~~~
 
 The latest Ubuntu releases provide recent Rust releases and thus they should
-- 
2.53.0

