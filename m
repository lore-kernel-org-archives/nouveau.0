Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11D9DC44501
	for <nouveau@archiver.kernel.org>; Fri, 10 Jul 2026 16:43:51 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CA7FA10EF83;
	Fri, 10 Jul 2026 16:43:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=ziepe.ca header.i=@ziepe.ca header.b="CicP3Gt2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 497674702B;
	Fri, 10 Jul 2026 16:28:46 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783700926;
 b=CW0/lEpyPCIIQv+6ZqI3mL49T1cP4qaIZncYFOYco+qQbXWJQbAz6PNu2/pq+j5nIWpG5
 tWntAiKAf0rCSbSPd2gBE/2DiggBu5PDAjBiXaj0Wubq/2D8ZruBkNa1Endf/kqGe0z864q
 w8kDvQtCjJHPLk6dtbKtH3FcEeqApZBiB+ZM9hmWT3/ALAvcxHagzPQ8u1SsDoLa/UNaUbW
 DxxlOXuxiSVvuuUIKAMBYr7WymQxInjnB1UPw6iIeYSQmxWc3Lao3Sd6naE6+plsMvs9IP2
 oA14iScTa/6eqJbuBvhQRT7i/Zz+S6fq9ldaszGLDOnmpyB08vT3C4JWY6+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783700926; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
 b=Fo04qnTY6NP1jLp/nTLMiXBawfWx6XUR7SesCJmyF1Xfccd6+6NWny6aprXqHeF46GYoJ
 XoLLCZhKjuIKXmjD/95E5sMVyL9m5Nn1GLsIr5hu6pSoz2+mmDaklSV1TCeiTV2JH+smhRH
 /hN9BEWRhTkOhmgdnuukL3y0elV4p1AhCoXUZTt4F56gyml1me+f/Q335B9J7zRF9hniNL0
 ka1tmumZcHGTxAx6+LxUue1i0DkBLFjy6iyAaQ4n6kirsXhCymsJ4XqSKKM6xc922pBGgZw
 DCi+xjMHLAbbzTbY96tKOow3ge1B+NIDQMomzelNEUGxbQT6skiEKvqaqrHQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=ziepe.ca;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=ziepe.ca;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id BE8A94022C
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:28:43 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2672410EDB4
	for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2026 16:43:48 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-92e51d3d83cso57891685a.2
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 09:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783701827; x=1784306627;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
        b=CicP3Gt2JIGJE+0qWQ37B3XYL3R451qL9WJoXHxOYILV8FNgzGcs3OCqWkfArce07s
         Qkv9Uckx34BYNwkbmYb1qn2pq2iIW+qHQ6fQfCuJAr4ynWsqXa62pZEWLr05/gGvHKRx
         YvGKZhYH1u46QBnsYa7PeTqtUfXV1BAjZQhCpWPY3L6IyHrVQKiAaDdu7wd/D8l0uj1Y
         ZjiSjk2jE9YB7oSDB8w12wudY979UL43Y5KwN/tmEmvMYK2k5XW+DJV7GezM2g8a3PEZ
         zfXgSca2hHY/LXoGk+pL7oO7NFObhaFN0vDnP1VJ2Vl9RSYrgZsTX1W7A1LeZGvLuqqv
         U5jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783701827; x=1784306627;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WXM4slhr2CFKJAVwVD2VemgO6fJY6jlNQ4kyqua9fHY=;
        b=YYmPRazJoi/ZYtQ2qFHLsDo8svYsXe6u4gw4FFYXQyvipclmRs5d+9i8IHIuCKRmjy
         WG52wcBRUaCdFt5666+7VzU7uNEMK4nK7L4YaomqYjaYgSAmtM1ZtJZh8y7iJIcUGNP2
         GpsqPHr0CUJUGnHsWr/9U6mhXlKJb7pX1/6Eh74UgdvCLLDK8xhmJ1uyTDoBGWb2Pg+c
         3BkWhaX2ycwDGvH+NWtr8EB4TeEFZBt3bAfC3oHaa6qrhEamync1l6mzYmzXOJbvu4j2
         L37SGEdOaUsQsF+YFYg22XeEZBaD/nmegeZtO8RTAFHUnG/NUJhSzPDHEXZ2mMkgP3Gf
         4VPg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rqmrr0fAjGloiuIDsgkw1oTGNx8vw4aGQDushB3g/DXP2peOBE2R+a4zxO2xJr0V59Ow1O9J2Vr@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuzD1KE7H8Fzc7Q5pFSYCKq4EbvMD4++KioZYFjWxdNKmnbcUx
	oLRk1l9mR+SOtxGm4GnAla9QRliaHQUzMiYrmww3S21j4yMKfOR1yMLmXihN+t3u2pY=
