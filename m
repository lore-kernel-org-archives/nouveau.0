Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5C6C43458
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 17:06:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D179D10E3DF;
	Fri, 10 Jul 2026 17:06:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FruZGHly";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4553447040;
	Fri, 10 Jul 2026 16:51:47 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783702307;
 b=Uha5SY46H38JfWzCYxg6VO3na2Z5XJnV3W4wcs6P2lFuaAYJKLE9H5UCdL5v7b1Hi32xu
 SadVVD3BWI84++wU+jYWYTyIRv9ZvyRlpcPjU2eBbtv+g+JzLemrZNKgDWGtTtJ4yk4brei
 zf08L8MpOJ1e8hBKYwRTTFaL7ID69bj56IC12+MYwaAlLCfjvH2dZDo7P1bQRKncUtLvUEp
 9Ul0y3Tfojff50fHAwpONicsB4D2gswSlK5OmivBOaQ2BFV2ip6Qb9dDrv4Lt/lb9E1VWgp
 BMz0+LHcZZn0gi+wBNMj2BmRrYr5/SwVft5Vx9XujYTZkdvyzJ1Ktl5W1/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783702307; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SpFBfA7wdgGokfuzCR83lopKSZdMUZgccIdXLTCA/gs=;
 b=Ze8u7nH3+eTb6g2Y91dZCVXl+Lo9nkfeJ7CJf5NuWvhzqQsvWF9XO8VeqRNgY/p7ugGGs
 Uq9Xif4F6jIOPWaHk/PYkCpgoS3OmZ6Fw9yXQSoezVxsyeaZx9lxaDsvJwrAhNaDlz35/3/
 2/F6SnocCQ5ZzbPxBzabB8ZibErXtrvbdtNjZQX8Z7IFAcSAqVSeF+nB7hU9Fo7SfFx+K33
 sEE02ZHf6ha2ew9D/PfKAgBg8MzpmoGcxbAVObK77hU5UgE9NMexRCcxF0LYXvMrYhCJKkD
 5hpuOh5wXnyCA8+fZ6E/9inFrHFKUf1fHg+cjiU4ZgfgZDIQVRlnNKnu6daw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A9C8E4703C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:51:43 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com
 [209.85.210.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1997710E200
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 17:06:48 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id
 d2e1a72fcca58-8486ac3f347so1591591b3a.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 10:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783703207; x=1784308007;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SpFBfA7wdgGokfuzCR83lopKSZdMUZgccIdXLTCA/gs=;
        b=FruZGHlyGf+g917yTIvFBQy8Ek0ygQ1hXaRCtahQey0VwSnAUTt3NXNZLWuVvSwUcZ
         DcZNKRbfhKlyukQqCWiEcaVerhEoE1Yoqrh9ADwN5gfBbJxpIQ+EPG8klp3Zyr2MuGq2
         0wTxbATmr8JG3bhHG0zZGdHguFxmU1DbqNmVbsFUmD7u4oe5tocqfehIbRtO8ljR3768
         FA0F0Ygb9letLubrdE7SVnRFDrOIjUN7QMI+zhqD+RuLr8EAsXE+3khZyeBkbwiityA4
         YrCq+pX8H6tQNq4K1A+fAYcP74uEdvnMiHURSjuJseSN7p+6hneFkgFg0wbIfWMCfpFD
         Hn0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783703207; x=1784308007;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SpFBfA7wdgGokfuzCR83lopKSZdMUZgccIdXLTCA/gs=;
        b=RDJ0WApiwoduWrx6vTRlsLZtqXkZRmBoyojxMlWH1+BKHPUs/PWD6AMl0yqZOCjgXf
         DG5qJ2Sl4BIlvM9NxmYnTr50nZAbt57KdWvD6KVu08YneDI2yQuAXKQwCRzSJcSTSvmB
         Tq/s4nhBj9pLmvj9ncXBefzVH2nP1qMu236gmfb4l+6eQqJTRvxp5YUrXQD1e92MCqDj
         x1Hn7yGvQc0FfHMDBskxJHxbZZks5Gh6oDm0v5tjUd9Q3bxihjZje3Axw0WXBTPvElKf
         3Zad7435OokbBalFh5Z4408Twkbx0m+vJuJBoS50dP9NTzIKGAlzjIQ4GYmn6v4lIv54
         6gCA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqU/6BEezMLg3LhWwlp0hkk4FDEBr53+A7aQZEykCmZ35gfpzWp1NWSH9vsOQPpoGWXHpmake/b@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwBFEdi2k2zc7VYVTr2d2eKLrEaq8butDBtVB4GrGp78z7F04Ys
	uYFtg+Uw1pH61O75Tu8rVeGXRrujnaTbgAMOyadxViu62ZUV+A51vVzE
X-Gm-Gg: AfdE7cmnSvVzT9k3i27zmA+0wO8edg04ntzxWkecbZ1G+A+DfnAcOmBUfeUKUTx2Slt
	5uB4qIy5LejHkb0iHV0sbZf4+7Q5ZztGQ5QSSlLH620m1pJLbt/Zt0693ka3xMJcQnP8wu0FYZV
	TVX7KOhzGH+WZpifh5uly8HrxRIoi9tqfpmZBcyFg6Ghd5MzLUQuhPH1nDFoJj1BWhJ4fbVzrt+
	ZdMtwBGjcJOfEQ+nwhNYfPNTUjI/0nXkfXqAVMUTv1v45gJ6fJETj3y10HS0kaa5lzI64+j3dXQ
	AW5Exr1F93zHsgsXmOO9nrHHb2C/5FgAnJbrvhvlwG8I0hO/k1F/ra9eP0MFLIRqNhzE7oL1EKE
	BHL2V8ocwJLX4c25EcfEmVmlSPOTDLUEtt1Yypfd6vTKFM15DK5tLF5rbl6o4J+tz6MfJJ2eWun
	bAT+mHq9ejU4Q9LL/wnO3n26i0mhhtLX+9NlFU8bjnAFQFw1CRBc7PhNc=
X-Received: by 2002:a05:6a20:d494:b0:3c0:9acb:400 with SMTP id
 adf61e73a8af0-3c0f13a6583mr4025578637.37.1783703207546;
        Fri, 10 Jul 2026 10:06:47 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5b3a2e42bsm5458929a12.30.2026.07.10.10.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 10:06:46 -0700 (PDT)
Date: Fri, 10 Jul 2026 10:06:44 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v7 2/8] mm/hmm: add hmm_range_fault_unlocked_timeout()
 for mmap lock-drop support
