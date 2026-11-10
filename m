Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951B6606A325
	for <nouveau@archiver.kernel.org>; Tue, 10 Nov 2026 00:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y3wUuZx7
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 26C9F10F5EC;
	Tue, 10 Nov 2026 00:53:04 +0000 (UTC)
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id A2ED74918A;
	Tue, 10 Nov 2026 00:33:28 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1794270808;
 b=X62JKXccBPKCO/2OrG0uQdizUSvLCVlLEB/jbLakVyxKx5I+j/x/DjtukMuZKj5CjO7Yb
 78I7JrshU9lh/u0+7AWUpmIrugUE7FvxTH5fZA63rmE/P9zzEo9/ENEBv0hZAsig3yvQUM6
 4uQOFAET0TY9ywQuJ+fj8Llh3d+6fCAdushRLtV6UPf3kFrxQDUAti0K2D97lLLoEylhMLt
 q95YqYGWpP/YEM4JBkfEQnnVRt7m42NYm6i/htvZWlZ9utpxBSnpGfDSSRNwM941hWOmIlp
 o5VrKior1iAgVJFtyY9DVQfe3ou9EQkE5HPCFfa7xWP8ZCUepMh7h5f+elVA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1794270808; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
 b=RuguGnZlNto4Uqtz/CcXq6vVMR9AUia0OxTFYpyIZ6DfOKyB4S/fU8v8LV7qtZR41ynI4
 ufxUKaWCqIF4srNYqudf3A003eK+tlxYbvm8Gye/KASh4zPU0+QX4mvU799scOXqIM/3ojh
 dEuIU2qe3Q3RbmKv2ToA6h1BUYu0oGY6YOVoDcTNzVls7D3sdNi5WF6lf5sExnpA9RrvUlu
 b1dw+cUqLxwyCikWBfTfnSuJqPoW2t/9D5kSZbHeeEcD3yGAMG+zy0Sp4hFgnlOxCFuriks
 +0Wqo6BH/0a6gN7uzq08i9jmNx63fkhu6qyaCs+opeTzVmYv82/ytj2v6HDQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=gmail.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=gmail.com
 policy.dmarc=quarantine
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=gmail.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=gmail.com policy.dmarc=quarantine
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id A239F47662
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 00:33:25 +0000 (UTC)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com
 [209.85.222.181])
	by gabe.freedesktop.org (Postfix) with ESMTPS id D43B010F5D9
	for <nouveau@lists.freedesktop.org>; Tue, 10 Nov 2026 00:52:55 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id
 af79cd13be357-93cb9e9405fso78019085a.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 09 Nov 2026 16:52:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794271974; cv=none;
        d=google.com; s=arc-20260327;
        b=PnlQeakFPdPvfncAryqZjwPqiqjO8J01+L1/STWTj7ekmRPAAY+hZ0X962/ajqeUwW
         vHs82p9WNXBrkW279mJxdMJfc+hZJU3v98nLmlT6q1H7InIT1dcuU8ZZS/wT+7UnC/8A
         U6TBzivLIugFh7Oq4YjpRvS1fvzJZeAwgGXVQZlvo27A7tufA92G8yYJ+H+bwz/8N8YY
         +uh6THIBbcL90SzF0IyHEzKMu06V1VkQIxioZrqhtejPSejrp8uTEfQohYUveWPPfez1
         vYsOG55FfAe0EReiKCqGVszoeJMJjDZrxlz1cmY0mrMExZlh8/7Hk2H+DYKoTXyM7Pr4
         rkfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
        fh=gWXFDn58njjNrktr6dsTmakQmB0pKiErntCX4Uhj3zQ=;
        b=bYimK6ionOMQWnWN0XXm+HatTcEPdu56lFw2U036f+a/K/pGQ1pxYUmc9GemwKExSw
         hDt2yVEtkI9Y2PNZi/slTg3VWxndeaUyjVRS384y+G6o8nR/bFGlvgePkfrWYHrD2QJO
         NimPxqyKR/FgCzALddhhhhNifJjifTkjDjZbLC7nb0tGsrgzofgSbERdC7ok/0yMFN8e
         VkOJGlYLpf5uo15AHeoVP02nny92jGu3SYuOAjV4BMkwzw0m9qs9IWJKiLVifxsPXwlW
         5PR4GV499yIU2DAIBADb/Z6oaSe/YSSf673XFKB79U05kGPLcW/lbW6AyT61eTGDH2kI
         qVaw==;
        darn=lists.freedesktop.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794271974; x=1794876774;
 darn=lists.freedesktop.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
        b=y3wUuZx7VhTII2bH7UnzN3FL/soINeG6m3ie4RasDEfWHapDNbEe8iDzHmYQhrILJL
         QaZ0+RA16sDnLMTjpGW+1zc1hIK3Ok+Iwi+QfIOPoEY4KDkAE3xDFaBUdfvSCQCHOwXi
         4Br4/MzatfE0Wfx4e/9DTeShti22liQCLl0qxTbuC1woP4/6w+BDXSmhplcKwvWyh/S4
         cbK6jIweiQWpyqgjXJMT9jitFhiX+JgvcMsxOQnnNRx6RodjSH7+fxc/qj0LNJomucG3
         0krjuyAAkE/xBFoCZfIbBNPkW0aWPlGoQpa2jPo9Nd+n2MdPyDWrkTqKCCLYzH5CAjvu
         yYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794271974; x=1794876774;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=fIHfnj++q/SlsevrSlgQl/5lS3DkgecVq4KF0bU+zN4=;
        b=y7ep95I5oxGrtJwhAmDbkts4kxUTxwycq2R43dWfHL/SqmEwEXkC29V/0Xpv11saPv
         ZL6zILb0J5cXlBvzKBHrebxl4VUQDJVZoD50n686ci5tM6maXqjQuSiK46D2Yud45for
         GmLeX5RJjXkq9whInKKwwf8ASySEUvjiZw88+rQLXrqq3pRFi4y634e59vuUAltnBn0X
         0M79ksX/2ExxX+KM0IebD7s24XMte72c+N6k6wDpLinVYbpD4C6TpLBrE4RI39ZxeH8/
         yupxyZFP0Xx1S8yI7B6lkrIHzcwrkppaM1Hwqlhs37yxmvZta/xlkiJwtAQOaq/sHA/5
         nYow==
