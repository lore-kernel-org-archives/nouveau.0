Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45EEECD9B7
	for <nouveau@archiver.kernel.org>; Fri,  6 Feb 2026 01:49:05 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 48EE310E25A;
	Fri,  6 Feb 2026 01:49:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FOGyYXNo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 1DF3F41B4A;
	Fri,  6 Feb 2026 01:39:41 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770341981;
 b=0x1uYAf5sHoDfKNuhxi8qxwGIhzMPubSa8J+J66o25Y2vQApd+Mx0s73ZDwAXjxbqR875
 prh73VgO2zwEO3cwaQyqmStI9FmakX1MLA3ePJeqOW/GDix72jeSSkg6B2bVAnaGAUTWGBx
 ZcCOhBhh8ykEVbBrn2+7maKtHPqcAksEPYbsrP96UFsMEd90t+Kk6XygdcjoOEcmfyoU1LR
 d1rk3yhuLGX4UkTtp4ABj5PJtTrIE2Cf2FvXMbajddVAxS6Yv0EDnnLO104xKh0qtqvUY5v
 4RMyjGURdC6Ia5zS3IsxrI44uNh08YItK879hE369H6EUVnKuXOtkZa72Y0w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770341981; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
 b=k7jUnUzFWxXSrajcimIh5CTyD0b1SvE8jxkB0nzeh69lruQwV18Vp6xbjC/NiAdBxGqIv
 kJo1lgTo2kldxnAmmwZekmIpaHYrxkNkDmzA/cKxxbRhEFGpcKUrr6SpASD1vstDNSE2fuV
 0uj4KMjgM0xotQwr3IuWyU1o/hAGC4+NeJiFL8e0t5ZbR8ODvk8/q176o1FgDOp3j6SSXuq
 IA17LAsj5k1cY9ggjtlSGfGtZHDxnYdrDGF+DYDBDr5E9onm9wwTmXakuGmYiWR41lPkeu1
 QU0v7/nGa1dujo3pvezExNYK+JXRI1t5F68djgcob8ZqivWv1z4M8fTW6ODQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 43EBD4049C
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 01:39:38 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com
 [209.85.222.171])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3747810E235
	for <nouveau@lists.freedesktop.org>; Fri,  6 Feb 2026 01:48:59 +0000 (UTC)
Received: by mail-qk1-f171.google.com with SMTP id
 af79cd13be357-8c533228383so90115885a.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 05 Feb 2026 17:48:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770342538; cv=none;
        d=google.com; s=arc-20240605;
        b=LsduHSfEjcAPLMgiQNPVWz2TfpQBRJgkBTk10349VE3TnfvwryfA8xut/RByCYMSTW
         7qxpeCOvuFnGYFkMj+BCkV9tJFaiuNCs4BqM7Dhq5cJEMlnkBSID8HDkxh4/QBXSFBVj
         obwuRzK4A3Za/Wy/klxPJk2r3mRuADN2knjzXMMQ2XVPbcQXbC/+wip0UBeR8pzhCU3s
         iX9uGi6mhiuW95QcodKlDg9qqNbnCmCmdGab5JmVuN5jCp1jeekcZoJaWbj3XTsNek0Y
         s0k5GG3N2fWwBS4g6KOQ4b/VG8cgNUA9tnlon7TNOEGjk+7QRxyd+bt3s6/qkroaQZzl
         URYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        fh=1HKSXeAYtHerfSvB5ZVBz7pk6EwLy3G3Xucbb0GwhK8=;
        b=kEQdsTPZ6GnsWgiZIS32FJNaB1tPvbtrMF3Ni4o6FYzjg7wGr14/GH/Fc1VjLAJP1B
         kbU8YXFL3zsIqjCETPc8gGbPM2hwJGirF90J3Muj0JRNHZPyHhtMWiV2dRP08AYLd/vw
         3YiZKgTg9yLvYnhALuV2J/iwwvA6VomYVinBiC7m8KY1Hu16WrYqFUw0NLhzVAn4wujS
         yhbZXPuvn6O0z44mLyui4Xg+3V/hCpZxC/QcIg1kx/Q5uibWjtZqIgXDXf/xBA1PJsL9
         zROGXG3qjPUd0N5pD/zpeq/NgFDp4U7W+KuDs7TNUC/GHqFYa3CDHrNIltI5Vk6Haaao
         DHMg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770342538; x=1770947338;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        b=FOGyYXNo3zdhE8TI2jZvS3WKO9tc0UOjwoHxA44fr3olnCUVAYjEt1s2Ijbcy9CmL2
         GFElgEB2Fr1AculDojwKTWUEFc2SOluzkosXBVs5mkwjPnE6h1z+NjkS0BYdU6n0AP9K
         +kzW+eVfatMIQNNNLNKd0sR5zpRzn+kY4CiUWEMgJIIz7bRi66pWAUmwKWErbxV0tNXl
         LKRSkp5cc2RO3Y1iy2cE+I7Ap40WKPBpD7xjqn9KMdGd1qhpZFMuSg51MrkyBDdjxZNj
         IEqfGOG6bZvOQWFId6fvab6/HojTvcCF2jsgSsYt0j9WgxiK90GEuC9HtvLCR8NO/sbf
         vOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770342538; x=1770947338;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qp2Y2OYYUKPukWWko+9fCBsOvav98ZHz2x3RlIJSAHU=;
        b=b9U1Huf2evOonbTO/k06QW1gaqYrbPBtF+vQOsBGZ+VPVH7DE1wEd3N2rc8+26zi+A
         hykD4ySxmF4trkEtWqGPBWrGn3L419zCmeKHxHjK+oVw7zdPvroYGD2iFZH+/MYngvTO
         T/eQD6tVA7RQ5yJ/0shvsma0NxtHtQkvpBOt5oQHd4GsAJKd8A66zb5cz2oqktJdt7bj
         R7fuc0ZWxwBNVOGjEMQNS2Mi36mNzzi9SwcAhHgsXwC2wlFPsul1Jv9aLJr/2F7qgkHb
         4q5ZMnQv3LKU+cRm8uqKyx67Pu1EdFQKvKyIXXoymel+55aryiFV7DH7kpKyOih+Jf9J
         j5Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1N1vBWyL5fujIF8mq3TTv9sDVtWGwj0+77t1qdwsD5MDSFb93BiFc1PjnU0XHeWUQqq1zJVqQ@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywfx+WNj5xr2t0n/+4aHa/Ekl2dP7c2lhPEoGi3+6YsEzrYkJd4
	9fyQV66H/KHmQsQB9oYZEolGjzTWfUZcDIjrxEVcoDQ5cawWRpxqDHB2d2pHit9X/l0ejXxzntS
	ElEEFFF5ttXTu+1FaizB8Hnc5IxcxDg8=
