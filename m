Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E04BE7FDE0
	for <nouveau@archiver.kernel.org>; Mon,  2 Feb 2026 23:39:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6CF0710E446;
	Mon,  2 Feb 2026 23:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="wDevap5+";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2784041B0A;
	Mon,  2 Feb 2026 23:30:36 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770075036;
 b=a3WY/RNEop+MMlpUtHGLktzEkc7Xai3IKi8G8ky2jYhLiQOP/QjMCh+dypJJ0+V3EHnVv
 4TaNwBXqmcRt7liH7FJHBIbnuxjp/v7+4npeULC8wvHynTkgGAyfSW6Oqu9jnBJX8ndB1Lz
 XtedQTYQ8BLwvtmQ/r82qyHxU9aFiho+p5DNaBpoJXyBag/tuR9O7fAqzXNwzp4ZNmZKSZ4
 SVrCkhGP4JHre6rYYpupRyqpuQjdP/4lHVhjZJ7JMDML2d5xDxSUHMYQZQdpMahOdiZXGDb
 znYNm3r2YUqXNTCNftDj0CmT2s8bQbQFQB1IuwwNFDdHwBH8NlpcWy4wKRjw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770075036; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
 b=ukHPwOMaAcmcqxUFYIE2gXXH1FidqDD3gkzAEu/PNNzKrCeFGm0Xv53sALCVSy7/NU8/D
 Na9cuFcScdhVr125Kpz5KQ8VI39PWMNMCTa0+Zm7s4+s3XFS8d0GWqRBBL2F9ALddwqn5h3
 6hNI/EiqR3VkryNNucZNzc+l3D83jUd7c/4/3bhtUYXGBFV20V4SoqqXPQqKlZb+KA2v0D6
 v97O9VWWhP/WuBWM4r5DbO6+mxmIylMcGMtH4lcVm8IZf242tXwOhbxI05bmWyN2FGu20r/
 jr+A8KKwMu4bk5jPGYlO1A5Ehi8JLSPsJPdGjJYs3LHAEmVMoVjcvxC37Hcw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9B1734015A
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 23:30:33 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5997710E40E
	for <nouveau@lists.freedesktop.org>; Mon,  2 Feb 2026 23:39:47 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-65814266b08so9925661a12.3
        for <nouveau@lists.freedesktop.org>;
 Mon, 02 Feb 2026 15:39:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770075586; cv=none;
        d=google.com; s=arc-20240605;
        b=EkzTrb23R8WlBGDUx/z4ukUJkT6cSZrZwcfgBQffv0wUIZmRcBAVw0ExuizGFMl1sG
         rxplFf2+RSss5V0P506COcLTPLxOWhi2N/9v3UHTnZhxy9OTP9xZUikLsRusMmycJ3TL
         cWK2DtlR4ynXMvO0SbJ9nENCuSPZXkCMqXusEAyIHNSdAfZFKQFekg3K36f9ummIh1iu
         Q0hH+OxJsUNysurtO/qGlCThdX701vrp5zQBogYLRLD5iilZcS24d4jlKCd/Iu3yGIV0
         +eO6N9OY1yX9GIpA4hoXgfF4PisW9eNx9Wci1f3heRcgXIKNb0IinNBW4lFt/17CKbD6
         q3Bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
        fh=rSxzNrXwy4vFuadf3cRAtorNsMQYdYB6T8y+cdPSfcc=;
        b=PBvJul1ysYtwXa715XlJFT7Tv0VHkxzK0HnrX3PebF2yy1yCSDJffjnmeKA5T03rtf
         yJTjJGlrAonG10ZVJfc6o+8eaaXzM8ZS5AVgoH0dwtsyAEVJynpyM/Pv64rWE/shxBBW
         wRc9a1Fs3RAGJitoA54/2n+QBR6TH8/hdAil1fBJvZcnF86ScgTYvOGSMUUk0WIFVh1X
         Wgpw6+XRfrF0YSlYabB9wXyHJ/x1DqvE5jVaXPbDQBihG7YOcBR3RiKR4wDfRIAMISaZ
         MVVl/SRITadCBh2wHj9cYrKN+GefAQ3OrA90zPXtiV81W5pFHrdvLbPgu73A03Cz8PEp
         uxoQ==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1770075586;
 x=1770680386; darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
        b=wDevap5+mwj7eDCTyGkkJax4sHtRrg58uz4ojO7fCZ3dreoiakcBgoYKMZa/X7knDx
         IeXqCJXLiKWr1w1nnd5tHJ1PpEC3tB6FkNpUZPsbL8OGBR2tnouBJSeLjYpzpxqoKyhc
         yvt/0/MWLSeBjRJ1vBb3zhZE+IjDeBipF0z8H2z+F8OtXRCyDykpCmq276Rr3JInNXWo
         mSBAKdK61beF29XMP6zM+xlEJAJUTVXiYJHoznuBvFRxTM9lum8EzeMcv1IKmgLg/CW/
         A0y/cjNiifeEFRk6YBAhkicz1FcXxnsdmArwr+qm9mPvMRjVLKhjRnTlSRkzfdR8DCZs
         TP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770075586; x=1770680386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTJVlTXZf0jwUnohGdUIElqTyOY3pmo4nlrgTREuxjw=;
        b=NcwFSfCXQin5irgkQ7u1KMEcycSyAulnW9Hhhj3AZRuZddK9j5QOzpcAle98TjkgbK
         oyRnAV2ZQvI4QLRfGqwHNDLKLa6X1hE4MaFtFkWz4YT4fEna4mvdeLNj78kEzkyr/jpx
         E2RhGPYsxVkV5MyNcnNWVbZc5BlY8Ub9XDsX42r+0XJfFCDf1rLJi1Dz/lylJB58Wwvr
         YP3CK+Uwj6bbSTfOZKOdb1eDHcCCkni70YYml3JGgvBYNEoPgyrIBBrMt98WRM7hjEcD
         dEHob6euoCMVS8YZ5IfzD/ATA9Srs3/fETHQIsqSXPdDSFvuFgvnWJsU4cP9KMzOXBMC
         VAkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9eq5N8hsoFWrRV3rqmqIjy4K2+IlTLBUVCPvqDVRDzh6rEwjjSDGN2fjmqF9bzZAVgXB+w5lb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxsjnUQ2D78h7dZKe9EC1puZRFPCClVNTvj7sy7lA4VMhN9ljIw
	3Cbvt7kfED6tjMcGRWvmISTKBV2+yJBQv7yErGmKlj6NoSmgD7ZAcjf7+KcUa8QKEOKREsMwgyM
	mS3sGW3P643wuEgz04cSDKAR2ifvI+mQg0AvdVWdpzQ==
