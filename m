Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774F606A334
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 16:54:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=BadVSQLR
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A939D10FEA3;
	Wed, 18 Nov 2026 16:54:22 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 32DF04954A;
	Wed, 18 Nov 2026 16:34:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795019668;
 b=Trj4p/40B7w4z8gQ97nGRWuDUeOUYjfv4KID77eSawPA9k02WQnwAaCsyXgdTkdrNNDCI
 Qw+jhniiW2M5ZIWAYiz1Wa6oeEnfclqV/z8KmDOA/qE8I4bHbctiocsO6Fsden9FyQdHj7G
 KIURdmlOe9P9PLEd0TsK/OOzpxiy1WhOdU0ztvreV0xrbwapE1cYQZxO9BAcN0zIyB/HBpD
 7RlVtPyd3lk5dMdxGLdOvQ74L373dTlSDryOQ9a87vKrBnUiegwIVuCxYTn0MFPLp9bEWOz
 q5IRpXKRMHkj1nKKXC+kUoMXKCWFyS8cvxoZ56y9MEPJDFNla8vjWDwtlzaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795019668; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=yD1/OR6ajdIF7WPOaJ7OQK9lcxiyH/vK4kcEYe1fozU=;
 b=YP+DI8qr/YfEEpBzVEEUkWpSyJb8D59LULA8l8j+hT41eB1Vur2+O88KDNThPSHXs4xfs
 ziE4V+y65yCdED/uDvEoZo02xI9vlFydLx9G4fwS13V/2wCZCAhE9EpQlweyimp4Q2XsPQH
 kZEvRykbIn7EKeMlypoBu5ALcm8Z5VdbYtaQyCqy/mBcIczEYqRaFApsUdy0t1UbqPyZKhb
 u4ZdGHO9RSHtSgmWV9a6k6jRWN9dcfFQ/wKVsARcUdHqbdoVpBk78n4xzTTFlX+4g9thRU2
 2zfa7TfZL0X29f/LC6v+nwRqcxng8nF6HLGvXCIHmPJFdxuLBn1eSGrG8bwg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yandex.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yandex.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yandex.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yandex.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 1F9824668B
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 16:34:25 +0000 (UTC)
Received: from forward102d.mail.yandex.net (forward102d.mail.yandex.net
 [51.250.60.162])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 499BF10FEA7;
	Wed, 18 Nov 2026 16:54:14 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-94
 (mail-nwsmtp-smtp-production-main-94.yp-c.yandex.net)
	by forward102d.mail.yandex.net (postfix) with ESMTPS id C9819C00C6;
	Wed, 18 Nov 2026 19:54:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-94 with ESMTPSA id
 6sdtri0d1Ko0-vPZdlYXj;
	Wed, 18 Nov 2026 19:54:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1795020851; bh=yD1/OR6ajdIF7WPOaJ7OQK9lcxiyH/vK4kcEYe1fozU=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=BadVSQLR+kBn5498Kt1JFpF1P9/hCWn312ACxj1yA1JxmYjRVTBPBOe9cuZqQAuHy
	 yHX048ViUFKo72m+HcxA+EUoyExYlmEyhScZc0Naj5D0ZQEy85Ty85BpJEI/yWIv0s
	 oVrViHJ0AEgbHEpoEbQ5FpENkKkaLvc/6KAAeiBI=
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2] drm/nouveau/therm: mask the update bit when reading
 back the fan PWM duty
Date: Wed, 18 Nov 2026 19:54:02 +0300
Message-ID: <20261118165402.53610-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029130012.21738-1-xnderv@yandex.com>
References: <20261029130012.21738-1-xnderv@yandex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: RLMSDC7TURCXTVDKFBJRA325Z2YYKMD6
X-Message-ID-Hash: RLMSDC7TURCXTVDKFBJRA325Z2YYKMD6
X-MailFrom: xnderv@yandex.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Martin Roukala <martin.roukala@mupuf.org>,
 stable@vger.kernel.org, xnderv@yandex.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RLMSDC7TURCXTVDKFBJRA325Z2YYKMD6/>
Archived-At: 
 <https://lore.freedesktop.org/20261118165402.53610-1-xnderv@yandex.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

Gentle ping on this one. v2 trims the commit message as Martin asked
and carries his Acked-by. It still applies cleanly to current mainline
(checked today, 2026-11-18).

Thanks,
Alex
