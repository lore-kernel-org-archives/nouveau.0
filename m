Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1FFE9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:58:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3003810E1CF;
	Sun,  5 Apr 2026 23:58:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="S0Y52XzG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0FC5E4560B;
	Sun,  5 Apr 2026 23:47:02 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432821;
 b=IJ6zCvwVosAef8n14ptP3fQqkiyt22Mh7MjLQtjeTLfmX57DpX2O/cChXJsdWCl7oIpyJ
 xHyi/4G3l46vR9bu+kyQD85hQ0zc4dZfI0VsDzsHDsHBNgxuSp3CFaqLqoNGNbett64uiOB
 xooRPOZ1HgqpT/LaBw4Mg99OV+YmiQ5GoK0NgklsRBjS9mKYIrw2Hp7IruHEc1NNjC+piGv
 zCZe+fuAAf6v3hfaUrUBxFAfrPycnVRbg3+nKJ5Q3LIwTQfu2I8CehIzqHzmeFqu2re6gLV
 nc6ae1uJUIsj5p9njXUPZ3Qw/sFrUGoeuyzLQ66nb+TPvP5lTdy6plUl2C6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432821; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BccQmJBvH5+jhybUjBUmWBzmuDdaW8JxAJqQEvL1kAY=;
 b=0FTzOME1jCP+1KHEC+Re1Fel6SnMzfsERT0QYgT2qJzIGIfs+mtOx1545XEmjnV0XFaz+
 Lyu2xiV5Vn7pfxzIL3lb7ILEWXo+diWXUOiYtyKBvP2KoXPVKGowMnbYKivdelVC0i2cKB7
 g+6JAYy7IKd7FfZCeWE8Soml2GYfWachTTT/WJnSVShzLZ3ZwMgBmeeWgFib2mzRSjxTn8b
 BfJNPvk8uXCNCLwuAmJWTT1Obfp6CPHe9P8oOKt6uIsSI2j0/l+m5jjcpjUn69NwgL0A5VH
 nMkAnC4FnPCwAQYpXuycW5S3o3qnvfVan5CMzqFV57Kk7zD7Cq9GYSZ/7fVA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B05FC455F6
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:46:58 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 983CE10E1AA;
	Sun,  5 Apr 2026 23:58:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DF559600AC;
	Sun,  5 Apr 2026 23:58:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F14A7C19425;
	Sun,  5 Apr 2026 23:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433509;
	bh=+uAzwzhajFxAA8rib6hw5ihE6F38Ir1uk4Ke8nADAT8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0Y52XzGRmB43RgfGDFkHin7pnQro38Xf89fl+vv/EjSwvic8hMveYt5cYlW3nycO
	 deNzfkR1lB2hbs36DJMWohpvE5Oy0p3rMrKJ1hzNYsP/gFxDbBBrYqRDxxAVr9Klde
	 3WaoLJ6wHtg3BzXSKCQFH0FMysZsko45cPJ05GTdm4/eJVVUxz2U6vcUEdF7Jth0tB
	 8NGfw2aUbMBlX6YEVe7grn/ZP3D3jAqnEl24sS3j6ofBTvE4dTN8/Ng4Ox6Tmk8ku5
	 WD8F1YUimCMA/13jnyecrGpIyYsoFKhMKg0YCGt/aA5dxGUmbZDigYCj1+BOErfqzu
	 cHrUifwInMzJQ==
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
Subject: [PATCH v2 27/33] docs: rust: quick-start: remove Nix "unstable
 channel" note
Date: Mon,  6 Apr 2026 01:53:03 +0200
Message-ID: <20260405235309.418950-28-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: W4NFMX2DDBTL4G7SXYM3WCTOQZK5HZ2E
X-Message-ID-Hash: W4NFMX2DDBTL4G7SXYM3WCTOQZK5HZ2E
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W4NFMX2DDBTL4G7SXYM3WCTOQZK5HZ2E/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-28-ojeda@kernel.org/>
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
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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

