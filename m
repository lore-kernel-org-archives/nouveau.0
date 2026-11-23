Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E678F606A321
	for <nouveau@archiver.kernel.org>; Mon, 23 Nov 2026 21:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Qf/RRXJJ
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CBAB510F21C;
	Mon, 23 Nov 2026 21:11:54 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 8C1CB4039C;
	Mon, 23 Nov 2026 21:11:49 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1795468309;
 b=HMbXq6CfxJSyP2dI8P19cnj8MP5/VlALP6Kh9syyIz4Wkfg27zuWUMnVYfi/Q28Ql3f6I
 EcUO26DnFTPEsemYjzIbyN2N36WMhT4fTFhmFGvy9lGoUNVtzM7CssfqQiLKG4N53oCsInN
 7NF2C5Og40QhQ75/AYWq/6x8k+7P5DmJPc/RflkQDkNAJyxD9ApEsK7jO0rmt+me2024YXO
 0eSvUrtNb/yOaT66PzOOFQ/wLbxey3isNdcTlpetUs71qrw5d7uhWEzrzP7cy3lgluL84vN
 XZMS49rduCm1uqvELn7Lvrq3/MyDeEVTGr2NCSywCkdt5jP2yvE06m2nzmjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1795468309; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=n9pevu1TMmDcshsy2csnNqdpdxJkEoVnA4XxB7oiN7w=;
 b=QU1biCvuNOT+gsNdSI273KRQxJ6Wt02zjpKih2LjGiTpD826pdrBVzcV1A5JCH4BC5Yel
 j/PMHoqPocki0OuPJCpR4p1QmmVPFUk8tDrFWzNXppTrKmYFhtKKTGuKcPCIFlT8MgfifIT
 IYmyk4yc/Ys93NL8SWXN+9jUfZEgXNxJBYUttT3IdPBoEN5c3dQkyZG6aYme8T9ZaooiS4t
 oczLuQa7KuL6EaDmKmDvNyMS++J9SWlxLd6KLrJfhKrqPkNMLthtqJM78csnBc7euNTzOqn
 D2W6vs97VVbWMBSZo+1RoqzDCGrnIReT67k+MCuDLWt+uIur+OCW4I7l/VbQ==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=redhat.com;
 arc=none;
 dmarc=pass header.from=redhat.com policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=redhat.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=redhat.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D14E5402F3
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 21:11:47 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8EB7410EC8C
	for <nouveau@lists.freedesktop.org>; Mon, 23 Nov 2026 21:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795468301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=n9pevu1TMmDcshsy2csnNqdpdxJkEoVnA4XxB7oiN7w=;
	b=Qf/RRXJJ+xiJdWH5jZ+FsA+TP5tr13wrBonP6ZtVdUAivNqLsh2O4yCnueHKVx4nfVb6ov
	SjpYmWfxt3KURj/+IPvawZ2iHF+sWH793IUC1T+bG+v9wZNx4Q9IbzhVsebEm2Af79Ao4Z
	qP0M381oKc2YeSXnE6oNWx1+ht2mHUY=
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com
 [74.125.82.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-XA8HND26MdyqZXNa3EU_ag-1; Mon, 23 Nov 2026 21:11:38 +0000
X-MC-Unique: XA8HND26MdyqZXNa3EU_ag-1
X-Mimecast-MFC-AGG-ID: XA8HND26MdyqZXNa3EU_ag_1795468297
Received: by mail-dl1-f70.google.com with SMTP id
 a92af1059eb24-1b56c696405so1888408c88.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 23 Nov 2026 13:11:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795468297; x=1796073097;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n9pevu1TMmDcshsy2csnNqdpdxJkEoVnA4XxB7oiN7w=;
        b=hU7AZgDWgC99/eZUb4CpHI7Acw86XTD3L89Go18Z6CSvKGBELnYLh9xfqgandDkgSW
         aCQ3grNaGbuGQ69q1gCXZ/3Vi/0y1jo34K/o9PDTJOb3b/ynIi6E239TEi0OfhSbXpdY
         M5lrK87cubgW9J0mSd0KCK2j3H/NY/mdds7JLOddIqbENZ/KodYtc5DjFzJfIfuqnf4e
         EdWvfLepAT559tdPySN4aSNilKcEECKDd3zkHeW7f2gHT6DEI4cyd8DpYBgD1x/Jynmf
         dvCQ1ew8iBFSqW3RMW2HisX86A5LqvTRMbilw9043Ox7p/J8XJFz9aM4053SC7228D1C
         qSGw==
X-Forwarded-Encrypted: i=1;
 AL+hErF8loIrsQ9N/ys+cQWJaj50t0VoI6+2swdjZbI/BH0ekP71YiT6ivqHAogshZjHyJLuHCoUlJgD@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+tHL/KxGgLsDGg6G+i6VcH1eZgdSWt4GSTTwlvPSgXwzt60Vb/
	EOOqSzOf6ugQcLCbIPDaNsDFG4dPVR0O//QYBDi7R5hLoaNYxYP2aps+nrAwVvPNEirvZNvUebY
	L0DpFOomu7d9RpyvS4OpzR1k/CmNSI3RnWAO2g4m/0x7/C7TeoYy73Acdcl0BHH5w/q+oCNJuPr
	KsJQP4NRoZRPMHwJu52UKc1klTRZwq+00Doa0/lnQoSQ==
X-Gm-Gg: AZFdTZdbgbguz5UZ6q0iMC6MZ/hOvdEC7bbxB9eGq/dB9nVRDRofez2blwYuiuI/gSa
	IgHtRvedSANPl+b4UBWep//RE81uDCktx42MsHeJu1Gv4kqcgWUee19YQ7SXX/iACG0KSY9/u27
	ujsMKYRZ3d223WiDgp9gZz86LDtnoaHb/TTNclMtZs9n0GRsDZSavuQi9v37ujEaL/4o1AhtjSh
	pVeHhUtduzZdIpS
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id
 a92af1059eb24-1b556926cfbmr13460406c88.41.1795468297291;
        Mon, 23 Nov 2026 13:11:37 -0800 (PST)
X-Received: by 2002:a05:701b:4558:10b0:1b3:b4cf:8f18 with SMTP id
 a92af1059eb24-1b556926cfbmr13460369c88.41.1795468296661; Mon, 23 Nov 2026
 13:11:36 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261123-nova-nouveau-gsp-v2-0-5e8c27aa8555@redhat.com>
 <20261123-nova-nouveau-gsp-v2-2-5e8c27aa8555@redhat.com>
 <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
In-Reply-To: <617a6fcc6a541f27351fb7f5abe21fb89553438a.camel@nvidia.com>
From: David Airlie <airlied@redhat.com>
Date: Tue, 24 Nov 2026 07:11:23 +1000
X-Gm-Features: Aa3M54p6fvlOZnXQWzVJ7rxsais-R4gxmnSrBvqgceCPwlHjYyde1II3OXoWZMs
Message-ID: 
 <CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/nouveau: add option to leave GSP-capable GPUs
 to other drivers
To: Timur Tabi <ttabi@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lrQfRjuuUM0CCS3IIooBWQVE8RwxwufRj6liSKZG8MQ_1795468297
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: VXWSMNGRJB3URTJHAQ6G3WZKZ3JVI7HM
X-Message-ID-Hash: VXWSMNGRJB3URTJHAQ6G3WZKZ3JVI7HM
X-MailFrom: airlied@redhat.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; loop;
 banned-address; emergency; member-moderation; nonmember-moderation;
 administrivia; implicit-dest; max-recipients; max-size; news-moderation;
 no-subject; digests; suspicious-header
CC: Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>
X-Mailman-Version: 3.3.10
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VXWSMNGRJB3URTJHAQ6G3WZKZ3JVI7HM/>
Archived-At: 
 <https://lore.freedesktop.org/CAMwc25rDmsXw++KeE4OhTCGCq0PRUZJJQaEMXY2dbvdwWzyL7g@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 24, 2026 at 3:34=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> On Mon, 2026-11-23 at 12:50 +1000, Dave Airlie via B4 Relay wrote:
> > Distributions that want nova-core to be the default driver for
> > GSP-capable GPUs can set CONFIG_DRM_NOUVEAU_BIND_GSP=3Dn; the
> > nouveau.bind_gsp=3D0 kernel command line parameter switches it at boot
> > time.
>
> Just FYI, we've already had to scold two distros for blindly enabling "CO=
NFIG_NOVA_CORE",
> despite all the warnings, because "that's just what we do".
>
> So personally, I'm not a fan of CONFIG_DRM_NOUVEAU_BIND_GSP.  I would pre=
fer just the command-
> line parameter.

At some point we need to give the option, but indeed we don't have to
right now, if nova developers are fine with always providing the
command line option then we could drop the bind options for now,

but I know it can be annoying for devs.

Also distro will enable new things with no warnings to not do so, but
I wonder should we do a default y option of NOT binding nova for
allyesconfig.

Dave.

