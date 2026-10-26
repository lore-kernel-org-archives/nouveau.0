Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A7B606A321
	for <nouveau@archiver.kernel.org>; Sat, 31 Oct 2026 02:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=eYPRJGbl
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 13FC5112A6B;
	Sat, 31 Oct 2026 02:09:14 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 9FF5848C24;
	Sat, 31 Oct 2026 01:50:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1793411400;
 b=C9nvquQjhIX3y+hMfAkSDhnXJjh4+5LvlaOgKZ6tNxontlMrMEFy/4b1TvcBThZ7HbQcI
 rdUTAfV7TFOySaYqbkN2tqvFeMfhNxfq8nFtCdyEclNxKXpyLIWUXd9RVeuCBV87IUVl07/
 BwqpcURhDfplwRlRj46SSJ0PI1DVwyKtpAg1KK+RsbfWHOJKDEjvwCZVi3RLhTYQCRr4QNr
 SXcFWVm74hrPFN3UA5yCROJWB1hIjUpK6t8sgSJAazUm5JNbm3Q9Me1ffT9eBYkfWfVDq7V
 ia+tja/R9LipmjKX+K3s+tCDjaMln3Z9n0gCWQnPzmlo1ux1YLPnofQpkHwA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1793411400; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=IUnZOMuEwAyZgw4JuQeLgbiv3U6p5wn4LjgdqDGJyJU=;
 b=ri0ckhCqzdVkeSXNpgxjeX4fgj7OJYi8HVGWmOH5fi9usa0B3aXdOLWi97sMarijUxVCr
 eLkwJ+cvbzCMi20dW7YW5tCqhmoXbRy4jDxXWEvNk2vd8j8Wn0oCsE2LsabOnlpH3ntUn8y
 O5dxTwXd/LJwRXDIUTFZLA+qrOOczSaWYPiU7oKmDBVk9cP6vrLTf0bhWL5WTjoqFpH8ZWz
 pCjoNR/rXMndeDUx8QYe6wJZHKIanMSLgcet7F9VuMV/x6cPKY3FtY0UTFmoy0blbl3B3Zv
 lC8efcvUTwGErXDSubicjJBAaCI3jkZIMDaw5bwp5KI+ixEqZp1mrDQbqz7Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 015FC47BC6
	for <nouveau@lists.freedesktop.org>; Mon, 26 Oct 2026 19:45:53 +0000 (UTC)
