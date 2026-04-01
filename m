Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79166D35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:14 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5371410EFBA;
	Wed,  1 Apr 2026 11:50:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JwH43iMX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 318EF45390;
	Wed,  1 Apr 2026 11:38:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043532;
 b=Ckg/w9+y2zD+8VdPhpZDDL/u4PWjJZ2kt6HcHx1b01OlH+uWXZpeU8NXIA3m78b8R5ba6
 XR7yiQis2xAWM284hgGw90Gma6ZUIkpVvsni1JPTmyqLBR5SnibNyoKB5ltnVVvLQBXeHKi
 I89Nmp7/qLEdKRdXzNYME8ss8RZvaDXOice0PUTsYvkv+5H6a7SE/VOPrylWB4obfPY+dnU
 L4VSlAToK7hDTL0Ko4CjF1Um4xePStcCHG0GfM/al6sZqxWElVEyhKHAjHpSBVF+y6/ap1i
 CPRQh2Xl2bvnEeSTOeCHqDQNjouTDhSTAEnWoD3wc1chwld8RZPKn5lEyGtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043532; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n0NBfAnIQSN6Y7GA4eu7XZT+oa2B4bEOQjyXTTgYNgI=;
 b=H+q2wPE/jFv4Qzv1kknW/Pja5TmFshBnT3JTPfUdLiy5/WyI/WfZoMk3KCx1s6OFFrT6z
 wWo+9CH6Jk0V4AnT16BDK10hbtC8IfwGZZOInGr8hqsEesjthklWbzhUyNzHlaSYWoPgc7r
 bUl5hMY4bOfupj38Hqzd8CgRydBp15Es5lPQmg0Ua9G/kiDJ86Wnn5a4ofEvGKprX6oH3nx
 hjv/whL3l7wrTSN6iuwEiaI2iJUC/2OG1PXth///vMFnnFvcA+A/ukzDO8YLG75H7IP48HY
 4eYvJ5h8ytcYPD6zOi4BkXwfp++tEXvcO/bg6zXsqoKXFP+P2wcavOkRAQ4w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B728B4538A
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:38:49 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B829B10EB23;
	Wed,  1 Apr 2026 11:50:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9BFD0407BD;
	Wed,  1 Apr 2026 11:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A1EFC4AF09;
	Wed,  1 Apr 2026 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044211;
	bh=iISLHJsJQiyE5V1a4iQF3ymUr2P6zTU39tNtCIX5lU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JwH43iMXpXDQcRy4+AMfSoYea42pNLVjzuMUPXqV9lyKyZIS7rRAiS9cIgTsQsdyd
	 j6B+J+/pu75uzOpJdnOhGJFNMudRyhbVI5dSzB4BiQVbTcwkXAFXR8xUeur9CaaAtt
	 JILD8rNL8BETCD7dVZ00oT076Wj2GzJGGKGV6CXrVenq2zJx1Lq8ByMqTLw1UKAF4R
	 wf7/Ah1lAE4c15DAF/slU0ZwiQvEKjx+rSuvc5YXtnnEw53F1u8bcFjkR9SONe1CBC
	 +R4ZEzhNp4MYwVjW3Cv+ubljVX44Z9Rv2JtwQix1BCDgnfWCo1kCfKXLTfhQHkzxsH
	 iTdb7Dl5K7QVw==
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
Subject: [PATCH 21/33] gpu: nova-core: bindings: remove unneeded `cfg_attr`
Date: Wed,  1 Apr 2026 13:45:28 +0200
Message-ID: <20260401114540.30108-22-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: QSFBQU7CPJ6LFQ4SVUEZIQYDXWMRJVPW
X-Message-ID-Hash: QSFBQU7CPJ6LFQ4SVUEZIQYDXWMRJVPW
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QSFBQU7CPJ6LFQ4SVUEZIQYDXWMRJVPW/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-22-ojeda@kernel.org/>
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

