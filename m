Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CDE9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:53:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F195210E164;
	Sun,  5 Apr 2026 23:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EwAXuYA2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CF38B455AC;
	Sun,  5 Apr 2026 23:42:22 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432542;
 b=ZgHfbqfq42e+8+3WVk7cniEfJAqhlJK0gTZb43lvuhWkQSSXHZaum0VU3Djj9MrEzkiXf
 BnAW5fBUw4bs6nPyOvOSaVtN2CofF9Oe5n9NxBYx/Rw8VCPIgUk+R0AouFr2JOG0o2sKvf9
 GPrn7M5GF0i49KVEr5pz+hxn4jLwJAjxmsqDzz2UicIS+fTy5z0QlcmGPoAAaOEjf3pgGoO
 dL66cb0ir8OkX1czCYz1mEar69OH+q06ecnBlG/kNfyEcbJP69sjq/5qaHUStOyhwqTQbXg
 Vp35T0ClHXCRNADkrCwp0M9zW4/c2yjrOT86MvVLab90YtHIOKKFOZ05sqOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432542; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Q0KPyHXHR1ZvkTV5omYCRo3qZwAvZw+TBYGMIo69HmE=;
 b=gDNglS4lNZpxmKKaSXBJCj1CH3fhx73lnam7bbZ3jP6NZe62UBc3G2DPJvFnG2m8MQ5U8
 6XrofrkNmhQhu54zfM+ftIdk7owwr+ISUVYE9UQOpNzW6fiC1pb7xryKF1woiqRGebulr9n
 FmSnYc/VaA8FuNp2OdZ4ujMR+DiT9ZbfAhHkcJ5CU6AoHd2pQ+c470iaaT30aVetQL0qsKM
 44QoKr9eoLhoVKRYUWXzaR58FdIMrqD3tXqRKfc3oIbFkl3rSdKh+uj5gHa4c0xaRdM2Zgt
 zCzbYzOp4hA/yutqZCpCjy3YTlIWHEFG7P5ikQxwhwb12kXkMyYeUtzZ9Qtw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3EA83448E7
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:42:19 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3C25C10E100;
	Sun,  5 Apr 2026 23:53:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1FDFE40DF7;
	Sun,  5 Apr 2026 23:53:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5792AC116C6;
	Sun,  5 Apr 2026 23:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433231;
	bh=3AJRnAyEU2suxXGqceHWmfrdhCBJgg/viD//VN5No4A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EwAXuYA25JGS9wsvKoXsGN6sAEKslnUZh5D1dRotUu99nhYgcoqpY6WYoCLhunn5n
	 xHVYrx8rpK1rU+25XoZCWXvldDnU50XFCE9J47vhT2ZBF0UGNIKn4LeZfLphQ37F6o
	 N1lVtDyk0UuzGU0HE91nvri0/O0pl3Q1uBMBgMuqqJFjAGhMQ/Ha1VCv/QoDDqC+Cx
	 MRKnQoRQilcWK9zZs34qU1c15lT5egG9V0Rp4ouFrAMfz8ogTTbM8rXPpqWj7JccvG
	 ZkUDGF0siAS7QeLkDf2sedkNJlP+8fmXP7k5sjXvvE3+l8wPpUZ/4xCTRIOfLlFB1U
	 2IJKROs43C4iQ==
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
Subject: [PATCH v2 02/33] rust: kbuild: remove "`try` keyword" workaround for
 `bindgen` < 0.59.2
Date: Mon,  6 Apr 2026 01:52:38 +0200
Message-ID: <20260405235309.418950-3-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DPSTGDZVHL2YUO4ODZ5EPQDPK5YZMB43
X-Message-ID-Hash: DPSTGDZVHL2YUO4ODZ5EPQDPK5YZMB43
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DPSTGDZVHL2YUO4ODZ5EPQDPK5YZMB43/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-3-ojeda@kernel.org/>
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

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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

