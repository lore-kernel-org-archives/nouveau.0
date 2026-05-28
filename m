Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6A3CD5BD5
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 16:41:35 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B326E10F48E;
	Thu, 28 May 2026 16:41:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="YxinWkQv";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 84E7440707;
	Thu, 28 May 2026 16:28:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779985683;
 b=JdIofqpYYwMlv0xIFjqgwY5mtFXJSYz97/YCtvwLryrZ0eXw0dJNjOhCpSNO8ty1I1zjh
 1DI5jn3SgOtjgnxSjdTJq0boLwHXFcKOnxQJlD3pR9UqDNtIQXiQ5hyc4/zCZcWGsc8mlOH
 KZ6NSvOtIFBkCazvrZPaJvIkpnpv1I6GLZ+gWeakAL/fURNZURulTOg9WE/op9Z5M/hYkjL
 5IN97nB37yN6DtGVHVRqlfOAo3hYyU47awvzDcp/izdipkMLhwXAoPYt0WyMfhikSddDRg0
 r8oI3ENuJqgAa7r+TuucpvbaZyAXWKGhAlFKRLuCAQR+i0ryrMFjEFJoURmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779985683; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=XBGoB0L6+rOVHYnTM/R3c8pY5d+eoM/ES6oiySPeke4=;
 b=lKPqOAg6J5LbQzvDwFG/zfeqiAuUNbnUVyd7xRJ74+rmzmJFhX64kP34s14ZVcPRF0FJx
 Mo36Pl7i6utFKFi1cClVY/oRPoWA6A6TosHC2mGk0amXEsQtwEoxdWxjvL+NO0opuJhCL8g
 R6B/ZzA2ykBj6qQOyfZ2Y8Gl2i1txeRooow20QFZ0HSUf++0ky2kYG3HGmNKDDLCg6qAin7
 4b+euJ7m0BcVT0QIc5KoVMS/22nQvP9QLnClpJn0GetzQsGxlEmB40ThgMX05Wj7H3EPlM0
 LE/IiY2uvKCnn6i2fYeY8mwLlLhaAt2ksGT2HJ7praMJBR2+f6goqecpxVMQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 42A3E401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 16:28:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 17AB810F489
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 16:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779986489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBGoB0L6+rOVHYnTM/R3c8pY5d+eoM/ES6oiySPeke4=;
	b=YxinWkQv+ASOm+NJUtnK0jWdGN+Wl553TfkpxfxmR5771CMLlCS70llTxBoJzsmS3ySQVL
	5n8XYYtsACil2WfcKIT7+t2QkIGso7pTBNEt/DjphRmSzgeOvxAE64rN4Rsx/OGaKy8daM
	Z1Ao+qcIPCIqX5hBdcsvHqP/f3qA5H0=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-97-3I6HeMb5OHmgAOP4jyngZQ-1; Thu, 28 May 2026 12:41:27 -0400
X-MC-Unique: 3I6HeMb5OHmgAOP4jyngZQ-1
X-Mimecast-MFC-AGG-ID: 3I6HeMb5OHmgAOP4jyngZQ_1779986487
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-914b5249bc1so1055884785a.2
        for <nouveau@lists.freedesktop.org>;
 Thu, 28 May 2026 09:41:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779986487; x=1780591287;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBGoB0L6+rOVHYnTM/R3c8pY5d+eoM/ES6oiySPeke4=;
        b=NwacOlzt7WV8LsB6IAA87O4CK7L362UjNx0Xq6iOtpjg9juWB+NQwniX1j81pISM6i
         Z9ZENEDEaP3Lb3yeQHrX5JufHOFwKGia2sgS3mV9LxSHpjK6lvR2En35DXUHyxo2bk3g
         NSGRzuT6p+wWg3DuFQrOkGU5n68xUF0Ci2fd47M2e2e2HcpcTrKNEnmjW6qveeaKD0ij
         gj4xzr9fQXQH04rw2KVIXMpFhwvjO2lheLSBdoe0/Bb8w+BqTr9U8fUJTdYjuXvcxGu4
         MFry9iqiCD1B8uN9d4w5nxljOD6UcUg0NZmKlKWgGFC39TT5lbNo9dnx5A7diNGfd/XY
         yrOA==
X-Gm-Message-State: AOJu0YxbruOTdJXHIW+vX0BBXW2p431/IGsHftFT0W1KfFuZU2ttxW86
	B6PPaDFu/AcdfoInbf5+nXrmnaAheEx3KTa7PrmgzUDMUBKtoGyAPObPx2eacLfvHPThFN8Y934
	rLtCmgctPvlZqKuPMetwp6/8qwgDlqDWOKOD4utA8rEJDFdLr/c09SGtQGZcCQH8xaAg=
