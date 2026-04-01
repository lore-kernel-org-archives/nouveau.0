Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87381112244
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:18 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A9A9510EF1E;
	Wed,  1 Apr 2026 23:00:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oWdOCY6x";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7C07845499;
	Wed,  1 Apr 2026 22:48:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083735;
 b=K2Csdle4obY3DSddfjIVJlNKRcfuWgi5+6Bda8wKMXB5ekiXPM35t1W8bHl5nFcsFN2vL
 MYv9iLujNJtOAkF0aqyUtU340tD7pfIy6Lxb7ReztYLgKKsA4MX/+lUhLrI+ICoqBYHDhYo
 7LeaVQBCJtaQjUJHmFoME/PgB85GbgUEmzCDcalcSD3buOUEp73sqFUiTJmEAxyeS23HTfO
 QM1I2L2RJA37tXuy2rQXyEbcQ5yR/bc07j6ZlP2k654YdvsCthsMnjcJxxvGLwBkUKoG4Ci
 Y/S8E7pUJFqyKkUyS1Eo2dSJSnuuthVL21g1q4/zAmwIDjGUG4rp62PgNdhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083735; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=JvGjkd7xOwKr9LPSDq39hiyQcJLp2mIOYd00gU2wFro=;
 b=X/mG3pAurD62+LH/lsvDp0DF8hf3oBYd2dnri504K1PT2L/5DVgQrq1vrqTdwAkEiK8sJ
 s1Tg7LR6vaIvbNzbXXygTCFQ047TWdnoKUfVHehbh3mhivJvaDGBYvFNogfsV5tw25kpZum
 I9lJdv4ZAygOv9LMItF+zYxc9E+/knbUMWuAQj32QTY6Cegv2fAqa0E85g/XprioKuEM3DG
 +0UXeE7p038aT6p3lNhRmDm6Ld4SgBV6v9mxszEA0Nf+2LlXX0Jlu1eg7vUbBi/2Z3XzQZ0
 TuunXW5VFs3C7zK6C9i1lo/5ux+FgejsBc+Oj8ILD0jT9ORBFgjodp65WnOA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id D578B45476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C3D5F10EE18;
	Wed,  1 Apr 2026 23:00:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 453B56013C;
	Wed,  1 Apr 2026 23:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F50EC116C6;
	Wed,  1 Apr 2026 23:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084415;
	bh=ia5mGWpgejay0TUoFhZWSGjPJlCIjCy7gnhJSD9JF6Q=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=oWdOCY6xhFFRq21639GOywl5mcK+3l2bcc/AdHZPPYO6CRTwcz96vqxvC+KTvE5ZX
	 krjDtv05WjJwIOmMxt5/X5E3aUbo7NPZLUhECXRbhCX2WuZOC4CBt0EuBdlmaQZs5/
	 gN2+t4Oz31J5PUxyGyzowwR/Vbt4laFgc21dnxb7OIGWE8SY2IDDteRBlv7DvNTZaf
	 ztSAxYpCQItFlyOLdRSjZCA42hg9cS3w6tGLK9fpQFGQL6OHHwcSPNtmKIS1A/IwMB
	 XASAS2QZagyeAGlUdw49EUuloCHZv4iUn5ycn2HLFRAbB6+Z6JTAboFozDAt285/TL
	 qUneNo60Yk0GA==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now
 that it is stable
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-12-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-12-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434445.73816.7873322235592463050.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=691; i=tamird@kernel.org;
 h=from:subject:message-id; bh=ia5mGWpgejay0TUoFhZWSGjPJlCIjCy7gnhJSD9JF6Q=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFzvPuHEjKvFO5+VrNduvOUh+UWvVz6xhvRQbWe3eK
 jmV4RtXx0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKk+0c3wP3DK1NZ9J2X0vh53N4r9cO6ijvPRY2WpSV4Hgy+fyihnTWb47znt+rS
 Ytk06m2W2Pu7xLbnZePUbY3xIs8yBz5mdSutX8wMA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: L76HHPV4MT3IL5QODWVQLXXKADAIMV4N
X-Message-ID-Hash: L76HHPV4MT3IL5QODWVQLXXKADAIMV4N
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L76HHPV4MT3IL5QODWVQLXXKADAIMV4N/>
Archived-At: 
 <https://lore.freedesktop.org/177508434445.73816.7873322235592463050.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:18 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Currently we need to go through raw pointers and then re-create the
> `NonNull` from the result of offsetting the raw pointer.
> 
> Thus, now that we bump the Rust minimum version, simplify using
> `NonNull::add()` and clean the TODO note.

This description is inconsistent with the previous one which had
citations for both the feature (function in this case) and the feature
in which it became stable (available in this case). I don't prefer
either style in particular, just that things are consistent.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
