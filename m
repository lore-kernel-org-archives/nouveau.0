Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5919E9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:58:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 881AD10E1C6;
	Sun,  5 Apr 2026 23:58:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VokjiENl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 67F6545602;
	Sun,  5 Apr 2026 23:46:39 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432799;
 b=NX9ALOyv7S4I2Kq0cS8rCcXOFwGSghEqj3SEvHukrg667dHkkqegCziRX7g/ReJNwKay1
 1Ac70UQCedbNrfBhbYiC9OI+ghbtPUF3eKQgbXfN/2DznZiBCLUVFQkMTKxrBIm8UsfO2jE
 m9lg4w1Xh4ysNSM1YUK7QSet2qD1oQuSIfgTC8fIUGEpR7Ojh2+djctqUQkHqlDLf3sWWkg
 bzfKBO5b61jWYqav/6zwJhVzYkAbV3AwMbj3z9jCLGV6C9ma/TwO5W+q+IYa/TRGjv6olYA
 sBys/w/o1fdyOk7HYOArIyamdIi6RJvy/g/2eHU41bftlcV2Dgm6WQwPnaxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432799; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XtT0Zjn+4RY/kC7n0tdVHPJnJXHjOxPTPjJQYifacxM=;
 b=yYvFKq692Fd10eOfmDAWyOXXhnh6RHTO5ugSNsFQiy6dwW/MqH4Uh4yS05A4E/WWGIeyT
 gL3K6cuMO6GmxLxAzsv0haH69hNWSsb5IQTOO2DDit0XRwLrZuhF6/TD3nBZcC9ch5igUMa
 kRIEPhsEQAflheHddsvPioTQpw/MlCSDDMnojyFspEPQL4Hr+AB5b/qqmLfBtuDOZZxCOCz
 7q6A3vboonx24HBBc7QhZKf58WOpucjY2A3RFG8x+XoKNv9FY5y7cpemZZjeHGm7SqCTr6u
 P9mBFp4jKnZ0B3xptNZmYlLpCC0RItP8f65qAwOivdWYxeTNNVLR356owUbw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 8FE6C455F6
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:46:36 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7863A10E1B8;
	Sun,  5 Apr 2026 23:58:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9BCC0600AC;
	Sun,  5 Apr 2026 23:58:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE552C116C6;
	Sun,  5 Apr 2026 23:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433487;
	bh=RiSuZnRr3y2scfHkz2vp8jW6HFbs0uY5xnYfEaYRqTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VokjiENlJV9dB0B9luCVu+V0K+MsbFQQpstGpJRrNFerPk1Ze/BXKxl3SWh8TBwdL
	 b1NskFnumMTSOsxKXehxQf33nsxLq4P6veN16SlIoYp5kz2TY/HoaG2Gyaja6UJD/a
	 h40rjYnIRQ+gR/WRT3N4h3eRKgamBaObTYjIVXrntVDFepXdj89Ba8g7+OqvjI04GD
	 Mj+80hAQAN56FwvokNrQqGmdjCGO7VvLf1uCRZHA6sN3IfBxWUYaR3Ukm0yFEwS9o2
	 mx9/s35PCkKtK/KCASkOo04FrZESH2BaTob2YKASakdaY14YgzjEgSaLYzpFSEr2m1
	 zETQJG/hE+uIQ==
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
Subject: [PATCH v2 25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS and
 remove subsection title
Date: Mon,  6 Apr 2026 01:53:01 +0200
Message-ID: <20260405235309.418950-26-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: B2W22ORPJFAVUDQUBZ4SSEB4HITKOMSI
X-Message-ID-Hash: B2W22ORPJFAVUDQUBZ4SSEB4HITKOMSI
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
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 Tamir Duberstein <tamird@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/B2W22ORPJFAVUDQUBZ4SSEB4HITKOMSI/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-26-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Ubuntu 26.04 LTS (Resolute Raccoon) is scheduled to be released in a few
weeks [1], and it has a recent enough Rust toolchain, just like Ubuntu
25.10 has [2][3].

We could update the title and the paragraph, but to simplify and to
make it more consistent with the other distributions' sections, let's
instead just remove that title. It will also reduce the differences
later on to keep it updated. Eventually, when we remove the remaining
subsection for older LTSs, Ubuntu should be a small section like the
other distributions.

Thus remove the title and add the mention of Ubuntu 26.04 LTS.

Link: https://documentation.ubuntu.com/release-notes/26.04/schedule/#resolute-raccoon-schedule [1]
Link: https://packages.ubuntu.com/search?keywords=rustc&searchon=names&exact=1&suite=all&section=all [2]
Link: https://packages.ubuntu.com/search?keywords=bindgen&searchon=names&exact=1&suite=all&section=all [3]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 34c39f208333..db08c3a03a4f 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -90,10 +90,7 @@ they should generally work out of the box, e.g.::
 Ubuntu
 ******
 
-25.10
-~~~~~
-
-The latest Ubuntu releases provide recent Rust releases and thus they should
+Ubuntu 25.10 and 26.04 LTS provide recent Rust releases and thus they should
 generally work out of the box, e.g.::
 
 	apt install rustc rust-src bindgen rustfmt rust-clippy
-- 
2.53.0