X-Gm-Gg: Acq92OFrZrY/k/sUqHeOdgG9Zv8mRAlj9Nz7erzH/BOmt+XqTRJXU1AzwwtyuM+IfVZ
	JSDBu1E6MADHJw95WIn6Phuvym7tj7zcQgoMuvj7ofiJ4CxA/g3Gh4BcpHl7kbUByiiuvKbvBqk
	T7qOBc7EX/HW80Nw5tDrb/h0EOCemPoC6leiLz+vEWK3xYPSTfDZneNABc+eC/B0dZXoTJhONOR
	PYT37XeTmLbfhUWJmONmslH33T6Yd1PeRNP5wpw4QkAl283/6bo36zxA4s+NFGZnkifkF0fS4ot
	CXL0aLtwTJIN53ZowXxrXfzdMuNhtsxPGqdUUjaKTX2fRZuZCi7r1mxbdvxUD4Vcze+BVWDNKPc
	4e5ukDVDscbdemTjueyU2j2qhHCdW
X-Received: by 2002:a05:620a:414c:b0:8cb:9975:cba8 with SMTP id
 af79cd13be357-914b49e13d7mr3947691085a.62.1779986487051;
        Thu, 28 May 2026 09:41:27 -0700 (PDT)
X-Received: by 2002:a05:620a:414c:b0:8cb:9975:cba8 with SMTP id
 af79cd13be357-914b49e13d7mr3947687185a.62.1779986486633;
        Thu, 28 May 2026 09:41:26 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-914f86e9bf5sm862446485a.8.2026.05.28.09.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 09:41:26 -0700 (PDT)
Message-ID: <794dbd35fd81f03478cdd3238d3d506d0d800187.camel@redhat.com>
Subject: Re: [PATCH 0/5] nouveau/gsp: Cleanup IS_ERR_OR_NULL() usage
From: lyude@redhat.com
To: Hongling Zeng <zenghongling@kylinos.cn>, dakr@kernel.org,
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	airlied@gmail.com, simona@ffwll.ch, airlied@redhat.com, ttabi@nvidia.com,
	bskeggs@nvidia.com, dri-devel@lists.freedesktop.org
Date: Thu, 28 May 2026 12:41:25 -0400
In-Reply-To: <20260528062451.54107-1-zenghongling@kylinos.cn>
References: <20260528062451.54107-1-zenghongling@kylinos.cn>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IyA0uc3UbvV1dCwMxsUtrukmeO2I1dktItzR6DhBJZ4_1779986487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: TB6PK75SJOQV2LNSK3ZIA2UV5S2G5HEQ
X-Message-ID-Hash: TB6PK75SJOQV2LNSK3ZIA2UV5S2G5HEQ
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 zhongling0719@126.com
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TB6PK75SJOQV2LNSK3ZIA2UV5S2G5HEQ/>
Archived-At: 
 <https://lore.freedesktop.org/794dbd35fd81f03478cdd3238d3d506d0d800187.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push them to drm-misc in just a moment

On Thu, 2026-05-28 at 14:24 +0800, Hongling Zeng wrote:
> This patch series cleans up redundant IS_ERR_OR_NULL() checks in the
> nouveau GSP-RM code.
>=20
> The core GSP-RM functions already return error pointers via IS_ERR()
> checks. Using IS_ERR_OR_NULL() is redundant and adds unnecessary NULL
> checks.
>=20
> This series is organized as follows:
> - Patch 1: Cleanup IS_ERR_OR_NULL in nvkm_gsp_rm_alloc_get/alloc
> - Patch 2: Cleanup IS_ERR_OR_NULL in nvkm_gsp_rpc_rd
> - Patch 3: Cleanup IS_ERR_OR_NULL in core implementation
> - Patch 4: Cleanup WARN_ON(IS_ERR_OR_NULL) across multiple files
> - Patch 5: Cleanup remaining IS_ERR_OR_NULL usage
>=20
> After this cleanup:
> - Error handling is consistent with the rest of the kernel
> - Code is simpler and more maintainable
> - The intent is clearer (checking for error pointers, not NULL)
>=20
> Hongling Zeng (5):
> =C2=A0 nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc functions
> =C2=A0 nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd
> =C2=A0 nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core implementation
> =C2=A0 nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)
> =C2=A0 nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage
>=20
> =C2=A0drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h=C2=A0=C2=A0=C2=A0=
 | 4 ++--
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/alloc.c=C2=A0 | 4 ++--
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/bar.c=C2=A0=C2=A0 | 2 +=
-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ctrl.c=C2=A0 | 2 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/nvenc.c | 2 +-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/ofa.c=C2=A0=C2=A0 | 2 +=
-
> =C2=A0.../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rpc.c=C2=A0=C2=A0 | 8 +=
+++----
> =C2=A07 files changed, 14 insertions(+), 14 deletions(-)
>=20
> --
> 2.25.1

