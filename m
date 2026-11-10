Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F31C8606A321
	for <nouveau@archiver.kernel.org>; Tue, 10 Nov 2026 00:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=X6eUXvI/
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id CC0EE10F5FA;
	Tue, 10 Nov 2026 00:55:00 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 5DC5B4918D;
	Tue, 10 Nov 2026 00:35:25 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794270925;
 b=yLlWsoUBQ8B9CcNpWJwlptpX9S42av8fAd4PmfwaUL+6mnukeSmyoqH2wv4HXL4dGcsPp
 UPuwxwEZto2gfx/0WQWL9sKZEs7pcbdC+zY5sDD1pLavIMHyNSCw9Ga3Ob1KDzAGynW7Xsb
 H1aQmeGfnhy4ml5ApSaY8ZkqfBGEv1vkvDq7HuozlSRVFqOB9Ca6p+UVmhHE/Ckai3uc1x4
 hicWbR1mX7dZdAJ61/RFRGxDlbrKctu72O6ih8AqnAQ6h2xvjpx98HD6oKL4ADF/QIMOEJj
 dnHa7VwdukLrbUNYKK07aKroPYSVjMZxV0bPqGLaxEZa6OrqJHUUPQdyKAMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794270925; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
 b=dBHT6GVYCeL+m9sowUFiE0ghg9fe0cpsnoYD+zW6GdUWFXpLD7KIe1znlsj3tlcu0hMDi
 tWqP54VgWfenD0aBM1VOc+dLZwu80LGr/R8WQhTWVW1LNPqO8xvmVgTNwk/UApwAmH7hsWL
 fX6nf4ymRvao6cHtI2plnchMyOm4uxdi07qESb0KL6WBQMUpyPReJt7NQ1uJLrjQvJQ4Npb
 a9OIjx9A/YPOcp+pZJlDciYAnRD/rL1fmZ1PCa7xHHwcuWJU54MSdmH+0YwsJcBbNlUq5LM
 97QcigRX73CKIVTDj82fdP1uR809HZXPw5PVFIfH1rs9JF51V8p1SLc+us4g==
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
	by kara.freedesktop.org (Postfix) with ESMTPS id 6EA2A47662
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 00:35:21 +0000 (UTC)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 8919010F5DA
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 00:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794272090;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
	b=X6eUXvI/Kz3o34CTut4t+LAmRgrKVN80nVjCJlFgEPUWTNVyOI5DwsCuYuyJWHTGOFjzBr
	pfpKnt7ybgAKWRGhTqTBHoAzmKkVbsAiZUEnPrr260O0xqF/v0hZ05gUHV6QX3R3++ufzg
	s76eVs4i3tn1x8hLgjnXW3JEoEf0I5k=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-4nCBh-aoOwued10DAshMWA-1; Mon, 09 Nov 2026 19:54:45 -0500
X-MC-Unique: 4nCBh-aoOwued10DAshMWA-1
X-Mimecast-MFC-AGG-ID: 4nCBh-aoOwued10DAshMWA_1794272084
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-91e987a4099so32657736d6.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 09 Nov 2026 16:54:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794272084; x=1794876884;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A19Ni/zmkIEyhl/2qLYVc+r9AINL52wA+SNspZjr3gA=;
        b=P0RDvgGItnuSCvTujD2ViZLxAdtvDZgbN3rquISF3ZhMoG/w5oErGbnvdX8Wzasw3H
         NINKEruNscE10QpvfIub3U3Y/zaCVAke68BVRbB4th55OW0IZy4afr9fRvrP7LYInFof
         cz+UVAXtEYjKoXJwVa6jB7B3yqfEya+y924pmQddcJWhKYp3ZgIThot5F+WW+JvHL7B4
         8+dIlc6RC69F4DGEj/jkrEco+HA09S2KATxu4IgWqPiIsVb3nGzUfhAAW9jsiuCcf03q
         hzSPqtFg4Spl4+jgZkYYdJT8XC2PioQFsl4bei2rT82YSI2ZXwjagKvOCkn+yQnJAgnz
         e75g==
X-Forwarded-Encrypted: i=1;
 AL+hErGoGVismOLso3VnnL1VZ8dtj+LDNkp8ISn/SgiuWsd4ArdDTIjDN8cWRJaeSG8BB6f8dG3Ry0Ow@lists.freedesktop.org
X-Gm-Message-State: APuU4Z+D3myPHrxK5aovK6xUXzsAbwRonTKXlSKKvMMsNRaC8o+ZtHI3
	+QWevL2arMrGqUP/U1J6PSw02JBz67kq7dHd++wmk4B6FKfXHJQoiGVk0xlNqJPqyRbHkJHwMtY
	GFP1AwoQlpFJRZVyBapr1YFS8gY0+PIHX4jlrYdbSthzEK8hm9OCOiDFGMMNbwiWx4Kk=
