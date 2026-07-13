Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 390C1C43458
	for <nouveau@archiver.kernel.org>; Mon, 13 Jul 2026 16:59:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3166810EA47;
	Mon, 13 Jul 2026 16:59:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="aFJqT+dX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F1C1E46FBB;
	Mon, 13 Jul 2026 16:44:11 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1783961051;
 b=aNKEsg80SISIs8d8GxP+j9D88FwyY4ih/ZrYehgtfkxydmMpZ6WXcDR5purEtwt6dxqX8
 HBltCjei1v0uxdoeeMiIHyEO9ZN98ASWsjDISKb7Vdwf/9dDZwnknD9C8EG/STYTF8j6XS0
 sjNQrbufyePPbKO3tbWIJqHDqwgwqDKwz5OIGW6ESCpqzVFeVwf9NxDMxWzsx/TqAYq9Wpm
 j1sa/91zmWnlg12RnhY/+8KcCCga70EBq+XNvF/5hINEzsmzfys/BMDeD9GJ2EBQ3dg5egl
 GdFF/6rvB5ZxnFQHcJUPOfhQSiHx/jaKENUp2p8mZCUDitiU54UEPrEj4YQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1783961051; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ntUweueTN5fRqaQOoy5Hqmcgc1LaFPt81cAcvUtqRRA=;
 b=IrTHnhdaayd+veE4RNIhQDvvItQivyEwBRUb/ZuXoKhpMxwzoNnc6PzsUXzrqPiA1GJqL
 8ND3TRBhQmv50nOW9Yn75vwU1jXlBQ4R+vN5iuAlhorc8D6UABf1fKJTavyyhc7VPlA3K6m
 43MjKWPdkn79Sy9rpZtLyiChg342WmZdtJjZhBVu2qC+Td5or6oqyiFB6zf7Jp/zewfmqmu
 BybSjmBkECGyjaH4k+UKEHApvUD24FDtQrg4Y5/UaIPTYBXA7+SYmPb32RGxaZdb7+o7/kr
 EHv/hxd3QBSXIYl/mnt6btU2SnCPypYSPqeXSXsjeY8zuV8nA5rdSKV7VCKQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id AC26B40F03
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 16:44:09 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
 [209.85.215.176])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B4CBF10E629
	for <nouveau@lists.freedesktop.org>; Mon, 13 Jul 2026 16:59:20 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id
 41be03b00d2f7-c9cf07d2df6so2204808a12.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 13 Jul 2026 09:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783961960; x=1784566760;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ntUweueTN5fRqaQOoy5Hqmcgc1LaFPt81cAcvUtqRRA=;
        b=aFJqT+dXuuGboFsZSwoJnHWjFRHS5fCNMiU5u9SmvrrYVYjXApZMUVoQzxhj1/11wA
         7OXUzhVieb25IBuwid6MBcKMjvJY6Ffey6J3zu3/6gpEN80B81Ruub2Tb7SpTUzr0Wdj
         ga3tzPcUDMRihri1yY5btb9w0ONABObAWBo6QCWyj7ap3zXPoNecoLMVG/jyB0nMvNR9
         3+f0xdEsJBwgRZ5jNBdhWjJ/2WejFiVlzi8nYurwwpH32Uvb0DD80fQCkILZF+AemB3R
         dydjxM2NFmYU3FzVFbWtiZAJMgNcL0Ytyzaj90UbcdvgrgpKzbxgoSD1GdwC/ov1uFpI
         j9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783961960; x=1784566760;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ntUweueTN5fRqaQOoy5Hqmcgc1LaFPt81cAcvUtqRRA=;
        b=Pu7tr7exMZmOFxsk5ni1Y/5+j9lCgbyVPpJK6Ea00/BxAXlj7t5F79iaqN6IwGjHb/
         i9+aBMMfEGGk6SfAl6/5hHQlGzxxfyyKEmRSJnq34ZKCZBPPOsHl/LAIGWiBYVtJcGcT
         GK16Gc4eT/A8OAHWfaf9D3jKo5V4ImE9+RKkLs0ZKHut19144Fgy/qkU6Am7uz0cjT3a
         GDPtqBxTWYmwj0R/V2fxcpE2ENbn80CfKJblryzSH8IB4kJTZwe/ULG6i2zPcKGB2/UZ
         nneQWqxcFWh4fkyl/N4p4OmFnzUC2fP3TORIwl8VZQkU1QH+9wzVK2foB9flXkieuN/d
         ismQ==
