Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E14FC43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 18:07:31 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9010EF62;
	Fri, 10 Jul 2026 18:07:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gXrVxN4+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DBAF4704B;
	Fri, 10 Jul 2026 17:52:26 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783705946;
 b=ZHUM/kjPYAiCvw+lXjYLYmKNugdW9eZay1QdSwwxPBwaZCM0ykK1vBjlfeSzTjHkFiX5w
 m5Fk1+pAk/XQYr8YNGxP9UoDAN8457XXFJbtceat6K77Ql899sgZdcnZDBxq4np9+kGZNZ8
 IrB7mdAFFjd+xHBjyDoHpdX8egeQo075hZZDSHiAa3OYtmk31Vm1XISQEyAezbjMKT10+Rp
 U+Hd0qs82aysJMC+b1+3INT4X3XuUWARJYuL1Q6ANKcqJeIklWJscSflWU9vjPSadkYNaq2
 fTR43b+cWWFvn8hqZaizYjLVMfeVxmNv6DCt/U9dqdk9JHrcocQ95mI7Y0bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783705946; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vK1yycrFvPnOHneU0oNi6DrjeWKqgXkTtqXMvxDGhZQ=;
 b=JaZWXh5Bh9nkEtXgbBbQovZrduaFZVViovO9vIu+MX9fiGPkxD+os7QQNjWCXij+oGCzI
 O193YgLjU/qG/LpqoSCMaXlrNA8ESvG/DzY9CG00ALgct/F1n465hhaVrGuRKj+dpXdMEBz
 635KIBq9cyueZx3kA8Q7oTcazqYvfB8fk/Bsi8VVBfyf6KKcRhLnDsDWNF27fRX8tOOMa/Z
 PIHhwERuntoqFbVtRn0vLqH6WaZR2KiI/rh/NJOn1L9Jcd4imcyrn5InvwbOcwL8OPJHIva
 LHXIBzjd5ZlJTW+xS9ZcAwWkOdk/1XGvzdvq4E1hvKw94sBBDaCTx97sEXGA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 3B5FE4022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 17:52:23 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B625E10E219
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 18:07:27 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2cacb8416a1so10507695ad.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 11:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783706847; x=1784311647;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vK1yycrFvPnOHneU0oNi6DrjeWKqgXkTtqXMvxDGhZQ=;
        b=gXrVxN4+oTBuV1U2WSIlNpT7Zmr5cQd+1x06uFvK7F6MOSiANa9A3moCoVe/AV/fSZ
         Dp6PDfA/d9tXr0YftDi1TiDU950UDdM7sZs39vybFSPdgIGy201DUm9QZHRuUtt4lGLj
         A8/JmMULFLSbFHFIMxrjK13hT4YQtcO/hIhkr30NCfevWZTP84E65jB4n+5bTeU3ZpnE
         ghQno1pq1crBoASeNK81dAN0fmKYM5Pptw8WTFwlqLcoCfYm47OiIqHMWw3SAuWX0WXg
         RNE9w0CPXy/i/m00eovUtsZ92WIiyWU9yqEjCjrkOPYcw81YIOvBlnbWTm6DwA2w8Yje
         kHDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783706847; x=1784311647;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vK1yycrFvPnOHneU0oNi6DrjeWKqgXkTtqXMvxDGhZQ=;
        b=TiHW6xCSsedbpF5hSqaEGp7P9CoO+bg6g2ll5fZi5A77TsZlD1oyDvEfiwbRNIgRp0
         m9TcOhHUwjCVVmvvtNXVV6IQFZYB0yuWcXijzzyVnZTxAU7CU2rNg5Q32lNXr/J3u9G0
         pc6Xd0mQ+etuJLlLnRYZnzL6/2DbH1g603T/eRVZtCM+aOzpGf60xwFo6PbccO20pfyJ
         R2RR1WbnfIOXoMWGMsGEu5rgIKTwh0/i3K/S8bSCkFIr5bqMkkLEhH6/ZVsiH5PqLnDM
         P57xQbyWJxc5trAancSfTv8UBzXm77WIwG7XzudsezHYFg8HlK+ySms5ZgUjo1sQ7eH5
         kH1g==
X-Forwarded-Encrypted: i=1;
 AHgh+RoywKxVP/3C/VdVGCrjtQ+Y+3i/Gn0lhSAJnLpuuPWXy+Ma4W/T7MPkh9i2vrtO+tdHZrmD1GKC@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy8gh4ntDulQNQw7qHgUz+spL98Y+fxMktYorc8fEIAb6VLwD4C
	DOis32WkPiF69+O3KgPuyDu42jIiajtRcxlhs7aQxCOccbXnI4iJOa+w
