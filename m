Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BFFC88E72
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 20:34:53 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7991010F111;
	Thu, 17 Sep 2026 20:34:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="O0TZAYm9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 66D1E48230;
	Thu, 17 Sep 2026 20:17:15 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789676235;
 b=u5OGa37Sm4tuV1lh9elGWgov5zh9XZ5yXhxUtvF6Skz3SNwHm3J+oAmE9RoVu++AWS7z6
 vu1spB3wGu0ss+URYt6rOL4WNqAYggxqceAFUkQDkgyy6Ig/+OOsAcJ7zgMufBzPKZC1aE5
 GgmDEJdBExOtgVU4bDpMPFlk1e7hOJzXoaFFHw/KSa7ALLHU1QitnYFrz+41z0xS64t4tSB
 30VfBCd9Gv8kdfndvzJahOfkp8P3c5POzE06GJ3QvNOcMzvMt/+IwEtsCqsKrpJQyAR3i1n
 qxeFiusOIMJHcQYRVVRUD8jw9m0+m1kfpG01Nl9VN+N9a2P35fYYsiTdObJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789676235; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
 b=T9L8YsKzssHR2tKQi0bLlBQSIDzsne4QiQjjlwjb3j9Tfvv0ypc24c4ReN+5KfAqCFCdi
 R0KXcVxFWk/LhWr3l65Wdnhf4xs7GKkKFEZSxhPu4pcKyPWhplkLXyw3vBH4JQGafULOH8z
 3r7HKPjwDlATRl+trscHWjWA7wegbTt5T330Ygj6mOvpiSTu3dt46z0fZJb5JW0iXcZIo9l
 p9eMXXjy8FLM8kVFN58Y2z8Ovzs/Z9EOe9gpa8t0KomAHfyWgpCs671mvc8JH9OyemL5aZv
 TGhj6WXWpjZ5KEUIF2hxUAqbZhSoTbySHJ+m62cFH7T6Ev7PNu8gFFoRK4ug==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id ED0A4481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:17:12 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5AE010F106
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789677290;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
	b=O0TZAYm9PNBBakPWkNOZcS9QOqthErBjwXIzKtJA5MOOqxG+N5fI3P1/KevGILP2Rz43i+
	bfOWhO19rGX5poak4y3kb41fpjBRVxdl81MFp10nZtZohIoIg0rLm6+P+qYQpH8wQUYlkz
	wJV0lLGKcek2XfA90IYaRvbkIMntEew=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-aiKHaDMRPrmKxRtf6llpUw-1; Thu, 17 Sep 2026 16:34:46 -0400
X-MC-Unique: aiKHaDMRPrmKxRtf6llpUw-1
X-Mimecast-MFC-AGG-ID: aiKHaDMRPrmKxRtf6llpUw_1789677286
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-93bd22160bbso7412885a.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 13:34:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789677286; x=1790282086;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mYjbBVwargHWsKu07Jhp0TKQU4hcLQthxlQyB3uB2hE=;
        b=XnkWt3f4v2APmMpu//noaDpZX306GS6rpPsS3YfsLc2t/cgrZFpayQUQpulxH/R9rn
         SBXLYCObHc6C3gA/Z7fXnDIn6cJPU81Ws/AmM8g6veoPFHIqNtE+W71NjQmzzthaR/hn
         T8zlNUeUb39aArERGg4PDmi78yqdkjbVdCVsRZzL9ZTP7uyP2EU2zcY7aKqzATY05yDb
         aJp22QgdoDkGsk/iW0+UwJpfhONxL4UGVQ/WIR3tfOZTrAk3FOACG122cVkjqlLYwBLO
         ncueglbaZH2tAa5wazCEhNZR0wgwZ/+uU/k0BAgvorYzauIX0Df/DeOKaKkCt3HfAv9e
         BRnQ==
X-Forwarded-Encrypted: i=1;
 AKwUvByzWcAIWNxbpyAPbkyC8YhBJTWPWBjNbrd7KdIkPHlYiejsniFogPb9cxH3rZfxgmyNGx1pY+kF@lists.freedesktop.org
