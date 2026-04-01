Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E6B5D35162
	for <nouveau@archiver.kernel.org>; Wed,  1 Apr 2026 11:51:25 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2EF6310F08E;
	Wed,  1 Apr 2026 11:51:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iITjMsfh";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0355C453A5;
	Wed,  1 Apr 2026 11:40:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775043602;
 b=AIJZe6p0H3A1qNh71/O4QKySUH+qYSzvbuGJdH71og6uPGJV0jo6Qo2PYya6UmfdTbkli
 HtoCzJqx7gd/+EbpiPJPdb0tBoOa6MzOey80LFo5b0D3q3Dq4894q76oDgKJgibZ9Ul9Sm5
 rcr5KYqI8F4JlUki6UkJ9vq3smDaaNCrkIWizPBt5okghpfYws+WpbUlvxPzAsfFPJHG19G
 XOWBRFCB6+4tlLqp3l/0iUWoV4AZ6bVRUTMWbRrXebngjJh0mxmK0GDw/A+oLDXXhztANeL
 LqbzevCCMylte/vPUvKxfz+/n6EOtNGVA+27jLOpXPvL6lFDNbVIv50Lc5Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775043602; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i1rCDLTwpSzKMkgmhG01RsHnD5W+0ketztA3YcW+P+g=;
 b=iBvPHli5Yh62ZInatKSZGAueug9/oV9ZJx+pg/u5Kbc5VleNupI9C9wpR9D9dW6wP6u7Q
 evzCmO80h7NYeoSraf3BGaJmVgRIyVDz1MatdKDqSV5tbcYPado1dcluXN+KJCV8tyok2v6
 OppEz2zZZhBjjdw+Sh/HR6VWY4RoZm64ABvscosaP3bGXbOhxSE5nxSGU5nKNYaDoXj3PT1
 o29uTqZCFgw4ty9nTjE0J96oePbcrvrQmzqZPpliBf/mKDruNTtmpIDBbiuLzZ1l425PS4E
 8IyPrICODZoO12Y84h8NrcxmnrpUUAz188r66AMQbcBL2a9ZJICj/lH82Jgw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B545245374
	for <nouveau@lists.freedesktop.org>; Wed,  1 Apr 2026 11:40:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B5A7A10F077;
	Wed,  1 Apr 2026 11:51:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9A71D404D6;
	Wed,  1 Apr 2026 11:51:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AAF0C116C6;
	Wed,  1 Apr 2026 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044282;
	bh=zBRgkfbt3hF9WvqxM8XN0aG8ALClzrJ4tfRHlURA+/8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iITjMsfhfcTYUWXW6qoQkraYuvMY0slG34Cknkq2VHyvat3oaJRuW0fZ+/koONznL
	 SPdU99XrlrEP5k8CChuk0LAjmH1IitsUhLZv2gSSl2RW0XxgMpM2bkRAYRJAr4LAca
	 lwlWeeG0+4pPPo3E5MWDbDXuJv07Vcm+IFEzC12fdTyQYiMlmOdOIBZyVwEYiVs+T0
	 mvSRJh8CrjRcRnyHxBcF/zH6E1feLSaQUx3OPc8l5NRdZGdjusjdGfUPQF6ij/n0KC
	 eeR+DlUNUhIyF+MboRGXbUUdBuglvWFtU/G4DG9cD0Wrr6a6k9Twbor59rqsvwp1T4
	 2MDeXpey3+CMA==
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
Subject: [PATCH 27/33] docs: rust: quick-start: remove Nix "unstable channel"
 note
Date: Wed,  1 Apr 2026 13:45:34 +0200
Message-ID: <20260401114540.30108-28-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: L27LECJTWFFPNY4ZCVVODTKV77X4JXOT
X-Message-ID-Hash: L27LECJTWFFPNY4ZCVVODTKV77X4JXOT
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/L27LECJTWFFPNY4ZCVVODTKV77X4JXOT/>
Archived-At: 
 <https://lore.freedesktop.org/20260401114540.30108-28-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nix does not need the "unstable channel" note, since its packages are
recent enough even in the stable channel [1][2].

Thus remove it to simplify the documentation.

Link: https://search.nixos.org/packages?channel=25.11&query=rust [1]
Link: https://search.nixos.org/packages?channel=25.11&query=bindgen [2]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index 1518367324fe..5bbe059a8fa3 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -68,8 +68,8 @@ of the box, e.g.::
 Nix
 ***
 
-Nix (unstable channel) provides recent Rust releases and thus it should
-generally work out of the box, e.g.::
+Nix provides recent Rust releases and thus it should generally work out of the
+box, e.g.::
 
 	{ pkgs ? import <nixpkgs> {} }:
 	pkgs.mkShell {
-- 
2.53.0

