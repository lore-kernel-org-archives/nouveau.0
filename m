Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213DCC5CFC1
	for <nouveau@archiver.kernel.org>; Fri, 14 Aug 2026 20:21:04 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A5DC710E5A1;
	Fri, 14 Aug 2026 20:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i3MTcF16";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 03AA9477E0;
	Fri, 14 Aug 2026 20:04:40 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1786737879;
 b=YxbWN/wQgTcggdEH3de8vCvtqMOVY547RqW92D3OWWbKpUZzdL67A85/HZPsOhsRtCOo9
 GGTGcOlFqsEY1UklsyvU+wFYV3YhoNPcaoaV0H0By50P/meN35/LtuSem1SofRr46FXtqTI
 nWo7ND7LtRWVIqmZM/dpveVpcXZEfgZlli6M2VX0C/pQUkgldDmCnzYlqA6ygz6ZNS5tWIi
 BaY9sbZmMA17lrMWpJm+nWicG+tFmTfpoU1AyFsYn2vnqej3klNTXLgHMqngNkGV9iGQQ0o
 rbmckS8dAl+i5u93dr58WgnhHu/rctKOTWgb+vTy9+n1+7bkPob9oTrE8LPA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1786737879; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gRAG93k1GVptmbdTCo0eE+L0lXLT9vpTHkArYVWzdM0=;
 b=rqzZ8Lw2iE4g4Ax6nc68JVabtaXtMFriBFhTgupq/zx6I61ivgfqV32cfJuLfBuGZEEmn
 mmyI4+7eEvRK/E9k2GeyRFXCVu4HlxF3n0n7arxtM5ItL1KK9PUj3usNMXP1A04YgAE+BEb
 0pev9qBQAJC6kYsnYa8NjAjJnkXrFljOWwGfrJcVdP2vJS7rV6C4XXHjt62BNiQkmIfXUhr
 jmXd6AAV2YsNla7TVkO++3PBGN7i+zjxBhXsse16wbOZ/4lLQSvEWUJOMnVINgN/KSQU11i
 XzOETyK5vfm9n7EdBOaw3PHJYHDQlLZnSwHX4fkiKkMbm7vr7A3H8xJY/FMg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id C2655477D5
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:04:36 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com
 [209.85.128.178])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 03F0B10E1CD
	for <nouveau@lists.freedesktop.org>; Fri, 14 Aug 2026 20:20:59 +0000 (UTC)
