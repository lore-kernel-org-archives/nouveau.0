Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 566E1C5DF7D
	for <nouveau@archiver.kernel.org>; Tue, 18 Aug 2026 22:32:42 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 51AA110E0A0;
	Tue, 18 Aug 2026 22:32:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="Et/HduUf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id AEE264791E;
	Tue, 18 Aug 2026 22:16:09 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1787091369;
 b=V56wqvIbwdAzQFnlzVFrnnY7ZlJ+mHBI90z6C/awggCfFR25Gp2jfse4cAS01TBIzRujm
 1RVT1REUVwpoaUtdb8l/myfV2Vu1NCTR7JD/BgH9ayuyv8fp6dc7TvLr7oXqwOpLB4tTvrq
 aW0/osaeudW+2GVdQ99G7VP07kJ8+ViBDZ72Y+v9RPX5R/RxOE+VZB5Ef0zVq7PHRCvAAQF
 eqloL6ZPtrz6dxqBBhzMhxdus2jtEFC7B1e02QS13QFEgmyu7mZom6b0CKmDLQ/fT6rg2io
 iJyPwfxl6tDDNg5070x3vR5OGIBMGukNwz7s8mf4+ajGofF+xOT4aqQ0CDYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1787091369; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=sTUm+GAgh5332QrOBQAb36npGn/mxQsgSbSIFRFLtWk=;
 b=H85cKIyyPK56UCZWd6HPnDzTENo/NwKZT4PXvEiIsqL2dK/GsTOx8EdHayiXtgwYRg1lx
 zpCxSv3HoxyYsJ00JerkEjWJx4TekOSXR2h3bbOWwUTEy0odZbgfPeSSJry1X2bO8zea7mp
 bOo56DvJpFYEWZdV2LFnUjFd+Q13u4Ydzzg8ywc0r1FmJE7XmqZqZFnkttP7T4vzrOhCKgB
 qSzktvchzoJ33NaRWng9shERBxnUH/sYTOSXqFF6fVIhjR5okCJcbQZZcQJDFwjCO73LHRB
 5j834zuMM7x09biDKnd3g2m4SsQD/MjZpnXOZGdpLm8JOJjI0TW2OS7/ieiw==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 15266478C9
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 22:16:06 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4D3FC10E040
	for <nouveau@lists.freedesktop.org>; Tue, 18 Aug 2026 22:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787092356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sTUm+GAgh5332QrOBQAb36npGn/mxQsgSbSIFRFLtWk=;
	b=Et/HduUf6kF12/M27fz7aIJifs2sBfRB4yJFlDZCo6OJolnBjd9k7QPMxrwfiD50TWkPhl
	HsyuNMF0cHWPtBaePq24IZOjpFAUqWWHAvEPnhgP4lqIxTnhtMagjlSHLMYWrD1iyl0uf5
	aC8gOhosmHdYlMCPqJ8Outd0MpKC0M8=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-4_-7GSSCOzecsttnZEkaxQ-1; Tue, 18 Aug 2026 18:32:35 -0400
X-MC-Unique: 4_-7GSSCOzecsttnZEkaxQ-1
X-Mimecast-MFC-AGG-ID: 4_-7GSSCOzecsttnZEkaxQ_1787092355
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-52cd0374265so6344941cf.1
        for <nouveau@lists.freedesktop.org>;
 Tue, 18 Aug 2026 15:32:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787092355; x=1787697155;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Riz2A5UuSViG3JVLoC0bGAkxf2EfZnfcPl3QvTwCNF0=;
        b=SwxWlEp2vGCoEvjgFWJCN4KsXzdBE5rY9CzonE1JeDogoUOwUhkPo6pMgFSM+lOcFN
         cZfsLe4eYAG1oN9Uc/5j1LGpXBM9bXiiDSyKWik0dG6jWTBrMm+v1uEMfoocKbxTodKE
         mwVHxOlH+MRBd2++e7UDX8o/4VbPbKOftND3YP4Ax3Lomq6zB5OwYry5Aguyhxa7yZGp
         Z14MoTWmvFd49AqZm3Upg/r5Wb0KbAxs92qVEU9QCwzWsnuDeML/4+TF5cHbYhwxalOV
         QUkHjs6mtskWv1+LkMi7tuwE+BKbNcGmgESFgZ6BDl6PrIk3rU1n4z/VTqrgbNSM1JK2
         OnKA==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpv3qg4lnqpfI3EVAidI5pAUKQ/x9pcR4zSZNjMrN0AUKkgJ4u87M2yE2gwsUjXT5gz08EI6ACP@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yydt5St0tICO5m1fl9ezUZw6vBXdK8fjzuEWtD8uWjoDapXsJfh
	p5NmkBz3MeOSQfa6FMkbxyu1sEyy+bfuM08t8SaOj598pVFckCM3cwiRhqZqaytNn3GmX6FfRqs
	OUJ2piPO5et8/bUH8q8CitAukpwHUXaTNJQaXuAYOzphJomYGZf5HUnhbbzxNdl3sAHs=