Message-ID: <alEmpEv-Q_bQFzNu@skinsburskii>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345362182.660027.12809852179204464964.stgit@skinsburskii>
 <20260710163835.GR118978@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710163835.GR118978@ziepe.ca>
Message-ID-Hash: GB4UGULWO7I36PLM5D2RF7MZVJAQHZS2
X-Message-ID-Hash: GB4UGULWO7I36PLM5D2RF7MZVJAQHZS2
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GB4UGULWO7I36PLM5D2RF7MZVJAQHZS2/>
Archived-At: <https://lore.freedesktop.org/alEmpEv-Q_bQFzNu@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 01:38:35PM -0300, Jason Gunthorpe wrote:
> On Tue, Jul 07, 2026 at 12:47:01PM -0700, Stanislav Kinsburskii wrote:
> > hmm_range_fault() requires the caller to hold the mmap read lock for the
> > duration of the call. This is incompatible with mappings whose fault
> > handler may release the mmap lock, notably userfaultfd-managed regions,
> > where handle_mm_fault() can return VM_FAULT_RETRY or VM_FAULT_COMPLETED
> > after dropping the lock. Drivers that need to populate device page tables
> > for such mappings have no way to do so today.
> 
> sashiko could not apply v7 for some reason but the remarks on v6
> seemed meaningful, did you see them were they delt with?
> 

