Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86877C43458
	for <nouveau@archiver.kernel.org>; Sat, 11 Jul 2026 03:22:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5F5DE10F974;
	Sat, 11 Jul 2026 03:22:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="e5bR6NYS";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id CAB66470A3;
	Sat, 11 Jul 2026 03:07:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783739254;
 b=OKM6LXYqebm8vwDnhqChlH+XGpMu3bMkYQ56nJh0xF3jSjQABIi2rDWnaVNrMfDlcRVCP
 eQhlFDaLQ1aSnGT7Eqx5aC3RG0UxNmA3upvzmr5gAxpqzGEP7pU+yaIJExpMC3HEqXYbviC
 /4JcDkgFByEuBpvTb6la/k4sQyB+K75Z9PosPpLvgNdcaIAFAUz2/C03Gmpx5+ePqjwamsv
 dDa9D18csMLqobfzFbzLShBOib9lK2fQ2JgsgOZd26wQhS5K3pwgJ9+cXK4Lvqpqjx8d3q9
 oXTABq5VawPxI8ZSOfm7ilhUyrJdflfGEpNNZUxF5ADezbS6/MENouVGRZxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783739254; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ZoRTmK7mqG76n1GL0uhVSS5eZwslPyOiLYDvdkV1GQU=;
 b=rUOHGieT1+Mc+f7ffBwzsZrSy/Dj23v+Qs59mg+v8K1jWkrGuI6UZsaV5ihJb/hlg7RFV
 Nl2hNa6JXvk38I7q3yGEjOJyCF98c4ryp4vbj5Xu3mqrtL3qhP90sZESr2vHhL/9otWI8jX
 /pp2F4aFC3J7RJdYa6Oiw8VmE/jNhMhkJ+B8efq+mh8yv2GRrAqk8xkFqThtBQDMI2l6Xi6
 XY89aoc7mcMnCNBmUedj0TAL0HxjvmKP4IshXMD6kzy9p9FpmGP1sHoto5NlejJ7kNOPZPx
 J+xsqfNM94xay3c/Zcq3VaCrxG2MgVWPSfyZ/pqvaM1zb9/eeJtdIyiMvCHA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id E015B46BA9
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:07:32 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com
 [209.85.210.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 443FA10E719
	for <nouveau@lists.freedesktop.org>; Sat, 11 Jul 2026 03:22:38 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id
 d2e1a72fcca58-84862b0d5f8so1278256b3a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 10 Jul 2026 20:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783740158; x=1784344958;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZoRTmK7mqG76n1GL0uhVSS5eZwslPyOiLYDvdkV1GQU=;
        b=e5bR6NYSKzNvj/sq0whBg27T68e39DqxEQVyD/pUEVJ+h3Sw93VvWD24tc7BvA8JPg
         2QOEoBl5wsn97Oimi2lt+OGUQLwCKtdRdhFSBx8nSkOz6qp4d6SzJl+yNm62GKWxo41i
         dzpBNR8AAg19LUxiUU4EicM/G3Dh4wBRyFOMoeXBtpPeS2jla14fzc5VkqrMsYEnqaac
         Db+3XYJVQa76Tc0grUsD+0/f2/A4CMkwxGQ8mU3U1v5Nc6NWbj3vANmBzHWVw9t8Bl5z
         ZB1wTYRBtDrQwNR5P08moZkP3lPKl+fKsjXOCfVSmUUIedrIVeUf+dey/HKZedjHxpMf
         xWrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783740158; x=1784344958;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZoRTmK7mqG76n1GL0uhVSS5eZwslPyOiLYDvdkV1GQU=;
        b=Dsxnnl9lLHddk8z2OSEf1PX8zQM36SlLOiFdY82o/rltpaDktcbRxTJMPI6mgumC+B
         V3DB9LTu8IqLv1JVWwOZPq/KMV9+Ycx50S1IuAQLQW2we6bBIvJqL++yu2zrGbIjEKSX
         xm6CETOIl6bXCvjhDZIV/3p8Vm1oHGEm5ANOgFsk5ZhDcqSe/ynjGLf3sTIeSYsPs/X5
         sAhY6SgaHXu3vgb0bfR8OJvs2l11S/nNfhM8hEYzO8Ji9VvlcilUiX7YkVadZYJ11i0S
         RxqgIJUehTn1toQ+do7hqkZSPlfz6+jQvnvhzhvii5KlleTzC2D9SsZHWmXa2q22yuBB
         7kng==
X-Forwarded-Encrypted: i=1;
 AHgh+RoySYe7aOAFWC8bl01RDpspEKnWi7IXTUiR53qvD4F0/lwe39Adj8KRZAtJHzk5AGaZsXjmN36s@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yweh/u2yZsw/5+tfg9a6XSQsC4W7CS4nfpHs9tXhgM4dC3+DjIa
	u+SwEVIZJIpsdHa0FTDtbFckyg15+kko15sAQkIt9ImLJErkow4QNdHf
X-Gm-Gg: AfdE7ck5msGqcBtzJc6FGpR9cZChIRyANc4WeNdGF10LGQHqxO5OKR7CpT8fPUHNjkV
	ywXFn+k6KLchWaHpOJiSosiuCNiyKR1WFx8OxWLuSxAN4DmRtr1XefEIzVZbxzcj88AeWg37+ft
	BK8m2e3CFIZRQoCADSLT4/KXV791MX8oAFBHXooeWfeowXLNFQ+yT1pmSd0clu5LxOHb96IabBU
	p9zQUNgplOsWjkT9W61faC+a7SwjGBByT/zKIme3CSs865bunDt0NQUjt8dNKhJ27Du9mOcCLd8
	2onZKgCeJ37zm2cZEsNuR5GtrbYXIPnWP1tEkSERtZJACbt99YsOogH0lTuXQ8fWVM8Q/qyp6Ez
	hydRtLmMehTWws4HkXAvpZUsI6tprPfeUURNUSB3fI6PIaI1aRgrzEFmFSwIktegXm6ZeL3C3mH
	VMVD9SBGP/s2dEbpcoAUbguyocZXqeE6PgXhkwEYJfcq9ih8aguiNNrJY=
X-Received: by 2002:a05:6a00:2303:b0:848:2f74:1d68 with SMTP id
 d2e1a72fcca58-84889750a60mr1542258b3a.78.1783740157808;
        Fri, 10 Jul 2026 20:22:37 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-84856e7c8edsm3652647b3a.36.2026.07.10.20.22.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 20:22:37 -0700 (PDT)
Date: Fri, 10 Jul 2026 20:22:33 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 0/8] mm/hmm: Add mmap lock-drop support for
 userfaultfd-backed mappings
Message-ID: <alG2-RSitzPWClAX@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260710151151.1e193eedd0cf2591ae392f76@linux-foundation.org>
Message-ID-Hash: QMOC43RBVWBH76LN4C3L6J2Y3EG5NYOH
X-Message-ID-Hash: QMOC43RBVWBH76LN4C3L6J2Y3EG5NYOH
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QMOC43RBVWBH76LN4C3L6J2Y3EG5NYOH/>
Archived-At: <https://lore.freedesktop.org/alG2-RSitzPWClAX@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 03:11:51PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 14:26:20 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > This series extends the HMM framework to support userfaultfd-backed memory
> > by allowing the mmap read lock to be dropped during hmm_range_fault().
> 
> Thanks.  This seems fairly mature and mostly-reviewed so I'll give it a
> spin in mm.git's mm-new branch.
> 
> Unfortunately Sashiko wasn't able to apply this or v7.  I'm not sure
> what base you were using.  Hopefully there's a reason for a v9 so we
> can retry this.
> 

I rebased this series on top of mm-new right before sending it out.
Should I have used a different branch?

Thanks,
Stanislav

> I have a few niggles, nothing major...
