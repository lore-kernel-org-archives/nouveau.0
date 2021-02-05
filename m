Return-Path: <SRS0=NGGM=HH=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94F8DC433E0
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 22:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 365F164FDD
	for <nouveau@archiver.kernel.org>; Fri,  5 Feb 2021 22:16:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 365F164FDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=emersion.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 941476E0B6;
	Fri,  5 Feb 2021 22:16:03 +0000 (UTC)
Received: from mail-40131.protonmail.ch (mail-40131.protonmail.ch
 [185.70.40.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71B3C6E0B6
 for <nouveau@lists.freedesktop.org>; Fri,  5 Feb 2021 22:16:02 +0000 (UTC)
Date: Fri, 05 Feb 2021 22:15:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail3; t=1612563360;
 bh=SS4/ql4GvgG8vctstgI6CjCqx5zDsqIojvlE8p6HkVE=;
 h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
 b=lCdOsVBnsZasdiEBjSmYgwlQefZwYrF9HTeEdXcVuuQ6YtXERK1Bb0V9gG9DfDSkh
 y3WSdf7pfyfekhUBXAA2bNJNKCO47RbeP6HhvdPLrzx2BZUN4cLeVTkA26OtQS1xO5
 ROooACvBuwe98OtkRDior8yGK/8nN1TcRU+sbKTk4IZtN/Ui4LylgHhePZC56QQoGY
 za/B4PbfhQlc7nduGfyORezr7ubU/hb9fzLZl921Qfk0nN1mdb76vqswZrUwlee6iV
 JaFAtxCfVPays4/d6lVt+igDlLDTNq62AAZscQK7dStz7HG6e9aJSGr0dyc3t+rSsD
 n/P4hdxdrNenw==
To: Ilia Mirkin <imirkin@alum.mit.edu>
From: Simon Ser <contact@emersion.fr>
Message-ID: <OwU6EvrH4NXy5d3uyiItz2FdTvtka7lhHUtqCVeKDgJ43bGec9ELDkDMGnHPJw3bemv9am9efVyQpjssB_NLMSParby2Z5kbc1QENlSL0tI=@emersion.fr>
In-Reply-To: <CAKb7Uvj3HLGMiO4uxvjmR7JCdEN_4b3K46tQeqxtCOYw2AZ1uw@mail.gmail.com>
References: <20210205210044.2665-1-contact@emersion.fr>
 <CAKb7Uvj3HLGMiO4uxvjmR7JCdEN_4b3K46tQeqxtCOYw2AZ1uw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [Nouveau] [PATCH v2] nouveau/dispnv50: add cursor pitch check
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
Reply-To: Simon Ser <contact@emersion.fr>
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Friday, February 5th, 2021 at 10:50 PM, Ilia Mirkin <imirkin@alum.mit.edu> wrote:

> > return head->func->curs_format(head, asyw, asyh);
>
> While you're at it, maybe give this one some love too?

Sure, although this would be a driver bug because DRM core already
checks the format. curs_format has WARN_ON when it fails.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
