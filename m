Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52100CD343B
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 15:21:06 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2B65110EDE7;
	Wed,  6 May 2026 15:21:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OOni3hEb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E9F6045DF8;
	Wed,  6 May 2026 15:08:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778080105;
 b=RJnyhUOYsqtbVs0Gbiw6KmDLWt8ku1XCCCVq8wXcaaWsg3cThqWuqJYrhaRO+24KlsJ7Z
 TsWHEhKlbuqSfP+vbcu2eWDwRZGGuO6CWujbkQPQD9qbJeEDubj4TXNpw/+gu+lWqfs8BpX
 Ue9+7gqGPgO7KO0A1QtS+rxpkBRxyxSM6bi/J1HS6LLL/tws+e+5WxCfpVpUe5g59DW9R1J
 aVXajzAHCMUYjT0/Y9cQmNRVebZF+Dgl0ImO4d527YW66xmaVxgvJosiRo3C79NY60FDtsM
 QCEsUawig0qNy1Dv2KpafU8IorSOPqukTtk/DhLxITpV3g1QOx8BwYdgPX8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778080105; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vC9lCGNofB5djKiMO+7R6vv73aqB2vm/hF6KylLBlVo=;
 b=Y5EdHs1ezbbkszu7j2arB8xjeJch1wknNPq4P3PJEsR4Zt7SmhIgjrPMP7OnWQdZEDJJl
 R5S8kIH7pSTL55mlbURGw3sjDduZaSYsyLp3HKsbshkC6G8RY5H79rg0wCVOCyBoSGgdseJ
 F2+hVB3yJieHdasKgiozRvoqsvt2ecljOiTjxFewoedejdLMmDCRknr80KKah8nHMOx4RgK
 giWZNt5gQJM4ZN0mdwN0kM6mwcCQLG3RzJFIhRh7C73JF3LwP0CmffcYUZhP76Kg8lUVu/O
 oC2wgjtE1PrQqTHbmXsgQKzRn9QZuvzLylp7PPcV9ihUtbqude3gZITJdDBA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 4160E459AA
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 15:08:23 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 36C5410E1D4;
	Wed,  6 May 2026 15:21:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 71C4960139;
	Wed,  6 May 2026 15:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD9DC2BCB0;
	Wed,  6 May 2026 15:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778080862;
	bh=643xwBVUGXkz/qC0nQ1s7Ydr9zrHrrjhp3ZH25VeBmM=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=OOni3hEbpimcy0hJPFpQv6/ZV5x9OpeWVRi/L7BKSYuhElzhs8D+0n8rhKCpYLNtw
	 BVT62Z53S7yabx96NlkgHwNbi9D1hS7DTzYyikX9SpxdX0kd/4GCas1w/e6rIExW8b
	 JAWDCvkp6zDDSTkK5YtkVXBQUnhqN2mcuu29W2hV9HfEwvgzW9YIqBxz2ZW1rA3VT6
	 Orgm7PFnd9BgnPw4VjxH0doFomwvZUiN8CPVDvTyNEbxCJS74HUS1YBUIDZJkvtdkc
	 I2jwCes3lIvXYW8XZXEbTggTCQXNi7yIBCDo457FmCSol+gY73/aWj8q8Ltoy7S+Of
	 1cgCOykjteiOQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 06 May 2026 17:20:58 +0200
Message-Id: <DIBP25O5HJ09.2SRQU8QS7VUDN@kernel.org>
To: "Cheng-Yang Chou" <yphbchou0911@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova: rename drivers to use kebab-case
 convention
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
 <20260316120820.2117081-2-yphbchou0911@gmail.com>
 <DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org>
In-Reply-To: <DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org>
Message-ID-Hash: P4PPFPZJ53WOGWO2BHXHMJJGCOODSUCY
X-Message-ID-Hash: P4PPFPZJ53WOGWO2BHXHMJJGCOODSUCY
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P4PPFPZJ53WOGWO2BHXHMJJGCOODSUCY/>
Archived-At: 
 <https://lore.freedesktop.org/DIBP25O5HJ09.2SRQU8QS7VUDN@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue Mar 17, 2026 at 5:06 PM CET, Danilo Krummrich wrote:
> Can you please move this into the second patch. Additionally, in the seco=
nd
> patch, please only keep the Kconfig change and use the following in the
> Makefile.
>
> 	obj-$(CONFIG_DRM_NOVA) +=3D nova-drm.o
> 	nova-drm-y :=3D nova.o
>
> I.e. keep the directory and filenames as they are.
>
> We can use the same trick for nova-core, so we get nova-core.ko and nova-=
drm.ko.

Do you plan to follow up on this one?

Thanks,
Danilo
