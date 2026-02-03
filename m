Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E163CE83054
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 05:24:47 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D15F10E52E;
	Tue,  3 Feb 2026 05:24:46 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 60E6E41B47;
	Tue,  3 Feb 2026 05:15:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770095731;
 b=yOX7q0/kjf58AAjS9YGOSPuf2q7TIowCQkrD/ioJm2k39bN+45F6vSfhHDEYTPNzYCmN9
 lCkvRkR/dp0uYPKaHmCXEFvqLFf2NablG3Wq89U41m0q4HXRA1fThJvtk2usXlPTILBKTDC
 OTvBkEboCmdPm0HVkXU/b0un0fwyO3qiB91SZNKda1mkPAvBaHPyah4uYpeFsMbpnY5CQ1r
 NWQLBalDcFtWJ7MpFgS+NyuElbOfwGcBobm1EHVvZoHUw596RHw7C1Chbe+Wb68cuT3wbzh
 Tt7brNApnWJgKLxJKW1KrNCobwEtarkAg5/tCJCpbJRBMjLihQGaZFq7iGqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770095731; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pOkLoJuO9yVrPIRpY+2Slh6DqFrdgn3ZVaqBS9/BtR0=;
 b=dqvlbW/DEk4HbeidkMe8cR3/ZypMzm8ps1QDWFjae/w8yvaVo2fJPdpyV64Pi/Exc4kMS
 9sXNuu+8E05PUo+mlkFadMdVL96/D6PZg5nzrpVGqiQHo7hdEzvIh/o94fSPzlTPiapR4bl
 bkrAzxSb+wyhhTFVH7tDPJKZsy1K+3Hhr67EmWFvjBqGxb6hUgUSLugdH96+G60P+hiFSZO
 6EFgfOejehmO27CyZsFKU/S92ZxNAqSw28TcJu1F+Pthf5dRkbllhWa18BZ8SL02OLtiEhg
 13hVLjVPg9Pmk+CW7mB0yjEo5nnFoKHUxvm6iwlxLgnkwsEX0kYg1w6e8UnA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 88C8A40B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:15:28 +0000 (UTC)
Received: from us-smtp-delivery-44.mimecast.com
 (us-smtp-delivery-44.mimecast.com [205.139.111.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F0E3410E51F
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 05:24:42 +0000 (UTC)
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-66-62K1K7aYM6OsturRujr02A-1; Tue,
 03 Feb 2026 00:24:39 -0500
X-MC-Unique: 62K1K7aYM6OsturRujr02A-1
X-Mimecast-MFC-AGG-ID: 62K1K7aYM6OsturRujr02A_1770096278
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1A75F19560A3;
	Tue,  3 Feb 2026 05:24:38 +0000 (UTC)
Received: from dreadlord.redhat.com (unknown [10.67.32.75])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id DC3EC1800665;
	Tue,  3 Feb 2026 05:24:35 +0000 (UTC)
From: Dave Airlie <airlied@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: nouveau : fix r570 suspend/resume regression
Date: Tue,  3 Feb 2026 15:21:10 +1000
Message-ID: <20260203052431.2219998-1-airlied@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sqtbUXI-2kBBGKm1wiVg1VnztMVwHMkRxXjaSLokwAg_1770096278
X-Mimecast-Originator: gmail.com
Content-Transfer-Encoding: quoted-printable
content-type: text/plain; charset=WINDOWS-1252; x-default=true
Message-ID-Hash: IYCJMZQGBKFWEYUDD7VUAIGP77GGZDJM
X-Message-ID-Hash: IYCJMZQGBKFWEYUDD7VUAIGP77GGZDJM
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IYCJMZQGBKFWEYUDD7VUAIGP77GGZDJM/>
Archived-At: 
 <https://lore.freedesktop.org/20260203052431.2219998-1-airlied@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Since R570 firmware got enabled, a number of GPUs have not being
successfully suspend/resuming. Lyude showed it on RTX6000, which
I reproduced and wasted a lot of time down various rabbit holes.

There are two required fixes, the first one adds proper sequence
numbers to the rpc messages, which fixes a bunch of NOCAT asserts.

Then we have to pass the runtime vs non-runtime state down to the
GSP fbsr code. This however requires replacing a bool with an enum
which refactors quite a bunch of interfaces unfortunately, but it
was the cleanest way to do it.

The final patch hooks up the interface so normal suspend doesn't
set the GCOFF flags.

Dave.

