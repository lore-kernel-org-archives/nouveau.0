Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF1AE606A31C
	for <nouveau@archiver.kernel.org>; Mon, 16 Nov 2026 09:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TSgJLCeF
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D84AC10EDF0;
	Mon, 16 Nov 2026 09:39:17 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5E3D94942E;
	Mon, 16 Nov 2026 09:19:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794820768;
 b=aSO6Xi6L5FHNHLvYtIQ2CHEONpQy47LnQ3gwZcS4/YdJMUZsTicZi5L7yyd/MkDM2qjDO
 azHYb5d1coXVI+Jo3ENLUUDXzbGv6M/Zlt7gJktY+CLsRI+V0Oij1JX9zUHa3ydlhr/4f+O
 m2Q5I76RA9C3Z5179M3lOvMsaGcFwR141N8YwiSo2OD1PZrhfVCVR+4FRqNcrYpx2ZtGN0O
 4hTWIIotfC+wYRy9xUrd9p7nNffCLkk1Wqne8ItJKyBAUH8RfG8TaxZqqD11VG9cFJUh2wY
 mFr6pgdiGcOuDe0RpxaMxDeRDUxx7ZJr+aG7xjh2qEn2eApoLkHZd796iaZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794820768; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
 b=lSAe8SuDaFYDRjX9jg3S/oANqKshoJPQoOaelafoW+rqmIg7FLianPzUtc6OAEyh8E0BS
 rh050y8ndBZYZFO2CHihuutrMnF9eUGGZsaic/sqWJW3HW1wOEZIxpYvfTSa3YUDdXa3TWb
 s6tei63xJmSCC58831g/PbImevgH0SMki+WqOf3NxaMzPrTPHP/VRB+z7wf7sWGVVg8/5N3
 Q5373kEDkTarLU04m9ZRT1XBjfFChcmD4c/4FRZ9RaO1Nmo2It3+5JOWdAj1XJ0pD0JZPGo
 UyzABGYfP5vRjPwS3WaiL0WJVl6rgMY0qmI0OBF1ROu9HGBhSaz5EtbPpBIw==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 423D44942E
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:19:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 5A2F110EDBD
	for <nouveau@lists.freedesktop.org>; Mon, 16 Nov 2026 09:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794821948;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
	b=TSgJLCeFDC+7XOHzSGCuBkK1Tffv4W6F0ZOw1rXgig+s3ADuWPrHqktz/3DfCJIliwG9uw
	JBw/I/KcpFSC6vSjyE2PGbH6TlwOR1fj8BVSNwiUTnhHZH5vyDCcqzY1clhfR+qbeMQWfW
	ruIGC/X78G0LIVGL+GgO6wPBFykJ+P8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-t_gnPiSpNgmXnkyOedUh9Q-1; Mon, 16 Nov 2026 04:39:07 -0500
X-MC-Unique: t_gnPiSpNgmXnkyOedUh9Q-1
X-Mimecast-MFC-AGG-ID: t_gnPiSpNgmXnkyOedUh9Q_1794821946
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-490d2ac331bso3058979f8f.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 16 Nov 2026 01:39:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794821946; x=1795426746;
        h=content-type:mime-version:message-id:date:references:in-reply-to
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vfDtkcqPvV+2k9dyjsvEmJCR0/Gq1KXbglEhzSUqmq4=;
        b=Tzy0a92cc59VhyptN/p+tSnyolDtgeB/+kUAANBZBy7hkjCKMk7Cmn9VpDDIaneWc8
         zQGpHpgqgf1CR2hxVu6uzcNrC6BvJe1DqoWPt/F+KivEv/CovfJ35lFjgkJX7RTu6I0M
         SEtTSCwKNu4eR9NFQH4DO29f7eg4ILpPCWBBsfQxWB7fPAKe+l7GWDsYTpI+JmGzd3UR
         ZV5JbJatqHUirfJO4MBCCy41ah1qv8MiE+RbbRo0DZoC70hRcXlPX+5/f2amI58aPiCV
         o7pTC9U6TpsAUHv4KKwN8UTGZW/MxDqXbmcys/YpIRS/Nu/lzHWwUSVQZXNeTA6q4199
         TDuA==
X-Forwarded-Encrypted: i=1;
 AL+hErHeYNoa/BC6gX+gVS07NYOnSldbS4oAPnn/N00A/ZwOQniAOUwkSKqeqvMqw5GZoAWfhyrXfSTB@lists.freedesktop.org
X-Gm-Message-State: APuU4Z89kvM/AaYZ6KbqQ73Wg0KqWECi8Ow2UumEKo/vYJY+NoTASzs9
	UCqz1rlg7QVnXHGL1HFYjZ7VM0x34xQHNBHeN4BRaRkBENm2Sb+hjuGNifd1obII7+XlJG7M9Mj
	eyvwHHjgG+m9G6afRsFkajlcTGwThqMztX7uGKdYfFq/a/be7H5Sy+7/CYBIhdRCMKyg=