X-Gm-Gg: AYBFou0lhiOePOUDp4KHcMkoFv8/LniiihbIlQQc0/c51H/fNiKsbFPLHXWJal1p5Al
	kyH8TMbh8Ye6maSQgwG+/UW6abi6OMhMAiEX5gFKcSA44e2Ikl3wfc+HoSyZohTN5YqWRNVY9Es
	gUg5e7D+4wslDmNsECZ3qFk0hSq4bJNDDyP9fvh0VzubPS2GfHVfRaz4HQrvntl0UWduRWQ8f2J
	nTKMCHQ6zM239Js7cUL9BtJzcVR/SL/Ideqd58WopOygGIiC5LjGbMO8CtVNehey/C34lw6wbzM
	qlrJcGOjnPVPBRv9C6bKxccmCdyDxKA5DgJwdV679osGvCtgxr3XbH00rSdjpgAcLzmvqxzCYnB
	qYF8Y4Dr71/7shjVueLFJ2fz1ys9eB0yaH+bURgyqAMpQ9nLf+0jwtwSPxPIBgkFDWZ4BAg/vp1
	LRuJFrJEZqP7yS0g==
X-Received: by 2002:a05:6214:54c8:b0:91e:97f2:6263 with SMTP id
 6a1803df08f44-91eef82c22cmr22672656d6.29.1794272084325;
        Mon, 09 Nov 2026 16:54:44 -0800 (PST)
X-Received: by 2002:a05:6214:54c8:b0:91e:97f2:6263 with SMTP id
 6a1803df08f44-91eef82c22cmr22672416d6.29.1794272083739;
        Mon, 09 Nov 2026 16:54:43 -0800 (PST)
Received: from [192.168.5.11] (pool-108-49-8-41.bstnma.east.verizon.net.
 [108.49.8.41])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-91ef0501c1csm8604216d6.30.2026.11.09.16.54.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 16:54:42 -0800 (PST)
Message-ID: <b89b83ee3de3ab113820ad94cf09be6b98ec3585.camel@redhat.com>
Subject: Re: [REGRESSION] drm/nouveau: NULL pointer dereference in
 drm_atomic_commit during GP107 initialization
From: lyude@redhat.com
To: Thorsten Leemhuis <regressions@leemhuis.info>, Eric Kim
	 <seohyun.kim@outlook.kr>, "regressions@lists.linux.dev"
	 <regressions@lists.linux.dev>
Date: Mon, 09 Nov 2026 19:54:40 -0500
In-Reply-To: <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
References: 
 <OS7PR01MB1391484D564CF93DFBB4C1DCE966A2@OS7PR01MB13914.jpnprd01.prod.outlook.com>
	 <b89c176a-922e-4628-b549-a6d4b7520ec7@leemhuis.info>
User-Agent: Evolution 3.58.3 (3.58.3-2.fc43)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cjCAwhL8rBoczx0hPxpYKUrdTFYJZnVYsTIP9xrehfU_1794272084
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Message-ID-Hash: MIOMH4UGIC4OH7VTIGJIM44YVL34P57N
X-Message-ID-Hash: MIOMH4UGIC4OH7VTIGJIM44YVL34P57N
X-MailFrom: lyude@redhat.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
CC: dakr@kernel.org, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 simona@ffwll.ch, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MIOMH4UGIC4OH7VTIGJIM44YVL34P57N/>
Archived-At: 
 <https://lore.freedesktop.org/b89b83ee3de3ab113820ad94cf09be6b98ec3585.camel@redhat.com/>
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

Hi - I'm back! Sorry about this, I've been busy moving and only just
got my machine setup. I will take a look at this tomorrow

