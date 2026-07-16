Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E60C44512
	for <nouveau@archiver.kernel.org>; Thu, 16 Jul 2026 16:38:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D122D10E73F;
	Thu, 16 Jul 2026 16:38:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Vy/VHk/3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0489A47218;
	Thu, 16 Jul 2026 16:22:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784218965;
 b=sJy7mOsDLnMo8gjcOT0r9DVPYgZgUscfbcptdUQs+h4+wxbhM3rOwTpeGxxNVbHkWeTq3
 UxQNzjYgF+wNtAQpRg6cu8RUHD9T+oh36lnVsqR9o1SAxyW6vi5M9JydfaJetFZ/AIIJh6f
 NBlpvDu3B+xNEI2fSl8YqQmmmO5k+Wtbn6m0Nn3hZK7cJ7USyZ61lEPvGhhoFVPNhm/OWfq
 gmkycV1tAAWEFQKLYUm1JUxWCY+VOekzcNPj7gAN6xn5bVYVRVTZNNdc9spAnqbHtljQY7J
 nJ8Onyvvkg0t9JlIYj0iXZNGUiUjD8aTWLdEFJV+QTvyxtajEZV0zF+UQ5gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784218965; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
 b=hxw+YnURfyuWGApiZFipbBMe/4nWkWvbSn5REVM+Q3+moznBqblM46/nIlHpip1L7phIS
 oa8FP/w2QO6HYHg3Df9GLDnQLvLG1zsPOhUyqwPt90YmvsPFW4HE5bUxjen9PozP0oHMNe6
 PVvWYptdO4nIlS0pY5sXCgdm5fTQ49DElNgNdV7E5eWHUZZblZUeZNk7bpzI//CvL11UseH
 6Sb3J5Gk3KSvSCARiDAbUcUJzUH/yDtfVOMYcES9aQbP537uhZrCgc5Vd4/X4qR7ZgdhWuR
 5bnH7vFRdCscinwfa2UujvHH53C+PViMSJubDp5iMcaB/Ax4Ls9McxIKWLQA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6A39F47205
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 16:22:42 +0000 (UTC)
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
 [209.85.215.170])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 111F610E383
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 16:38:00 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-c9aea40d799so1643841a12.0
        for <nouveau@lists.freedesktop.org>;
 Thu, 16 Jul 2026 09:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219879; x=1784824679;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
        b=Vy/VHk/32K7pr1U8dkogSC9iuItucBDN5JfnNkRVECJEy3FlLjNOPOWnUKz9u2sBv3
         DXRdlBOtxmF4ga0VB9jm4a3ediYrbi3bc5VtiKWJlWULkE8v4hh92BPlNW/Gol11/vRW
         vkg000hWQ+5MlT274arlnw+UfczCwFPXzp0moRfeZXn6dQWYElINCFpk7qglegGc98Ng
         ktP8j/+7O73xSJiZluRSQESsbORm0vaRgly6K4TeDZfnDpZTnVyv0Bkn8m3sWsfXJiOq
         BUKGmI2N9svqaMH6wCtY+bT2J+bKzjZ5oGO4/BeAFfImWaHtw//hhCUhR2uOf1DNa/Mb
         550Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219879; x=1784824679;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rgThJIHDvKsal8KFo6FMAaZQfGc1Wy8tJlIMPT0McxA=;
        b=EaOgtTTvZvQobsqxFgsKb7Em4AxRRxmX/2pNJN7bixCAcsyptcPS8gFQg9wSil6ssJ
         ZweKyiq2XpFqdVoLrY8ubi0yoZwO7ATJKdNlS+n0a/fR9BcQxttTPB/Zu8tqYObn3jz1
         dGs/c7qd7bMxy5QlA/Pu7I3yd6HGYlTTOlM0p1n/LgGypuD5CBA39xZPECTTqvG5pOUA
         8m3t0/a1a2HYnPAXog3T5zwe6C1LNdb6e6ZFzEAxhVbGCmp0pscczP1hDfQtjc5qaxNF
         Nz6KR7uhoIUiP9oly7Y90ziqIKbUN2AB9MnuBI5UgR9Q89r9jqc8z52yKljXABJZbSow
         Fepw==
X-Forwarded-Encrypted: i=1;
 AHgh+RqtGLcba6A2E68mawgBTJyZdXPnM2V0WmL4nFC31PTR/qMmUXE0JqfgzKKPfjBKUaG0WMlVo5Ht@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5quGChuFlJ/qGF4voCX+BcW12CKLE9XRLgnJoTOA0+/c3WMdd
	h2cTieomMkz9YYNXp5Cq/4jb0ecJ5A3m8PhM+9zLke8FiG5/j3bSNyCT