X-Gm-Gg: AZFdTZfWPyVT+Rf66l8GfcfdV7nCTvQRxPsWaT8DJwhKCCqQf4c1WLQ3rYlAmf1SG/g
	ayjXaYvwQgMmDy970Np4eZCreaelWmM/yuS1/HqptBXGwKq3TMkg7JSFdPaa5bj/2ZDAWd/QDDH
	uVCRdiZlbwivVekYu+YpS5oFdWN4dfFCMqoq0QGYj7Xg+7NJWj0fX9ezCi5roZ9KXH7pRYslcN7
	pdBgWT185g0sn4GEM+TMiV2ZXdvH6PoIy8dA0+Ds99c5PxtBb3xuzL7+jf3cE4xAerEkZjPQlG2
	SPqGq4El/Q26ssWtKgaDWvRGuw5J98HrnVQTVYqp7lCY/DYX4nooxXzmQpXk+pOpkd/SfcKTJ/5
	5SY7iNk0nXrTeTTvqolVejW7gOz7nm6+FkyuXzc42hXBU3Y1sjbMUpXGfYIeMwl5MbR11dU2HTL
	Wey6AQIY1lqupwu8LiHMpnUpMFuPkNREU4hUFbb2A=
X-Received: by 2002:a05:6000:25c1:b0:4a1:486b:4eb9 with SMTP id
 ffacd0b85a97d-4a1486b53eemr6359106f8f.40.1794821945592;
        Mon, 16 Nov 2026 01:39:05 -0800 (PST)
X-Received: by 2002:a05:6000:25c1:b0:4a1:486b:4eb9 with SMTP id
 ffacd0b85a97d-4a1486b53eemr6359053f8f.40.1794821945065;
        Mon, 16 Nov 2026 01:39:05 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-49c7da37b19sm21564920f8f.5.2026.11.16.01.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:39:04 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: "Mario Limonciello (AMD)" <superm1@kernel.org>, Maxime Ripard
 <mripard@kernel.org>, Alex Deucher <alexander.deucher@amd.com>, Jani
 Nikula <jani.nikula@linux.intel.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter
 <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>, Leo Li
 <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>
Subject: Re: [PATCH v11 12/12] drm/solomon: add SSD130x connector luminance
 support
In-Reply-To: 
 <20261103-superm1-backlight-property-v11-12-00cce7b2ba22@kernel.org>
References: 
 <20261103-superm1-backlight-property-v11-0-00cce7b2ba22@kernel.org>
 <20261103-superm1-backlight-property-v11-12-00cce7b2ba22@kernel.org>
Date: Mon, 16 Nov 2026 10:39:03 +0100
Message-ID: <xlv1ik1xru88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oYZx9JoPgeqoqst_phfiGTkTIWHe62I27dW8jSrJwyU_1794821946
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Message-ID-Hash: ZTPCUVZUH5H3S6NZRN7WURVT4JPYTDGZ
X-Message-ID-Hash: ZTPCUVZUH5H3S6NZRN7WURVT4JPYTDGZ
X-MailFrom: fmartine@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Mario Limonciello <mario.limonciello@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZTPCUVZUH5H3S6NZRN7WURVT4JPYTDGZ/>
Archived-At: 
 <https://lore.freedesktop.org/xlv1ik1xru88.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

"Mario Limonciello (AMD)" <superm1@kernel.org> writes:

Hello Mario,

> From: Mario Limonciello <mario.limonciello@amd.com>
>
> Expose SSD130x contrast through the connector LUMINANCE property when
> DRM_LUMINANCE is enabled. Program contrast directly and register the
> backlight class device only when DRM_LUMINANCE is disabled, so contrast
> has a single owner.
>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v11:
>  * Keep selecting BACKLIGHT_CLASS_DEVICE and drop the guards (Sashiko)
>  * Register the backlight device only without DRM_LUMINANCE (Sashiko)
>  * Initialise the controller with the committed luminance and don't
>    clobber the saved contrast on disable (Sashiko)
>  * Skip contrast writes while the controller is powered down (Sashiko)
>  * Unify contrast dispatch and backlight ops (Sashiko)
>  * Drop Reviewed-by due to the rework
> v10:
>  * Guard the backlight operations and registration with
>    BACKLIGHT_CLASS_DEVICE
>  * Fix Kconfig recursive issue
>  * Add the Reviewed-by tag
> ---
>  drivers/gpu/drm/solomon/ssd130x.c | 149 ++++++++++++++++++++++++--------------
>  drivers/gpu/drm/solomon/ssd130x.h |   2 +
>  2 files changed, 98 insertions(+), 53 deletions(-)

[...]

> +static void ssd130x_connector_set_luminance(const struct drm_connector_state *conn_state)
> +{
> +	struct ssd130x_device *ssd130x = drm_to_ssd130x(conn_state->connector->dev);
> +
> +	/*
> +	 * The encoder enable already initialized the controller with the
> +	 * committed luminance. Skip if it failed to power up the controller.
> +	 */
> +	if (!ssd130x->enabled || ssd130x->contrast == conn_state->luminance)
> +		return;
> +

Is not clear to me why you need this enabled field? I would prefer to not
keep that state if possible.

The changes look good to me though:

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

