Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91886606A32C
	for <nouveau@archiver.kernel.org>; Mon, 23 Nov 2026 21:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Es3UkxZ/
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 79AD110F22E;
	Mon, 23 Nov 2026 21:15:08 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3F84F4039A;
	Mon, 23 Nov 2026 21:15:03 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795468502;
 b=XfPqql+ndIDkbmJyGTyM9cckQ8YJSvPg8c6MJ+s4xkKl8rffOXnxy2SGn2x10z2f+tYS2
 IPbMyBrqmKFl94Xb9pHKlNd17QVN3a4vuLJQ1VwD2xOqpuj8lYMzA1aXZanvnU/x+D8kJun
 0yxW9tgpdTox1I08wJcpPukFF1hlLk0mjis8T80Fed/n3xAbX+xWDxGWwDC+hP9YQ+ah47M
 hRsDEe/YePtuaMv3KvLtesjCjp4sXDe9u9unWg4ukaaMCpk1G8QdHFxXYNfP45xO4Fen0wl
 8bXTLMBqtHXrFbwycTw+i58yVgCRg2nnt85UHE/JsMBmFIj3Ch26/kuxYmmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795468502; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=uMUkPd17tmOQBq2oh/KOicPLQhomscvQuJiftTF2lFc=;
 b=fIRNVTD5/nbX1uxRSXE679JqpH/JeEHIHpotY7aOByd8i5P84SHpSVGCa1psp3QNBovCa
 C2SurumkFrhlL0Hqka2nhOPkkbd3eS4k101LvrXnFMbTKUVDGBvBHCZaL8ppD28UmTEWkUs
 MV9Zdkx5+e69/SjhCqbx15o3p+u6NLfw/OSvhqH28C8vYZGB0wXgDWSu0RNMie5bc13Mptu
 zYTYntKNjb5slNIHHQ81dflLTb26Z/G6M+zfFtwAtYLQsUYCeAUcdtRmLcmucpF0PxQcx3K
 IgN+VcfGuxNjVTUfGwkYxGrE9z/gdn58n4s3n+cEp7+fiaCdTfRQqCER7HYg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=kernel.org;
 arc=none;
 dmarc=pass header.from=kernel.org policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 336AB402F3
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 21:15:00 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9EB10F20C;
	Mon, 23 Nov 2026 21:14:55 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EF691436FC;
	Mon, 23 Nov 2026 21:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7251F000CA;
	Mon, 23 Nov 2026 21:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795468494;
	bh=uMUkPd17tmOQBq2oh/KOicPLQhomscvQuJiftTF2lFc=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Es3UkxZ/c5iLCjXzVJ/DrmMfMuRgCNrr/zsOCRDRPHOUs5nZJXeCxpcnJqTKK+ny7
	 N2G/kPyASzYdhV4KhuqBINhWf+//1ETeflW7nMfLA9M4Mc8AA3psgTDAcCmltHK/AZ
	 SQ/vXKdPMHhZzsPmKLBaWLe2wG0OeU+Hq0lptxMe7DPAhOzwLgCNzVUtRcY+19E4hF
	 XKCKFn6oVTmbe4vEXTIzxHVq1p5Snk7jmtwclc4llkhmQRkL1qsQglgH8azHZwwl76
	 zV/NhBcWYGyrn2etfZM0AOQ68wzGVAuM8niiltu/snaeTAetd6G8jL9PQRtWMDfGly
	 hRuY8MIy4sprg==
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Nov 2026 22:14:51 +0100
Message-Id: <DN2WGM8KWOD4.1Q96FIYG22NA0@kernel.org>
Subject: Re: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable
 GPUs to other drivers
To: "David Airlie" <airlied@redhat.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
 <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
 <CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com>
In-Reply-To: 
 <CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com>
Message-ID-Hash: EQPW57FHCKD5ZEPDJR3UNTI3VBZ6U2CM
X-Message-ID-Hash: EQPW57FHCKD5ZEPDJR3UNTI3VBZ6U2CM
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/EQPW57FHCKD5ZEPDJR3UNTI3VBZ6U2CM/>
Archived-At: 
 <https://lore.freedesktop.org/DN2WGM8KWOD4.1Q96FIYG22NA0@kernel.org/>
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

On Mon Nov 23, 2026 at 10:11 PM CET, David Airlie wrote:
> At some point we need to give the option, but indeed we don't have to
> right now, if nova developers are fine with always providing the
> command line option then we could drop the bind options for now,
> but I know it can be annoying for devs.

I'd prefer to go with a Kconfig option right away.
