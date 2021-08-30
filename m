Return-Path: <SRS0=D34Z=NV=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43253C432BE
	for <nouveau@archiver.kernel.org>; Mon, 30 Aug 2021 12:17:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00BAE60E77
	for <nouveau@archiver.kernel.org>; Mon, 30 Aug 2021 12:17:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00BAE60E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65C5F89AEE;
	Mon, 30 Aug 2021 12:17:13 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE72B89AB3;
 Mon, 30 Aug 2021 12:17:12 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 608E5610FB;
 Mon, 30 Aug 2021 12:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630325832;
 bh=tFvVHHaMT6FlpbVDOckw2bd08wQ0Fl+0KjyQgVzmY3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oMjVfd3wgG6wqDUbaNgLfLsPz3zM32dKy64W5urL0GCkXgmiM0LrLMU3MoNQiXDXc
 JsO8349ziptSjBteMiE1WofnvbNNaB+MNzUqZRJEXQBNSTgGvwylMIZAkU3EkMoe1D
 QW+Q/+ewl+bE+avsGzKgWBLCqzE3QDJeepxVgJyBInc3E1g199RegSPXTSBNH0hz0s
 kxtHDRz1z9AeEyQItbgzRrYKQU7AxAAcd6v6iaJiNVKt33F6aiVh1egbz6hTtm3zPC
 7HWD9TRl0u+z5daA/qidwz4Khr4uelQd43pTN78T9f7KTU8Vv9VNmVokqaGGVeQ/ZF
 fPHMunvXk8yWg==
Date: Mon, 30 Aug 2021 08:17:11 -0400
From: Sasha Levin <sashal@kernel.org>
To: Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Message-ID: <YSzMR4FnrnT5gjbe@sashalap>
References: <20210824005356.630888-1-sashal@kernel.org>
 <20210824005356.630888-20-sashal@kernel.org>
 <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <6607dde4207eb7ad1666b131c86f60a57a2a193c.camel@redhat.com>
Subject: Re: [Nouveau] [PATCH AUTOSEL 5.13 20/26] drm/nouveau: recognise
 GA107
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Aug 24, 2021 at 01:08:28PM -0400, Lyude Paul wrote:
>This is more hardware enablement, I'm not sure this should be going into
>stable either. Ben?

We take this sort of hardware enablement patches (where the platform
code is already there, and we just add quirks/ids/etc.

-- 
Thanks,
Sasha
