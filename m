Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9A41CD5BAC
	for <nouveau@archiver.kernel.org>; Tue, 19 May 2026 14:47:41 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A054610ED5D;
	Tue, 19 May 2026 14:47:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="i9LdfNzo";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A8CAF45FF5;
	Tue, 19 May 2026 14:34:31 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1779201271;
 b=pgH6jIoO9h4pnjP1W0RnCI8PmgyTt1vRKcXy2WM8Axrzztv+TzI89wMySdP+3ArBY8B/h
 nBxCAjk9jRbbKpB9n7KUapifEtbGBd7yZMDTdko+q8sEedNpKP/nKlh+W1HJG7UY8NUWUco
 yLZwnzHL7WYAXAB6ylJ6U41TNpu2J0lS2mYbzm9EuYdHv3xafa/CD0Qtgw8/kUi5XVQUcu+
 U/FADeuMmh4+H48EgGeOuREZFrtHzpbSljrq4vIlDmPIz590qq7DWd2GSbe2JGMDCXMQTKF
 qxeZgT+367g2ti480heSQb8oUkzSzFKD5mjd3rTroe/xU7RsXa3lSSFgkAzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1779201271; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=CSdd+NX6WkTu8lhAsB8yG+c517QF020QYelPmR8Wkrc=;
 b=q52T1deUHO7bZbk4iShXTpa0mq7hRYp9zHH/b9+HY+yXYdykrX45f2BY0gJpZWhIfs3LD
 1lAVg9ilOMcEyXwOxbm7mlzAh6/36uWBjJ2dgZRMGBWUrEeN6JmvdLPF2Zgm2sRrG/nC4E+
 kxDCiU5FKMmZFqLFDy7tvOObEkRdc6gSgbhKPv+6+MsA+pPc18WDT8ztECmgOJIzL339ck9
 Sl+/iYVig3Lr4m3o7uP9RNIaoj9YcCAjkpZnER3T9KrBI1QdWkL6WCy6PGzk0FacFu5b5Z5
 xWH+QQMelGSnUV7Nb0mJao3wfKKXCCUWHjCymUxeVs/GMYY7dp4dZPkM5Gmg==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 7E41040090
	for <nouveau@lists.freedesktop.org>; Mon, 18 May 2026 19:35:58 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com
 [209.85.216.43])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8EF6D10E9AE
	for <nouveau@lists.freedesktop.org>; Mon, 18 May 2026 19:49:05 +0000 (UTC)
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3697421c2a8so1272846a91.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 18 May 2026 12:49:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779133745; x=1779738545;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CSdd+NX6WkTu8lhAsB8yG+c517QF020QYelPmR8Wkrc=;
        b=i9LdfNzosmErqwQRZ/KMKykSct/OjLFKWyeU14Y0/TdMwezZP4q/3TdK6m/1eZP8gS
         gqVtS0Y1y+TkxGlQFhvA/nwV97MjO3zPh9iqCIeHHxHe11vfadQfy2wPMHx+CRXcidPs
         9WOgP5IpSw/1vgmpJC1jQRbEg1n+6mGEQM8FudyutxEWV2vCnof3ivPYBOo7wF9dwh4m
         Q38MR/p2Ty3JoH41BDjf5Ju9wQT6u78ouQFYLpSh9zJ30qQargdjvrx5d9GhKKUMAjh5
         EVMzO8FsTk2K8lBC/OgVjNUVPi8giw4KS8TyOXKpd6fbp6xVJThoNGdo7s/P5jXeHLVH
         nCog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779133745; x=1779738545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CSdd+NX6WkTu8lhAsB8yG+c517QF020QYelPmR8Wkrc=;
        b=Llvv2gLAqV2pproFNdxblfpl0wg63iCX67D1/km94F5aj655+5ttste/9OGr+sRWA5
         PFFC6+TM39ZUpqZlNa3iU8ycx+RdKMlzRWPfrqCDrNetKicOXRAXfKTKwcSX9AqMwFu0
         KqC9qzfcUB7b/+BDvU6xWcTX4FwDVldrhK/EozRMTZUn0To+vbxHVKYuuAuPVYCkMLxn
         RUhtSlW+zwyPNTY58gYVALEFK+JgH4LLMX1y3aro/CNebsRriIO0URGXFO8hms1F8KWc
         LE28jC+beF1BWIRU2SmQ0Sr+yv1PFSKXm/QBadORTTZSQVDc+NI+wGYIbn1zvB+XgK5T
         h64A==
