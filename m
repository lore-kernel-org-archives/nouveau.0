Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD151112242
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 98C2810EF53;
	Wed,  1 Apr 2026 23:00:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XQSUAheh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 71AD14549D;
	Wed,  1 Apr 2026 22:49:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083770;
 b=vqfpp51CpnsFqbTOwqz30IsJc4UvL7FF8njedd//6dxt2YvPRNBfakPQKtPs6z1jUUDsp
 SqIBk7OfNBx/z/mUWTeTFA8MQqNUTYq+kO+WV+gqNMbY8Z9MftO8cclKCsSe2B7cPgDcFDY
 t3vl/mMA27fLUF1EfTA94a4NIV5ot0dmSZGLCnX5o2SDQkQQ7QJs4RZUefvy1vHobolJoC4
 tNrPemYyLVA2oaEh1zm+juw93nKLp2QdeYzbrmSvZlwlLT9kBiXrubPCLwt1S2kKdysvNMx
 kPjoDlaMfW6Xq6iB/CAvOjc9cqV5F/+oRwCnFa1T4egYfXsNnaJYyodAiL0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083770; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0BNeyTKVO6TAfRT6da+L5Y93BPVFp4AkkIZP5BV1Ee8=;
 b=JyHTJC3JMkt53apMfuLy4I0dZbXuHknP542rQLD51Dx4vFk9uwK2L4oNnnLv56gZP4SXH
 1Xwn22eRWFHnfhdlqc6sw1IPnb1nxPOsibRioEU/kQUal1iSxd3LSVqAJUFQ4Y87s3XlyvF
 B3yrIvvDr3fjiLMpOQ/67ABnB1JpNR5nCfYkM6RqzkzyTzmPBSfaJ1zzt5n+/D2F0nzG8yE
 3PAN8PZ2Wlat3X+Xr/arWKtuUfiWt6Q0W9lWDx/Sy3E30rleTN+8bR+YlkVJkCpOIovRAld
 kzwpnrFOnG3cZb0R7WvJOoOzpCb/wT9Lp29nDX6esa66Qk2Sj2nwCllWAoLw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CFAC045476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D842610EF52;
	Wed,  1 Apr 2026 23:00:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B0BE243B01;
	Wed,  1 Apr 2026 23:00:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1F8BC2BCB3;
	Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084450;
	bh=L8JME5DgePBPrx4n+T2YtWB9P6u86oez5ABp2z3CNBA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=XQSUAhehK0geqbt+sp4fwR2MHzqQqgmyyza2UnqK99FLKtZPX8PbhFgagoLwnWdAi
	 A9uW7qhg1C+WKQNNQJ4vNBoC8JXS68HsTSryHtezbW548hEJOquK/PM01kl/j89c/f
	 ih8g3oNWTWFO1MaLODitg52leiBGTbkxz6aYWXplYU8puqoYtpqPyG7/ywmv6jdkg4
	 AyB4hcxDwgZeGNJgnI9m68RvOZW/AzDoZ8pLjYB1WsSkifuvQnIeNfN/pFZtBdF4K6
	 0PalwENmSLkuvFHYnm6l5DnOL2jZ9sMtoZUArx9XSiQcwfnoLzFHlQYB3YabNlWmEO
	 jrlC7XHARUJRw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 18/33] rust: kbuild: remove "dummy parameter"
 workaround for `bindgen` < 0.71.1
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-19-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-19-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434456.73816.17651402081142880831.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=315; i=tamird@kernel.org;
 h=from:subject:message-id; bh=L8JME5DgePBPrx4n+T2YtWB9P6u86oez5ABp2z3CNBA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tsuPi/M7kgl+fS9lvTjjNurz7ibmbL2VVoZaIdt
 un9n7tMHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6VCgjw4v/PZN5Nk0NjzqeHyr4dklm/dxVmTFP/8cu6j8cxxydxMHI8DJEqva
 J+w4L6+f+33+wndDmXuhZ3uDQ1f5l0UW7+TdO8QIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: 4LCUFVDWFHO37AFO2UU6TZTMQV5LH3HG
X-Message-ID-Hash: 4LCUFVDWFHO37AFO2UU6TZTMQV5LH3HG
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/4LCUFVDWFHO37AFO2UU6TZTMQV5LH3HG/>
Archived-At: 
 <https://lore.freedesktop.org/177508434456.73816.17651402081142880831.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:25 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Until the version bump of `bindgen`, we needed to pass a dummy parameter
> to avoid failing the `--version` call.
> 
> Thus remove it.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
