Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE32D35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:51:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B734F10F08A;
	Wed,  1 Apr 2026 11:51:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MMSjHj3h";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9035145396;
	Wed,  1 Apr 2026 11:39:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043592;
 b=akHF7QCn7kM+KjODp5xzjEXqJMaui7xE6BptARpVksOuArD4AL3I2VxhnvsP6RmyNmGnS
 TqIuB04ZMCyy5QgQ84SOqBtbUhCAyBrKOPzrZ0ZDPTzgzLYeVTYM8qKCUfH6awWaOsppeC3
 hwnsIfxj0an2fJgjWSji3N4X7Yg6/251tKQ/uBn0XAl6efBEdXbqHt3lNcURkR85847ZbAz
 6jjqJFUZGMQTUfogRVjzZK2p2eC6rYtPXPI0Lb3gHwZ7uvHo7bE+DXZUxuDJfPoeXvJlMeX
 QpJYJauUlHfuQo0tZBdDT01GeVc7winHUI1BfXuP7yol6duppOi9PU640tzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043592; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HJlWaieBGL4iuefoWZuMjZDRJ24GGyPWnojBIBdvKL8=;
 b=1B7WopD9K6zzkoYA+kJJ+SgwvZgou4M/qp1lPaO4Zxr/DwKIWE14M6H6x74F9hRas8u0v
 TCx11PDm9QbS4OQ0nSRgFIddm1alnV9HYrc+ykCv0x7MGhP1+vszxqQ2xFzJnFeoaCgAvK1
 1K1DENLyLNnrpKLX6kC+blO5Eit05LLkKt8dNFplez6dAfzbpc4w1QeM6jZV1P4dFeErQyx
 xL29S1l7K/lQjAHxbkj5b1zUkzS0abfrlG7ZQea04wzWLKsxifoFHqDAUwlAcW5rny2ZbvM
 bWzDb2woy2vJiMAkTIQSvHfxr3MkodrWOPUuTNhFUeFnIECg14hDFxs0iVhA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 1414345374
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:39:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1594310EFBA;
	Wed,  1 Apr 2026 11:51:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC2CA404D6;
	Wed,  1 Apr 2026 11:51:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F5DC4CEF7;
	Wed,  1 Apr 2026 11:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044270;
	bh=iESh/PsAjDcxQq1FPvUHHfd+weV5KPEgRwQZ+Kj82r4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MMSjHj3hxQyMr3QOLPc9anPPOGIWvLjjfUs5B9icQA6qsTjz7U5bSiiQLz5Hoz/OZ
	 3YloS9ZOhT+qiN9KqpcVdJ/fLcbsTEZsVpLlIJR/p8UWfxVDZt/sNTHzb3Tb1udZ9E
	 jYKb+IF68+AxkebN//+Bv/5FcswBwbEnYjMPl5q4E8tRf1uFO6MDGiu0giHqkZrPMZ
	 B/JU0qy6HQc8IL0tBX9Pvko/kdINTPzrBMF75o1WUkXp4U9BqKKQmSf0bTLleTLfsz
	 9SSYwlPv8GbLy88Jt1O+HwrOoOXCjTR4QWXF2VgqHQ3s27vGf1rd5NqLc88kF63w+j
	 heSTJSaAyigww==
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
Subject: [PATCH 26/33] docs: rust: quick-start: remove Gentoo "testing" note
Date: Wed,  1 Apr 2026 13:45:33 +0200
Message-ID: <20260401114540.30108-27-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 6XIZ26NKSSXGRG4VHK4RVPSECU4OAXRN
X-Message-ID-Hash: 6XIZ26NKSSXGRG4VHK4RVPSECU4OAXRN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6XIZ26NKSSXGRG4VHK4RVPSECU4OAXRN/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-27-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gentoo does not need the "testing" note, since its packages are recent
enough even in the stable branch [1][2].

Thus remove it to simplify the documentation.

Link: https://packages.gentoo.org/packages/dev-lang/rust [1]
Link: https://packages.gentoo.org/packages/dev-util/bindgen [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index db08c3a03a4f..1518367324fe 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -57,8 +57,8 @@ of the box, e.g.::
 Gentoo Linux
 ************
 
-Gentoo Linux (and especially the testing branch) provides recent Rust releases
-and thus it should generally work out of the box, e.g.::
+Gentoo Linux provides recent Rust releases and thus it should generally work out
+of the box, e.g.::
 
 	USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
 
-- 
2.53.0

