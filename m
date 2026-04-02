Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86792D3943A
	for <nouveau@archiver.kernel.org>; Thu,  2 Apr 2026 15:25:28 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F3BB610F2B8;
	Thu,  2 Apr 2026 15:25:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pMxM4Osg";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 373C24551F;
	Thu,  2 Apr 2026 15:14:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1775142843;
 b=gN8cEJ9F6sIkjL9hPDnhfcR1cwOZJkYw0dgkijZ9yu8qYzzQmR+kWuK1zaMT3W/cFPSMV
 /dQw3tyGmu603clfInCXWsfgdhCjy4Xij+SRJ34CRKVDF5sorJ6lx4pQIhumSsdYUInA9w+
 dBFwvQ1bCqNKhnxSHfhPug3hSgGbxmwCwJ/WW6+NH/DCoJ0L1FISCbhMYwVPyk6JDh/DRWt
 RC3btv3zGqwYvoXg2uvhOFHIhAHMH94vYqTkBkWaSeLsKt8qfT0lb4Gx0jx82jPi9JiZfs3
 yedDooMOSi0lpAQhNdqN3DhlYmneH9oRfMMnqXwVZohNgrTQPQh2ozi2hnVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1775142843; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rIdL+UrYZPY9abpG+884Sa1WIfBkoSzguiwcQQKpstc=;
 b=ijW1rK+oXwMG+1PHeYQu68DWu4+/K/Bsnft0vig2mMAF0RJqHf+vPs4qI91xGmttF2XkV
 pDaK9EHBOrruq2vMhEQN8quXaLrg+Ni8dgm5wsBcjlKlfFR6gLFsxquIGwGwHGZ8lrpDvXP
 M/oiDSdgZa4SS518ykAugk99OXhyGGttf6sPfIiKJS0I/mzOHC/3ONOrKKeBWpo0GzVxvKo
 76AMvwsqq7nYuF4kBpwZdz5MiuYW/UmLZ3hOVbM3oILu12J6ite53SBbbQfrtmx5TY2dPLw
 Xc+dtJ3/B0liCFbBDq5p2PxGbp53EYWLVzFwZc4dTTq0I6TiaQUIIz8dcTJw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 184DD44FE2
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:14:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7E56710F2B4
	for <nouveau@lists.freedesktop.org>; Thu,  2 Apr 2026 15:25:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E90243A7D;
	Thu,  2 Apr 2026 15:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865D8C116C6;
	Thu,  2 Apr 2026 15:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775143524;
	bh=Ey4nyNf6TNVqze53+yKNKJ2dlvv9GCYYcOpq0LmDn30=;
	h=From:To:Cc:Subject:Date:Reply-To:From;
	b=pMxM4Osg9urNErpp6dnRx16CgD3UstWyzGLAxr6OjOZn/n1TBKieLAetm4T2l4F61
	 n+5FSZ5ds0bpNvuI+UjQMKZ/sM9PwSa2JgwctbLl/QB2BKEe8wksXFwT/OC+ED4ezU
	 ZG33dkTOuHNAEHxtZNo7mYil7fiXcQIOEo8unTzEITBZI7orftPJDX1j9QSFq4BaBK
	 gzI+cQph9fXQ/QmeAHWw5hiVDoQktmZti4IzN9Y9Ghf2DrQdOmgTHFCTi3s1t/um5j
	 v1nV78hTW3OpumeEWJXwfm1BD453yVank+Lr+9/ucPV4Vf/U5MAdA9RQnSjq77vDpr
	 wq8MrGpf6K8Ww==
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
Subject: [PATCH 0/3] rust: more memory barriers bindings
Date: Thu,  2 Apr 2026 16:24:33 +0100
Message-ID: <20260402152443.1059634-2-gary@kernel.org>
X-Mailer: git-send-email 2.51.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: HAIGMY35EM54JMZGUUQO3EXL7U5YS6MV
X-Message-ID-Hash: HAIGMY35EM54JMZGUUQO3EXL7U5YS6MV
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/HAIGMY35EM54JMZGUUQO3EXL7U5YS6MV/>
Archived-At: 
 <https://lore.freedesktop.org/20260402152443.1059634-2-gary@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

From: Gary Guo <gary@garyguo.net>

This expands the existing smp barriers to also mandatory barriers and
DMA barriers.

The API looks like:
`mb(Ordering)`/`smp_mb(Ordering)`/`dma_mb(Ordering)`, where `Ordering`
is one of `Full`, `Read`, `Write` and also `Acquire`, `Release`.

The `Acquire` and `Release` barriers are mapped to `Full` barriers for
now and they only serve the purpose of documenting what ordering is
needed without codegen optimizations, but they could be improved
later to produce better codegen compared to full barriers. More on them
in the commit message of patch 2.

A user of these introduced API is included in patch 3, which is a
concurrency bug that exists in Nova code today due to missing barriers.

To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Björn Roy Baron <bjorn3_gh@protonmail.com>
Cc: Benno Lossin <lossin@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>
Cc: Trevor Gross <tmgross@umich.edu>
Cc: Alan Stern <stern@rowland.harvard.edu>
Cc: Andrea Parri <parri.andrea@gmail.com>
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Jade Alglave <j.alglave@ucl.ac.uk>
Cc: Luc Maranget <luc.maranget@inria.fr>
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Akira Yokosawa <akiyks@gmail.com>
Cc: Daniel Lustig <dlustig@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Cc: rust-for-linux@vger.kernel.org
Cc: nouveau@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: lkmm@lists.linux.dev

Gary Guo (3):
  rust: sync: add helpers for mb, dma_mb and friends
  rust: sync: generic memory barriers
  gpu: nova-core: fix wrong use of barriers in GSP code

 drivers/gpu/nova-core/gsp/cmdq.rs   |  19 +++
 drivers/gpu/nova-core/gsp/fw.rs     |  12 --
 rust/helpers/barrier.c              |  30 +++++
 rust/kernel/sync/atomic/ordering.rs |   2 +-
 rust/kernel/sync/barrier.rs         | 194 ++++++++++++++++++++++++----
 5 files changed, 217 insertions(+), 40 deletions(-)


base-commit: 36ece9697e89016181e5ae87510e40fb31d86f2b
-- 
2.51.2