Received: from mail-pz2-f8.google.com (mail-pz2-f8.google.com [74.125.228.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id DD61410E354
	for <nouveau@lists.freedesktop.org>; Mon, 26 Oct 2026 20:04:51 +0000 (UTC)
Received: by mail-pz2-f8.google.com with SMTP id
 41be03b00d2f7-cd3da0e82daso724509a12.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 26 Oct 2026 13:04:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793045091; cv=none;
        d=google.com; s=arc-20260327;
        b=En00XTsv2va58+GJMktOu3h/JVJgxo+Cv7WOe5sM9ydnLxKRbQC/He/jpqGbDAvyE/
         /tZJ9XR3frZ3mCNYaYnUar9gikYhA1m6UQMqLJxWBeCBgB8RhaK1q0e7yTtPuV4fKe3V
         R8+2ysrLb+b3l2ZaNn/CeK3z+Tn8FC28O7T2trArTdvL2ougjSwTKvCqe8aY88MBFn8D
         yH1OL5dUFLpvJwHstXOVlDJqbLXoEJhUlH4KKjkFaeWjwBOse8+BwzlBnPjlaTK/QXYY
         U/gHolSLaG8745KNvMGQdur/vJSwEZWKEwu01CdTjGA5LwjsZ8NOPB2fw7Vp52GGw5Oz
         4pWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=IUnZOMuEwAyZgw4JuQeLgbiv3U6p5wn4LjgdqDGJyJU=;
        fh=TvPdpj9s51L+q6iVdWnIf8JRPWtyzFvsSrNX/1hFbzc=;
        b=hG1eZM00MDUFX3tNSYNF+J4cVTmtmKhanh0blxbePosT1UXjGpYEGCeBWpMpQKl8Sp
         nc2WEFR3kKua7khQzCp58L0LeGDmzJOCXJf7sfacZDDvvOwI5u0ZOpwvfWCHkuaxh0Pm
         0c6Eqq7uA6+fOiVbvqdsEVRiZFBju0o5VY3nwwpaOjnLALiff1MYwuuK7xVwfa8Vq1Th
         CdW5qDuvfbEo+LM8RQ5fiLeQqtUdq5hewr9EkBRo6t7K82mCP+yKX77PMkPkwhO10VWh
         zaacp9eRjQRoVwcfMJdtl3Z9MWVvCx50tmt2SZl23qS6fcVbqp7yxvmhVN3AKo42i7sg
         pBkg==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793045091; x=1793649891;
 darn=lists.freedesktop.org;
        h=content-type:to:subject:message-id:date:from:mime-version:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=IUnZOMuEwAyZgw4JuQeLgbiv3U6p5wn4LjgdqDGJyJU=;
        b=eYPRJGblHJVjX/1CGtDRXty6O8xwxUhYgxbfp+FXMVY7YBtNPgrnBiQfQOAZnPJPWn
         xZJ2YAqHuISh7ntW9MQ7oGhjCiIgTtAIvJfSpp08jUOOqQURisrdUNPHbyiae0kwRIIB
         FH4JyR/htIBbXbKzy6u/jNB46YpCzlkHj+J9xyo3Oug0PLyes69hg99j+uRcZEcXY/Uk
         DAQ8pVYZH/u+tZNmjx/UL1ydWOWnlfePvQhkqY6WRWXCzlhu6IYdfwBDFTikGTGZQhWy
         Zf3IhLYglP7Q9SPHaQQEawwsdpTxtePSEOYwov7QDn2KLPZdkgVtTCXKDWeGrxCNQuMb
         bMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793045091; x=1793649891;
        h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IUnZOMuEwAyZgw4JuQeLgbiv3U6p5wn4LjgdqDGJyJU=;
        b=iKx2CxKYLay7cbtpy1sHslg/6gwCYBzF2FuRgFrK0Qc55phau2Zve3qgOCLjhiwRmX
         pydZOKiFcxvhHsbQtu+iPeAZrI6gBNDyCX9qOeYFZh3N6KhMm2LqXKrXOXQmijTuiwXJ
         h7FwXtpgINpueO7o1r/7YrM/vZi6abp8Ww61C3ThIJ/UYZsIR5hRmgH8mRMEvp9XIh2W
         4MBCniYhyMYgykhpbm7r7m/pLnJK4ssCw7YqVleUPalAjAx+Jy3sMHJXryRJ9VcHgxfY
         zeb5WAeQRrxByJgXYTMEvp1cW4Cyy067rRcyFNEIvVCdTuJUNJN78Z7HuxBdh8DrXA8e
         AIAA==
X-Gm-Message-State: AFq9FYJDLTL1aOWLe+ogwywc9GzG1b3DjODlQx6obdJeA+U2j516HRes
	8q4v/zG+bTkYpvadCvf6Gp2x5Ct3Bt9ljwDOIKWgKt2F//5lA2Pn3TaBEARpN5Kj0uXGJWdaCUN
	OG+T9cB+Lr8NbCta8ljU5vBPnUdGgmWpIQSOz
X-Gm-Gg: AYBFou0/m6GcB4dLWWI8fwfOqsYjv3y7itfODeipXcSmBCr1ez1NizZtMiiASmM8Q99
	yoOpvOVToJx5mFl3TTF6BmCuWwbSxDJrc50cmWoqe++SWqQ0jA/zaxlPGndogO+arDclVzBxunp
	l31vb8D5QOIjklwtXBKqgbDss54V/j/sgCksm+kbnjHYdbwiVtHyBQ0qpKZbdfNkSvlQdb78UcB
	TM5PU2ABm+MRQtYaaUyHdlMQGC5uxOxPMKohM3bUuO/bRKu5IbjYcyVPeNcb8avs5P9YgNSD+g6
	aQX/7yAWgeNzUeT7OjMvRMDBfDoFXlmJmGtPKMtrn+ee6mnaXY6j5Npu8D4G1LrN1DANB0alr7n
	5PY5nonEYEkvZ4e3q5c8DafhqPMCt75rMVtxVeZx0GCaN9GV35aBwo1fP5WYyNepPGBfqo7jMAl
	1iNnOi1hgD1a8u4SSGz9/jOFXOhlYDXVsy2Cp7m7cY5M5f0qWP
X-Received: by 2002:a05:6a21:4014:b0:3e2:aab8:4ec5 with SMTP id
 adf61e73a8af0-3e7cd503e0emr5827828637.66.1793045090856; Mon, 26 Oct 2026
 13:04:50 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: loong <loong.0x00@gmail.com>
Date: Tue, 27 Oct 2026 04:04:14 +0800
X-Gm-Features: AclHuK9U9hYp67C2U8Sx9nWhVGY355tQ3vEIqdJJXIhenopxrEtw7sjjby19_lQ
Message-ID: 
 <CAFugiW8OPd-OmkWyH4m9S-_-b_4r68EbidW1_NX9YgMPjt3kyA@mail.gmail.com>
Subject: =?UTF-8?Q?nova=2Dcore_FSP_question=3A_host_BAR0_reads_of_GB202_FSP?=
	=?UTF-8?Q?_falcon_registers_return_0xBADF5040_=E2=80=94_documented_decoupler?=
	=?UTF-8?Q?_behavior=3F?=
To: nouveau@lists.freedesktop.org
Content-Type: multipart/alternative; boundary="000000000000b4f508065ec3d778"
X-MailFrom: loong.0x00@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: XBGRKK5PKPTNCHGT3ZRKTGDJEDLZFTQT
X-Message-ID-Hash: XBGRKK5PKPTNCHGT3ZRKTGDJEDLZFTQT
X-Mailman-Approved-At: Sat, 31 Oct 2026 01:49:58 +0000
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XBGRKK5PKPTNCHGT3ZRKTGDJEDLZFTQT/>
Archived-At: 
 <https://lore.freedesktop.org/CAFugiW8OPd-OmkWyH4m9S-_-b_4r68EbidW1_NX9YgMPjt3kyA@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=0.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--000000000000b4f508065ec3d778
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello nova-core folks, First: thanks for upstreaming the FSP (Foundation
Security Processor) support =E2=80=94 falcon/fsp.rs, fsp.rs and regs.rs in
drivers/gpu/nova-core are great documentation of the Hopper/Blackwell boot
flow. While studying it against a retail RTX 5090 (GB202, proprietary
driver 615.78.08 loaded), I mapped the host-visible BAR0 behavior of the
FSP register blocks and found a very clean split: Readable from the host
(live values): - NV_PFSP_QUEUE_HEAD/TAIL and NV_PFSP_MSGQ_HEAD/TAIL @
0x8f2c00 / 0x8f2c80 - NV_PFALCON_FALCON_EMEMC/EMEMD @ 0x8f2ac0/0x8f2ac4
(EMEMC currently shows blk=3D0, aincr=3D1; EMEMD returns residual message
bytes) Always return 0xBADF5040 from the host: -
NV_PFALCON_FALCON_HWCFG1/HWCFG2, CPUCTL, MAILBOX0/1, IMEMC/DMEMC (PFALCON @
0x8f2000) - FALCON_ENGINE @ 0x8f23c0 - the whole PFALCON2 block (MOD_SEL @
0x8f3180, RISCV_CPUCTL @ 0x8f3388, CORE_SWITCH_RISCV_STATUS @ 0x8f3240,
BCR_CTRL @ 0x8f3668) Three questions: 1. Is 0xBADF5040 the documented
poison value that the BAR0 decoupler returns for falcon-internal registers
when read from the host on Blackwell? I could not find it in the published
swref headers. 2. Is this filtering static, or does it arm only after FSP
secure boot completes =E2=80=94 i.e., is there a window during/after device=
 reset
(SBR/FLR) where HWCFG1 and friends read back real values from the host? 3.
Is there any supported host-side way to read FSP engine state (core
revision, security model, halted status) on GB20x for diagnostics, similar
to what falcon register dumps give on GA10x? (Context: I'm building a
hardware diagnostics tool that enumerates engine state. These observations
come from pure BAR0 reads, no writes were performed.) Thanks a lot! Best
regards, Loong

--000000000000b4f508065ec3d778
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello nova-core folks,

First: thanks for upstreaming the FSP (Foundation Security Processor) suppo=
rt =E2=80=94 falcon/fsp.rs, fsp.rs and regs.rs in drivers/gpu/nova-core are=
 great documentation of the Hopper/Blackwell boot flow.

While studying it against a retail RTX 5090 (GB202, proprietary driver 615.=
78.08 loaded), I mapped the host-visible BAR0 behavior of the FSP register =
blocks and found a very clean split:

Readable from the host (live values):
- NV_PFSP_QUEUE_HEAD/TAIL and NV_PFSP_MSGQ_HEAD/TAIL @ 0x8f2c00 / 0x8f2c80
- NV_PFALCON_FALCON_EMEMC/EMEMD @ 0x8f2ac0/0x8f2ac4 (EMEMC currently shows =
blk=3D0, aincr=3D1; EMEMD returns residual message bytes)

Always return 0xBADF5040 from the host:
- NV_PFALCON_FALCON_HWCFG1/HWCFG2, CPUCTL, MAILBOX0/1, IMEMC/DMEMC (PFALCON=
 @ 0x8f2000)
- FALCON_ENGINE @ 0x8f23c0
- the whole PFALCON2 block (MOD_SEL @ 0x8f3180, RISCV_CPUCTL @ 0x8f3388, CO=
RE_SWITCH_RISCV_STATUS @ 0x8f3240, BCR_CTRL @ 0x8f3668)

Three questions:

1. Is 0xBADF5040 the documented poison value that the BAR0 decoupler return=
s for falcon-internal registers when read from the host on Blackwell? I cou=
ld not find it in the published swref headers.

2. Is this filtering static, or does it arm only after FSP secure boot comp=
letes =E2=80=94 i.e., is there a window during/after device reset (SBR/FLR)=
 where HWCFG1 and friends read back real values from the host?

3. Is there any supported host-side way to read FSP engine state (core revi=
sion, security model, halted status) on GB20x for diagnostics, similar to w=
hat falcon register dumps give on GA10x?

(Context: I&#39;m building a hardware diagnostics tool that enumerates engi=
ne state. These observations come from pure BAR0 reads, no writes were perf=
ormed.)

Thanks a lot!

Best regards,
Loong</div>

--000000000000b4f508065ec3d778--
