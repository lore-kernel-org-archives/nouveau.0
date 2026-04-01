Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE301112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0466E10EF2C;
	Wed,  1 Apr 2026 23:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rkTpKuHx";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D10644549B;
	Wed,  1 Apr 2026 22:49:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083761;
 b=ygv+d/i5gqkuoDVtForVypwMH7x8dEEBgw5pfF3NQuXKnZZLHwU9IsnqKMgjKmhoEU6eu
 Qgpl5AHQ72kuBpsrlER1VRppFtH+nL/jPOt9zKvFTk4HrO9O1pJ8WrfcemnWInLbZzSJSeN
 96e/UojgD3qiDPbD8WQFgLG4EEem0XAgApXoqhhU9VPRHOljlVAsSYNXvpYmUsZSLN0ewex
 6d8KYaOaY9yfC2EdKdp2CisCNelBEx80OQ2LayOpLrkwgx7InLuKyYaRXLVnZ3ylARIosTi
 KWUth6x3mQQM9u5otKvoUVAOtZ+B8+ipD3nzpYqBmp00dnFaRIgsYfjJPq+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083761; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DmzSTc/sA/5qEuM86BeT0nVTNjD436k7YY4cdofpLeA=;
 b=M1aXSevv+H42yGw7J6/CuJkVvUfkdzPB+nRGcrmYjZmcw/MV1Zz6ruuAded32TQOtN1Ac
 jfKszbV9BeeHXbQYetH+siYo7EGQSU52IpAuqksec15H9r3Dn5zrYn9p+IXJTl3XtGjD/7W
 GzkNmDnl20hd55tk1TzhpLW2d8TXZh92ltS9DuN2jyVJEpMlsaWQJN+2HvPF21MHMW5KfQa
 Wr31CCf3kCiLBGWb8fRId2tilKi/r6aEzEcKG3je6T3Udk0+cvf+47fLJowLcEy8DajW6Or
 adfi38a+EI86CWFeEbcubHur8CwuUsAcNk9LfpwBfhffELywMP9v5ih3ExpQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8E78845476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 80B6210EEA9;
	Wed,  1 Apr 2026 23:00:41 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB37C61340;
	Wed,  1 Apr 2026 23:00:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 913FAC2BCB0;
	Wed,  1 Apr 2026 23:00:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084440;
	bh=f7bNWvbCaip5KR3t+m8FlzJxucJCS9MuU3xmUxzRBQQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=rkTpKuHxraABNs1iEnA7t8UmKYzqxbWf+Jo7sSf786NUHHgtjfod4j1ucj9XE9rl/
	 9L2/jfkoa9sm7RSunu0xi5wD33s9o6R5Jr/xSE0XcCGp8LMiSNCt8VUyEJhByOr8Su
	 Vdfz7Y6rzEWt1SDHoLOQzOR9HviU2Pa5MdI9YtqtfyjbXSu1nFiVfCEpA0yqoWW0wh
	 awJ2CSdVhDvszgoD8DH6+443tm0kOXKY6gyHD7Hqe1RPXs78e3MZDWh6U5iyfGDxW5
	 epEyO1osOP/fc2tlGquwpEvdyUYd8XfAw3QX4Fssplgqh4uOpwBmJEt+O7STb5JnpK
	 pFJtKQuy3rZ5g==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 16/33] rust: rust_is_available: remove warning for <
 0.69.5 && libclang >= 19.1
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-17-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-17-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434453.73816.10916207587615828409.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=376; i=tamird@kernel.org;
 h=from:subject:message-id; bh=f7bNWvbCaip5KR3t+m8FlzJxucJCS9MuU3xmUxzRBQQ=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztr6e84qpsT/++mRlR2t/qbE/usuXPUTVRyhJO7L
 BdHNqp3TGRhEONisBRTZEkUPbQ3PfX2HtnMd8dh5rAygQyRFmlgAAIWBr7cxLxSIx0jPVNtQz1D
 Ix0DHWMGLk4BmGr9ewz/IyM+1b7K7069LKgepa47J1xv3pKIzifnphmXTnun9+l1HSPDGyHpEBf
 OuMe8frM3vXTbcFryepnsjdPfr2669ZRrgtlXZgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: ENN74B2NI57G4UR5QNGGMALTI76JTXL5
X-Message-ID-Hash: ENN74B2NI57G4UR5QNGGMALTI76JTXL5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ENN74B2NI57G4UR5QNGGMALTI76JTXL5/>
Archived-At: 
 <https://lore.freedesktop.org/177508434453.73816.10916207587615828409.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:23 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> It is not possible anymore to fall into the issue that this warning was
> alerting about given the `bindgen` version bump.
> 
> Thus simplify by removing the machinery behind it, including tests.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
