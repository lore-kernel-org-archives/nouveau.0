Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E32CDB46D
	for <nouveau@archiver.kernel.org>; Sun, 21 Jun 2026 15:30:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 96C9310E3C5;
	Sun, 21 Jun 2026 15:30:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="h9vcKzhd";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5463A46BEC;
	Sun, 21 Jun 2026 15:15:38 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782054938;
 b=JivrLHNVbWdCm+Jk4MRoUjuO7aDcwuTZQuMjjFQWWvb1E9ilKVGc1Bc2MZN2LrWBDTQ98
 JLcQeR0dAuEHE1iovpp9lradXu4XhHDZEVaVV0Lg517q1ktiVtrU/5yvo17OUOFlN0usuuw
 x6KtOB3Ph5aXoEpSL+R+cNqFFpRJXrhNPOL7o2gsHmm34m0hvjPIzFeGtUY4f+LA9LqvnSh
 twMY1i7jAqQuPNv/j3aw1zGq71LHhaaZbN8fNY4lJim/aDreR7H71E/BZ/WvlEKQfPj5qw4
 Yvz8pXlA1zrw0ALMF2t5NL3G3O6axS417j+LU+W/JPChsHc4b/Z1VWWFOywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782054938; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=0OA99dPOafjtnvEev4FM9wP6RjHQtmTJvuMsHZRF3Tc=;
 b=LssphR3aWd7vY3kLa5Nci+gHZhKXwKxhmniv/J/aKjBKEIpjvEcrkBK9tey4RA2/EHUWt
 7XTrzPQzGkheL1VDvMJPPl5yPUa4JLB6bSsf3xDFCgC7OS3Ku+wgGq4Qc/6HYM8zj3XnYRB
 W/ZtIksi67A6qP1ox2Bhp2kL+Azy+wIJ7dGp2Ql9+tMoZUHAQ0Zz16sKerJEkSEop0lSHSb
 TZ1Ci/GK0bBI0h0yELfDJKiv8dtFS5U6vFYS1Cp4dcXO0oJJ0phoktSzgdbB39MkWVHqmFc
 IEXsEhLnCZRV7u9s9nOog0ss9uIBftYpr30TzzU+JdijXMyobXg+YFkr5ClQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 0FEBC46BD1
	for <nouveau@lists.freedesktop.org>; Sun, 21 Jun 2026 15:15:36 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 17DF210E1DD;
	Sun, 21 Jun 2026 15:29:58 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9408F40506;
	Sun, 21 Jun 2026 15:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C50691F00A3A;
	Sun, 21 Jun 2026 15:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782055797;
	bh=0OA99dPOafjtnvEev4FM9wP6RjHQtmTJvuMsHZRF3Tc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h9vcKzhd5h5xXKTIN+rscZ2S/TT1DLe9qqGZDIVz+LNj4GcDBWS+uB1uvuzp5EVax
	 KbDxcE+Q/7CQx6PQDsid65nnnDwZG/v6JPAHXNV7PnCN9WNa1a2/NZMKjo4mUDlmpE
	 dAeiCKqin8Ks/pXteOC+eHuvUVoywvLmx0QwwIdPI/4QofP3GaSKlP1ONULSeiWT+G
	 cHjgyq4DKLrbDQj8G3uWqf3NTDme4gH+ypTot1jiCgX8ZMNkfQnKfa0SoEA1t/Qvoz
	 X7F/ZZF/+fP7Zts0Khmys+/tRuCuE3Sgq+bGhPYRnb1jVHbrt8MHHnemCpNi4hccbW
	 n3NAnCeV+NBAA==
From: Danilo Krummrich <dakr@kernel.org>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH v3] drm/nouveau: Simplify nouveau_cli_work
Date: Sun, 21 Jun 2026 17:29:48 +0200
Message-ID: <20260621152948.27237-1-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
References: <20260615092607.80917-1-tvrtko.ursulin@igalia.com>
X-Patch-Reply: applied
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Message-ID-Hash: YTRIMMBADMODS6YP3KEAZUFPAVDLMBJG
X-Message-ID-Hash: YTRIMMBADMODS6YP3KEAZUFPAVDLMBJG
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 Philipp Stanner <phasta@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YTRIMMBADMODS6YP3KEAZUFPAVDLMBJG/>
Archived-At: 
 <https://lore.freedesktop.org/20260621152948.27237-1-dakr@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, 15 Jun 2026 10:26:07 +0100, Tvrtko Ursulin wrote:
> [PATCH v3] drm/nouveau: Simplify nouveau_cli_work

Applied, thanks!

  Branch: drm-misc-next
  Tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git

[1/1] drm/nouveau: Simplify nouveau_cli_work
      commit: a80d12eafad1

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is queued up for the upcoming merge window for the next major kernel
release.
