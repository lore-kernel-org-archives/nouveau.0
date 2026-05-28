Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABF81CD6E45
	for <nouveau@archiver.kernel.org>; Thu, 28 May 2026 19:45:02 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id ECCF910F5F6;
	Thu, 28 May 2026 19:45:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="i7WgIx7u";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 7B4DF46629;
	Thu, 28 May 2026 19:31:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779996691;
 b=U+7SzB9c/hKHnR0aujEEcFG3MJzE6TRlB/20QzwZwCWVRTPnY10LcirSOi2OYi7YWivJB
 LWhoucLK0ubS6+VgV63IPDKcBBjz81/sCkETSmaQjWQVbX6u/UwjSk5uPVcInBgxvuaiKvG
 UPl+U6bXpbZKbqDt87CGfVGT91+qqYD/A0oH0XRxiQtUJSYa+BVE5s+2dRjfQjEp8G9WfLB
 zWo/psnGEVWC3IBAGL0zmfJsaoIpj9zKMJEPtN7d0mh3J/q3q14ctTmAkKU4nYn63lx0Dc4
 sTgWdDppmjpoY3wBt6huQCdgGhJO0FP1hI+9pFGlTFkzw2006BVzXr5lMQ+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779996691; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=Al1Rdb0qP+tKYEA5EKgoaK4bwuBTFrZINc4pk3eqfec=;
 b=hV6nXU1wDgsVl71gb9Z94S2zM1E9zC93YMLV4P1NVqLLQxS2vMGNqvDEHB8aDetLG0zyZ
 di3lKc0y0TzZhZzzmnMlFc9uO8soymWzNj8SLvCyttN21U1Bl3wxGu86XMMaQd8vFt3y27y
 SGNUzQZTWoiAxA0POwz8ePyiZDi7IfBsNewEjXanNI6dRkU0yYfzQ+nelManHMpjjJX3Pld
 cZ2C8y6qrhBRgL/qNLNIkIeyHk2tq62eXh08rmXupDj6fQZAMMf5jA0z/t3NVIsSLSBQYde
 g+mf+QMvcMnXiZVQ9RgIzaMDLtmGdWXTPliqN8ESy+wNEcC8fiVA2KrfwwRA==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id A20D1401C5
	for <nouveau@lists.freedesktop.org>; Thu, 28 May 2026 19:31:28 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D22D810F5B3;
	Thu, 28 May 2026 19:44:57 +0000 (UTC)
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 31C21601E4;
	Thu, 28 May 2026 19:44:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27CA61F000E9;
	Thu, 28 May 2026 19:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779997496;
	bh=Al1Rdb0qP+tKYEA5EKgoaK4bwuBTFrZINc4pk3eqfec=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=i7WgIx7u93jihOGlS5GspsKjabCLij0u1nfESdcJQM9boPVNsHzFgmJNP29FW4scX
	 VezJW37R8sJfQv4/YtN0rxZseENN+xhdCoMong9NuORcDhHWGVihrF7cE7eOQk46kI
	 xzV8ftI0TI/ubVNDNBz13zAL0TgFgRz+W7D/+ogNC5Oj5yKySNsoRa47heYGKfmTLV
	 LhAH+GPoEKq4NmQYIw94WJd3CVa3iiF0LN+JUikwmkXjeunokxTnnVNZUQUukyopeA
	 EJ4e+MSFG5YCi3LWXHGso7ip/8C40NcxIAdVXN0XXhUJDhOvFc0PeFTdYhLMM9GGuy
	 6idtrbPntPJuw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 21:44:52 +0200
Message-Id: <DIUKG7F2VAC7.17L4VHNNI7YL2@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/5] Revert cleanups for IS_ERR_OR_NULL() usage
To: "Lyude Paul" <lyude@redhat.com>, "Timur Tabi" <ttabi@nvidia.com>
References: <20260528192847.4077458-1-lyude@redhat.com>
In-Reply-To: <20260528192847.4077458-1-lyude@redhat.com>
Message-ID-Hash: 26SG44YKWE4R7RYUXG3YR7NICP6E4JGD
X-Message-ID-Hash: 26SG44YKWE4R7RYUXG3YR7NICP6E4JGD
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dave Airlie <airlied@redhat.com>,
 Qianfeng Rong <rongqianfeng@vivo.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kees Cook <kees@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Maxime Ripard <mripard@kernel.org>, Hongling Zeng <zenghongling@kylinos.cn>,
 Zhi Wang <zhiw@nvidia.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/26SG44YKWE4R7RYUXG3YR7NICP6E4JGD/>
Archived-At: 
 <https://lore.freedesktop.org/DIUKG7F2VAC7.17L4VHNNI7YL2@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu May 28, 2026 at 9:27 PM CEST, Lyude Paul wrote:
> Lyude Paul (5):
>   Revert "nouveau/gsp/rm: cleanup remaining IS_ERR_OR_NULL usage"
>   Revert "nouveau/gsp/rm: cleanup IS_ERR_OR_NULL in core implementation"
>   Revert "nouveau/gsp/rm: cleanup WARN_ON(IS_ERR_OR_NULL)"
>   Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rpc_rd"
>   Revert "nouveau/gsp: cleanup IS_ERR_OR_NULL in rm_alloc functions"

Reverting the whole thing for now is the right call, as it needs some more
review.

@Timur: I do think cleaning this up is the right call in general though, an=
d I
also don't think that the whole driver necessarily needs to be consistent o=
n
whether IS_ERR_OR_NULL() or IS_ERR() is used -- it depends on the context
(although I usually prefer not to mix up NULL and ERR semantics in the firs=
t
place).

It should however be consistent in terms of what functions can actually ret=
urn.

	ret =3D foo();
	if (IS_ERR_OR_NULL(ret))
		return ret;

If foo() can never return NULL, the above is misleading, as it puts an
obligation on the caller to somehow handle the NULL case and come up with a=
n
actual error code for it.

So, I think it is the right call to align that to what functions can actual=
ly
return, but while doing this, the contract should be properly documented, s=
uch
that subsequent changes can be properly validated.

I can pick this up later, but in case you want to pick it up Lyude, note th=
at
this now has to go into drm-misc-next-fixes.

Thanks,
Danilo
