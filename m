Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C6A1112245
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:01:10 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A33410EF69;
	Wed,  1 Apr 2026 23:01:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nUrzfe8N";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 32537454A4;
	Wed,  1 Apr 2026 22:49:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083787;
 b=tV2aFy7GnPKpXZdQzBIyuTuGTEulN+s6QRe58tVbqkHGb0i9/uEqx27XiIywCKTtMnW00
 0b93puakxyF0bWEJWKomodB3VLOLruYl7Kcz+sEPIuJItIMi1TdqB1HeiMOiCB0ndIpSsQW
 Zn5yGWuA4w6FTNQw1aQQZkqYuAtQ3ka3p4FhEE9b5tt19zBT2tM/tBDwtKTYBuKKDuQgEuD
 Q+Lzw79+2FDh3WssmX7q0w46N4BLP9con15Yg9gc6SMXQeGCJM3+5MsDwQ8a9ySMNZpu7zc
 eXnwMi2E/nvIqGLAcQ3VXlTkZoxCBnnnJpmwW98WBLwdJYL4rtCFkUBcDSVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083787; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=6ICEHfr7jh2gyGpsPbfQ3IyiJ+7yZl3qgU05PRwJ7RE=;
 b=uMdDT3UUV0VtDWRkw5eY8k6582u1USXxYbnOdyrw/9u5Bo3WgQSVUUZ5a7zg5Qkm1DZm5
 FGmS4XBCVnlPGgizsdwuJ+nyHI+6fBBsANIYHHW1L2vwSKtZ5Fpoq/Je55gFBWUN3CLAyim
 0dR8efClQc6bQJ4/PmfB/iQh9+dshsAbbVrJEtFqkKo8YWqSg7WI2xDOfcIeQYAi5p6mUyn
 noy2PTyrWTQ3erqmnQ2K7Xy/Ndus6nFX5t0Rzh7FrSYIQsEWB74XWylILioox9IE9cZS8j9
 IuGDE6/DQ7UUqkYxIqCHy2u4729982DhW5i+VT+XOX4ZzKotT89MU9uZ7neg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3514A45476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:49:44 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 273B810EF5F;
	Wed,  1 Apr 2026 23:01:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9F3C36184C;
	Wed,  1 Apr 2026 23:01:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75B37C2BC9E;
	Wed,  1 Apr 2026 23:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084466;
	bh=LzgaJ83Rv9pU4dQmi5pVMrmBrHvBC5e78go2tjHZcUw=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=nUrzfe8NhDQtpCvFinZVfgnt+tjQMOtFRIGAge4DLGYxrMoQoEQ86XmqX8MSuc5Ud
	 txs3xwHIDwocyZXQNb8jfz80mh53Jd3wusB05jFNLe2fZYgGPLD3nUtGFreumspUTm
	 IAjMDmuiHUSjuwSg00b5B+WSMN62p00RXD9mocBhaqNA3Z+o7B4jWYwGDTUpQeGfbU
	 PfL9deFZ1hdxZ037QHqHZwJAwprww4p/wwBhY1w9e1tRkHHwxiuYOLMQPqidV4AVLZ
	 uqzeLbgTQ+ENe3R61hPcesdN9JHCGklBcMT6RDuu6hjy6GsrjpcDvSx2HJMRbK4sqB
	 EqCJGUn9bUPPg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 21/33] gpu: nova-core: bindings: remove unneeded
 `cfg_attr`
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-22-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-22-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434461.73816.5410904852576871478.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=497; i=tamird@kernel.org;
 h=from:subject:message-id; bh=LzgaJ83Rv9pU4dQmi5pVMrmBrHvBC5e78go2tjHZcUw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnF7tI1RtVf7/3VF2vMEx1i8aDGZv9ug9+b7OYN+Fqj
 7LpjPMnOiayMIhxMViKKbIkih7am556e49s5rvjMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOgY4xAxenAEz10/cM/yP3ruBYcveqWSf7c9aSQN+rd7vL/k1+czI4vmvCx2fH6/IYGQ4vurz
 s3Km+wk3Xq9Kzd2z6cj3qyOaHxU6TS+sf5DBwT2AAAA==
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: RHAAGFHLSLLOVAESAJDYLIAX6JTEDYBN
X-Message-ID-Hash: RHAAGFHLSLLOVAESAJDYLIAX6JTEDYBN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RHAAGFHLSLLOVAESAJDYLIAX6JTEDYBN/>
Archived-At: 
 <https://lore.freedesktop.org/177508434461.73816.5410904852576871478.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:28 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> These were likely copied from the `bindings` and `uapi` crates, but are
> unneeded since there are no `cfg(test)`s in the bindings.
> 
> In addition, the issue that triggered the addition in those crates
> originally is also fixed in `bindgen` (please see the previous commit).
> 
> Thus remove them.
> 
> [...]

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
