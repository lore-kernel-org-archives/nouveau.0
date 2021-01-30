Return-Path: <SRS0=EcxT=HB=lists.freedesktop.org=nouveau-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E11FC433E0
	for <nouveau@archiver.kernel.org>; Sat, 30 Jan 2021 02:04:14 +0000 (UTC)
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D27160235
	for <nouveau@archiver.kernel.org>; Sat, 30 Jan 2021 02:04:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D27160235
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=merlins.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=nouveau-bounces@lists.freedesktop.org
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9709B6EC7E;
	Sat, 30 Jan 2021 02:04:13 +0000 (UTC)
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 246646EC7E
 for <nouveau@lists.freedesktop.org>; Sat, 30 Jan 2021 02:04:13 +0000 (UTC)
Received: from [172.58.39.25] (port=59580 helo=sauron.svh.merlins.org)
 by mail1.merlins.org with esmtpsa 
 (Cipher TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92 #3)
 id 1l5fcS-0005BV-1m by authid <merlins.org> with srv_auth_plain;
 Fri, 29 Jan 2021 18:04:12 -0800
Received: from merlin by sauron.svh.merlins.org with local (Exim 4.92)
 (envelope-from <marc_nouveau@merlins.org>)
 id 1l5fcR-00008T-Dt; Fri, 29 Jan 2021 18:04:11 -0800
Date: Fri, 29 Jan 2021 18:04:11 -0800
From: Marc MERLIN <marc_nouveau@merlins.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Message-ID: <20210130020411.GZ29348@merlins.org>
References: <20210129005626.GP29348@merlins.org>
 <20210129212032.GA99457@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210129212032.GA99457@bjorn-Precision-5520>
X-Sysadmin: BOFH
X-URL: http://marc.merlins.org/
X-Broken-Reverse-DNS: no host name for IP address 172.58.39.25
X-SA-Exim-Connect-IP: 172.58.39.25
X-SA-Exim-Mail-From: marc_nouveau@merlins.org
Subject: Re: [Nouveau] 5.9.11 still hanging 2mn at each boot and looping on
 nvidia-gpu 0000:01:00.3: PME# enabled (Quadro RTX 4000 Mobile)
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
Cc: nouveau@lists.freedesktop.org,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 LKML <linux-kernel@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jan 29, 2021 at 03:20:32PM -0600, Bjorn Helgaas wrote:
> > For comparison the intel iwlwifi driver is very clear about firmware
> > it's trying to load, if it can't and what exact firmware you need to
> > find on the internet (filename)
> 
> I guess you're referring to this in iwl_request_firmware()?
> 
>   IWL_ERR(drv, "check git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git\n"); 
 
Yes :)

> How can we fix this in nouveau so we don't have the debug this again?
> I don't really know how firmware loading works, but "git grep -A5
> request_firmware drivers/gpu/drm/nouveau/" shows that we generally
> print something when request_firmware() fails.

Well, have a look at https://pastebin.com/dX19aCpj
do you see any warning whatsoever?

> But I didn't notice those messages in your logs, so I'm probably
> barking up the wrong tree.

you're not It seems that newer kernels are a bit better:
[  189.304662] nouveau 0000:01:00.0: pmu: firmware unavailable
[  189.312455] nouveau 0000:01:00.0: disp: destroy running...
[  189.316552] nouveau 0000:01:00.0: disp: destroy completed in 1us
[  189.320326] nouveau 0000:01:00.0: disp ctor failed, -12
[  189.324214] nouveau: probe of 0000:01:00.0 failed with error -12

So, it probably got better, but that message got displayed after the 2mn
hang that having the firmware, stops from happening.

whichever developer with the right hardware can probably easily
reproduce this by removing the firmware and looking at the boot
messages.

At the very least, it should print something more clear "driver will not
function properly", and a URL to where one can get the driver, would be
awesome.

> So maybe the wakeups are related to having vs not having the nouveau
> firmware?  I'm still curious about that, and it smells like a bug to
> me, but probably something to do with nouveau where I have no hope of
> debugging it.
 
Right. Honestly, given the time I've lost with this, and now that it
seems gone with the firmware, I'm happy to leave well enough alone :)

I'm not sure how you are involved with the driver, but are you able to
help improve the dmesg output?

Thanks,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
