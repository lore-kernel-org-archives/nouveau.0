Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C37EC624D0
	for <nouveau@archiver.kernel.org>; Wed,  2 Sep 2026 04:50:56 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1753D10E466;
	Wed,  2 Sep 2026 04:50:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="TnRMdlEN";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BC54E47DD3;
	Wed,  2 Sep 2026 04:33:52 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1788323632;
 b=XPCi9GS02f6WNdsd7QX9uGCYKkJtQb/YiI4tbAtkFzNzLyTZhG5mC68LeSeEXJlzje7u2
 0Qf4hIxVbTqCP4szcsIqneao0eVnCkPhIlng0csx35fNhG4g0IT8khDBOo5dN+lRSLKAwxM
 tGDI4lgPQqfJIse29QLu4uUJ3yT3KATqm/ADYsF1OEUXiJVDdZfberdhicSd8u304I0mGtO
 B9SmKnhjW6rJg7/Oyo2Mmo7puQpeQ69ROE6nm2T/EDGd8UM7tZGBPhLv6DU+vI4PybIu16M
 DVdx/W/ZJTLI0J6gWcrygxoCnvDX3osEgrXulnkr3s3U/+Pxt98bhheVCe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1788323632; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
 b=zK+87JOGNtDmhKt373bi6BRj+SU+tKBC0EICRtdA2md6K3LX9c3YJtzI6ypstUUNzdPRY
 daVbGHoKA58thO0vB5cz8+p/8UpQ4Ry8EGgHQVlkkIYjfZ/ECxDGjKOJCePhfd0zECAMYBb
 a9xqvFgqHUK8rx+8xvEV10rSy1/+kvaVnwpNAq7L1rnOb5AgtYUI8DvbrfWGMS88qglZPNB
 Z8awXhohDeq/Mx6fv+f/73x31AoajcjKC0NpLyBVFEw97qFd9g3KLN7mAEIgKsrPfc+PW5e
 6JKgH4Ow9qEi2jImsHhQhZpCZcPLCbj2jt8jUolsJiiw8jZu6khJEmj1Ftqg==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 9D32547DC7
	for <nouveau@lists.freedesktop.org>; Wed,  2 Sep 2026 04:33:49 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9FB4710EEDF
	for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2026 19:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788292525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
	b=TnRMdlENQ1dUDlDLy+1FSyBdhf0157C/1hkJ3xnsPK5yARjRqdiELGjazjbEvees6T0DR3
	rT8pxmUhA//KlCwuTArxY0gPzHQFZZ7vLGCzquY9e/VuPZQZ1+pvFTvOkRyXubC+hCd6HL
	2+pZtyNLBDKT+0RejDrXMSniNIQSiw0=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-DKWiOPkhMLuc-UgR_vIoSA-1; Tue, 01 Sept 2026 15:55:24 -0400
X-MC-Unique: DKWiOPkhMLuc-UgR_vIoSA-1
X-Mimecast-MFC-AGG-ID: DKWiOPkhMLuc-UgR_vIoSA_1788292524
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93918756165so84518785a.0
        for <nouveau@lists.freedesktop.org>;
 Tue, 01 Sep 2026 12:55:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788292524; x=1788897324;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2777MRqkHHDOXl9YhBOlEzmHGlKVDToTlF462SeCB8Q=;
        b=qlOBXPTksx608ViM/ragtcJT/HXOn/Dx2YA8iidBUoi6z17FM42gzliuMMyhiqF3lG
         HPR3iQ5Ai3VEMIiUbLNYl+piWeTiVuYhhG2AXE59WN2e2HbwfAJFt7nsEebsox8jr31n
         hgWI6J900lNLZjD5VLKPQzXL8c+hXha1XLwcGWLI88xnFb1yPvz7ifLzUS3ARLqHiRN1
         JOI4uARjfpLIf/+C9xvcAPRm8Omq8USWAYxBkNdfJ9qzsncrVn2GnsVnBWQvK8vbvJct
         h1ygG+NSYvXajI2OMVSgbzCYYhSuy/mm/nsmTe5SfXqkm+pGNR/mzgCmrAl6aXpr/gdG
         tiJw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rq0Q/K0pGl+g9lU9SzcGXKVORU0IIDrsDke83mOW56tAioAJAmu1ssdzv5+M4E4K1f/zAvyEZG6@lists.freedesktop.org
