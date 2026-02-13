Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19330EF99E5
	for <nouveau@archiver.kernel.org>; Fri, 13 Feb 2026 23:11:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C69EA10E853;
	Fri, 13 Feb 2026 23:11:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=darkrefraction-com.20230601.gappssmtp.com header.i=@darkrefraction-com.20230601.gappssmtp.com header.b="yosogk5C";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 0A62242DA9;
	Fri, 13 Feb 2026 23:02:01 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1771023720;
 b=TD5lC4Vm2dJ1DRq1Sr/s4utV4+FVzhUMJrrSnStGgB0NqWYm4U0cIY4gTSVadmLhwQJ4M
 ohJlqUQgbGpIDnv/n/eufM7KZHRx1L1IWTgQUjhOg7BCsuE2/eX1ENq9pi+eTaWxKH63aS5
 Iqj0niLgAt20XAWM+NRUO+vIcmouKb9BVuCtdlcg+PQNj54jh92i2EzY7NI7FhP8k40v/+W
 ZDApr30B8UNFKgCQs0iPTmXKw9BWcFcsGl57rypiLw57V76SrQypVB9lgsBaibIdxExcF+Y
 oxeMu0bCyETOsn4JABIM+CvrrIsl2UnnPH8TAAd5iMNz8dkohRIbW5pZNvmQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1771023720; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
 b=d7He3iS22qab2eUYRSN7oCS/NzYIz2er1QeGcoelaHL/q4hgPWX/kSAopBJzloT3hnQxl
 EViy5PWkfDzarBOhAqgItRMu6ZgvNKpyXdXImcB8u7IVbKHZvhXDcOEaIiQyLz4hrYR2ZAg
 SS2cgzQuMlzu94R/Rj1BiJRxPCNxumBLYq9NgGo64avpZEkvRpqtl658fmqekq8lqVSb2Ui
 7JLzK0tp1GFn+RuBtYG6GkW5unuvMK66c9QITBV6+xgh83AJHdcAVXSxgag5Pro3XvdvUu1
 zxYiCJOTr2zFPz8gXBKkSSkryKFoiAbOqt18BZT+hXZX4b2JnvlpggeN5VKw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com;
  arc=pass;
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=darkrefraction-com.20230601.gappssmtp.com; arc=pass;
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D498A4016C
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 23:01:57 +0000 (UTC)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03D2510E156
	for <nouveau@lists.freedesktop.org>; Fri, 13 Feb 2026 23:11:35 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id
 a640c23a62f3a-b8876d1a39bso158816166b.1
        for <nouveau@lists.freedesktop.org>;
 Fri, 13 Feb 2026 15:11:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771024294; cv=none;
        d=google.com; s=arc-20240605;
        b=TLHSLm2t0QBtJ8d52ZONfTSewzooZ2xeY2F2EfHzwI8vbpuYK4Fi/HnPETYHxCJQac
         i+hj/fwqUuF0KhbU4bZK3V3DRLcKq5TziWBXU/IUHRkRnQOQ6GksjeE0ym0uYcz8SwHp
         hsrtYwQ15DyS16bInkrfQL7ykg4ZNla7G6D39FcWqlxMjjzTKo4rkq0ZROvlOyxATOK5
         e3y6ULBy0po4/oGoWA2LK/2qZ/E0cGHtnjRnfEF6om9ge43xS9Bkcd8fyYEyNrxChDWC
         gzy50W4Tzw5vQ9gL2bpex7H89F8ZFJJq/aD4ozT8CgLGoyVdw2O6Wy92BJo/3EGOaR5c
         7boA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
        fh=11p/SA85FT+stOa9OW3IFeem8PspXTiytdHdDR8AzL0=;
        b=aZNrjIeFB0GDGot0I/awXmRvck0isQenghc15Qtx98uk6qmdOgeZLt9V9Oxc4X8tE4
         4RjzeEXXvII2vKeDBDWvJM6xMV87x4pmIddJ0sSA7cF/HgFAvNJtAAxI/yXYBEA8/Uwa
         pGzz7mM3D9jRv4RTxMonQF9k/2m2UF7dGViUhyISJiZ7PtkMjd4y5gfXfG7MyBbInhnR
         WDKC4JAcC60w5nUvvw+tVKygJJhuOGTqEH2M8ta8tk47xJjti/AZEOee+c/oJh1vqH6J
         IQrVmgGixClqfkXAy2Qu9SIjjVq3wpz6WQ5WIgq3wmaQz8nyV3bOEZAz5nmRpzIW/YdE
         2TyA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkrefraction-com.20230601.gappssmtp.com; s=20230601; t=1771024294;
 x=1771629094; darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
        b=yosogk5CdmBGYuySDO82xyz7lMYwfODr5HiPhlaTwS+zoU0J3Xuz8jPohWw1zPEZ/v
         3kpvlQPc9HV5d3afW+cLEpSbOSfCZcu+Z2xF7Po68UpH6man2gBo0gqWIyF5Qo6l8+ph
         3t/uYnNL4K0yhrlTh1PDulGfGwElGjIXvJXww74LfFS/iXDhjSmf9XD3Ypqhi7sLaNj5
         cz9LypFtPQF6ZR8rHiCC62k2FhPTgQBHO8QRLcgehfK66lPWKk6tn4MooE5VH7GAZebB
         qWUWpiZa+lN68BUJxGeSqctzs8X1784mAeMcSm0q04D9BUevYCVtXeb/XqSi/TvO4w5V
         y8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771024294; x=1771629094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i/aiR4F2aBKPhSsHf4Kof8ApCmMrntWY9Rw5HJoo2C4=;
        b=EeI3fhun8UT4RWjBPEPbcozE95hSWGEz7YkGmLGjO4s6oB6m+1/aR6adRVHik4NZvR
         eQQE5GIHaFI4HU/27ZHXASMGaJzfNt05ujg3mZZ2uiYIImqA4ArG+Vu6YJrL1moZf/TO
         aPEmYoJ8iohbuQKgXQ1u1f16PbUE71C1S7gRFHwiPGfi84zTZBpEKyR8VPvcO3JKNonO
         Fb59ooDCLrm1u2O+pJhz8mLtYY+NmNQXzsC95oeYEVpIggDHJexNerQl9u1YGb7cKwn1
         lSTQCZU84dvhuzpc8utAdgspjhW2j8PaBSGirnESE177T85YFfiDF2/c/poMznL/KXsO
         j0dA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVG//T4wX3hk9OW1sbYwhA6f6+GJVG0oCmaJ81D59FZpUowplsXALQmxDMRj402uWHarRVeJo+k@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzsgPECtoLSz2eDL+MbfshG6gilGwkh772/HhTpQWnd98dfkf2w
	51vVtmXgugJYD0rKrMWmdrt5Loekz3/WthBEpj7OhM16WGbLG3eIcyX/gcNOgMvF71NpgO9k5G4
	6K74HWHAHBG+vT9mpakB0q06zLJhy1lBmWv6bQsWKyQ==