Yes, I dealt with them.

> https://sashiko.dev/#/patchset/178336023903.504354.7500950448226027718.stgit%40skinsburskii
> 
> > diff --git a/Documentation/mm/hmm.rst b/Documentation/mm/hmm.rst
> > index 7d61b7a8b65b..70885f153d03 100644
> > --- a/Documentation/mm/hmm.rst
> > +++ b/Documentation/mm/hmm.rst
> > @@ -208,6 +208,69 @@ invalidate() callback. That lock must be held before calling
> >  mmu_interval_read_retry() to avoid any race with a concurrent CPU page table
> >  update.
> >  
> > +Dropping the mmap lock during page faults
> > +=========================================
> > +
> > +Some VMAs have fault handlers that need to release the mmap lock while
> > +servicing a fault (for example, regions managed by ``userfaultfd``).
> > +``hmm_range_fault()`` cannot be used on such mappings because it must hold the
> > +mmap lock for the duration of the call. Drivers that need to support them
> > +should call::
> 
> Given the majority of callers use this API it should probably be the
> focus of the documentation and example, regulate the existing API to a
> 'BTW if you really need the mmap lock, and you really shouldn't, this
> exists too'
> 

Sure, I'll update the doc to reflect it this way.

> > @@ -32,6 +32,7 @@
> >  
> >  struct hmm_vma_walk {
> >  	struct hmm_range	*range;
> > +	int			*locked;
> 
> Let's use bool if you have to respin this
> 

Sure.

> > @@ -651,37 +663,33 @@ static int hmm_do_fault(struct mm_struct *mm,
> >  		fault_flags |= FAULT_FLAG_WRITE;
> >  	}
> >  
> > -	for (; addr < end; addr += PAGE_SIZE)
> > -		if (handle_mm_fault(vma, addr, fault_flags, NULL) &
> > -		    VM_FAULT_ERROR)
> > -			return -EFAULT;
> > +	for (; addr < end; addr += PAGE_SIZE) {
> > +		vm_fault_t ret;
> > +
> > +		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
> > +
> > +		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
> > +			*hmm_vma_walk->locked = 0;
> > +			return HMM_FAULT_UNLOCKED;
> > +		}
> > +
> > +		if (ret & VM_FAULT_ERROR) {
> > +			int err = vm_fault_to_errno(ret, 0);
> > +
> > +			if (err)
> > +				return err;
> > +			BUG();
> 
> Linux will be upset if he sees this.  
> 
> if (WARN_ON(!err))
>    err = -EINVAL
> 

It will. I copied it from GUP.
I'll change it the way you propose it.

> > +/**
> > + * hmm_range_fault - try to fault some address in a virtual address range
> > + * @range:	argument structure
> > + *
> > + * Returns 0 on success or one of the following error codes:
> > + *
> > + * -EINVAL:	Invalid arguments or mm or virtual address is in an invalid vma
> > + *		(e.g., device file vma).
> > + * -ENOMEM:	Out of memory.
> > + * -EPERM:	Invalid permission (e.g., asking for write and range is read
> > + *		only).
> > + * -EBUSY:	The range has been invalidated and the caller needs to wait for
> > + *		the invalidation to finish.
> > + * -EFAULT:     A page was requested to be valid and could not be made valid
> > + *              ie it has no backing VMA or it is illegal to access
> > + *
> > + * This is similar to get_user_pages(), except that it can read the page tables
> > + * without mutating them (ie causing faults).
> > + *
> > + * The mmap lock must be held by the caller and will remain held on return.
> > + * For a variant that allows the mmap lock to be dropped during faults (e.g.,
> > + * for userfaultfd support), see hmm_range_fault_unlocked_timeout().
> > + */
> 
> Add a comment discourging anyone from using this function and prefer
> hmm_range_fault_unlocked_timeout()
> 

Will do.

Thanks,
Stanislav

> Other than the concern about the timeout and minor nits this looks
> fine
> 
> Jason
