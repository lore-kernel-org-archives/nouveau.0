Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74DFFC5CFC1
	for <nouveau@archiver.kernel.org>; Tue, 11 Aug 2026 21:56:34 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 332E410EDC2;
	Tue, 11 Aug 2026 21:56:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="SxMSZEMQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2D43F476EB;
	Tue, 11 Aug 2026 21:40:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786484418;
 b=JMCkIY/y2zOJ90i4JiytNbZXaqxXElAwkCItkhhWYjqmQYS4vqPcX+3cXJTRcwE/XjSKv
 kq4dpbvEMeZFZ7wHt1BVfSZ1XWYAi71JyqRqY/utE6aRD9pzB0Cch5u5HdFmjXl/ak9HgGH
 el94dX8AvXpf/cWuFhOzbMJ0mFlnP6mA6HoAEJV8M/2UegvYcbR03+Y13rYvOospme4EstG
 imL/8JxjRHy6AXG6QtS4ry9rfipCM2KhBjxalplrK4n4TZ8v78qsuEU9JOh1QLLT8WF/3OY
 S/tkQUuk64lfI+8bt/be+XBx4mV60N8Nu6iW43MKAGZrIL5PTT9Mnu51glLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786484418; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UfO5GTjXHvoFpUxirelLBunZxdJGiurIwuNIlIkF25U=;
 b=fFEexz/lqeRCmkrSmReNHhdOM3wih9nDYrQ+I1IulNFkvnAvFP0JqYtHi9aqrCgpll+/R
 JmuLU9UUd3s2Au6bs091KZeYa4LTVlmAQUUwDN1w9EJrXEc2WPIASPQZZKHJiOCKfYS3uj/
 GHIydVo8SUPLly4hpmYGZywGKzBzytOUHbupOOwWBdcfKwT2/mtcpU8+FE/Lr7jYzmHwK+T
 JvHhz4R4a6GSiDA7/SKYyaaQ23lLr0jlM8WmYgznHWOr6LYA2censmr/cDL5trhb6K/HZ1g
 RvLSYphHmR3eynGyzW2Wx3rIXmJdE5oyZuhbAm05uTj+dV4fnZxNscL+FtuA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 06ACB476A0
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 21:40:15 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B14D110EDBB
	for <nouveau@lists.freedesktop.org>; Tue, 11 Aug 2026 21:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786485390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UfO5GTjXHvoFpUxirelLBunZxdJGiurIwuNIlIkF25U=;
	b=SxMSZEMQAaeEHAiU58GdJ2VMYi7v+PzvBQQ6CPfh5Uid+oSX1wOZYMfpzaHYQk81KG+37+
	GMUuEXPTHL5b1pnIev7/q39yplfgJcIQdPwXK4w0J7YK69GcbdeEG9nStLr/gpMxzLHDas
	ug5M3f9GW+58eobUiTrXofDQNh1lV70=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-Nom0pB9XPcaEoGK3bkI9JA-1; Tue, 11 Aug 2026 17:56:28 -0400
X-MC-Unique: Nom0pB9XPcaEoGK3bkI9JA-1
X-Mimecast-MFC-AGG-ID: Nom0pB9XPcaEoGK3bkI9JA_1786485388
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-90a60102d6eso2191076d6.3
        for <nouveau@lists.freedesktop.org>;
 Tue, 11 Aug 2026 14:56:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786485388; x=1787090188;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UfO5GTjXHvoFpUxirelLBunZxdJGiurIwuNIlIkF25U=;
        b=gDtfPv+d1S+W3qZHGrlPMb8lMqwvh1hoZ3t6XaqGpkSlx61DUdjzIf4k0TrB/iskE7
         zn8XNxpuN/2vKB0cZ790R5EzGhJQol6nR2dHbZNwIgcgqHkd6fqn0kSa5DnMnKby7b8/
         Mh3t8aWCQLa3ysI/9RHcid9vMPiHoOdDRWfq+SP4eDy1h2bSZdpY8o1Z4HrTu4GklF3o
         rOPbB83+t8+Z37RKjzke/ht+wUknZH03wCX5gMjrGtlYSovUXOqaFCPgIIa6QHwiybDd
         NcYBYfK7soMsJjVa8y7LoxZrpHdensTGnG/5MsNb4UYVaeckReEEyeJ2aMLwjpIQeU5u
         bPzg==
X-Forwarded-Encrypted: i=1;
 AHgh+RqDsOGcC3eDC1Xyf6QD9Ku6S5x7GkgKQQmKCNbabT+lqylGl8Epb/TTrs0Z6I7qwglJkesjEbKu@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy1E5Xkfwz8jqCcV1FOWZaz4uiKuQ/EIdZPQm8SYCM+GdhGfjwg
	ZNHc29JBHoxxwU+n4jsyS03X/W/hUQH5hOt/EsY9HXdokDPowqqYh1b7t0qvUuJAyY4MdBYf1CD
	3QPwPMmdkIygsX0sWg8xxuih4R/gRCBVlJMxNlmQDIO1gHvFX5VFxsS/NGwjZFHOrob0=