X-Gm-Gg: AZuq6aKxqYX8oCH/SEkDjjG6qMYW4KflBJY60qzwjFP7zlQo+65tpVxivtZ6Uo3keyN
	mAbZpYRqn73yASSEOJMA7UdkC68lVhgpnifCH7sEdWV1Fil3cJwIEWN6X0cdKKMHRZoWqwOorb3
	2sPV93Po5aqZEKaOUaAPzbyIVuje7cOu03TwDgToHpItGFaUm1su85XoDvNaTo3Nh4IEDw0qpxy
	oFv2hxnh2EpmrSLCyrDVfewCUi0QlZaMhrTqdAnwMMmVXP9uwqZTXxrAoiF0JrjMSeWCxjsPsSH
	ZAkpxuFC+QtaB6fbyvVOSsBdXcwph6WbWVv4h9FzTAzgPvE2And8h7o=
X-Received: by 2002:a05:620a:470d:b0:8ca:123e:8194 with SMTP id
 af79cd13be357-8caef409c65mr147454885a.33.1770342537850; Thu, 05 Feb 2026
 17:48:57 -0800 (PST)
MIME-Version: 1.0
References: <20260206003451.1914130-1-joelagnelf@nvidia.com>
 <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
In-Reply-To: <06ff773a-06bf-4d60-bd0a-75a0359ce41c@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 6 Feb 2026 11:48:46 +1000
X-Gm-Features: AZwV_QiCn6zHej5_Mme9jV7jp01t4GcOY8De2NKm9jmAO6FZQzlBgU_JLG2YX-I
Message-ID: 
 <CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com>
Subject: Re: [PATCH -next] gpu: Move DRM buddy allocator one level up
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: SPVQVCPZOQNSIXSD5SKYIAAWMG624LYZ
X-Message-ID-Hash: SPVQVCPZOQNSIXSD5SKYIAAWMG624LYZ
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/SPVQVCPZOQNSIXSD5SKYIAAWMG624LYZ/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tw=jzQxGvVrsUSv14RxQtnaw2rH6K2b3Gxh_UUHnOGTkA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 6 Feb 2026 at 11:06, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
>
>
> On 2/5/2026 7:34 PM, Joel Fernandes wrote:
> > Move the DRM buddy allocator one level up so that it can be used by GPU
> > drivers (example, nova-core) that have usecases other than DRM (such as
> > VFIO vGPU support). Modify the API, structures and Kconfigs to use
> > "gpu_buddy" terminology. Adapt the drivers and tests to use the new API.
> >
> > The commit cannot be split due to bisectability, however no functional
> > change is intended. Verified by running K-UNIT tests and build tested
> > various configurations.
> >
> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>
> I forgot to add Dave Airlie's review tag here from his other email. When you
> apply, could you add it?
>
> Or, let me know if I should resend it. Thanks.
>

This one was a bit messy, so I've taken this into drm-misc-next now,
it doesn't quite end up in the same places as yours, but it looks the
same, and I updated MAINTAINERS at the end.

Now you can just care about the rust side of it.

Regards,
Dave.
