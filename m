Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DAADC88E4C
	for <nouveau@archiver.kernel.org>; Fri, 11 Sep 2026 08:51:40 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 258DA10E18A;
	Fri, 11 Sep 2026 08:51:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.b="31sVd3lT";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8315340456;
	Fri, 11 Sep 2026 08:34:13 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789115653;
 b=v4CvrHy7r50JuuSElSgimp5BAAxfxO1YNIN5lli32tMwZpv75ukFQTfOqDTHPNFYoRRB9
 LJyXsmCg1zKWllVnJvIzvVA/cBCcCH9I4UaYI4q9WdNwhuHLcfEJtx7Xz2BDRShAzbHqCj2
 r+fLaKHgG0R9SWYaPeUjCwzum/ppNg8WPCUYW1cUkENdpVGQQPoe+wOuUdwK0n3/LJfOn9A
 ybSUwnSkgm7qcbtgw20MQfdOvZKJYAHuGrD0N0vY2MpUAhYj5oIv+ICEKuifXS2oOkTB93z
 S+iVGYgFgS6eLyuHscYgVo+ykK6HU3606YWBSMaT1IGSPbzQARTLWkK5+o4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789115653; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=4jGEiWuc3LNhn0aOVdAeuDAY3lihVYe3loGnLwhG5ig=;
 b=WKj/eWHDONve8yKRyanhCvlmVZTgv8kFTTOs2qNI7bskjih7HkLjvJCyhK8ysxIZ7l+W/
 2i0bUWms//42e6hUyrtYxyVc9BfkJUDtPYfj42be61VVCAJClaVv0UHEoxU0VZS2jlbz2PT
 IQdpfIQ9n/xWqLzNVAWxBv9ThQlvxI0Bc+3C09k6BgKR06WOjXfAVM8/DRkGzKgvde+sZlz
 UzLhAbarAXYGWsakzlLX8RzbJfjypqR9wbJNbf5fR+dvvfcIDVM8bzxK3E4D1wGBwA54Reo
 CEujRnDnLq7rGZjJzsfqPaaMpdiAc0hDETv+XciYcTnqtcCXUR8AHPVgWgJg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=infradead.org;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=infradead.org; arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=infradead.org
 policy.dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 62C6F40102
	for <nouveau@lists.freedesktop.org>; Fri, 11 Sep 2026 08:34:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org
 [198.137.202.133])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 736DB10E1C8;
	Wed,  9 Sep 2026 15:41:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4jGEiWuc3LNhn0aOVdAeuDAY3lihVYe3loGnLwhG5ig=; b=31sVd3lTXwmDP95C/LYFKf+7tj
	NoGRXuYEaeQCfG2DjsdWcv1/bc/Rxt1IKSMZg4cGFbTfUjLkI89TCkq2acz0oe310Zx0n9GOmyDC5
	IE9fq8qTbUNoZpIBpcHA6vNJX4X9nk7/kS6f8Oxw6rQVGqJswkHxwwsC3r+HMVGKi0qQ3TcXk71rn
	gv417w+Ue5sCPiGxo9qylUkqB4+Ni7Ip3Di4xynh9bl+BoPHl/QE97rn2LIH3geyzwGG4/2PCjGjR
	Dt6k3e8eBQAlxGqhFT1ENF4P86rly7jJNEYkDr3VREuh6V6n3EiqbnX9osqA7KvP3zlhjS0VBLduG
	Je3u5++A==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KQN-0000000CCjG-11zN;
	Wed, 09 Sep 2026 15:41:23 +0000
Message-ID: <84851571-6fdb-4a23-9ff7-8e36de16a435@infradead.org>
Date: Wed, 9 Sep 2026 08:41:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation nova: Fix bracket
To: Manuel Ebner <manuelebnerli@mailbox.org>,
 Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260909135319.1364776-3-manuelebnerli@mailbox.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260909135319.1364776-3-manuelebnerli@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Message-ID-Hash: Y3OZ3AFC7OSYNFC67PGIK2ZTVOLJOWOZ
X-Message-ID-Hash: Y3OZ3AFC7OSYNFC67PGIK2ZTVOLJOWOZ
X-MailFrom: rdunlap@infradead.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/Y3OZ3AFC7OSYNFC67PGIK2ZTVOLJOWOZ/>
Archived-At: 
 <https://lore.freedesktop.org/84851571-6fdb-4a23-9ff7-8e36de16a435@infradead.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>



On 9/9/26 6:53 AM, Manuel Ebner wrote:
> Add missing ')'.
> 
> Signed-off-by: Manuel Ebner <manuelebnerli@mailbox.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.
 
> ---
>  Documentation/gpu/nova/core/todo.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
> index d5130b2b0..a01c362b1 100644
> --- a/Documentation/gpu/nova/core/todo.rst
> +++ b/Documentation/gpu/nova/core/todo.rst
> @@ -33,7 +33,7 @@ A good example from nova-core would be the ``Chipset`` enum type, which defines
>  the value ``AD102``. When probing the GPU the value ``0x192`` can be read from a
>  certain register indication the chipset AD102. Hence, the enum value ``AD102``
>  should be derived from the number ``0x192``. Currently, nova-core uses a custom
> -implementation (``Chipset::from_u32`` for this.
> +implementation (``Chipset::from_u32``) for this.
>  
>  Instead, it would be desirable to have something like the ``FromPrimitive``
>  trait [1] from the num crate.

-- 
~Randy
