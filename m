Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E0C7C982D8
	for <nouveau@archiver.kernel.org>; Fri, 18 Sep 2026 18:05:45 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4210810F48C;
	Fri, 18 Sep 2026 18:05:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="iZhmnWb2";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 32015482F6;
	Fri, 18 Sep 2026 17:48:05 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1789753685;
 b=l40BINgZgrDtE44cwg+uDxD8mdREJXtBs+U7vic5Wfz86ETDpFCRqmw6yCB4HfjCFmU7J
 m5YcoYtYhfQsPpHxLWbeEPPEaxUp2xdgA0JmkXjmdtDrynJNEqMytpRt54VXN1Juh1uu/PL
 W53AynjwBAsaWT+n3zKGSFwdXJxiuAVArQ+NZsEjD9Ok1ZUYokJKEuhpPLkV63L9P0hcJM3
 VjpsfdvvyTazFDOFqeJafVGMGERgQ66sdHepUwyqrxmOpMy2RHVpBh1x1QjapqNyrL2Ric7
 EYa/1mboV9HAW2xv3fS1uhBay5Wn+YfOhXIsOml8Nz+JenETX47EIzVgOVWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1789753685; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=oprrZIAjlpFsvHJfs+zMLP7oKhVuy9HKJ3yJD5IzrmM=;
 b=QqeAWeI+8KfeJxsoGJU2qujNkSeW2XxA1G/vV868XXZ8HKVh9aU7x52WLieMFe107EwJh
 5Qxez/XZjRUeN9AbcQuv8idk1fzEk5ybV9cf6Nsf+eLpqnbHl167ln9TojXkhfAj5rjKlgM
 nAfOGtH8g13OG6JQyBb5Z9qxDt7pifhK6C1MqXZzXa+nQPKCcby7j/eRR6L8k6PQ7vQvr5V
 WIpCWCErzYmuovT9vDEOr+iUrmqnGUO580ndhHxwz8F/a+UeHeXGbd1UZgPkgYfGEYuFr5n
 wUUsMJ2UgZu4gBBjnTQCU+MV/AR8EJ2x1HHwcHx9fJNafESSJZpkTadoTbLQ==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 77602482C7
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 17:48:01 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 31BC110F47E
	for <nouveau@lists.freedesktop.org>; Fri, 18 Sep 2026 18:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789754740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=oprrZIAjlpFsvHJfs+zMLP7oKhVuy9HKJ3yJD5IzrmM=;
	b=iZhmnWb2fyFMXm9bU1ER3EnhCq9a8vrgeE5x+aWLQ3SUnV+eVaUV5D1B0NRuu8n1lZwowN
	gfbsB7r4sZ23nlLaAYp+6ERHa8I4ZB2A6Y40wAaL7eNqMXmrAnT/FlHYFLZV4fEAFjfJut
	HZfBGFdkV2mn3npE6+Wdwmh6/6IrV8E=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-637-7Oey7PWzM66yPPXSXByT2w-1; Fri, 18 Sep 2026 14:05:29 -0400
X-MC-Unique: 7Oey7PWzM66yPPXSXByT2w-1
X-Mimecast-MFC-AGG-ID: 7Oey7PWzM66yPPXSXByT2w_1789754727
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-939f248907fso107735085a.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 18 Sep 2026 11:05:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789754727; x=1790359527;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8MrzAMtxqLSmsHZdu6tZejw7G1EUBpmA2nrahp3/aZ0=;
        b=stn961KkgB6s+nIMRmcWrEPzZdnSwUOt4rwacdLjBv1WNykDtHF+kFBFkdJE13oDzn
         BpyegsuBUXv9+g4o4nEGYyFtrIpPXj21igxUBHaY+3B0lgqTYlOI2lGZrdLRk6jTX8iy
         8DIdWC8Si6n0NyZ9N+tAL0uTq3xjh9DIdQovpQ0SWUXssR/+8rNl7+n0DpnqlSJMQyV2
         Q2gqF121hO4flDAcvTcfDqOt4do1Y42WXCMWIHc2Eg6tGo/mhzfdW/ez4W7xO9h1ddK3
         PmNTx2XjDgqgMkJr104A1xtlQ6+yED99p+2HYTQxl1qIfpRugxn0cMnayZaPsbu8C8T8
         t/hQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBxa0VeMgtU3T5bjRYZi2HBZSik+wKHN1f/cbR6Zj7VT8Ez7lcKvzM00WtzUoDSkSdAckHihbogJ@lists.freedesktop.org
X-Gm-Message-State: AFuF++nMYsux8ehinOQqC64ZicVQh/V+EU2lwI0c+hetF7TEkzeILi6Q
	zJjsj7yFGPgn0RNoOrhvrF/7/Z+k/9J9DjWqENAaQtZBoYitd9/AfRSftiWhZNCy9tbdxbgXOjO
	4wT8waN5VXwjGUOTzC51WKmln2f5VOQV8nHyYFdne2LfwhmelMXVdQXG2wi/H0t3hHV0=
