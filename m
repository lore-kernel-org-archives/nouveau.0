Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA205C982D0
	for <nouveau@archiver.kernel.org>; Thu, 17 Sep 2026 21:14:37 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4DD10E942;
	Thu, 17 Sep 2026 21:14:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="IbTpIJ/4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 68D5B48252;
	Thu, 17 Sep 2026 20:56:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789678619;
 b=L+I17LURbLX17bSGrJiU3MvMjn8AuRstwn0keigTLAN+NEkkmGV9G7/pcYPV2vI1foCKl
 KKs7ffUee/GrUiW5VE2hnr2ZLn6B+CieHocHmMop6CSe2g9RUP8Tb0W6CWul7qmyFjAqvO4
 Y0oVfyk1/F5zlPznT1uSqorBAk4PDKrEJ0FE4ojs6LxW9qYf4FUJb84wCBnIFzBKVrn0B8D
 GLqAo8V69AN3oIQfSVeFKMo2nK8UTyyiRvRwHPxqjwtLt87meksb4JyYXjoI9HcSsUI3z4E
 jRySCksch7apDgzG2waQUmepOAyTxfCcZ8FRbxVfXxoqxpcEvg0RRp/xZKrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789678619; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
 b=tvAOahrXIS0Hoj9hL5Ka3nPS85eMl7qXDpxrNBF+XsU2y6v7bcImAtL3nL3r8GzniQBaW
 iEUYW5/mF5/24zJD1cSajU1lzG5LOh6Dnc8PxVD/GfLWiLrsPozZkHqCi2UpcnsSAyHxGtf
 ZJhDeOODs5lo4nHoPUzy9ijlIPUdZCGWl06oES0+OL4fj3fYbk19j1mj7sytecmU7AMwR59
 QRoYJEn4L473zi8d2iELT76NgBY+lbhX99/BWg7e8YrFAfdeEou46Eh6dquBlhdUs0enIR2
 tYiFj4A/ph74Nr7zbiun5+B2gx4iVzHhhZkgDQl+jrv6wjFXI2nImPGQHLhg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 2FBC1481EA
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 20:56:56 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 01F5710E769
	for <nouveau@lists.freedesktop.org>; Thu, 17 Sep 2026 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789679673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
	b=IbTpIJ/4KbPh43dybIPQcxsbBZGKwtp3GS62kOWgm9r2FHp6kNYCIn3cSM4X5+9k4taG9i
	BLnJhb6UgRpMSSnRliX3iZC14cu9YJYw2p4iH0ulUMYDB0mviToCAhhLmcPCNy0KYx0R0r
	4c4DfWC2C44O5CMIkbyHKEw/kXnFYGU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-NHgtpb4hMwaLdNnNum11Hw-1; Thu, 17 Sep 2026 17:14:32 -0400
X-MC-Unique: NHgtpb4hMwaLdNnNum11Hw-1
X-Mimecast-MFC-AGG-ID: NHgtpb4hMwaLdNnNum11Hw_1789679671
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-912348a0ffbso1621286d6.3
        for <nouveau@lists.freedesktop.org>;
 Thu, 17 Sep 2026 14:14:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789679671; x=1790284471;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=38jxd0wQcDwbVDumJ2B589A/WlIbq9+EZCtolWKlhvg=;
        b=EbSKOe2fmP9CV59nUXyivVpoL54x9O7WuFs+8kQpCZT5FeUmiZREq0YPtq+ap5XKk7
         lB3/KITmD0YAyw7sgYRoGr2E1Fw4cKQ98FmOdVmHjVTl97j4S+Tpfio9eMrhFjuatOfU
         SDLFM45sRXiQMl+a/oUSIVhte4hNNmwO8a9z7PAeGhOs597/BmKxpZm232zG3fpByjrX
         GTYtlek6SIKGJdwItOGYaFocVDEslZkSVVG0X6asej8M+gjy5Xergxl9k18zBY9TwNFe
         /uu06VvTyocns/THwLXjguZjuSXI+viJYQ9Gtqbec/mJEm/wlnWsk9n9A8gYrj19tX7c
         mILQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBzRz9pXn0vCf7Dhiw7JRaGN39dPRgevk6eDFQQJwbQrZ4JzUr/zslEK4gYn2MQ6Sx5qAUcxHTfm@lists.freedesktop.org
X-Gm-Message-State: AFuF++nqtQB6bhHIhoxXKBcLJwo6Ho04XQe1ik1d5ZoH6YsdiY5we2Su
	F5YxZvwY4SyylqNKSoUbGA05ERomR8qIXzMjGhlIAL4hpJ4L2x5kOJ0yr5MNt4cXkuDesxvogKi
	g23ZsgLrwYE8qmPp4V5fShZ0LvRJ5duM2YWul2KNsH51nb1tmYhlOqBL8MPUg6d9nU+Q=
