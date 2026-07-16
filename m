Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BAB2C44501
	for <nouveau@archiver.kernel.org>; Thu, 16 Jul 2026 10:45:07 +0000 (UTC)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 72F9010F2B7;
	Thu, 16 Jul 2026 10:45:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=u-bordeaux.fr header.i=@u-bordeaux.fr header.b="lS90qLwf";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 2BA6F47205;
	Thu, 16 Jul 2026 10:29:50 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1784197790;
 b=vcQDgAbY/itBkU5fZA/R6ZkytnL32Lcb67brBkJwEAu10SuvZRV+PFReUcc4ZDW3B7kYm
 nzjtQOarjSdvynKllmqcBNZ4AvlhMybxjqdWZcrAc4boYkg4Q1THJvysKdHRSDIOnnrALE9
 WoSYfBo0B/+wgkelFMYY5Ij5RLDYL28UdRp49/Hnigy7mdima8AWZE0muIoW6u2EOPGzmno
 cLs9hHVCcSgEPh2HTUmG9KDsXcR3lWrni37XeF4itfhY596UoWwYQFG4RtKtsaSszY3fg5O
 mx4pHYzJG2hhYUojJgQf0mUcHohxIiCwzD8OjslQIc2o7u1fzMtcJMvcPtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1784197790; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=3ckwsu3zJrnlaYqW7zlX1B79c4g4wvFTMuG7bXE0K0Q=;
 b=WjxdNZroFpQsNtK7XItXTAhxZBWLc9ba3tttFKrLHU3Nv28UF4u8IIBrkezmUGR8VeN0n
 mSqvrGd+AbGOHRbqaqIBcAVhvatsmRU1mhWZYPBjxi1qX4RND1SnGUm/ut+edoMYy0xPM+Z
 Yz3Q0tpsPsYuWk33pUdmb84/KG6CZTSDFOjezMtDNZLTeNDY/90WLKBIfpg7OfhnOrw0ORO
 7CxpYx6d+JetDdQVXrTk6Cr3mAMPuPGLntOMS9EHrLbdy17nOFcXZlgtJiKNs7+ArKFqqM5
 HWDfj1CQPUZumbjNFBttoJuZIgHB+zK0zrfSQBH1sTihGRX+pwvDsOZDLt9Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=u-bordeaux.fr;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org;
 dkim=pass header.d=u-bordeaux.fr; arc=none (Message is not ARC signed);
 dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 03E794551C
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 10:29:47 +0000 (UTC)
X-Greylist: delayed 347 seconds by postgrey-1.36 at gabe;
 Thu, 16 Jul 2026 10:45:03 UTC
Received: from v-zimmta03.u-bordeaux.fr (smtp.u-bordeaux.fr [147.210.215.83])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3D63310F28B
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 10:45:03 +0000 (UTC)
Received: from v-zimmta03.u-bordeaux.fr (localhost [127.0.0.1])
	by v-zimmta03.u-bordeaux.fr (Postfix) with ESMTP id EE82518000BC
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 12:39:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=u-bordeaux.fr;
	s=2025032601; t=1784198355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=3ckwsu3zJrnlaYqW7zlX1B79c4g4wvFTMuG7bXE0K0Q=;
	b=lS90qLwfD/CnRvOTsgvpe3b4QEfian/ADMgub2wnfFxpGa+00zvodlJiU7aUBuOkvNEEzD
	Z9K/YB48mBXtt2kaFdeaNT2wzdXAlNvZMrox5UbuQmdYd0JsUtI6ZFq3ni3h6ci9uGKE76
	/ULQCa+OW9p4e3lBH3c/r+JIQFOypyerKXGLWoFnK4YHFOFJt+JduPaQ4ipHeXHx6JhgOx
	DYJRxHb4Lm8pJL88UG6vVVG8BydrPrdSBN3V9Qm1mvwj30HFY2vMytOlcYwAtCTNom4TPL
	F5eo0mGfxn7Y5oFbOLZ+drAEJt0di1LwEgNTC3xy12qPkdsO/zmLzUa4kui2Ag==
