Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62C09E95A84
	for <nouveau@archiver.kernel.org>; Sun,  8 Oct 2023 02:09:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB62210E078;
	Sun,  8 Oct 2023 02:09:20 +0000 (UTC)
Received: from ciao.gmane.io (ciao.gmane.io [116.202.254.214])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31F7B10E078
 for <nouveau@lists.freedesktop.org>; Sun,  8 Oct 2023 02:09:19 +0000 (UTC)
Received: from list by ciao.gmane.io with local (Exim 4.92)
 (envelope-from <gcfxn-nouveau@m.gmane-mx.org>) id 1qpJEL-000AWM-FT
 for nouveau@lists.freedesktop.org; Sun, 08 Oct 2023 04:09:17 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: nouveau@lists.freedesktop.org
From: Timothy Madden <terminatorul@gmail.com>
Date: Sun, 8 Oct 2023 05:09:09 +0300
Message-ID: <uft306$16rn$1@ciao.gmane.io>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
User-Agent: Mozilla Thunderbird
Content-Language: en-US
Subject: [Nouveau] How to enable OpenCL device in Clover ?
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

Hello,

I can see from the mesamatrix page at:

	https://mesamatrix.net/

that NVC0 should support OpenCL 1.2, without the optional image formats 
and device partitioning.

But I have never seen and OpenCL device in Clover for my NVIDIA cards, 
am I missing something ?

I have the following chips:
	- Fermi GF117 (GeForce 710M)
	- Kepler GK208B (GeForce GT 710)
	- Turing TU102 (RTX 2080 Ti)
	- Ampere GA102 (RTX 3090)

(of these, the GF117 chip actually falls in the NVC0 family according to 
the web page for CodeNames: https://nouveau.freedesktop.org/CodeNames.html)

For my latest NVIDIA card (3090) I compiled mesa from git, with the 
OpenCL frontend and spirV option set tot true, and I still get no OpenCL 
device from Clover.

Do I need some specific hardware, and only that is supposed to work ? Do 
I need some option I do not know about ?

--
Thank you,
Timothy Madden

