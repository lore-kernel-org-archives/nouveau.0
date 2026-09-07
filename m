Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7C6C88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:52:24 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C630610F568;
	Fri, 11 Sep 2026 08:52:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IKPvl5Dq";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9A97E414E0;
	Fri, 11 Sep 2026 08:34:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115699;
 b=kzymuX+Qoh8F2NXLp0szyOPmOShrN8lkq9r5FdH+Fla09yrGTM4JlElmf8RoiYs6atw/P
 nBjLZym8WAuEeHOrigTwJUoDMz2ZZyvfKNb84NbMjVqiiA+m0I8dMwm+3CxhCNzOp7vq+en
 07ekfcklYnAj16cP+4Qs7GqY20B48awsJuQFZINtDiPsRwrWGAyVM6S6U9M2TFeLiAEIA/v
 E6wTbYwkjU1ZI/yo1Z3DVnA2Eh3bnXZepb2qwPaUEfbXdmkYqjPFmkZZF/Mci25efa2W70N
 jk3cq/uscwy3FiUvCy2t4xcuU2eEeYXdPxGBV3aYCeMeK8vCBnzi1NDfE0Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115699; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=FuVXo6f9Z1spKRdlImVETM3b3qRtGRWXee9cH9hEi4U=;
 b=hyZp7HwCAqSjFVQ/eA1z/MRi5olcPGvjBrUz066TAGcgRXUVGRIA5F33XX/oHyjhPFdPE
 ldSl1uStf2olK5Qj/PlEW/5W3950Vf2K4XdX5FjAKg7QP8wE0gGRrovZCRjTQl0Uf+2hapV
 0njXWCm8VnDv41wIv4ZNZinUjRIAjM/5yInITxX4mmbwGRUgTZX5quAxrV5diql8XPX/Bti
 V3AfpKwXHIW/eRsTy34ZOJpe+G4Uru0y25R4UdJus8UrCQ/aTrDHcEUl9GuvlwpcEOf7RgL
 8wRf0lfh9UWuLHiABe8/zHo/jzsY6uEJbbzCLHrftpkaTqIrCKNqrYzHqHyg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 5D2A640275
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:09 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D37F610E658
	for <nouveau@lists.freedesktop.org>; Mon,  7 Sep 2026 21:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788815398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FuVXo6f9Z1spKRdlImVETM3b3qRtGRWXee9cH9hEi4U=;
	b=IKPvl5Dqbg+LEeib1B6xTKpHiiCsittUbeB4CKKi2+HFPZrRdEhcJUOiQifummoOvKtJ5/
	jGxkcD9nuOXQoALAMfH7pfLsvNqe0J3B8bpzmmfrgzQLJKvQGHxyc4TQ5IYoXr9pO7xwwH
	MidHXhGx4iAOTsgcZBEFS01GEdaV940=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-681-_p36ToZzOMyOl86nP76L3Q-1; Mon,
 07 Sep 2026 17:09:53 -0400
X-MC-Unique: _p36ToZzOMyOl86nP76L3Q-1
X-Mimecast-MFC-AGG-ID: _p36ToZzOMyOl86nP76L3Q_1788815391
Received: from mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com
 (mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest
 SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS
 id 1D3701801200;
	Mon,  7 Sep 2026 21:09:50 +0000 (UTC)
Received: from [100.91.157.188] (headnet03.pony-001.prod.iad2.dc.redhat.com
 [10.2.32.114])
	by mx-prod-int-10.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP
 id D0FA15B1;
	Mon,  7 Sep 2026 21:09:42 +0000 (UTC)
Message-ID: <fea78e29-a3a8-48d2-9353-48a94d3a1649@redhat.com>
Date: Mon, 7 Sep 2026 23:09:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/14] drm/panic: Return from screen_user if display is
 too small
To: Thomas Zimmermann <tzimmermann@suse.de>, javierm@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, geert@linux-m68k.org, rdunlap@infradead.org
References: <20260902121930.597222-1-tzimmermann@suse.de>
 <20260902121930.597222-8-tzimmermann@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20260902121930.597222-8-tzimmermann@suse.de>
X-Scanned-By: MIMEDefang 3.6 on 10.30.177.95
X-Mimecast-MFC-PROC-ID: KHGuTCqs6e25RzHLzFnwjGujDOej9pnS5CnHKi-PEmY_1788815391
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Message-ID-Hash: TGW63AZZRF2I6LLEEYSFVCCZQAWUDJ2U
X-Message-ID-Hash: TGW63AZZRF2I6LLEEYSFVCCZQAWUDJ2U
X-MailFrom: jfalempe@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, virtualization@lists.linux.dev,
 sashiko-reviews@lists.linux.dev
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/TGW63AZZRF2I6LLEEYSFVCCZQAWUDJ2U/>
Archived-At: 
 <https://lore.freedesktop.org/fea78e29-a3a8-48d2-9353-48a94d3a1649@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 9/2/26 14:13, Thomas Zimmermann wrote:
> Return an error if the display is too small to display at least a
> single character. If the panic handler cannot display any message
> it does at least not destroy the current output, which might help
> with identifying the problem.
> 
> This change duplicates the logic from screen_kmsg output.

Thanks, it looks good to me.

maybe add a check also for font->height > sb->height

Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/drm_panic.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
> index f597ef04c5bc..c317afc76669 100644
> --- a/drivers/gpu/drm/drm_panic.c
> +++ b/drivers/gpu/drm/drm_panic.c
> @@ -486,7 +486,7 @@ static int draw_panic_screen_user(struct drm_scanout_buffer *sb, u32 fg_color, u
>   	struct drm_rect r_screen, r_logo, r_msg;
>   	unsigned int msg_width, msg_height;
>   
> -	if (!font)
> +	if (!font || font->width > sb->width)
>   		return -EINVAL;
>   
>   	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);

