Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D59CA9EBE
	for <nouveau@archiver.kernel.org>; Fri,  9 Oct 2026 21:41:01 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E6E911122DD;
	Fri,  9 Oct 2026 21:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="aAAGYAMl";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2F3F748A17;
	Fri,  9 Oct 2026 21:22:34 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1791580954;
 b=en493wOGPH0lwxJqllx9x+xftqhpNT8LKev7IlDgn7n0JYq643GZJBJs4CQqpBogEbLa0
 SLM0eJB5PjY3laEgexJlgebQ9H5bjAv9W4yhT3MQoCUGeG9hHgvHNp5rTxCWkRZVOqTbSY6
 J+iAiysVjG2PbJI33HDl+Cht5vD0u+EEqGvkc4LhcLe2zCnadXMISJT7/jlnzIxcJioqtg5
 FKUXueKj+WQol7qF9VolWJs1XPx+i4C+fkgMxFKR3b98TYjRjGZa/SaZ0cJbJq7DPyxs8dZ
 vAas5Ea2r+/jNgbEmdivRc09tgvkGFEFYr2qyo6lg6lfhLfkEioPwZM+WzWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1791580954; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=975XJHp6HfBeBQvf/fCx8fkoMxk7dSZ3qT++BuIIxYM=;
 b=dh3FJ8Yl/oGp2702iFJL0aglePv8G09KAUm6CxEd/DOT6GktLTiLXgCbpOrYqCNrxxMLS
 w562uoS32Ao/sMWIGD7KGAcoHkhhEbkQXj0GsDIZGDt3Ait4njYPWawu+fCEsZa0+KkkNg0
 z34hLjo6TLPfDcykpdAvURlCoXXReMN1tSDVKpUnTjVGlm7ox2iZIC1KeKqZGgDZPki7NM5
 4THB1K9wFJP9yfY1zaYNumHPD+hanZ84nNjRAETwUnbijc5qX5QX4FLwAEbXAcBum3w6JH+
 3DhDqglResC2P6DG2dCeJwfQFchlVEshW8dA8UTkI6qb5RanHiPTRQbvpcZA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id C3BAE48299
	for <nouveau@lists.freedesktop.org>; Fri,  9 Oct 2026 21:22:30 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 528551122C0;
	Fri,  9 Oct 2026 21:40:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0382C42E50;
	Fri,  9 Oct 2026 21:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E852D1F000FF;
	Fri,  9 Oct 2026 21:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791582056;
	bh=975XJHp6HfBeBQvf/fCx8fkoMxk7dSZ3qT++BuIIxYM=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=aAAGYAMlyxywBeS4ImXPe8+f9iH4wYg1AObXeEJ4wQNbZCpMy96xDOocYMcLC8Osk
	 q0uGVyNUXeYmehHWbGlNeUAeITnbPoQqcWJ8L0lOCxyqwcIRnGjPsMsPWUqvYkzPC9
	 Fo6Vu2yIxrTVWDiyA/MK+2ApHCuh62bA7/uDPR8MLjAAUhmp5QvEl1Wfq563A/JRYY
	 9bF0EPi0Cix1YPRE+qE7OGWWbMtLlYdYH/EFftTwyzYtvxSd3r2QGui92djkEcPM9U
	 J1BZ/cuvvXaxJFqUYuM7jJGrkXywIEXZw9s2dOvhTK+VvhztGA8mkE3RgrxYBj4ShP
	 Ao0SeaGll0sNw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Oct 2026 23:40:52 +0200
Message-Id: <DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org>
Subject: Re: [PATCH v3] drm/nouveau: Fix memory leaks in debugfs and hwmon
 init error paths
To: <lyude@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <ea9a1d374cf3127e5047bc73807ce821022e026e.camel@redhat.com>
 <20261009115151.13877-1-liupeng01@kylinos.cn>
 <25778dca265f58185917c5948490e76184c778d3.camel@redhat.com>
