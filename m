Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DFE8606A31A
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 11:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fnu2kLH3
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC7A910E219;
	Sat, 31 Oct 2026 11:56:02 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 6F2CC48C65;
	Sat, 31 Oct 2026 11:36:48 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793446608;
 b=q1ZpM3Jvnwnpqtpn89HPsn+VlpohEwDkNwHlgKDdzMOy5Ivb0OU5OdwJ4VwVua0qNnV20
 pgHqFX2TPfkY4FtPnNySepJ01v6M5Awqx2+c7D2hS+ZUtYxP3kFMTvCZ9v2ZU46e23TFNtx
 0DkxThCYmdIu8uukHyQi5bvFUd5tD+l9O+ak6DlsAyi5cjOvJnzaKFdY5Rtfesn+1QeOYk7
 u1imrRSuwCQ4kPfQ5KFGBpxyQDhTz8kP9gL6DPJjL3rTNmq77DL9LnNIzDLawprLv7sR6Vw
 mYzkC57tYE1htCAvC355inkX8rn1X4M2j9XZHnzss5ANW/wWkluVRMx92XJQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793446608; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
 b=jcSUEahgTni6R52y/9w++rSaSmPSVTCp4C113pL7qrOmhqReIOVXRP1KmFTiHztPizajl
 57/GvYQNaxEmveL319yvq+J19b25za8lUW+N5EfojRnE2ceHXtl7vZFNU300RjBOwzQq4oL
 bRS5C8tPRu7WsuTratoEinqmxLc3nLjm5LSZCHnRGKNTQcmG9IHFzNUfFXyfhPtSpWiv0KT
 uhGYU1+ymuaE2asT/PnT/dCNDJ+bcv1umjZZouWabgmM7yWi/oC0SxJcXOTEqp76PkVvaGy
 ClUOdVVvhxI440Sd4rkFnjqRM9FmWk2LUigzLgGmE3j55Ql3ZXjXvbjmOt5A==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 8BB7948C5B
	for <nouveau@lists.freedesktop.org>; Sat, 31 Oct 2026 11:36:45 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com
 [209.85.167.174])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B264910E013
	for <nouveau@lists.freedesktop.org>; Sat, 31 Oct 2026 11:55:54 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id
 5614622812f47-4f699fe49b3so1002392b6e.3
        for <nouveau@lists.freedesktop.org>;
 Sat, 31 Oct 2026 04:55:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793447754; cv=none;
        d=google.com; s=arc-20260327;
        b=D85q1U4ShkdUNbzY5mTZ3e+hO+GvVEDahUSm7ecpE4TcoC5EUlnPif5sDq6X0gxwxz
         3dpVonU8uDZvmCAbIL8JD+i/Iyb09osVf2DK1OdYj8ZE1hTApqnAe3s7Hc3gSksooArV
         jDdJSIMB47ujJwotrUukjjmOmeVWmpy3N3VK0u2jv6h2iEqw53n/iE5kCpPr9CWAVTF2
         X6WnqyOY3NbQbPbv8uAAW5vl1hfDyIw1h2IZwHaoJMWra0LRBTZ27xNQPggCKez2F6D8
         DydsvmTUuRNT9GzOffjfU3V/utTbOUjTSW1D7fN9JXdqmJCPfJLiZ3zw0p4JevJ8gNKT
         1chA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
        fh=qzPtmdfJVxPK1fLIxihdEl/XDQp3fWAZJJXSWgLyB1A=;
        b=HrTQij7OOd8eTDyRMEXY2NfMV30uod1LJXoALgO37Rx2zjqYvhj3/0L+tI+3tzihat
         RdWFnht74S11uBepyXO3mZAI17ROYl4yOBj33dtDDzDWMxjfLqgcYMNVx+37K4dPxleP
         RJdsUQuu60tQEF1jVocAITqgRqLeHe+lBllI+RMUaXUQZSlU7q/uE8CEo7VzZQG4eAek
         /bk0zILGnIMXdCGnMwTHzoHOMdetcoYhmd1QWoWm3b3tVvZ2mMex404IB5m69bZXYaY2
         +S2C6+1Ez+yM22VT7UPZ9fQqoS/PfuNmhyV4OTpkk7+ktFcEug00JRAlxXv5iMyp80Qx
         npOw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793447754; x=1794052554;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
        b=Fnu2kLH3+2QJe3IbDYzmaOdayoekjUzBI65QahLjevY4DOY54gadIHTAkMXIwS3lXs
         B48Lb9vx4llAuljHiBiNrdlKgkV2+k4L4p/FzMeGjpXQCnDcjLeuhxDxxBIFpBzqU13X
         DLFpmgY9qVROy06iTcyOhHGhlDYmaWysCWtMC3NKuxwnuqSXDKgFOAiRlHw4o3CENP1H
         NFSfKgQP0Gk2XsIwiL5jNDTBvya0/vMO6Ewem0wT7kDEreSfvPrfPKmow5PpySLDP9bj
         AYtPMJAzKOfVkMUUiur2krvnA2KBb5MrD99xK/zFjyln3bOIceYQIL3cYc69BA6g7r8C
         gCeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793447754; x=1794052554;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=L3x/YuVDEAhtU0De0l9xtSKaA6j4KOr096Zh7WSUTJA=;
        b=ApgmchRJGI6uybhLqw/hD9Abd/+3dRFwaMRFDdyJUFY0N9y6JmZJJaxgo/d8dJfSdv
         BiOnXvQ+Sos8H76HsmmDN8OgbkE6KWk2kcOr3kdmeoU103iK/jEP+t2H0FO58T4sIUlD
         wd19JdsVlt57hbXHTg7rQtfsKH58CPYK6gdI4Uax3zeH/Nh1UVsx1DtojW3wW2rWjAwm
         jMUnf/NPvmpN2HR/s1cwxfEs9bu9XJGPlZnRX8+uEHJJs0ipApki2ZcVIGEUBIX4KimN
         hpb7N+11lKJpNkbrYmgEh9XVs8YezNDe0GuaAMuHWpHo/ZtLI7caG7VLc9tZxJdqe1L0
         x2wQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxnPLpBzTLool/JB1gfxfw42iofKmeZTYfyWo/mD0yLXW6rD53fkhK2XRJc4D6Iq045TjS1e+Fk@lists.freedesktop.org
