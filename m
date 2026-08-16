Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29082C5B572
	for <nouveau@archiver.kernel.org>; Sun, 16 Aug 2026 13:22:00 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 402E410E2DA;
	Sun, 16 Aug 2026 13:21:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="AIZyTRqN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id E040B4787B;
	Sun, 16 Aug 2026 13:05:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786885531;
 b=JaZHQqYFGUtE7kCImvCCKIB2galxHIo7eH2GPV+jduISZkjHedWqWlx0YHVDlc+8mTS42
 q5nWWmMU76OogKtiwOx+8gsJDvCDbCFr3Lqo1Uva/kyhvK3Bj+5BwVjYv/N3YNwcunj3yoX
 5Bz11IQ8zNt6JnEMMRxXRL8LFjVYlHwuudqgOTWgfLRcGT97ObcmYzsHoAMt433h1blnUv2
 nmmweToRUaMCUOLcWN0kPVIp+cusmLBDF1JG/KEoxGfMop3TCsef1iAd1qiS+j0oKDmiaSx
 LEdblo2MknP7ZmYIzedDs/XnvGQubfWHKAum8GJalK11yFzS3NHhq7mL1pwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786885531; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vwi4ydnsAAyRjtAJ6OmNzoOX8cU0AryA5emhiyqpUtg=;
 b=C48MvwNC5HMVNc56UuVaCMmTd75W70IWTVEz8QtyFzUyBwvMKqBT0ezHlvHMjxWH51m+l
 NGH/ditDB4SOYahZfNGVqs72+iEC62KI3EXUPXB2Ye+ywTGAP9oETszpnc9IMqkhOQ6u6As
 2KFrkElWlEUcraehyhR8es9zLBUWS7syu6oJ/ZCHxWhhDh5Fm9QdShqH4FHnDk/O8ZGB97L
 qY8lr1Bl/Vm8Z/kvBU/FbyQi7CKLUrgjMueFkP18jHFAZG4PQUdErhKpqQyxboxhZjpdKL8
 0+p3gmse3ybyYJ9M+NdIy3NPHg4TZ40PLWa6NypTyJzDwlm17KuGJdBXbLOg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 6D146476DD
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 13:05:29 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8EC5010E2CA
	for <nouveau@lists.freedesktop.org>; Sun, 16 Aug 2026 13:21:55 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-4954c08a7c8so2414015e9.3
        for <nouveau@lists.freedesktop.org>;
 Sun, 16 Aug 2026 06:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786886514; x=1787491314;
 darn=lists.freedesktop.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vwi4ydnsAAyRjtAJ6OmNzoOX8cU0AryA5emhiyqpUtg=;
        b=AIZyTRqN1EIegFJDCwyjym+iLlKB0IRL3o+AtY3BSBXxNx8L+hBcvAk9Exrkr+a/UF
         XCDsgsnNMk/hZHePaK1OSE+HRadx8LsPkPUTpUROIdu9Rqb1i9g53fsrgDpEy2rZyBXy
         qhA/kMEGINkN7ElIxGS0w2Cxfs+c8jKgnfKkhauudxGnXo5YMeslI+zwObSfaq8z95jc
         pWXwH4lqftXOm3srOC7puVQgSdIHAyxQfMFHDaUGup/fajJSDttg6KznWOwLEx5OfK1I
         cdnAXz5V/MiIkGWWRLk/qBOGWuSEmtMd6Tw295bLYVZaaXerE1Mcp2mvzIhR6UBr5hw4
         oC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786886514; x=1787491314;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwi4ydnsAAyRjtAJ6OmNzoOX8cU0AryA5emhiyqpUtg=;
        b=MueOQ3x6ZMn0rTXtZcB5rV1CG5LeavySOM51FK9tvaRyJ+GA20Xea26MyoIakyewNr
         CcMZhVEdFtKriCAp+BO2/0tLqyolc6GXzQ7WmGdgKG8h9IKgXBNL047uTQfiyATAWxJ5
         vNl+8/cgNSDqVgpFzuLfGUgN3xT/IOAJlOvVca2mf/ZGVFhPste6DSTMmXivT9UZrpLK
         wOshEksK2n+SDENfeno4djhZ3sklkFU0qyfALemepg+bHHtFhIZc2xSASexqe7LTIz06
         0awyDj/b2uGQJKO6Wvl3+KfTi/jUXcS35qyfoBbo4pXQrVMjtEKIOozu1+quQL0c3Jvo
         4KnQ==