Received: from [147.210.8.222] (callisto.labri.fr [147.210.8.222])
	by v-zimmta03.u-bordeaux.fr (Postfix) with ESMTPSA id B6F39180009C
	for <nouveau@lists.freedesktop.org>; Thu, 16 Jul 2026 12:39:14 +0200 (CEST)
Message-ID: <258ace38-80ee-4202-9aa7-ccc01debe4da@u-bordeaux.fr>
Date: Thu, 16 Jul 2026 12:39:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US, fr
To: Nouveau Driver ML <nouveau@lists.freedesktop.org>
From: Emmanuel Fleury <emmanuel.fleury@u-bordeaux.fr>
Subject: Reproducible NULL pointer dereference in nouveau_fence_sync() when
 closing a GPU-composited client window
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-AV-Checked: ClamAV using ClamSMTP
Message-ID-Hash: FQJOSXHRU5HGMJEYBSLH4LVHFJWPDVM4
X-Message-ID-Hash: FQJOSXHRU5HGMJEYBSLH4LVHFJWPDVM4
X-MailFrom: emmanuel.fleury@u-bordeaux.fr
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/FQJOSXHRU5HGMJEYBSLH4LVHFJWPDVM4/>
Archived-At: 
 <https://lore.freedesktop.org/258ace38-80ee-4202-9aa7-ccc01debe4da@u-bordeaux.fr/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Dear Nouveau Maintainers,

Since the last few months I occasionally, but persistantly, stumble on a NULL
pointer dereference bug in my Nouveau driver.

I am running a Debian unstable with Wayland on a Dell machine with a
dual-screen. More precisely:

-- Hardware --
Dell Inc. Precision Tower 3420, BIOS 2.33.0 (11/05/2024)
GPU: NVIDIA GM107 (nouveau driver), 2048 MiB VRAM, vbios 82.07.b3.00.01, PCI 
0000:01:00.0

-- Session --
GNOME on Wayland (mutter/gnome-shell talking to /dev/dri/card0 directly).
GNOME Shell 50.2 (mutter)
Mesa 26.1.4-1

Strangely, the crash occurs always when I am trying to close Evince (Gnome PDF
reader) and it results in a freeze of the gnome-session process.

The rest of the system is still running, so I usually need to connect to my
machine through ssh and kill the freezed gnome-session process and restart it
through gdm3. Then, the system is working properly again (apparently).

Here is the kernel Oops I got several of these on different kernels (its more or
less the same each time):

