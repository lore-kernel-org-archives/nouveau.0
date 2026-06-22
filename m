Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D74CDB466
	for <nouveau@archiver.kernel.org>; Mon, 22 Jun 2026 01:31:48 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AD43D10E41D;
	Mon, 22 Jun 2026 01:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.b="Tdn9R6c3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 730F846BF4;
	Mon, 22 Jun 2026 01:17:23 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782091043;
 b=ygABv6DHVR/76I5hkfu8tIEMfUawtlXweTXWRgdht+S0XLyB0yxhCpMNlIKxNZiS7R79V
 8DtXGreSsT3GHFIpco6n3jXtPjWGQwB7rrjZWqpsJXw9U7xCb4b6yOY7rEVuUQOgN0s+mmB
 dnxH2fzIIiTAgbhN7Bk8EyZzCOSuZFQAHpqj7IUpb529SilzfQdmR+yjH4rfnq/cx4MsT8v
 zoppY9BL1zbIgRFynuR84+6M+2XSy0nNBZMQuMaoOrLNjmpAqTHl3qG1LTNjlSjdUJoUKLB
 EnQ1EGCcFosU29PgNiREnTDoqefOBkCcXz1MmVG96TaxfFpxouPPwz/w5+6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782091043; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u3ZmX/mjzL9Zl05VnH4RZ3rLeDtK6oQHdc6LujnLA90=;
 b=m1Sw7jBasXLKSUATpOFTjgfDZ5XMi4lyOV5yrRw1CLIcurz7l7OL2bGjpNfANEFGcJUgM
 4a+BEXXw6myR92QVExTVKVVM80d6AsCKaSBZijzXMIF3h2zKKy5x3tfSnIk+dDkt1luY6W5
 J4ckA1+pvKEZH47QfVh/yhRHiqlx3AXvyUb6i6671tdjmppltPiJ1LGbwrKQWhQA2kGNN+u
 C1tz+eRSmGiBGMfANB2d2tSKwMcLYdHqvzWrwuRX91p+rMEco1LRGfZNKiIdPYnSLqesyrg
 43nKs498TyQ68mRlHOXOKo/OMM0lYXJz/Tho01j/WBImIg0Qlw9H7kHEWZDg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=126.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=126.com policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=126.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=126.com policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2327C40AA6
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 01:17:20 +0000 (UTC)
Received: from m16.mail.126.com (m16.mail.126.com [220.197.31.7])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D4F5E10E40F;
	Mon, 22 Jun 2026 01:31:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=Message-ID:Date:From:MIME-Version:To:Subject:
	Content-Type; bh=u3ZmX/mjzL9Zl05VnH4RZ3rLeDtK6oQHdc6LujnLA90=;
	b=Tdn9R6c3y1nVFFiNKPjTCpU6hgPK9uN7+uduy6sAIRPMd3Ot+OzE9X8iBLcMBQ
	6lhSLBdpA560O6d7XihN2t05aQUS+xiy8qBs3kLNVTpzeprQY/+1NetBYuEO8uay
	Zp77BpSvVxvdbalgivW88TDj7vPAAQqKTEc/skE+/HduY=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-3 (Coremail) with SMTP id
 _____wDnryQvkDhq+HghCA--.54830S2;
	Mon, 22 Jun 2026 09:30:23 +0800 (CST)
Message-ID: <6A38902B.2080808@126.com>
Date: Mon, 22 Jun 2026 09:30:19 +0800
From: Hongling Zeng <zhongling0719@126.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
 rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Danilo Krummrich <dakr@kernel.org>,
 Hongling Zeng <zenghongling@kylinos.cn>
Subject: Re: [PATCH v2 0/5] nouveau/gsp: Clean up IS_ERR vs IS_ERR_OR_NULL
 usage
References: <20260601095403.228220-1-zenghongling@kylinos.cn>
 <DJEQVST8KK4D.1DX65CF227WWC@kernel.org>
In-Reply-To: <DJEQVST8KK4D.1DX65CF227WWC@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnryQvkDhq+HghCA--.54830S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF48Kr15AFWDur4DJw1fZwb_yoWfXFg_Wr
	W7AayfJ3yIkFWDAr4qkF4aqFW2ga4kXr40v39a9wnI9FW7Zry3WrsIkry3Xrn7trZ29rna
	gFn8J39YgF17KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8n2-5UUUUU==
X-Originating-IP: [112.64.161.44]
X-CM-SenderInfo: x2kr0wpolqwiqxrzqiyswou0bp/xtbBrhDYqWo4kDAXrgAA3E
Message-ID-Hash: LI5UWL2PCBZPQ47P3DIDCEIIQLHNH3GH
X-Message-ID-Hash: LI5UWL2PCBZPQ47P3DIDCEIIQLHNH3GH
X-MailFrom: zhongling0719@126.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: maarten.lankhorst@linux.intel.com, mripard@kernel.org, simona@ffwll.ch,
 airlied@redhat.com, bskeggs@nvidia.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LI5UWL2PCBZPQ47P3DIDCEIIQLHNH3GH/>
Archived-At: <https://lore.freedesktop.org/6A38902B.2080808@126.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

   Hi Danilo,
                 I've reviewed Sashiko's feedback and she's absolutely 
right about the documentation issues. I will send the v3 patch, However, 
I want to clarify that these are pre-existing issues in the  code, not 
problems introduced by my patch series， Unlike the previous kernel 
panic  issue  that we identified and fixed.

   Thanks,
   Hongling

在 2026年06月21日 21:00, Danilo Krummrich 写道:
> On Mon Jun 1, 2026 at 11:53 AM CEST, Hongling Zeng wrote:
>> >Hongling Zeng (5):
>> >   nouveau/gsp/rpc: Document RPC function return value contracts
>> >   nouveau/gsp/rpc: Cleanup incorrect IS_ERR_OR_NULL in rpc.c
>> >   nouveau/gsp/rm/alloc: Cleanup IS_ERR_OR_NULL usage
>> >   nouveau/gsp/rm/bar: Cleanup IS_ERR_OR_NULL usage
>> >   nouveau/gsp: Cleanup IS_ERR_OR_NULL in nvkm_gsp_rpc_rd()
> There are a few more comments from Sashiko, did you check them?
>
> Thanks,
> Danilo

