Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA9FFE9D827
	for <nouveau@archiver.kernel.org>; Sun,  5 Apr 2026 23:58:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C6DEE10E1C9;
	Sun,  5 Apr 2026 23:58:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r5+tm8No";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A66C045605;
	Sun,  5 Apr 2026 23:46:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775432809;
 b=RyGuHsW/zX828Mhm/EMT+ds2SbdwkLrbr+vjO6Bp2E1JSjcEE4edGOUJA87dbsV2/VlSY
 Qe2yjo8pojoUl6HM+K69fQocGILXjuZn+X0zP2U3UEyD2gEkxIDAvcwfMJ9S3PKHg8D0tn2
 j4rvX3tujRVyT6rXCLaP4pDTjExiwZfHboBMtFv5oduMBVTeu7umbZkOS8z/UWvnP2lqzgP
 6zM3Rg1Bnqq8+sgNK98MhJdbNANqsjmnCGdeQta5qS5q1fj2jiq5XLrxUvZOPlokWzg/tHo
 jDP5MODe3WLoqLd1rolIwMvtWgwMdJgFFmrOm5fWsWSxZc4s5Ck+Pg1fLDeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775432809; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Hl192naF7shPZL8SWpzhzc7cBswDd8iIPL3YmntE/Uk=;
 b=bFmPC+E6mRini9cmzEfCHuLC1wZb8imOOkTlWZ3w/3Euir81BXr0MM43FqD3X43F5cAXW
 yAATJJc+rHevY87ZHUSnKJ9vhMyxjC0Rn+nOIeu9jWf+iUXZq/3/IVanR8WkqX9F8WNaK46
 ETh/g4MsZygtxbLlbEKKu8xWTNuJGuOwekvQzyxBql6B/B9oTOVaOJYUMXm7KzN/iRQvZxL
 CMFpaobfcr8nHpbBK4nWuGp5TKQz//RHLIMSV2uk2f+2VB7JE1UUoeSAplwxdBx2MLHqIMX
 2JZKbbGrS94n6Y9bQi/A0v0GQe+VSXURp0RySFKdvPH+HnyEV/JQzpIw/m3A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5C7DE455F6
	for <nouveau@lists.freedesktop.org>; Sun,  5 Apr 2026 23:46:47 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4545910E1BA;
	Sun,  5 Apr 2026 23:58:19 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BC19860103;
	Sun,  5 Apr 2026 23:58:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D037BC116C6;
	Sun,  5 Apr 2026 23:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433498;
	bh=vdRBSbeQ7FZbidrLn6kd8GSzb/7/fj0OaPu4ZFPJhzQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r5+tm8NoxyoxTo2ZDOyvP8kkiJ3xBZ7hpfXauFNAXO3Gb6dCfsnC28848xcVhCO8D
	 4MJxET9Ct/6oio+6ThvDRJjcrh2wzuEU9mUH/esqRrPSTcGpi/3FI9Z++KGpj7YrNK
	 TD+tiMnVi+34Av9UaXTvChMfmmZUPOaoRABGimSG9n08BXDQMruFMCu4J4V3N1kWha
	 agGV3cjkwGCFTajWicKrKACAKflS4H6PECxlavUTdQSjuqxxH/VvGlQW6sJXtflMH9
	 klArCnRE0K3DkjBNNCLmxT9trMWtHo2pKGeYxJU33C6MyAN0X+zwDsaipBEN3i7dtg
	 VKDwPUc8DDbcg==
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
Subject: [PATCH v2 26/33] docs: rust: quick-start: remove Gentoo "testing"
 note
Date: Mon,  6 Apr 2026 01:53:02 +0200
Message-ID: <20260405235309.418950-27-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ZY3CFOPPIZCCV7OOYXO2SYH2OMMI3ZYE
X-Message-ID-Hash: ZY3CFOPPIZCCV7OOYXO2SYH2OMMI3ZYE
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZY3CFOPPIZCCV7OOYXO2SYH2OMMI3ZYE/>
Archived-At: 
 <https://lore.freedesktop.org/20260405235309.418950-27-ojeda@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Gentoo does not need the "testing" note, since its packages are recent
enough even in the stable branch [1][2].

Thus remove it to simplify the documentation.

Link: https://packages.gentoo.org/packages/dev-lang/rust [1]
Link: https://packages.gentoo.org/packages/dev-util/bindgen [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Documentation/rust/quick-start.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/quick-start.rst b/Documentation/rust/quick-start.rst
index db08c3a03a4f..1518367324fe 100644
--- a/Documentation/rust/quick-start.rst
+++ b/Documentation/rust/quick-start.rst
@@ -57,8 +57,8 @@ of the box, e.g.::
 Gentoo Linux
 ************
 
-Gentoo Linux (and especially the testing branch) provides recent Rust releases
-and thus it should generally work out of the box, e.g.::
+Gentoo Linux provides recent Rust releases and thus it should generally work out
+of the box, e.g.::
 
 	USE='rust-src rustfmt clippy' emerge dev-lang/rust dev-util/bindgen
 
-- 
2.53.0

