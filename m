Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C9B0C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 20:05:55 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D07BD10E6E5;
	Tue, 14 Jul 2026 20:05:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="rhRhefO6";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 232BC4716A;
	Tue, 14 Jul 2026 19:50:41 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784058641;
 b=h0vp61oEEPBHVntuI1e5qNQcqENAdmc+ObZ07gQ3QT71uns2pN8U2ETe/ocRshoxF8nLZ
 pkc1JrY6iRTtmBI+1FpBYVv+8iG/hiaoi/o/SpD2d3PfEbOUsm4NRBlxntQeF3RRsvvruaE
 pl640OLkpfkRtYjpivAOpoKGrbDpz39vpfcNLb25RzBSk0j8ijoWCElAdPpOIVHZLxla65P
 B1U/y7x96ET/kaQ8OkFY8gcd7jO7GsJ5CeG9UB0ua/mQew62Ws6gVf47WW2TxBlGGSAmmXK
 P4UJXkKs+7aJ35FoH1bPmMfojqMWyWi6Y+mhMo+gzZq2a7efGyxn7iOOEnWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784058641; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2TZmO5aEOGXmRgWMClTIlhAZCzNX5InAxzEzEi9D4GA=;
 b=ezKt8Su0XYeuPUdwfqKC4B21IcA9GHVfRHE4MF4d1L0yyCbIqJ2X56B/HoTpqk9HV6PES
 paJZU4Z/IQ1KWEl8euIQXXSm3jCkp5Cm4x/layFe1sBJbHs+MwbX8zfwuolvVkMd3PW5H4R
 ptz95uSJesww//SYUePA7N7EJmWncHn0AkSJgiIyPleUC3C4AxZsOpjmP0r0PFB6bla4nz5
 qu36a9Ww/JMv/j80/O1Ixpp4j1DeobtnmuY2eMIw38Cgc7psnWigBEgqQnBGNS2y0lTGf82
 7cBBW9VWYupn4095YCyFd50hWDZ9EOyqIv9mty/BcUtSr0IXbo82smLJ1VpQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id DA62446824
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 19:50:37 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5721610E0C8
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 20:05:51 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-383cb94f742so4360728a91.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 13:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784059551; x=1784664351;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2TZmO5aEOGXmRgWMClTIlhAZCzNX5InAxzEzEi9D4GA=;
        b=rhRhefO6i0t3wzj2b2bbqUQtRbgB627OdEu82PJGCFYEQCo0WG3tKBk9m3jcGlr9/X
         IrpoT9CES46PsfyFNoAINxMyh4o44C2FVr4NWyvvFnG9QTXMWLc7N/Df2epXGIBVuH1S
         Vkc64do2oUdB0EkWUmjXN5mPARO4Pd7NO4kNpVnzrnUy7txa+fMaJIFz7ZQGXSrypL1n
         1H0AnOhHXy8yhPNN1RXp9Y9XiRfmyZ/iQecESHyqL8ALJLYNBOEBluv99JJPS/mOiAfz
         1FrTkMMA6nfKwC5m2k2z6n+cc9/gmKqPG8YIfRlBeHNHyNxNZHi2IrXpq6G/R3OHcWmZ
         T3lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784059551; x=1784664351;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2TZmO5aEOGXmRgWMClTIlhAZCzNX5InAxzEzEi9D4GA=;
        b=HcbtNa06fj68i4B+C7GyHKnjujilx7wc5msakjJRrFxf2rQjjpn+byRSryzbuL7AO4
         ScM7ngWsp+J7o4QTaNT+v9l1qaU6pXqCpCCTRUMxVMflx5LroOdMuoWpVLyDE/6XzETm
         SLmID8R1m+RE9JrAF1lUNtAYFvb/jgfbcEvY9X5C/nCR8wJ2LG3zr7gAE3bRBCoaMxQc
         GXi7Tgnz6UC/fFHjx56BAMnkgXORkCbT1BKHst9lOXAqFt0E3jczQGx4JlMDOiO1pks4
         Vuyy4/7mfV7qaD1rZnMCnYK/uWREEuaVB/FpfIuCfspo4zRUJYxyWLuQ/kWpNKFHa0eE
         4yOw==
X-Forwarded-Encrypted: i=1;
 AHgh+RoAEDryplCtfPQcpiet+YRAFV+SeVgJ/bthE+ZmeZ2OGt4b4JDH7akJQF50rtYos4x1CjQiJUs+@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyJSw+CdCioWTJocvW1t1jnaGjsfXixjA4ovT0BtlWeVt9MYgJR
	IxY6AlK939OHt/81iRrCOXjOTYFZD3dABG2rsOmNzjb4gKk8XFf4PKTa