X-Gm-Gg: AR+sD12VGijmql8IaPrZqtYVaJObf91H74opQKqhgj0jO+29/mYTaLm8a044y0SlGJ7
	Hfvwd7oZrk2NKiDCyONWgSXQJkPSDafyJgqsNzCc4tUwhopEmlEPgAddfprqefttu0ReuelghMQ
	0mqC8mwvrWgxr+OpOEzYwDCx89Awaz2fFDNyQ9wBmAqMfrm6CRciR9R51iwMI6JLmYqtou0w05+
	uQCGr6D/xuXFojQCjkbrNdA9jxdiu+fvPQe5Gl8mGOWUlcK/oyEmDlnSGRIUT4vl+Y09jmCrx78
	0TzF9gV2YRpi2pIuw6bO59kZeSGEobK4QlDBcniX49mZgaFSurwwr+azo/ACJzkfylrIVt1S
X-Received: by 2002:ac8:7f41:0:b0:52d:918b:92e9 with SMTP id
 d75a77b69052e-52dd5cb02b9mr4147231cf.33.1787092354909;
        Tue, 18 Aug 2026 15:32:34 -0700 (PDT)
X-Received: by 2002:ac8:7f41:0:b0:52d:918b:92e9 with SMTP id
 d75a77b69052e-52dd5cb02b9mr4146391cf.33.1787092354173;
        Tue, 18 Aug 2026 15:32:34 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-52db60eb025sm49583821cf.5.2026.08.18.15.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 15:32:32 -0700 (PDT)
Message-ID: <4b354d80857386b0dfb4b38615d707f6da65b66a.camel@redhat.com>
Subject: Re: [PATCH v4 2/2] drm/nouveau/kms: guard NULL crtc in
 nv50_sor_atomic_disable()
From: lyude@redhat.com
To: Marek Czernohous <mczernohous@gmail.com>, nouveau@lists.freedesktop.org,
 	dri-devel@lists.freedesktop.org
Date: Tue, 18 Aug 2026 18:32:32 -0400
In-Reply-To: <e428a3e8d4c0500c112d8deb756fdec884790623.camel@redhat.com>
References: <178688574400.522643.6695278742335367229@gmail.com>
		 <178688574402.522643.5471719764843371376@gmail.com>
	 <e428a3e8d4c0500c112d8deb756fdec884790623.camel@redhat.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7YxVBGZ2lJTU_akWJjMzRNFUWpsnFc2e1BjvNF-datM_1787092355
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: LRYY5M7LCVKMOBIK2PEYYK45OKO3M2CU
X-Message-ID-Hash: LRYY5M7LCVKMOBIK2PEYYK45OKO3M2CU
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>,
 Simona Vetter <simona@ffwll.ch>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LRYY5M7LCVKMOBIK2PEYYK45OKO3M2CU/>
Archived-At: 
 <https://lore.freedesktop.org/4b354d80857386b0dfb4b38615d707f6da65b66a.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 2026-08-18 at 16:44 -0400, lyude@redhat.com wrote:
> > +=09 * .atomic_enable (and by the boot-time hardware readback)
> > and
>=20
> We don't set nv_encoder->crtc at the boot-time hardware state
> readback.

...this was wrong, oops!

