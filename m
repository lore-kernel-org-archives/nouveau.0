Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE8D6EC1E92
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 10:46:52 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 92F2010E869;
	Thu,  5 Feb 2026 10:46:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rUPqsLIb";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C7A9A41B4A;
	Thu,  5 Feb 2026 10:37:30 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770287850;
 b=ZzV4nsCD73bdvMHH4yUFN2OCeeJeLI+qMKl4yOikQv3hSyEn9U3oaRu+X+k7o9H6vT5F0
 v0KAmblG5NLMb0IsHZcE0i/d+uexdwYGmCjlisy8/3R2x2apgeIPUIPSXEZiAFVq9LadkBZ
 QeMft2Ema25KNH1baZtEi2tix3rXdslnV8VyzpOER1J8t6dvB7po0y0WLQs0t7Om2+vvYbs
 gNGspfbO6MlvSKUu8MdSIpQAzfekk/Cn/XyFrPm5ov6AGSosu8tRgWckYmHfehOLIQq8aWs
 bYMJcUS0RsWk/TW120jpjnipqlA4sZZckzwOZCO3MVe0jK9beTXsXk/Tms4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770287850; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VTlGyZ+YmyuUFNABX1rOK6jkRn7D35UBIg8bXfy4xxQ=;
 b=ANEYm4r1v/4tjowoJKxZf7oc/DqIfgY3D784D0PHR7L/C4jhNAeSzkJZRlK4wZ3VQLYMB
 g+JcAe+yaIrV9m2PD6M/wrMB/arMa13xTXZsZVQqs1V/9W3Ryk8Am80WFO/mCt6VSQvIQbm
 ilGHoWpY/A4UMOAXNqpDVMg3Rdi1Xs8zJsL9SDIcoDTA8pCt89DsXF70czhrbUs5mX7BDWd
 vRflhXidc9r7pJ1lloKDahFrr0X6LxFcLWg8gW7EDOtGybb1W/aPfeOJVjnNw4+U3D0Ly8X
 uCcLZB7+RpusVEltLLLXugwRS/QDvsaPFw2q3dCtCTGfJR0fQvZ0rN+3Ha6g==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=fail header.d=kernel.org;
  arc=none (Message is not ARC signed);
  dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=fail header.d=kernel.org;
 arc=none (Message is not ARC signed);
 dmarc=fail (Used From Domain Record) header.from=kernel.org
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D9F02402CB
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 10:37:27 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72B5E10E863;
	Thu,  5 Feb 2026 10:46:47 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4FF7C43D66;
	Thu,  5 Feb 2026 10:46:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69962C16AAE;
	Thu,  5 Feb 2026 10:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770288407;
	bh=lvjwOZpBeoLfOCmz0qi802CU+ZXxa8qVWxRNbI2stqo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=rUPqsLIb+b/uRA0s0Xp5sV2UXcgZhox6Na7ZzRK15oB2jygIkiC4rCHgmCRWqcj/6
	 9g/mO6SSHIhg/DE3XxIvbBQciNymgx7dJHfL25zOYpr3GmMa58LNE9BtuqMQxaif52
	 U6jNLQh10MXNsgGZDwpavwVa3wWOpYgLQMGgg6yzmGNreEA+u5wDn5FFDuaNsYk1Kd
	 bz+PLGc5pRvSc/YMcdIpb3+9v0KQvnpIKXZ6W07WuYtZgMeby2WNAXgIne2X9ycB9C
	 Jjb8Jwdfha2lkmn3qmR+G7NtMld/cw4X6eoPyeSG7nuyO/H0XLF1pBqHtTfxsfYTBE
	 hfDdI2Ii3NZcQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 05 Feb 2026 11:46:43 +0100
Message-Id: <DG6YV5LRN0MH.150UL3H2BTHRX@kernel.org>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: "Dave Airlie" <airlied@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
 <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
 <Z-aDWWUTN1MBI_wl@pollux>
 <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