X-Gm-Gg: AZuq6aIySWa2pC9aakP1BBZg9D6IKakUm0bUwAPupvuIFOHQNjMfkYzmv1IM2HFbJ4v
	FQlMKz2zmoODWsY6qFhqND9YVmcBiVEkfg6eYReDOfQKFmgyzSrv86PM9CabjX9WFAWznbIQXi/
	E3b1z2fqt0fo6I3VCpaEDwkav/jz9Ns9x+XNWp9x7zHXQqg71NGZJzKyaa94gECSiCsNZOVgDsp
	gibd+jKWwasXhmhTHcRIuPjDQba62yDKLtf2UQeLAROOTgv1cdByGbOORGrAtarHmqoKgazfDsw
	BE4l
X-Received: by 2002:a17:906:794d:b0:b8f:7aa8:d9a4 with SMTP id
 a640c23a62f3a-b8fc3a34ecdmr59186666b.20.1771024294200; Fri, 13 Feb 2026
 15:11:34 -0800 (PST)
MIME-Version: 1.0
References: <20260205-zcull3-v2-0-ac572f38cc7b@darkrefraction.com>
 <20260205-zcull3-v2-1-ac572f38cc7b@darkrefraction.com>
 <DGE036OEW8ZK.1PX0DRV8R9EVB@kernel.org>
 <CAAgWFh0zX=u7OZYq3QBrs0ySve897LXb1PN9QFzhYg0gtHy5wQ@mail.gmail.com>
 <DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org>