X-Gm-Message-State: AFuF++lKrAY/6x9wUlBMX0QQOY6m9k6aWn/i1f1A04AS1XNJzKifvxxC
	lEenJIyOVnloVjCLykDi1fL7E1EjIBgeALzYqpIf6VP9MlriQCCJINUWR+5doZlhx3u9N2Lc/UA
	ynzgxsc/16sWTy/KXVC+xqT85bh/JtPOzPAzPCs+Rgoejx92CKYUEfO9gP3qctiYmdR4=
X-Gm-Gg: AYBFou1q63lK85T3DYdJFwIyIbCvfgL9/+He2EN9uJPQxcF2cg+OEzkmkrGcNOnW4Yt
	eDqHqweqMzsOY6Ut6wy6ON7Mv/6I3wdXSCedDdjlZ3+AZaB1rLV5kEG6FeadSfnQkfbR5pKrna6
	o00wKlYobFXR7AEiyoogtbr42Bp2IrmZUfsSmAQNuOz7B4RHkXFWbu8WWF9//B+U/CqRJEDQLCX
	yirWM59vL3qejpX+O/tadFhmgkL2Fmclde092y+WwpJznhF5uG+M1K+He0oY5i3GUZH3YAePGG7
	4wzdI0zP1rmod27qrxqyJNacO0N9sy0DMMcChinJqT/zj90V3awxHhoZmiZHtTFRmT9rI6eo
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id
 af79cd13be357-93bdca433b5mr16959885a.70.1789677286172;
        Thu, 17 Sep 2026 13:34:46 -0700 (PDT)
X-Received: by 2002:a05:620a:254a:b0:93b:d79f:d951 with SMTP id
 af79cd13be357-93bdca433b5mr16957185a.70.1789677285807;
        Thu, 17 Sep 2026 13:34:45 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93b781deec2sm559137785a.7.2026.09.17.13.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 13:34:45 -0700 (PDT)
Message-ID: <fcd366286750d61f0d4e2b99ddef2a9d36e72b0f.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau/bios/init: drop unneeded semicolon
From: lyude@redhat.com
To: Julia Lawall <Julia.Lawall@inria.fr>
Date: Thu, 17 Sep 2026 16:34:44 -0400
In-Reply-To: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
References: <20260801191002.1383835-8-Julia.Lawall@inria.fr>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ugrEOv5s9CgmtIDq8MWEt5T_kkBBvLr-iM5xg2ZVfDA_1789677286
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: 5Y5RFHAWLENDHFVPHQZZTRUT7GETMZKK
X-Message-ID-Hash: 5Y5RFHAWLENDHFVPHQZZTRUT7GETMZKK
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: kernel-janitors@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/5Y5RFHAWLENDHFVPHQZZTRUT7GETMZKK/>
Archived-At: 
 <https://lore.freedesktop.org/fcd366286750d61f0d4e2b99ddef2a9d36e72b0f.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-next in a moment

On Sat, 2026-08-01 at 21:09 +0200, Julia Lawall wrote:
> When a function-like macro expands to an expression, that expression
> doesn't need a semicolon after it.=C2=A0 All uses have been verified to
> have their own semicolons.
>=20
> This was found using the following Coccinelle semantic patch:
>=20
> @r@
> identifier i : script:ocaml() { String.lowercase_ascii i =3D i };
> expression e;
> @@
>=20
> *#define i(...) e;
>=20
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
>=20
> ---
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c |=C2=A0=C2=A0=C2=A0=
 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> index b54f044c4..3f888fb97 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/init.c
> @@ -403,7 +403,7 @@ init_table_(struct nvbios_init *init, u16 offset,
> const char *name)
> =C2=A0#define init_io_condition_table(b) init_table_((b), 0x08, "io
> condition table")
> =C2=A0#define init_io_flag_condition_table(b) init_table_((b), 0x0a, "io
> flag condition table")
> =C2=A0#define init_function_table(b) init_table_((b), 0x0c, "function
> table")
> -#define init_xlat_table(b) init_table_((b), 0x10, "xlat table");
> +#define init_xlat_table(b) init_table_((b), 0x10, "xlat table")
> =C2=A0
> =C2=A0static u16
> =C2=A0init_script(struct nvkm_bios *bios, int index)