X-Gm-Gg: AfdE7cmXAtTSZXskvSxspJjfN1sUi1XpTB8J7SAAevfYPJMAjghjeFv5ct3imKCAlY+
	hGN4aF1c8bjoxcGYL+RjVzp9Hp/eTftifl8PdzgDuJwzBi42ClRywf4UBiTdoRtdG7rDnyRmlps
	vvVc9zQ/PKbiQZeggGVlzb17MrVzwN4+5vQklqaOf5tUg+yanIIRNaBOW7t+J9XazddNipoLEyy
	w9+5HwbiSE+YRweekhsLY+lBF45rbTX59/e3qjI8NUzE+TmuTAuw1kdjI22LVjGb8NnkwV4fy2B
	LgS6/oD82itpwgaqsO9+pxzVFRfeWL4k158idqxc4LiZQFv/2Q8xVHO3yW3ZH8Qz8KFNSRRHJbR
	zdnQQTz8bOqRaaAAc3BllWOdMAsH1Qp6Djsy03yvpC7So+IOlR/VJrzg9yeRVx67Fr2YFJb5Nv8
	kmK5p/53PZi2ZrzZhyUuUsSTiZrIL5mYOkxrd4ucGqCDK8
X-Received: by 2002:a05:6a21:e081:b0:3c3:7f8f:88cc with SMTP id
 adf61e73a8af0-3c37f8f9302mr5411998637.46.1784219879218;
        Thu, 16 Jul 2026 09:37:59 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-cb258ff4402sm2078703a12.25.2026.07.16.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:37:58 -0700 (PDT)
Date: Thu, 16 Jul 2026 09:37:56 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Subject: Re: [PATCH v2 0/4] mm/hmm: Clarify notifier retry state and scope
 HMM timeouts
Message-ID: <alkI5JLYPW211Ep7@skinsburskii>
References: <178406760622.1106335.2379450382728057793.stgit@skinsburskii>
 <4300f09b-8f93-4605-b072-7c09a82cb16e@kernel.org>
 <alecaJ1FUso39D9k@skinsburskii>
 <alet21wLwM6P_Km2@lucifer>
 <ale3ydkx1xt6ruuP@skinsburskii>
 <20260715101432.99957d2d33203fafe4af2e1c@linux-foundation.org>
 <e9d0ade4-cf87-4e8d-90ec-50ddb5249b24@kernel.org>
 <aligdOKNwoOtD4io@lucifer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aligdOKNwoOtD4io@lucifer>
Message-ID-Hash: NYOCQDL6W36CBZUR5YUUQJENWSVSE65E
X-Message-ID-Hash: NYOCQDL6W36CBZUR5YUUQJENWSVSE65E
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: "David Hildenbrand (Arm)" <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, akhilesh@ee.iitb.ac.in,
 corbet@lwn.net, dakr@kernel.org, jgg@ziepe.ca, kees@kernel.org,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/NYOCQDL6W36CBZUR5YUUQJENWSVSE65E/>
Archived-At: <https://lore.freedesktop.org/alkI5JLYPW211Ep7@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, Jul 16, 2026 at 10:12:56AM +0100, Lorenzo Stoakes (ARM) wrote:
> On Thu, Jul 16, 2026 at 10:59:56AM +0200, David Hildenbrand (Arm) wrote:
> > On 7/15/26 19:14, Andrew Morton wrote:
> > > On Wed, 15 Jul 2026 09:39:37 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > >
> > >>>
> > >>> Please don't do this, this is completely impossible to track for review :)
> > >>>
> > >>> mm review is currently very difficult based on volumes, it'll become impossible
> > >>> to manage if people sound fragments of series.
> > >>>
> > >>> Please just resend the whole thing at this point.
> > >>>
> > >>
> > >> Well, I followed the guidance provided by Andrew, and I believe he
> > >> applied all of the changes, including these, to the `mm` tree.
> > >>
> > >> Do you still want me to send v9 under these circumstances?
> > >
> > > Sure, if that's what reviewers prefer.
> > >
> > > This is a bit unfriendly to people who have already reviewed the code.
> > > Which is one of the reasons why I respond to a new version with a
> > > single diff showing reviewers (and the author, and myself) what changed
> > > since the previous version.
> >
> > As much as I dislike fixup patches, I tolerate them in reply to the existing series.
> >
> > But having some random fixup series is just crazy, really.
> >
> > --
> > Cheers,
> >
> > David
> 
> Yes.
> 
> Stanislav - also see Jason's suggestion - if you give a base commit then sashiko
> seems to work better. Maybe look at using b4 which does all of this for you
> automatically?
> 

Sure. Thank you all for the suggestions. I'll use b4 next time.

Thanks,
Stanislav

> Thanks, Lorenzo
