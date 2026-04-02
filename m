Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61910CC6B3E
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 15:25:38 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B9B110F2B5;
	Thu,  2 Apr 2026 15:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="u2szK5EQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 806DC4551F;
	Thu,  2 Apr 2026 15:14:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775142853;
 b=EFQPZWlqRfw1k44roeCNm0ILV1HZdu3Qkp6xZgF9+4EJHiy0vt0wCr9Nw8S7cMUQaXFNb
 3MrxeJ9zVJ3Z/00Rqy0xW4upYFXxUOTZq0aPpWCLyy3TzDERiKodrrZqX94ioaqL0PDzWkG
 1LC7zFZ2PsRMy7GsvrFhNcLN/XCK8mlmhoKPqH8IXq3uiqFogGYM22ZI3+4hGaGcSZ9yEZ1
 2QEBdYX4qb+6e6lHv5F0+2l3rIG1P3N58ak5dz4dNP7b1JSHJ/EtZ2aSo6BOyBH35Gt2DN6
 sAhVJyTAsmYC1Q7UZmDiCHCQbl/CS81ojq5CSSMmnGIZmjMjKN3YZ0rj1ukw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775142853; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=jgh1WB9ZUgDVoFnOLV7teqzrWzZTxvRUiXixas3pdPA=;
 b=Ms8yZkMj7osZBD+SXwai/Dr5BX7L5HLgYHAbTBNwEROZ5rUk4RhFjcfSi4b2SS812Kdnh
 RMJ5QhDPdd3okHGbULeUGsIx+4f78NQBm+AdwSU6OhtssY1V+it9fOkJcGcM/I+r0UidPt+
 fEE0lWoDk2tfmB63aLDyxviy262g14u40dspXRG0x++cdzuoDldGdd+9jacxxfkw6bNSi8K
 WinXrSrfpUNGqpcuuRy9jkkKDtgX9f0nmCYMrwh6jYnieLX/8xkUOQAYEmZfn2LNF7Z14+L
 3lKKNR/KNZIhuKrU/FbyEQAI7LllL+PioiXu3jDTnoFfGVMM8j7EzD3Pl5Gg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5191B44FE2
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:14:11 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A1C1F10F2BD
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:25:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8AFD8600C4;
	Thu,  2 Apr 2026 15:25:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C79FAC2BCB2;
	Thu,  2 Apr 2026 15:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775143529;
	bh=xhCfedEVrgNyKr1DnCyfjrBfs37cxy3biI06+Ypg+4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To:From;
	b=u2szK5EQABMsAPFYy8mBZDK+tw5TJ9Jb97ejNonPomb60WjK7cm9YdgvJ08GHfFx0
	 WJNFVYVgQzVyu6qQWWw7oquCAMk+uyI9XJxzf9UyKcljCufusNJ2D6Ysv52Gnlbdcg
	 pybdeQgMmvUF9v0hrJxuZmJ4my/jxRk0pjTdSAznVXqpIECdS+2xQZpouklOsMRJHd
	 ZPPhDZAXwJuguR47XdvG6SIs/xpCiuAAfnqoo9hD6Lyl/UuEfI+qJGtvUsBm0y2ucL
	 J9QjNwk97R3rhjDx9wzdDKlxuPXCeAaBoTEiwnQ1fSxGYt2t/Ya2GOeleX5e4Q6qP4
	 Q/lXl/z2d9YFQ==
From: Gary Guo <gary@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/3] rust: sync: add helpers for mb, dma_mb and friends
Date: Thu,  2 Apr 2026 16:24:34 +0100
Message-ID: <20260402152443.1059634-3-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260402152443.1059634-2-gary@kernel.org>
References: <20260402152443.1059634-2-gary@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: 3I2UV54273ACSTZ3ELHIEPS7Q2FCFZOZ
X-Message-ID-Hash: 3I2UV54273ACSTZ3ELHIEPS7Q2FCFZOZ
X-MailFrom: gary@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alan Stern <stern@rowland.harvard.edu>,
 Andrea Parri <parri.andrea@gmail.com>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>,
 David Howells <dhowells@redhat.com>, Jade Alglave <j.alglave@ucl.ac.uk>,
 Luc Maranget <luc.maranget@inria.fr>,
 "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>,
 Daniel Lustig <dlustig@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 lkmm@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
Reply-To: Gary Guo <gary@garyguo.net>
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3I2UV54273ACSTZ3ELHIEPS7Q2FCFZOZ/>
Archived-At: 
 <https://lore.freedesktop.org/20260402152443.1059634-3-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

They supplement the existing smp_mb, smp_rmb and smp_wmb.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/helpers/barrier.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/rust/helpers/barrier.c b/rust/helpers/barrier.c
index fed8853745c8..dbc7a3017c78 100644
--- a/rust/helpers/barrier.c
+++ b/rust/helpers/barrier.c
@@ -2,6 +2,36 @@
 
 #include <asm/barrier.h>
 
+__rust_helper void rust_helper_mb(void)
+{
+	mb();
+}
+
+__rust_helper void rust_helper_rmb(void)
+{
+	rmb();
+}
+
+__rust_helper void rust_helper_wmb(void)
+{
+	wmb();
+}
+
+__rust_helper void rust_helper_dma_mb(void)
+{
+	dma_mb();
+}
+
+__rust_helper void rust_helper_dma_rmb(void)
+{
+	dma_rmb();
+}
+
+__rust_helper void rust_helper_dma_wmb(void)
+{
+	dma_wmb();
+}
+
 __rust_helper void rust_helper_smp_mb(void)
 {
 	smp_mb();
-- 
2.51.2