```text
===============================[ Kernel Oops #1 ]===============================

2026-06-29T16:47:40.847819+02:00 callisto kernel: BUG: kernel NULL pointer 
dereference, address: 0000000000000040
2026-06-29T16:47:40.847839+02:00 callisto kernel: #PF: supervisor read access in 
kernel mode
2026-06-29T16:47:40.847839+02:00 callisto kernel: #PF: error_code(0x0000) - 
not-present page
2026-06-29T16:47:40.847840+02:00 callisto kernel: PGD 0 P4D 0
2026-06-29T16:47:40.847840+02:00 callisto kernel: Oops: Oops: 0000 [#1] SMP PTI
2026-06-29T16:47:40.847841+02:00 callisto kernel: CPU: 5 UID: 1000 PID: 3928 
Comm: gnome-shell Not tainted 7.0.13+deb14-amd64 #1 PREEMPT(lazy)  Debian 7.0.13-1
2026-06-29T16:47:40.847842+02:00 callisto kernel: Hardware name: Dell Inc. 
Precision Tower 3420/02K9CR, BIOS 2.33.0 11/05/2024
2026-06-29T16:47:40.847873+02:00 callisto kernel: RIP: 
0010:nouveau_fence_sync+0x12c/0x1b0 [nouveau]
2026-06-29T16:47:40.847875+02:00 callisto kernel: Code: 74 08 48 3d 20 dd f2 c0 
75 aa e8 bf 94 d1 df 49 8b 76 50 48 85 f6 74 97 48 8b 85 f0 00 00 00 48 8b 96 f0 
00 00 00 48 8b 40 40 <48> 39 42 40 0f 85 7b ff ff ff 48 39 f5 74 17 49 8b 47 30 
48 89 ea16:47:40.847876+02:00 callisto kernel: RSP: 0018:ffffd1e710f6ba78 
EFLAGS: 00010286
2026-06-29T16:47:40.847878+02:00 callisto kernel: RDX: 0000000000000000 RSI: 
ffff89c7e22d2000 RDI: ffffd1e710f6ba90
2026-06-29T16:47:40.847878+02:00 callisto kernel: RBP: ffff89c86495b400 R08: 
ffff89c925b3b400 R09: 0000000000000000
2026-06-29T16:47:40.847882+02:00 callisto kernel: R10: 0000000000000193 R11: 
ffff89c86d286e50 R12: 0000000000000001
2026-06-29T16:47:40.847883+02:00 callisto kernel: R13: 0000000000000000 R14: 
ffff89c8b1108b40 R15: ffff89c853dc5100
2026-06-29T16:47:40.847883+02:00 callisto kernel: FS:  00007f3b083e7000(0000) 
GS:ffff89cb412bd000(0000) knlGS:0000000000000000
2026-06-29T16:47:40.847884+02:00 callisto kernel: CS:  0010 DS: 0000 ES: 0000 
CR0: 0000000080050033
2026-06-29T16:47:40.847884+02:00 callisto kernel: CR2: 0000000000000040 CR3: 
0000000164046002 CR4: 00000000003726f0
2026-06-29T16:47:40.847885+02:00 callisto kernel: Call Trace:
2026-06-29T16:47:40.847885+02:00 callisto kernel:  <TASK>
2026-06-29T16:47:40.847888+02:00 callisto kernel: 
nouveau_gem_ioctl_pushbuf+0x678/0x1390 [nouveau]
2026-06-29T16:47:40.847889+02:00 callisto kernel:  ? 
__pfx_nouveau_gem_ioctl_pushbuf+0x10/0x10 [nouveau]
2026-06-29T16:47:40.847889+02:00 callisto kernel:  drm_ioctl_kernel+0xae/0x100 [drm]
2026-06-29T16:47:40.847889+02:00 callisto kernel:  drm_ioctl+0x2a8/0x550 [drm]
2026-06-29T16:47:40.847890+02:00 callisto kernel:  ? 
__pfx_nouveau_gem_ioctl_pushbuf+0x10/0x10 [nouveau]
2026-06-29T16:47:40.847890+02:00 callisto kernel:  nouveau_drm_ioctl+0x58/0xc0 
[nouveau]
2026-06-29T16:47:40.847893+02:00 callisto kernel:  __x64_sys_ioctl+0x97/0xe0
2026-06-29T16:47:40.847894+02:00 callisto kernel:  do_syscall_64+0xcd/0x15f0
2026-06-29T16:47:40.847894+02:00 callisto kernel:  ? 
ktime_get_mono_fast_ns+0x35/0xe0
2026-06-29T16:47:40.847895+02:00 callisto kernel:  ? nouveau_drm_ioctl+0x89/0xc0 
[nouveau]
2026-06-29T16:47:40.847895+02:00 callisto kernel:  ? __x64_sys_ioctl+0xb1/0xe0
2026-06-29T16:47:40.847896+02:00 callisto kernel:  ? do_syscall_64+0x10a/0x15f0
2026-06-29T16:47:40.847896+02:00 callisto kernel:  ? hrtimer_interrupt+0x12c/0x230
2026-06-29T16:47:40.847898+02:00 callisto kernel:  ? irqentry_exit+0x78/0x680
2026-06-29T16:47:40.847899+02:00 callisto kernel:  ? 
__sysvec_apic_timer_interrupt+0x58/0x140
2026-06-29T16:47:40.847899+02:00 callisto kernel:  ? __irq_exit_rcu+0x3d/0xe0
2026-06-29T16:47:40.847900+02:00 callisto kernel: 
entry_SYSCALL_64_after_hwframe+0x76/0x7e
2026-06-29T16:47:40.847900+02:00 callisto kernel: RIP: 0033:0x7f3b0d519c3b
2026-06-29T16:47:40.847901+02:00 callisto kernel: Code: 00 48 89 44 24 18 31 c0 
48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 
b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 
28 00 002eae00 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
2026-06-29T16:47:40.847904+02:00 callisto kernel: RAX: ffffffffffffffda RBX: 
000055f76a802140 RCX: 00007f3b0d519c3b
2026-06-29T16:47:40.847905+02:00 callisto kernel: RDX: 00007ffd7c2eaec0 RSI: 
00000000c0406481 RDI: 000000000000000e
2026-06-29T16:47:40.847905+02:00 callisto kernel: RBP: 00007ffd7c2eaec0 R08: 
000055f76a80a020 R09: 0000000000000000
2026-06-29T16:47:40.847906+02:00 callisto kernel: R10: 0000000000000000 R11: 
0000000000000246 R12: 00000000c0406481
2026-06-29T16:47:40.847906+02:00 callisto kernel: R13: 000000000000000e R14: 
000055f76a449620 R15: 000055f76a80a028
2026-06-29T16:47:40.847909+02:00 callisto kernel:  </TASK>
2026-06-29T16:47:40.847910+02:00 callisto kernel: Modules linked in: 
cpufreq_conservative snd_seq_dummy snd_hrtimer snd_seq snd_seq_device 
xt_CHECKSUM xt_MASQUERADE xt_conntrack ipt_REJECT nf_reject_ipv4 xt_tcpudp 
nft_compat x_tables nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 
nf_defrag_ipv4 nf_tables nfnetlink bridge stp llc overlay qrtr sunrpc cfg80211 
rfkill nls_ascii nls_cp437 vfat fat intel_rapl_msr intel_rapl_common 
intel_uncore_frequency intel_uncore_frequency_common snd_ctl_led 
x86_pkg_temp_thermal intel_powerclamp coretemp platform_profile 
snd_hda_codec_alc269 kvm_intel snd_hda_codec_realtek_lib 
snd_hda_scodec_component mei_wdt mei_pxp mei_hdcp dell_smm_hwmon 
snd_hda_codec_generic dell_wmi dell_smbios kvm snd_hda_codec_nvhdmi dcdbas 
snd_soc_avs snd_hda_codec_hdmi irqbypass snd_soc_hda_codec dell_wmi_descriptor 
rapl wmi_bmof snd_hda_ext_core intel_wmi_thunderbolt sparse_keymap intel_cstate 
snd_soc_core intel_uncore pcspkr snd_hda_intel mei_me snd_compress snd_hda_codec 
ee1004 mei snd_pcm_dmaengine intel_pch_thermal snd_hda_coreommon usb_common 
efivarfs [last unloaded: cpufreq_conservative]4 17 49 8b 47 30 48 89 eaf6ba78 
EFLAGS: 00010286
2026-06-29T16:47:40.847927+02:00 callisto kernel: RAX: ffff89c7c0e28000 RBX: 
ffffd1e710f6ba90 RCX: ffff89c7c89f3180
2026-06-29T16:47:40.847927+02:00 callisto kernel: RDX: 0000000000000000 RSI: 
ffff89c7e22d2000 RDI: ffffd1e710f6ba90
2026-06-29T16:47:40.847928+02:00 callisto kernel: RBP: ffff89c86495b400 R08: 
ffff89c925b3b400 R09: 0000000000000000
2026-06-29T16:47:40.847928+02:00 callisto kernel: R10: 0000000000000193 R11: 
ffff89c86d286e50 R12: 0000000000000001
2026-06-29T16:47:40.847929+02:00 callisto kernel: R13: 0000000000000000 R14: 
ffff89c8b1108b40 R15: ffff89c853dc5100
2026-06-29T16:47:40.847929+02:00 callisto kernel: FS:  00007f3b083e7000(0000) 
GS:ffff89cb412bd000(0000) knlGS:0000000000000000
2026-06-29T16:47:40.847930+02:00 callisto kernel: CS:  0010 DS: 0000 ES: 0000 
CR0: 0000000080050033
2026-06-29T16:47:40.847931+02:00 callisto kernel: CR2: 0000000000000040 CR3: 
0000000164046002 CR4: 00000000003726f0
2026-06-29T16:47:40.847933+02:00 callisto kernel: note: gnome-shell[3928] exited 
with irqs disabled
```

