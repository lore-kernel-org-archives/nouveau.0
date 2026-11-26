Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34643606A321
	for <nouveau@archiver.kernel.org>; Thu, 26 Nov 2026 08:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=leemhuis.info header.i=@leemhuis.info header.a=rsa-sha256 header.s=key2 header.b=XjiAXlsa
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1B1511120E3;
	Thu, 26 Nov 2026 08:00:15 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 05CDD403E1;
	Thu, 26 Nov 2026 08:00:10 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795680009;
 b=yt8ZEQCVejgEURolBpv9GbhOCPj1CqCm4+uXk5W323OeM7ihNAq5CQAeFOi5aeQ68+uy9
 RlKHnWa11MwTEZbC+paVkvqW9fxIevp8MLcSzu/s8ZsPZcgED5mBXyZnMFzyH4oOh7/40l7
 I4x/aV0Nh2fxiBAkdeZHfZxZWG19SdnwuyModQexaBKHsk8luXfVmUci+UVghNbeVadptDn
 JRtwQmv6fAb+8Aozs3JO481Olva2vY7y+Ng8Nl2RsZYhy5kmp4tAfkWB+tSoRgndv64v15S
 swvD5jncVr1OlWcYE21OZE3VV3cxQjI77a37QdS7VHYzBQyaQXQ8EuAnddLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795680009; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=v2cBIwuwZTTpBiqR0454ouMWhhQaLHGEGIiKzwAP7HU=;
 b=U90zIvpgVpO9cjOc7FLOCEBdlWCkei48XUScsRoC2JKIxshCH7DNCv7P5EJZ5WhJKOPV7
 k5ZZW3W84yi2RGPcnM7fwBrLBhN/87gP3sR6cGga43AsCcx78YeZt3oqasWHJW17kGtUDOs
 NObFOeS6ljx/Foqmlfwyfku3uVjUhQMiFFkcob6Rk3hvPEtYHcrH2oS2CZTTWbDFILnIsaR
 6qowteVbBkJ6Ju8EH39y5ZDGpSpwv7oU7mDCDWiMywVByUHpMCv4l25RE4LgPjx+1WmCSdz
 Ij3lOrhrZv1xEC1kzPtH2AQdZ8faLQ5UawAZ2B584RLA6fgjJpbUDx0PdoEw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=leemhuis.info;
 arc=none;
 dmarc=pass header.from=leemhuis.info policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=leemhuis.info; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=leemhuis.info
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7259240393
	for <nouveau@lists.freedesktop.org>; Thu, 26 Nov 2026 08:00:04 +0000 (UTC)
Received: from relay.yourmailgateway.de (relay.yourmailgateway.de
 [188.68.63.102])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E570F10E344;
	Thu, 26 Nov 2026 07:59:58 +0000 (UTC)
Received: from mors-relay-2502.netcup.net (localhost [127.0.0.1])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jZppy209gz6TSp;
	Thu, 26 Nov 2026 08:59:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=leemhuis.info;
	s=key2; t=1795679962;
	bh=ij3hnJcC4WfaTRrqHQlqNFWDVnAM9xmzZit58oeLRAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XjiAXlsaMm8yVPMQlY5bRRl4kOrJxoy2KIgKiSkCty6+c8TeMvO3ItDQ60LMlkFo/
	 A5pEPVsEdszn57IArzsNSpWrBiKyoWTwjqalB/17XKb680TXWCZ3w+zlCqu0KyisKM
	 U1ceAxfBRjfP6GKBsX/PSaXl5lEbAblNr+E+pE9sAnxLz/66mX4y6Ie+3yeVhOPKCW
	 2GaCU2lv+pOik7gOIlPZkqeUiwt+5hnuo1uRCFth5DcHL5zsGDUK1dZMxmDs7ZePA/
	 W6h2PidiKyG0hE8ssjZwEiahC4Gbo4ko8xLGqpR8CvgBzxDzGmH22Xkk/5P68fUjZN
	 WdB++PNjsWcMQ==
Received: from policy02-mors.netcup.net (unknown [46.38.225.35])
	by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4jZppy1CQfz4xp1;
	Thu, 26 Nov 2026 08:59:22 +0100 (CET)
Received: from mxe9fb.netcup.net (unknown [10.243.12.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits)
 server-digest SHA256)
	(No client certificate requested)
	by policy02-mors.netcup.net (Postfix) with ESMTPS id 4jZppw1rNtz8svJ;
	Thu, 26 Nov 2026 08:59:19 +0100 (CET)
Received: from [IPV6:2a02:8108:8984:1d00:a0cf:1912:4be:477f] (unknown
 [IPv6:2a02:8108:8984:1d00:a0cf:1912:4be:477f])
	by mxe9fb.netcup.net (Postfix) with ESMTPSA id 5AA525F949;
	Thu, 26 Nov 2026 08:58:50 +0100 (CET)
