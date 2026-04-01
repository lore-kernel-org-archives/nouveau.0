Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EDE10FCAD2
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 22:59:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 854CD10EEC5;
	Wed,  1 Apr 2026 22:59:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="b3ZOfAO/";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 599CF4547E;
	Wed,  1 Apr 2026 22:48:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083693;
 b=vExqdGTENSgihkLi99SAd1ibNEEbd2ZXlgbNYkA53LVTZZk2bLWRL2hR3NM8gEOa6yZIi
 wF73/M0DJ/QWWrwBJwgKb53IN6Z/dvI4l1Hpms5QsdUUp/mG3Ka1JK1muQhBRmQxPQxgrqR
 sVF09XzdWzLFVUghBnMC9W/mInrQLgfW36d9ZqHwnKmAI6BAog1r/lpbR68FePNqpXWEmPZ
 4xoThb2YIyPh68tJ6zeoSKLlJ5Af2l2NjWCBb0SbziKIm6xnM91Vgpg0chn99B9QbuAO+Rs
 Y3dEH5JwBXroFd/RtkhBu5NUUVpGqGdq1NPjm9ZsWn2BlZGdHLiI1N0pVn/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083693; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+V5Ka3r292WrT7qbBQ57WkBT6siHTxZdBQpeoU8PGHs=;
 b=Jkuo4yLdMBrxJx51rBTyNpNKyvTHmywJ0UGuXNKH4sG6cvWOdFUib0Uq3u2NkJVhKHSl9
 YL0V4yFWKOi8yH67q5YLYBrVQjX3fR6GEDd0VKu89R0hlds6MjdnHI+111r74VD2DBKFluM
 p5U/SA2EP4eCDIBm3vJNZlYTsUQTkZ3ZmvKqG/PW2c5UtzY5oCwYGikkH7Wp8pIeBk6mg/b
 G448IXCB/gXQLJLscsvyurESU3WUZH6BdJbETiXUHIrXQKfgF/x2+0u+2ZVr0fXXN7GzykL
 EFwQwBrFnL6ZDOKHQnG6FHm4fwg3f5o4uX7/k/D/ueFd7SNIZYcTfPvaXT8w==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 222D84532E
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1364210EEC5;
	Wed,  1 Apr 2026 22:59:34 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A9066183C;
	Wed,  1 Apr 2026 22:59:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65428C4CEF7;
	Wed,  1 Apr 2026 22:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084373;
	bh=Ii64UohOmGa9D7Nk9W6Cz5l63ShstMt6K7vL/J9HNQA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=b3ZOfAO/k2lp320CDk3qpRMJS05zjn/afZ2IotR/pNa9pvO8jqoTFabvaRGWwjSrV
	 afI1aMc6CVXX6wjn76mwbBs3jWHoWB3LvE9ieXeMM09JLcTdQD63xZobaCgRt9gagC
	 T4+ovLivvAMWeywP9DE1NWQs7WrRBwmmoXZrUEt5B5PWnxDjT8oCVPV8TvfZLgTpl/
	 qyNiZabsz4Rjnc4DvPKAAgyl6CvLkHjVG3I85YPHu/iRYNHBkH9j/Tt9G2bSzGkLyW
	 ZQ3WV8fVX2jKsNsVBk08tu1kHvyWkZOpJR2eMMt01r2FfBbmWwsZ6AI7/ziE33NiIW
	 O8pZatbWprVuA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 03/33] rust: simplify `RUSTC_VERSION` Kconfig
 conditions
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-4-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-4-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434434.73816.3787660440846251925.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=514; i=tamird@kernel.org;
 h=from:subject:message-id; bh=Ii64UohOmGa9D7Nk9W6Cz5l63ShstMt6K7vL/J9HNQA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzt9md2tHTAj4WOoTNzX20a/Xhyf8/tK8zeF/6JL/
 mq6R/352zGRhUGMi8FSTJElUfTQ3vTU23tkM98dh5nDygQyRFqkgQEIWBj4chPzSo10jPRMtQ31
 DI10DHSMGbg4BWCq2TUZGWY/+B+slXnaqd07eMq5YFYnE9/e7BitD2eXLuc5Vr27/CHD/9DiPXc
 0reYKqWbbLrgwyXNO3X6Xowze0tyBEarPNty5xAoA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: 6Y3EJMLNDOXA3ECGXMX5WRKMJOYOH2UM
X-Message-ID-Hash: 6Y3EJMLNDOXA3ECGXMX5WRKMJOYOH2UM
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6Y3EJMLNDOXA3ECGXMX5WRKMJOYOH2UM/>
Archived-At: 
 <https://lore.freedesktop.org/177508434434.73816.3787660440846251925.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:10 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> With the Rust version bump in place, several Kconfig conditions based on
> `RUSTC_VERSION` are always true.
> 
> Thus simplify them.
> 
> The minimum supported major LLVM version by our new Rust minimum version
> is now LLVM 18, instead of LLVM 16. However, there are no possible
> cleanups for `RUSTC_LLVM_VERSION`.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