X-Gm-Gg: AfdE7cl1ff+Ux8v1+O8xAC1EwfA35qmJBCnF0rD6g4nVxBpIGGQ9KNEmVid14i+qYW1
	MORHTSrtZxwtrGnI7LlDWS5E2vZZA1O0CJbAXisDnJbpstT/3uARkGFRvw03JyP9VpswtnxnSq1
	OiEhZsVd06lji0MMFg375p+9BNd2KIKG/jASpVtahnGdaKFVOPSMmuGr5cdoUQEApN2Sg9dWwDD
	7IhNpXqIwxQTItgq5nvlMgpUPHGH9XEbuG6MpxxnDsLi4NuTyyxWngTBifR6XPvFNW6ucpA060I
	IGR+TNuxqKkqqBuCDkysx9GfVM/ip/1G1sWjqkfVeLQA4jOBK7WVaP3wgP/fIGtqdbonPAFIV85
	y6bjPi53ar4G7CVpee0vtMvB5pg2sVMPeEXVbs4tkQMqKDUEuwjRE9TdCLVk5oA094Gg2XtA=
X-Received: by 2002:a05:620a:240f:20b0:92e:e569:dc20 with SMTP id
 af79cd13be357-92ee569e3c8mr347342685a.78.1783701827057;
        Fri, 10 Jul 2026 09:43:47 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-92ee59223e7sm237517985a.0.2026.07.10.09.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 09:43:46 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wiEKH-00000007YpZ-3qzk;
	Fri, 10 Jul 2026 13:43:45 -0300
Date: Fri, 10 Jul 2026 13:43:45 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>
Subject: Re: [PATCH v7 7/8] accel/amdxdna: Use
 hmm_range_fault_unlocked_timeout() for range population
Message-ID: <20260710164345.GV118978@ziepe.ca>
References: <178345345668.660027.2952911919681614557.stgit@skinsburskii>
 <178345365679.660027.16671418103486907555.stgit@skinsburskii>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178345365679.660027.16671418103486907555.stgit@skinsburskii>
Message-ID-Hash: AN2OQPHWDRMNNFLP2SDRDUMMDUUUUXXH
X-Message-ID-Hash: AN2OQPHWDRMNNFLP2SDRDUMMDUUUUXXH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/AN2OQPHWDRMNNFLP2SDRDUMMDUUUUXXH/>
Archived-At: <https://lore.freedesktop.org/20260710164345.GV118978@ziepe.ca/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, Jul 07, 2026 at 12:47:36PM -0700, Stanislav Kinsburskii wrote:
> aie2_populate_range() takes mmap_read_lock() only around hmm_range_fault().
> It keeps a single HMM_RANGE_DEFAULT_TIMEOUT deadline for the populate pass
> and retries -EBUSY until that deadline expires.
> 
> Use hmm_range_fault_unlocked_timeout() instead. The HMM helper now owns
> the mmap lock and refreshes mapp->range.notifier_seq for its internal
> retries. Pass the remaining jiffies from the existing deadline to HMM,
> while preserving the driver's existing outer loop for interval invalidation
> retries and for selecting the next invalid mapping.
> 
> Keep returning -ETIME when the retry budget expires, matching the driver's
> existing timeout error convention.
> 
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  drivers/accel/amdxdna/aie2_ctx.c |   17 +++--------------
>  1 file changed, 3 insertions(+), 14 deletions(-)

Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Jason
