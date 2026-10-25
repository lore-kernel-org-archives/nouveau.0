Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B34606A31B
	for <nouveau@archiver.kernel.org>; Sun, 25 Oct 2026 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=egosjMlG
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3596110E877;
	Sun, 25 Oct 2026 10:24:36 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1E32348B94;
	Sun, 25 Oct 2026 10:05:35 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792922734;
 b=DgeD+NtwzXKtkHks1j3VZj+qOU8PoC7Unf4UdQZGtwVSqiP8huP29JPACfPjxJptqEBjr
 /HmmGIzaaJPOaK4h0wYoKpsvhSCrNQrJ2gUDOZq4WgD28Zcs/BrkMM6JNbA8vYWHBuR4xRy
 rMDdvMkf2qejcW2StxV4gBWBBAZFx9smjHn82p4LmPbQP7K9QE8tC8Xoh+UcH3zoP/IwgxF
 CEdWThx3Y2OWGP8Kc75Sa1VtRFPEnniRNFcCpofnwqubiG8K1b9+4uu33fnFLBpalffMHRI
 mKI23AtR7hsLvMjFnrCkkPPu96PaefONovC79eyuDS2z17zVrc+9SnS2EXfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792922734; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HOQH/UzmoIGTnx1h57ThuzE++YZYHn+wnPmoRVPN7rQ=;
 b=eM50U/N4PRs7cyxwUZ1/ddofmmcJ259Y+rCqKvhuSbQ7abFSECatgiaWzCjonuCt+UJnF
 4WjULQZ6G3K0RwNxH8TxoQOyEmKu8k3vpULHu9HUqh0BT10K/Dz+RSrSPBGOqhdSa/LZnQ1
 as70MKh8Sg3wbEof4/HTsSpxsejuvzRNvAGKe5hxWTtG5oGYV5s+TjO436SbNJBpKQ7n2Cc
 L5xwBU1aEjqi+5uS7XWSCwj4YTHaoPoDaTJXAJnf8NMe2LQAPD9nkhWXQwaHXu32HE5DBqJ
 KKCuNjAZhkPNCg1qQo6Xn2devj9s0tz6qUq1pWbnfDMZIA8KLnnq0uhLdTKA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yandex.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yandex.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yandex.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yandex.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A768946EDA
	for <nouveau@lists.freedesktop.org>; Sun, 25 Oct 2026 10:05:32 +0000 (UTC)
Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net
 [51.250.60.161])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E78910E042;
	Sun, 25 Oct 2026 10:24:28 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-63.yp-c.yandex.net
 (mail-nwsmtp-smtp-production-main-63.yp-c.yandex.net)
	by forward101d.mail.yandex.net (postfix) with ESMTPS id EC19EC0031;
	Sun, 25 Oct 2026 13:24:26 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-63 with ESMTPSA id
 GOcbPNXdW8c0-FgVCqyJ5;
	Sun, 25 Oct 2026 13:24:26 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1792923866; bh=HOQH/UzmoIGTnx1h57ThuzE++YZYHn+wnPmoRVPN7rQ=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=egosjMlGlkadXOkgB1h4WlCwWAucMXZNqV/3WX9ti+N9PCuyer4YRlqvF61AiGKcZ
	 bS5rPjOrxftr+UNmi+5M/f/ETvrRJRr8p4buyRuvSyjz978AnWNiR2T+fZqIwlsk0W
	 4gHvG70uf/rRir7t6fUJy9k1wTtMzA7oQf51vWkg=
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] drm/nouveau/therm: mask the update bit when reading back
 the fan PWM duty
Date: Sun, 25 Oct 2026 13:24:13 +0300
Message-ID: <20261025102413.51786-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261025101640.49779-1-xnderv@yandex.com>
References: <20261025101640.49779-1-xnderv@yandex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: DIIVGK3ZK73PPPNK5A3YVRZTG7O3ZNU6
X-Message-ID-Hash: DIIVGK3ZK73PPPNK5A3YVRZTG7O3ZNU6
X-MailFrom: xnderv@yandex.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, xnderv@yandex.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/DIIVGK3ZK73PPPNK5A3YVRZTG7O3ZNU6/>
Archived-At: 
 <https://lore.freedesktop.org/20261025102413.51786-1-xnderv@yandex.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

I forgot to add my sign-off to this patch, sorry about that:

Signed-off-by: Alex <xnderv@yandex.com>
