From: Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>
Subject: Re: Kernel oops with latest nouveau drm git
Date: Sun, 24 Oct 2010 14:39:52 +0200
Message-ID: <8762wrbw87.fsf@riseup.net>
References: <4CC26E4E.9050207@openelec.tv>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0672594543=="
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4CC26E4E.9050207-VFuFlIpLkl8z9h7fjEe8Mw@public.gmane.org> (Stephan Raue's message of "Sat,
	23 Oct 2010 07:10:38 +0200")
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stephan Raue <mailinglists-VFuFlIpLkl8z9h7fjEe8Mw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

--===============0672594543==
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha256; protocol="application/pgp-signature"

--==-=-=
Content-Type: multipart/mixed; boundary="=-=-="

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

Stephan Raue <mailinglists-VFuFlIpLkl8z9h7fjEe8Mw@public.gmane.org> writes:

>  Hi all,
>
> running a NV46 card with latest git from
> http://cgit.freedesktop.org/nouveau/linux-2.6/, mesa, libdrm and
> xf86-video-nouveau fails with an kernel oops. let me know if you need
> more informations.
>
> [   11.127274] BUG: unable to handle kernel NULL pointer dereference
> at 00000028
> [   11.127329] IP: [<b11c6ef1>] nouveau_gpuobj_new+0x26d/0x338

If your kernel was built with debug symbols you can use "gdb" to find
out the source line where it's crashing, like:
$ gdb nouveau.ko
(gdb) l *nouveau_gpuobj_new+0x26d

> [   11.127371] *pde = 00000000
> [   11.127391] Oops: 0000 [#1]
> [   11.127407] last sysfs file: /sys/devices/virtual/vc/vcsa1/uevent
> [   11.127438] Modules linked in: zram crystalhd
> [   11.127466]
> [   11.127481] Pid: 700, comm: xbmc.bin Not tainted 2.6.36-rc7 #1
> Mac-F4228DC8/AppleTV1,1
> [   11.127520] EIP: 0060:[<b11c6ef1>] EFLAGS: 00210286 CPU: 0
> [   11.127550] EIP is at nouveau_gpuobj_new+0x26d/0x338
> [   11.127576] EAX: b893e6c0 EBX: bee00000 ECX: 00000000 EDX: bfa68de0
> [   11.127606] ESI: bfab1600 EDI: 00000006 EBP: bf8e1000 ESP: bf98bd80
> [   11.127638]  DS: 007b ES: 007b FS: 0000 GS: 00e0 SS: 0068
> [   11.127666] Process xbmc.bin (pid: 700, ti=bf98a000 task=bc54c000
> task.ti=bf98a000)
> [   11.127699] Stack:
> [   11.127712]  bfab1600 b1064737 bfb926e0 0000c278 00000020 bfa68de0
> bf98be24 bf8e1000
> [   11.127763] <0> 00000000 00000000 b11c73f1 00000010 00000006
> bf98be24 bfab1600 bee00000
> [   11.127816] <0> 00000000 0000003d 00000000 bee00000 bfab1600
> bee00000 00000000 bf8e1000
> [   11.127871] Call Trace:
> [   11.127894]  [<b1064737>] ? alloc_file+0x6c/0x73
> [   11.127923]  [<b11c73f1>] ? nouveau_gpuobj_dma_new+0xf0/0x264
> [   11.127958]  [<b11c79e3>] ? nouveau_gpuobj_channel_init+0x39d/0x512
> [   11.127996]  [<b11c4c2c>] ? nouveau_channel_alloc+0x31c/0x4f9
> [   11.128029]  [<b11c4e57>] ? nouveau_ioctl_fifo_alloc+0x4e/0xf1
> [   11.128064]  [<b1151461>] ? _copy_from_user+0x2a/0x4d
> [   11.128094]  [<b11b155d>] ? drm_ioctl+0x240/0x2f6
> [   11.128122]  [<b11c4e09>] ? nouveau_ioctl_fifo_alloc+0x0/0xf1
> [   11.128158]  [<b1055767>] ? handle_mm_fault+0x44a/0x490
> [   11.128188]  [<b11b131d>] ? drm_ioctl+0x0/0x2f6
> [   11.128215]  [<b106d7a4>] ? do_vfs_ioctl+0x48f/0x4c8
> [   11.128247]  [<b101364c>] ? do_page_fault+0x2a7/0x2bf
> [   11.128277]  [<b1013634>] ? do_page_fault+0x28f/0x2bf
> [   11.128308]  [<b1017111>] ? update_curr.clone.113+0x68/0x8b
> [   11.128339]  [<b1063d57>] ? vfs_read+0x93/0xe8
> [   11.128366]  [<b106d80a>] ? sys_ioctl+0x2d/0x47
> [   11.128394]  [<b1002497>] ? sysenter_do_call+0x12/0x26
> [   11.128420] Code: 89 e8 ff 93 1c 05 00 00 85 c0 89 c6 0f 84 d7 00
> 00 00 8d 54 24 14 31 c0 e8 a6 f7 ff ff e9 bd 00 00 00 8b 34 24 8b 8e
> b0 00 00 00 <8b> 49 28 83 f9 ff 89 4a 28 74 06 03 48 14 89 4a 28 83 7b
> 04 4f
> [   11.128637] EIP: [<b11c6ef1>] nouveau_gpuobj_new+0x26d/0x338 SS:ESP
> 0068:bf98bd80
> [   11.128679] CR2: 0000000000000028
> [   11.136797] ---[ end trace c78ebcc9857021e1 ]---
>
> greetings
>
> Stephan

--=-=-=--

--==-=-=
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iF4EAREIAAYFAkzEKRkACgkQg5k4nX1Sv1sTpQD+LlNDjoKDsSI7dO1U3qAQIgMl
pEDpRx/HagFjTUCIgEcA/iidckDWldlQAEUeki1UwXLx4tdEoNm4jK9orFuNQOQd
=xh8n
-----END PGP SIGNATURE-----
--==-=-=--

--===============0672594543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0672594543==--
