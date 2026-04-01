Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE631112243
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 23:00:23 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08F5D10EF09;
	Wed,  1 Apr 2026 23:00:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="t6cIwTon";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D535145497;
	Wed,  1 Apr 2026 22:48:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775083739;
 b=OGL95z8DTBTkeW//7UQordNjTASaIhUgolWJiiUCpdCEEwxSZo2b+oxyp2RZ1iRjrr+gO
 aShXcKO+2SvPvrVfnOLBcfS0tYrd21/8ScklZmcBjiSP1AQhGg77H+e/6+7640c48lZGtBE
 QHE1oQvFEemACjhEkKxmoONxunPD3lteTZppWJbfZYw4pGpgU14+msH5O/LfPsGH+nyi/ie
 OQsOpOBO/HUCjad2Ds5gUeq61WMJ28tAlvQ+034n+i2H43IqtNbX6BTnbv5MnZp32Kf1yXM
 6zH2QHRad2GTo9YHSEC2p9rRqCAEEVpBjNOKMg58tpjRsHQtL+19GJqG2VzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775083739; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Iv1BPbU3qTs7d3Z0PctBZ3AH7iBcwH+dz1mS7ab2h94=;
 b=s41SPyWbqAa8K+ZqDVINNGWBFPJ56zIyljMjNsPMDmgbYGPhIJXOE+n8NlACGRBWwYeDl
 gWAIBuXR2o9YbzHUisd41PoGPMjAzY19tbdEyFMYUx8Z005YNkbdEbsdAbr79ACTDG3lYi2
 vuDUFX3HWNIr5dxSewIYO6AOgn3qjZVHHh+VXIG/BVb6sLxgvJssDcVGY1H/fs/OCcL1q94
 JxBXiRSfD3NXjAQcB4yZQzWGstwHA6uZwnGO71ae26WnibM2opkM8SsfK5fc2KaT52XLSZM
 jWs/2wZ+1hAjuBVT0Fux1xk72fY+CXRomw46I/qL0PGnNXbHP2+g3uQ/gJtg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 54D6045476
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 22:48:57 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5DB9D10EEC8;
	Wed,  1 Apr 2026 23:00:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36F3344385;
	Wed,  1 Apr 2026 23:00:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E8FAC2BC9E;
	Wed,  1 Apr 2026 23:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775084420;
	bh=mVg6WY7C1fvXHAbLZBkR9DIEo/9TufTw8UKTpB/DRsA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date:From;
	b=t6cIwTonIQqv6/0lOH/xY8JcUQFMyUNQbNR6FUyE+Z76Ku/+2iF8YghHEMBgFfr4N
	 yjr5KSSGH7iI3B8LIOdR7bGwxKBBtfzu8YOJ48mgOUV3t19tvb4iQAfpqvemEbeP2O
	 eegFgVh8eC3mlphv7vkwrZVTUaeR03H3J5OiJvRcJ0TVYfYEObKvRC9Ygx6E1DGx8X
	 wZ4tHeJeOURHotjXZZ2KlD87ya+KWAG74tOthti8DyfXCNoylDP/2q6t/2cth+bRzn
	 1b9ODoXF2Z7nXbZxtZZkzxHxnKZLlJD7CSj6Fk5xBR04GSur2yZyVHuyzA4KOTYV70
	 XZw98YIcLql/w==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 12/33] rust: macros: update `extract_if` MSRV TODO
 comment
From: Tamir Duberstein <tamird@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-13-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
 <20260401114540.30108-13-ojeda@kernel.org>
Date: Wed, 01 Apr 2026 18:59:04 -0400
Message-Id: <177508434448.73816.3909694795109888546.b4-review@b4>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=431; i=tamird@kernel.org;
 h=from:subject:message-id; bh=mVg6WY7C1fvXHAbLZBkR9DIEo/9TufTw8UKTpB/DRsA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDJlnFztvWC+6zePID9NFF5pd8r78FdQ1rL7NGHF122szL
 /WVLLqxHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6WyjD/6glGpZvRXvYxNjUg4vT+1YybT56SeUW57tfxgKHAwLldzP8U5UI2HB
 q0oc/y2r3cH/m9PV2zd55JaGLlbHJ2CPk6H9ZFgA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380
Message-ID-Hash: GW45SGNWG2HZVYBEGNLOBCHQGWEUH64H
X-Message-ID-Hash: GW45SGNWG2HZVYBEGNLOBCHQGWEUH64H
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GW45SGNWG2HZVYBEGNLOBCHQGWEUH64H/>
Archived-At: 
 <https://lore.freedesktop.org/177508434448.73816.3909694795109888546.b4-review@b4/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed, 01 Apr 2026 13:45:19 +0200, Miguel Ojeda <ojeda@kernel.org> wrote:
> `feature(extract_if)` was stabilized in Rust 1.87.0 [1].
> 
> Thus update the comment to reflect that.
> 
> Alternatively, we could use it unstably already.

Perhaps the TODO could mention this alternative. Would probably make a
good first issue.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>

-- 
Tamir Duberstein <tamird@kernel.org>
