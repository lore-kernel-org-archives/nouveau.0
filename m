Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B8641112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 38EA410EF8F;
	Wed,  1 Apr 2026 23:01:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RnZUWOir";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0D72C454AB;
	Wed,  1 Apr 2026 22:50:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083802;
 b=C0UGgJH5Edjpppe4VX3hNb+9nnjJ/9H+f3zxv2mcmU1gndQDpwWjDdCHmyiHs71/oWC+p
 UuVRYAewroMATNBYyu/PG2uFbxLM7d+Tsh1NfoJucgiWrt5wvUDFhj71I7T7iswLVtosSz9
 ICAruqWu346GUDZf5Haiu5QmNyfmhu5jQL+IJoD1LANa5NmSfKltO8Z3OnuTuLttCsP2OU6
 qVb7hbkDr7VeLmRqYac7hkRSuv2r6L+8VRO8gGlUMEjUZpZdapvdlHnkV0PffGLmEkzcp3+
 wWljiHK6gcQLPxW9enjcMVw5Jn82/ipXgwCTdmuAJFj6Z20tMddHuvJ7P+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083802; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qeE3o5NY7tU6Co9aT2IN5/RL0Yi3FkBzGM80E/lB6C4=;
 b=bH9stBItdNzknSoGw8Qe5SDacj7E8UNMg+V2jTvNOVIv4ypPOZbAp9eNHkK7baQp+L6yj
 1cJHkCNbDVvmX4O/Up9izQmLvNjubsz1RSEGwx9D0lMgAFTTqrc1GJbVsM5BWpWPRYdhXMb
 j1zHyY5LccncQyjd/1/0ryYbslEglMPQhJMs+hs52q459EFrB5a0SMLHBeADwNGhym4/BCY
 cDfEdwjfFk5kB98ftaQBYr++kpYMAXVCw1Xt8G3tdfGOYBorM1nQI+PUsOWbrGB/Fc8cyNm
 eN6KGSft7Hu3N6a4by0uQw0TFbGw+b8Ii9HpPFV1QLKtAh/0QWlKX9vg4Pgw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9734445476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:59 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1510EF8F;
	Wed,  1 Apr 2026 23:01:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0CBFA60120;
	Wed,  1 Apr 2026 23:01:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E7BC2BCAF;
	Wed,  1 Apr 2026 23:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084481;
	bh=6656iS8Z953zXAk/bn8KpSt1Oh4C8fXwc0OPqmLk+Wg=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=RnZUWOirA715kbUPApG8z/29huJIEsdvuiYpn4e51BGl8Ih9SKFkc8mSpA7VTChiB
	 x9CVKCriNZkE9qjuaipqjo+nCQVG45LC+x9BJfMr26Ka2UW9mJ3orbH1f+2MVf8rKs
	 g5Zxd3sc+h9Awoqdt/jrZcCCNplpoC8xYVYMJ5lSdUcmrwD+FiH36uWGgU4rjiWVNO
	 ugNNPXvHlZzVsQ58hUHNyoop8UyO3R2aa7bYcrnxq//E7woWnwm2eFwJwJ/08jWKAM
	 uYP7EZaf1nmiAP00xNPx4xm9mZO8bt0go7da8uTuzQNPOnpLq+/734ONfHKrXmysCf
	 jJVgMm6it7WKw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 24/33] docs: rust: quick-start: update minimum Ubuntu
 version
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-25-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-25-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434466.73816.13717819961434434560.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=430; i=tamird@kernel.org;
 h=from:subject:message-id; bh=6656iS8Z953zXAk/bn8KpSt1Oh4C8fXwc0OPqmLk+Wg=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7vYT5udIq//NWh3249c6Zw3aa2uE1ildkhcKim49
 Glpsf7MjoksDGJcDJZiiiyJoof2pqfe3iOb+e44zBxWJpAh0iINDEDAwsCXm5hXaqRjpGeqbahn
 aKRjoGPMwMUpAFMtfoaRYYZs6f3+qpndGzVXCi3h9u8KjP8wX+SNtVZRiJHZvG0PrRn+yr6UuBJ
 UWq+RY6pw/fwCn9/Xfx5LiJtkZDJlt7jYZ7ZpfAA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: 4677OSRQASDSFZYQC2WR33J77P73VBCH
X-Message-ID-Hash: 4677OSRQASDSFZYQC2WR33J77P73VBCH
X-MailFrom: tamird@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Courbot <acourbot@nvidia.com>,
 Simona Vetter <simona@ffwll.ch>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?q?Arve_Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Christian Brauner <christian@brauner.io>,
 Carlos Llamas <cmllamas@google.com>, Alice Ryhl <aliceryhl@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>,
 rust-for-linux@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@kernel.org>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Uladzislau Rezki <urezki@gmail.com>, linux-block@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Alexandre Ghiti <alex@ghiti.fr>,
 linux-riscv@lists.infradead.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Rae Moar <raemoar63@gmail.com>,
 linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4677OSRQASDSFZYQC2WR33J77P73VBCH/>
Archived-At: 
 <https://lore.freedesktop.org/177508434466.73816.13717819961434434560.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:31 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Ubuntu 25.04 is out of support [1], and Ubuntu 25.10 is the latest
> supported one.
> 
> Moreover, Ubuntu 25.10 is the first that provides a recent enough Rust
> given the minimum bump -- they provide 1.85.1 [2].
> 
> Thus update it.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
