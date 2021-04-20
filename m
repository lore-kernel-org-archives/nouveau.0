Return-Path: <SRS0=fYqg=JR=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A68CC433B4
	for <nouveau@archiver.kernel.org>; Tue, 20 Apr 2021 22:42:54 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3079E61403
	for <nouveau@archiver.kernel.org>; Tue, 20 Apr 2021 22:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3079E61403
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6092C6E8F9;
	Tue, 20 Apr 2021 22:42:53 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCB1E6E165
 for <nouveau@lists.freedesktop.org>; Tue, 20 Apr 2021 11:18:58 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id e5so8534125wrg.7
 for <nouveau@lists.freedesktop.org>; Tue, 20 Apr 2021 04:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
 bh=NzXq8pm0RZwOtL98diimLCoQoA+N1TqlAvuKPfRvVsw=;
 b=HX9cXTInCMHqePb2d382a1xu0Ezs+pQkaIRK14JI8z1RjMxcPOkA2rTlJFV28kVGw0
 1meh8fCgpxqeTw5tRQWJRVsBl/NQiS3IHrUPZ81xT/NSj8MgEHGlB2qYTgdqlwspdLdu
 Nlds3e7/ySuVoms2KPIjGSGww13GI6K5wztOQRdY/n3cz9HbtdAMnQ2feFI6W2TLYd0g
 srRKGvhNCHWk9F4RL3b3MTXZUlN22ogig9ANFdQ284b7xYYhr6n3cNCLtHb8ktWXHMTB
 Z1Ni74/NHRrUgchgF2rCLwSV6fov4qZsho4sEMX8VFP7nf4hxJDGMhkNNT4PbYhvEKHO
 q+Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to;
 bh=NzXq8pm0RZwOtL98diimLCoQoA+N1TqlAvuKPfRvVsw=;
 b=bqCo2x2yGOOXmaufNfzUeTMEXtpr3ZZz5JoCBFv/M1FA53dS5kK93UqZFZAcca0DPa
 n6bPS+009dlejH85gjv66rgDN+lDYAFw1xXkkljltbfe200Oi7mivwLgctnjBvDmJiFd
 0IiYk4jExuy0Yx9SHtYft2fOLnbzX08vp+s5QZiioqOqQUpfXxn/IgG/U2xO4fsiOFO5
 gLkvPbtpqIe1lEDfagjscYIo+kxmELLFPrBfSYWP2GyjWq9C/ZufQmbS3jyZTZ9jaXPi
 D53hMV7ei5vZVT50i9u6Jh/rQ+JU3vbvd/QO2c6yu7qmddUUSvuUrPnP1w7O7gi/NW3u
 VJgA==
X-Gm-Message-State: AOAM532CAuUvMmD+pWXHZjl1VShfeWbmxezSIs06uNKdfsyfoWyCLd1N
 6Lpf1rMjXFUG1a8PELusB/R6WOpxcCLt7iVEzPI3vEdTIsY=
X-Google-Smtp-Source: ABdhPJy10eiKd+mygtoMGR5G2xIC3xI/rj0wl+un9/FI45flV5nNaswUo+wnJ7w6rnG2FY8jOQAyqLpg9X/EhWhwBrk=
X-Received: by 2002:adf:d1ce:: with SMTP id b14mr20577700wrd.159.1618917537086; 
 Tue, 20 Apr 2021 04:18:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:e5cc:0:0:0:0:0 with HTTP; Tue, 20 Apr 2021 04:18:56
 -0700 (PDT)
In-Reply-To: <CAEG4cZVDhq5FKjd0DfE_BRF1WNgA=FxKeG6AnAvbgpkfXmL_+w@mail.gmail.com>
References: <CAEG4cZVDhq5FKjd0DfE_BRF1WNgA=FxKeG6AnAvbgpkfXmL_+w@mail.gmail.com>
From: "Susmita/Rajib" <bkpsusmitaa@gmail.com>
Date: Tue, 20 Apr 2021 16:48:56 +0530
Message-ID: <CAEG4cZXa8vY8QKkF0dTSMpKz0HihcBxUi96CFf247p1eYAgDfg@mail.gmail.com>
To: nouveau@lists.freedesktop.org
X-Mailman-Approved-At: Tue, 20 Apr 2021 22:42:52 +0000
Subject: [Nouveau] How to use DIX with nouveau GUI driver, instead of DDX?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

My illustrious Nouveau list leaders,

Namaste. Good morning.

Before posting I searched Google using your tool for the string ["set
up DIX" nouveau site:lists.freedesktop.org]

I don't have a programming background. But I chose 'Freedom' to be
with FSF movement and software for 12 years. I have been consistently
using mostly Knoppix and Debian, sometimes, Ubuntu, and rarely, Puppy,
for my regular work, that includes image and text editing.

I have an old but still very functional laptop with MCP79 [GeForce 8200M
G] (rev b1) (prog-if 00 [VGA controller] card with my laptop's
motherboard. The audio device : NVIDIA Corporation MCP79 High
Definition Audio (rev b1)

Since beginning, I have been using the proprietary nvidia 32 bit
drivers, as nouveau didn't work of my system. It froze the system
every time init 5 was booted into, with the first  GUI drawing.

I have't had any problems with nvidia so long as my system ran 32bit,
so I just carried on with my work. I am a regular Debian-user ML and
Debian forum user.

Then when 64bit packages became available I faced my first difficulty
with nvidia while installing a fresh Debian Distro with a new HDD.

Only recently, I have learnt and tested (temporarily with Knoppix
persistent non-iso install) how to have nouveau use DIX instead of DDX
 tech.

A kind gentleman helped by giving me this precious information in this
regard on the Debian-user ML.

It apparently irrationally involves letting nouveau driver set
up GUI on first init 5 boot. Which immediately freezes my system.

I then reboot into init 3, with "apt-get purge xserver-xorg-video-nouveau"
the said package and again reboot.

When I boot again into init 5, the DIX instead of DDX is set up and the GUI
interface works very well, using the video card.

I am puzzled. Isn't there a saner way to have nouveau use DIX in the
first place, rather than freezing the system using DDX?

I shall proceed to install Debian latest
firmware-10.9.0-amd64-netinst.iso with the next 1-2 days but I am
really confused for the situation involved.

I am ready to run whatever tests you want me to run with whichever
codes, and shall upload those outputs to my Google Drive for your kind
perusal.

Since I am only a user and don't have a programming background, I
wouldn't like to join the mailing list, as I shall not be able to
help.

Best.

Rajib Bandopadhyay
A dedicated Debian and Knoppix user
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
