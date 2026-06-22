Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72A45CDB479
	for <nouveau@archiver.kernel.org>; Tue, 23 Jun 2026 15:04:36 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01E8410EBC0;
	Tue, 23 Jun 2026 15:04:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="L0W1hwDq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 4AD7D46C9D;
	Tue, 23 Jun 2026 14:50:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1782226209;
 b=MMiedi8kCiFQFaHwwrAsVgnxtGMjJPUu7fBb+ahiBd/JmLkqLNgvQ5SfeIB8GaRtgiK+W
 8KmdCYlIEBj6MRFG2TgjSU65xlqyC/0yb2Hps7wCwGovplRAzt3K1tsBL4/ZfjdgZX5qxea
 mQzvY0jTzOobvtblo7ElXOjTZj19Mlu9mms8LBdw0WyzPUxrWZr38XnEY5UG1x1XyfH8tSw
 lehLfIkLLgdEQBM3dl1EngypW7aESsFKcPsDXVlgERphgJ07JXlvsBSKRihJc1bX/vMqRh1
 FlZQr45mGje4Etgx7czYaX4CoZ1E2hcCW8TAxCYpfLXprfvMWhe25cfW3gLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1782226209; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n5qMJLNDiGXs4pnTrNastkVamafcDooSErVbTVRma4Y=;
 b=noriG2z4wudhMbw3NKkWJFPuFludb7Jw9Ta6GYtNkNs65ROxzjFe7uVtE6A3U6b/jQvAF
 TGzrbwGD5shXSE4YZuvP1/NapKFk3oGdxrtt+Agis37rydk3tR0PJzajmNXhMgILiJI3o7f
 QLNTe/UjOKRykifrBmpWycKvIYsDnV+CMpymuvCrNpXEdDvNmHs7Mvu2a/iCLrhIYuKEvg/
 pANH5oURPJsbcwO/EXcXbIxP2N8g7jvG6Gg6gRyeuhZ9obLygMTQ082rAxEASi/VTH5l0jh
 Pq/hOYkquHGX3s4sZAz4My3HZUAyQBR/rDqFcWmbSP4RuqZllLXlq7/ghDgA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=bootlin.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=bootlin.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=bootlin.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=bootlin.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 2F50C46BF5
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 14:35:58 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3A7C010E72C
	for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2026 14:50:22 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 801DE1A07AB;
	Mon, 22 Jun 2026 14:50:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 48C55601BB;
	Mon, 22 Jun 2026 14:50:20 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 58BA8106C89E2;
	Mon, 22 Jun 2026 16:50:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1782139818; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=n5qMJLNDiGXs4pnTrNastkVamafcDooSErVbTVRma4Y=;
	b=L0W1hwDqBkBibcfhZK58/gtsLQg2QZLrNAi0dY0EjhRIS5bKAdhbgPfrj4xP6PgUZx2PK8
	UUtiIcjFE5lhK6xKchVNuRaYSwFE02Z6kReox6Ev4w/GVHA+xS30yzNlCBJEi4Y2O3RQZe
	PYqGiLX+BYg1WfUW86CoYUj4AbXgRaGt3ERvEB8Ow/DQgXPyeu+UOYyiabfUC85FOS9Psy
	AsNYdlrTfY0ALYEEfJ0p1m5AL/Fn5B7pSHO8DqyiGDJMzQWXqeBigR1OXDU917MsfVWILU
	XykOpDUr2Z+oeUK41UfkUxsGxB4GrnTT9iOT0PD13rY3g09kMD2hU7QxAntJjQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 Jun 2026 16:50:06 +0200
Message-Id: <DJFNU4L6YNVS.2OXF28HEUNZO3@bootlin.com>
Subject: Re: [PATCH] drm: Use named initializers for arrays of
 i2c_device_data
To: =?utf-8?b?VXdlIEtsZWluZS1Lw7ZuaWcgKFRoZSBDYXBhYmxlIEh1Yik=?=
 <u.kleine-koenig@baylibre.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Lyude Paul" <lyude@redhat.com>,
 "Danilo Krummrich" <dakr@kernel.org>, "Marcus Folkesson"
 <marcus.folkesson@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
X-Mailer: aerc 0.21.0
References: <20260518100401.631351-2-u.kleine-koenig@baylibre.com>
 <aimbWuKkPZdKuO5f@monoceros>
In-Reply-To: <aimbWuKkPZdKuO5f@monoceros>
X-Last-TLS-Session-Version: TLSv1.3
X-MailFrom: luca.ceresoli@bootlin.com
X-Mailman-Rule-Hits: implicit-dest
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 max-recipients; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: BI33NGXPKWPEQYTE6JM6Y3I3JM2ZTDLT
X-Message-ID-Hash: BI33NGXPKWPEQYTE6JM6Y3I3JM2ZTDLT
X-Mailman-Approved-At: Tue, 23 Jun 2026 14:50:07 +0000
CC: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jagan Teki <jagan@amarulasolutions.com>, Liu Ying <victor.liu@nxp.com>,
 Adrien Grassein <adrien.grassein@gmail.com>,
 Peter Senna Tschudin <peter.senna@gmail.com>,
 Martyn Welch <martyn.welch@collabora.co.uk>,
 Russell King <linux@armlinux.org.uk>,
 Douglas Anderson <dianders@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
 Manikandan Muralidharan <manikandan.m@microchip.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Andy Yan <andy.yan@rock-chips.com>, Xin Ji <xji@analogixsemi.com>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>, Fei Shao <fshao@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/BI33NGXPKWPEQYTE6JM6Y3I3JM2ZTDLT/>
Archived-At: 
 <https://lore.freedesktop.org/DJFNU4L6YNVS.2OXF28HEUNZO3@bootlin.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Wed Jun 10, 2026 at 7:15 PM CEST, Uwe Kleine-K=C3=B6nig (The Capable Hub=
) wrote:
> Hello,
>
> On Mon, May 18, 2026 at 12:04:01PM +0200, Uwe Kleine-K=C3=B6nig (The Capa=
ble Hub) wrote:
>> While being less compact, using named initializers allows to more easily
>> see which members of the structs are assigned which value without having
>> to lookup the declaration of the struct. And it's also more robust
>> against changes to the struct definition.
>>
>> The mentioned robustness is relevant for a planned change to struct
>> i2c_device_id that replaces .driver_data by an anonymous union.
>>
>> While touching all these arrays, unify usage of whitespace in the list
>> terminator and drop trailing commas there.
>>
>> This patch doesn't modify the compiled arrays, only their representation
>> in source form benefits. The former was confirmed with x86 and arm64
>> builds.
>>
>> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@=
baylibre.com>
>
> who feels responsible to pick up this patch?

The affected files are mostly in drm-misc so I could apply it, but I think
we'd need an ack from files belonging lsewhere (should be just nouveau and
sitronix at quick glance).

>> base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
>> prerequisite-patch-id: 7779c63f16ef6f7247cdb71c89e66b27e299eb74
>> prerequisite-patch-id: 6f920b6f8c31dc0ad1689200c37680755c20ce8b
...
>> prerequisite-patch-id: 915b7a2276c5a38944107c84bb282271d0bf28f4
>> prerequisite-patch-id: 76d499a624150588f7ef07dc087e70eca6f33419
>
> FTR: These are bogous, there are no dependencies, I just wasn't
> attentive enough to drop these lines.

And 'b4 shazam' messes up because of these lines.

Overall I think it's better if you resend after splitting by tree, and
removing the prerequisite-patch-id lines. You can keep my R-by on all the
patches if you just split them without further changes.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
