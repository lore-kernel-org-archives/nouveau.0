Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E569CD3439
	for <nouveau@archiver.kernel.org>; Wed,  6 May 2026 16:48:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14E9010EE3B;
	Wed,  6 May 2026 16:48:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="o3WSAUkA";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B3DDC45DFC;
	Wed,  6 May 2026 16:35:21 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1778085321;
 b=ubovUEjaVQfLdx1COhTY1bCHJmkRxLAPbksChTM1BZxdxHYd2oTLZKSA5mxk8K30c+kr8
 IchxZs1YKEAfTuVmbXRGDjyGgG2SBlASGe6IdZ5dKTu1dxH5Ya+3i2vQb6KLDA3IvKeIwoh
 t72ZLbPq/NfHSqGt6QC2VC+vFtvNnn2Bx3Wr9CLDoDtWGr3kMj4/x950NqROEeGpSRoxOAT
 tuj36UA5fHCm/ztTsG+d4w6FJJHxEOcbZPGGI8SgKWSS6L7T62DrPUipD3S0s7uQf9czFaJ
 vZedg/qg2ARf0nVqv3pbrqKTTi7GIgWrUeBDUYR1T7izOn0AoKgGj0tazu8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1778085321; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=BMbRicsmqm4MzHYDZN/YERLhC9G7DFrPOd780YtnKHs=;
 b=TipgaFBHyo5w6Vj3XcpMEo/ypKf3mczQHmVBdp3Kbt3V8EFjfUEyVVV6WaRQO52Q5Snex
 9rd8XxGkhwdnI4wmnTwXA3IwilDuSUrT+6xd5t5+pF9EgO53R0EGJiL9n675KhugxVYX93Y
 E2aJBbKd6ldYNw7jygZn2JDgJPCwC/yHuwcDHP/fpszF2tbHIqBISl3I0//gRG6N1/LZjV+
 NlLyMZuzSks0/COFkTCUTSCZxk4p0soNQuYH+7CPbRLv//qbG/vkMtH2eqoGgY6JNTWajiV
 CebWzdGx8eKD7o7rePoK2pcw0wl6OLXGQcKEDd1UU01BSUbqiTbXUZfMkg7A==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id B117D45DC9
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 16:35:18 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D276D10EE37
	for <nouveau@lists.freedesktop.org>; Wed,  6 May 2026 16:47:58 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-35fbca04006so3487216a91.1
        for <nouveau@lists.freedesktop.org>;
 Wed, 06 May 2026 09:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778086078; x=1778690878;
 darn=lists.freedesktop.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMbRicsmqm4MzHYDZN/YERLhC9G7DFrPOd780YtnKHs=;
        b=o3WSAUkAP6iVjc0WeiId+OToBAn2KmqqkXZYG7VY4SuWtMatkLg6V873DuQ/YJHDfk
         GV97E3lqtYYHPDO3jbkiaxb7ZjDWW1eEPYW4XQqUgVjnqoEIy5XfOU+7MZp0VnXJSFWp
         1Ol+Wbq+hTMkUIgSvAF/otz9T9HdvbI65ewTWn8ftx8yil7PyL+viLnWMxm32KtjoqDS
         JzKgLt8gTnuSMEcduYEOONnAr1FI8f4ydXzM4LWUsl/KMXmVAio0k+73mn9sqPBPpuKQ
         CxjMZwUOTctHZDfHLGAqddYD85E/3YXcsTysueQomlTCQzCNAEGd5u41t/XTae+iYGsE
         S6Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778086078; x=1778690878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BMbRicsmqm4MzHYDZN/YERLhC9G7DFrPOd780YtnKHs=;
        b=DMzkWYZvDM3456QF0cXDRV+ELaCiji+YtKNiRjCOL4gwtMvTX8kOBBRxtYQ9qwvZyd
         0vXmJK/4glfAEWNRAlbDz8jrSCbyvZuFkNVcgEYCPP06uLhmShMe0f8/6DaYb+UlT0qo
         xAxBEqdtEfHYhzPFWwl5CzFrruV9XUApDk50O0ruGka8JmgKxKmk97B8idVXtp52XQS6
         LV26fFcMcbX0UqJbttaYH8B/c0nzUqzTMqNoNqL08NQE8XXRHaiQZG9eBdc0eq/UFRyb
         K1Fs/XXX2Yiq5kVJXm4PN87kpkx7YVEbxzGK9dRjO/8uvE18OqMvmynJOIdRDKm+6tre
         K8ug==