In-Reply-To: <25778dca265f58185917c5948490e76184c778d3.camel@redhat.com>
Message-ID-Hash: ZUPD7AJGHOA2LDK7QYR3FOYSG3KPDFES
X-Message-ID-Hash: ZUPD7AJGHOA2LDK7QYR3FOYSG3KPDFES
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: liupeng <liupeng01@kylinos.cn>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona@ffwll.ch, linux@roeck-us.net,
 nouveau@karolherbst.de, bskeggs@redhat.com, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ZUPD7AJGHOA2LDK7QYR3FOYSG3KPDFES/>
Archived-At: 
 <https://lore.freedesktop.org/DM0MU0O43EB9.3EEKZ4C2IUP9J@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri Oct 9, 2026 at 11:35 PM CEST, lyude wrote:
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Will push to drm-misc-fixes in a moment

Please wait, those are two unrelated fixes with two different Fixes: tags, =
so
those should be two separate patches.

I'm also not sure this is -fixes material. A memory leak in an unwind path =
for
-rc7 feels wrong.

Thanks,
Danilo

> On Fri, 2026-10-09 at 19:51 +0800, liupeng wrote:
>> In nouveau_debugfs_init(), if nvif_object_ctor() fails, the
>> previously
>> allocated drm->debugfs is leaked because the function returns the
>> error code directly.
>>=20
>> In nouveau_hwmon_init(), if hwmon_device_register_with_info() fails,
>> the allocated hwmon structure is leaked because the function returns
>> the error code directly.
>>=20
>> Fix both by freeing the allocated memory and clearing the pointer on
>> the error paths.
>>=20
>> Fixes: b126a200e9db ("drm/nouveau/debugfs: we need a ctrl object for
>> debugfs")
>> Fixes: b9ed919f1c8f ("drm/nouveau/drm/pm: remove everything except
>> the hwmon interfaces to THERM")
>> Cc: stable@vger.kernel.org
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>> Signed-off-by: liupeng <liupeng01@kylinos.cn>
>> ---
>> Changes in v3:
>> - Drop the extra return in nouveau_debugfs_init() as suggested by
>> Lyude.
>> - Add Reviewed-by tag.
>>=20
>> =C2=A0drivers/gpu/drm/nouveau/nouveau_debugfs.c | 14 +++++++++++---
>> =C2=A0drivers/gpu/drm/nouveau/nouveau_hwmon.c=C2=A0=C2=A0 |=C2=A0 2 ++
>> =C2=A02 files changed, 13 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> index 47d5579c568d..338421e52f69 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
>> @@ -295,13 +295,21 @@ nouveau_drm_debugfs_init(struct drm_minor
>> *minor)
>> =C2=A0int
>> =C2=A0nouveau_debugfs_init(struct nouveau_drm *drm)
>> =C2=A0{
>> +	int ret;
>> +
>> =C2=A0	drm->debugfs =3D kzalloc_obj(*drm->debugfs);
>> =C2=A0	if (!drm->debugfs)
>> =C2=A0		return -ENOMEM;
>> =C2=A0
>> -	return nvif_object_ctor(&drm->client.device.object,
>> "debugfsCtrl", 0,
>> -				NVIF_CLASS_CONTROL, NULL, 0,
>> -				&drm->debugfs->ctrl);
>> +	ret =3D nvif_object_ctor(&drm->client.device.object,
>> "debugfsCtrl", 0,
>> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 NVIF_CLASS_CONTROL, NULL, 0,
>> +			=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 &drm->debugfs->ctrl);
>> +	if (ret) {
>> +		kfree(drm->debugfs);
>> +		drm->debugfs =3D NULL;
>> +	}
>> +
>> +	return ret;
>> =C2=A0}
>> =C2=A0
>> =C2=A0void
>> diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> index 726397ab035d..ffbe7f542ab0 100644
>> --- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> +++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
>> @@ -697,6 +697,8 @@ nouveau_hwmon_init(struct drm_device *dev)
>> =C2=A0	if (IS_ERR(hwmon_dev)) {
>> =C2=A0		ret =3D PTR_ERR(hwmon_dev);
>> =C2=A0		NV_ERROR(drm, "Unable to register hwmon device:
>> %d\n", ret);
>> +		drm->hwmon =3D NULL;
>> +		kfree(hwmon);
>> =C2=A0		return ret;
>> =C2=A0	}
>> =C2=A0

