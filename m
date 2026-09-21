Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8878DC982ED
	for <nouveau@archiver.kernel.org>; Mon, 21 Sep 2026 14:46:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D92FE10E382;
	Mon, 21 Sep 2026 14:46:55 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 793A740249;
	Mon, 21 Sep 2026 14:29:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1790000949;
 b=XEYxAV4cUvn1w+u7X82VA6nriVxGQ++zLKm/FAGXO8s5+D0lg+E7dzAVeJV/d9vn8pfMu
 D4NOKRUEn0juJKI5nXOh+wv1W4bfkYkr3mDzWKlStJoGIUXwyym3qMcl40Y2xcEUlZezREn
 pkI2JDZQvxL0Oa145OoL/nZGchGk7+9RoVODg0RhjUkFcqF9ifZe19CEcHSvctYDbuXGk7R
 2k9DvyfMvZVi7kREU7WmKrcWwWUHpkuTTy9tfUdPRTMG4guHwPRl6j3ChaJYXdXmWYPrN9t
 CDMhyrPATxx4xG+CoGtuRK1BwEJ67kacQstcL5TZ/ctqmZM+KmPWTFk7730g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1790000949; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AcZEkn88gSqiCF09fQw8dPbM3yyFNJcLtoZFL99q4X0=;
 b=pS9xiHEeRL/B78Vyl3uV0Ikb+sshhdXW1YsGW8Dn0STP5a7+4CRucKSOw8LE2F+1yd6oj
 tfLQObBs9g8RglZhgnjqxA9RjfxdrwlQAs58N1x9BkFypgo5/Dh2dEYKG5vAy2VOiBu8NnM
 dNe6XMLHbXNkI6Gd54nJw7TY8uYObZnwwQkEmvzjTfaCLKYKXNgmBQtznRpL/nMT3fei/9z
 9gW6UntUfxzANEfHRft2NZNXiK+S8gP/ajMvxQijrvDgAjfkASSL8XYVXLpnClfWvbWTbfG
 EwNOy2hBVn8uRQYfB+RVwsTQMpUOzwK2YdgHp+iMjcmqWLAoRcF6tGUoy5fw==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=audible.transient.net
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=audible.transient.net
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E6AF7400BE
	for <nouveau@lists.freedesktop.org>; Mon, 21 Sep 2026 07:04:21 +0000 (UTC)
Received: from audible.transient.net (audible.transient.net [24.143.126.66])
	by gabe.freedesktop.org (Postfix) with SMTP id 5E11B10E4BD
	for <nouveau@lists.freedesktop.org>; Mon, 21 Sep 2026 07:22:07 +0000 (UTC)
Received: (qmail 22312 invoked from network); 21 Sep 2026 07:22:05 -0000
Received: from stink-foot.audible.transient.net (192.168.2.99)
  by canarsie.audible.transient.net with QMQP; 21 Sep 2026 07:22:05 -0000
Received: (nullmailer pid 6931 invoked by uid 1000);
	Mon, 21 Sep 2026 07:22:05 -0000
Date: Mon, 21 Sep 2026 07:22:05 +0000
From: Jamie Heilman <jamie@audible.transient.net>
To: dri-devel@lists.freedesktop.org, airlied@gmail.com, dakr@kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, lyude@redhat.com
Subject: Re: trapped reads in 7.3-rc1 since nv50 instmem handling change
Message-ID: <arDbHfeXuHDCKQNS@audible.transient.net>
Mail-Followup-To: dri-devel@lists.freedesktop.org, airlied@gmail.com,
	dakr@kernel.org, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lyude@redhat.com
References: <apnNRjrFPD48m4hO@audible.transient.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <apnNRjrFPD48m4hO@audible.transient.net>
X-MailFrom: jamie@audible.transient.net
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: TKKQSK44WPDXHCRDM6VTFESD6FBPAH6A
X-Message-ID-Hash: TKKQSK44WPDXHCRDM6VTFESD6FBPAH6A
X-Mailman-Approved-At: Mon, 21 Sep 2026 14:29:08 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TKKQSK44WPDXHCRDM6VTFESD6FBPAH6A/>
Archived-At: 
 <https://lore.freedesktop.org/arDbHfeXuHDCKQNS@audible.transient.net/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Jamie Heilman wrote:
> On my workstation with a Quadro NVS 290 running 7.3-rc1 I'm seeing
> this sort of thing show up spuriously:
> 
> kernel: nouveau 0000:01:00.0: fb: trapped read at 0100ef56e0 on channel -1 [0fee0000 unknown] engine 06 [BAR] client 08 [PFIFO_READ] subclient 01 [IN] reason 00000002 [PAGE_NOT_PRESENT]
> kernel: nouveau 0000:01:00.0: fb: trapped read at 0100f85788 on channel -1 [0fee0000 unknown] engine 06 [BAR] client 08 [PFIFO_READ] subclient 01 [IN] reason 00000002 [PAGE_NOT_PRESENT]
> (repeated 16 times)
> 
> I bisected it back to 34e27b90552a (nouveau/instmem: use iomapping
> interface for instmem handling).  The rest of the salient dmesg during
> initialization is:
> 
> kernel: nouveau 0000:01:00.0: NVIDIA G86 (086f00a2)
> kernel: nouveau 0000:01:00.0: bios: version 60.86.6c.00.21
> kernel: nouveau 0000:01:00.0: vgaarb: deactivate vga console
> kernel: Console: switching to colour dummy device 80x25
> kernel: nouveau 0000:01:00.0: bios: M0203T not found
> kernel: nouveau 0000:01:00.0: bios: M0203E not matched!
> kernel: nouveau 0000:01:00.0: fb: 256 MiB DDR2
> kernel: nouveau 0000:01:00.0: drm: VRAM: 256 MiB
> kernel: nouveau 0000:01:00.0: drm: GART: 1048576 MiB
> kernel: nouveau 0000:01:00.0: drm: TMDS table version 2.0
> kernel: nouveau 0000:01:00.0: drm: MM: using CRYPT for buffer copies
> kernel: [drm] Initialized nouveau 1.4.3 for 0000:01:00.0 on minor 0
> kernel: Console: switching to colour frame buffer device 240x75
> kernel: nouveau 0000:01:00.0: [drm] fb0: nouveaudrmfb frame buffer device
> 
> It doesn't always happen at boot, sometimes it takes a while to show
> up as it seems to be related to how much I have going on at any point
> in time.  That commit reverts cleanly for the moment, but I'm happy to
> test any ideas or enable further debugging as needed, assuming this
> wasn't intentional.

This is still present after deced5fa01c5 ("nouveau/instmem: handle
iomapping already existing") and in 7.3-rc4.  Apart from the log spam
(which has made journald angry once by flooding the buffer) it doesn't
seem to have any other serious consequences yet though.

-- 
Jamie Heilman                     http://audible.transient.net/~jamie/
