Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E0DEEDEBF9
	for <nouveau@archiver.kernel.org>; Tue,  3 Mar 2026 21:43:26 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AC71610E8EA;
	Tue,  3 Mar 2026 21:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZA7fp9ts";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 07C1444DDD;
	Tue,  3 Mar 2026 21:33:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1772573584;
 b=kCuUpKifHmUwK2UR18UCh1XqDE67UnXGWcAzG0xlN9rhH7tmhR5rCrxSNMBCn91FvlnNM
 rse+69lkjqQePbx+abFDBf9LxTV+F4sVpk6crEHS8WY90lDMfaKWpM89CljFp4jG+dc30v+
 p8MwApYmPWjFW2GEe9JUeptg5GSh4i/RrdALwb70Xmrr9qDlLI5k2qpnuiXpHYrpYOozXSs
 67muoh8irp6EgTF3A8cJEX05vgBRqTJCTbmJxzalDUkcNZ/xVT1tLjKIyie8iSfDQ5oj6oi
 LdEo8U9wN0DcMikUg6m+NEXtrdQe+JdmBJQQ88npclw7h9yBmIxuab69k/lg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1772573584; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
 b=uihmYUTaaokFEd3qasYsZa+P0pa0jTOieOOzI28kb8XS5bMPoHCj4EDkgow82wydenlL6
 LYWwt9yB5PB7SV+j2eBA0ORMjPth5MJVvekMTiZiSZA/MaH2By67KRcbIXlfpTNngr6ETZ2
 k8LdQII80oafQoIvxKjrVMmql3BHZeMqZpcF7AiMOcg/Z4nW5ACCkMzoqjRtjZQ81RBnEGa
 350ji6EyFc8pAtZDpqmcgtmAJadQizq+ElsbWZrJtsEkm6jGDlJoef/UCkwGvR4Mw8oU2wy
 qGazH1CMhij8U3U2faHgFSRgGYomqzJiC+JYJ6S+nrr8cr89ZhXaV0YvuVpA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C027A44CD7
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:33:02 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 45C6E10E8E6
	for <nouveau@lists.freedesktop.org>; Tue,  3 Mar 2026 21:43:21 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id
 6a1803df08f44-89a018cbbf8so26862316d6.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 03 Mar 2026 13:43:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772574200; cv=none;
        d=google.com; s=arc-20240605;
        b=YCJpI/Wh6Wb39L0yL4u7G3JCzOtmiylYEtacKJMQ25hsHye0FGQdsbsiYcqFtICTmu
         +E6Q1CYiVgu6UbTqVx8qCnD6Fq9IOvF/pl5zMkPjmX9xEaCSKs+szLYrNy1JTwGsY1pt
         q2Azg7AaM1bILXBteAsg/3JrD6etolO7iO90L/kZOqAHgglDZDSo0NvH48ZBE9GWwQ87
         2tO6dMFwRWPXpKluHAY5aZDZpvjhqFnGXCmJXZtXjKMzH6xpC06L6RNKk9PkgsvJM2K4
         Q5ze9iYkLIH1i+3gXWObidxqYD94/pWZ5k5TAR5mQB4CQLpmM2z0tFzNtmTzxY/HfXB2
         g66A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
        fh=kBWeL7HHMu7LF33CxmbZPoHEzUxoKGigUUwsGvLK4jI=;
        b=UP8/nGKAHT13uYtlfqR0xLrSMsMvyGisHsOIJGWqNszb39RE1KdfHugyGjEPjrqdhX
         vwQRoY+9XPqwUZ17VxTm3dAz26T6mn+Xt/ToDOCZS8LConvr5/OEGYHPUxgPqYYlylkH
         wlycpEVcEmnf1Iof/eDcVemSp1nY7wTf73Ga5Jc06HhOZJ8j/MdOdJQxLv9oiRbCDwby
         qkESm+HSjd1vgT4RfnRdrzTmnf9jWG1rl6Yh96RcKSkKXFs1qVwvyVU5xozdryTd1q1o
         sGc6MKCJ+yoEZ79EpgVdfCYaUF/eEtEsVF4E89FM5uapRVklCm3J0C9NyvtV8JOAbNAL
         FvVA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772574200; x=1773179000;
 darn=lists.freedesktop.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
        b=ZA7fp9ts/rxZQe6/m+kPJsEJaDXEl3IxKFM0IromlSAbO/WPvcNVfjo3sgHFbENOyJ
         3Np5E5KgGYM8ph6MDoiC/UmVwKxXxwHkGqz1Lbul6HhZLnlvjR53M2rkjxT7SpLwtjeE
         tL/WOGrgsGS6Uh0RniKx1sGpEBn6sWZL8Q2SMDwUkdXwsbASCbkJIq9xfip0r97bME/y
         +u5t4sbxJNVwjQIlFdDmnfNluL6EP+GB43NNsuSea+fyG3COaKf24BcB6qSfSIA3rKvs
         xIfmXdtFxHjvGJms83djF165lKY4W1zQdba1yn337FyyWvhy/0XVO3DIok8nsHx8hJyA
         8reg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772574200; x=1773179000;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/hxUXM4jn99GEhz9ASaqdbuFmthU86dS4GyXCltKJ1o=;
        b=TcMppUMMf3o45LH+xMlBXjnkJPEzG01KS+YvFLjX4TUaQ6bxt0kQ+YDDshnOc7pR+X
         EdOL4EAJThuJ4V7iCXrH/30wIBZ4IMWBOsIFcF1tyWT7tCb/k77pZn1jZf3e/Ykxclhc
         fj7TGIzKPaBQA2XediNu6VYDnsuPJmos9PWtzGo8oVQPprxmVre7hnvI5HLs1F/mI+uX
         evKM85WP1+4sG4ej5/4HgKXn5FeBnoPBhFijr2EP2VTvpdDpzk49hV4lJ3UZY6WxcYfB
         1Z9diJiF4CS1FG312JD3c0D5TJFP46rKgMQEJ43wyTGfpPxmAj4EYq6YGnvMHh+LwUga
         PK2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpaZUm7/mAW+EZFH8AsSRIeHFuvXMAV24mg8Agx+U6TiLJacuxGI/7lrxzBpDC9hW/F/JBpFPK@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzKhLDBGHWqEedLBkItOOQagJ7OlJ2exsQwQ93ooF0U1cJZulfb
	5gIzV2QPdaUobNX+dUcnitBU9PYXQOgyRI7K5EhRkmMLLtCEO3F+cMcovtkGOTNUjsSdrwNmc3z
	3EwmpBAiyNcwM/9isHh+8kYEhc4Dv1qY=
