Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C787C47077
	for <nouveau@archiver.kernel.org>; Sun, 14 Jan 2024 14:34:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D8B10E079;
	Sun, 14 Jan 2024 14:34:15 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C1E10E079;
 Sun, 14 Jan 2024 14:34:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DDD86CE021B;
 Sun, 14 Jan 2024 14:34:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79AF5C433F1;
 Sun, 14 Jan 2024 14:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705242846;
 bh=EszImnKYJnEnKFk1wt073gthk8M6xM7ENBGQn/T0edM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YRArPb4RPBK5ot3z0ZMSvwVELOPnXJAKuuuJj9y66aWMPRrNCtvXuxwYfTIi7G5eD
 C1FHSsamBbHNJeu3dMT/fYJXcbaTcofAAP6gYcV3adLquCsCXqxQs0kse1ALhluIIO
 It0E4jdkX8FSI78tOaSAy8mv2M1JIXUv2sXPZVxRBuTxxQabC8jwuOnjv+fAgm/jxE
 h9sqSe+9jF4gkFSBFm1a3sLN6iVmiX9WTU33xgknss7HFnQF1gXfY3ohSJIInIgTTL
 9hhF/Fl5RUTeIWp8ucrBo4SeNSfQnlWN6wAvvq4nJH5aj/9BZGtY4CVmfFqAQCR4cC
 N4P5HOW9L59sA==
Date: Sun, 14 Jan 2024 09:34:05 -0500
From: Sasha Levin <sashal@kernel.org>
To: David Airlie <airlied@redhat.com>
Subject: Re: [PATCH AUTOSEL 6.1 5/5] nouveau: fix disp disabling with GSP
Message-ID: <ZaPw3WAmT2OwHY98@sashalap>
References: <20240108122823.2090312-1-sashal@kernel.org>
 <20240108122823.2090312-5-sashal@kernel.org>
 <CAMwc25rAm1ndSiofWMMmQ1BeB0XxBvsHpcvaDKXUwEZp72iwEA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <CAMwc25rAm1ndSiofWMMmQ1BeB0XxBvsHpcvaDKXUwEZp72iwEA@mail.gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, bskeggs@redhat.com,
 daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Jan 09, 2024 at 06:51:25AM +1000, David Airlie wrote:
>NAK for backporting this to anything, it is just a fix for 6.7

Dropped it from everywhere, thanks!

-- 
Thanks,
Sasha
