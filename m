Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91A16E8783D
	for <nouveau@archiver.kernel.org>; Tue,  3 Feb 2026 14:38:15 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6979410E694;
	Tue,  3 Feb 2026 14:38:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="IQfEhumb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B385541B48;
	Tue,  3 Feb 2026 14:28:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770128939;
 b=On9Dh8KGTjA9DfsCtdUgBYF92iBZzlGnmhCHhDEUk5ES2Oc5quNYkd8V3VYYTT6jbVor/
 f6AwIfdI4zHv2fxv7dYPkju0lg8jSCJSisZu8b97OenWFWnlhOozH9udOxjmm4dX+SgI/WF
 yZOvhyvIF/rTiTANXHzQjlrdCi8z2L+D1p7cD9IwaRRWeA8apmO+Nck6OIQaNgZ7CPNmTgO
 Oo/I44qCqfUtMMXwW2eW5a+ZierxJ/OGhlWp1aOEttMdTGGxNfI1zTTtqG5Pid+wfW9HQ6z
 VjTuR+z+esd2pTM85/45yw2b+hCgT8PRrQkjJIkLDKKFtJczyiv2Wj4OIGrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770128939; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pRiRNuA8efIeh2TwC22Q04L5ECvfpTg/uxGqZfq5WA8=;
 b=BHrOXE0I6a7UMpII2nhgxPowwLZHCngamzDdi9BzGO/g4V5WbY//fMOInq8BJd54FEcBA
 +FU+gm9pOaea0NRK/j1W3uGlHj9Im/pfghqZ75PNqg1+c18RQOYGcRmvFmjHg3se4GamatZ
 kvPv9cZqUWcxD0mmFw4QUOpcis7+jTD0ifezbKbIRnDhlgvl24rngxDv9AuUnAIcwV/O0N0
 U6akbI2Ukcw+mYLmwK5Ak2KkVMID6Bo8ek1Lwg8ovSN5GAN9vDG/F4+P/MOKHbsBTTARfbL
 kS98Uab2QlodawLe14kOMPTTy3e/ZG/5lChsoTy6PpTN4ITBDxMoTVidi8kw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=linuxfoundation.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=linuxfoundation.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=linuxfoundation.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=linuxfoundation.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EEABD40B86
	for <nouveau@lists.freedesktop.org>; Tue,  3 Feb 2026 14:28:55 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 860E610E30A;
	Tue,  3 Feb 2026 14:38:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5425260132;
	Tue,  3 Feb 2026 14:38:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9FF7C116D0;
	Tue,  3 Feb 2026 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770129489;
	bh=WReFpPHX/vOfyDdWwl+g6030jPg0rzk3MFrbuFVJL+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IQfEhumb/ciC1MHWGF+rAc1S2omrVYW18Z/irQOhTrpBbTDSFmYWZnMXijVTH8fQZ
	 NxjEGhodBbtAAEgIHNZ/gdh3tMp2qGW4ydV5WG4M9EVBs0OP6JMCjkVflmQdXaqFkz
	 fl8DOOty7IFV7xgiqHkETccXNawdkLUtMUC+uVak=
Date: Tue, 3 Feb 2026 15:38:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Bruno =?iso-8859-1?Q?Pr=E9mont?= <bonbons@sysophe.eu>
Subject: Re: NV04, 6.18.8 crashes on NULL pointer dereference
Message-ID: <2026020353-running-unhelpful-fbd2@gregkh>
References: <20260201185705.0c5364f1@hemera.lan.sysophe.eu>
 <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260201231451.1ef0128c@hemera.lan.sysophe.eu>
Message-ID-Hash: C7AAHWQU46AITEHKOKM2Z3IBAEZ2JX6R
X-Message-ID-Hash: C7AAHWQU46AITEHKOKM2Z3IBAEZ2JX6R
X-MailFrom: gregkh@linuxfoundation.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/C7AAHWQU46AITEHKOKM2Z3IBAEZ2JX6R/>
Archived-At: 
 <https://lore.freedesktop.org/2026020353-running-unhelpful-fbd2@gregkh/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Sun, Feb 01, 2026 at 11:14:51PM +0100, Bruno Prémont wrote:
> Bisect completed.
> 
> The offending patch is:
> commit 448a2071a843831fe5fa71545cbfa7e15ee8966d (HEAD)
> Author: Lyude Paul <lyude@redhat.com>
> Date:   Wed Jan 21 14:13:10 2026 -0500
> 
>     drm/nouveau/disp: Set drm_mode_config_funcs.atomic_(check|commit)
>     
>     commit 604826acb3f53c6648a7ee99a3914ead680ab7fb upstream.
>     
>     Apparently we never actually filled these in, despite the fact that we do
>     in fact technically support atomic modesetting.
>     
>     Since not having these filled in causes us to potentially forget to disable
>     fbdev and friends during suspend/resume, let's fix it.
>     
>     Signed-off-by: Lyude Paul <lyude@redhat.com>
>     Cc: stable@vger.kernel.org
>     Reviewed-by: Dave Airlie <airlied@redhat.com>
>     Link: https://patch.msgid.link/20260121191320.210342-1-lyude@redhat.com
>     Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> 
>  drivers/gpu/drm/nouveau/nouveau_display.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> 
> It landed in 6.18.8. Seems like not all chip generations are ready for
> atomic modesetting.

Is this also a problem in 6.19-rc?

thanks,

greg k-h