X-Gm-Gg: AZuq6aJNCNdb0+lIogJHdTHzUSUKsDqfSEE1MIJIj2377NSaOnikbhI8I9//erZjYMB
	CHWggSmpL1/mKTrXLZbwjtU7k1JFmCfYJnCshUyKRja3H/sfrqyNoixeJNcX6YBIP+0c1pvmAqw
	QXkiXaEuxeO+7R9IZCQIYwpAiL5GRWOdxpg6HcZAACu2qHp26g8zrP1qKHt1tctw3ngB0uyRb4v
	JnCrN32jxjyS3SfVmjTW1iiFu2Suwh0Jfy43bnTYfH4Ykm6VIGq76peoaNg6ambDak8VGD+
X-Received: by 2002:a17:907:d1f:b0:b76:63b8:7394 with SMTP id
 a640c23a62f3a-b8dff793326mr811057966b.51.1770075585598; Mon, 02 Feb 2026
 15:39:45 -0800 (PST)
MIME-Version: 1.0
References: <20260202220402.2217813-1-airlied@gmail.com>
In-Reply-To: <20260202220402.2217813-1-airlied@gmail.com>
From: M Henning <mhenning@darkrefraction.com>
Date: Mon, 2 Feb 2026 18:39:19 -0500
X-Gm-Features: AZwV_QiupyyTlsy3i7q-XlPZg5ZLkEihNGRHTrovNO1BWwCoVC562zsqkF9XjoU
Message-ID: 
 <CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com>
Subject: Re: [PATCH] nouveau/vmm: start tracking if the LPT PTE is valid. (v4)
To: Dave Airlie <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: IUOM5PWAGQD6OXECGGDL6FTOG6KVJ4DM
X-Message-ID-Hash: IUOM5PWAGQD6OXECGGDL6FTOG6KVJ4DM
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IUOM5PWAGQD6OXECGGDL6FTOG6KVJ4DM/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh03m1Pu=uNPtqGpP-y1PAqNUvyUvo1-K-qP5dHzrh3T1A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This one seems to fix the reproducer shell script in the description
of https://gitlab.freedesktop.org/mesa/mesa/-/issues/14610 on my
machine

I'll do a cts run tonight.
