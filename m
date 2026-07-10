Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE33DC44501
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:43:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8BCA910EF62;
	Fri, 10 Jul 2026 16:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="PpvYGyjJ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id EEBAD47027;
	Fri, 10 Jul 2026 16:28:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700891;
 b=A4tlmr0XkCIErKw9PMnd9GZuJpfC3q3LDZ2ILoHeYi3+9463TmhfuPRlq0S8Bua4j0pb1
 O4e8g1US89P5NtKAcvp2YSZyrS5addJvS831KzdfKGVYypaEljsLtMSGBk+ruKIbTEH8+j8
 EC8pfMJI4zTUv11fQJlTAci0ovQSfyA6TlljRAiJmvaQ6Jd7LW6HN5ZFksmsB8eEEbIdmv1
 or4zzosVGf7rDNnVuQC276938th905GVZEE74ZtoCuvIudKjaapDLiN7c/oIC1JM2BEEhuD
 zEcHoEU/C1MoHYpql/sbk+in0PAO7lmUaXX5tnwVodETFjhBJn6Y/r0/36SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700891; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
 b=nApXWbLh8nyn5DUvWkGRsghwGXmnullq0dSceu7scgPz2DcxLr9sU4LYsB1CgsU4sYvGQ
 78iapZWzB1tRWkcXXbVTY8oHQEZDc1fMgYx8Dzk29bXIg5JKO72l7nTjY4ezfnHL7cad4N6
 sMOChBSmJNg0xv2xIP9SQFe/NKDljwGsVX3QM/YQRqA8F/v8ykXKRHyyhP4zH5Y+aWlyqlb
 51rJ4u7RQ4IuDV0GASaBrXIPOMnMJTWrfaBXd237zZ8lEEbDbtvTjzfJA+NOrbG5+/9G184
 kOVPflizm3MgEpWO1aMyFDQxq91BWIblzs+H96KhRtYX/Y9VrpOu3L7apVmA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 746684022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:28:09 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CF67B10EB08
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:43:13 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-8efcfdb2b43so7500626d6.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701793; x=1784306593;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
        b=PpvYGyjJp0xWU+ViQ+Sr3wa5COTvrmu5+6SOnJsAOqPOxxQTkasQn9QxFivYmNhwFT
         3Peua7yMnGTyeGZZg3gFmLJGlY8b/RbfIop2hE5Trx3JEokgXxbsTmOE12VST9hJKgJc
         QvD5XprlLcbVw1dK8Ck0nmhmMW38VW+6BHul8xVssEINwIHTVNALdJpc8tuoEE6rfDmw
         uAyFUSinfgKazAhjjSC0+mWxfrmVy3V9RAE1ZW3yAsfMBRnK4IU1y9/ks5dbpOqbDDJP
         /TUZYFTlzClwCDsJOZYt4NGij463yTSGCqMzbdcMzEL35EM+R4Pwy1UVFCWPVFYkLC47
         rQ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701793; x=1784306593;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cCrA5GvcNcomQ8YHAskvpnsx6mUAVwyB/JWdGkfbiJc=;
        b=E4HlfssDTHtKGHKe2bgVdwn7TtX+HH9JFmtThUE9wKpK/2nsyP+ZyTN//+se2fgjBD
         14C/W8E/PXzYvAVbGm1mPUYw6ou82MtobNnaEcVTbbZsP+6saSJyQnSDwW1pFYWXl3g9
         VEaBuIx7nQpeH/W1wkJS/fwt8iwGr+4awGCatvHef5Nb4OGoEItEhtwBSITA9HSPAVhZ
         w6wNUVzOiJNzsbpLlC91xZfhr3iqAlWPpAieKMz3IcfesmXb5LkdQw51TUyqxMobqBgP
         7G2rv4D53jxL3nE/QBq1Nc8YuRUqLWjNsuEbZrBcw9OtzzT0sMrKcaMCrL6DIt23Ef9K
         +Kjg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq5w53uNfScGy7AurDV7JUGhPYJJCOJkVQk8fRJpRpw599HzLBCztr9sJ8M1MZPMTm4SBpKTp5l@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwuRSdhaIkzFZPR2RBPP7sNcXiJC2tvGVlH4pzlndCgLQORrXur
	1ogoQtx8rp0QL0WhOIJuTTy/JkNBXfbtt9o012S6gBr2uavLsGfPT+Lhj8AF46h+QG8=
X-Gm-Gg: AfdE7cncz1U77lCk7vQB+bpN1bUDi/C4O6rcCuN4izZzVKR4NJ9l1fKUxbpvuGCL9DC
	8fO96gir/TCaYYsvSB4WjeI2VusPPGF0MUBexHzIkFnzZzs4R33vOJWm/Dn7eAFkLI0asMH2Unv
	WFDgInVWUdsoW9gd+QHHYmOv9LBrh3stsrC0tIFTxbIxedvOW6S5fluteGtuymwOoxooDgxkRZj
	7OddMsoNVs3zTDIqaI2syG5702+NoYPb0ttVCUW11HQx1RmVASkqC6zEmFi7xmC/cIY5ugd9lZ5
	tXHwpLptK/GacqZW0J5YRTd37wxKyvGWnWjFb+SG1ThTLmSMz8kIUKOZjNV+OvHJ91Z5Tpwsun9
	DvItk7ShARDMZgrOvOIlNHT0ZFDS8uQRk70Cm3N+gQHi/Jb9Ngq/s5QKS1e8e
X-Received: by 2002:a05:6214:43c8:b0:8f4:4d6:8adb with SMTP id
 6a1803df08f44-8fec1d808a6mr146369176d6.22.1783701792723;
        Fri, 10 Jul 2026 09:43:12 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-900a7f8f5d6sm30725036d6.15.2026.07.10.09.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:43:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEJj-00000007Yof-1AFg;
	Fri, 10 Jul 2026 13:43:11 -0300
Date: Fri, 10 Jul 2026 13:43:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 6/8] RDMA/umem: Use hmm_range_fault_unlocked_timeout()
 for ODP faults
Message-ID: <20260710164311.GU118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345364975.660027.8790629832830633290.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345364975.660027.8790629832830633290.stgit@skinsburskii>
Message-ID-Hash: PGAPGUJKXDVTWWUWKN3PGZIHLIW2HYI7
X-Message-ID-Hash: PGAPGUJKXDVTWWUWKN3PGZIHLIW2HYI7
X-MailFrom: jgg@ziepe.ca
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PGAPGUJKXDVTWWUWKN3PGZIHLIW2HYI7/>
Archived-At: <https://lore.freedesktop.org/20260710164311.GU118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:29PM -0700, Stanislav Kinsburskii wrote:
> ib_umem_odp_map_dma_and_lock() takes mmap_read_lock() only around
> hmm_range_fault(), then retries -EBUSY until HMM_RANGE_DEFAULT_TIMEOUT
> expires.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes range->notifier_seq for its internal retries.
> ODP keeps using HMM_RANGE_DEFAULT_TIMEOUT for each HMM fault attempt,
> while interval invalidation retries continue to be handled by the existing
> outer loop.
> 
> ODP still validates the interval notifier sequence while holding umem_mutex
> before DMA mapping pages.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/infiniband/core/umem_odp.c |   18 +++++-------------
>  1 file changed, 5 insertions(+), 13 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
