Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9395D3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:49:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3EC710F085;
	Wed,  1 Apr 2026 11:49:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="bjWiQDPS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A24BA4538D;
	Wed,  1 Apr 2026 11:38:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043509;
 b=anio9WowScOX97QE3bojXogLduKT64ilI0J0W2F2q2+Glli3Clef+sSJDQpdvUw8Hu2TZ
 qNaoAwsRD3xVUxpdpdGE8wP+VX1yEzkT9eaDvr32DEpoVC2aIDHsYcQRJsToT5cR5LUwLNu
 HWCzwN1b72aQc3CgkcXZKAAv09I46GSa5W1LiP/9iItKuhvYnoZnP/kBU68mslcgY6fTY/3
 Cp/LVfMAq6MtsO2nvo6FCshiBMXV8tlWSx6cuY9e6CxlzoNdsSS81+kFPMmfrr7pusEK7lH
 s/2tI4Gty5DPGwCTDGU3Px0H2vCEdkn28alONN5OCVlFwhHu/qSxEWOiY4oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043509; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=nT56jk4vfcqSGTZLXA0+BHbxfEKA58OQh64flbfVi5I=;
 b=lZt8tInCiMyMhxTMtA3TgYIHkLJHsi2MMoppd3RnS31UAOj7u1PwK3hm0zmvayoGJLnZA
 dAiw4q+9HH2duKuSOYJiUSmuqZ8VDH/cFBc6o9rXM2+wG6u6i/fa5cg5oan8jFknRBMFD9+
 cuzQfZA01nYDHU5CJLKJmlQpX645m1VNpVL74z5CZWcG/d9ObIAfwnCn062vVoC5bSBWfZD
 WGeNS7PzhfbKTOlG9CZhI2eoQb5QMvrreLbxxaBBeGUYjbKvLsUVrfjN5wOpq2xIkULZS8U
 imEelUkRO0eRJS0fGeSpSJ3KLS2A5AElsil2lWAQSmSAgw4cu0PtTzXc+ZjQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A674A40545
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:38:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D39C10ED4E;
	Wed,  1 Apr 2026 11:49:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0ADA660154;
	Wed,  1 Apr 2026 11:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70ED1C4CEF7;
	Wed,  1 Apr 2026 11:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044187;
	bh=F0SYtjFbh6kBuMGsAC3B+F39gCPSuEhNtbzMf6XGsWU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bjWiQDPS7KU8dGTln8W81nRJSDxVd935z9qep1PRx54VbkqUXW/NAm70R8Hb3bcsR
	 8kFWrBfwoF6D3u90VQt9gfnLw+5MkYjBrLJXy59CfwzSQzbJ9ghvKmP0T6jqh07qPX
	 nZgsxUNmMLQsOvMX+rmKU3cgAlYC8M5VsyLNlSoNCF1/ehwDrZSSxWO/ZDc9AkNKOl
	 dYN2s9Ca/uJe6eLXRE8O15eARgij9XreonoLWpWBUt7AKmqzZWMSIV0sfB6T/jdTcH
	 +x5bDQUczhl7SyXgJ6FO0IyhyMs4MyB6F3wzluhQW+3OP5KL9D3tvpD1rv5UJ4jY5I
	 xOkZx8Uz53dQA==
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
Subject: [PATCH 19/33] rust: kbuild: remove "`try` keyword" workaround for
 `bindgen` < 0.59.2
Date: Wed,  1 Apr 2026 13:45:26 +0200
Message-ID: <20260401114540.30108-20-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: XDI4PEMEPALEUYLU3XUEBKCRVPC7UNCQ
X-Message-ID-Hash: XDI4PEMEPALEUYLU3XUEBKCRVPC7UNCQ
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XDI4PEMEPALEUYLU3XUEBKCRVPC7UNCQ/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-20-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

There is a workaround that has not been needed, even already after commit
08ab786556ff ("rust: bindgen: upgrade to 0.65.1"), but it does not hurt.

Thus remove it.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/bindgen_parameters | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index fd2fd1c3cb9a..112ec197ef0a 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -15,10 +15,6 @@
 --opaque-type x86_msi_data
 --opaque-type x86_msi_addr_lo
 
-# `try` is a reserved keyword since Rust 2018; solved in `bindgen` v0.59.2,
-# commit 2aed6b021680 ("context: Escape the try keyword properly").
---opaque-type kunit_try_catch
-
 # If SMP is disabled, `arch_spinlock_t` is defined as a ZST which triggers a Rust
 # warning. We don't need to peek into it anyway.
 --opaque-type spinlock
-- 
2.53.0