X-Forwarded-Encrypted: i=1;
 AFNElJ+q37TJiPDxPtBPupPfLZRQ9Y1mANksrZsEgzZEaX+DB1tAzf1doV1ylUD7SGHtHGm2GWMjVuVd@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyp/CrF0VGIHKRqG5tP3AUJeWns+3BpA/6F9cmVj8Q2/rh2ZXbO
	lu/2eipOXV18WrMKMhM5zd4p3rypnM8vEVadb9G7qCn0wcRKysNGBokB
X-Gm-Gg: AeBDieuXkMbM4MNeZyKouWuixiU0kAA+iUtwDTE8H0HO8LO40jwkG2jkhYVgSuxCMQk
	TYl7EIlCnARvjj7JMGqII23uicQ2mcNBTXCQHs7vv3BqA3nN4COUCm79chF9ThzBWEmtCUdHI0O
	nupMLMTdDOlrNd+8Sp9woYcSl4N7kscpSimWJZMWKP9PAz3FGJwrSgGAcsUfqSpCYiRwKip2fOf
	O/WExxpINCbPtO4HJcgDdldVAz/grd44xL9yqyM4UH8fpA/dW8TDP3BKLfmGT3aMJinA+zliaH5
	EgkDs2lyTzJmnuuukqS6y1rQdfD1lvym3rILnXydnH3HTVhjhqiOIV80l835kovc9wtcX9id+jc
	2XWAMbioyyzhktaGNV+wAWnerkJYFRBTT+Vh5MvluF2HZqbHHFzpdKdhofS6f9ZVEZOJoMuD6rb
	BnFICRj+rvdmGauXT3lIQ/cSa7FTMehep+aOhwgwS8jFj6ZmbCpXMt44NpCVYxp4iGjlTcDoOeL
	bh8dvhd2OkqxMUc
X-Received: by 2002:a17:90b:1c8b:b0:365:a5f6:4a5c with SMTP id
 98e67ed59e1d1-365ab9b8c92mr4104026a91.1.1778086078112;
        Wed, 06 May 2026 09:47:58 -0700 (PDT)
Received: from cchengyang.duckdns.org (36-225-99-238.dynamic-ip.hinet.net.
 [36.225.99.238])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-365df6f88cesm1024275a91.3.2026.05.06.09.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 09:47:57 -0700 (PDT)
Date: Thu, 7 May 2026 00:47:53 +0800
From: Cheng-Yang Chou <yphbchou0911@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 1/2] gpu: nova: rename drivers to use kebab-case
 convention
Message-ID: <20260507004701.G4851@cchengyang.duckdns.org>
References: <20260316120820.2117081-1-yphbchou0911@gmail.com>
 <20260316120820.2117081-2-yphbchou0911@gmail.com>
 <DH56PG8GLW4X.2QMHJ91J9D29N@kernel.org>
 <DIBP25O5HJ09.2SRQU8QS7VUDN@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIBP25O5HJ09.2SRQU8QS7VUDN@kernel.org>
Message-ID-Hash: IOF5HWCK4RGNKCSEHNITR3FZ4RLFTVKK
X-Message-ID-Hash: IOF5HWCK4RGNKCSEHNITR3FZ4RLFTVKK
X-MailFrom: yphbchou0911@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: Alice Ryhl <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
 Gary Guo <gary@garyguo.net>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ching-Chun Huang <jserv@ccns.ncku.edu.tw>,
 Chia-Ping Tsai <chia7712@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IOF5HWCK4RGNKCSEHNITR3FZ4RLFTVKK/>
Archived-At: 
 <https://lore.freedesktop.org/20260507004701.G4851@cchengyang.duckdns.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi Danilo,

On Wed, May 06, 2026 at 05:20:58PM +0200, Danilo Krummrich wrote:
> On Tue Mar 17, 2026 at 5:06 PM CET, Danilo Krummrich wrote:
> > Can you please move this into the second patch. Additionally, in the second
> > patch, please only keep the Kconfig change and use the following in the
> > Makefile.
> >
> > 	obj-$(CONFIG_DRM_NOVA) += nova-drm.o
> > 	nova-drm-y := nova.o
> >
> > I.e. keep the directory and filenames as they are.
> >
> > We can use the same trick for nova-core, so we get nova-core.ko and nova-drm.ko.
> 
> Do you plan to follow up on this one?

Sorry for totally missing this! Will send a v3 patch by this weekend.

-- 
Cheers,
Cheng-Yang