X-Gm-Message-State: AOJu0YyIIk4UgxKIdF6Fh/Ge8gHAoSwHdsYrcRPFJvNhaggC8XcVeiIF
	c6+C9F0SzbehVVxYduQYQhMc3c5tQIvxrRfdDWqMMqdiNt1cHz/hPnJHiCr3Ug==
X-Gm-Gg: Acq92OFsY3uB56PLOZdxr+G4ZHki5cOSYgFE93cpki1sgMqJ0RgDX/az8LJtiati/oN
	vpGEMfK4uHF1Vt/ea+GKbbZxWBo5S5kJjgO9bZQtzaRqt6dGGxWwduKidLfTZ44s5YFDEuWZPVy
	cN4ixyKJaFFMyeGyGnwOeZZmts4zq+xykq7pNETu9yqjOy8FjZzr7ebJ03U0fGT1RfkRDDBiaNB
	fIc/gjY1Yjbk1XZaYFZx1TNYz3tB20dVBUvIbul2pTjIjLU5AsBEtF5JxwW+k8rLOGROmowZIhO
	OWgQEZmT34ZH7SqwpCfw5rEyy5k13t0VdAgW1YQ2bS2jDIVA94FCAkiJtN/jVcChcoHxDy+rBvJ
	nciUUghlcIup8Hfu18s2WK3H5s9r+8mHGbJQOooIUn+3PHZAaGM/ZQiB1zxX1Lre+Zg16QDQ2BV
	uvGw45TQOy57MKxh8HfdeWMghhAfm1Lzj7/Rk/yWHnzKQGXV0TqFU724byhLnSZ/UOAg9D3A==
X-Received: by 2002:a17:90b:1344:b0:366:4782:138c with SMTP id
 98e67ed59e1d1-36951b971ccmr16986854a91.17.1779133744962;
        Mon, 18 May 2026 12:49:04 -0700 (PDT)
Received: from csl-conti-dell7858.ntu.edu.sg ([155.69.195.57])
        by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-369515895d2sm11635928a91.8.2026.05.18.12.49.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:49:04 -0700 (PDT)
From: Maoyi Xie <maoyixie.tju@gmail.com>
To: Lyude Paul <lyude@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: drm/nouveau/tmr: iterator used after loop end in nvkm_timer_alarm?
Date: Tue, 19 May 2026 03:49:00 +0800
Message-Id: <20260518194900.1672140-1-maoyixie.tju@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MailFrom: maoyixie.tju@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation
Message-ID-Hash: RDXS4XZ5QSRH7TLBVMDJKNMSEITPFJGC
X-Message-ID-Hash: RDXS4XZ5QSRH7TLBVMDJKNMSEITPFJGC
X-Mailman-Approved-At: Tue, 19 May 2026 14:34:30 +0000
CC: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/RDXS4XZ5QSRH7TLBVMDJKNMSEITPFJGC/>
Archived-At: 
 <https://lore.freedesktop.org/20260518194900.1672140-1-maoyixie.tju@gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Hi all,

While reading drivers/gpu/drm/nouveau/nvkm/subdev/timer/base.c
I noticed something that looks like a past the end iterator
pattern. I would appreciate it if you could take a look and
let me know whether this is a real issue, and whether it is
worth fixing.

The site is nvkm_timer_alarm() (linux-7.1-rc1, around line 122):

    list_for_each_entry(list, &tmr->alarms, head) {
            if (list->timestamp > alarm->timestamp)
                    break;
    }
    list_add_tail(&alarm->head, &list->head);

When the loop walks all entries without break, list has gone
one step past the last entry. &list->head then aliases
&tmr->alarms (the list head) via container_of offset
cancellation, so the insert lands at the list tail. That is
the intended behaviour, but the access is undefined per C11.

Jakob Koschel cleaned up many such sites in 2022, for example
commits 99d8ae4ec8a (tracing: Remove usage of list iterator
variable after the loop), 2966a9918df (clockevents: Use dedicated
list iterator variable) and dc1acd5c946 (dlm: replace usage of
found with dedicated list iterator variable). This site in
nvkm/subdev/timer was not covered.

A candidate fix would track an explicit insert_before pointer
initialised to the list head (&tmr->alarms) and overwritten to
&list->head only when the loop breaks early. The observable
behaviour is unchanged.

If this is intentional or already known, please disregard.
Otherwise, I am happy to send a [PATCH] or to leave the fix
to you. Thank you for your time, and sorry for the noise if
this is not actually worth fixing or has already been spotted.

Thanks,
Maoyi Xie
https://maoyixie.com/