X-Gm-Message-State: AFq9FYKnnb+RwG7U09SBqrl9SyxkT/ig6Z/NUbQFnv7AjLWKNVJG3T8u
	HT7GOY4Za1Fw2DEiHM9iTVBOz9wetwhHBsw5bseG9+mtilQ8pZaScjqsBi6E8CL5J6UCe1EaIt4
	q9peQ3AbJ6BF74hMjyy2bBWMfronRb8s=
X-Gm-Gg: AYBFou2IziyEglpWJgznDNBSBibeuaEAHQj7SVtFI9lS5XbxKc1it+awyS3sykfY8OF
	SsC50dn5H58Rur+JZgWlmumkfL9Gxm+jHqvE9icBc2BnWQOepTQv2UM18JvbFkZiwOOncQrKwea
	MdkOCsP73/K9ulnYQ7q0qx6Qz42RlCKLcmo7TsSs5L8cdgYPxJ25FWLrttSSRCdyDu6XTC6Gxut
	MZs2oaqFizBeEmIa6lco3P9CwGqaBnPveUFY5xZiqikDq7ThezWErKuzwBNg7gCVM9fHI0ln7oo
	cpRwW/CzgMci5q85mZMZxKG0rAbClhMiOPcEnwH0aVlScNUqjke/dXIWJgOuLs3aCNB0f56WREr
	IVwVUA+G15O+u8gnhWGEPWUld2dKWBnTiQAQ=
