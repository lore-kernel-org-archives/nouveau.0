Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7371CC43458
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 17:01:30 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9221A10E63C;
	Mon, 13 Jul 2026 17:01:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="cWObE4+7";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5B0E4470D0;
	Mon, 13 Jul 2026 16:46:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783961178;
 b=BrzZuFIXNHmVzgYNFcSRYpYlhH8L7vOYBR9cgdRFn0ubPu3Uuwv03Ra+0wc4Fba5JWjDL
 y0iYOtJaUra9inbUIRngvb7E790rIzvY8WbFsJAOqBHteZ+COzFuZHieTBV2eLthFtns6m5
 LTDuIodCKreNqYDIZT4A22G5J6GBhXlAQ2MIt7Fqf44x7lF/AAqfe35Az/VX7/nOiu/FCeV
 JDjpZhNCAI0HjKej1q3d7HVtT0VpfYM8bGXaenAXuG58TJEQtJP2enDO6gxqPeG+OYds8wq
 4zNd06zf3bzmF2szpjNw9LxIzAYowBeX+KiPtNWUxvyaZCTx3HOTSBI+nEGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783961178; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=R9LV+16tD32KS6yXCzCBkB0u2lL8SNr6pDg+a+HPC20=;
 b=GuvHQH9PRHoscMYRGvlnNYCUpypcSse4Fcm1J10dqrMC0gnW1reTHypRkHbKDqF0Jv3kH
 wQ560i3ZoTyXw23RyXj0fIhOERosTAQTDOGsuqA5Ule7RfPbxsn3Q03U3k27I+EqH63Iapr
 dlmABHQZQctMdbL7nnhZNB3zicCZXBqVdu874d+TtENW8Woa6NJNLFI4JxMcRmoPAp7e0mF
 DwCtCQLa/swS/xswVs65DiUoe+D3rrGa5/+DhxPctlINW/Qc9K7lIGVfBuGGZnreJokYcG+
 7Sihcb24X/LO7FMRAFdCgck49GdByqrYR1ujtKxFcMTGv2xq+6MG5/+nmA7A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9744C46ECE
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 16:46:15 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37910E623
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 17:01:26 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2ce9e39fccbso887935ad.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 13 Jul 2026 10:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783962086; x=1784566886;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R9LV+16tD32KS6yXCzCBkB0u2lL8SNr6pDg+a+HPC20=;
        b=cWObE4+7shrvUl4uaczCEu7Kv3aOoU9zBS94KfdE10ghs3QaLn+9Lne+ko6GBxY/H0
         3vpJFD4vDqfbyZGLPL62DdaYkymGzsWzsucuEcIBhEPA9BrRI+EQGIac50Bcp8ujo1mu
         Bxyy1WCFd5Avn51ddba5WLaLz+kIT9BUafo5MVVAu6gMbSJoBvI6ujzyIYJivGmJ4m9f
         XfiW54YDMyZ2h3vSmeonSp8tX8MquI9BR1AbHNPg4MOlwxhECQYd2zXah+ZOYMjjsl1d
         EzwpWYCLXXVKgC7JYUfuzp2dhVB8MCIlQY9WurkeUy94sQ1BIxDbtscJAQtp9iam0d76
         0eBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962086; x=1784566886;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R9LV+16tD32KS6yXCzCBkB0u2lL8SNr6pDg+a+HPC20=;
        b=j6gRqzv1qsx/38MxB1VczP74w78rdjDQalFle1PfHN7yfMHtdj9SBhIjCVb/FZQbtv
         YXxJq1DWwaUiEq2qVQdv5WYEe7IAZ1jesP3TFeQfPzNEcdF6nNyJ/pTiPsZ6JTCuncwU
         NqRLXVrZsAxepkTWSGmAjNVDVaNRTr3HxJ7r1kg7b5+scbjaMqUf898L8HJrtEFN/Etz
         CpuBDzeWr2eUZKgYtTCFACC7tVOA1Qx2iRkhWfaCFT1yMSPPmEtzqoPB1fxH3Vs/fnyi
         lWoOxQ/SvsvZRi7uet1qhvcp+R1gt7Hen0yGXbLLI75q/+3GcTKD10r8kBB8vhY0pY+O
         7Y7g==
