Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7702606A31F
	for <nouveau@archiver.kernel.org>; Mon, 23 Nov 2026 08:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Gv9l+nMH
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE4510E9EB;
	Mon, 23 Nov 2026 08:48:33 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 791854038D;
	Mon, 23 Nov 2026 08:48:28 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795423708;
 b=KzZ75alsJS0/UcMFIaKeniwYw4dZMIQJ3qeBwq1GRxPXEWlhNatjZ267SB5Ny2FjDevv6
 +UWoKSDiUXTg7OxE5UKEerW+AlsFMYMj7aQbiyyG/ZMn/O24XYk5fLYiUqZhgfrminvJoks
 NEWCOnOlpYliuMeafEMCXp+RtKavICbJKX6Rn6LGFr/Y3S+k+rSclYADMsXhOODh2rQlGEU
 wlhIzYrocf+LPVpq11Roe0FyP+OKsIyyy6G3WHo08Ub/LIV3rk98aXtUZ6OV0oCF3KWwlje
 NbytFmlFfx44Qb6oR/54q1sWEDCTxwKc+T44O9FgxuBFRmLIk9SXGzeFVU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795423708; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=pUnM1GAlqWckiyCNJNe7ZYUuta6sBgcZx+7TRlqcMxw=;
 b=uEtqDRbPxYAD+HZSrDPB+yJsGAtt7dyal6L/ZOkVmnueyMovQaDxkoSyqeXKLMuZYW3FC
 dJcI4glew4fql7MwWB/62/aNP3IE3ldAQItJflOePUgh2nIeNuBPEpo5q8YOKQ96bzLDdY6
 4iHoItsmSQKXL4l//0irU+/DLKdK+0A7VELb1XtsHc+EUKkwyiTcjDUuQk5iyvJq7wTGPvj
 wrTeCDIBC+8CDwztZARsqUqivWe/y6QndTmwEHl0g8eORJDREffZGVlRiG/EH+K/3eTEdQn
 5NHSbZDCOraFxW7HSYBnnV/yOx3iq6v9LxCsL4aUbkSCNXUUrZ+XiboKP6jA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
 arc=none;
 dmarc=pass header.from=redhat.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4A927402E9
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 08:48:25 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0497E10E763
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 08:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795423699;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pUnM1GAlqWckiyCNJNe7ZYUuta6sBgcZx+7TRlqcMxw=;
	b=Gv9l+nMHKJXij4shj9q+IecdduorqI7cn3beJTUIdB+xDb265xwEoIJ4CJ5wo6d0XRKrN0
	uChE6/ZBaL8Ixsh7jAV0xmQgpkkAi5I57SatackxUwAUliqmq9/HO87cQ673NvOL6hhBOe
	oW2pdr36p0K9QbeDWFdauQe71aIdBB4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662--Mx_bSF3P2enZJ1AVBmfjQ-1; Mon, 23 Nov 2026 08:48:15 +0000
X-MC-Unique: -Mx_bSF3P2enZJ1AVBmfjQ-1
X-Mimecast-MFC-AGG-ID: -Mx_bSF3P2enZJ1AVBmfjQ_1795423694
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4bb69d84053so20009585e9.0
        for <nouveau@lists.freedesktop.org>;
 Mon, 23 Nov 2026 00:48:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423694; x=1796028494;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZIoXELwpYh1o5DnGcjLjeH54OjVLR8OUMZ7+fanJt4Q=;
        b=MQVCJV9j61jArwyDtKvMTHSPN6/Zplga891+5tEYmLySSuqKskwxwkJkQk+LqnRPld
         3zvUC8y4RMVt/NKXbVgbLgnw8k9j5quoW/06pVQ0ZJhp9rZ+PeJ3y5obsMdmieeQlpd2
         MnmnrzXex+0/D9VZ8fPL3T9Ym3K6kbOoi/Le4hGl0rpGArSLZAkTr0aC1Obzjxn/bVoM
         yFQU82R4cbaQDIarkOxGx576O5e6/ZqeVddmavTDcWVGJwsE9I0J75y7SJAaDDPVS9eh
         6d5rVBGeNydQ5dtA03XssHHRQe5+NuXOTwF0genn2Yj/LvG3Dv7Yj5oETNOY+naE8PYW
         dvmg==
X-Forwarded-Encrypted: i=1;
 AL+hErFONX3OzDeXCewRKWPBv55BV4BTmRAOBUFBIHPWDO4ofHeuDCgwS+OF9hBY4UFcQeuLadwoWqtJ@lists.freedesktop.org
X-Gm-Message-State: APuU4Z9Idn4GHwTHHlRgZnVXcecIAXhWFpNxcx364bss8O97+eePnWk1
	e0gN5kgl8clGGeaLNRpR0JvnnJAD8Oqrj+JcXVFWR+94T5s0c3RWeHqbzRTjWsHdWd+/dUU86b3
	oLoaE4+zEb4ndQWJi5u+zK5ae2oe3/HZ+OpOumIMetr81V2wxNqUORtZuroCPdwMMPSg=
X-Gm-Gg: AZFdTZdIgN9ipbN5ObOlNHcnz6P07BqpoGzQuIN8d+UosWe15DJPrzjjBlEUMShNlKP
	UPVrYfYC2/Hss/27hKVUBMUyCpLEbMuE4At5jsPhlZpyLH2t85TXWSzGTuS/WNVTbmm3yD+rSOg
	h+GBO7ldDqYhTutqcGhOPuAQqL/dYg/zO5JwwkSwXXiNCooybeNoHh+P0SADor+iIpJA26Of7ps
	XBCoQ5QwErywuu5I2+RL6+ni+6bRjwwUcs0CbsYG0jeHhzhqQKfmnmXzil7uOJDi72D/l39jklW
	/cp6D5w67aEEg17uTryy5NmLiHpcrEccMU2NwcnsPXS+ozAqqzsuiz4HL8++AkeAbd9zOn9vkM8
	YT5FZixuq1zf90JKyi/ziUXJ5/qaVTg36aldLvD8o3zNBJfK3tSiHJsmzTCwFF6wPLhKhQ83ogI
	QJqjOHwaKhcAi/KvifoX9j4rPl9T2TyzcHdafoLYk=
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4bb887c2c98mr206908865e9.4.1795423693837;
        Mon, 23 Nov 2026 00:48:13 -0800 (PST)
