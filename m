Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36FB5FCA191
	for <nouveau@archiver.kernel.org>; Mon,  9 Mar 2026 21:58:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 99DED10E5CD;
	Mon,  9 Mar 2026 21:58:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="fX23DxRI";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 88C1A44FDA;
	Mon,  9 Mar 2026 21:47:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1773092848;
 b=Vc8cqX16h7tEadMRjkiTp6EcLyiDm5k6gyUn/s7ZwiNLbqUjl+Rm2t9C6OigQtpcZ+AHv
 X2u7mZu///bMcV3bOv+3ocuXEUjPgZ+xHy30a8mto8Wr3cXvS2kRlDgd8T7NxhWXYboxAT0
 q8JuEAZbYD+WyPZgLVBEM+c6PrpUqTlt6OyPnqZ5kGWW3O1JKWnqgSN+/FcSTJIc09vKwKK
 3trn4JojBIgI0jhXR0CYIGQTpmds9In3EGTqsLqif4XUrMQtAWFRgzVVLkTDGgKVa2gARq4
 idR1JdM4lcLmi+S9ESG8dxQRIeLOHChnQbmdmCvRx8EAJ8ReRD2C35Cjg2Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1773092848; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v1uYu1OAljm4McknvKwKex9mM9bxbsWylkAY9vyVrsg=;
 b=IMrAzSMDCK7oIuAEIkKA4FILQy9hknnw82q/6J1JEv/IF6oeaFS1SlFMfRouaW2Hrs/vn
 5la1kzA8BN4DM3Gv/wnK5pW6JPMEi1zk79pRCnkfuwSCAPAde94zaRSkt5Gi7NW3TevSGyq
 wtUK+PKAHEzUt5MUYtnTUAZucNhnYCSJp/iHLM6jQ+NUqulcJXg8ZFQUi7pEpcO0LSBjoBj
 fElF+zG2Z1bBWMx0GEp5N353m+KenjA1sgHGd478G1Lrm+SbK+RVDCYF9eq/WB5TUG+fizY
 qPqXLznfs2Sx0Fd02BTPadFIBuEcVa8xNblty8Oi0YraaLvsJRineVHAS+cw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 41C08404AB
	for <nouveau@lists.freedesktop.org>; Mon,  9 Mar 2026 21:47:25 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DEFA310E5C2;
	Mon,  9 Mar 2026 21:57:56 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1077D600C4;
	Mon,  9 Mar 2026 21:57:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F488C4CEF7;
	Mon,  9 Mar 2026 21:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773093475;
	bh=v1uYu1OAljm4McknvKwKex9mM9bxbsWylkAY9vyVrsg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fX23DxRI3fJxKCsB3VjjORkAgsfYq/38Lc+5bPAoZaPpu/X+dep10z1tFgZFn1QC4
	 kqSg50XVNVpIr+c6gzKZXXwAi8j2YvB+u9/Xj9hCxcxqc9oppqQKbAnyWHBLapUaDK
	 1xFZWBl/FcgEJUl5+cyIJbxxV6KsbfrZBuEhLZcSi+x62TXDWrxMdeOVqpxXGZKKYZ
	 FzvEe9/vbxL+YmxwTL9agVS+/HIiuBRcbZrjQQC4/s0hCs0csN7zAeV8j7UGLAzOrQ
	 q7qOuPIguR34COHVvij8ZWVu/lgLVLoanbaa7e9mh5jD+zioOLq6U1QAEhOgOmJJA+
	 1J3wCbwP9yqFw==
Message-ID: <093ca23e-7081-42db-a202-0a42c51741a3@kernel.org>
Date: Mon, 9 Mar 2026 22:57:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/9] gpu: nova-core: generalize `flush_into_kvec` to
 `flush_into_vec`
To: Eliot Courtney <ecourtney@nvidia.com>
References: <20260227-rmcontrol-v1-0-86648e4869f9@nvidia.com>
 <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20260227-rmcontrol-v1-6-86648e4869f9@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: 7HKAYNNMVRQ6CFPBLIBYIEQ2V3QTFFMS
X-Message-ID-Hash: 7HKAYNNMVRQ6CFPBLIBYIEQ2V3QTFFMS
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/7HKAYNNMVRQ6CFPBLIBYIEQ2V3QTFFMS/>
Archived-At: 
 <https://lore.freedesktop.org/093ca23e-7081-42db-a202-0a42c51741a3@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 2/27/2026 1:32 PM, Eliot Courtney wrote:
> Add general `flush_into_vec` function. Add `flush_into_kvvec`
> convenience wrapper alongside the existing `flush_into_kvec` function.
> This is generally useful but immediately used for e.g. holding RM
> control payloads, which can be large (~>=20 KiB).

Why not just always use KVVec? It also seems that the KVec variant is not used?

If there's no reason for having both, I'd also just call this into_vec().