X-Forwarded-Encrypted: i=1;
 AHgh+Rra5v0RYeIK4Kn1EFAkPzcAe42qPF+kxBMtj3bxOj/CRT30yfhNMdHQl55pSfVI19D4+syK1/3o@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxO24R50uBuPifNHRxbS5Fps9y3HHVzQDkz/xiD94Q43D0c2Hkb
	rUrRIRGjoYmd/2g30As76pPxvMlsVYgTFwcjX18u9e6WDVBQyg4Nd2Do
X-Gm-Gg: AfdE7clRx1KwdDFp19LBq6GZnQj6bJlwKhRqTwAbgUADKS8Df22lO7DHBuFwpy1YcR/
	U5GE0qLVIsDOr4AryMqWlu3oQxoOJ02y0IAsysfUYLRQnZW3hac6vdtpIpQMpalyh6aQedOZYhg
	bZ4lDgReH6ZmJZgcVAzREibZsuNzyL6+NrCiCJU155XrI9tdZWT3ItO0fL1JykSUNAhhVbkeC32
	Cd29iJG8IHA3hPpKX9/Wkgazus+9+YxOI0nmTCSXqhCN+o3CL+xMUwrdrmTLHZFNFv26DCYj2M0
	XTngDVtboXC4PHxsuS9XotGUOHi14uQxDO6yZGL8jorN7xU4viyxMbmfVnYO8RnIEtP6mN6JZvd
	PVv3dG4JCBTWKQqgLrNdi4DLDfFd/LT6XEXBPkoUD7e+2dJ1dLiK5iAplBPQOXfPbHFeT6D3TEK
	VtaY7z+Ya4hUhJX+D0ZVmQQThrG280Urx0N8i7rAiEx05OJl9q0NYQVbA=
X-Received: by 2002:a05:6a20:c907:b0:3bf:a1e5:ff62 with SMTP id
 adf61e73a8af0-3c110cdb078mr12110955637.47.1783961960162;
        Mon, 13 Jul 2026 09:59:20 -0700 (PDT)
Received: from skinsburskii (c-98-225-44-182.hsd1.wa.comcast.net.
 [98.225.44.182])
        by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ca5afbc1208sm8643053a12.9.2026.07.13.09.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 09:59:19 -0700 (PDT)
Date: Mon, 13 Jul 2026 09:59:17 -0700
From: Stanislav Kinsburskii <skinsburskii@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v8 5/8] drm/nouveau: Use
 hmm_range_fault_unlocked_timeout() for SVM faults
Message-ID: <alUZZYIPY-UkhpY4@skinsburskii>
References: <178371866223.900500.12312667138651735591.stgit@skinsburskii>
 <178371881847.900500.8789369230260725500.stgit@skinsburskii>
 <20260710151222.ddb35eab9c81a8720491464a@linux-foundation.org>
 <alG1k3JsoywE2CBM@skinsburskii>
 <20260710224833.9caf2a0a9906f0515e326a45@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260710224833.9caf2a0a9906f0515e326a45@linux-foundation.org>
Message-ID-Hash: W75U6RSBGRBEHUSANI3V5AD3LZG2DGJU
X-Message-ID-Hash: W75U6RSBGRBEHUSANI3V5AD3LZG2DGJU
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
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W75U6RSBGRBEHUSANI3V5AD3LZG2DGJU/>
Archived-At: <https://lore.freedesktop.org/alUZZYIPY-UkhpY4@skinsburskii/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Jul 10, 2026 at 10:48:33PM -0700, Andrew Morton wrote:
> On Fri, 10 Jul 2026 20:16:35 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> > On Fri, Jul 10, 2026 at 03:12:22PM -0700, Andrew Morton wrote:
> > > On Fri, 10 Jul 2026 14:26:58 -0700 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> > > 
> > > > @@ -683,15 +683,11 @@ static int nouveau_range_fault(struct nouveau_svmm *svmm,
> > > >  			goto out;
> > > >  		}
> > > >  
> > > > -		range.notifier_seq = mmu_interval_read_begin(range.notifier);
> > > > -		mmap_read_lock(mm);
> > > > -		ret = hmm_range_fault(&range);
> > > > -		mmap_read_unlock(mm);
> > > > -		if (ret) {
> > > > -			if (ret == -EBUSY)
> > > > -				continue;
> > > > +		ret = hmm_range_fault_unlocked_timeout(&range,
> > > > +						       max(timeout - jiffies,
> > > > +							   1L));
> > > 
> > > "1UL" here?  I'd have expected min() to warn, as it likes to do.
> > 
> > I'm not sure... The "timeout - jiffies" can become negative.
> > Won't 1UL convert both of them to "UL" and thus make the comparison
> > overflow?
> 
> `timeout' and `jiffies' are both unsigned long.

Yeah, I’m sorry for the sloppy wording.

What I meant was: will "max(timeout - jiffies, 1UL)" correctly handle
the case where jiffies < timeout?

Thanks,
Stanislav