X-Gm-Gg: AYBFou0CbKQBaitb6bTwQfscR/zDGtezVd6zkJrCtv7d9Q75JtAdWGrf0akij2Z9z06
	6fj4B1b8mRzS6bWfoAyTlDaUGm86Wg2pIEJ6rz1UQ01XnFyiF67hH6c2+aNa0dWZhgduB2K2Z85
	lPfYtGriZ+GrsfKJTWyR2SKjFowK5EkY/4hOrkeIbUfZpEvjLbHOg1HNuqZTJS6Qa3lFZZ/fcLL
	qeN/tcWL/xixEBxAPWok2LQaZCpP1c+PFtpRFzNt0W34owy4n9Qajjo1kRZk9KvQ/3ht8a6mbnh
	4HuzZRKSoRDSQFQh4a3mkrUuXpZLtXhOOxw59B5VJe/MEuuss2Uz36L/dOCXe0OHH/pLdzJR
X-Received: by 2002:a05:6214:8087:b0:910:6407:4ccf with SMTP id
 6a1803df08f44-91254b85e5dmr10163186d6.24.1789679671339;
        Thu, 17 Sep 2026 14:14:31 -0700 (PDT)
X-Received: by 2002:a05:6214:8087:b0:910:6407:4ccf with SMTP id
 6a1803df08f44-91254b85e5dmr10162576d6.24.1789679670867;
        Thu, 17 Sep 2026 14:14:30 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91252c5bef1sm7218696d6.9.2026.09.17.14.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 14:14:30 -0700 (PDT)
Message-ID: <1372e336906a9418352edcf552d899685fb9b1d5.camel@redhat.com>
Subject: Re: [PATCH 0/2] drm/nouveau/clk: fix RAM error handling and pstate
 desync in nvkm_pstate_prog
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Thu, 17 Sep 2026 17:14:29 -0400
In-Reply-To: <27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com>
References: <20260727152821.128432-1-postadelmaga@gmail.com>
	 <27293a63217c3261c42d011cef8cf31e3d43fefd.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -1KgcT5eGstiwnFNZLzkxl69ZeW7gfh-vun96RZtDuM_1789679671
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: YBGZJMSIZKYPDLAWY5DGQWO3ENX6ENRO
X-Message-ID-Hash: YBGZJMSIZKYPDLAWY5DGQWO3ENX6ENRO
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/YBGZJMSIZKYPDLAWY5DGQWO3ENX6ENRO/>
Archived-At: 
 <https://lore.freedesktop.org/1372e336906a9418352edcf552d899685fb9b1d5.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Well, I -would- have pushed it but then I quickly realized I reviewed
these patches in the wrong order, whoops :).

Just consider these reviewed, will push once the series this depends on
is all good to go

On Thu, 2026-09-17 at 16:51 -0400, lyude@redhat.com wrote:
> For the whole series:
>=20
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>=20
> Will push to drm-misc-fixes in just a moment
>=20
> On Mon, 2026-07-27 at 17:28 +0200, Francesco Magazzu wrote:
> > Follow-up to "[PATCH v2 0/4] drm/nouveau: fix list cursor use after
> > loop
> > in the clk pstate paths"
> > (20260712123616.1180830-1-postadelmaga@gmail.com).
> > Sashiko AI review flagged three pre-existing issues while reviewing
> > patch
> > 2/4 of that series; the third (clk->func->prog()'s error being
> > clobbered
> > by nvkm_volt_set_id() in nvkm_cstate_prog()) is already fixed by
> > patch 4/4
> > of that series. These two patches address the other two:
> >=20
> > =C2=A0 1. nvkm_pstate_prog() drops the RAM reclock error and falls
> > through
> > to
> > =C2=A0=C2=A0=C2=A0=C2=A0 core clock programming anyway.
> > =C2=A0 2. nvkm_pstate_prog() commits clk->pstate to the new state befor=
e
> > the
> > =C2=A0=C2=A0=C2=A0=C2=A0 hardware transition has actually succeeded.
> >=20
> > Francesco Magazzu (2):
> > =C2=A0 drm/nouveau/clk: don't ignore RAM clock programming errors in
> > =C2=A0=C2=A0=C2=A0 nvkm_pstate_prog
> > =C2=A0 drm/nouveau/clk: only update clk->pstate after hardware
> > programming
> > =C2=A0=C2=A0=C2=A0 succeeds
> >=20
> > =C2=A0nvkm/subdev/clk/base.c | 9 +++++++--
> > =C2=A01 file changed, 7 insertions(+), 2 deletions(-)

