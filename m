Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 628FC606A940
	for <nouveau@archiver.kernel.org>; Fri, 23 Oct 2026 17:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=husSJDwW
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E7289112C46;
	Fri, 23 Oct 2026 17:19:22 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B62FE48B5A;
	Fri, 23 Oct 2026 17:00:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1792774825;
 b=V0QjiVzdmaSxeO/FxmM3VDs1iPOQXf1m+8kNnFXGSfefxPZe6cRPQZCqibfeVfkz7JLiK
 76aiZPXbUvG5croLPFmCTG+WlThEO7OqUXVdCuLzfBC0FOOyNNufy6ZUjzi7/jUAJgadjxW
 ExPcqdqL7JeycAAfg6gMWfrPnVBcR0Ap/38PS+YhtoHsxxZZlzYTZQsM7y45794buDDdzr5
 dnQX+KxrNIrurbEKNJTg7aiMBWoBTyhZ+6Lp2neFgmcuhwqtD0aWeuQMMnTBSiqLN7QX1qw
 56bXM5IcPzRhBQro5H1xOoSGgcexMYpHSBkavv1WvEOHsffeDzEESQQA4Sug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1792774825; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
 b=DDqDQUlOHg+ooXA5qvV6/s0IVS8IVTOAZTrh3fq/56UgmFcA74pnXnl2/fzxb89nwdkkt
 VgSbyUM9+IOxGbP+8SmV82ZCejGU5Zf8Kg+3m0xNhdy0Pyei6mHUr2bFuiLnIbEJ4KISOcE
 6fuMzdG5gs79eVJov1EtgNRiCHmKVEDIy3cCjlR062epcSpZX66yRWF44Y8PJXtZsnUCuWW
 vuAvb1y0VOFm34syycZ/DS+Ier/bg0SjfjUflGjzdVQfE0Fx94LD/FCmKWMbn+U4fESKaIA
 5unPihahAdon/Us/C0J+r3FZuqxj0/AtIbL7TsUZDxzCAMguy2rjTgBLyX/Q==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id CD0DD48966
	for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2026 17:00:22 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BABC310E6B9
	for <nouveau@lists.freedesktop.org>; Fri, 23 Oct 2026 17:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792775954;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
	b=husSJDwWorGVBpW48SlKu7ULPp3qmYz+PSHVXYnk2kvPLwKI2yyVkQjSBvTGpeJguZlLF8
	0lbI8zVlkojtYH35PSXoqyONHLes4KT/W7P89zI1y7pCchf1iU33DtDkR96XR5J5ZHMyeR
	L5pIGoEeSSU2Kzlp6Sqnu1A2d5Y/zg0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-215-k0WvCwC7MsyjMECH6_oYSg-1; Fri, 23 Oct 2026 13:19:12 -0400
X-MC-Unique: k0WvCwC7MsyjMECH6_oYSg-1
X-Mimecast-MFC-AGG-ID: k0WvCwC7MsyjMECH6_oYSg_1792775952
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-93ce7a85f04so222684785a.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 23 Oct 2026 10:19:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792775952; x=1793380752;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iCry58Hu1bv8DzSjqRIxh17FqFhYo6FkXUsOocnB8WA=;
        b=naDg9/87rD9OuEa93X8XGw8UcaCg0o1NjcMrtK/Nl4d3bpSFKevRHXyO4qEz6GZG3L
         buqtUDHH2bKdpD/aWG+nYufZTAIHjfKkDNYrt86Oq/kogxfufS7YwblWVUlBWX3i9vhp
         VPPNRLBRj2Ys3jMH+x8b/rxD6uBLYcr+H+0EnsFfAxCkoaZ+y0hmUDi2HzaLJD9YN9gh
         PGiOIR6EQVgA0AImLH/+Uej+RYzqiWXsYNqexJYnBv7QKnEZY5K/O/FZ3SQ2MmRkZ9Ak
         5nU+BvsUNsUKJLgh4a7PoSQSCjuC4LU4TMfvNpRuw9zbCtVxBF1QiwhatZbhwGWumYG6
         atoA==
X-Forwarded-Encrypted: i=1;
 AKwUvByMCkOiwrTJy1TgsnF5XcYiFO4AO5pRb1QDM9aL7VnT/2vpe3N/hDNJ3r8/8vq7A1OXM0lB8jb/@lists.freedesktop.org
X-Gm-Message-State: AFq9FYIVNgdTVdGarDDHt08y/59DfsBuORpUpmyx0zfRXNYY62a0KwGW
	1+h0V7ho0+7lwjAKI1Wc2BpPYiMwyAx4lB0xzQtTyxwec65+7aVczOwRFP6LAbwCBWwo9drAr/H
	fH+zWeUersCNeSveAMaFqWUhJKZcIugoygc3of3ahZ3PM+gr5y3vLNJUEbVKJqxeE58I=
