Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1100C88E56
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:13 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6C09710F00B;
	Fri, 11 Sep 2026 08:52:13 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C8F1640682;
	Fri, 11 Sep 2026 08:34:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115689;
 b=gZJ6nzYn43sJ6YVQMEBzUUhQNcDWrvXM522em/PM8H6kU+Tt6HV7q3S3uTxfF3r2/yNpp
 3lUh/gLbnI2CL0K3Vt0J/K8uvjxJNhZvRL5tmJrxgpOMHQf1frMX2+dnm1I+ojjQjw0pi4C
 gGnp8pLGV2uh27Yl37etjBvaKn4LFrqC6yYQHIVMyBc7U1Nttp5v/nvxVjF2MjfTAFS/jaS
 RxZNW9HomVf9Uwbz9NvgPBoCMnv/bjQrsMGsxQkkXJ3cXJVoC0CVIAMaNyaj1jrYLZLRivB
 dH5I0+r1uJ1IsIW9KQBjlyIEC3JfHrs25bm4qx1J6nL8aTfki8D0zPx5QHng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115689; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=HhrTx4J9uDgrAuapn98ZaBLY29waYFBNusc5p8Tnw3k=;
 b=sz3UEDubrePBpBscuzZ02GuF5vrbbqlXaBimcWukMDJCj6DSXRg7zvkcfS2XNt5kANRSP
 raXmAu1h/kOR5bn5tR9zQc8Zp8tN1ok9Fv+b4FRfbV38QcX/g2h6KCJLIysD3HdAIQTAbXi
 xZkllZNzmX/LDpNPxZZON8Q/M9Mf6dYuq+fhDCMSNw3ll3DCXOwQjOFZZYZhusaFfB0r3Hc
 jT1rQrz3QHJATQHYNsk5Dql70soPHajrH8ZhrckSQ1V+vIkHneYwZCitIvRu3j+Dgn0HOTH
 bIxPcR4avFWyqL5J3TFBao19llYzWOmJK+UA6OWC/SzQjmcL2fUy8gqGZb1Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org; dkim=fail;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C9FFE403AC
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:08 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 46C0610ECC3;
	Tue,  8 Sep 2026 15:29:08 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BD4B2601FA;
	Tue,  8 Sep 2026 15:29:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F16FA1F00A3D;
	Tue,  8 Sep 2026 15:29:06 +0000 (UTC)
Message-ID: <449b3558fdef8f6d6356b72c933e751b@kernel.org>
Date: Tue, 08 Sep 2026 15:29:00 +0000
From: "Maxime Ripard" <mripard@kernel.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Subject: Re: [PATCH v2 7/7] vga-switcheroo: Remove unused interfaces
In-Reply-To: <20260709092215.168172-8-tzimmermann@suse.de>
References: <20260709092215.168172-8-tzimmermann@suse.de>
Content-Transfer-Encoding: 7bit
Message-ID-Hash: IJRKSI6A43KRTK3NXOOTOUMZBUIRCG54
X-Message-ID-Hash: IJRKSI6A43KRTK3NXOOTOUMZBUIRCG54
X-MailFrom: mripard@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: alexander.deucher@amd.com, amd-gfx@lists.freedesktop.org,
 christian.koenig@amd.com, dakr@kernel.org, deller@gmx.de,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 jani.nikula@linux.intel.com, jfalempe@redhat.com,
 joonas.lahtinen@linux.intel.com, linux-fbdev@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, Maxime Ripard <mripard@kernel.org>,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com,
 sashiko-reviews@lists.linux.dev, simona@ffwll.ch, tursulin@ursulin.net
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/IJRKSI6A43KRTK3NXOOTOUMZBUIRCG54/>
Archived-At: 
 <https://lore.freedesktop.org/449b3558fdef8f6d6356b72c933e751b@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu, 9 Jul 2026 11:16:03 +0200, Thomas Zimmermann wrote:
> Remove all unused interfaces that used to implement the functionality
> of pre_switch and post_switch.
> 
> For pre_switch, remove vga_switcheroo_client_fb_set(). This further
> allows for removing all symbols and data structures that refer to
> 
> [ ... ]

Acked-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime
