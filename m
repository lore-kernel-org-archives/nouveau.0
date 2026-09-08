Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89DA9C88E53
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:09 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 55CBB10EFFE;
	Fri, 11 Sep 2026 08:52:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="LjjwUfbe";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A441140646;
	Fri, 11 Sep 2026 08:34:45 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115685;
 b=ruI1cnPEb3cqYpWCb9Z38J1kQGKY9YWFHy3l1ypEW6fRapas9fq/bijpdxycY1VYV5Jjc
 8NTZZvSoWSom9r8wX4zv1BOnlJ1QPQCVJJMgzO7KPJCwv+ebiLi+3cdnTWZp4MU0ifDpX0f
 MvHoeaZQmUBWSUb6noNKOsdkLij1bt+tTDkuLdADNqslXGXylXM3O0dXaV/IWP7fc5Rokx5
 fTxXbiM4mknlGRoICue6a1SMpurMnSSKJlLU8VZrIVN8xWz9uO+0uLYJE5lK/WEVOwqeruj
 66XkpZAtVV4tdg7o6Mi+/7QbToqXuN6ZIC9Rb5GRjYSJwM7eRaT6Z8COTlRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115685; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=AwDmsTrdUw+Fx9DNwMcQPXux5h279n3YeANU6mgzsZI=;
 b=zOkQOrGKDuj1sakZy9HVWbfB8UnqYiV+/zWEbFiKfOh/6uoDiCCrguJPgrbStJ7tUREGR
 FjLFc9i87XpePBj8vl6QUHEnZ6ZCQVcIwflRbWC1+K9I679t7zyFkrbt5R6Pqzagup048zx
 hYaOzgfq89Jb3EXhKFFxAOdiPtLDc4cQzr3VCwzb1P5x454+0+SlNBht+8UYuT1zHn7Sys4
 HzgYrPEVRuXNUvwewMrrMRUy5f+uu3YHGgbigXaEm5uC4iZH0Z6gqaaeif4/XhAKafu1/np
 ngWa0LURRvIbGbw9+CT3yvfw2YcMU9XsbjFao5qYKpYVyjsbKPspDa4AghyA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6FD3240365
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 50A1710E822
	for <nouveau@lists.freedesktop.org>; Tue,  8 Sep 2026 00:54:19 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C849660A79;
	Tue,  8 Sep 2026 00:54:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C6C1F00A3A;
	Tue,  8 Sep 2026 00:54:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788828858;
	bh=AwDmsTrdUw+Fx9DNwMcQPXux5h279n3YeANU6mgzsZI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LjjwUfbeS8fLm7w9JN2lgT+C2+EvDhYH7cawcYqPauoRA4Z3azuo1mbtx/dX9kDey
	 eT+flhBxZ01x2Gfk4R389kZ73+83TtbCd3wRuAxqSwP9nnl8/l7zxsV20xhPepWQxd
	 acVjfzejqKYJDp9aGrA+S+BJmQgdEvANqz0u3nqCq5u5bwNRpYOJtAamJmArUdqb0P
	 sy95/qIQ0q/mnnyqILHyJELWh7y/ZzAPMB+e8wTSG/NlVBDbUyNJV3fqLZLfUQNeF7
	 tORSlPOrCfVbw+U48q26W/DHsLCpidgQcSKAWAMocKHKE+/4YAHyXX1tS4a7YWIMC/
	 n30pag4iqQo7w==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 5.10 0/2] tracing/mmiotrace: Add NULL check for
 mmio_trace_array in logging functions
Date: Mon,  7 Sep 2026 20:53:52 -0400
Message-ID: <2026-09-07-daily-reply-0013-mmiotrace-v2-5-10@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260907150726.168416-1-alexevgmart@gmail.com>
References: <20260907150726.168416-1-alexevgmart@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID-Hash: IHM37SWCTSTYXLJEXNSIMR6RQJMOYMKL
X-Message-ID-Hash: IHM37SWCTSTYXLJEXNSIMR6RQJMOYMKL
X-MailFrom: sashal@kernel.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Sasha Levin <sashal@kernel.org>, alexevgmart@gmail.com,
 karolherbst@gmail.com, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, mhiramat@kernel.org, mingo@kernel.org,
 nouveau@lists.freedesktop.org, ppaalanen@gmail.com, rostedt@goodmis.org,
 tglx@linutronix.de
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IHM37SWCTSTYXLJEXNSIMR6RQJMOYMKL/>
Archived-At: 
 <https://lore.freedesktop.org/2026-09-07-daily-reply-0013-mmiotrace-v2-5-10@kernel.org/>
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

Queued for 5.10, thanks. Good catch adding the prerequisite.

-- 
Thanks,
Sasha