In-Reply-To: 
 <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
Message-ID-Hash: MVXFOPHRCNREZSZWZOJ3WWYNSYDRX25H
X-Message-ID-Hash: MVXFOPHRCNREZSZWZOJ3WWYNSYDRX25H
X-MailFrom: dakr@kernel.org
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
CC: bskeggs@nvidia.com, Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MVXFOPHRCNREZSZWZOJ3WWYNSYDRX25H/>
Archived-At: 
 <https://lore.freedesktop.org/DG6YV5LRN0MH.150UL3H2BTHRX@kernel.org/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Thu Feb 5, 2026 at 2:16 AM CET, Dave Airlie wrote:
> On Fri, 28 Mar 2025 at 21:09, Danilo Krummrich <dakr@kernel.org> wrote:
>>
>> (CC: Ben, John)
>>
>> On Thu, Mar 27, 2025 at 02:03:21PM -0400, M Henning wrote:
>> > On Thu, Mar 27, 2025 at 9:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.=
org> wrote:
>> > >
>> > > On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
>> > > > On Thu, Mar 20, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@ker=
nel.org> wrote:
>> > > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
>> > > > > > +     __u32 width_align_pixels;
>> > > > > > +     __u32 height_align_pixels;
>> > > > > > +     __u32 pixel_squares_by_aliquots;
>> > > > > > +     __u32 aliquot_total;
>> > > > > > +     __u32 zcull_region_byte_multiplier;
>> > > > > > +     __u32 zcull_region_header_size;
>> > > > > > +     __u32 zcull_subregion_header_size;
>> > > > > > +     __u32 subregion_count;
>> > > > > > +     __u32 subregion_width_align_pixels;
>> > > > > > +     __u32 subregion_height_align_pixels;
>> > > > > > +
>> > > > > > +     __u32 ctxsw_size;
>> > > > > > +     __u32 ctxsw_align;
>> > > > > > +};
>> > > > >
>> > > > > What if this ever changes between hardware revisions or firmware=
 versions?
>> > > >
>> > > > There was some previous discussion of that here:
>> > > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_27968=
53
>> > > >
>> > > > From what I can tell, this structure hasn't really changed since
>> > > > FERMI_C (circa 2011), so I'm not too worried about it changing on =
us
>> > > > too quickly. When it does change, we have the option of appending =
more
>> > > > members to this struct in the usual way, or if the change is more
>> > > > fundamental we can return an error from this ioctl and add a new
>> > > > interface. Userspace needs to handle an error from this ioctl
>> > > > gracefully anyway since whether it works or not depends on the gpu
>> > > > generation and what firmware is loaded right now.
>> > >
>> > > We could also define it as
>> > >
>> > >         struct drm_nouveau_get_zcull_info {
>> > >                 __u32 version;
>> > >                 __u32 _pad;
>> > >
>> > >                 union {
>> > >                         struct drm_nouveau_get_zcull_info_v1 info;
>> > >                 }
>> > >         }
>> > >
>> > > just to be safe.
>> >
>> > We can do that, although I don't see any other drm drivers using a
>> > similar pattern anywhere.
>>
>> I think it's a bit cleaner than adding new members, leave existing ones =
unset or
>> add a new IOCTL in the worst case.
>>
>> Maybe the NVIDIA folks can give us some hint on whether this is expected=
 to
>> change at some point?
>
> I think it's an ioctl, let's just leave out version/pad, adding a new
> ioctl isn't a major trouble if the world decides we need to do it.
>
> Also you can extend ioctls with new fields at the end without
> problems, so if it's just extra info it'll likely be hw specific and
> be part of enabling a new GPU.

Yeah, that's why I said "it's a bit cleaner than adding new members, leave
existing ones unset or add a new IOCTL in the worst case" above. :)

Anyways, this is quite a while ago and things have changed. I think we can
afford to be a bit less future proof in terms of new GPU (and firmware) sup=
port.
:)
