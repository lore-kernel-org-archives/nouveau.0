Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FC2CD5BD0
	for <nouveau@archiver.kernel.org>; Wed, 27 May 2026 12:38:21 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 52FC810E7B4;
	Wed, 27 May 2026 12:38:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=dorfdsl.de header.i=@dorfdsl.de header.b="ZKv+F0iN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B97514649B;
	Wed, 27 May 2026 12:24:54 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779884694;
 b=pzgn5c9QLsGluwnAkB+hQdDCAalJQnOP3g2tegbvMTiMFdbnqQW0SjAja1q+wWKCeNMT4
 rdlqbwAzYf5xjbDeCfrvWcyc34/fzrf67EUuA2QMpGGaBrGrUi5JpgtGF6cLEYF/AaExrh5
 JHOPBr9Ht1CU8n4TdkGLYmMAnUYczqOwD3G4hiAxWB/v73yEVyhpIn8mxMqTndZ92sosxmb
 OmcgQlQEU/iJkqsRDbp/qR5QfSEjwUbBF1fK5nQWRTYWPuvLeU/A7pxXeyA0CyIYnCxsl2p
 tLW6t9Fa6Kvb2HVWn6xwDtAT8hOV5NTX8o3WEpAvEDSFK2hq4TMcsrWd6UUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779884694; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3Kp0xEREEGGktA9QzfKFQxpKkGtOfZXxpICYg3tO/Aw=;
 b=lzwUVgCvnbDpryvhdlmta4zvdDP1p4EAum+ecODmQBNSIhN5Hdju+/EJD69WSPZDxz9zy
 abqMKGbPYLiAIU98p6Op9fUDqtRN0+KzciC0lqCpFVq5t1YoMMJO/g8roHjq+085+k+Ypmj
 22NmTaDw46PNpWRZIrixtGo0w1I6f0f8jG2up7Fju2kfMGteViBTSG4WAruI+HrKwmqnJNS
 RoDXO5XsVZJuU5JBxbetcgMPLoVpwrMuboz1Ad1rNDEHHzeiM9TtRE64XyRXmt0fkhNX4zi
 rtfz/AWuTWRAKd13D4tOf0gqdOjOdfCwWfwcInbIBpVMkDoL/Uf1X1ATEAOQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=dorfdsl.de;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=dorfdsl.de
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=dorfdsl.de;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=dorfdsl.de policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A3C83414FA
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 12:24:50 +0000 (UTC)
X-Greylist: delayed 837 seconds by postgrey-1.36 at gabe;
 Wed, 27 May 2026 12:38:16 UTC
Received: from srv1.dorfdsl.de (srv1.dorfdsl.de [82.139.252.16])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A37AF10E7AF
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 12:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=dorfdsl.de;
	s=default; t=1779884657;
	bh=PpvPXIQgQ1r/YJzZgztRnNNKRaUhV1uNIM5FBvTCM+o=;
	h=Date:From:Subject:To:From;
	b=ZKv+F0iNqkUkC/QJrymNc9lrW4oWRPItFGH+rYznF/dpygzUbRy999p1oK80v2HIz
	 SPG36tzY4oUNeadQCFBskgMktGaUM9VbuSSycTQezzRBQ6EhhrUmvSkos7Xlnz5Z97
	 N2M60g/JbooVIKB+0oDVzoeAjHEBqiz2kv7SDGTOYfIH0L5vF7lPzGV3jIFCU5UwMA
	 ugXNzPfh9URfazuWll87p0qPn3kHnhm9Kb/dQonnaF4D+aasZvem4i+8833TDo/xau
	 vFUTGzWq9arI+hdFUnNBZ46WAxAo+PYuBW3ObdWM0G5bphlwm59V+MYDIivv76Lqiv
	 wkbN8dfrYmIxA==
Received: from [IPV6:2a01:170:118f:1:f5f4:a4f0:5b6b:d795]
 ([IPv6:2a01:170:118f:1:f5f4:a4f0:5b6b:d795])
	(authenticated bits=0)
	by srv1.dorfdsl.de (8.18.1/8.18.1/Debian-6) with ESMTPSA id 64RCOHAf015215
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <nouveau@lists.freedesktop.org>; Wed, 27 May 2026 14:24:17 +0200
Message-ID: <934530dd-61d0-4c43-a323-8947eb9be137@dorfdsl.de>
Date: Wed, 27 May 2026 14:24:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marco Moock <mm@dorfdsl.de>
Subject: display issues on Quadro K2100M with nouveau
Content-Language: en-US, de-DE
Autocrypt: addr=mm@dorfdsl.de; keydata=
 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
 MCwzZXR/AA==
To: nouveau@lists.freedesktop.org
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: RUK76B4CHJGKGJDSJMCGOQFFW6GEZIEP
X-Message-ID-Hash: RUK76B4CHJGKGJDSJMCGOQFFW6GEZIEP
X-MailFrom: mm@dorfdsl.de
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RUK76B4CHJGKGJDSJMCGOQFFW6GEZIEP/>
Archived-At: 
 <https://lore.freedesktop.org/934530dd-61d0-4c43-a323-8947eb9be137@dorfdsl.de/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hello!

An HP laptop with Fedora has the issue that text and icons are not
displayed properly, e.g. in xterm an Konsole. The issue is gone when the 
window is being moved.
It affects 2 identical machines (ZBook 15 G1, HD4600 and Quadro K2100M, 
so I exclude a hardware defect.


It only happens on monitors connected to DP or DVI, eDP is fine (but I 
assume this port is connected to the Intel HD 4600).
Both graphics cards are enabled in the UEFI.

It happens on xterm with xwayland and other applications, including the
KDE desktop. It also affects the menues of Thunderbird.

Is that an issue in nouveau or at the X server or wayland?

I would like to track down the issue. Please let me know which further 
steps are required to identify the issue.

dmesg does not output errors.

-- 
kind regards
Marco

Send unsolicited bulk mail to 1766588993muell@stinkedores.dorfdsl.de