X-Gm-Message-State: AFuF++lnQxn9Xm0jnsauWuhR47ftaklAbfmF7rRCgnmT4zgQ9vj24yzw
	UitoGvMcizcMRipx1V29adp4lkGOO2rHKW9gXPEBBqZQLDV/NeCfH5VH008PajXheS4+XMjGj0g
	pbtk9ZVFIOrDdqFrlxfsUJtpVwey0DQENnIREWBPQQUZUqNQg9Z9Q0u87oa5UsPl9OSM=
X-Gm-Gg: AR+sD121++MIzecz+YfC7PFcPYCOPjbOb+kZ91N0iPOnsfy2h8BSeBzzMPW1dGEhaeK
	k+al1P1kYZVeXQinP+2GCdK20RpH2apaxyDVIQRAfSjz9Zmx9/ARxfOUsnkHLTm3Z/p5XK3KjJB
	wEAsZ7Iqf5jfKsv5Xv/ZsfWCSdMyt1I5vpFzZT21IIZBMJbqVIisGL0qVmm8GE3TApUxJ8orc+0
	JHf3Gh5y+Vo88K9r6hTlt0vSRr76m2jEScUw+yAgEYTW3wley5jZUh6z1xQlFLJljfzvTKwlHfP
	1sIl6wcUaJ2q94Q997PI6LFe+zPD6gXI+s04kugTQFZZpe6Oe3WruAJJuua1ErtbH0SEP/OL
X-Received: by 2002:a05:620a:2b88:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-93948012fadmr1557929985a.15.1788292519037;
        Tue, 01 Sep 2026 12:55:19 -0700 (PDT)
X-Received: by 2002:a05:620a:2b88:b0:92e:71bb:d1c0 with SMTP id
 af79cd13be357-93948012fadmr1557887785a.15.1788292513678;
        Tue, 01 Sep 2026 12:55:13 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-9395f361042sm19286085a.26.2026.09.01.12.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 12:55:13 -0700 (PDT)
Message-ID: <27200b7e13ecc99d57c41da4e25fad690fca68d7.camel@redhat.com>
Subject: Re: [PATCH v2] drm/nouveau: Use write-combined maps for coherent
From: lyude@redhat.com
To: Aaron Kling <webgeek1234@gmail.com>, Danilo Krummrich <dakr@kernel.org>
Date: Tue, 01 Sep 2026 15:55:11 -0400
In-Reply-To: 
 <CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com>
References: <20260821-tegra-coherent-wc-v2-1-2b1ddb67bf18@gmail.com>
	 <8cb96c08-2d1e-459e-b356-c6fd97ef869e@kernel.org>
	 <CALHNRZ-JmYx-PhruhDZ3L8aPVu51cJrqP_FeNtGTyMHCH_esgg@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KGAyDukcqvbHl4Jog6eKsZ7iBoZuXUmgeo8GWnzBg08_1788292524
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: GV5D7PKVP3CIR3DAWUIQVGJZVVK7ZL6C
X-Message-ID-Hash: GV5D7PKVP3CIR3DAWUIQVGJZVVK7ZL6C
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Faith Ekstrand <faith.ekstrand@collabora.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GV5D7PKVP3CIR3DAWUIQVGJZVVK7ZL6C/>
Archived-At: 
 <https://lore.freedesktop.org/27200b7e13ecc99d57c41da4e25fad690fca68d7.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Tue, 2026-09-01 at 13:03 -0500, Aaron Kling wrote:
>=20
> Looks like the tag is:
>=20
> Fixes: 1b4ea4c5980f ("drm/ttm: set the tt caching state at creation
> time")
>=20
> Should I send another revision just to add this, or can the subsystem
> maintainer add it when picking the change up? For stable, I would
> like
> to see this picked to 6.18 at least, since I primarily work with LTS
> forks.
>=20
> Aaron

I would send out a respin with the tag