I reported the bug to the Debian BTS as #1141813 (see:
ttps://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1141813) but I think this is
more relevant to come here and track it down directly with the maintainers.

Feel free to tell me if this is not relevant!

So, looking at the kernel Oops lead me to the function `nouveau_fence_sync()`:

```text
RIP: 0010:nouveau_fence_sync+0x12c/0x1b0 [nouveau]
```

The top of the stack trace being:

```text
nouveau_fence_sync+0x12c/0x1b0 [nouveau]
nouveau_gem_ioctl_pushbuf+0x678/0x1390 [nouveau]
? __pfx_nouveau_gem_ioctl_pushbuf+0x10/0x10 [nouveau]
drm_ioctl_kernel+0xae/0x100 [drm]
drm_ioctl+0x2a8/0x550 [drm]
... and so on
```

`nouveau_fence_sync()` is implemented in
`drivers/gpu/drm/nouveau/nouveau_fence.c` as follow:

```c
int
nouveau_fence_sync(struct nouveau_bo *nvbo, struct nouveau_channel *chan,
		   bool exclusive, bool intr)
{
	struct nouveau_fence_chan *fctx = chan->fence;
	struct dma_resv *resv = nvbo->bo.base.resv;
	int i, ret;

	ret = dma_resv_reserve_fences(resv, 1);
	if (ret)
		return ret;

	/* Waiting for the writes first causes performance regressions
	 * under some circumstances. So manually wait for the reads first.
	 */
	for (i = 0; i < 2; ++i) {
		struct dma_resv_iter cursor;
		struct dma_fence *fence;

		dma_resv_for_each_fence(&cursor, resv,
					dma_resv_usage_rw(exclusive),
					fence) {
			enum dma_resv_usage usage;
			struct nouveau_fence *f;

			usage = dma_resv_iter_usage(&cursor);
			if (i == 0 && usage == DMA_RESV_USAGE_WRITE)
				continue;

			f = nouveau_local_fence(fence, chan->cli->drm);
			if (f) {
				struct nouveau_channel *prev;
				bool must_wait = true;
				bool local;

				rcu_read_lock();
				prev = rcu_dereference(f->channel);
				local = prev && prev->cli->drm == chan->cli->drm;
				if (local && (prev == chan ||
					      fctx->sync(f, prev, chan) == 0))
					must_wait = false;
				rcu_read_unlock();
				if (!must_wait)
					continue;
			}

			ret = dma_fence_wait(fence, intr);
			if (ret)
				return ret;
		}
	}

	return 0;
}
```