X-Gm-Message-State: AOJu0YwpkDV7/4n5Qf6IYF6YFxmMDo96wAD29iMmZfDKQ390NxHT+9RN
	ZNxXPHlgTbugNx2QSc7jZOD2aB/y72yjBFbrIszkO7OGhWn+SxGf1JpnYQHI3fr9
X-Gm-Gg: AR+sD10bpud/Pz+/hURqEL4Y6wN8cURRkz3NfbNiEkQNvgV6H4kshJYQBwMSg5uWOAe
	uXmGD/44m1MXuM5ZsVvf1U79T/R2y+NiHVk/ctF6feXtobWfo73cCXHZ924w57/8My5aojYQ9+Y
	lH7za/o7U5OyDP3b8QvSLE+Hbf8e3Vvf3OUe4n0SlWdauXCN97TS7PQk3sBe3ZPWAvH2CCOqtfV
	2BrOXCIvbg6G9a+Jsnk5Sinu/156JnE4hvJRUd7kgOa4B9Opgx2VXGPHZEgTMbRdL42+Z4jIfUr
	wTcatDaZPc9ckD6ZQ9zVhzGuwGSipQ8qVQdEMMCWRvGkaczqQcBW1DBdvhIgsPKsip+t0RXEK8i
	Rj6gVZL7B3gGabHJtXC0ZfTUK83qRVMbZcGbbiI8UHJH/QK9FV+2C1Aq0EMmEV1cw4QfSvGCFuS
	OPg4UWg3IjM84EUS9JrBlopdkuR9wx49HQURzgVB11IOVVUk0BSHh1GLUDtAyVSnSZ7lvQ19Kna
	IKVXBoZcUzVr2WWcc5IpHAHH0DnRXkeOhY5yoj2zw==
X-Received: by 2002:a05:600c:1395:b0:499:77de:78ba with SMTP id
 5b1f17b1804b1-499879826b2mr135612495e9.2.1786886513900;
        Sun, 16 Aug 2026 06:21:53 -0700 (PDT)
Received: from [127.0.0.1] (ip-109-193-028-127.um39.pools.vodafone-ip.de.
 [109.193.28.127])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4815f2b1fb7sm24093936f8f.17.2026.08.16.06.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 06:21:53 -0700 (PDT)
From: Marek Czernohous <mczernohous@gmail.com>
To: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2] drm/nouveau: disable the fence uevent work instead of
 just cancelling it
Date: Sun, 16 Aug 2026 15:21:52 +0200
Message-ID: <178688651234.533102.4891184749713137564@gmail.com>
In-Reply-To: <178688513268.513871.3468844663561639695@gmail.com>
References: <178682366001.3748010.7798811159846779765@gmail.com>
 <178682366002.3748010.12779628082366287968@gmail.com>
 <178688513268.513871.3468844663561639695@gmail.com>
X-Mailer: python-smtplib
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Message-ID-Hash: M3QB7XP7HPQ73VBBM7YOAKYZLPBC3S46
X-Message-ID-Hash: M3QB7XP7HPQ73VBBM7YOAKYZLPBC3S46
X-MailFrom: mczernohous@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/M3QB7XP7HPQ73VBBM7YOAKYZLPBC3S46/>
Archived-At: 
 <https://lore.freedesktop.org/178688651234.533102.4891184749713137564@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

One correction to a trailer in this patch, before anyone picks it up.

The Closes: line points at the cover of the series the bot was reviewing:

  https://lore.kernel.org/nouveau/20260812231330.705425-1-mczernohous@gmail.com/

That URL resolves, but it is the nouveau view of the thread, and the
bot's replies are not in it: that view has five messages and none of
them is the report.  The bot posts to dri-devel only, so /nouveau/
returns 404 for its message-id.  A tag that sends the reader somewhere
the report demonstrably is not seems worse than no tag, so it should be

  Closes: https://lore.kernel.org/all/20260812233022.159301F000E9@smtp.kernel.org/

which is the report itself:

  "[High] Canceling `uevent_work` before destroying `fctx->event` in
   `nouveau_fence_context_del` leaves a window for use-after-free."

That also fits this version of the commit message better than the cover
link did, since the report says use-after-free and so does the patch now.

I can send a v3 with the corrected trailer if you would rather have it
right in the patch than fixed up on apply.  The diff is the same one
word either way, and it did not seem worth a respin without asking.
