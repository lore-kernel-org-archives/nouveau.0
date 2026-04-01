Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE301112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:02:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0A12C10EFF4;
	Wed,  1 Apr 2026 23:02:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="UMSgCFmp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D22C4454C1;
	Wed,  1 Apr 2026 22:50:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083838;
 b=FnxlUVyyYINO4nyA6m3P2yKdXhJEpGFrzRUPi35VZznmUgrF5YUxTU4WmImTmHr/pX0uM
 0KMe9s8KSdnYvf0cpJSmk0e/dncnqV8kp1sPcceaxF0jfi9xju1j86rjT+FbmwPZAASf/38
 eXIoeKMbHZFqQqTWWOzFN0jTaTlcSsDMH1LU0r7yK3Cz+oi8stecwnnixc51GG2dPrWSnJD
 SSxESdHc/7yIc7XAoHyMUSzbrVSbcrLD0dwxNL0pHD8NBrnQxyvdyRmbLod5p9MhVLbZc70
 8asBDeqKuw8mxFfOGqIPtL/tUFEeRSCpAP54USkmRSLyH1nE218cxCK64EhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083838; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/WU9XA7W6KdmSJgeYyHA5uqJnXYc4vI/RM6V8K/tKbk=;
 b=XE3xWxklLm9fsyN293T7+3Ce2sdRZ/jCDWhvxQI6z0DR5u1ASMpO0BUwkJYMp91EySBLs
 TZKeEnMg1Vipn4km2FMtTdyZIWj4opeE+yS4/thM8Ltx/3an8RiUMqBlEWJYNeuLTzIHgva
 ErmMfuhgWp0wAO7ZT1zDTmYJ/c8sVDA1XOgFLT/Lo+QFq21X2WX70fLlbD/HpRRGM5VAnK2
 iehFglvF4Q0ixLWrm9mWnrCsz0Md8IBH6v5f7pWJogAPeKm3NKN8kak8wuSD1h4Q3hs+Wsq
 T4Rvv2HBrBzL20D4AHgUZLcy5UGuuY0vd7QItJr0BmAhj9eACOMFWp9UdKLQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 94D5E454A4
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:50:35 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 86EBA10EFB7;
	Wed,  1 Apr 2026 23:01:58 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0B3B661339;
	Wed,  1 Apr 2026 23:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8523C2BC9E;
	Wed,  1 Apr 2026 23:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084517;
	bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=UMSgCFmpPFESaRAbvbhDhQiCJwvV4rRI29EQmB0081nHG47VaoK9DsZ87N20ilTx/
	 obHtZ+aT5eDe/3CUF+QYMPNqdkzwcsrBaGB1uzVm0pfcDYp1VJCmo1jL/0HIoM5RNj
	 iTgu7PyZZxOsj1m6IjusGOJ8iwfJNFnzHmJfDNcZtTbfSTgPXc+UHvwPqOeAhJLE9x
	 9u7MJDThp4/mCBjG1VZ4wucl6sy1ZHstjCSifT+LAuUqrMCVKULTuDsCABCCXg5Pcu
	 NYCkfoRZxaFdEAWjprgGpGCncCf/8BXJkgVTpuN4aIwNu5Zj1mJbJXZWpJ0DCEQqMU
	 VoIcuuTDapCwA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 32/33] rust: kbuild: support global per-version flags
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-33-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-33-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434474.73816.6769206170563558152.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=622; i=tamird@kernel.org;
 h=from:subject:message-id; bh=U0z1f7WmJb1y4dfJmsmO4rtz8iO1tJNxLkugN/iERrs=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tyXN4UGNjIVv7Oan+7TIj6c2bpm5kOwsVmLFFFf
 8NvnHXomMjCIMbFYCmmyJIoemhveurtPbKZ747DzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 RjoGOsYMXJwCMNVZoYwMb+bI30yW8DzreTVxsqJRzf+lz5/tNI542cmT8HXZjAvVExn+h3398Mm
 ieVJUs0Cb2/LGPIbW10HT78y/fv6PU+iXZ/O/MwIA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: RQYMCB3UJPHBEO34BHZVEF5HVRAALRZV
X-Message-ID-Hash: RQYMCB3UJPHBEO34BHZVEF5HVRAALRZV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RQYMCB3UJPHBEO34BHZVEF5HVRAALRZV/>
Archived-At: 
 <https://lore.freedesktop.org/177508434474.73816.6769206170563558152.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:39 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> [...]
> defined after the `include/config/auto.conf` inclusion (where
> `CONFIG_RUSTC_VERSION` becomes available), and append it to
> `rust_common_flags`, `KBUILD_HOSTRUSTFLAGS` and `KBUILD_RUSTFLAGS`.
> 
> An alternative is moving all those three down, but that would mean
> separating them from the other `KBUILD_*` variables.

My prefernece is avoiding duplication over grouping, but either choice
should be justified by a code comment that acknowledges the
duplication/inconsisntecy.

-- 
Tamir Duberstein <tamird@kernel.org>
