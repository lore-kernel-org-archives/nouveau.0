Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86DB11094489
	for <nouveau@archiver.kernel.org>; Sat, 21 Mar 2026 15:59:27 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 71C2D10E26D;
	Sat, 21 Mar 2026 15:59:26 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5154745262;
	Sat, 21 Mar 2026 15:48:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1774108108;
 b=PvfFhjZRyfjKvlHxbWnQPbCy0kTdSev3dZ7kHXPVouMs4gB+Jz2qhZ238qGUIS+q5wjY9
 mKYCLlBpqRwBUWNr9lDQzJlVwhdqK7onO/LOA/R6pxiuDmWreWhUzsv0hNjXWAHV6mXKTQl
 sdJjrX8HIKyb6pkB1UFMztgqGvbnLm1q5/ed+msnHWHOjgKPoH1px5BTF5/l5n1U/8eErY3
 EtiQ5o/cusX59r4VA6LvYaZjEC6bC+9OrfZe6rpVSn5RNloeKQAn9oxb9mpU0Do3bSGBpkG
 wMBnufzXZ2VHAHqCXKIQPhsq++BiCRuFE5eFsxKSkBCFBGuUfV7WQE+ZZXEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1774108108; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kP/5xzYjR01g/s9zFZ1Z0dbjsuU6ieflRTyy6PjYilE=;
 b=fHpMuW3/zRBZlfNveM+p2zs/UwMDAhl7xU2MqG2tk+VLeKVbjuDjty/A3zetsihAjl/yV
 lOE63wBziH87dsAXWmrrbOGtuolUAtTAkZJ9fNtQa5JachK5xmF26CzOVsHmbaijeVAgp1k
 8Qz6/H1YZIb1r1OIuvQLZ3KDlkuEIqcJBlhWM5u8bg9e0VZlIYXdOnoxQy6IJzThAXZsb+F
 2HSha3OCVmF7QFjXrw8Jl5vT7J+cs0MoaqKdwSi546hz0cUIgo+w3GFCpk9qut0wBXdCmje
 DkiNu4Dz6IjTde/JI1UR9Ks5WUW02VjSTj2KBmgAyojUq3Zc5gQZNPQ8UQHA==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C8DE740083
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 04:44:04 +0000 (UTC)
X-Greylist: delayed 401 seconds by postgrey-1.36 at gabe;
 Sat, 21 Mar 2026 04:55:01 UTC
Received: from hashnix.club (hashnix.club [144.126.157.133])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A935F10E299
	for <nouveau@lists.freedesktop.org>; Sat, 21 Mar 2026 04:55:01 +0000 (UTC)
Received: by hashnix.club (Postfix, from userid 3038)
	id 88438100D16; Sat, 21 Mar 2026 04:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by hashnix.club (Postfix) with ESMTP id 83991100D14;
	Sat, 21 Mar 2026 00:48:19 -0400 (EDT)
Date: Sat, 21 Mar 2026 00:48:19 -0400 (EDT)
From: royr@hashnix.club
To: nouveau@lists.freedesktop.org
Subject: Problems...
Message-ID: <dfaaaa59-5efa-ffd4-18bd-a677c723dd35@hashnix.club>
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset=US-ASCII
X-MailFrom: royr@hashnix.club
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: UPH5VSMFU37KDXVOFTZLFB34S2PCAFZ2
X-Message-ID-Hash: UPH5VSMFU37KDXVOFTZLFB34S2PCAFZ2
X-Mailman-Approved-At: Sat, 21 Mar 2026 15:48:26 +0000
CC: xuser@alwaysdata.net
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UPH5VSMFU37KDXVOFTZLFB34S2PCAFZ2/>
Archived-At: 
 <https://lore.freedesktop.org/dfaaaa59-5efa-ffd4-18bd-a677c723dd35@hashnix.club/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Nvidia quadro 160M