X-Gm-Gg: AYBFou09Jn6hW+jJiDBLrLTbUFYiCFFhOKO0fqWkThE03MTyXF2Yutqi4GBho1KA8Gv
	fv6jqXGMrOy8lBOHfzfXXC+yqoMm4bEqrhxlDR7/qg+I6mW+DRIO0JyNwogri6j4rfKY5hObWaI
	P7pXPMPB8hEVWKjh2VIT3nA5+kTGLw/juapmbzoKcJACY9ljMWpXpbJaBHSONsUTQRNJrcG2U7Q
	aG81X3olpEqJPaeia15omYEKgV66lF12nnbZ1cGRmOtae1OBT1ssD0E39lpSLOa3yWSmuyqzXXC
	U11A27zx6lWBeRXmFqkB2SapzfWYFb+gaA0DTKK6DRdPCURAlrKYVpRkEhBci1v62a99ejD5
X-Received: by 2002:a05:620a:178d:b0:93b:d7a2:dd36 with SMTP id
 af79cd13be357-93bdca3f401mr534880985a.70.1789754727256;
        Fri, 18 Sep 2026 11:05:27 -0700 (PDT)
X-Received: by 2002:a05:620a:178d:b0:93b:d7a2:dd36 with SMTP id
 af79cd13be357-93bdca3f401mr534873585a.70.1789754726696;
        Fri, 18 Sep 2026 11:05:26 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id
 af79cd13be357-93beda709b1sm3179785a.7.2026.09.18.11.05.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:05:26 -0700 (PDT)
Message-ID: <fa3a44fa852c8fd3b86eeb7e03ba87692056fc3e.camel@redhat.com>
Subject: Re: [PATCH v3 1/4] drm/nouveau/clk: fix list cursor use after loop
 in nvkm_clk_ustate_update
From: lyude@redhat.com
To: Francesco Magazzu <postadelmaga@gmail.com>, Danilo Krummrich
	 <dakr@kernel.org>
Date: Fri, 18 Sep 2026 14:05:25 -0400
In-Reply-To: <20260918131620.405133-2-postadelmaga@gmail.com>
References: <20260918131620.405133-1-postadelmaga@gmail.com>
	 <20260918131620.405133-2-postadelmaga@gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: lNwQGZol1UOfA_4TYM3TbSOlBplByKKh9d6y5t-R4lY_1789754727
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: R2HZCAHUENSI5KBDW4B25XCROGPBFKBD
X-Message-ID-Hash: R2HZCAHUENSI5KBDW4B25XCROGPBFKBD
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/R2HZCAHUENSI5KBDW4B25XCROGPBFKBD/>
Archived-At: 
 <https://lore.freedesktop.org/fa3a44fa852c8fd3b86eeb7e03ba87692056fc3e.camel@redhat.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push to drm-misc-fixes in just a moment, thank you for the fixes!

On Fri, 2026-09-18 at 15:16 +0200, Francesco Magazzu wrote:
> From: Dan Carpenter <dan.carpenter@oracle.com>
>=20
> If list_for_each_entry() exits without hitting a break then "pstate"
> is
> not a valid pstate pointer.=C2=A0 Introduce a "found" variable instead.
>=20
> The check is reachable from userspace: nvkm_clk_ustate_update() takes
> the
> pstate id straight from the 'pstate' debugfs file, so requesting an
> id
> that is not in clk->states - or any id at all when the perf tables
> are
> broken and the list is empty - makes the pstate->pstate !=3D req test
> dereference the list head cast to a struct nvkm_pstate, which is an
> out-of-bounds read.
>=20
> Fixes: 7c8565220697 ("drm/nouveau/clk: implement power state and
> engine clock control in core")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> [Francesco: rebased on drm-misc-next, expanded the commit message]
> Signed-off-by: Francesco Magazzu <postadelmaga@gmail.com>
> ---
> This is Dan's 2022 patch, reposted with his authorship restored as
> asked
> in the review of v2.=C2=A0 The diff is byte for byte what he sent; the
> commit
> message keeps his original two sentences and adds a paragraph on how
> the
> check is reached from userspace.
> Link: https://lore.kernel.org/dri-devel/YvSkKAdk8Pe0g2K9@kili/
>=20
> =C2=A0drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c | 7 +++++--
> =C2=A01 file changed, 5 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> index 572e63846..5da82db71 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/clk/base.c
> @@ -473,6 +473,7 @@ static int
> =C2=A0nvkm_clk_ustate_update(struct nvkm_clk *clk, int req)
> =C2=A0{
> =C2=A0=09struct nvkm_pstate *pstate;
> +=09bool found =3D false;
> =C2=A0=09int i =3D 0;
> =C2=A0
> =C2=A0=09if (!clk->allow_reclock)
> @@ -480,12 +481,14 @@ nvkm_clk_ustate_update(struct nvkm_clk *clk,
> int req)
> =C2=A0
> =C2=A0=09if (req !=3D -1 && req !=3D -2) {
> =C2=A0=09=09list_for_each_entry(pstate, &clk->states, head) {
> -=09=09=09if (pstate->pstate =3D=3D req)
> +=09=09=09if (pstate->pstate =3D=3D req) {
> +=09=09=09=09found =3D true;
> =C2=A0=09=09=09=09break;
> +=09=09=09}
> =C2=A0=09=09=09i++;
> =C2=A0=09=09}
> =C2=A0
> -=09=09if (pstate->pstate !=3D req)
> +=09=09if (!found)
> =C2=A0=09=09=09return -EINVAL;
> =C2=A0=09=09req =3D i;
> =C2=A0=09}