X-Gm-Gg: AYBFou3uZsDHWJ7SlGld6JhgStls1T/yA/Q65mAISXXIRc7ldnmNEdIXuddWBvHMPWz
	BcUdMm0oPTL2zPKGDkbJp6aygiPhmoHPTFAA2k5KJKUl6S+28MrHStRUm0S5cNOLkVkZgXLH+I7
	XL+OzhAWmds1WfK+CRgJ7VBpOnzqP3EzhdLn/Q1zupeV9o7TVBZwvLyK4jhEseHHGdmpRAnsBL+
	A9PoIXiuvn7NrCxaIyPWI3hSmSVgBHcRZqEaup2GJ9bf5CLfkUivnHo75Iy2phZqa/JmdsKoz9X
	KXcIck1GemyRPAe/ZFVnqlSUoyi6ERbLjIdViOfCn75SGF1BSmJY+nkiW5go3i3dWFED5QU=
X-Received: by 2002:a05:620a:1a05:b0:93f:2b23:4820 with SMTP id
 af79cd13be357-93f6f7bd38emr559077385a.48.1792775951987;
        Fri, 23 Oct 2026 10:19:11 -0700 (PDT)
X-Received: by 2002:a05:620a:1a05:b0:93f:2b23:4820 with SMTP id
 af79cd13be357-93f6f7bd38emr559072085a.48.1792775951481;
        Fri, 23 Oct 2026 10:19:11 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9404722f226sm70474385a.9.2026.10.23.10.19.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:19:10 -0700 (PDT)
Message-ID: <939ee9cdaa3a561f5910fde2e4efacc8c92fd39b.camel@redhat.com>
Subject: Re: [PATCH] drm/nouveau: Clear fence channel in no-signaling path
From: lyude@redhat.com
To: =?UTF-8?Q?=EA=B9=80=EB=B2=94=EC=84=9D?= <dilddream31@gmail.com>,
	nouveau@lists.freedesktop.org
Date: Fri, 23 Oct 2026 13:19:10 -0400
In-Reply-To: 
 <CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com>
References: <20260928081450.19340-1-dilddream31@gmail.com>
	 <CAGC3ukQ7gX97E7pG0Oy8H0cnmQzoA1038io+VhrBogPB3y9dDQ@mail.gmail.com>
	 <CAGC3ukSVk=N4ttd3hwnXXXppHchwroJmySPAFP65Vt+uP0COOw@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XDmFDnXprQ80mCDab5w-gxatRf3qAEs3gkAa7-GiXrs_1792775952
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: CE7X23RTFINAQR33TYCX5QKFOF25EIUP
X-Message-ID-Hash: CE7X23RTFINAQR33TYCX5QKFOF25EIUP
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/CE7X23RTFINAQR33TYCX5QKFOF25EIUP/>
Archived-At: 
 <https://lore.freedesktop.org/939ee9cdaa3a561f5910fde2e4efacc8c92fd39b.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Thu, 2026-10-15 at 19:40 +0900, =EA=B9=80=EB=B2=94=EC=84=9D wrote:
> Gentle Ping.
>=20
> There has been some related discussion here:
> https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordeaux=
.fr
>=20
> The patch has also been independently tested, with no reproduction of
> the issue reported so far.
>=20
> Apologies if you received this twice. My previous message was
> rejected
> by the mailing list due to HTML formatting.


It's no problem, I'm going to try to get back to reviewing stuff asap -
currently I'm in the middle of moving however so I've got to focus on
higher priority stuff at work at the moment. So it might take me 2 or 3
weeks before I can start reviewing stuff again
>=20
>=20
> Thanks.
>=20
>=20
> 2026=EB=85=84 10=EC=9B=94 15=EC=9D=BC (=EB=AA=A9) =EC=98=A4=ED=9B=84 6:10=
, =EA=B9=80=EB=B2=94=EC=84=9D <dilddream31@gmail.com>=EB=8B=98=EC=9D=B4 =EC=
=9E=91=EC=84=B1:
> >=20
> > Gentle Ping.
> >=20
> > There has been some related discussion here:
> > https://lore.kernel.org/r/1690ea65-a1e0-4a34-bde1-bdd26e31c6c4@u-bordea=
ux.fr
> >=20
> > The patch has also been independently tested, with no reproduction
> > of the issue reported so far.
> >=20
> >=20
> > Thanks.