In-Reply-To: <DGE6O1OYR4F3.2PSFQLJ8XXJ78@kernel.org>
From: M Henning <mhenning@darkrefraction.com>
Date: Fri, 13 Feb 2026 18:11:08 -0500
X-Gm-Features: AZwV_QjvEdNIqn6JcsnMJ6QigGTIGx6XW3_NM1uKPaKIqIv3KZRLaa33eXNGZCM
Message-ID: 
 <CAAgWFh0GyrSYeEJuh3xTLGk8c9ZmQoamRnvAvk-t-pydsKTZMg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] drm/nouveau: Fetch zcull info from device
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: WLTP66FTAPUREBUDH4JTFDPPDEVDM2N3
X-Message-ID-Hash: WLTP66FTAPUREBUDH4JTFDPPDEVDM2N3
X-MailFrom: drawoc@darkrefraction.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Mary Guillemard <mary@mary.zone>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/WLTP66FTAPUREBUDH4JTFDPPDEVDM2N3/>
Archived-At: 
 <https://lore.freedesktop.org/CAAgWFh0GyrSYeEJuh3xTLGk8c9ZmQoamRnvAvk-t-pydsKTZMg@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, Feb 13, 2026 at 5:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Fri Feb 13, 2026 at 10:48 PM CET, M Henning wrote:
> > On Fri, Feb 13, 2026 at 12:12=E2=80=AFPM Danilo Krummrich <dakr@kernel.=
org> wrote:
> >>
> >> On Thu Feb 5, 2026 at 7:56 PM CET, Mel Henning wrote:
> >> > This information will be exposed to userspace in the following commi=
t.
> >> >
> >> > Signed-off-by: Mel Henning <mhenning@darkrefraction.com>
> >>
> >> For someone looking at this commit, this commit message is not very us=
eful.
> >>
> >> Please add at least a brief explanation of what the patch does and - e=
ven more
> >> important - why it does it. See also [1].
> >>
> >> [1] https://docs.kernel.org/process/submitting-patches.html#describe-y=
our-changes
> >
> > What I'm struggling with is that I don't know how to do this without
> > repeating myself. If you want, I can copy-paste my explanation of
> > zcull here too and then it will appear three times, once in each
> > commit and once in the cover letter. But that kind of repetition
> > doesn't seem very helpful to me.
>
> Again, the commit message should explain what the commit does and why. Fo=
r
> instance, I asked you why you did combine those two callbacks below.
>
> The commit message could mention this, e.g. it could be something along t=
he lines
> of:
>
> "Add struct nvkm_gr_zcull_info, which serves as abstraction layer between=
 the
> corresponding uAPI (added in a subsequent patch) and the firmware (versio=
n
> specific) structure.
>
> This is needed in order to not leak the uAPI layer into nvkm. Also note t=
hat we
> are bypassing the nvif layer, since ...
>
> Also note that we reuse the get_ctxbufs_info() callback, since ..."
>
> I.e. make it obvious to maintainers what's going on and what's the motiva=
tion
> for the patch and it's implementation details.

Okay, I'll give it another go.

> > Because of this, I decided that it was simplest to combine them in a
> > single call, which avoids repeated rpc calls to the gpu without the
> > complexity of handling partially complete states.
>
> Ok, that seems reasonable.
>
> >> > +     if (WARN_ON(IS_ERR(zcull_info)))
> >>
> >> What justifies this WARN_ON()? To me this seems like normal error hand=
ling, i.e.
> >> it is not a violation of some API invariant, etc. Also, this is in the=
 driver's
> >> probe() path.
> >
> > I was just copying the error handling that already exists in this funct=
ion.
> >
> > I do think these are weird error cases though - they mean that the gpu
> > was partially but not fully initialized which shouldn't happen during
> > normal usage. The only cases I can think of that would trigger this
> > warning are a kernel bug or an intermittent PCI link, which I think
> > are both reasonable to warn on.
>
> It could also be that the firmware is buggy, etc. In any case, I don't se=
e that
> a WARN_ON() is justified. Please use dev_err() instead.

Okay. I've now written this as:

if (IS_ERR(zcull_info)) {
    nvdev_error(gr->base.engine.subdev.device, "could not fetch zcull info\=
n");
    return PTR_ERR(zcull_info);
}

since nouveau seems to use its own nvdev_error() macro over dev_err()