Looking at the current executed code, we have:

```text
RIP: 0010:nouveau_fence_sync+0x12c/0x1b0 [nouveau]
Code: 74 08 48 3d 20 dd f2 c0 75 aa e8 bf 94 d1 df 49 8b 76 50 48 85 f6 74 97
       48 8b 85 f0 00 00 00 48 8b 96 f0 00 00 00 48 8b 40 40 <48> 39 42 40 0f
       85 7b ff ff ff 48 39 f5 74 17 49 8b 47 30 48 89 ea
```

Which can be decompiled (using `rasm2 -d "740848..."`) as:

```asm
je 0xa
cmp rax, 0xffffffffc0f2dd20
jne 0xffffffffffffffb4
call 0xffffffffdfd194ce
mov rsi, qword [r14 + 0x50]
test rsi, rsi
je 0xffffffffffffffaf
mov rax, qword [rbp + 0xf0]
mov rdx, qword [rsi + 0xf0]
mov rax, qword [rax + 0x40]
cmp qword [rdx + 0x40], rax
jne 0xffffffffffffffaf
cmp rbp, rsi
je 0x50
mov rax, qword [r15 + 0x30]
mov rdx, rbp
```

More precisely, if we try to locate the exact position in the code at crash
time:

```asm
mov  rsi, [r14+0x50]     ; rsi = rcu_dereference(f->channel)   → prev
test rsi, rsi
je   ...                 ; if (prev == NULL) skip
mov  rax, [rbp+0xf0]     ; rax = chan->cli        (rbp holds chan)
mov  rdx, [rsi+0xf0]     ; rdx = prev->cli
mov  rax, [rax+0x40]     ; rax = chan->cli->drm
cmp  [rdx+0x40], rax     ; <-- faults here: dereferences rdx+0x40
```