X-Forwarded-Encrypted: i=1;
 AL+hErFcdKC6N6hi3E1P/N/ez17/Kszuogp8MXynkRmM/4sNceSHoxKT203WQ4scWV5T8vS4Ilt9F1pz@lists.freedesktop.org
X-Gm-Message-State: APuU4Z/dQR7iiuY/5Xr3LY28NpYp2IeyWCSMJuvPgXaolXZnzut7zyiU
	ReX+1JIChs00yNdE1zN53awnNpuJFnbwXEnt2rtrqa5qp3eGp3fvAYv46jGNQfpbFQ2pQlO7dvV
	T46J4b6As75F1q5xuVvjIa29z3YLIwFB1fSuc
X-Gm-Gg: AYBFou33SFc2ZAGMenapMqQtpMShDWlXVnemb4Zex8V0twDcQUDcWaK4HeiKTvFodQO
	hhvwGhqkFWsTUV8iat+Rs1PFwYfi0ZZvA80quyHGk64O/Snotu0KQLKYHyh2WNphgXRP74w+mM2
	L8LNBnRpW5vzKNVuI1c9PX0KNVxyy9ib9OyQKna3N7F8rdwYch3TN5uLcl5jLdDUA5eaPnorwyY
	6ZN+gnSTpmoklDTNfesInYI4yYIGnLSod8wKNu6tbkpJd5aLhgtX48G1JnqbmFhRXa592mv58yJ
	RA0M7pWTslv4JvW8hp/pDygDdT3EGpzAMn6YXwtXK7qBQ0JAy3THPa76HWvXLtBDyca0aAccIfN
	iyOBuHvh54HIoU/lbLY2CXJsx/Mss3O/7DyWzj+3okGdU/owG7Lco2/2At/bn64mYNXRfLRMXi0
	f3/iJoSMirKADavg2l98ltPQ==
X-Received: by 2002:a05:620a:4693:b0:93e:c12c:fbcd with SMTP id
 af79cd13be357-9479f35eedemr193057885a.73.1794271974270; Mon, 09 Nov 2026
 16:52:54 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel.ref@aol.com>
 <629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel@aol.com>
In-Reply-To: <629c8bdedca971d38b08ffd32acec1a804ff7d7d.camel@aol.com>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 10 Nov 2026 10:52:42 +1000
X-Gm-Features: AclHuK8Ki-kawuemorAfz7rrtZVSws_7w7m2uRxFuzWM_1_yfCTSwNT-D28Rts4
Message-ID: 
 <CAPM=9tzS3qS=Xn1y+6fveWJxayOsBei9AuygLJV=dw3_H4QY=A@mail.gmail.com>
Subject: Re: [REGRESSION] nouveau oops on 7.4-rc2
To: Ruben Wauters <rubenru09@aol.com>
Content-Type: text/plain; charset="UTF-8"
Message-ID-Hash: XJEARZI6ADBU33MSALFDJBQNFLUAZ36A
X-Message-ID-Hash: XJEARZI6ADBU33MSALFDJBQNFLUAZ36A
X-MailFrom: airlied@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dakr@kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/XJEARZI6ADBU33MSALFDJBQNFLUAZ36A/>
Archived-At: 
 <https://lore.freedesktop.org/CAPM=9tzS3qS=Xn1y+6fveWJxayOsBei9AuygLJV=dw3_H4QY=A@mail.gmail.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