Received-SPF: pass (mxe9fb: connection is authenticated)
Message-ID: <b27e10f8-840b-47ca-a5e6-50db3a73313d@leemhuis.info>
Date: Thu, 26 Nov 2026 08:58:47 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "nouveau: pci: quiesce GPU on shutdown"
To: David Airlie <airlied@gmail.com>
References: <20261025213027.842978-1-marex@nabladev.com>
From: Thorsten Leemhuis <regressions@leemhuis.info>
Content-Language: de-DE, en-US
In-Reply-To: <20261025213027.842978-1-marex@nabladev.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: <179567993099.1392972.9410511653682031592@mxe9fb.netcup.net>
X-NC-CID: K/re8fuSYYOPP20M4/d2Cw5ZAXW/LSShXsWb7axahBVqe8RiaKI=
Message-ID-Hash: PWHHD2R2HWWN3XTYQCMGSQVMRIDOJTAJ
X-Message-ID-Hash: PWHHD2R2HWWN3XTYQCMGSQVMRIDOJTAJ
X-MailFrom: regressions@leemhuis.info
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Marek Vasut <marex@nabladev.com>, Li Chen <me@linux.beauty>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Ole Carlsen <ole.carlsen@tutamail.com>,
 Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@debian.org>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/PWHHD2R2HWWN3XTYQCMGSQVMRIDOJTAJ/>
Archived-At: 
 <https://lore.freedesktop.org/b27e10f8-840b-47ca-a5e6-50db3a73313d@leemhuis.info/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/25/26 22:30, Marek Vasut wrote:
> This reverts commit 310326bb7df4bba094a3fc60364c641c547fd923.
> 
> This breaks shutdown on ThinkPad W510, without the offending commit
> the system normally powers off, with the offending commit the system
> ends up spinning indefinitely and the CPU fan goes full throttle on
> shutdown.
> 
> The behavior was already reported in debian bugtracker multiple times
> for various other computers too, and git bisect lands as this commit.
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1141969
> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1146033

@airlied: given that you recently applied a few nouveau bugfixes, could
you maybe pick this one up, too?

I'd even say it's eligible for -fixes, as I'd say this is still a
somewhat recent regressions and the fix hence "should be expedited", as
Linus said some time ago[1].

And to make it obvious: this will reintroduce warnings during kexec the
commit being reverted tried to fix. YMMV, but that seems like the
smaller problem.

Ciao, Thorsten

[1]
https://lore.kernel.org/all/CAHk-=wis_qQy4oDNynNKi5b7Qhosmxtoj1jxo5wmB6SRUwQUBQ@mail.gmail.com/

> I tested the revert with Linux 7.2.12 from debian unstable, not next
> or drm trees, mainly because it was easier with debian test-patches
> script on that machine.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Li Chen <me@linux.beauty>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Ole Carlsen <ole.carlsen@tutamail.com>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Uwe Kleine-König <ukleinek@debian.org>
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: nouveau@lists.freedesktop.org
> ---
> NOTE: Maybe the revert is not the ideal solution, but it does fix my
>       problem, and I think being able to shut computer down is a good
>       functionality to have.
> ---
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 32 ---------------------------
>  1 file changed, 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
> index 5e1336615cf6d..36c74f9edaa83 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_drm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
> @@ -1090,37 +1090,6 @@ nouveau_pmops_resume(struct device *dev)
>  	return ret;
>  }
>  
> -static void
> -nouveau_drm_shutdown(struct pci_dev *pdev)
> -{
> -	struct nouveau_drm *drm = pci_get_drvdata(pdev);
> -	int ret;
> -
> -	if (!drm)
> -		return;
> -
> -	if (drm->dev->switch_power_state == DRM_SWITCH_POWER_OFF ||
> -	    drm->dev->switch_power_state == DRM_SWITCH_POWER_DYNAMIC_OFF)
> -		return;
> -
> -	ret = nouveau_do_suspend(drm, false);
> -	if (ret)
> -		NV_ERROR(drm, "shutdown suspend failed with: %d\n", ret);
> -
> -	pci_save_state(pdev);
> -	pci_disable_device(pdev);
> -	pci_set_power_state(pdev, PCI_D3hot);
> -	/*
> -	 *  This is just to give the pci power transition time to settle
> -	 *  before an immediate kexec jump. it’s mirroring the existing
> -	 *  nouveau_pmops_suspend() behavior, which already does
> -	 *  udelay(200) right after pci_set_power_state(..., pci_d3hot). In
> -	 *  ->shutdown() we’re allowed to sleep, so I used usleep_range()
> -	 *  instead of a busy-wait udelay().
> -	 */
> -	usleep_range(200, 400);
> -}
> -
>  static int
>  nouveau_pmops_freeze(struct device *dev)
>  {
> @@ -1480,7 +1449,6 @@ nouveau_drm_pci_driver = {
>  	.id_table = nouveau_drm_pci_table,
>  	.probe = nouveau_drm_probe,
>  	.remove = nouveau_drm_remove,
> -	.shutdown = nouveau_drm_shutdown,
>  	.driver.pm = &nouveau_pm_ops,
>  };
>  