X-Gm-Gg: ATEYQzwozIAo/fg/AEVTjAXAlOKGCPp/yO79up4kpvO8nw5GmRoY712IwNUAEg81ha2
	8YJG9cnuGPFbfUVIgEJVGK5c1pNivEpIV9lLaXI6jCFoVVUDG25pV6P1FHX4H9mcGLzSnzhTCId
	98kaicbGk7aynbYrS5t9gvRzVfqLGcUlCw8rX+9rdDWw4dhHUlSOevWpnhJSxosIp3zBEJRPOiv
	2RgK8jMXNyjh9X3rIaOcE09uz+MKuNy26zvsFD7+G1RQSk6NJ3DVyu6MjkAu4GM40EHrrHdtKYd
	wqcfSP0i1aDlWx/WMP1GZoijoqrOA+1xvJMhOxxoKN1G25AD/cq/FSr2hx/9EeT2HY8=
X-Received: by 2002:a05:6214:d4e:b0:89a:424:984b with SMTP id
 6a1803df08f44-89a0a92c184mr46978966d6.31.1772574200143; Tue, 03 Mar 2026
 13:43:20 -0800 (PST)
MIME-Version: 1.0
References: <20260224224005.3232841-1-joelagnelf@nvidia.com>
 <20260224224005.3232841-5-joelagnelf@nvidia.com>
 <DGPPKJ5W6FVD.29LI1HKSBZSG2@kernel.org>
 <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
In-Reply-To: <7b3146c1-ce5a-4bf9-9837-57c19b24ada9@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Mar 2026 07:43:08 +1000
X-Gm-Features: AaiRm501GK9n8VvFP38XoGBcDXH4aTIuBWI3dYVSffrndOj8CyH9AOfQu1dTQI4
Message-ID: 
 <CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com>
Subject: Re: [PATCH v11 4/4] rust: gpu: Add GPU buddy allocator bindings
To: Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 2I2IBWCAVTZDAAQIYLRGCZY6D6XLA25P
X-Message-ID-Hash: 2I2IBWCAVTZDAAQIYLRGCZY6D6XLA25P
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Dave Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>,
 arunpravin.paneerselvam@amd.com, joel@joelfernandes.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/2I2IBWCAVTZDAAQIYLRGCZY6D6XLA25P/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tybjq8_ea+iJXxsWK+OXwExJNjBu50se036-9vhO+KodQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 3 Mar 2026 at 07:19, Joel Fernandes <joelagnelf@nvidia.com> wrote:
>
> Hi Danilo,
>
> On Fri, Feb 27, 2026 at 12:30:20PM +0100, Danilo Krummrich wrote:
> > >
> > > +RUST [GPU BUDDY]
> > > +M: Joel Fernandes <joelagnelf@nvidia.com>
> > > +L: dri-devel@lists.freedesktop.org
> > > +L: rust-for-linux@vger.kernel.org
> > > +S: Maintained
> > > +F: rust/helpers/gpu.c
> > > +F: rust/kernel/gpu/
> >
> > What about adding this to the existing GPU BUDDY ALLOCATOR entry? Maybe you can
> > offer Matthew and Arun your help.
> >
> > Also, this wouldn't be a subentry of "RUST", but the rust version of GPU BUDDY,
> > so it would be "GPU BUDDY [RUST]".
> >
> > Also, please add rust/kernel/gpu/ to the "DRM DRIVERS AND COMMON INFRASTRUCTURE
> > [RUST]" entry.
>
> Both these additions sound good to me. Just to list all the options below
> so we save time on what we all agree on:
>
> 1. New GPU BUDDY [RUST] entry.
>
> 2. Add it under the existing "DRM DRIVERS AND COMMON INFRASTRUCTURE
>    [RUST]"
>
> 3. Add the rust files under the existing "GPU BUDDY ALLOCATOR" and add
>    myself and Alex as R:/M:
>

Number 3 please,

Dave.
