Return-Path: <SRS0=f2/Z=JT=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1C8DC433B4
	for <nouveau@archiver.kernel.org>; Thu, 22 Apr 2021 14:30:09 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D09E613E1
	for <nouveau@archiver.kernel.org>; Thu, 22 Apr 2021 14:30:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7D09E613E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C486E0B6;
	Thu, 22 Apr 2021 14:30:08 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A099B6E0B6
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 14:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619101805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HYt9Rf/Ul3DrTKE2GLD2RprgJCJ4jvXDEv81RZ/uurQ=;
 b=h3Ca6y+FIrH5HrThMz6Bvl+VK1Lwd3friB8w6Rf3MG8hQqvx7wWPSeqNy1NyOjcxIPr6MV
 FsM4Dz+gEMJpfoGHaPaAGJh7W1RLJsXJ8hQeA3tr7mICtvO8xLyioH97E0bm92XxWkDqar
 5u16TJ7sKAnxJlcNpgZGItO9O7St0NU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-533-TltoI5uEPJ6Q4AK6bHZkuQ-1; Thu, 22 Apr 2021 10:30:01 -0400
X-MC-Unique: TltoI5uEPJ6Q4AK6bHZkuQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 y7-20020a1c4b070000b02901357a988015so1353191wma.5
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 07:30:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HYt9Rf/Ul3DrTKE2GLD2RprgJCJ4jvXDEv81RZ/uurQ=;
 b=WvMGWcU9v/fVo0twbEhknQ0XnJZzv9jgjywye2Ye0gZPMVQ9bwntPFb/3E+zztORmq
 pK/40M33yE8f5q0U6s4Mh2AdT/TPn7lgYxEIo7Cs3H3h9a1hWKkRhvPdG95mtzbqbpRu
 fmclKNX/y3DeX3Rw6LGKrTuxHOpeeaBGPesMy3pRZffxDMKF27wayNLWkBmKd6qUlroK
 kScwi7a7JunfOxpXb3BKjiyt0pD2jjTY8/z6xhHXGFd7XR5QbbRtJITeXg5y8VvDTi3w
 FrRhx4fuWZn5cICPS4mzczRkVrbUk+Tb6GRAqpZeXKBSmqdGLDbikLx8YAEjVl1/RBeg
 QOxA==
X-Gm-Message-State: AOAM5307csWZCJlKTVXaJ2G6uo5+jQq9tqRHi4S5e8iqz4JuTcmzB/gq
 5sj3bHF4lR5E9vsTYPVcECSqDc6fQwv0DMZYj/6mqMlcG2++saAihy4U/SEbKH1OpB/n5ej+LAg
 TFIMajtY87cjt0a0KcmrGmvNT1/KHaeJhl+hJLrBsLw==
X-Received: by 2002:a1c:3983:: with SMTP id g125mr306861wma.163.1619101800387; 
 Thu, 22 Apr 2021 07:30:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzPlJ5AdFfXK9CeIfpi5VOU2ybVjqWLEkdKk7nrTgHQf0MdDXxU8gPcZINy3oD4kaj+Wuo28RxFDRBMb5Tdm/g=
X-Received: by 2002:a1c:3983:: with SMTP id g125mr306849wma.163.1619101800251; 
 Thu, 22 Apr 2021 07:30:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAPpdf58cSDz-22biF3Zyn7brchnt6Nrju0cXq=ksMBhOSqihhw@mail.gmail.com>
In-Reply-To: <CAPpdf58cSDz-22biF3Zyn7brchnt6Nrju0cXq=ksMBhOSqihhw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 22 Apr 2021 16:29:49 +0200
Message-ID: <CACO55tuRxKQh_OsjPCrzTY1To_gmAiCLqtmk_YXWAXMW8zyHDA@mail.gmail.com>
To: o1bigtenor <o1bigtenor@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] Bug system problems
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I've notified the gitlab admins, but maybe you can use the social
login (google, github, twitter, etc..) for the moment or would that
require the confirmation email as well?

On Thu, Apr 22, 2021 at 3:44 PM o1bigtenor <o1bigtenor@gmail.com> wrote:
>
> Greetings
>
> In the process of setting up an account at the https://gitlab.freedesktop.org/
> location to file a bug I am not receiving any kind of confirmation email to
> respond to.
>
> What do I have to do to effect an account?
>
> TIA
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