X-Spam-Status: No, score=-0.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 10 Nov 2026 at 07:06, Ruben Wauters <rubenru09@aol.com> wrote:
>
> Since 7.4, I have been encountering the following oops when booting my
> computer. The issue is present in rc1 and rc2, 7.3 boots fine.
> The kernel booted fine and passed to init, which then tried to start
> gdm, gdm did not launch, leading me to dig and encounter the following
> oops in the journal.
>
> It is worth noting that my laptop, where I encountered this oops, has
> two gpus in a hybrid system, one intel integrated, and one nvidia.

Can you boot with drm.debug=0x10 and attach the complete dmesg?

I've booted a Fedora 44 GP107 laptop this morning with a intel/nvidia
combo on 7.4-rc2 and not seeing anything, so we will need more info.

Also:
https://gitlab.freedesktop.org/drm/nouveau/-/work_items?sort=cr

might be an easier place to keep track of things.

Dave.

>
> It looks to me like something return an -ENOPROTOOPT (likely due to the
> hybrid GPU situation) and then another func tried to deference this
> without checking for errors.
>
> Some quick digging shows that it could potentially be related to atomic
> mode setting being enabled in 7.4, whereas it wasn't before.
>
> I tried to take a look myself at a patch, but unfortunately I got a bit
> lost in nouveau, sorry for not being able to fix it, I hope you're able
> to. If you need any further information, please don't hesitate to
> contact me.
>
> Ruben Wauters
>
> Oops: Oops: 0010 [#1] SMP NOPTI
> CPU: 6 UID: 0 PID: 464 Comm: (udev-worker) Not tainted 7.4.0-rc2 #1
> PREEMPT(lazy)
> Hardware name: ASUSTeK COMPUTER INC. Vivobook_ASUSLaptop
> X3500PCB_K3500PC/X3500PCB, BIOS X3500PCB.305 10/13/2023
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> RSP: 0018:ffffce1000a37668 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff8dff8a97d300 RCX: ffffffffaff4b406
> RDX: 0000000000000000 RSI: ffff8dff8a97d300 RDI: ffff8dff86b91000
> RBP: ffff8dff86b91000 R08: ffff8dff8a97d300 R09: 0000000000000000
> R10: 0000000000000010 R11: 0000000000000000 R12: ffff8dff86b91000
> R13: 0000000000000001 R14: ffff8dff86b91000 R15: ffff8dff8299fa00
> FS:  00007f9bcede9880(0000) GS:ffff8e0349bd8000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000104854004 CR4: 0000000000f72ef0
> PKRU: 55555554
> Call Trace:
>  <TASK>
>  drm_atomic_commit+0xb1/0xe0
>  ? __pfx___drm_printfn_info+0x10/0x10
>  drm_client_modeset_commit_atomic+0x25c/0x2d0
>  drm_client_modeset_commit_locked+0x61/0x180
>  ? drm_master_internal_acquire+0x1d/0x40
>  drm_client_modeset_commit+0x25/0x40
>  drm_fb_helper_single_fb_probe+0x1aa/0x1c0 [drm_client_lib]
>  __drm_fb_helper_initial_config_and_unlock+0xa8/0x1b0 [drm_client_lib]
>  drm_fbdev_client_hotplug+0x79/0xb0 [drm_client_lib]
>  ? drm_client_init+0x116/0x150
>  drm_client_register+0x79/0xc0
>  drm_fbdev_client_setup+0xc9/0x1e0 [drm_client_lib]
>  drm_client_setup+0x6a/0x90 [drm_client_lib]
>  nouveau_drm_probe+0x15b/0x1e0 [nouveau]
>  local_pci_probe+0x4a/0x90
>  ? cpu_hotplug_disable+0x15/0x30
>  pci_call_probe+0x5a/0x1a0
>  pci_device_probe+0xdb/0x180
>  call_driver_probe+0x23/0x100
>  ? driver_sysfs_add+0x55/0xc0
>  really_probe+0xd7/0x2d0
>  ? __pm_runtime_resume+0x50/0x60
>  __driver_probe_device+0x9c/0x1b0
>  driver_probe_device+0x1f/0x80
>  ? __pfx___driver_attach+0x10/0x10
>  __driver_attach+0xcc/0x200
>  bus_for_each_dev+0x9c/0x100
>  ? bus_add_driver+0x84/0x280
>  bus_add_driver+0x1d0/0x280
>  ? __pfx_init_module+0x10/0x10 [nouveau]
>  ? __pfx_init_module+0x10/0x10 [nouveau]
>  driver_register+0x75/0xe0
>  nouveau_drm_init+0x60/0xff0 [nouveau]
>  do_one_initcall+0x89/0x340
>  do_init_module+0x8e/0x2b0
>  init_module_from_file+0xfe/0x170
>  idempotent_init_module+0x23e/0x360
>  __x64_sys_finit_module+0x7f/0x110
>  do_syscall_64+0xc2/0x4d0
>  ? switch_fpu_return+0x5e/0xf0
>  ? ksys_pread64+0x61/0xd0
>  ? arch_exit_to_user_mode_prepare.isra.0+0x84/0xa0
>  ? do_syscall_64+0xff/0x4d0
>  ? do_sys_openat2+0x75/0xe0
>  ? switch_fpu_return+0x5e/0xf0
>  ? arch_exit_to_user_mode_prepare.isra.0+0x84/0xa0
>  ? do_syscall_64+0xff/0x4d0
>  ? do_syscall_64+0xff/0x4d0
>  ? clear_bhb_loop+0x60/0xb0
>  ? do_syscall_64+0x37/0x4d0
>  entry_SYSCALL_64_after_hwframe+0x76/0x7e
> RIP: 0033:0x7f9bce71f95d
> Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89
> f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01
> f0 ff ff 73 01 c3 48 8b 0d 6b 64 0d 00 f7 d8 64 89 01 48
> RSP: 002b:00007ffdb99bcab8 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
> RAX: ffffffffffffffda RBX: 0000564b33e33130 RCX: 00007f9bce71f95d
> RDX: 0000000000000000 RSI: 00007f9bced703af RDI: 000000000000004a
> RBP: 0000000000000000 R08: 0000000000000000 R09: 0000564b33e30d90
> R10: 0000000000000000 R11: 0000000000000246 R12: 00007f9bced703af
> R13: 0000000000020000 R14: 0000564b33e2dd30 R15: 0000000000000000
>  </TASK>
> Modules linked in: drm_gpusvm_helper drm_suballoc_helper snd_hda_intel
> snd_sof_pci_intel_tgl snd_sof_pci_intel_cnl snd_sof_intel_hda_generic
> soundwire_intel snd_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common
> snd_soc_hdac_hda snd_sof_intel_hda_mlink snd_sof_intel_hda
> soundwire_cadence snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils
> snd_soc_acpi_intel_match vfat snd_soc_acpi_intel_sdca_quirks fat
> nouveau(+) soundwire_generic_allocation snd_soc_sdw_utils snd_soc_acpi
> crc8 i915 soundwire_bus snd_soc_sdca intel_rapl_msr
> intel_uncore_frequency intel_uncore_frequency_common snd_soc_avs
> intel_tcc_cooling x86_pkg_temp_thermal intel_powerclamp coretemp
> snd_soc_hda_codec mt7921e snd_hda_ext_core mt7921_common snd_hda_codec
> kvm_intel mt792x_lib snd_hda_core mt76_connac_lib mt76 snd_intel_dspcfg
> snd_intel_sdw_acpi snd_hwdep snd_ctl_led kvm snd_soc_core asus_nb_wmi
> mac80211 snd_compress ac97_bus btusb asus_armoury snd_pcm_dmaengine
> btmtk irqbypass uvcvideo spi_nor snd_pcm drm_gpuvm btrtl rapl mxm_wmi
> btbcm
>  intel_cstate mtd uvc drm_ttm_helper firmware_attributes_class iTCO_wdt
> drm_buddy btintel videobuf2_vmalloc intel_pmc_bxt
> processor_thermal_device_pci_legacy ttm snd_timer mei_pxp >
>  fsdev_dax ucsi_acpi typec_ucsi typec hid_multitouch i2c_hid_acpi
> i2c_hid video wmi thunderbolt pinctrl_tigerlake intel_oc_wdt vmd
> serio_raw rtsx_usb_sdmmc mmc_core rtsx_usb
> CR2: 0000000000000000
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at 0xffffffffffffffd6.
> RSP: 0018:ffffce1000a37668 EFLAGS: 00010246
> RAX: 0000000000000000 RBX: ffff8dff8a97d300 RCX: ffffffffaff4b406
> RDX: 0000000000000000 RSI: ffff8dff8a97d300 RDI: ffff8dff86b91000
> RBP: ffff8dff86b91000 R08: ffff8dff8a97d300 R09: 0000000000000000
> R10: 0000000000000010 R11: 0000000000000000 R12: ffff8dff86b91000
> R13: 0000000000000001 R14: ffff8dff86b91000 R15: ffff8dff8299fa00
> FS:  00007f9bcede9880(0000) GS:ffff8e0349bd8000(0000)
> knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000104854004 CR4: 0000000000f72ef0
> PKRU: 55555554
