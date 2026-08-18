Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB0AC5DF7D
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 15:26:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6839210EBB7;
	Tue, 18 Aug 2026 15:26:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.ne.jp header.i=@nifty.ne.jp header.b="RXOMzCze";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 74233478EE;
	Tue, 18 Aug 2026 15:10:08 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787065808;
 b=n/j/xi6tA1niuYAmw1bmTPyI0DsfQF8UVraVN7VR/nQxC8kW51M0tnBvdYWrquNrV1e49
 Eb/Vrn1UetrhteE4Wf8lSBn0Kv/QAngrWwVPRpVsiifeh+9AKlyGeQVAAXFxfYJWojzq2D6
 zw/0HQBDy0Sn5MZMCTZOeZwlM/HN67hlVJU9Q4T05jYkldby/4Hhehryv472D3n1ywfSkT/
 yoMLfqvYewJTZJaImmyFyN9x8Pi9dMqpyDMYEk2MMiFIIX7tl0zjcIvN7WcB7+lIJ0gISk1
 QHxcLqPpkRjXE4ol7uxNnDPG3l5bb3wYlyg51+j/j3ukAnkxwv1FgfvER9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787065808; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VV3fsrnwtbIg4scMnbRWdN8Kc/L1AB3L+OZdUmOlIQM=;
 b=E6kDUiUAlInuU9rYIxs2Qk6toSqxBLidu5HX0wtcAEOea7HWLY1gnzprO10UTGYJkk/y6
 Zn477lV6ba3jmJzEmREqKH0QsjeTQBkOS3iRgdmB8kER8KYbvOATF71fO4nKCUPHJT8Xi/3
 KXE/mgMz0tWoG0u6x/xGhugD7iw9ibQOC1Uxz1eF2sj71ina+aDOnG0N4ztj7nM/hYl4aRT
 z+fwvm6HG5aVKY16SFBEc8SvU84KNp7vHF86Q3N65hSckRtG5ZKt41Ss/xxyFUFBw/MZu1a
 lgpPVWkcjzp/MwFNkC9tAXX7SqmYalJ8Mue/xqHQEyJ2AzN6Tnnfbto0SYcg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=nifty.ne.jp;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=nifty.ne.jp
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=nifty.ne.jp;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=nifty.ne.jp
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id E304343E5F
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 02:46:57 +0000 (UTC)
X-Greylist: delayed 388 seconds by postgrey-1.36 at gabe;
 Tue, 18 Aug 2026 03:03:26 UTC
Received: from mta-sndfb-w02.mail.nifty.com (mta-sndfb-w02.mail.nifty.com
 [106.153.227.66])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3476110E4B3;
	Tue, 18 Aug 2026 03:03:26 +0000 (UTC)
Received: from HP-Z230 by mta-snd-w07.mail.nifty.com with ESMTP
          id <20260818025655235.IIMY.18412.HP-Z230@nifty.com>;
          Tue, 18 Aug 2026 11:56:55 +0900
Date: Tue, 18 Aug 2026 11:56:53 +0900
From: Takashi Yano <takashi.yano@nifty.ne.jp>
To: Ben Skeggs <bskeggs@redhat.com>, Lyude Paul <lyude@redhat.com>, Danilo
 Krummrich <me@dakr.org>
Subject: X does not start (or does not show screen) on DisplayPort of NVIDIA
 Quadro 600 with nouveau
Message-Id: <20260818115653.b3a2d355a1cc4c71090c7b78@nifty.ne.jp>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.30; i686-pc-mingw32)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.ne.jp;
 s=default-1th84yt82rvi; t=1787021815;
 bh=VV3fsrnwtbIg4scMnbRWdN8Kc/L1AB3L+OZdUmOlIQM=;
 h=Date:From:To:Cc:Subject;
 b=RXOMzCzeZnabLVrLEAyZMSpVrqaxcx5YYQhAu4Hxh8K6FqjM6sUqiBvN9gjY/+5XNYZ7EQ6J
 7g221Hs+VMXe3RP5wRw+00jxCzg+9Rs/DecVCrVz8+nkNwfSkW3D6IgURCF+fGLGJlCH+Krg4l
 Z6yrC2XQ8jjmfDl4Z17+AoQMOd9y7piVUAv48CAWhUi5CsDTiThHJvpt+r9NBET8DrFi2aYkoW
 8JZ2p9LME3BhbV3iYuAxakQUzqMldXleFtrEttRi7vCAPIp/LQYPxt1iUF7FkO3nQjx1JQKiWX
 9doiWRO2NilIHFsdgoM2V2+HONKfiWyTuX435qTrsR5L4ygQ==
X-MailFrom: takashi.yano@nifty.ne.jp
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: 3CMT44R6HU45KXHVYLH3XFXISWBZT55H
X-Message-ID-Hash: 3CMT44R6HU45KXHVYLH3XFXISWBZT55H
X-Mailman-Approved-At: Tue, 18 Aug 2026 15:10:06 +0000
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3CMT44R6HU45KXHVYLH3XFXISWBZT55H/>
Archived-At: 
 <https://lore.freedesktop.org/20260818115653.b3a2d355a1cc4c71090c7b78@nifty.ne.jp/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Greetings,

I apologize if you have already noticed this or are already
working on it, but I wanted to let you know that I have posted
a bug report along with a corresponding patch at:
https://gitlab.freedesktop.org/drm/nouveau/-/work_items/496

The report describes an issue where the nouveau driver fails to
output the correct signal on the DisplayPort of the NVIDIA Quadro 600.
The bug also affects the Quadro 2000, 4000, and FX 1800, but it
does not affect the Quadro K420, K600, and K620.

I would appreciate it if you could take a look. Any assistance
or feedback would be greatly appreciated.

-- 
Takashi Yano <takashi.yano@nifty.ne.jp>
