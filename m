Return-Path: <SRS0=uklf=H3=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DADFC433DB
	for <nouveau@archiver.kernel.org>; Thu, 25 Feb 2021 23:59:07 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A231F64DD2
	for <nouveau@archiver.kernel.org>; Thu, 25 Feb 2021 23:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A231F64DD2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37ED06E80B;
	Thu, 25 Feb 2021 23:59:06 +0000 (UTC)
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0141A6E80B
 for <nouveau@lists.freedesktop.org>; Thu, 25 Feb 2021 23:59:05 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id h18so6546595ils.2
 for <nouveau@lists.freedesktop.org>; Thu, 25 Feb 2021 15:59:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=apkHnD1v4NSKkWvhCxkjGmlfWyKh5hZwXjMh9j4dIV4=;
 b=m8dU7bU/Y1wCYYcqpO5oKhvwhSrM+7DH0tzbRDQu5vIyI1kMuRuLYn9wnF1OG3+KBi
 NvG6hHReUdVs9Z5bXEO7Eq+pnc/bflfMPZ/p2Yk6/A2wdwLSHzxTl7HmlVovwsUj989T
 7QvRTGnamdaQ2akp486RXH8y7rzeOubxlfjAOLExWYoqevrIsg7m7F+flwVOFYUP9Q6C
 KGTPZaLF7RMEAU6vnTP00IAqzlI9JZiNGknZvx1ssypXi7qoTkj1MYDkcP825ZAl9OFb
 RvIBQFR+jSuO9Svxk0esTUZ6tnAzXxsW9ZRuW9t65ZOg7kcrRq+DbOJoUD7fAVXx0BXA
 2I7w==
X-Gm-Message-State: AOAM530SRbwoF+JxUimL1bTMiD4qKhGFedbtHooqZ+wjaizS/D3+Pe7l
 FQjCxh3vF7h41sC5zbgsZ5lWWHT8SEXqRIeDUY6Xgd8ciDkeqQ==
X-Google-Smtp-Source: ABdhPJxb3dAfHpjjNDV+8Aebyk1Dj9ZCKx8MwucBbHhJjuVqQSLkyQGTgRSinvhobICGEuU1KJAqvoMa9HFuW3kAh3g=
X-Received: by 2002:a05:6e02:1848:: with SMTP id
 b8mr187710ilv.210.1614297545300; 
 Thu, 25 Feb 2021 15:59:05 -0800 (PST)
MIME-Version: 1.0
References: <YDgnVpKo8ya8WRAF@localhost4.local>
In-Reply-To: <YDgnVpKo8ya8WRAF@localhost4.local>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 25 Feb 2021 18:58:54 -0500
Message-ID: <CAKb7UvjWv2P01bDLcxpXmvZzn++kmA9+t=YMQbNamUP5Zj8HMw@mail.gmail.com>
To: Roger <rogerx.oss@gmail.com>
Subject: Re: [Nouveau] i2c-dev driver corrupts display?
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

That's very surprising. As I recall, i2c-dev just adds /dev nodes for
various i2c devices (some of which would be exposed by nouveau, most
likely just the connector one to read EDID in your case, as temp/etc
sensors came later). It shouldn't cause nouveau to do anything
differently -- just allows user-space to have access to the i2c
adapters.

You can try messing with the i2c implementation a bit with

nouveau.config=NvI2C=1

which will flip the internal implementation from the "shared" bit-bang
implementation, to a dedicated nouveau one. But it shouldn't matter.
And as I mentioned before, not sure how the i2c-dev module can affect
it either way -- either the shared impl works or it doesn't.

You can also try booting with

nouveau.debug=debug

to see if you can glean any meaningful information from the "broken" case.

I also remember reports of a later mobile board (NV28M) having weird
clock-related and cursor layout issues
(https://bugs.freedesktop.org/show_bug.cgi?id=54700,
https://bugs.freedesktop.org/show_bug.cgi?id=78543). Not directly
related to your situation, but just pointing to it in case it triggers
some ideas.

In your testing, it might also be wise to differentiate warm vs cold
boots. You can also force re-initialization of the board with

nouveau.config=NvForcePost=1

Cheers,

  -ilia

On Thu, Feb 25, 2021 at 5:40 PM Roger <rogerx.oss@gmail.com> wrote:
>
> HARDWARE:
> Dell Inspiron 8100 laptop
> nVIDIA Geforce2 Go (NV11) with Intel AGP
>
> PROBLEM:
> Display corruption whenever nouveau module was loaded, seemingly at random.
>
> CULPRIT:
> Whenever the i2c-dev.ko driver/module was loaded, the display would become
> corrupted, or as if the timing became out of sync with hardware specifications,
> with weird moving pixels throughout the display.
>
> If the i2c-dev is built into the kernel, possible the display would turn-off
> upon nouveau module loading, but could be possibly worked around (I think) by
> building the nouveau driver statically into the kernel, possibly loading prior
> to i2c-dev loading?
>
> Been having this problem for many years, finally found it, and nothing found
> via Google on i2c-dev & nouveau.
>
> WORKAROUND:
> /etc/modprobe.d/blacklist.conf
> blacklist i2c_dev
>
> Or, rebuild the kernel without i2c-dev.
>
> Quite a few Linux distributions either compile the i2c-dev into the kernel, or
> load the module during booting, creating significant display problems (as noted
> above) when trying to install from a Linux distribution CD/DVD.  Most people
> performing an install, I'm guessing, are then simply performing a nomodeset
> during boot and/or reverting to VESA/UVESAFB.
>
>
> --
> Roger
> http://rogerx.sdf.org/
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