X-Gm-Gg: AfdE7clCxClrVFOPBpkPgKatzpeBy9YGX0l7/iU1XIjtbpJvE0w9shWIVnxAMQ91mKL
	MwApx4hScprBNLptZOW4g4i9aGy+hrqTMmx9w0gnPG0vNyxf/T2PD0SpNhMNX2xZFljBYlPaCn/
	Rv0J9CwpVCqxEuSpQbX+m4DNKXRMxLX6QWTIjqDncZf667vjWNLe4MOSqOERKWUByTqsA26nU70
	OIs0DH+x5Pgu8xO4WUuZMoFx5W1MKEZciDmyKwSEDW07KluGPivrIF7g8iC3vtAfqbE8wNHLBgz
	ZrlL8Ctj7JjYRMZeag8KIBhmEEbK4c1ZYWxt0XNOqP5ApGtxhTk+OiihihIbiJDqh5kLJhG3IzA
	0PzeIiD7OeVv2JdpDoZ67M+kVCKPgoFTblqtTM0XO3RMhvB9IO5vRF+EnnKvM2cve5skwCWmtYW
	zDaAkD3JFOdc8DBYm2uxoKdwDx2VngOflJYGCTuWaArwgTnAthU46Whk4=
X-Received: by 2002:a17:903:2a88:b0:2c9:d8c6:1db8 with SMTP id
 d9443c01a7336-2ce9f284e45mr2337085ad.28.1783706847144;
        Fri, 10 Jul 2026 11:07:27 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9bf74cbsm63356135ad.18.2026.07.10.11.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 11:07:26 -0700 (PDT)
Date: Fri, 10 Jul 2026 11:07:23 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alE028DsCGeUwNh6@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710162749.GP118978@ziepe.ca>
 <20260710164743.GX118978@ziepe.ca>
 <alElv0EKjLQXMNK8@skinsburskii>
 <20260710180312.GD1803712@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710180312.GD1803712@ziepe.ca>
Message-ID-Hash: 46EWVQAPO7QBKCTOJ6QC2YFY6JMIQX77
X-Message-ID-Hash: 46EWVQAPO7QBKCTOJ6QC2YFY6JMIQX77
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, kees@kernel.org, kys@microsoft.com, leon@kernel.org,
 liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org, longli@microsoft.com,
 maarten.lankhorst@linux.intel.com, mamin506@gmail.com, mhocko@suse.com,
 mripard@kernel.org, nouveau@lists.freedesktop.org, ogabbay@kernel.org,
 oleg@redhat.com, rppt@kernel.org, shuah@kernel.org, simona@ffwll.ch,
 skhan@linuxfoundation.org, surenb@google.com, vbabka@kernel.org,
 wei.liu@kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/46EWVQAPO7QBKCTOJ6QC2YFY6JMIQX77/>
Archived-At: <https://lore.freedesktop.org/alE028DsCGeUwNh6@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:03:12PM -0300, Jason Gunthorpe wrote:
> On Fri, Jul 10, 2026 at 10:02:55AM -0700, Stanislav Kinsburskii wrote:
> > The main customer for this new feature I have in mind is the MSHV driver
> > which backs VMs memory with HMM, requires userfaultfd support for
> > post-copy live migration and fast restore and it doesn't timeout.
> > 
> > I agree, that this current timeout value used by the other callers might
> > not be enough to repopulate the mappings with userfaultfd, but there
> > drivers would get -EFAULT for uderfaultfd-backed mappings without this
> > change anyway, so getting -EBUSY with the change instead doesn't look
> > like a significant change to the behaviour from my POV.
> 
> It sounds like it won't be reliable either then.
> 
> > > So, maybe the deadline should be resetting after every handled fault?
> > > ie the timeout really is only about the mmu notifier and we don't
> > > count the time spent handling faults or walking?
> >
> > The timeout was inherited from existing HMM users rather than introduced
> > as a new HMM policy. Some GPU drivers use HMM_RANGE_DEFAULT_TIMEOUT as a
> > budget for the whole range population operation, including HMM retries
> > and subsequent driver mapping work.
> 
> Yes, because we always had a timeout around the notifier because that
> scheme can sort of live lock. The timeout was to protect that only, ie
> limit the number of notifier retries.
> 
> Expanding the timeout to be outside what is bounded by the notifier
> retry is not right, and heavy stuff like mapping should be done after
> the hmm side succeeds and the notifiers concluded so they can rely on
> normal locking instead.
> 
> This is why I'm suggesting to reset the deadline as hmm makes forward
> progress, we really only want to bound the notifier retry loop not
> anything else.
> 

Sure, I'll modify accordingly.

Thanks,
Stanislav

> Jason