X-Forwarded-Encrypted: i=1;
 AHgh+RrYiVkX4UjmGUxZE0jyLQ8B8FRUorYE2AXHGqnlhv2zJbhDtEFKVTcL1AfTMkrXCfBzXf9V3x5r@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJoQnY9ZYCCzci5hlJ3drsg4+1ihhxEjS8Pew14P0ITfJl151/
	F2syuixWqTaTRbLSMnF/vexk3PaOfn/yFL9nyz6/6wv20zc7EWoAIJw9
X-Gm-Gg: AfdE7ck5su00qlPq+3P7Qu6nkb0Zn6r6R0XSiWx8voD7dVtEixXCB52vfcDi9OSF81C
	HvbTy0kPRLZeNEwPr9YphaoMeYdfL3Au+kmE1QkvIHEjEgs9dt5agvjyimpHJXQk7ep7JVNMAnV
	bxnHGm0ixFKXUIWAFi3PXmmD0wpnRmcHSrrvsyXXi0ulQMwTTIwk5Sf7HeDrUoZK9hpTzhoQGHF
	o+CDttvcn74m3D7+ZfLz++nFnCV5Lc9HVqKdySg6UvIIvy7QwWzIRWcz+1QOgnWlcxyHsH7ozww
	w0z/sgMATsYF9CmpLdrAArt5b3txXK1fqoYu6WmZB4I2aXMWglxmcjvCfj/BiAVmd17UD5uqI9g
	0KH+0/1zqYB85ilr5+OEh6Ckz32mTSxAUcIHK1yKIOUM2cr7/Ri6cYBEHXGJGbh6nkuwbfcKkSk
	c28xAY5+SnzTeL6fiJJkaoeGWFPAElX6XAkFLUx5D99vxR+P1w2EcsKsg=
X-Received: by 2002:a17:902:e88a:b0:2ca:de3:15d7 with SMTP id
 d9443c01a7336-2ce8292bad0mr123460335ad.16.1783962085860;
        Mon, 13 Jul 2026 10:01:25 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2ccc9d3d451sm102224465ad.65.2026.07.13.10.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 10:01:22 -0700 (PDT)
Date: Mon, 13 Jul 2026 10:01:20 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH v8 8/8] drm/gpusvm: Use
 hmm_range_fault_unlocked_timeout() for range faults
Message-ID: <alUZ4NQptiD9fRfz@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371883977.900500.2198446134676328631.stgit@skinsburskii>
 <alUSq0o7CC2Pnr+H@gsse-cloud1.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alUSq0o7CC2Pnr+H@gsse-cloud1.jf.intel.com>
Message-ID-Hash: LF65EVYLRTDF452GLTKJPFIRXHISTOH4
X-Message-ID-Hash: LF65EVYLRTDF452GLTKJPFIRXHISTOH4
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org, corbet@lwn.net,
 dakr@kernel.org, david@kernel.org, decui@microsoft.com,
 haiyangz@microsoft.com, jgg@ziepe.ca, kees@kernel.org, kys@microsoft.com,
 leon@kernel.org, liam@infradead.org, lizhi.hou@amd.com, ljs@kernel.org,
 longli@microsoft.com, maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
 mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
 ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org, shuah@kernel.org,
 simona@ffwll.ch, skhan@linuxfoundation.org, surenb@google.com,
 vbabka@kernel.org, wei.liu@kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LF65EVYLRTDF452GLTKJPFIRXHISTOH4/>
