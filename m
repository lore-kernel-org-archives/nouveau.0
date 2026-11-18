Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3845160A2620
	for <nouveau@archiver.kernel.org>; Thu, 19 Nov 2026 15:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=lO8vUGAB
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 2180F1125B4;
	Thu, 19 Nov 2026 15:37:52 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8318C404A4;
	Thu, 19 Nov 2026 15:37:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795102669;
 b=uud5ftR3erUSaL8cz2lUqenMQPhRLeQEwcMCFoeG79H1tuOr8Og+YIc9UXzGIM+OdlwPp
 JcXLybMGjJ6BRNVlz05FKR7A1+x0gsqPPf9R2X+jGkJhnD0RuThtQ+zQ3U8C09OCb4NTUoX
 DtikDPc5yqR4LCo75VEUI3zOTEMrDQRTjNp6+QSkuQpuHccrIZ4kJuMQfS2hdocphcPt8gJ
 wwMenGR/LuJsOrL3K+QEWsccgphCZt90lgJS6D8Svsdtq4e3sIaurz1zg3j3Ip2SYCdZPNd
 Wyb+7gZXxB1hMGg8MZAja4hZhYV+hsUkiaa1cQB84odrKglL764o8H9WTtIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795102669; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=kSUE/o5CqDYurph69R6wpud9Np7SIjoEFQ7s0L3TdZE=;
 b=azmOhhxQCmZeDQXnQtqEEnQ6rH5r9ipGDyJheuWVaYN+SriJcpPiEBGnkV1BdlOmeQEz7
 QoymqekXDz1yBLsobfZrWRaWBYlqc9kv2zgMECobhotWp+b6XKw9T8IUxDiEEfxfgilfn12
 15j1/2DbwtWLaudSfm4JyYBM1uJ/o6sj5ytWabj/cQzlAacfNRGFveU1z5JB6C0N4uIgBYD
 ysREIP32YggzAjLxIeyJa+CoUQdRPCrKkgiV8DPqImwyK0WDE4rf9VonXwEY1RZU4KShwRn
 LyjXwaaoBp08J5F6j4eqHWjNEkvfXOlhdo+QQ3DWTw2K787tKaJmyZlSYNJA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=inria.fr;
 arc=none;
 dmarc=pass header.from=inria.fr policy.dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=inria.fr;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=inria.fr policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id DB9CE4668B
	for <nouveau@lists.freedesktop.org>; Wed, 18 Nov 2026 13:55:23 +0000 (UTC)
X-Greylist: delayed 428 seconds by postgrey-1.36 at gabe;
 Wed, 18 Nov 2026 14:15:12 UTC
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6881B10FD08;
	Wed, 18 Nov 2026 14:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=kSUE/o5CqDYurph69R6wpud9Np7SIjoEFQ7s0L3TdZE=;
  b=lO8vUGABN3SRz8stmFI6GOw5EdtNndRF+CQvv0/fdjATmxkGTAFZQyyX
   q3S3Iji9niTjJuaRWhbudJSEAZZKtnIYWDJnU5+hLPXuIFXtC4McFue5K
   zJmH9mSahEE3uuCKvqXtwc7RUVjEQny86msZaIn/W22PRg53MToih5RN6
   4=;
X-CSE-ConnectionGUID: NpDResvMRHWEoFCgk5A11w==
X-CSE-MsgGUID: tkj3zeBCTZKFS5tJsQM2+w==
X-IronPort-AV: E=Sophos;i="6.27,219,1787004000";
   d="scan'208";a="306121450"
Received: from 72-255-236-003.static.imsbiz.com (HELO hadrien)
 ([72.255.236.3])
  by mail2-relais-roc.national.inria.fr with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 15:07:35 +0100
Date: Wed, 18 Nov 2026 22:07:31 +0800 (+08)
From: Julia Lawall <julia.lawall@inria.fr>
To: Bence Csokas <bence.csokas@arm.com>
Subject: Re: [PATCH v4 1/2] overflow: Add offsetofend() variant of
 struct_offset()
In-Reply-To: <20261118-offsetof-v4-1-95b385c10b22@arm.com>
Message-ID: <c6fbb025-8de-b716-5d32-877c3d3fa2a6@inria.fr>
References: <20261118-offsetof-v4-0-95b385c10b22@arm.com>
 <20261118-offsetof-v4-1-95b385c10b22@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-MailFrom: julia.lawall@inria.fr
X-Mailman-Rule-Hits: max-recipients
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-size; news-moderation; no-subject; digests;
 suspicious-header
