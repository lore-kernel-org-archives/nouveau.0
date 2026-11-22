Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6B9606A32A
	for <nouveau@archiver.kernel.org>; Sun, 22 Nov 2026 03:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SOY466Jp
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 53C1B10E312;
	Sun, 22 Nov 2026 03:39:32 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 360A14024C;
	Sun, 22 Nov 2026 03:39:27 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795318766;
 b=tw2kdW8Pz/CHuI34RW7cbiEtJjOBoNnnOGM42KPiL036gZM+qC4tD52VSEhajdihB4NtI
 fhzrwqreXdEzWRtiw5D3H3Bk+eMTPxEwgP+A2GBOgysRU16lTXhSow9fs90n/YYrQWoeCuK
 26VsfzPL+SrtIMVbSS/CCt0J6uV5qaNYagP7dhbvLOuhbfJHqKllLkYc7eqa79TtwTpBmK6
 vSup1lLFwlzFYLGEEidZA7yocZ2b7dxgWnXVrtsUwzNJLLa6Al4zMlBqogIrO8PseRPfeAg
 /vPk2zbqiKwY1cJJdqvtC5YhjJmbKHbqlAPqotLvG+AgSP0V9XmZlIFkwIQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795318766; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=xlAJSufIrvZMDmdcW1mgZFjpdvM8gZZPEKiNTVsVOW4=;
 b=zW+zL/NaVePUbOY5PRztv7sgjr7BDq9VK+WNAKh55ClzYW0f20d18c2xvSSwXaboBGSK8
 fgJlCs1wAratvy082Nutk6f5nz5PcF7wYcqnK1nuBGSRTgxm4U4pWVC9DV1ClNA6iKqPcQZ
 DHMKvlmXUWdZ5Jv4fj2TgwfQ5b0wqYZkr2KULDIgSL+qFOqXQrdf/Mi4s9pVdATNT7g7cgd
 QQv+UBI2I6SLfbyfGhw3QzF34DSxDLZdBQplc5Zx6xXvdoni3BJ+lolj3dsbBA45oE5JFpa
 e7B7IMhMCScMM5KkAJSoLwtdOy32BFge2/+PdFn5twovVYb9cTJMOPabv/Bw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
 arc=none;
 dmarc=pass header.from=kernel.org policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A056140042
	for <nouveau@lists.freedesktop.org>; Sun, 22 Nov 2026 03:39:23 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 851D410E02B;
	Sun, 22 Nov 2026 03:39:18 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 014B44582E;
	Sun, 22 Nov 2026 03:39:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97121F000C4;
	Sun, 22 Nov 2026 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795318757;
	bh=xlAJSufIrvZMDmdcW1mgZFjpdvM8gZZPEKiNTVsVOW4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SOY466JpByqSZ89hsW8FmPLFpjmHLkPxuVAUy5POd6JQsrO8xFs6fQ/ch5lUR62d2
	 UwtOJfNtaxqGWlijs353MytdXjXF4rJrXCZnW79pCSjHCaWQUOPj3YaAUv4ys6qR65
	 ysPHWXvI/jcrT9diQsgyehZvf4OrRYPXt36jeSq4dnn7Meie+1UWBFPY+cMTvDLTaU
	 JpfnR6rsuSAwsPH4Uthto0c3ewtx4tKcC8J79dFDC0qi+XPGCRniBR0NeZ9D7gUdxd
	 eobjj6yxNkl5dBApqCH+6zHeHabqGMCgNMKhk7aZWKuMWyJIXIwgJDUgUwP5yV/KVn
	 eAdyDGSVLnXyw==
From: Sasha Levin <sashal@kernel.org>
To: nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	regressions@lists.linux.dev
Subject: Re: [REGRESSION] nouveau: GM108 hangs at boot since
 "drm/nouveau/devinit/gf100-: try to avoid double-running vbios scripts"
 (6.18.64)
Date: Sat, 21 Nov 2026 22:38:45 -0500
Message-ID: <2026-11-21-2-daily-reply-0002@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261121101350.bab69dff11a2@gmail.com>
References: <20261121101350.bab69dff11a2@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: U2WCLFLVZ22QYSXVDXHE5XMHDSLJENCA
X-Message-ID-Hash: U2WCLFLVZ22QYSXVDXHE5XMHDSLJENCA
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Sasha Levin <sashal@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Dave Airlie <airlied@redhat.com>, stable@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "R. V. Lobato" <vieira.lobato@gmail.com>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/U2WCLFLVZ22QYSXVDXHE5XMHDSLJENCA/>
Archived-At: 
 <https://lore.freedesktop.org/2026-11-21-2-daily-reply-0002@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> The 6.18.64 backport 15465d681517 ("drm/nouveau/devinit/gf100-: try
> to avoid double-running vbios scripts", upstream 2139cb633d48, review
> patch 426/686 <20261113153835.372076643@linuxfoundation.org>) breaks
> nouveau on my GM108 laptop GPU. The machine hangs during boot.

[...]

> The guard expects nvkm_devinit_disable() to return a mask of disabled
> engines. In 6.18.64 it calls the void ->disable() hook, which disables
> subdevs with nvkm_subdev_disable(), and then always returns 0. So the
> guard is always true, also on boards without a display engine.

Thanks for the analysis, that matches what I see: nvkm_devinit_disable()
has returned 0 since da2b1a0a40d8 ("drm/nouveau/devinit: Convert function
disable() to be void").

I've reverted it for the next 7.3, 6.18 and 6.12 releases and dropped it
from the 6.6, 6.1, 5.15 and 5.10 queues. Mainline has the same bug and
still needs a fix.

-- 
Thanks,
Sasha
