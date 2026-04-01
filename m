Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F31A61112240
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:19 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CE61610EF6D;
	Wed,  1 Apr 2026 23:01:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Di5bTnxL";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A843E454AB;
	Wed,  1 Apr 2026 22:49:56 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083796;
 b=WVJsjukoBa5xIon188C0Lz2gbpJVBuPrN4E5OFPbZHUOHzXxy/rQFb8QX7gMpyGbViE4b
 J5aZ7nzBKZeyLacw18cKx+51oJcQclBJ/ocdj/GCWy4rJktpo3WVh8r8N+xS5OqgqrAJeX2
 RZmn/fCChI3bpDBMt/gmZQFc1IONe8TlR6CKOP2b4H4Zyf1qCeLWeaDfjt69iVccQ0O3Cf/
 CEBm4PbMswq8eywsc/uDlW8tONihCV8tnqdphLMAu2OpVhB+Eh8Ei3DSWTYWA/KINsXNV3w
 U/R6A21LP/YIdrI9Tr1mNNGZTEuF+fxEyKSUp2bo6EukFJAaKN9KeDD+LiiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083796; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=+VHuWoyhBweRx7yw2tg1L4IJW6lugGb4ajCOqBvp3W4=;
 b=CFnvltfVUan9L3nXtlEBJyEpxmF4b2TSnZao49gyMqvH2T3hdgKkwgh1suLTXti6VNuVO
 O1mwmtA8rN+DXNSGUYmrn8wEzRLp8o39eAuK0kHtMdM/jwD7u0VA8M6MifA79GtRmBT9CI4
 1qxREAje8tmEJnOQRVk719bbbAfzYScyNTf8xCQGZu0dF08A9OoqTKMkl6Tctgkb2DbqMYq
 N55/8mOZVq2+/EuPdxeemG7FdxJIknoVS7C+X+ZJnwNYOo8YmvkHKfzcuulYT3/Zlalod2o
 thX2cd32gM9dJKmw61fJQy/0AlHGt1dcKCOVGohYtNbfghKGviJKXnsJB5ng==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8926145476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:54 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71C8310EF69;
	Wed,  1 Apr 2026 23:01:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA0CB61339;
	Wed,  1 Apr 2026 23:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7DF2C116C6;
	Wed,  1 Apr 2026 23:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084476;
	bh=/ydyEhz1DfGzumvhdQVG/OS2phIoiIQNTGMzn2SAkqw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=Di5bTnxLkcJhbLRMmhbxvJjKY0SRkVEVWg/GdP1ZUtuebRBulfhXtGIssYtVqr0/J
	 XbYaoQPxt0nen0sXPYp6ql95eED9JB4UKDLcuAXM4toIW+wh/+IgRiDJJ2W0TPTZbx
	 ZRrpoSyzBeVowO7594KsTK3dsPW9L7y36OhRGkOGrPPSxz5OFvKixna8yH6WzDnG2i
	 Fbc2psWZS3oc0Bw7XSvdfVARkvJTB+5A/UqVJyY2TVw9JZDFmfvxqWDatbrKCt/dfB
	 hmVkwcWfF3TI9yCwWruUNtRztqpjPXoknhPCnxmtMeqlZ1s9NBB7OPRWEFjbAO4w7a
	 BrkP/vME8nT6w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 23/33] docs: rust: quick-start: update Ubuntu versioned
 packages
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-24-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-24-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434465.73816.4492182082440539007.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=585; i=tamird@kernel.org;
 h=from:subject:message-id; bh=/ydyEhz1DfGzumvhdQVG/OS2phIoiIQNTGMzn2SAkqw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7s4Hs3X/Mwf1e/3yfei5X/Nlv0LJig4fzB9vHvai
 hk+7LstOyayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz139mMDFcPbV78tEDfR/rr1/KU/WF3PJ6fadDkEzkx9cmvaIFAiasMf7jrLgo
 8C2izvvSmccbjZ+5aTn9Vk0XX1rsL7Xle8aHNlx0A
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: TVH646NETOPBFNLJHA5MAZUOKNK76SST
X-Message-ID-Hash: TVH646NETOPBFNLJHA5MAZUOKNK76SST
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TVH646NETOPBFNLJHA5MAZUOKNK76SST/>
Archived-At: 
 <https://lore.freedesktop.org/177508434465.73816.4492182082440539007.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:30 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> Now that the minimum supported Rust version is bumped, bump the versioned
> Rust packages [1][2][3][4] to that version for Ubuntu in the Quick
> Start guide.
> 
> In addition, add "may" to the `RUST_LIB_SRC` line since it does not look
> like it is needed from a quick test in a Ubuntu 24.04 LTS container.

RUST_LIB_SRC is also mentioned in the nix section, do you know if it is
still needed there?

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
