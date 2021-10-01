Return-Path: <SRS0=xObT=OV=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78922C433EF
	for <nouveau@archiver.kernel.org>; Fri,  1 Oct 2021 20:57:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A31761390
	for <nouveau@archiver.kernel.org>; Fri,  1 Oct 2021 20:57:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2A31761390
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alum.mit.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98076F409;
	Fri,  1 Oct 2021 20:57:53 +0000 (UTC)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
 [209.85.166.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 797896F406
 for <nouveau@lists.freedesktop.org>; Fri,  1 Oct 2021 20:57:52 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id b78so13187159iof.2
 for <nouveau@lists.freedesktop.org>; Fri, 01 Oct 2021 13:57:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=92BAqLb7yUf22qr4cGBa4ACKouD7IEh5Uwg/bPnaYj0=;
 b=ts9GVBWq/ohLwbqpEE2fefShAYsNo6GJLY4LGfaVY8AkpZyIhCA/JPf5xPh/WIb1rF
 HTdsfMtBffsMaCIOPuu0uooYQXvZFM4qAbb2i3loEgqYPd/gm8a5BC8miW2KbHUudhfd
 nZ4ZQjpAdYstmjKX/+az7QsMLfBI2+9SANwR/7UJ06Y1qYJj8Ht7FIKNqZwbzWRmpGWe
 3fTDMqonbgo4FPYmyMDRPOP6Gz28yhGnhlyREsCOaBIIR2XPc+azeMfJSXf9zN/AwDQ0
 zjhbumfhq4v/komk3ha941Jez9FzfdDpB20RBZlhWNEdyZc4wrypHItIwQbXbRwlKl7D
 hdNQ==
X-Gm-Message-State: AOAM531NXb8hsH5T+pYg8Gdo6sqy6F4ikwEcsCsK9JCRNYHX2ID80/vc
 IZvGBW2vHzg5hPTbCxfkz0skDQPj/HAy9QEH+30=
X-Google-Smtp-Source: ABdhPJz0zgyx2NNrAoIk1yYGn4C2kzuXOb+x90U2nCf+hmd0Ir+sZYTw04rYqYpLPL0WTUwgZ6yd7aKAoDkZNP907IE=
X-Received: by 2002:a02:c6d6:: with SMTP id r22mr63253jan.120.1633121871890;
 Fri, 01 Oct 2021 13:57:51 -0700 (PDT)
MIME-Version: 1.0
References: <CABr8-B5YD4YGgcVfuqNGQumBSpuz8tFA0hEUJWZnHps6ZOKpMA@mail.gmail.com>
 <CAKb7UvgXTkCTQhvK7A_98kfjicBxfJyH0nC_ya5y1wqYxFCfJw@mail.gmail.com>
 <CABr8-B6iZZia65A+=-yZnnU9rB4VwgDbXA+neEZ-V=YJgXQ5-w@mail.gmail.com>
 <CAKb7UvghfxFBahsG5L-i-=u0LvFkW=oA3wckFzBBNV4N7Jx0UQ@mail.gmail.com>
 <CABr8-B7HauHQcwx5ymMqk_R6+MAEemo_-gaag+5NCmtS_O=Ejw@mail.gmail.com>
 <CAKb7Uvi1VRD0H-ZSJ=NrhV2y1rAk3-hsPE60Am_eE0Z2YnZj4Q@mail.gmail.com>
 <CABr8-B4V+UpMD5+kKFuZNxqYXTNkEV5yL3m20HGSAz73zWMCzA@mail.gmail.com>
 <CAKb7Uvh6ieqB3fCppR3z8gvVM2xp_0EvbQbXPueoeAXkH1_LAw@mail.gmail.com>
 <CABr8-B5cakVP_VLHFv4ORxZynddEskrHjbhXGAsVbFRsBkDuVg@mail.gmail.com>
 <CABr8-B6BfU--4WOXP3z80MpkN6rFsUpMTYN_y7yatYSA6RGvzw@mail.gmail.com>
 <CAKb7UvgaOi9Le9F2hv3d2xjSrxenatUWMobKjjfb_UfGuPRbtA@mail.gmail.com>
 <CABr8-B4zOQU1KYatZre7yZ9tkFOAffZj=DLKbvZe5om9uQ6ssA@mail.gmail.com>
 <CAKb7Uvi7V+cSOTWvRGyE6BhZpbShVDV+H1+nenJ0osTM-m+1Aw@mail.gmail.com>
 <CABr8-B4pDnBDM92WCWEbfjnyXaDsGr9hg8Z2ENcxDdskHP54PA@mail.gmail.com>
 <CAKb7UvgpM2o71wWfjOt8hobFd1ovC_4JX3_TgT87WBj7H40LTw@mail.gmail.com>
 <CABr8-B64iJK2zSVnb4Z6XMLy0oaDvxtKZppTJn+KBp-0Hcu-bw@mail.gmail.com>
 <CABr8-B5Vu33y0HptJMi7+Pcs-swHddmKiM5KpYo5gJe5hMpxww@mail.gmail.com>
In-Reply-To: <CABr8-B5Vu33y0HptJMi7+Pcs-swHddmKiM5KpYo5gJe5hMpxww@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 1 Oct 2021 16:57:41 -0400
Message-ID: <CAKb7UvgbuA6EXxd6jzEem0cTdYf-8GN7uPzDcs95SOmgR-r2+A@mail.gmail.com>
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

On Fri, Oct 1, 2021 at 4:56 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>
>
>
> On Fri, Oct 1, 2021 at 4:48 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>>
>>
>>
>> On Fri, Oct 1, 2021 at 4:41 PM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
>>>
>>> On Fri, Oct 1, 2021 at 4:29 PM Jerry Geis <jerry.geis@gmail.com> wrote:
>>> > yes very weird on the sound. Using analog speakers at the moment
>>> > I got no test sound - and no video sound after getting nouveau to run correctly ????
>>> > I was playing analog audio before ?
>>> > Does nouveau only do HDMI audio ?
>>>
>>> nouveau only does HDMI(/DP) audio. A different driver will handle a
>>> built-in sound card (e.g. snd_hda_intel). You might want to reach out
>>> to your distro's support channels to better diagnose what's going on.
>>> Unlikely to have anything to do with nouveau. More likely that you had
>>> added "acpi=off" to hack around this. Or perhaps pci=nomsi for a
>>> broken audio adapter? Don't know. dmesg (not to mention google) will
>>> have the answers.
>>>
>>>   -ilia
>>
>>
>> Thanks - I switched monitors - using a 4K monitor with buildin sound.
>> Sound works now- great.  but the screen is not in 4K .
>> Does Nouveau not do 4K - 3840x2160?
>>
>> Thanks!
>>
>> Jerry
>
>
> HA! I just dawned on my the OLD GT218 does not do 4K... The 4K display looks like a strched for some reason - I thought it would jus tbe the normal 1080p.
> Anyway - got it working - thanks to all the suggestions!

We enforce a max of 165mhz on those boards for HDMI (this is what the
HW is rated for). If you feel like forcing it, you can boot with
nouveau.hdmimhz=300 to allow the 4k resolution. Note that it's a
weaker GPU, and 4k will not be great on it anyways.

  -ilia