Received: by mail-yw1-f178.google.com with SMTP id
 00721157ae682-836c718715fso18449997b3.0
        for <nouveau@lists.freedesktop.org>;
 Fri, 14 Aug 2026 13:20:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786738858; cv=none;
        d=google.com; s=arc-20260327;
        b=LO5UOuZ6qqCOGVxdS6jE2URUM6JuvOyCymwL8ikcbAUjGw7fK3fsVnZNdOQQJ9a2IR
         qBfXBpHvuaG8Q1XG3/IgqGtB8+xv9iygfnlJgvZ6/pyHcWLAGP2paLnrAeCkKj7YOY/w
         SGXELJ/cU3gBF3WGmYFGPFv1K9B8Qq7+lRDmu6ckXacc1NKox68FjNNbr1UZ4oMzN+3I
         3dpQUXoVjyMp1b3tmR+I8/HmFhl6MZJSVF4iTmh0eo4587lW6zbDcOcXhlDVe9hI7n0D
         WvbmhJK3mjNycGG2JhfYMiBo3N2uCb/rx5sHL/xJLiZilMN7/vSMNEcrZWHPVMtgvDE2
         k4Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gRAG93k1GVptmbdTCo0eE+L0lXLT9vpTHkArYVWzdM0=;
        fh=nCrKGhNar4sNaqkkEbot2yhSa3iDw4wqIdCR+LoxWGY=;
        b=EdlryFMbVpHjRXm13WDE0xitDLVZ+6cxs9VrFHDW72dqbWxSAevSWnD515eH2JjgFd
         Z2TgCrSPk8rvPE8AXStGFaIVRhBBY8d1/E8XF3yIesepSp43B4+rCS4nFN0wMdCJOU8f
         w8b3oypMhEqM1GvAs3wuuqvfWPsfwbFTNqhkjjTeabKEbUoq8ijb1OE54Vm1AIIUFkgA
         Gc5LhmPbMbRs0NVjSEtkxse/t5KewJmrYhQ0qg2zeURT/6wVN3FoPwVuDzy3SJlfS5Ax
         4ajy+1d8EAuj84BHwBvYo6SgBbbgSUSnlq5f55MYN3UkZSTHPakOCSkR5PLpQwiHRQHi
         qUDA==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786738858; x=1787343658;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gRAG93k1GVptmbdTCo0eE+L0lXLT9vpTHkArYVWzdM0=;
        b=i3MTcF16r8dVXiJdmang1+TiolcYTczpXGP8zSV4VmbD5bzn8klkQSr3p7QmcqGEoX
         7UMfPeeXL+72qKrEarIp6OxrCIQPBE5QGr47aZygDLVF7HQNB2bc5uq2youUC0N720SW
         j8DQ2GKoAEYXDHb9n41RjkMIDyB68Y8bZz87ddpw3xOhhcilVvRZnCw7KVP64+XxhJx/
         SFH+T5D1GeXlECCzMc+NWTHzrfZZdAciYvLsHQ29Ksyxg2v1m0WoEyLj9KI1/PtyjO0M
         tbxrULdJXtzMO2WlBTg84PUBj4QCa3XaP9k8nBH79unATKRrLodSADXZSKSiPdb3BiW3
         HtpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786738858; x=1787343658;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gRAG93k1GVptmbdTCo0eE+L0lXLT9vpTHkArYVWzdM0=;
        b=OdhkJ9bYYYIEur7R3sjXB5yrAdDSIM+vgFmcGgmpbwLKPkjhwVyxZVnbJSyVr3ceui
         4GGzZiJscz+ZY8jXX+9g1byYS4qVoTYnsEko3EFxljhY/4OGytpf/+1+yVOpcwggE+6R
         vBQYUGAW+5hQ5Uda4++TqJ12UGVdvjHfPLMXJZjmPgHnedYCtxHruCzeYMETamgrLS7Q
         VRnwfBqKRat4/+zN7/IRGOZbJuqwONmQ6mrbE8BR2SozV3RGO8OsTvv+QI69zQcBiYY+
         kiyMiIOPoot/D0jr9Ktha+vf+oX6ydK+mC7NQ6K5FbU4Todb9pMGsVQnQ3eDHT06oZ9L
         v17Q==
X-Forwarded-Encrypted: i=1;
 AHgh+Rpyfn4PeuEYGvXYyuHaS7YcugEiDzgAMMF5rm3x5BVwo/0EPICddy+eXBRzRM66Cimr/P0IDqOF@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSzwY592YiiEh6sybYr4ypo7+HmOEC5aDKEAUCPxsDbEF/Lkik
	KAbLY8Dv9WoibeNvflZccD6g5XqX0703UFuO8+4mQZO9fhl17phMPOnjAU8Bcws/KWdJ2Odh2ck
	TPc/L9qbF+tHDvzLLnxnkhGBzk/M8NN0=
X-Gm-Gg: AR+sD11iMs4lkTAxbFC0m6C0pSCQnlFMI6/1FiY+fZeGCWEInY/Hc6AEYyrZTPnnkoi
	drt6HtI0vGfv2c3dkJf1lbFUpmHIzMvOPrJ7VLitr4aeGHU+q8JVVtiMOjPUftzs/NU/5vlYnz6
	5aDMCO+2ctYiHcbnJZk2fEF7xYBIjmUD31QTeMVNbLIvkwL94tQaOuCO1mY0KIZnWbl0fdOMjPR
	qGauF+p4AHONsFCAMB2YY6OUFVJA0cC/oRztJ/gCVr4CQMfeRz011/0Koqu2IiVvwEGe2q77PJl
	dkIw83UjCLuH6aKAUyYpbjRAbgvH8T2IteyeV2r30OiA4EOegKW1v5xN4SUcrR2YIVrWXHg2r3q
	pV+DR5NYhCrXP5A2CjrMEkP69f/OAnvSy3faxVxuk