Message-ID-Hash: 3LF7EEIRT24P4LWOBZW65K5PPIYDBFD3
X-Message-ID-Hash: 3LF7EEIRT24P4LWOBZW65K5PPIYDBFD3
X-Mailman-Approved-At: Thu, 19 Nov 2026 15:37:46 +0000
CC: Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?ISO-8859-15?Q?Christian_K=F6nig?= <christian.koenig@amd.com>,
 Philipp Stanner <phasta@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>,
 Cristian Marussi <cristian.marussi@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Danilo Krummrich <dakr@kernel.org>, Zack Rusin <zack.rusin@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Selvin Xavier <selvin.xavier@broadcom.com>,
 Kalesh AP <kalesh-anakkur.purayil@broadcom.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Chengchang Tang <tangchengchang@huawei.com>,
 Junxian Huang <huangjunxian6@hisilicon.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Miri Korenblit <miriam.rachel.korenblit@intel.com>,
 Jes Sorensen <Jes.Sorensen@gmail.com>, Ping-Ke Shih <pkshih@realtek.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 Guenter Roeck <groeck@chromium.org>, Nilesh Javali <njavali@marvell.com>,
 GR-QLogic-Storage-Upstream@marvell.com,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Martin K. Petersen" <mkp@kernel.org>, Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Namjae Jeon <linkinjeon@kernel.org>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Shyam Prasad N <sprasad@microsoft.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, Carlos Maiolino <cem@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?ISO-8859-15?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Simon Horman <horms@kernel.org>,
 David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Steffen Klassert <steffen.klassert@secunet.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?ISO-8859-15?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
 =?ISO-8859-15?Q?G=FCnther_Noack?= <gnoack@google.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "Geoffrey D. Bennett" <g@b4.vu>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-rdma@vger.kernel.org, linux-hyperv@vger.kernel.org,
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 chrome-platform@lists.linux.dev, linux-scsi@vger.kernel.org, cocci@inria.fr,
 linux-fsdevel@vger.kernel.org, linux-cifs@vger.kernel.org,
 samba-technical@lists.samba.org, linux-xfs@vger.kernel.org,
 bpf@vger.kernel.org, ipsec@lists.linux.dev,
 linux-security-module@vger.kernel.org, linux-sound@vger.kernel.org
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3LF7EEIRT24P4LWOBZW65K5PPIYDBFD3/>
Archived-At: 
 <https://lore.freedesktop.org/c6fbb025-8de-b716-5d32-877c3d3fa2a6@inria.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-13.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On Wed, 18 Nov 2026, Bence Csokas wrote:

> Many call sites of offsetofend() use it for the purpose of pointer
> artihmetic. Thus, a common usage pattern is:
>
>   offsetofend(typeof(*ptr), member)
>
> Capturing this in one macro helps keep lines short and terse, while
> still making the purpose clear. It also helps discourage spelling out
> the type name on every callsite, leading to more maintainable code.
>
> A similar struct_offset() macro already exists, so add an offsetofend()
> variant in the same spirit.
>
> Signed-off-by: Bence Csokas <bence.csokas@arm.com>
> ---
>  include/linux/overflow.h                     | 12 ++++++++++++
>  scripts/coccinelle/api/struct_offsetof.cocci | 18 ++++++++++++++++++
>  2 files changed, 30 insertions(+)
>
> diff --git a/include/linux/overflow.h b/include/linux/overflow.h
> index d0f04436343e..c029d68daeca 100644
> --- a/include/linux/overflow.h
> +++ b/include/linux/overflow.h
> @@ -464,6 +464,18 @@ static __always_inline size_t __must_check size_sub(size_t minuend, size_t subtr
>   */
>  #define struct_offset(p, member) (offsetof(typeof(*(p)), member))
>
> +/**
> + * struct_offsetofend() - Calculate the end of a member within a struct
> + * @p: Pointer to the struct
> + * @member: Name of the member to get the end offset of
> + *
> + * Calculates the offset of the end of a particular @member of the structure
> + * pointed to by @p.
> + *
> + * Return: number of bytes to the end of @member.
> + */
> +#define struct_offsetofend(p, member) (offsetofend(typeof(*(p)), member))
> +
>  /**
>   * __DEFINE_FLEX() - helper macro for DEFINE_FLEX() family.
>   * Enables caller macro to pass arbitrary trailing expressions
> diff --git a/scripts/coccinelle/api/struct_offsetof.cocci b/scripts/coccinelle/api/struct_offsetof.cocci
> new file mode 100644
> index 000000000000..5a30647d3787
> --- /dev/null
> +++ b/scripts/coccinelle/api/struct_offsetof.cocci
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/// Use struct_offset() family of macros
> +///
> +// Confidence: High
> +// Options: --no-includes --ignore ./tools/
> +
> +virtual patch
> +
> +@offsetof depends on patch@
> +expression ptr, member;
> +@@
> +- offsetof(typeof(*(ptr)), member)
> ++ struct_offset(ptr, member)
> +@offsetofend depends on patch@
> +expression ptr, member;
> +@@
> +- offsetofend(typeof(*(ptr)), member)
> ++ struct_offsetofend(ptr, member)

Coccinelle script

Reviewed-by: Julia Lawall <julia.lawall@inria.fr>
