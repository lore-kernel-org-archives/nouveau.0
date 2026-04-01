Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55477D35177
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:50:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3AD4710F07D;
	Wed,  1 Apr 2026 11:50:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="O+Hhh1an";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 16F2745392;
	Wed,  1 Apr 2026 11:39:29 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043568;
 b=DiszsrgvJhEthX7KKKW7xLkm65KOaAZzqxEawKBj4qZqmipxj0qkqVzGYNyt6qPhs60RO
 0YIWSPh7tK2HzsZ3luggMiuqEyTxxazrwVrpuO9G7Ex5cRt0pXhK/WwxmATAkKJ5sEFW9vX
 0rCsa3brj1b9XdFfHjDY2voKy5TROidLW7pgwVa+L7vdy2319tsQQtDSdvdMFbrUFufvpYB
 K1ChXT0ZwgxoAkkHiLvJA4hNtBMSuVhZ0nhLkeXnV15kUrRhiN7iUAnZrsj6oAIYuJMLR4A
 aCOZ9t3KhUzCaDbBSPrV6nhMEFf/EZc1k3vjhQ+YtBvJ2SdxU0ie/FLOwHyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043568; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yl4kaUo5EhUy76Kcecx7vXM9xwtxsuf0q/t4EkT8+jE=;
 b=bLqfQfFDaRxx0Jq2cpVtAopBCDvDUKxltglRbHve4Zz4Q7yPT/64RpaFnxpDh81e6lcfq
 jh83vCXGyPjSg8YhIIjA3sKMjyzfh8NBEN/GhaVWhF41UY76QKUOUQkIC/FT/C/onwqEI3/
 B0um5pYsnbFirIv8M2zYD2yHyno31U32JcBHBXJ2VXsa9XZhvD1rwqpI07OHfbQ0ywgh3gO
 voFGMA0Ip2VulqoOZf8qBnihFChB4qP2GRtFV4FAdZ6LdqWcWYwYNsLFGu5sWEE7T83MtCZ
 6rNjqjyX/A2KWc633opikZnqkSuP/FC/k2TehEt9ra+UCinoXy98vjf1dHzg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 28AAB45374
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:39:26 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 08FF010EDAF;
	Wed,  1 Apr 2026 11:50:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4EB9760180;
	Wed,  1 Apr 2026 11:50:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DB0C4CEF7;
	Wed,  1 Apr 2026 11:50:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044247;
	bh=gdqep/CIy3f2tHlGVIduJ54heItiKNgLxJWrndWddZg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O+Hhh1anJc+19GFocBbrXlmEQQSkj943VY8/0XHji23fuRQZsWqQAH+1TSazaKmiL
	 qIo6GTr7gQXcIVZ17+Mt5jLGu8cpZaFYiedii3pg0W6olOnWbfza9XhlEVRwZ98yx0
	 LcXVWwJgYRdsT/s5pj5faIm2xA8SiH42BTO7/qQTMkiUf3alp8Cdu8qqXXHghDJdG/
	 ZqKeehF27SbWaYSWGlBEsyIr+orFdLth2J7uIk+9AfP92IrtdGMKAQRdG/dhvr8O8B
	 TOGYY/rqEnbd4s7uEUlRNJC+4aYbShoioRKpA/J5CM4OvzM/TxjoPZsAOk1Hqu0iFq
	 UYI5ugbEIjfxg==
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
Subject: [PATCH 24/33] docs: rust: quick-start: update minimum Ubuntu version
Date: Wed,  1 Apr 2026 13:45:31 +0200
Message-ID: <20260401114540.30108-25-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: NCQRELBYLQO3QFTYQ4WZLWZTISOHQKI5
X-Message-ID-Hash: NCQRELBYLQO3QFTYQ4WZLWZTISOHQKI5
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NCQRELBYLQO3QFTYQ4WZLWZTISOHQKI5/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-25-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Ubuntu 25.04 is out of support [1], and Ubuntu 25.10 is the latest
supported one.

Moreover, Ubuntu 25.10 is the first that provides a recent enough Rust
given the minimum bump -- they provide 1.85.1 [2].

Thus update it.

Link: https://ubuntu.com/about/release-cycle [1]
Link: https://packages.ubuntu.com/search?keywords=rustc&searchon=names&exact=1&suite=all&section=all [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 54fe491deb7d..34c39f208333 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -90,7 +90,7 @@ they should generally work out of the box, e.g.::
 Ubuntu
 ******
 
-25.04
+25.10
 ~~~~~
 
 The latest Ubuntu releases provide recent Rust releases and thus they should
-- 
2.53.0

