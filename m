Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4CE9D82C
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:54:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A30710E179;
	Sun,  5 Apr 2026 23:54:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="c10lWAwN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6AD4B455B1;
	Sun,  5 Apr 2026 23:42:43 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432563;
 b=sNfeU2JRi84jsLeyv5Sg5ZdVNpcj9zS2mA36/AXjkPEqPb99HLmhKhM3A6zXshbsEzTmb
 AECC8Td0lSCl5F8jGqSdwG5CF2ZmgsoFcz6yhdKV6QUCWhPTcm6PbxQg6oKQYWLE42LrOld
 0PYFxBlGxLXbo0omhgpmlFTAmKS6bqiuSq5P1hLqGOzR3BsJXdPvxulNJbvh25XsPcQ0dG8
 jOzXNQaThozEJHlD+mpt1EB80bf++N43LxuIvvQcsO6+HxETeET/VRZY8XQeY80TSj0S/uR
 keUoy7MuL2s4KXboWqXRpTR1CXGFic4gPXlDxOzxD9dohJBUKaWgEMaCXoEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432563; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VEjrsTsh1D24a5+YboyEkgFQsIHf4Y59ZUtFREAYkjs=;
 b=JzNt4vaYWTvh0rEF4GBdlvJzvfec4x+YK2TKlGdP6X2dliYLaao9K0FDzwm3BGV0wq/3e
 OkV6O4g+iPvuywoBZVR7PrJg0qoO75ovzC8cJJtWWLZhdU82enT4Q8mQUKqYP4zJk1P3zAm
 FQO5mZjsjpJiDrfaw3U7dqRilt1hBrikcSQ8/6h9fzUtPAbTcrd676lehKyUKojYjVrfzpt
 PDPSPksbTxzrFY5O2QXsVDtPKeSTg11S0GZZKgyC1fDdXKXR4ze3vS4lBG5Wt9d5Oo+L6jU
 uSXVP5aYhk/Eya03yFT6F1AWlSzrgZPnjWMR6QUKWFdK+fzMkS5gOP3kCvHA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8CAD8448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:42:41 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8A16910E148;
	Sun,  5 Apr 2026 23:54:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6EDBD418CE;
	Sun,  5 Apr 2026 23:54:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5734C19425;
	Sun,  5 Apr 2026 23:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433253;
	bh=oJiEjRp/opaguJ4HhOa7BUALrmAHlwil3WnDUUwEFyg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c10lWAwN7MLREejYSBh3vQLAgy//epBWc0tngWnnNsGINz8/8BlSPWfgahadGOvdg
	 GJR/QGcckyY1VKHxNGRQhD/YyTL42GRWjDnY9CRlUt+Bx7rCq+inC36ss3LMkllx5C
	 jCzn/1H+H3U2Udf/nYq4VGqSHLFJs5uBG1jN2j7ksPIuZQIwZS8T1ZqvFfTkCjXinf
	 HwuRwkXS9MYDk6Pqlgm7p9mbcEhyyEKZ4di60v8j1CCV16s5WfaVl6n4/rqtJFA5Ag
	 9rs7/6aurHA4leXQgoMVliGbwR86JVtRyVkjWqwpFzYYP2uH4d8JIwQ8pbaJ3B9UHq
	 QUN1C/k9eWL2g==
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
Subject: [PATCH v2 04/33] gpu: nova-core: bindings: remove unneeded `cfg_attr`
Date: Mon,  6 Apr 2026 01:52:40 +0200
Message-ID: <20260405235309.418950-5-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: AFP4V3VOHN6AT6RBPL67DE6X3DIYI6YM
X-Message-ID-Hash: AFP4V3VOHN6AT6RBPL67DE6X3DIYI6YM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AFP4V3VOHN6AT6RBPL67DE6X3DIYI6YM/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-5-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

These were likely copied from the `bindings` and `uapi` crates, but are
unneeded since there are no `cfg(test)`s in the bindings.

In addition, the issue that triggered the addition in those crates
originally is also fixed in `bindgen` (please see the previous commit).

Thus remove them.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 drivers/gpu/nova-core/gsp/fw/r570_144.rs | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144.rs b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
index e99d315ae74c..2e6f0d298756 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144.rs
@@ -7,9 +7,6 @@
 //! This module may not be directly used. Please abstract or re-export the needed symbols in the
 //! parent module instead.
 
-#![cfg_attr(test, allow(deref_nullptr))]
-#![cfg_attr(test, allow(unaligned_references))]
-#![cfg_attr(test, allow(unsafe_op_in_unsafe_fn))]
 #![allow(
     dead_code,
     clippy::all,
-- 
2.53.0