X-Received: by 2002:a05:6808:1995:b0:4dd:18c7:5448 with SMTP id
 5614622812f47-5640de57273mr3442963b6e.56.1793447753718; Sat, 31 Oct 2026
 04:55:53 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261029101826.72773-1-dmitrymalovanyy@gmail.com>
 <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
In-Reply-To: <20261029101826.72773-5-dmitrymalovanyy@gmail.com>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Sat, 31 Oct 2026 12:55:42 +0100
X-Gm-Features: AclHuK-b8gKFoUWpyTo444rLzOgzwu65XdKwpgADL5v7IbA6k1YL_6vO__BFY74
Message-ID: 
 <CAMeQTsaRxZkd7Pawwj-DtZKkRazVUmBM5=DGOQs=y5Yohqt85g@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] drm/gma500: Use drm_dp_enhanced_frame_cap()
To: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VZBAI2W3HFJROBBF7ZBFRLRU7YPYFYGP
X-Message-ID-Hash: VZBAI2W3HFJROBBF7ZBFRLRU7YPYFYGP
X-MailFrom: patrik.r.jakobsson@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Harry Wentland <harry.wentland@amd.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VZBAI2W3HFJROBBF7ZBFRLRU7YPYFYGP/>
Archived-At: 
 <https://lore.freedesktop.org/CAMeQTsaRxZkd7Pawwj-DtZKkRazVUmBM5=DGOQs=y5Yohqt85g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, Oct 29, 2026 at 11:18=E2=80=AFAM Dmytro Malovanyi
<dmitrymalovanyy@gmail.com> wrote:
>
> Use the helper instead of open coding the check, so enhanced framing is
> used for all DPCD r1.2+ sinks as the spec requires.
>
> The helper takes DP_RECEIVER_CAP_SIZE bytes and gcc warns about reading
> past dpcd[4] (-Wstringop-overread), so read the full receiver caps like
> the other drivers do. That is 15 bytes, it fits in one AUX transfer.
>
> Compile tested only.
>
> Signed-off-by: Dmytro Malovanyi <dmitrymalovanyy@gmail.com>

Acked-by: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>

> ---
>  drivers/gpu/drm/gma500/cdv_intel_dp.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/gma500/cdv_intel_dp.c b/drivers/gpu/drm/gma5=
00/cdv_intel_dp.c
> index 8d0626ddf..0973598c7 100644
> --- a/drivers/gpu/drm/gma500/cdv_intel_dp.c
> +++ b/drivers/gpu/drm/gma500/cdv_intel_dp.c
> @@ -262,7 +262,7 @@ struct cdv_intel_dp {
>         uint32_t color_range;
>         uint8_t link_bw;
>         uint8_t lane_count;
> -       uint8_t dpcd[4];
> +       uint8_t dpcd[DP_RECEIVER_CAP_SIZE];
>         struct gma_encoder *encoder;
>         struct i2c_adapter adapter;
>         struct i2c_algo_dp_aux_data algo;
> @@ -1070,11 +1070,7 @@ cdv_intel_dp_mode_set(struct drm_encoder *encoder,=
 struct drm_display_mode *mode
>         intel_dp->link_configuration[0] =3D intel_dp->link_bw;
>         intel_dp->link_configuration[1] =3D intel_dp->lane_count;
>
> -       /*
> -        * Check for DPCD version > 1.1 and enhanced framing support
> -        */
> -       if (intel_dp->dpcd[DP_DPCD_REV] >=3D 0x11 &&
> -           (intel_dp->dpcd[DP_MAX_LANE_COUNT] & DP_ENHANCED_FRAME_CAP)) =
{
> +       if (drm_dp_enhanced_frame_cap(intel_dp->dpcd)) {
>                 intel_dp->link_configuration[1] |=3D DP_LANE_COUNT_ENHANC=
ED_FRAME_EN;
>                 intel_dp->DP |=3D DP_ENHANCED_FRAMING;
>         }
> --
> 2.50.1 (Apple Git-155)
>
