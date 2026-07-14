Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84B49C43458
	for <nouveau@archiver.kernel.org>; Tue, 14 Jul 2026 21:34:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8DF8B10EE6B;
	Tue, 14 Jul 2026 21:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="JmhMH5bR";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id ABCF6471C1;
	Tue, 14 Jul 2026 21:18:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784063926;
 b=Z0AEZ+F1MkYC0a2mE7qsohn6WgzhAUTFtCRw27FH4+UyZI6rQeCdlfDOUNIo1BiQuk/7f
 YyCH+wYmQTF7Bzl7oAR1B/90l1I0XFfqC4uY4wWvS43+OC4P86qUfwfsJRZCjV1tZjuhPzW
 T33KbKM2KFNea6yGZk0Gtn1o3++xyVAb6cgR6Nbswu0n/bf2WXVVXhL4nVfJcAFKN9I6QAP
 julcCKGuxeswhdZqyhROv0bprhqUz8qp5xGUxGFgz87gS73EHGGQmyfJfQyEGSCrbHfJsEj
 R5RZgdHg6zYxDkuMMgeHaUkgIAxDr4cWhLeSHf33ClX05AsXL7lTjo0MYCEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784063926; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=zebbIro5mkXbuDBJ5TKnPBr9hFGew4CMfA/H27lS0KU=;
 b=VdGdVuMA3XN9jzQr59Fdshp49ecOrDsOx2brI5+SvQrKDvl9D367WxpzqtOgTSDuLvkcB
 AGGzqKG26Jmzly+LXY9oyDKetYm4+n+ut7oTh7epSeF4Ggk7qdwhr+ix+P+Av7iBs1Z5Eat
 qsDI/TQpNb4WEL80n+qCQ30YS4nnQ+GjZd7czy6psZ8BmgHl0yybM0G1vdFY2gdAcvjfmmj
 bo1TcCFyBb6LXTohdvuOgdH/Z/58P3FV7XrFnRuSJhC4SWmAfhY7iUjIm1b6l6asoJWqdAZ
 6YroOdhcf7AHGzsLwqE6++8zQiG+9+l1ZTKWQncEV304nwo642fuu9z6fBmA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CCCCE47123
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:18:43 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7B28010EE6C
	for <nouveau@lists.freedesktop.org>; Tue, 14 Jul 2026 21:33:57 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2ced3386430so13090455ad.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 14 Jul 2026 14:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784064837; x=1784669637;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zebbIro5mkXbuDBJ5TKnPBr9hFGew4CMfA/H27lS0KU=;
        b=JmhMH5bRnq/SXDzgstDegeBbdbJWwWFVQoQVG3EQVY/MKzmKZomRmZzBKRSZmcWZp7
         e0eU7wyhV1tHy+KNrSQE6+8oeZQu1mE4aiPXLIxIXcH0k78c1Qi6LUgsliGfyYZWS0TW
         3BHMp5Yo+Qj1iuV0fNyZpsd3k7cBHfVFdl+xvmma9r2su9I17IxkNTl73HBte5k7o2gX
         U/npZw5mr5OuA9orcIwltQbgJpTJH1nG2fz76K450qWRxkK8fDs0SZ2ECdj4hDNnJOc7
         G1rfgBJK7dcyuqWWl6r5tUSwBHrUwKi5iSgm8HKZ5EUpkBiw0hOL7NsGiU5E5iBKwa6L
         ziYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784064837; x=1784669637;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zebbIro5mkXbuDBJ5TKnPBr9hFGew4CMfA/H27lS0KU=;
        b=pA1+vf0MEPqBjGGHYfn8reBL+FVerZkwMjzLJ9jswNCzNwlhGnAVQ0dLHVVK4Mqv5x
         6IJ713nkQiJMLvTWMEA+riTa9eIBuo2L7iQAAB4mTPbCosIqRoiAYnHagrH/x9ugweyz
         pdnJR/IJF7RIuMRsX3UcgO2ezbcv1tbuJmImSMqut1Z2di2pp94ZykTL1DoR36F92bUo
         WB3f/JFmL/0bSCzew4juOs1zPGaKlFfLW5tyA3tY3NojsyT1hwKPbgZAXPpXwyzbTM5i
         /QpDSZEe5fDA2Og+lBF8FHkdMGcXdAHp+t5NnW/NNQgMPjV+6e6hwFQS+BrCPIARqDsw
         YZdA==
X-Forwarded-Encrypted: i=1;
 AHgh+RoT8nz3awJhhqFyMusTH7RWSpuSNstBUBxxucZTMc7JRLZInHZMJ/JBUBQMKI4YRT53AKU8ox6I@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7Ftx9yQyW0LDR5MlKEbii2qcyKu7rMDmLQ2w14Qqc3Ax1lcIP
	4KTRC9t1Wa1RWYbrVjrd/ajiJ9eNm8AAgyrUxNjU/9i/0fdGVUAzYDy3
