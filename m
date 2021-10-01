Return-Path: <SRS0=xObT=OV=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31F32C433EF
	for <nouveau@archiver.kernel.org>; Fri,  1 Oct 2021 19:20:50 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9999B61A38
	for <nouveau@archiver.kernel.org>; Fri,  1 Oct 2021 19:20:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9999B61A38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B2588CBF;
	Fri,  1 Oct 2021 19:20:48 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com
 [209.85.166.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851B488CBF
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 19:20:47 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id i62so12901287ioa.6
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 12:20:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZtB6/9EtdwkubDTLcQkYslntkLofrYMNvFnTevDxeNI=;
 b=d/0DeletAjcZvv45zBo/MenqBdZJ4uPZQUniuPufVgA92dCXLYFErMKpUCzKQToYcU
 IHhokuloK3Qgm/ERwDGAoEflpCZh2aW9C666ZSOw7zarRCc/vNXvjYZ0FhgSJNr2Y/XO
 +AFc4lvUwo2sLDgZnNGHPuwyEHdJIwXgwlJtBVNRNpQa4GCaA52jdOUZyWaIhYd+KA4o
 DoMN2k+ILQzNYd1ZX9gGXnJ/4D9It+oD7FqjkDHTE1jYG2+oNcTpx+bTbyB37jAablnO
 TndRbKtpvDZyKlfOBwDAudiPRIm7cvpGxfG7sp0AF60P7ORJyp4wvSjpyGjmKv3Fsr1R
 VCgA==
X-Gm-Message-State: AOAM530cR/qejUPVKG72JvZyXpARfLyjUhs1jxvQGVdppxz0KYgyuAUJ
 LYXDTPr8dAhQnJ/nOE2eRZwCToL+9VJnauULkUk/CgS+
X-Google-Smtp-Source: ABdhPJxRUGl2paQfdbT0MwImrF0Q3o7nBAJ7OFFxHCgVZD/djCjlwTld9op/OPEYe/v3y9Cs6TZT/I7gN1JMmli9wrI=
X-Received: by 2002:a5e:d711:: with SMTP id v17mr9474700iom.93.1633116046800; 
 Fri, 01 Oct 2021 12:20:46 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
In-Reply-To: <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 15:20:35 -0400
Message-ID: <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
To: Jerry Geis <jerry.geis@gmail.com>
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Nouveau on Ubuntu 20.04 LTS
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

On Fri, Oct 1, 2021 at 3:17 PM Jerry Geis <jerry.geis@gmail.com> wrote:
> On Fri, Oct 1, 2021 at 3:06 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>
>> On Fri, Oct 1, 2021 at 3:00 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>> > lsmod | grep nouveau
>> >
>> > What dont I have ?
>>
>> nouveau :)
>>
>> Other than that, you got everything...
>>
>> Check dmesg for errors.
>>
>> Cheers,
>>
>>   -ilia
>
>
> I see this:
> Oct  1 15:11:21 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (==) Matched nouveau as autoconfigured driver 0

This is not dmesg. This is some log file. Please look in dmesg.

> Oct  1 15:11:23 mediaport57 /usr/lib/gdm3/gdm-x-session[1546]: (**) VESA(0): Using "Shadow Framebuffer"

X is using the VESA driver because nouveau (nor any other DRM driver) is loaded.

>
> So it seems like its loading .... but perhaps its not happy ????
>
> What do I do  ?

Check dmesg for why nouveau didn't load.

  -ilia
