Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 159E7D3517A
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD44F10F072;
	Wed,  1 Apr 2026 11:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ItR6p4/Y";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C5F245391;
	Wed,  1 Apr 2026 11:39:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043543;
 b=su+7tHWlcYrlcFPUGdwa58rtWBqzxKCJELqObAns/cDD32Ut67a9KPQMRVyWJ5dDDjipS
 tLVui5rKjqWX4DK97V+oCmWOPJ3mx5fqkylOgJBPh38de2HX1nk74i/tz+3uqQfBNOtQcCp
 psql+7qvQ6xh5k3T1yqpy20fYRHQwr85fU071PIgjUgH704cEWXiKeyFU29p38VoE5v31xj
 m6Cw4nO3CXnpwnVXTAQF2HsNQlo7IGxAUXzIYcGxjZnB4KEyvQ7jVhXQa7HusMDrOGC2Ywd
 qaVbVmnA6ztYwcH9RNV+T2Cwk5qyiImv6NqLyZ4P2gUU7tmMZhasJQNGMaWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043543; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JxXn14BS+Kqq/oucH24B3ORTRUASx2APtAiY7561IWY=;
 b=G9ugdrcvX+qT2W72Fzacz+f4f7B0jQxdfPkHCqYkRzg8QFl7x2cXacJrkHyDs3WSWc1LP
 gAapiT2veUOu1xG0Uw3Dvk53Lrgk+lUm6ppbBM+yqBsGrqMfp6WKauM/62AgtbRw7uYvjNp
 852vX6mVwh0h1z0lZsb5dQ1ivsLXkWmqGAZbnQv84Ju/5jRAaystQimzPg+iLNA8BKDV0Ps
 ymAxXf3kExs+U/r1mohXHBtScaZuzkMpSvv3IBEJXhYu+HPmTffeDR6TjP+rEHTtMbnJ/o7
 /secC5IYMbHCstxdvKNAbo6o+MoiYFX5OT6+9kXkfpiyvuMVu1pPdZMrFt1Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 05FB945374
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:39:02 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0838B10ECEA;
	Wed,  1 Apr 2026 11:50:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 77B4340437;
	Wed,  1 Apr 2026 11:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DFE8C4CEF7;
	Wed,  1 Apr 2026 11:50:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044223;
	bh=PqI1bYJ4FCrbIrmuEKTmldqC0slnhQrUlTQ7imeH2Xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ItR6p4/Yc+nHji3wl3KUxbJ33NmAJHpvcFwT9PTjg2oSVZNOz37/llD5plurOUFoq
	 Rj6XsVPjrS6u+JCfyT85bUeamLAjiNB1oNaiT+axluC0s7Pj+FYmYV9FQ/2oWjP4aF
	 iGV+rsJMoa6gIkSBun+AUqT6C9iqAHuOVER7yU3112+mdIBnu+/20YfgG7i69Ez91E
	 1AIAC0coViVeE3+NwZ/w559DeJFlj8LnLoYci2Po4dRc4UCIPMEV4azENLjsOb2DOF
	 P6Ab7+maJovrhEV9zROgky/+XmWAkK6Do+/7vX0TEA0Ll+1deRn2AEoMvHaLb4Y+sg
	 MqtWGiRHh4hng==
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
Subject: [PATCH 22/33] docs: rust: quick-start: openSUSE provides `rust-src`
 package nowadays
Date: Wed,  1 Apr 2026 13:45:29 +0200
Message-ID: <20260401114540.30108-23-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: FC7UTMIQKSWQZWZ6EJMV7UUEDCRPMR56
X-Message-ID-Hash: FC7UTMIQKSWQZWZ6EJMV7UUEDCRPMR56
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FC7UTMIQKSWQZWZ6EJMV7UUEDCRPMR56/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-23-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Both openSUSE Tumbleweed and Slowroll provide the `rust-src` package
nowadays [1].

Thus remove the version-specific one from the Quick Start guide.

Link: https://software.opensuse.org/package/rust-src?search_term=rust-src [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 152289f0bed2..642efce04ee8 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -84,7 +84,7 @@ openSUSE
 openSUSE Slowroll and openSUSE Tumbleweed provide recent Rust releases and thus
 they should generally work out of the box, e.g.::
 
-	zypper install rust rust1.79-src rust-bindgen clang
+	zypper install rust rust-src rust-bindgen clang
 
 
 Ubuntu
-- 
2.53.0

