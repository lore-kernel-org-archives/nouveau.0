Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F45606B58D
	for <nouveau@archiver.kernel.org>; Wed, 18 Nov 2026 16:54:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.com header.i=@yandex.com header.a=rsa-sha256 header.s=mail header.b=IoPwM4/+
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A72B10FEA0;
	Wed, 18 Nov 2026 16:54:08 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CF97F49548;
	Wed, 18 Nov 2026 16:34:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795019653;
 b=uSfIYDHE3Juxp2c+Q08SVGsxqnrWAFEZDzLoFxXVpH65ewzV2FUKkDPobuUb6F8eZxhkH
 FCCgkPhaBMpUmCQKc2n4rWoPVUNu0K9pLoy+35ObqicYnSQYVCrUY9zcQCWdYjOp/Em0ErB
 JPgHRAOVIxAIGoBWOrupkQP2d5xqLi3JrYtvDeOkFngQHrNXLK2puWCZLLK5jDdZILZOEw4
 IUE2io1EBHP28Ye2q2gwhFLOmYHl4ELWcqGXBuok7Ob0sOdrdnIJ0SKnaMVGIlvRvW3ZwER
 mvfd+q2UNazg77PV/RRrA6aot/pd1n9nVeg1WwH90ZVsN0+Dc4c+5Mp9tOgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795019653; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=EOJ8Sv/YlC8vz0y+8TQ4TF7t2l9IIfJq2FXNg6WSXn8=;
 b=pylkB8uE6eBXPkLTy33qEseqW9PEQJIFt23vGggmVcq9NVv52vmBZt3B6Cbmi3afBhvsR
 qOEbDNaqC/DZgUV9yZ/UY5ZMseBLgdqxpkaalzvCJS7h6K6jktqcgW9I0KHrstpe7a/KAKB
 nY/Ykzg9JtJcqjIeR+5zUPqOHS43RKvRA4RS10JMcsT7CgWf3uSJH1BLJsBUZc+CqYBFEBB
 VTucABbIjCp5w8qAgfYcu9bOPfHviPOlGivndXv7FCatFUc3mIAsU7Ti2IsQhWOGBmmhdgw
 YC6VFrlj66gVNP7L6sMOqqj8BvRUTUqzmXitF3pL7IUvA82pjpClXC9xFXvQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=yandex.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=yandex.com
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=yandex.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=yandex.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 31EDD4668B
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 16:34:09 +0000 (UTC)
Received: from forward105d.mail.yandex.net (forward105d.mail.yandex.net
 [51.250.60.165])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 51AD610FE84;
	Wed, 18 Nov 2026 16:53:58 +0000 (UTC)
Received: from mail-nwsmtp-smtp-production-main-66
 (mail-nwsmtp-smtp-production-main-66.yp-c.yandex.net)
	by forward105d.mail.yandex.net (postfix) with ESMTPS id 37EBB100036;
	Wed, 18 Nov 2026 19:53:55 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-66 with ESMTPSA id
 YrdcVw0j54Y0-vlfv0vrV;
	Wed, 18 Nov 2026 19:53:54 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.com; s=mail;
	t=1795020834; bh=EOJ8Sv/YlC8vz0y+8TQ4TF7t2l9IIfJq2FXNg6WSXn8=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=IoPwM4/+G6iuBYnsqs6wPD1Mec6CqC38mgXduK3ckxC8/7q2aZJEurdTHiHuxi43S
	 PpK2fLEqUxSU7yojJa8TJAlERPg8rM5Zt0ywQL9DBGpyB91anpM61xuQURfBl7gi0E
	 bqJV+oqtUGAb4P1MSObTvsB9m3TPvvSRqJVfvJiM=
From: Alex <xnderv@yandex.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2] drm/nouveau: idle the channel before destroying an
 engine object via abi16
Date: Wed, 18 Nov 2026 19:53:28 +0300
Message-ID: <20261118165328.53341-1-xnderv@yandex.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261023152332.9420-2-xnderv@yandex.com>
References: <20261023152332.9420-2-xnderv@yandex.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: ISWRRLPSUGMIXWWZBU4F6HYFEMI7ZRCF
X-Message-ID-Hash: ISWRRLPSUGMIXWWZBU4F6HYFEMI7ZRCF
X-MailFrom: xnderv@yandex.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, xnderv@yandex.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ISWRRLPSUGMIXWWZBU4F6HYFEMI7ZRCF/>
Archived-At: 
 <https://lore.freedesktop.org/20261118165328.53341-1-xnderv@yandex.com/>
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

Gentle ping on this one. v2 addresses the review comment on v1 (wait for
the scheduler job queue to drain before idling the channel). It still
applies cleanly to current mainline (checked today, 2026-11-18).

Is there anything else you would like me to change?

Thanks,
Alex
