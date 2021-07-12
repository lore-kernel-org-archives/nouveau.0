Return-Path: <SRS0=sTu7=ME=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2955CC07E9C
	for <nouveau@archiver.kernel.org>; Mon, 12 Jul 2021 09:47:25 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EDA5E6101E
	for <nouveau@archiver.kernel.org>; Mon, 12 Jul 2021 09:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EDA5E6101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 915ED89BF6;
	Mon, 12 Jul 2021 09:47:24 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D1E889B49
 for <nouveau@lists.freedesktop.org>; Mon, 12 Jul 2021 09:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626083241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
 b=YRjKJ050sf3F5FYwrAj4EsxK1p9pnQ+stwJCtRKqrkmmZWFZPmGwGpsrjFbZgSE+8g1P6U
 etBradPyuKnnTOzTVaGLaatuxPF/oK++v6DytXQGIIOhnZC7YWbT82u1QKJAb9ohF/0kck
 oF+l8v3XSSLwXSILBooAuLallhI9Qak=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-555-oZegqMxTMKGm-MyVpTEfEQ-1; Mon, 12 Jul 2021 05:47:20 -0400
X-MC-Unique: oZegqMxTMKGm-MyVpTEfEQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adffa8b0000b029013a357d7bdcso6553886wrr.18
 for <nouveau@lists.freedesktop.org>; Mon, 12 Jul 2021 02:47:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OsAxr7I5wY3GHXnm0dzu227J/w3T3hi+AUx2iyLrph4=;
 b=cjostzMN2Sn5MloDDH2qRWAa3DYLBi3/lknXA9GE2VxBl75rlbXeyctw9J0/LZ8oE0
 +WoPo+a3Jg8F2kUzCcApXv5CvJvL8MtJRc/8kipD4YbZ5CQxKUBUsJIvAGU25P7c9dQ2
 GPmIktzDFgRCiznHIMELL1I+kk1ZX7TvIVPxDWeKivE+RsSn0oWYkRIkeLNyGy41xY0e
 pV28tdQReBycRtPkMGo6cE2ohXhwJxp5HcQRs3MmLkjxYB4O2Gn0a8sO9p6Fy2zBkRqy
 cQpEW+WzWe6AalFklo5GNcN6+TLGutfaQ25wwmrb+TZiBwrZ4aSaNkjOSrZ1HcNAfIrv
 sJyg==
X-Gm-Message-State: AOAM532h6nvxM7O/R9NPlP/h6g2iUxRN7ZDGMO21JAxAgoEJ54jRIsPt
 WV70mrZb8bTEgpY+pBPRCzs0OpHpVpkjk89hLyE2d/3w80sc09xT5gmXB93BnOmR0W2fBmkHXLG
 4bontOLoiJhaDE5tNamMIZtUn9McJt09CBzKKVJtOTg==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662121wrn.113.1626083239347; 
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3sW8UYSOM/Q6qgJACh2S4VICMKyF4ZwsV6v+fR4fftaOEQT2tUBbmhmNCwT2qSaSR3qFgvPBKqWkCA/b7Jp8=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr23662105wrn.113.1626083239204; 
 Mon, 12 Jul 2021 02:47:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210703072502.646239-1-gushengxian507419@gmail.com>
 <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
In-Reply-To: <anhfX5shNJsdNd6vWMeQqNTawyT0AGuoZYI7yRItB-il7fywDu9_Ie1kKL7Wwv2ecVxiYaoymsZHpufnuxUBqvja2uq0_t-Qmhhc4uHT5f0=@emersion.fr>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 12 Jul 2021 11:47:08 +0200
Message-ID: <CACO55tvmvcrAHjFjJ9fMgcFspyfMLE2gR7f3Fxe0_cxxrfwaUg@mail.gmail.com>
To: Simon Ser <contact@emersion.fr>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] include/uapi/drm: fix spelling mistakes in
 header files
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
Cc: linux-samsung-soc@vger.kernel.org, lima@lists.freedesktop.org,
 gushengxian <gushengxian507419@gmail.com>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 gushengxian <gushengxian@yulong.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jul 3, 2021 at 11:00 AM Simon Ser <contact@emersion.fr> wrote:
>
> Reviewed-by: Simon Ser <contact@emersion.fr>
>
> But this this touches a lot of different drivers, not sure we can just
> merge this via drm-misc-next?
>
> In any case, please ping me again in a week if this hasn't been merged
> by then.
>

As long as it doesn't touch code I don't see why not. Just in case:
Reviewed-by: Karol Herbst <kherbst@redhat.com>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