Archived-At: <https://lore.freedesktop.org/alUZ4NQptiD9fRfz@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Mon, Jul 13, 2026 at 09:30:35AM -0700, Matthew Brost wrote:
> On Fri, Jul 10, 2026 at 02:27:19PM -0700, Stanislav Kinsburskii wrote:
> 
> Please send series like this to intel-xe@lists.freedesktop.org list too
> as this will trigger our CI which expercises the change paths changed in
> this series.
> 
> > Several GPU SVM paths take mmap_read_lock() only to call hmm_range_fault(),
> > then retry -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT expires. Those paths use
> > MMU interval notifiers whose mm matches the mm that was locked for the HMM
> > fault.
> > 
> > Use hmm_range_fault_unlocked_timeout() for those faults and pass the
> > remaining retry budget to HMM. The helper owns mmap_lock acquisition and
> > refreshes range->notifier_seq internally for each retry, while GPU SVM
> > keeps its existing driver-lock validation with mmu_interval_read_retry()
> > after a successful fault.
> > 
> > Leave drm_gpusvm_check_pages() on hmm_range_fault() because that path is
> > called with the mmap lock already held by its caller.
> > 
> > Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> > ---
> >  drivers/gpu/drm/drm_gpusvm.c |   52 ++++++------------------------------------
> >  1 file changed, 7 insertions(+), 45 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/drm_gpusvm.c b/drivers/gpu/drm/drm_gpusvm.c
> > index 958cb605aedd..6b7a6eaebcd9 100644
> > --- a/drivers/gpu/drm/drm_gpusvm.c
> > +++ b/drivers/gpu/drm/drm_gpusvm.c
> > @@ -788,22 +788,8 @@ enum drm_gpusvm_scan_result drm_gpusvm_scan_mm(struct drm_gpusvm_range *range,
> >  	hmm_range.hmm_pfns = pfns;
> >  
> >  retry:
> > -	hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > -	mmap_read_lock(range->gpusvm->mm);
> > -
> > -	while (true) {
> > -		err = hmm_range_fault(&hmm_range);
> > -		if (err == -EBUSY) {
> > -			if (time_after(jiffies, timeout))
> > -				break;
> > -
> > -			hmm_range.notifier_seq =
> > -				mmu_interval_read_begin(notifier);
> > -			continue;
> > -		}
> > -		break;
> > -	}
> > -	mmap_read_unlock(range->gpusvm->mm);
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> > +					       max(timeout - jiffies, 1L));
> >  	if (err)
> >  		goto err_free;
> >  
> > @@ -1439,21 +1425,8 @@ int drm_gpusvm_get_pages(struct drm_gpusvm *gpusvm,
> >  	}
> >  
> >  	hmm_range.hmm_pfns = pfns;
> > -	while (true) {
> > -		mmap_read_lock(mm);
> > -		err = hmm_range_fault(&hmm_range);
> > -		mmap_read_unlock(mm);
> > -
> > -		if (err == -EBUSY) {
> > -			if (time_after(jiffies, timeout))
> > -				break;
> > -
> > -			hmm_range.notifier_seq =
> > -				mmu_interval_read_begin(notifier);
> > -			continue;
> > -		}
> > -		break;
> > -	}
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> > +				max_t(long, timeout - jiffies, 1));
> 
> Unaligned indentation.
> 
> So I'd write this like this to avoid weird wraps:
> 
> ctimeout = max_t(long, timeout - jiffies, 1));
> err = hmm_range_fault_unlocked_timeout(&hmm_range, ctimeout);
> 
> >  	mmput(mm);
> >  	if (err)
> >  		goto err_free;
> > @@ -1736,24 +1709,13 @@ int drm_gpusvm_range_evict(struct drm_gpusvm *gpusvm,
> >  		return -ENOMEM;
> >  
> >  	hmm_range.hmm_pfns = pfns;
> > -	while (!time_after(jiffies, timeout)) {
> > -		hmm_range.notifier_seq = mmu_interval_read_begin(notifier);
> > -		if (time_after(jiffies, timeout)) {
> > -			err = -ETIME;
> > -			break;
> > -		}
> > -
> > -		mmap_read_lock(mm);
> > -		err = hmm_range_fault(&hmm_range);
> > -		mmap_read_unlock(mm);
> > -		if (err != -EBUSY)
> > -			break;
> > -	}
> > +	err = hmm_range_fault_unlocked_timeout(&hmm_range,
> > +				max_t(long, timeout - jiffies, 1));
> >  
> 
> Same here.
> 
> Nits, aside LGTM.
> 

Will change as requested and send to intel-xe@lists.freedesktop.org next time.

Thanks,
Stanislav

> Matt
> 
> >  	kvfree(pfns);
> >  	mmput(mm);
> >  
> > -	return err;
> > +	return err == -EBUSY ? -ETIME : err;
> >  }
> >  EXPORT_SYMBOL_GPL(drm_gpusvm_range_evict);
> >  
> > 
> > 