X-Received: by 2002:a05:690c:e155:b0:826:5659:28aa with SMTP id
 00721157ae682-8371337ca5cmr27191147b3.32.1786738857781; Fri, 14 Aug 2026
 13:20:57 -0700 (PDT)
MIME-Version: 1.0
References: <20260813204803.2097176-1-lyude@redhat.com>
In-Reply-To: <20260813204803.2097176-1-lyude@redhat.com>
From: Dave Airlie <airlied@gmail.com>
Date: Sat, 15 Aug 2026 06:20:43 +1000
X-Gm-Features: AUfX_mz3wwghJ9smyt2jMhsUrFoQRZdb1PKezt__6MAt6P8Xzp87ZulTxam3wao
Message-ID: 
 <CAPM=9txMzUap-J3ddsUeHTYbWyEhHTzZHV1QxOJuTZuo+CG8mQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 0/5] drm/nouveau: Enable atomic modesetting by
 default
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: 3H7B532RDJHBBSE7VTRSTO7GLRBYCMDI
X-Message-ID-Hash: 3H7B532RDJHBBSE7VTRSTO7GLRBYCMDI
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/3H7B532RDJHBBSE7VTRSTO7GLRBYCMDI/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9txMzUap-J3ddsUeHTYbWyEhHTzZHV1QxOJuTZuo+CG8mQ@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On Fri, 14 Aug 2026 at 06:48, Lyude Paul <lyude@redhat.com> wrote:
>
> Nouveau is one of the very few modern hardware drivers in the kernel that
> doesn't have atomic modesetting enabled by default, in part because when it
> was originally written by Ben there wasn't much in the way of good atomic
> modesetting clients to actually test things out with.
>
> Nowadays however, atomic modesetting is very much the norm - and support in
> userspace for non-atomic drivers is starting to bitrot a bit - leading to
> its own set of issues. At the same time, many of those issues are fixed by
> just turning on atomic in nouveau. Plus, I've been running nouveau with
> atomic modesetting on by default for most of the machines I work on, and
> I've already fixed quite a number of issues to the point where things seem
> quite stable (excluding a single screen flashing bug on my desktop, which I
> am not particularly convinced has anything to do with atomic modesetting).
>
> This patch series enables atomic modesetting by default, at least for
> NV50 and newer. NV04 is left unchanged, as atomic modesetting was never
> implemented for it. This series also enforces leaving atomic modesetting
> disabled on <NV50, and adds the value of nouveau.atomic to our kernel
> debug output.
>
> Previous version of this patch series:
>         https://patchwork.freedesktop.org/series/171310/
>
> (Resent, because of a formatting error on one of the patches)

Nice, for the series:

Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
>
> Lyude Paul (5):
>   drm/nouveau: Fix cleanup bug in nouveau_drm_device_new()
>   drm/nouveau: Print the nouveau.atomic parameter in
>     nouveau_display_options()
>   drm/nouveau: Fix drm_driver struct/nouveau.atomic parameter handling
>   drm/nouveau/kms: Only allow enabling atomic modesetting on nv50+
>   drm/nouveau/kms/nv50-: Enable atomic modesetting by default
>
>  drivers/gpu/drm/nouveau/nouveau_drm.c | 116 ++++++++++++++++----------
>  1 file changed, 71 insertions(+), 45 deletions(-)
>
>
> base-commit: 9b388fc3d0e63a4f5b022d326151e176e8d82e25
> --
> 2.55.0
>
