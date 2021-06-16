Return-Path: <SRS0=plp3=LK=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F0EBC48BE5
	for <nouveau@archiver.kernel.org>; Wed, 16 Jun 2021 23:35:36 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 589C561246
	for <nouveau@archiver.kernel.org>; Wed, 16 Jun 2021 23:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 589C561246
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 104D96E846;
	Wed, 16 Jun 2021 23:35:32 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 691CE6E054;
 Wed, 16 Jun 2021 23:35:30 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9AC4D6128C;
 Wed, 16 Jun 2021 23:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1623886530;
 bh=wPVQVbIbUSPCHwlQveBPypj0b7ZEUBG7b+pcNYSFUIk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=OMSb5BYNr5xaUbuoMHYk0NSbtNUpgEhtIwdXglhLvCqDrW5i5qa2Uyw/yckWpzgvr
 PAagI6UIzBwhdIGp+BcTlme/GBh0kO1sv8tBF0p4l6Hpe21d5Kiv3nkLUw9rd+xyjF
 ipJ2ogqHrqVqo0ogdHpSuhxubfuwK4SU8iDDFm8c=
Date: Wed, 16 Jun 2021 16:35:29 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alistair Popple <apopple@nvidia.com>
Message-Id: <20210616163529.7de2f6e24d395c4ef7a367b6@linux-foundation.org>
In-Reply-To: <20210616105937.23201-1-apopple@nvidia.com>
References: <20210616105937.23201-1-apopple@nvidia.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Subject: Re: [Nouveau] [PATCH v11 00/10] Add support for SVM atomics in
 Nouveau
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
Cc: rcampbell@nvidia.com, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, hughd@google.com, linux-kernel@vger.kernel.org,
 willy@infradead.org, hch@infradead.org, linux-mm@kvack.org, peterx@redhat.com,
 shakeelb@google.com, dri-devel@lists.freedesktop.org, jgg@nvidia.com,
 bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, 16 Jun 2021 20:59:27 +1000 Alistair Popple <apopple@nvidia.com> wrote:

> This is my series to add support for SVM atomics in Nouveau

Can we please have a nice [0/n] overview for this patchset?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
