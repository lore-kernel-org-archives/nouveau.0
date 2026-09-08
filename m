Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77143C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 40E7010E822;
	Fri, 11 Sep 2026 08:52:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JATViqPO";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A0DFE4056F;
	Fri, 11 Sep 2026 08:34:37 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115677;
 b=aFIAqh+vyc53kjsYK6YgseRmh74qIRLcOAWU0w/fTJZOovzxO26iAro8htxmRI7avy95u
 AUGxM9hqMBhklfmCWwfu+/vWs1+rQdn124O8ac354cfiK7JpXEyMyBww4/MRf3ZGAkTEdGr
 lpP8G4bOwyjK13KcvYusB9pv/E0zX6nQy56YAraxtX2YOMR3/9gBQZfgd12eaw2hc2BPOTL
 v6Nhfm7a1p/Eii+x+UnEjRlJqXJuopUraY0Z+0+Da/rrpj4isPGo2WmP5UFJhz0U/f92VG0
 1joxuIIfSEJxmJwYxYxBYgPLjwshy+XQx7dXaNHyuT5MWJvgM4yDiTohC2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115677; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qDirhoGWjc2csBx5d7xGbdH0VhGX3fyzJfQO3BP318E=;
 b=fMNlbMIvrR6pilWqe7pQ+RfID7Igu6pbrnECKvldl4kzPq2uWjlhyLgGNukzDEE9t0Lqp
 l23gsLCLFVNvAyTgPR8uCXR8UnapNDg7Q8AI59B+biQJxHW5az3SAK1hSogRFj23YtMwiMy
 GTf33S81RXLlotb+LyhvxqLfiuYzbWuaIDZPD2wRYexlifmi0gW14AJoT+1I5QGUcM0JG7N
 nbGi3FhPAy0ptawkiIr5qdz9Bcq8bCKANQ8nslA1JdslKrK3SKHVM6FMkPUNLpDAsbsNc4/
 XN0tSpOkeMW8cyumeIQF3ir6akLW25CfxXYt8Q5uZ/s+QoIbDhJGvKqh//7A==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2554D40361
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:07 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B04E410E7E0
	for <nouveau@lists.freedesktop.org>; Tue,  8 Sep 2026 00:54:17 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32ECE60514;
	Tue,  8 Sep 2026 00:54:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 672751F00A3E;
	Tue,  8 Sep 2026 00:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788828856;
	bh=qDirhoGWjc2csBx5d7xGbdH0VhGX3fyzJfQO3BP318E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=JATViqPOpoe9C0rwmk6Y0aHo1Xk4cvNxXBgDeUpumGGgmpuD1kV7y7C+LLzBXt3nd
	 USlk7dwstkRprraKWW0FuqTHnaQL/jaKDSeEBWSlFQwN+Ne6UJU3G/VhCBeapjbo8W
	 5pNmV3aef/SHErc5WbjQ6Bw5iagh7Sct7/cEuJfSEqqyIxC4lKAOSGN4xA2Ei3AD4Y
	 8EROnMiw+Mwoqkyz3I4tzrg50Y4aqbgAjb6J0r/AfwjwqBZhVNYuNzOUZmT77uVV0M
	 STU6VimGlx6cWisDVYS+YbQ86UU2PfviKUFMvH3iLEhmHFhGrf97ac50uyYFNeJ/ZX
	 Fz9AWP7J/KGBg==
From: Sasha Levin <sashal@kernel.org>
To: alexevgmart@gmail.com,
	stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 5.15/6.1/6.6 0/2] tracing/mmiotrace: Add NULL check for
 mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 20:53:51 -0400
Message-ID: <2026-09-07-daily-reply-0012-mmiotrace-v2-3trees@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907163919.183961-1-alexevgmart@gmail.com>
References: <20260907163919.183961-1-alexevgmart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: WQ54Y2FTV7RUCGFA7NNFQRZFO7FLXUZI
X-Message-ID-Hash: WQ54Y2FTV7RUCGFA7NNFQRZFO7FLXUZI
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Sasha Levin <sashal@kernel.org>, karolherbst@gmail.com,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org,
 mhiramat@kernel.org, mingo@kernel.org, nouveau@lists.freedesktop.org,
 ppaalanen@gmail.com, rostedt@goodmis.org, tglx@linutronix.de,
 Ingo Molnar <mingo@elte.hu>, linux-trace-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WQ54Y2FTV7RUCGFA7NNFQRZFO7FLXUZI/>
Archived-At: 
 <https://lore.freedesktop.org/2026-09-07-daily-reply-0012-mmiotrace-v2-3trees@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

> Masami Hiramatsu (Google) (1):
>   tracing/mmiotrace: Add NULL check for mmio_trace_array in logging
>     functions
>
> Steven Rostedt (1):
>   tracing/mmiotrace: Remove reference to unused per CPU data pointer

Queued for 6.6, 6.1 and 5.15, thanks. Good catch adding the
prerequisite.

-- 
Thanks,
Sasha