X-Received: by 2002:a05:600c:64c6:b0:4a3:598e:e7a8 with SMTP id
 5b1f17b1804b1-4bb887c2c98mr206908455e9.4.1795423693410;
        Mon, 23 Nov 2026 00:48:13 -0800 (PST)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
        by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb906d6a13sm155883195e9.3.2026.11.23.00.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:48:12 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Ville =?utf-8?B?U3lyasOkbMOk?=
 <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v12 01/12] drm: add connector LUMINANCE property
In-Reply-To: <awP0nasqAc4pAeMR@houat>
References: <20261119-superm1-backlight-property-v12-0-89d5217d3618@amd.com>
 <20261119-superm1-backlight-property-v12-1-89d5217d3618@amd.com>
 <awB4Qe83u0l0XPKA@intel.com>
 <8713bae1-9782-41d4-b09c-f14031203e88@amd.com> <awPvoLCDeq1YFLE_@houat>
 <awPzsMWZ7e0i6i54@intel.com> <awP0nasqAc4pAeMR@houat>
Date: Mon, 23 Nov 2026 09:48:11 +0100
Message-ID: <xlv14id8rl10.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Cp523Xj_yhSLEVOx0r5CqiVCDdHpunQuMFnRFp9LdJk_1795423694
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: UA5QHO4XMVDM6FNC4YT5NOSSUJ7MHZ23
X-Message-ID-Hash: UA5QHO4XMVDM6FNC4YT5NOSSUJ7MHZ23
X-MailFrom: fmartine@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Mario Limonciello <mario.limonciello@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 Mario Limonciello <superm1@kernel.org>, Xaver Hugl <xaver.hugl@gmail.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/UA5QHO4XMVDM6FNC4YT5NOSSUJ7MHZ23/>
Archived-At: 
 <https://lore.freedesktop.org/xlv14id8rl10.fsf@fmartine-thinkpadx1carbongen12.rmtes.csb/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Maxime Ripard <mripard@kernel.org> writes:

> On Mon, Nov 23, 2026 at 10:05:04AM +0200, Ville Syrj=C3=A4l=C3=A4 wrote:
>> On Mon, Nov 23, 2026 at 08:50:29AM +0100, Maxime Ripard wrote:
>> > On Fri, Nov 20, 2026 at 11:19:13AM -0600, Mario Limonciello wrote:
>> > >=20
>> > >=20
>> > > On 11/20/26 10:41, Ville Syrj=C3=A4l=C3=A4 wrote:
>> > > > On Thu, Nov 19, 2026 at 05:27:28PM -0600, Mario Limonciello wrote:

[...]

>> > > > > +config DRM_LUMINANCE
>> > > > > +=09bool "DRM connector luminance support"
>> > > > > +=09help
>> > > > > +=09  Expose relative luminance as an atomic DRM connector prope=
rty. Values
>> > > > > +=09  are driver-defined levels rather than absolute luminance i=
n cd/m^2.
>> > > > > +=09  Drivers provide connector helper callbacks to program thei=
r hardware;
>> > > > > +=09  the DRM core does not depend on a particular backend.
>> > > > > +
>> > > > > +=09  Drivers migrated to this interface will use it instead of =
registering
>> > > > > +=09  a legacy backlight class device. Leave this disabled to pr=
eserve the
>> > > > > +=09  de-facto userspace ABI in /sys/class/backlight.
>> > > >=20
>> > > > I don't think this will fly if it breaks the backlight class inter=
face.
>> > > > No one can actually enable this outside of some niche embedded use
>> > > > cases where backwards compatibility is not an issue. I think what
>> > > > you need is a generic backlight class implementation on top of thi=
s.
>> > > >=20
>> > >=20
>> > > The idea with this was:
>> > > 1) to get the series landed
>> > > 2) let compositors merge solutions around it.
>> > > 3) Then add backwards compatibility to kernel so we can flip the Kco=
nfig
>> > > default.
>> >=20
>> > I said this a few times already, but we keep having those discussions
>> > while the backlight sysfs handling is far from being the main point. Y=
ou
>> > should *really* consider adding support for the luminance property for
>> > something that isn't tied to that interface (like DDC/CI for HDMI), an=
d
>> > treat the sysfs API as a sysfs series.
>> >=20
>> > It looks like people just have conflicting opinions on this particular
>> > part that isn't going to solve itself easily. You should not treat thi=
s
>> > sysfs discussion as a blocker for the infrastructure work.
>>=20
>> You want to be sure backwards compatibility with the backlight
>> class is a solvable problem before you land *anything*. Otherwise
>> you might just paint yourself into a corner with no way out.
>
> I disagree. The luminance property is more useful than *just* for
> backlights but is also useful for HDMI, DP, and MIPI-DSI that would all
> use it.
>
> If that's the corner we paint ourselves into, it's still a pretty nice
> corner.
>

I agree with Maxime. Drivers can choose to not expose the luminance propert=
y
until the sysfs backward compatiblity is sorted. But this shouldn't block t=
he
core infrastructure to land, given that's useful for other drivers/use case=
s.

> Maxime

--=20
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

