Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC973EA794D
	for <nouveau@archiver.kernel.org>; Thu,  5 Feb 2026 01:17:11 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8849810E793;
	Thu,  5 Feb 2026 01:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fQS/j/AW";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FE3441B49;
	Thu,  5 Feb 2026 01:07:50 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1770253670;
 b=Q8u3/zsFr3Z2c1CjqyWoQ0O+ZHy6f6HBL2963g87knEMwcJuDD2o/4pghiDPAu/9gii7p
 2UnwyHhLyPZBDB0flyNQQcYpmSITsrbdOMCSRym4wmc5NF8Bz9ZPr4hHnyQV3HM3qgk2rDy
 KRt6y5VN6lqXvUi/ubyK2lTL9+lpCsMjTu2lJMEER/O024xOL/j529lcbRaZn72lDl4/Jdm
 bClPxzXy5MSw4zx+eyRYXr4OyyivrtT+mFMBBYZfT/kctsrh9P87NS/k8dZ4pmceAJNmzb4
 eNgyMhcXrzj4ifZNcyjOi6AnPTEgCyL/cIRuG6V+LBMlOyf3tQvQmHYjQCaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1770253670; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
 b=Em+bhkHbi3svL99yTZsh4YqNv2ccWHMQBSuB/yjNm72LNXvWVgB4b3dZFkeiZFa2XlAW/
 wNYF+k3x1JzpWYfNht7PD7+cGFBjzGwD2cYJVnxF4HCxX9Zhn/30SJLRGtGJzSKiyYy7m+q
 AL2DIeGtV3tsuBukbfeV611u+UpGPbY8K0M0bpoF9lYwZ4wlZUUQlNtBObyokLUd7H5zLez
 cSlmJ0CYiB3ImEt9KYd5yFlXGvpyYZQxf4wLRYvpULXnWwAyZJX1853QyMZu7U1qpoeEzqj
 q+E3fK92MEEms8iWrE285Pjmh7OgMbBwJv4zCvmW/FFWnMmUee7q4LKXF9IA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3692140492
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 01:07:48 +0000 (UTC)
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com
 [209.85.219.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E482910E78F
	for <nouveau@lists.freedesktop.org>; Thu,  5 Feb 2026 01:17:06 +0000 (UTC)
Received: by mail-qv1-f46.google.com with SMTP id
 6a1803df08f44-88ffcb14e11so6212996d6.0
        for <nouveau@lists.freedesktop.org>;
 Wed, 04 Feb 2026 17:17:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770254226; cv=none;
        d=google.com; s=arc-20240605;
        b=KcbiOFzGF8SidZXXu2bW+dciq5XLJO8Rus8TH9icFqkEz6pMHbTPiKdDJ10m1ts7XX
         VTfmn7vdQYjPcUpp/sD6Gcmee+GTI1uh+ejv/6DL00nVLHp3+wKnvhGaOaO40Re5KA+H
         gp0yWKH1OZ5VAAXBW7vlZdvVdBf3VYM6FTvrDBFg51gaNvtwXf6p+nTYqK3GwE/94zE1
         xFjplR0hciAckocZ+m0ZhJfzxB9dsChDQPupOzfMJAnh+uViXCZsyDHUU0CEyH/1FC0W
         v9vqe0+jL2VnOmI74Hw22HFpgzoFQzmC2RUUzAEfk2fc51EmWqpxwNC+uTLlpOqVeshV
         /4tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
        fh=rKDmYisunMcukU2ay6cQOcQKommFHwhE/YLMdrfgcHI=;
        b=WTS1zfsyT1imcE8Sm6YJKknEDursRg/IG+hY3emolqmhDv/IBh+AkQNFWxq4rBWmbY
         u6NZxdVQ6i71gStcqiCRm0daeZxf0tGx8GsTRb885yFtaoKPYtUFxb1z/boKjPXaxA7f
         BpwQPVvnU/SO7hpFYZtC6nSJi2LYeMTrHINOmEghpi/NbrWIuZmjIAYKiuSlnjlI8GZc
         gnB+AOfswVoSBIxpLQ9I164/lDgiFQLckbLz29xC/d5uA9vQmUuackTLcBe/87fY4Yyf
         yIuIbJ2x5GA2SKX9MfXwgnu8rEMaCRI9Q/UkKYtWrOQFF6DaRs1A/dpEmL2/CszaymLL
         Kc8w==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770254226; x=1770859026;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
        b=fQS/j/AWlHB16CatltR/0pIvDsGGJFfdb6UrM8YDftN+0mCdJ7NMnq2dYQAoN3/TH3
         ddk/73xknL0OvSO67S7FJgd5uNiN2m1p3MsWzoz34arBNHULedqO1id3kFqePz8/nZ0U
         tNSgxLFJ6ftoinl8k4loLJC+wD13DIyCg+ZLVGVjhQpI0NXRDr3jCNy2qa94uKj8eXoT
         LKIGzUbyijaERZqf7jwT3EWI+bdKgIazuxtebTti8KksCAHDEtEMbdVG9JkNepS+OaaZ
         4RiWIkmx4VFK3cPj3yoBjvQX7brnkvRkFpjB86TMP1s639CK7GsL9/346piUB3AbLXGl
         m3Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770254226; x=1770859026;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ntSsjDrT6gFPJG7wr+cNV3lFf1pqXWoAkMREwhIEauk=;
        b=AMneNtk76h5mGEMnvzkCe9hGQAvL2l3Q0NDG4jvXC+UmPSI514woAo4dpqBpnb/80I
         GAMLHczoVMzUg/zNGrw9KDs1D9TSFCxTeWE+G6LMUnDE8QLQmIfh5VFVFJoN9M3+BLa9
         R16zv1LIlrlIwfdSOIXU2HUxqD84LlcUV4kO5RqKztT8Be2PW6S0aZLoc3jnnzcRWUbf
         tXvm4A4OIleKm5gtVHhJ1NIT+zKWAvcoBp4/lyrxEdaCCbI1LX/y22B3j1lcBtEOB8aN
         bRizKRbw3sCck/5jahnUmXuLjqeAKPeKN4AAjtT3h6dOtSuI5QZQ3CMii7Lu0Yehfr2h
         5/HA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZSQebBImbmjpirvjm8pVmqZRW/Lb+amU8SrEYzdcakYigPptzdVlLcnTgOxRm5HLkyyKKsl/f@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI26ieIKR+XwGXDxuwWTrnTY+w36YFKp5cehqkm7y/DQwVt5qm
	MWbIhh0QDUasRC4atwLiucGGvp92Xy1U+qoRTogP1v3P4h2f9XwfXhh3ZwLRjuT8eLU1Ze0Iw2H
	TC6GNhixNXBsOht9PYxLBKdhRCZGxhDE=
X-Gm-Gg: AZuq6aLCqunAVrdSzcfFrc1acUxf+f+c8BTO9+YdsrLhnW+5Igozz9CGRhJX4IoQf11
	uQIzijy+OFCFZR7DHhM75ahkZ086Z8W3aGv2JOhqGtMCeeMq9WuNyDxM+gZCf8xFcNooqAVJj6k
	cyRL6Zo7zGqbVYpaeMGm2CTLejQG/DFnvwZbWlPnsTWXK/dY74Yg22Mc9g01S9X79+u1P9QYAH9
	NXGSlD6XN/0JvZRc2pjZJy7KqThO9NEL6In4TBQSD/FpPTtY5B5qslPIfGAkmhSVBg3wAIIec80
	yKEsLduKODRNsFy/dFxxyR6WD1K+hYx/GMbikPMmmYOjSP3pfsszucA=
X-Received: by 2002:a05:6214:f24:b0:880:4695:4626 with SMTP id
 6a1803df08f44-8952210a461mr76499426d6.15.1770254225864; Wed, 04 Feb 2026
 17:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20250312213746.228042-1-mhenning@darkrefraction.com>
 <20250312213746.228042-2-mhenning@darkrefraction.com>
 <Z9xb5SABWcwYnV-x@pollux>
 <CAAgWFh2dHZs2D7R4ejY9sNQ+QCtLQeGGS2PNtcsm_MPeV3edLw@mail.gmail.com>
 <Z-VX3TJPI6Tgin2G@cassiopeiae>
 <CAAgWFh3c=qE+c8Q04W2NXpBLBeXC12qTKLNmZeJA65m+dTMG8Q@mail.gmail.com>
 <Z-aDWWUTN1MBI_wl@pollux>
In-Reply-To: <Z-aDWWUTN1MBI_wl@pollux>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 5 Feb 2026 11:16:54 +1000
X-Gm-Features: AZwV_QjjAR5F4LRGudoGX_LBZTUK98t7D34f4x-i5o_eEqpfv_AC_cbr4n1mZ3U
Message-ID: 
 <CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/nouveau: Add DRM_IOCTL_NOUVEAU_GET_ZCULL_INFO
To: Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: FZHNYALRJHDLGMKSKPRG35H47S3RC3LK
X-Message-ID-Hash: FZHNYALRJHDLGMKSKPRG35H47S3RC3LK
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: bskeggs@nvidia.com, Faith Ekstrand <faith.ekstrand@collabora.com>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FZHNYALRJHDLGMKSKPRG35H47S3RC3LK/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txXG=tqrDjhXXvfQ+eMRnsVab=xz4CBOd1Nzwu3XR+DyA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 28 Mar 2025 at 21:09, Danilo Krummrich <dakr@kernel.org> wrote:
>
> (CC: Ben, John)
>
> On Thu, Mar 27, 2025 at 02:03:21PM -0400, M Henning wrote:
> > On Thu, Mar 27, 2025 at 9:51=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> > >
> > > On Fri, Mar 21, 2025 at 06:06:34PM -0400, M Henning wrote:
> > > > On Thu, Mar 20, 2025 at 2:18=E2=80=AFPM Danilo Krummrich <dakr@kern=
el.org> wrote:
> > > > > On Wed, Mar 12, 2025 at 05:36:14PM -0400, Mel Henning wrote:
> > > > > > +     __u32 width_align_pixels;
> > > > > > +     __u32 height_align_pixels;
> > > > > > +     __u32 pixel_squares_by_aliquots;
> > > > > > +     __u32 aliquot_total;
> > > > > > +     __u32 zcull_region_byte_multiplier;
> > > > > > +     __u32 zcull_region_header_size;
> > > > > > +     __u32 zcull_subregion_header_size;
> > > > > > +     __u32 subregion_count;
> > > > > > +     __u32 subregion_width_align_pixels;
> > > > > > +     __u32 subregion_height_align_pixels;
> > > > > > +
> > > > > > +     __u32 ctxsw_size;
> > > > > > +     __u32 ctxsw_align;
> > > > > > +};
> > > > >
> > > > > What if this ever changes between hardware revisions or firmware =
versions?
> > > >
> > > > There was some previous discussion of that here:
> > > > https://gitlab.freedesktop.org/mesa/mesa/-/issues/12596#note_279685=
3
> > > >
> > > > From what I can tell, this structure hasn't really changed since
> > > > FERMI_C (circa 2011), so I'm not too worried about it changing on u=
s
> > > > too quickly. When it does change, we have the option of appending m=
ore
> > > > members to this struct in the usual way, or if the change is more
> > > > fundamental we can return an error from this ioctl and add a new
> > > > interface. Userspace needs to handle an error from this ioctl
> > > > gracefully anyway since whether it works or not depends on the gpu
> > > > generation and what firmware is loaded right now.
> > >
> > > We could also define it as
> > >
> > >         struct drm_nouveau_get_zcull_info {
> > >                 __u32 version;
> > >                 __u32 _pad;
> > >
> > >                 union {
> > >                         struct drm_nouveau_get_zcull_info_v1 info;
> > >                 }
> > >         }
> > >
> > > just to be safe.
> >
> > We can do that, although I don't see any other drm drivers using a
> > similar pattern anywhere.
>
> I think it's a bit cleaner than adding new members, leave existing ones u=
nset or
> add a new IOCTL in the worst case.
>
> Maybe the NVIDIA folks can give us some hint on whether this is expected =
to
> change at some point?

I think it's an ioctl, let's just leave out version/pad, adding a new
ioctl isn't a major trouble if the world decides we need to do it.

Also you can extend ioctls with new fields at the end without
problems, so if it's just extra info it'll likely be hw specific and
be part of enabling a new GPU.

Dave.