X-Gm-Gg: AfdE7ckwqowqNHvBLNKfSJyyWZsR+3LYZwA4D5CNOI74E02R08s23WMx6gao1k6lyz8
	WXwZX+bzi7l4MC6ATBLJ4XlwNspOM3X5irsIw94xI3nFngCugvia/Ugg9FL8z56qsvHQskphXjx
	tFRylkgUJj+M7rlz0034FnjQYL8+wj+EFtMwCnLRnKhqKl+1VQmEtMGqIGZTbkm3dTg12H7xfP6
	rQT7ysVW6meXvKNMeNOBAAmqQa2FPzPIqjPkbrO/V0cXi7+f6RYmbdP+4RNkgrswP3o5zQdkCHY
	OZSWQCSRlZnMLdSo/G6Io77zehcT0l1q52vPEf+vu5nXORNhjszvYpxg8FbokdvLTqXOYgktQCF
	vX3MnCD+vJIhiN2hFWVBKunQa3Bvw07BWT/ECcomXyC2tudpw4ltl0g//U7y4vjswCOF6jQWhAM
	xGJFl9sJ1akNCMjZD28Y8rbnE1Ta3LxTHjfFDVLBcwPG2R101rTfKsb/BvSln09CidIA==
X-Received: by 2002:a17:903:240c:b0:2c8:1c05:16bb with SMTP id
 d9443c01a7336-2ce9ec0f108mr142192545ad.24.1784064836947;
        Tue, 14 Jul 2026 14:33:56 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2cea6507b5csm55058005ad.72.2026.07.14.14.33.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 14:33:56 -0700 (PDT)
Date: Tue, 14 Jul 2026 14:33:53 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: airlied@gmail.com, akhilesh@ee.iitb.ac.in, akpm@linux-foundation.org,
	corbet@lwn.net, dakr@kernel.org, david@kernel.org, jgg@ziepe.ca,
	kees@kernel.org, leon@kernel.org, liam@infradead.org,
	lizhi.hou@amd.com, ljs@kernel.org, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mamin506@gmail.com,
	mhocko@suse.com, mripard@kernel.org, nouveau@lists.freedesktop.org,
	ogabbay@kernel.org, oleg@redhat.com, rppt@kernel.org,
	shuah@kernel.org, simona@ffwll.ch, skhan@linuxfoundation.org,
	surenb@google.com, tzimmermann@suse.de, vbabka@kernel.org
Subject: Re: [PATCH 2/4] fixup! drm/nouveau: use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <alarQbmnjwtgdBUB@skinsburskii>
References: <178405975214.1082778.5193079941156341151.stgit@skinsburskii>
 <178406001808.1082778.17299764648397654220.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178406001808.1082778.17299764648397654220.stgit@skinsburskii>
Message-ID-Hash: XD7SGREMUJZS6OCGJFHXO5XDXX6CUOZS
X-Message-ID-Hash: XD7SGREMUJZS6OCGJFHXO5XDXX6CUOZS
X-MailFrom: skinsburskii@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-rdma@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XD7SGREMUJZS6OCGJFHXO5XDXX6CUOZS/>
Archived-At: <https://lore.freedesktop.org/alarQbmnjwtgdBUB@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 14, 2026 at 01:13:38PM -0700, Stanislav Kinsburskii wrote:
> nouveau_range_fault() now uses hmm_range_fault_unlocked_timeout() for
> the HMM fault path. The timeout passed to that helper is meant to bound
> HMM's internal mmu-notifier retry loop, not the whole nouveau retry loop
> around mmu_interval_read_retry().
> 
> Pass the full relative HMM_RANGE_DEFAULT_TIMEOUT value to
> hmm_range_fault_unlocked_timeout() on each attempt, and retry from the
> nouveau-side mmu_interval_read_retry() check with a fresh HMM retry
> budget. This lets HMM continue when it has made progress, while still
> preserving a timeout for repeated notifier invalidation retries inside
> one HMM fault attempt.
> 
> This also removes the open-coded absolute deadline and remaining-time
> calculation from nouveau_range_fault().
> 

Sashiko is right. I'll need to do it differently.
There will be a v2 of this series.

Thanks,
Stanislav


> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_svm.c |   30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
> index 4cfb6eb7c771..b1415c2e49fc 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_svm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
> @@ -655,8 +655,7 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>  			       unsigned long hmm_flags,
>  			       struct svm_notifier *notifier)
>  {
> -	unsigned long timeout =
> -		jiffies + msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
> +	unsigned long timeout = msecs_to_jiffies(HMM_RANGE_DEFAULT_TIMEOUT);
>  	/* Have HMM fault pages within the fault window to the GPU. */
>  	unsigned long hmm_pfns[1];
>  	struct hmm_range range = {
> @@ -677,25 +676,16 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
>  	range.start = notifier->notifier.interval_tree.start;
>  	range.end = notifier->notifier.interval_tree.last + 1;
>  
> -	while (true) {
> -		if (time_after(jiffies, timeout)) {
> -			ret = -EBUSY;
> -			goto out;
> -		}
> -
> -		ret = hmm_range_fault_unlocked_timeout(&range,
> -						       max(timeout - jiffies,
> -							   1L));
> -		if (ret)
> -			goto out;
> +again:
> +	ret = hmm_range_fault_unlocked_timeout(&range, timeout);
> +	if (ret)
> +		goto out;
>  
> -		mutex_lock(&svmm->mutex);
> -		if (mmu_interval_read_retry(range.notifier,
> -					    range.notifier_seq)) {
> -			mutex_unlock(&svmm->mutex);
> -			continue;
> -		}
> -		break;
> +	mutex_lock(&svmm->mutex);
> +	if (mmu_interval_read_retry(range.notifier,
> +				    range.notifier_seq)) {
> +		mutex_unlock(&svmm->mutex);
> +		goto again;
>  	}
>  
>  	nouveau_hmm_convert_pfn(drm, &range, args);
> 
> 
