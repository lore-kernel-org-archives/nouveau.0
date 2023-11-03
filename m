Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0324CC4167D
	for <nouveau@archiver.kernel.org>; Fri,  3 Nov 2023 17:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE5410EA43;
	Fri,  3 Nov 2023 17:37:33 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D3410EA4C
 for <nouveau@lists.freedesktop.org>; Fri,  3 Nov 2023 17:37:30 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1qyy6o-0002b2-Ey
 for nouveau@lists.freedesktop.org; Fri, 03 Nov 2023 18:37:26 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Maden <terminatorul@gmail.com>
Date: Fri, 3 Nov 2023 19:37:18 +0200
Message-ID: <ui3b4e$gq0$1@ciao.gmane.io>
References: <ufggp9$2dh$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
In-Reply-To: <ufggp9$2dh$1@ciao.gmane.io>
Subject: Re: [Nouveau] Error "kernel rejected pushbuf" with RTX 3090 (GA102
 chip)
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

On 10/3/23 10:44, Timothy Madden wrote:
> Hello,
> 
> Whenever I try to run a graphical application with my RTX 3090 Strix I 
> get the following error in the console output:
> 
>      nouveau: kernel rejected pushbuf: No such device
>      nouveau: ch23: krec 0 pushes 1 bufs 21 relocs 0
> 

Is there maybe a limit to the number of pushbufs in the source code, 
that I can hard-code to a smaller values, then recompile Mesa ?

Where would I find it in the source files ?

--
Thank you,
Timothy Madden


