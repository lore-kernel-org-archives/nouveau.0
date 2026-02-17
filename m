Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E53FE6816B
	for <nouveau@archiver.kernel.org>; Tue, 17 Feb 2026 11:34:08 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 078FD10E248;
	Tue, 17 Feb 2026 11:34:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="NMwv43k3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 66D5D42B98;
	Tue, 17 Feb 2026 11:24:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771327461;
 b=y12l3phB6QxezAzpa0F1Obv2UGHpPxVDFU7mGZ4vHWdudWnicUJ2eHo2oqFSGS4j3DhL0
 JTPFxsfteie8/oMq5Pr2ZBkoVrsl0hh9QP2/QVOWXS/EV+B1bfJEgA1O6WE3lb2BiiSYUOp
 ki+MQiwKREChc/m/aGbsjmosR207iN9z8hpJkx496E3V7ZjQKfN/JypCCpMV+/4ikSMcCq2
 4vSAAHWtsq5PqSGISeBglvdxre2zf9VS4wMVo2AjDKbaQw6OQ9TkABlfIh7bYmYGVXs2OkX
 9X43zdgZ+pXUAJ6s/Ma1MSuxn5pxiiny7LUI/w2g5m3gZq9BjGxO9D3Bk2Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771327461; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=LV3jUL2UP1KL2QagXkM8DQrfPbVTS+RWLcvVnZs54XU=;
 b=zNy/Pi5XSUQZbx9Ev0rwvzQ0fvPwjmymj9K5cBWKIxmTrWF/7sDVnUFa2poEIXR0WtBhm
 PVA5YoEOvPim57jVCNhhC98DYezArhQjKCp+aTFtsmvL3l/FqQjPAj08MrB1c4Ouc9y8Zf+
 RePK7l0TjhBsZV+ooJtot28Fv2oez7cj3iGjW/sUFx7GH6ODtqiMq6mpxE8fleXtBvep5cu
 QfxiDrMmToHNKp3TfMhHFqSP3JJU345CB2iqp+97e7zutg4IoO3r332nkmahNKQoDIipPYv
 B/Nu+YfA1ZM7Oma7zEJqjk1PXQeIvyNdWFsp2eFyjI85SHFalax8u8Qc7I3A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A911F413CF
	for <nouveau@lists.freedesktop.org>; Tue, 17 Feb 2026 11:24:18 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0B3B710E21C;
	Tue, 17 Feb 2026 11:34:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2D42C61338;
	Tue, 17 Feb 2026 11:34:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5638C4CEF7;
	Tue, 17 Feb 2026 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771328043;
	bh=LV3jUL2UP1KL2QagXkM8DQrfPbVTS+RWLcvVnZs54XU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=NMwv43k3/ARhjfdEv+5CuqpT5SjuOqHMOOfr2nDH+cKFv0JJroEQLoMQaTbBQfSvl
	 UdqGTtHdh8/jg0/24VzWirWhYaxTX4Y2UL+oL231uye9mCgq0ClrRZXNMlT1YDN48u
	 +7T6EAX0UkTZhZCMtNVcoGDJ1lVHRW+lgFO9J89iBEiC4NKrU0hQ+zonWqaUgx64fB
	 rqkOTa7swYjXt10isbzgDiKWV2M5/VCe7Pc12P0lS/siSnolsR2sgUoOlSms7u2flC
	 grAokBAFSOA1EUzpif73/NEqjWCcxQssJy8DTAvwCSq/DhURaUPE5h2m8s4qDDaggD
	 vF4xyP/qRrrlw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Feb 2026 12:33:59 +0100
Message-Id: <DGH7DVJRH25E.2C9F743QLF6IA@kernel.org>
Subject: Re: [PATCH v3 0/8] gpu: nova-core: miscellaneous improvements
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
In-Reply-To: <20260217-nova-misc-v3-0-b4e2d45eafbc@nvidia.com>
Message-ID-Hash: EP2UBQMBBQG4XFE7LEP5SWNXJEN2QLLN
X-Message-ID-Hash: EP2UBQMBBQG4XFE7LEP5SWNXJEN2QLLN
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EP2UBQMBBQG4XFE7LEP5SWNXJEN2QLLN/>
Archived-At: 
 <https://lore.freedesktop.org/DGH7DVJRH25E.2C9F743QLF6IA@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Feb 17, 2026 at 3:45 AM CET, Alexandre Courbot wrote:
> A few simple, loosely-related small improvements for nova-core,
> including reporting unprocessed data in GSP messages, removal of
> unnecessary code in GSP and the sequencer, and leveraging the Zeroable
> derive macro and core library's CStr. Probably nothing too
> controversial, so I plan on applying it soon after -rc1 gets released.
>
> This revision is based on master.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

With my comments in patch 7 addressed,

Reviewed-by: Danilo Krummrich <dakr@kernel.org>