Which leads to the following lines of code:

```c
   rcu_read_lock();
   prev = rcu_dereference(f->channel);
   local = prev && prev->cli->drm == chan->cli->drm;
   if (local && (prev == chan ||
   	      fctx->sync(f, prev, chan) == 0))
     must_wait = false;
   rcu_read_unlock();
```

So, the problem occurs on:

```c
   local = prev && prev->cli->drm == chan->cli->drm;
```

`prev` is checked to be not NULL, but when the comparison occurs, we try to 
dereference `rdx+0x40` and `rdx` is obviously set to NULL:

```text
RSP: 0018:ffffd1e710f6ba78 EFLAGS: 00010286
RAX: ffff89c7c0e28000 RBX: ffffd1e710f6ba90 RCX: ffff89c7c89f3180
RDX: 0000000000000000 RSI: ffff89c7e22d2000 RDI: ffffd1e710f6ba90
RBP: ffff89c86495b400 R08: ffff89c925b3b400 R09: 0000000000000000
R10: 0000000000000193 R11: ffff89c86d286e50 R12: 0000000000000001
R13: 0000000000000000 R14: ffff89c8b1108b40 R15: ffff89c853dc5100
```

Which means that `prev->cli` is NULL (and shouldn't be).

If I understood it correctly, the `nouveau_fence_sync()` is here to synchronize
fences that are running on multiple GPU instances and to prevent synchronization
loss. This patch seems to have been introduced by Dave Airlie around December
2025 (see:
https://lists.freedesktop.org/archives/nouveau/2025-January/046268.html,
https://lists.freedesktop.org/archives/nouveau/2025-January/046291.html and
https://lists.freedesktop.org/archives/nouveau/2025-January/046293.html).

In my case, it seems that `prev` is still a valid address but `prev->cli` is
NULL despite the RCU read lock around this part of the code.

As far as I understand, this might mean that either the `prev` channel has been
partially cleared and then interrupted before complete destruction (which would
lead to an UAF). Or, this occurs at the creation of a new channel which is not
yet totally setup before being placed into the RCU read lock.

This lead us to try to patch the code, I first believe it would be simple to
just check if `prev->cli` is NULL and drop the channel if this is the case as
follow:

```c
-  local = prev && prev->cli->drm == chan->cli->drm;
+  local = prev && prev->cli && prev->cli->drm == chan->cli->drm;
```

But, if the problem occurs at channel creation, this might mean that we will
drop an unsynchronized fence (as far as I understand the code).

So, this bug might require more deeper thinking to be fixed and I do not have
the knowledge for that. I would be delighted to have your advice on this
problem.

Thanks in advance!

Regards
-- 
Emmanuel Fleury

Univ. de Bordeaux, LaBRI,   | Associate Professor,
351, Cours de la Libération | Email: emmanuel.fleury@u-bordeaux.fr
33405 Talence Cedex, France | Web: http://www.labri.fr/~fleury

