Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CA16E6816B
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 11:33:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B839310E24A;
	Tue, 17 Feb 2026 11:33:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="lENEajt6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2683F42B98;
	Tue, 17 Feb 2026 11:23:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771327407;
 b=DCh7flBHT9dOlHI7baKgn2KCMevLCGh+zSW+JVe8s/BJjW0WfyeC30jm0s3GmrA2VY5aE
 Zj4Mr+NmS1Wvs+KXo5UC4c7Nuxlh18e1/QsXIOwsVutCJgewjkdcBiNQbyO/G5LXZeSOCHM
 WC7NbwOb4euSPT7jazrkvAL61emzVTCHhZxQSNTS3ISzHdJIVa1ORBPc45kU/k/j9h8UH++
 FK04SVY87QJUsW+2QmlUuIHVphPgukNRfzxcjYMOMfR6/Emh+iyOk6DCUOTw4Ooeqer26vA
 7c7dh05VD4qxJk0nF57ILAsV1Fa58I6Nd3+bo+oT+Bg/ROqgPui4i7uDKGRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771327407; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uoRAXvmYWx2i1bPxXi85jlUQdsQ7xtn+rljs8en2JyU=;
 b=lwgUpFmtjYDxWwK9btetGthOb8UZFsWWstxvwSj1OChV+Wg7p3fb7MwnfcRFQz7LFMieW
 ICtuLuwFIo5mdAL3Bm7N+f2M3NvxX0UtnTBgWl/aRF1pgfy48rvA/fTG+cgZl3aLJH9PPav
 aVNmZIOmkskvGcaTDThtXm/5YDqEe8iQ+FEuqJTRVse1iJEaJywYvDvXvu2dfqLQ+sj0DGa
 iZaVWaNNepGh+erk9FrOVfVK7EWo1SdsOXv+X1Lhdde/9Iqs2Y+HmqofDoxJtPLb9+846HA
 N0KClW0JYlkLZ8Ie0viJA8domD80hPWyP13H2N8rrWOD39nugMe3uMXAhHnw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id F0FD6403B4
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 11:23:24 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE1710E4C1;
	Tue, 17 Feb 2026 11:33:11 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B6BA4403AC;
	Tue, 17 Feb 2026 11:33:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3628C4CEF7;
	Tue, 17 Feb 2026 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771327990;
	bh=uoRAXvmYWx2i1bPxXi85jlUQdsQ7xtn+rljs8en2JyU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To:From;
	b=lENEajt6/0VVqpbW+LbJsYtgvGFKFp+AXEIGtw4mCLACaqZhIKV+K8+wkX1CHkCpl
	 54R0zqB05jQ+KNnrbRngQVUqlMtOYLvJVhVs0c4BocIoV91I8l4FjfPpdUBwc3ZJXt
	 fgygdfyQ/cNIUYhuLMCMB/UNTWMxd1SsKH3DZMU0p5Rox8UtHHUA/eR4NDc3iuSyfU
	 9srcrx6/n+Vmj05+2K2TN1A6cIwRKfz4JnFgYgZUesJKy1nQaqqxWXv5LiRDHOsg4s
	 Zp2ndCm7SIsmzCES/9Cjl67Lr61Bg2FTlYDL6pOyTVQz3yzAJgnVruzldAlgQpnhKv
	 pMYiQhUm5OTKA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:33:06 +0100
Message-Id: <DGH7D7B7GEXG.2QQCBZYWQ4GP8@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v3 8/8] gpu: nova-core: gsp: use available device
 reference
To: "Alexandre Courbot" <acourbot@nvidia.com>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
 <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-8-b4e2d45eafbc@nvidia.com>
Message-ID-Hash: EY45UQTKA4SKIXKRJCPZA536EYEO2LJI
X-Message-ID-Hash: EY45UQTKA4SKIXKRJCPZA536EYEO2LJI
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>, Simona Vetter <simona@ffwll.ch>,
 Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Eliot Courtney <ecourtney@nvidia.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, Gary Guo <gary@garyguo.net>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EY45UQTKA4SKIXKRJCPZA536EYEO2LJI/>
Archived-At: 
 <https://lore.freedesktop.org/DGH7D7B7GEXG.2QQCBZYWQ4GP8@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> We already have a regular reference to the `Device`, so we don't need to
> repeatedly acquire one in this method.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

This conflicts with [1]. I think I will just drop [1] from my queue, since =
for
nova-core specifically using the base Device here may be better, as eventua=
lly
nova-core will work with both a pci::Device and a platform::Device.

(Which also reminds me that at some point we have to treat pci::Bar as gene=
ric
I/O backend.)

I hope we can actually keep as many code paths in common as I imagine.

[1] https://lore.kernel.org/all/20260123175854.176735-7-gary@kernel.org/