On Mon, 2026-11-09 at 08:45 +0100, Thorsten Leemhuis wrote:
> On 11/2/26 13:47, Eric Kim wrote:
> >=20
> > On my laptop, which has GP107 GPU with intel graphics and uses
> > nouveau
> > driver, booting kernels after commit
> > 2652aca460dcfdd0d169bbfa358aa15804dc736b causes NULL pointer
> > dereference
> > at initialization.
>=20
> Thx for your report. Hmm, no reply yet afaics. Wondering if it would
> have been better to report it at the dedicated place for nouveau
> kernel
> bugs: https://gitlab.freedesktop.org/drm/nouveau/-/work_items/
>=20
> You thus might want to at least check if any similar reports are
> found
> there.
>=20
> Would also be good to know if reverting 2652aca460dc ontop of latest
> mainline fixes this.
>=20
> Ciao, Thorsten
> > [=C2=A0=C2=A0 17.556328] [drm] Initialized nouveau 1.4.3 for 0000:01:00=
.0 on
> > minor 0
> > [=C2=A0=C2=A0 17.556364] nouveau 0000:01:00.0: [drm] No compatible form=
at
> > found
> > [=C2=A0=C2=A0 17.556792] nouveau 0000:01:00.0: [drm] Cannot find any cr=
tc or
> > sizes
> > [=C2=A0=C2=A0 17.557237] BUG: kernel NULL pointer dereference, address:
> > 0000000000000000
> > [=C2=A0=C2=A0 17.583880] #PF: supervisor instruction fetch in kernel mo=
de
> > [=C2=A0=C2=A0 17.598078] #PF: error_code(0x0010) - not-present page
> > [=C2=A0=C2=A0 17.601475] PGD 0 P4D 0 [=C2=A0=C2=A0 17.608839] Oops: Oop=
s: 0010 [#1] SMP
> > PTI
> > [=C2=A0=C2=A0 17.608914] CPU: 6 UID: 0 PID: 1443 Comm: modprobe Not tai=
nted
> > 7.3.0+
> > #1 PREEMPT(lazy) [=C2=A0=C2=A0 17.608954] Hardware name: SAMSUNG ELECTR=
ONICS
> > CO.,
> > LTD. 800G5M/800G5W/NT800G5M-X78W, BIOS P11RDV.075.170829.XJ
> > 08/29/2017
> > [=C2=A0=C2=A0 17.608990] RIP: 0010:0x0
> > [=C2=A0=C2=A0 17.609090] Code: Unable to access opcode bytes at
> > 0xffffffffffffffd6.
> > [=C2=A0=C2=A0 17.610081] RSP: 0018:ffffca4d86537828 EFLAGS: 00010246
> > [=C2=A0=C2=A0 17.610135] RAX: 0000000000000000 RBX: ffff89b74dcf1180 RC=
X:
> > ffffffffa97d8091
> > [=C2=A0=C2=A0 17.610172] RDX: 0000000000000000 RSI: ffff89b74dcf1180 RD=
I:
> > ffff89b74c466800
> > [=C2=A0=C2=A0 17.610207] RBP: ffff89b74c466800 R08: ffff89b74dcf1180 R0=
9:
> > 0000000000000000
> > [=C2=A0=C2=A0 17.610245] R10: 0000000000000010 R11: ffffffffa9b65410 R1=
2:
> > ffff89b74c466800
> > [=C2=A0=C2=A0 17.610283] R13: 0000000000000001 R14: ffff89b74c466800 R1=
5:
> > ffff89b77f1a2400
> > [=C2=A0=C2=A0 17.610320] FS:=C2=A0 00007fc4a888d780(0000)
> > GS:ffff89bac4364000(0000)
> > knlGS:0000000000000000
> > [=C2=A0=C2=A0 17.610357] CS:=C2=A0 0010 DS: 0000 ES: 0000 CR0: 00000000=
80050033
> > [=C2=A0=C2=A0 17.610414] CR2: ffffffffffffffd6 CR3: 0000000144b20004 CR=
4:
> > 00000000003726f0
> > [=C2=A0=C2=A0 17.610448] Call Trace:
> > [=C2=A0=C2=A0 17.610483]=C2=A0 <TASK>
> > [=C2=A0=C2=A0 17.610521]=C2=A0 drm_atomic_commit+0xb1/0xe0
> > [=C2=A0=C2=A0 17.610558]=C2=A0 ? __pfx___drm_printfn_info+0x10/0x10
> > [=C2=A0=C2=A0 17.610590]=C2=A0 drm_client_modeset_commit_atomic+0x25c/0=
x2d0
> > [=C2=A0=C2=A0 17.610618]=C2=A0 drm_client_modeset_commit_locked+0x5a/0x=
170
> > [=C2=A0=C2=A0 17.610647]=C2=A0 ? drm_master_internal_acquire+0x1d/0x40
> > [=C2=A0=C2=A0 17.610675]=C2=A0 drm_client_modeset_commit+0x25/0x40
> > [=C2=A0=C2=A0 17.610700]=C2=A0 drm_fb_helper_single_fb_probe+0x1aa/0x1c=
0
> > [=C2=A0=C2=A0 17.610729]=C2=A0
> > __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0
> > [=C2=A0=C2=A0 17.610754]=C2=A0 drm_fbdev_client_hotplug+0x79/0xb0
> > [=C2=A0=C2=A0 17.610782]=C2=A0 ? drm_client_init+0x13e/0x180
> > [=C2=A0=C2=A0 17.610811]=C2=A0 drm_client_register+0x79/0xc0
> > [=C2=A0=C2=A0 17.610839]=C2=A0 drm_fbdev_client_setup+0xc9/0x1c0
> > [=C2=A0=C2=A0 17.610867]=C2=A0 drm_client_setup+0x6a/0x90
> > [=C2=A0=C2=A0 17.610893]=C2=A0 nouveau_drm_probe+0x15b/0x1e0 [nouveau]
> > [=C2=A0=C2=A0 17.610922]=C2=A0 local_pci_probe+0x4a/0x90
> > [=C2=A0=C2=A0 17.610951]=C2=A0 ? cpu_hotplug_disable+0x15/0x30
> > [=C2=A0=C2=A0 17.610977]=C2=A0 pci_call_probe+0x5a/0x1a0
> > [=C2=A0=C2=A0 17.611009]=C2=A0 pci_device_probe+0xdb/0x180
> > [=C2=A0=C2=A0 17.611060]=C2=A0 call_driver_probe+0x23/0x100
> > [=C2=A0=C2=A0 17.611104]=C2=A0 ? driver_sysfs_add+0x55/0xc0
> > [=C2=A0=C2=A0 17.611137]=C2=A0 really_probe+0xd7/0x2d0
> > [=C2=A0=C2=A0 17.611171]=C2=A0 ? __pm_runtime_resume+0x50/0x60
> > [=C2=A0=C2=A0 17.611220]=C2=A0 __driver_probe_device+0x9c/0x1b0
> > [=C2=A0=C2=A0 17.611261]=C2=A0 driver_probe_device+0x1f/0x80
> > [=C2=A0=C2=A0 17.611297]=C2=A0 ? __pfx___driver_attach+0x10/0x10
> > [=C2=A0=C2=A0 17.611335]=C2=A0 __driver_attach+0xcc/0x200
> > [=C2=A0=C2=A0 17.611373]=C2=A0 ? __pfx___driver_attach+0x10/0x10
> > [=C2=A0=C2=A0 17.611409]=C2=A0 bus_for_each_dev+0x97/0x100
> > [=C2=A0=C2=A0 17.611451]=C2=A0 bus_add_driver+0x1d0/0x280
> > [=C2=A0=C2=A0 17.611493]=C2=A0 ? __pfx_init_module+0x10/0x10 [nouveau]
> > [=C2=A0=C2=A0 17.611530]=C2=A0 ? __pfx_init_module+0x10/0x10 [nouveau]
> > [=C2=A0=C2=A0 17.611567]=C2=A0 driver_register+0x75/0xe0
> > [=C2=A0=C2=A0 17.611602]=C2=A0 nouveau_drm_init+0x60/0xff0 [nouveau]
> > [=C2=A0=C2=A0 17.611633]=C2=A0 do_one_initcall+0x89/0x3d0
> > [=C2=A0=C2=A0 17.611667]=C2=A0 do_init_module+0x8e/0x290
> > [=C2=A0=C2=A0 17.611703]=C2=A0 init_module_from_file+0xc8/0x180
> > [=C2=A0=C2=A0 17.611736]=C2=A0 idempotent_init_module+0x23e/0x360
> > [=C2=A0=C2=A0 17.611773]=C2=A0 __x64_sys_finit_module+0x7f/0x110
> > [=C2=A0=C2=A0 17.611805]=C2=A0 do_syscall_64+0xbe/0x470
> > [=C2=A0=C2=A0 17.611844]=C2=A0 ? do_syscall_64+0x37/0x470
> > [=C2=A0=C2=A0 17.611883]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >=20
> > It boots without this problem when booting with nouveau.atomic=3D0
> > kernel parameter.
> >=20
> > My guess is that atomic_(commit|check) operation is not present in
> > nouveau_mode_config_funcs, and commit
> > 2652aca460dcfdd0d169bbfa358aa15804dc736b enabled
> > atomic modesetting by default for NV50+ gpus caused
> > the problem.
> >=20
> > Also, drm_helper_(commit|check) was added to
> > nouveau_mode_config_funcs
> > at commit 604826acb3f53c6648a7ee99a3914ead680ab7fb, but it was
> > reverted at commit 6c65db809796717f0a96cf22f80405dbc1a31a4b due to
> > unreliability.
> >=20
> > I hope this problem can be fixed at one of the next releases.
> >=20
> > Thanks,
> > Eric Kim
> >=20
> > #regzbot introduced: 2652aca460dc