[ 2468.108409] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.108424] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.108428] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f858000 gst-plugin-scan[4246]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.108451] nouveau 0000:01:00.0: fb: trapped write at 0000434000 on channel 4 [0f858000 gst-plugin-scan[4246]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.108662] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.108667] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.108671] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f858000 gst-plugin-scan[4246]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.108691] nouveau 0000:01:00.0: fb: trapped write at 0000437000 on channel 4 [0f858000 gst-plugin-scan[4246]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.125200] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address 0000420000
[ 2468.125215] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00030000
[ 2468.125219] nouveau 0000:01:00.0: gr: 00200000 [] ch 10 [000ee70000 gst-plugin-scan[4247]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.125241] nouveau 0000:01:00.0: fb: trapped write at 0000420000 on channel 10 [0ee70000 gst-plugin-scan[4247]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.125542] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address 0000420000
[ 2468.125548] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00030000
[ 2468.125552] nouveau 0000:01:00.0: gr: 00200000 [] ch 10 [000ee70000 gst-plugin-scan[4247]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.125572] nouveau 0000:01:00.0: fb: trapped write at 0000420000 on channel 10 [0ee70000 gst-plugin-scan[4247]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.146392] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address 0000420000
[ 2468.146407] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00030000
[ 2468.146412] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f858000 gst-plugin-scan[4246]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.146432] nouveau 0000:01:00.0: fb: trapped write at 0000420000 on channel 4 [0f858000 gst-plugin-scan[4246]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.146793] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00000040 [RT_FAULT] - Address 0000420000
[ 2468.146798] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00030000
[ 2468.146802] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f858000 gst-plugin-scan[4246]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.146822] nouveau 0000:01:00.0: fb: trapped write at 0000420000 on channel 4 [0f858000 gst-plugin-scan[4246]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.179073] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.179087] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.179092] nouveau 0000:01:00.0: gr: 00200000 [] ch 10 [000f5cc000 gst-plugin-scan[4246]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.179113] nouveau 0000:01:00.0: fb: trapped write at 000042a000 on channel 10 [0f5cc000 gst-plugin-scan[4246]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.179726] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.179732] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.179736] nouveau 0000:01:00.0: gr: 00200000 [] ch 10 [000f5cc000 gst-plugin-scan[4246]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.179756] nouveau 0000:01:00.0: fb: trapped write at 000042a000 on channel 10 [0f5cc000 gst-plugin-scan[4246]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.188268] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.188276] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.188281] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f858000 gst-plugin-scan[4247]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.188301] nouveau 0000:01:00.0: fb: trapped write at 0000433000 on channel 4 [0f858000 gst-plugin-scan[4247]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.188515] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.188520] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.188524] nouveau 0000:01:00.0: gr: 00200000 [] ch 4 [000f858000 gst-plugin-scan[4247]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.188545] nouveau 0000:01:00.0: fb: trapped write at 0000436000 on channel 4 [0f858000 gst-plugin-scan[4247]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2468.229093] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.229105] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.229110] nouveau 0000:01:00.0: gr: 00200000 [] ch 3 [000f8d4000 gst-plugin-scan[4247]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.229149] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - 00001000 [RT_LINEAR_MISMATCH] - Address 0000000000
[ 2468.229153] nouveau 0000:01:00.0: gr: TRAP_PROP - TP 0 - e0c: 00000000, e18: 00000000, e1c: 00000020, e20: 00001800, e24: 00220000
[ 2468.229157] nouveau 0000:01:00.0: gr: 00200000 [] ch 3 [000f8d4000 gst-plugin-scan[4247]] subc 3 class 8297 mthd 1b0c data 1000f010
[ 2468.229177] nouveau 0000:01:00.0: fb: trapped write at 0000424000 on channel 3 [0f8d4000 gst-plugin-scan[4247]] engine 00 [PGRAPH] client 0b [PROP] subclient 00 [RT0] reason 00000002 [PAGE_NOT_PRESENT]
[ 2471.275244] nouveau 0000:01:00.0: gst-plugin-scan[4246]: channel failed to initialise, -17
[ 2471.276874] nouveau 0000:01:00.0: gst-plugin-scan[4247]: channel failed to initialise, -17
