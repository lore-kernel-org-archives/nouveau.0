Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EB3CD343B
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 16:49:20 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6057510EE39;
	Wed,  6 May 2026 16:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YS5tB5Tk";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0D35345E00;
	Wed,  6 May 2026 16:36:40 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778085399;
 b=ppI999XwGo7INB5vq0hSrXWG2sxRVuY+K8ACHrQQlIYJqzqt4YjLdP88xapFqxPqOycwz
 EUXCFrscvQXxl66A0lnQlT7/V4pb/e1epGpZqO2ABiHoCru8wLBhj3VeS5ivpEahGYVOgpo
 ms+djWWoMvwjfKPxx60LrJg3GFVP5gz4aaPGQdPcJODMdYuzoB4bLKO9IlN3mQyKskDAyMB
 hL8ZHF74e+hzzGEn/tYqnSgIgn+XH9+NjuKVslvJFRjy6gHi9fvU8y8cjroAL1TqWJBtyuB
 rjIfzFSy8eoOiKRVo868wteC8aBMUF04R1FS7FmJdNArzjxbKcu8xniN3IJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778085399; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zqAqFen5VqadetPQBTdp38DxpOmtB/64SzLHXItI+ak=;
 b=KTrrHnDXbxBbcx90f9yD+T7cJ9+szx34w7jkiaewLU+ih3T4R0bq3Y1FHnmb2E30k9doc
 fHVVvuE/Fn9DHafwkdI7e8ncBWMZOASsk80aYRz5jgNFj5IR0bokvbF7jJV+5doyov+Nl+J
 42X0lW/sUD/hNlXviavLZGRddNgkXZRRL+lhQOIBcf3yTFbCHHV8Xc+849dUqLp/GtoanLu
 7lucjS36MuFqZ2CWjkz4xAAgHQN7qXGs8nZuYjUFzY8s+f5tR+6Zi9S1xnuBZtAPBdQbwSI
 9n+6bzlKGl3JtIGhNTrEB+GmlzbmjdAP+G1Ztt5pYPPNgkL0JGe+RnsMLZBQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A598045DFB
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 16:36:37 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CD8DB10EE30;
	Wed,  6 May 2026 16:49:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 92C5142A64;
	Wed,  6 May 2026 16:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE787C2BCC7;
	Wed,  6 May 2026 16:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778086157;
	bh=zqAqFen5VqadetPQBTdp38DxpOmtB/64SzLHXItI+ak=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=YS5tB5Tkh2OeWs0QCCxjecg+tlCPkNt91P+5g6NR3YiN08X5RvdixR+JnYttFHAlw
	 npP5L0ntxJga6GYPC5nQfvl3WyjIwIPJ9oNQgkzFVluyizR9IXtP9gBuAMEiZ03w5a
	 SgzPxajMkszVMSIYtzrBx69l7fTiOKZNLxiOiE8+BOEzWWljrPSBcOZeKlmzrwBpNw
	 flmcafFI9OLYj43lmialq0z/jOjXSyT7soQV3n6yi4f92b5zDyJHC97UmDztzMTYW2
	 urLM15FEikjyLVeNxbyjOzUWVGvE9cDqXB+jMfem8+Q0CKtO8ZxAurjA5Y1ho0cE0I
	 0eMKu19VtWdJg==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 18:49:13 +0200
Message-Id: <DIBQXQ8J3N3H.10YAS0C3O6O2J@kernel.org>
To: "Cheng-Yang Chou" <yphbchou0911@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova: rename drivers to use kebab-case
 convention
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
 <20260316120820.2117081-2-yphbchou0911@gmail.com>
 <DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org>
 <DIBP25O5HJ09.2SRQU8QS7VUDN@kernel.org>
 <20260507004701.G4851@cchengyang.duckdns.org>
In-Reply-To: <20260507004701.G4851@cchengyang.duckdns.org>
Message-ID-Hash: VZTWS4LBZ44OXMHDBFC42S4SG4BNWGYN
X-Message-ID-Hash: VZTWS4LBZ44OXMHDBFC42S4SG4BNWGYN
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VZTWS4LBZ44OXMHDBFC42S4SG4BNWGYN/>
Archived-At: 
 <https://lore.freedesktop.org/DIBQXQ8J3N3H.10YAS0C3O6O2J@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed May 6, 2026 at 6:47 PM CEST, Cheng-Yang Chou wrote:
> Sorry for totally missing this! Will send a v3 patch by this weekend.

No worries -- thanks!