X-Gm-Gg: AR+sD12LfcTFpoBJai7oX5InfFKQJgGbQzZHcW0e9yIUtw5E74jTMa1P32LLerys2yX
	nxZkd6rpmauITiSlOsgI+MG9tUnwCK6fVQLnSkck3Gr/NbbBdZCHUobQDwtXwUmLzaOrvkbWPaR
	SfAxIS7mAzO89ViH2GVppC+20hdeBrardIM30BZMwAl5TS1kHTX78maLPwpF5GZku8YqPnx28U+
	zTD9WjcHvSrj0aZUsoHN7xvV/qSv0dT5ltr+AQNqQ4qgS1C1jhrZt2PFVXFFLvCeYmDRx8qaHz2
	f/wpv99AB920ghm3ZB46hI0zVnQGA/HRN307VzJ12Tmk6zWFQ1sXcA4VCmFiB+zPm2Pdp3Pl
X-Received: by 2002:a05:6214:44a1:b0:907:5150:a2dd with SMTP id
 6a1803df08f44-90a6ff95966mr2475436d6.14.1786485388244;
        Tue, 11 Aug 2026 14:56:28 -0700 (PDT)
X-Received: by 2002:a05:6214:44a1:b0:907:5150:a2dd with SMTP id
 6a1803df08f44-90a6ff95966mr2475246d6.14.1786485387868;
        Tue, 11 Aug 2026 14:56:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-90a6c26d83fsm8495466d6.4.2026.08.11.14.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 14:56:27 -0700 (PDT)
Message-ID: <1fb27dc24b3d01c9a6318b0dabc0e7571adb7cda.camel@redhat.com>
Subject: Re: [PATCH v2 0/3] drm/nouveau/uvmm: fix VM_BIND submit/unwind
 error-path bugs
From: lyude@redhat.com
To: Zhenhao Wan <whi4ed0g@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann	 <tzimmermann@suse.de>, David
 Airlie <airlied@gmail.com>, Simona Vetter	 <simona@ffwll.ch>, Dave Airlie
 <airlied@redhat.com>
Date: Tue, 11 Aug 2026 17:56:26 -0400
In-Reply-To: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
References: <20260811-nouveau-uvmm-vmbind-fixes-v2-0-aaee4b395d04@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: jhsoHhB_ktC9WBffYwk7iACQcCFb0uwdegEFHkp5DUc_1786485388
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: QJ2CBYZ2Y4Q5KID5RDBFOFCYDS7BHCSI
X-Message-ID-Hash: QJ2CBYZ2Y4Q5KID5RDBFOFCYDS7BHCSI
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Yuhao Jiang <danisjiang@gmail.com>,
 stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QJ2CBYZ2Y4Q5KID5RDBFOFCYDS7BHCSI/>
Archived-At: 
 <https://lore.freedesktop.org/1fb27dc24b3d01c9a6318b0dabc0e7571adb7cda.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

This patch series is:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Tue, 2026-08-11 at 16:46 +0800, Zhenhao Wan wrote:
> Three bugs on the nouveau VM_BIND submit/unwind/cleanup error path,
> all
> introduced by the original VM_BIND uAPI (Fixes: b88baab82871) and all
> reachable by an unprivileged render-node client:
>=20
> =C2=A0 1/3 NULL deref when the unwind loop frees a never-populated
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 OP_MAP_SPARSE op's ops list.
> =C2=A0 2/3 premature free of a region on a failed OP_UNMAP_SPARSE, becaus=
e
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 op->reg is left set on the failure paths.
> =C2=A0 3/3 a sparse region left permanently marked dirty after unwind,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wedging later binds over that range.
>=20
> Each fix is minimal and self-contained; all are Cc: stable.
>=20
> Signed-off-by: Zhenhao Wan <whi4ed0g@gmail.com>
> ---
> Changes in v2:
> - Add an Assisted-by: trailer to each patch; no code changes.
> - Link to v1:
> https://patch.msgid.link/20260811-nouveau-uvmm-vmbind-fixes-v1-0-40df1c04=
6b49@gmail.com
>=20
> ---
> Zhenhao Wan (3):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau/uvmm: fix NULL deref unwinding=
 an OP_MAP_SPARSE op
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau/uvmm: fix premature region fre=
e on failed
> OP_UNMAP_SPARSE
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm/nouveau/uvmm: clear the dirty flag whe=
n unwinding an
> OP_UNMAP_SPARSE
>=20
> =C2=A0drivers/gpu/drm/nouveau/nouveau_uvmm.c | 6 +++++-
> =C2=A01 file changed, 5 insertions(+), 1 deletion(-)
> ---
> base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
> change-id: 20260811-nouveau-uvmm-vmbind-fixes-c2dfab359df2
>=20
> Best regards,
> --=C2=A0=20
> Zhenhao Wan <whi4ed0g@gmail.com>

