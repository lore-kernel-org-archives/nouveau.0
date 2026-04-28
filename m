Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AEDDFF885A
	for <nouveau@archiver.kernel.org>; Tue, 28 Apr 2026 14:12:17 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 661B110EBC3;
	Tue, 28 Apr 2026 14:12:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="guYXAESG";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 143F745C9B;
	Tue, 28 Apr 2026 13:59:55 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1777384794;
 b=ovRgkFJG0nwj2HtrNhdxiGaS+qJd69GTdAunA5QKcfHM+fGN9ypDJqlgbD10kMFOCF/9N
 QNEMgoxaAPtuxpl6Td10xI11e25Y+UvQhAUl9qoIc57BYIpdBLP1rSnq+GfXqhmnBDRoEfK
 hcn6n8qgSkQOIYynEXeS8ga6j15A011+3JuUvkDOEuujWkboHcp+qbfLOkdqZkWI02+1tc3
 WGfhUxDBUjpymbkRb6SGnJrG258NeCfvQgGoS1XeMI7Y87+lJu9l3vZcSj9kHJmEsh9LQYA
 vAG5uxZ5RZtLx/jD1r5i6uM+maw7oikPqmtGreGdYX5IQe8z+X1xZpc0dPqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1777384794; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/MX7FELy0e3bx3AXoymY1I8eLCyCg3EHSMWIvZrlPcs=;
 b=LQRsd52V1ZEPopsus1ayH2mz8obe03DXB7ujfzmsWkJjtneI+2PrDOM8WwITTRWyCnJJb
 luo1uxbDhKoPCikf1+0tD0Vxm/fDr88GQTkR8QEjqnspR0j68sJ44KiX1xmIktGiaIbnbQm
 9e0GCH372m3MDiX5tMakXqeFYu6AoITiH487VY2tj/ujV5NUQ3NIWqdvg7BBEUwp+h9h5SK
 mYdeYjLtq0yJwZLumQlPNKmslM0X4Zds+8tx3BP2teXlnLjxTkfrAef+xQppOmQhecLLydY
 pqaomwYFaVTVxl6//T8kcd4JZVlJuogEbmGpd1qo9pczfnHgLXAHfPteOMUQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9783145560
	for <nouveau@lists.freedesktop.org>; Tue, 28 Apr 2026 13:59:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC58110E34B;
	Tue, 28 Apr 2026 14:12:14 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D237E61340;
	Tue, 28 Apr 2026 14:12:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392CDC2BCB5;
	Tue, 28 Apr 2026 14:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777385533;
	bh=/MX7FELy0e3bx3AXoymY1I8eLCyCg3EHSMWIvZrlPcs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=guYXAESGSJOjs04GB6idZhHjnVzj5Z7R2i7a44jdAjWMtbjE5QsukQYQphFqFCaNR
	 +LTHFqcQ/gHXZXlkmF7aSHuS794RnyMbARdSR/r8zssA/FecJJsKA6KQnB+2Xmj44c
	 aB7oWbA/tpyHymueC9EbeXBk/TxoFX0GgGm9i7YYiTqyJ0PWBM7ieDOQWF+MscXW+2
	 cJ2OzWrJ2S28q+Apf0m6Td9pKasQIX5NIysZnhsuIyUjFaUhd/hG5ICEFTg+IB0G2/
	 E1MXXHWgO8NjLPG+O2gJj8tUhsl9u+2zRbCaggI/ktihUsIS3k7KrU4v0HkjCRfwzW
	 lFtplVxeor6fw==
Message-ID: <45d3f3c8-60c7-4977-9b30-70948b912c03@kernel.org>
Date: Tue, 28 Apr 2026 16:12:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] replaced old wq name, added WQ_PERCPU to
 alloc_workqueue
To: Marco Crivellari <marco.crivellari@suse.com>
References: <20251031102020.95349-1-marco.crivellari@suse.com>
 <20260428105916.6108-1-dakr@kernel.org>
 <CAAofZF7QuYZOQEiOdU7FEP4+-WngGMCt3svQhMXaiF77J7dkJg@mail.gmail.com>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: 
 <CAAofZF7QuYZOQEiOdU7FEP4+-WngGMCt3svQhMXaiF77J7dkJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: UJ4FCBAE6C6X37X32ENL5ODDMNHNVEIS
X-Message-ID-Hash: UJ4FCBAE6C6X37X32ENL5ODDMNHNVEIS
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, Tejun Heo <tj@kernel.org>,
 Lai Jiangshan <jiangshanlai@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Michal Hocko <mhocko@suse.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UJ4FCBAE6C6X37X32ENL5ODDMNHNVEIS/>
Archived-At: 
 <https://lore.freedesktop.org/45d3f3c8-60c7-4977-9b30-70948b912c03@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 4/28/26 1:19 PM, Marco Crivellari wrote:
> Many thanks!
No worries, sorry for the delay.

- Danilo