X-Gm-Gg: AfdE7cld9H9al0gzAQeQ49iTnrTr/CdiAboSELgLGD3OXEJKGLAsqWUkxBDAHxNlvgu
	BLN4CakKFislXq32d5d5qB2F4Ft8f9zNKgrcmwv4GD2AMPilmd21jPW2cTCbTzqOezoR5yA+/IG
	/FN+3qFAEUuAq6+QwW5VD/FvtHbn9GpWFWzlU0Hhnyb99VaB0gshivDunKWy87c5LCDJqWIuEf5
	sazoQb999uvJMWYVoH8eQV5xSvXxjldrqSprnwcpiGyJmde8+0aMLj130hpqMf2KJp0WWH9WkzC
	YlVD3R8FHuKdor71EEa3NZr4eI6jk0T4jlp2XInsUsVY2qHA2egSRbeyGuoqxm8F4Z+A0ko41vw
	IQUXRsysGGsFTncRH2MTIVVPQpQKvXappST1/9d4mxPcwRyJuT73QwTMu/HvScDSXxWMSBi4kxK
	rB/7xNJDe5p7oZ1SIW96KFift0Js/oHe7iWpi1c3HUDgbnXT1UnhFvXHA=
X-Received: by 2002:a17:90b:57e5:b0:37f:be6c:f3f2 with SMTP id
 98e67ed59e1d1-38e29ff93eemr138372a91.2.1784059550783;
        Tue, 14 Jul 2026 13:05:50 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-38e172b6cfbsm2007674a91.3.2026.07.14.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 13:05:50 -0700 (PDT)
Date: Tue, 14 Jul 2026 13:05:45 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alaWmUEeIBeSkmO0@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
 <alG2-RSitzPWClAX@skinsburskii>
 <20260710224950.53bcb43ce7e564f07a1f6a8c@linux-foundation.org>
 <alVRU38lMfvmUFqJ@skinsburskii>
 <20260713154535.7656b3a630e2f6f076b4e76e@linux-foundation.org>
 <alZfTxfypj39OrCE@skinsburskii>
 <20260714105751.f45ec4c70702c222febdbf07@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260714105751.f45ec4c70702c222febdbf07@linux-foundation.org>
Message-ID-Hash: LQLHHMPDBOKFUM5TP5FHEZYRY6D4TXMG
X-Message-ID-Hash: LQLHHMPDBOKFUM5TP5FHEZYRY6D4TXMG
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, corbet@lwn.net, dakr@kernel.org, david@kernel.org,
 decui@microsoft.com, haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org,
 kys@microsoft.com, leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com,
 ljs@kernel.org, longli@microsoft.com, maarten.lankhorst@linux.intel.com,
 mamin506@gmail.com, mhocko@suse.com, mripard@kernel.org,
 nouveau@lists.freedesktop.org, ogabbay@kernel.org, oleg@redhat.com,
 rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LQLHHMPDBOKFUM5TP5FHEZYRY6D4TXMG/>
Archived-At: <https://lore.freedesktop.org/alaWmUEeIBeSkmO0@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 14, 2026 at 10:57:51AM -0700, Andrew Morton wrote:
> On Tue, 14 Jul 2026 09:09:51 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > On Mon, Jul 13, 2026 at 03:45:35PM -0700, Andrew Morton wrote:
> > > On Mon, 13 Jul 2026 13:57:55 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > > 
> > > > > > I rebased this series on top of mm-new right before sending it out.
> > > > > > Should I have used a different branch?
> > > > > 
> > > > > mm-new is good - Sashiko attempts that.  But it's changing rapidly at
> > > > > this point in the development cycle.
> > > > > 
> > > > 
> > > > I’d like to send another revision addressing a few comments and also
> > > > replace the `max/max_t` check with something simpler.
> > > > 
> > > > Which branch should I base it on so that Sashiko can apply it
> > > > successfully?
> > > 
> > > mainline Linus would be safest.
> > > 
> > 
> > Looks like linux-next/master has been updated with the v8 of the series.
> 
> That's because v8 is in mm.git's mm-unstable branch.
> 
> > I have v9 with a few small fixes, but it is too late to send it out already?
> 
> It's called "unstable" for a reason!  Material in mm-unstable is still
> under review, test and the latest stages of development.  Getting
> things finalized for movement into the non-rebasing mm-stable branch,
> then into mainline.
> 
> So altering or replacing patchsets while they're in mm-unstable is
> perfectly OK and expected.
> 
> > If it's not, then what should I base it on?
> 
> Well it's a bit tricky to replace a series when it's in mm-unstable. 
> One can do a git-checkout of the commit which precedes the v8 series. 
> Or base on current Linus mainline, which usually works out.
> 
> Sending little fixup patches against what's presently in mm-unstable
> also works.  I'll queue each one immediately behind the patch which it
> alters then squash them into their parent patch before moving the series
> into mm-stable.
> 
> A third alternative is for me to drop v8 from mm-unstable, then you
> wait until that has propagated onto the servers or into linux-next,
> then base on that.  This approach is OK but I kinda unprefer it because
> there's a bit of latency and it makes it harder for me to prepare my
> "here's how v9 altered mm.git" summaries.
> 
> 
> Which would you prefer?

Well, given that Sashiko didn’t pick up my series based on mm-new, I’d
prefer to send a few follow-up patches in the hope that they will be
reviewed in the context of the original series.

Thanks,
Stanislav
