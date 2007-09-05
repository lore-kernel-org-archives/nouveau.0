From: Bernhard Kaindl <bk-l3A5Bk7waGM@public.gmane.org>
Subject: Xvideo blitter with randr12 enabled
Date: Wed, 5 Sep 2007 18:11:01 +0200 (CEST)
Message-ID: <alpine.LNX.0.9999-openSUSE-5.0709051715010.24186@jbgna.fhfr.qr>
References: <alpine.LNX.0.999-openSUSE-1.0709031945560.22918@jbgna.fhfr.qr>
	<6d4bc9fc0709041143x2bb2b5e1lb5e74183de81975f@mail.gmail.com>
	<20070904211539.b46ae32d.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709042248510.8889@jbgna.fhfr.qr>
	<20070904231611.9363b0d0.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709042333450.19641@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050114480.25400@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050142010.25400@jbgna.fhfr.qr>
	<alpine.LNX.0.999-openSUSE-1.0709050203240.25400@jbgna.fhfr.qr>
	<20070905024520.d5c28cb8.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709050256200.25400@jbgna.fhfr.qr>
	<20070905032343.c6b0989e.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709050352050.29379@jbgna.fhfr.qr>
	<20070905115247.91d1ad03.arthur.huillet@free.fr>
	<alpine.LNX.0.999-openSUSE-1.0709051212550.21447@jbgna.fhfr.qr>
	<20070905171148.996b0c44.arthur.huillet@free.fr>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED;
	BOUNDARY="168427776-1707732284-1189008662=:24186"
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20070905171148.996b0c44.arthur.huillet-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Arthur Huillet <arthur.huillet-GANU6spQydw@public.gmane.org>
List-Id: nouveau.vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--168427776-1707732284-1189008662=:24186
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

Arthur asked me for my status of the blitter with randr12:

The blitter works for me with the Option Randr12 (master branch) enabled as
long as I do not change the startup layout of nouveau which currently always
cloned display on the second monitor to a side-by-side layout with this

xrandr --output Digital-0 --left-of Digital-1

or this

xrandr --output Digital-1 --pos 1680x1050

command (both have visually the same effect)

After I run these commands, the blitter causes a crash, which I hope we can debug.

when I have mplayer running when I run the xrandr to move Digital-1 to the
right of Digital-0, the blitter keeps running but the montiors go into sleep
mode when I quit mplayer. X still keeps running, the last messages are:

writting vpll 00021B05
writting vpll2 00021B05
output 1 debug_0 01101191
savep->dither 00060000
1: crtc 1 output1: 0100: twocrt 0 twomon 1
output 0 debug_0 01101191
savep->dither 000B0000
1: crtc 0 output0: 0000: twocrt 0 twomon 1
output 1 debug_0 01101191
savep->dither 00060000
1: crtc 1 output1: 0100: twocrt 0 twomon 1

and attaching to X with gdb X `pidof X` gives:

(gdb) bt
#0  0x00002b6b3cde7ea3 in select () from /lib64/libc.so.6
#1  0x000000000056a99a in WaitForSomething (pClientsReady=0x7fff6f10fe80)
     at WaitFor.c:239
#2  0x0000000000450c7a in Dispatch () at dispatch.c:383
#3  0x0000000000439a15 in main (argc=6, argv=0x7fff6f110428,
     envp=<value optimized out>) at main.c:445

I emtied the dmesg buffer with dmesg -c before quitting mplayer but it
does not show new drm debug messages at this point.

I get some messages which might give a clue when starting mplayer after getting
the monitors side by side)

chvt 1 and chvt 7 (back to X) still work, but the chvt 7 does not restore
the X display properly, it seems that the LockUnlock things on console
witch are not working right yet. This reproduces without mplayer ever
started, so that's another thing which I can look at.

When I put the monitors side-by-side before starting mplayer, I get these logs:

(EE) NOUVEAU(0): Notifier (0xd8000003) timeout!
(II) NOUVEAU(0): Fifo dump (lockup 0x164c,0x164c):
(II) NOUVEAU(0): [0x1638] 0x0801d000
(II) NOUVEAU(0): [0x1639] 0x00000000
(II) NOUVEAU(0): [0x163a] 0x000482fc
(II) NOUVEAU(0): [0x163b] 0x00000003
(II) NOUVEAU(0): [0x163c] 0x00100300
(II) NOUVEAU(0): [0x163d] 0x0000000b
(II) NOUVEAU(0): [0x163e] 0x34803480
(II) NOUVEAU(0): [0x163f] 0x00008000
(II) NOUVEAU(0): [0x1640] 0x00008000
(II) NOUVEAU(0): [0x1641] 0x00048300
(II) NOUVEAU(0): [0x1642] 0x00000003
(II) NOUVEAU(0): [0x1643] 0x000483fc
(II) NOUVEAU(0): [0x1644] 0x00000000
(II) NOUVEAU(0): [0x1645] 0x00088400
(II) NOUVEAU(0): [0x1646] 0x02d102d3
(II) NOUVEAU(0): [0x1647] 0x00060003
(II) NOUVEAU(0): [0x1648] 0x00042104
(II) NOUVEAU(0): [0x1649] 0x00000000
(II) NOUVEAU(0): [0x164a] 0x00042100
(II) NOUVEAU(0): [0x164b] 0x00000000
(II) NOUVEAU(0): [0x164c] 0xd8000001
(II) NOUVEAU(0): [0x164d] 0x0020c30c
(II) NOUVEAU(0): [0x164e] 0x00001000
(II) NOUVEAU(0): [0x164f] 0x00d90d06
(II) NOUVEAU(0): [0x1650] 0x00000004
(II) NOUVEAU(0): [0x1651] 0x00000040
(II) NOUVEAU(0): [0x1652] 0x00000004
(II) NOUVEAU(0): [0x1653] 0x00000002
(II) NOUVEAU(0): [0x1654] 0x00000101
(II) NOUVEAU(0): [0x1655] 0x00000000
(II) NOUVEAU(0): End of fifo dump

Fatal server error:
DMA queue hang: dmaPut=164c, current=164c, status=4041

As Arthur told me that those do not tell anything, here are the drm debug messages:

I should also mention that the two montors go black immedately, then
I hear the sound of the video, and then the sound stops and the X
displays return to text mode with the crash.

That's the printks which I capture with dmesg from start of mplayer
until X starting to crash:

[drm:drm_unlocked_ioctl] pid=17689, cmd=0xc0206448, nr=0x48, dev 0xe200, auth=1
[drm:drm_addmap_core] offset = 0xc801d000, size = 0x00066000, type = 0
[drm:nouveau_mem_alloc] allocated 0x801d000 type=0x00000101
[drm:drm_mmap_locked] start = 0x2b6b5e459000, end = 0x2b6b5e4bf000, page offset = 0xc801d
[drm:drm_mmap_locked]    Type = 0; start = 0x2b6b5e459000, end = 0x2b6b5e4bf000, offset = 0xc801d000
[drm:drm_vm_open_locked] 0x2b6b5e459000,0x00066000
[drm:drm_unlocked_ioctl] pid=17689, cmd=0xc0206448, nr=0x48, dev 0xe200, auth=1
[drm:drm_addmap_core] offset = 0x003ca000, size = 0x00066000, type = 4
[drm:nouveau_mem_alloc] allocated 0x3ca000 type=0x00000110
[drm:drm_mmap_locked] start = 0x2b6b5e4bf000, end = 0x2b6b5e525000, page offset = 0x1f001
[drm:drm_vm_open_locked] 0x2b6b5e4bf000,0x00066000
[drm:drm_unlocked_ioctl] pid=17689, cmd=0xc0206448, nr=0x48, dev 0xe200, auth=1
[drm:drm_addmap_core] offset = 0x00430000, size = 0x00066000, type = 4
[drm:nouveau_mem_alloc] allocated 0x430000 type=0x00000110
[drm:drm_mmap_locked] start = 0x2b6b5e525000, end = 0x2b6b5e58b000, page offset = 0x1f002
[drm:drm_vm_open_locked] 0x2b6b5e525000,0x00066000
[drm:drm_unlocked_ioctl] pid=17689, cmd=0xc0106446, nr=0x46, dev 0xe200, auth=1
[drm:nouveau_gpuobj_dma_new] ch1 class=0x003d offset=0x3c9020 size=0x20
[drm:nouveau_gpuobj_dma_new] access=0 target=8
[drm:nouveau_gpuobj_new] ch1 size=16 align=16 flags=0x00000006
[drm:nouveau_gpuobj_new] gpuobj ffff810064bb3a40
[drm:nouveau_gpuobj_new] global heap fallback
[drm:nouveau_gpuobj_dma_new] Creating PCI DMA object using virtual zone starting at 0x3c9020, size 32
[drm:nouveau_gpuobj_ref_add] ch1 h=0xe8000000 gpuobj=ffff810064bb3a40
[drm:nouveau_ramht_hash_handle] ch1 handle=0xe8000000
[drm:nouveau_ramht_hash_handle] hash=0x000001e8
[drm:nouveau_ramht_insert] insert ch1 0x000001e8: h=0xe8000000, c=0x00807d8f
[drm:drm_do_vm_sg_nopage]
(this last line is repeated 101 times)

Here is a second try:

[drm:drm_unlocked_ioctl] pid=17904, cmd=0xc0206448, nr=0x48, dev 0xe200, auth=1
[drm:drm_addmap_core] offset = 0xc801d000, size = 0x00066000, type = 0
[drm:nouveau_mem_alloc] allocated 0x801d000 type=0x00000101
[drm:drm_mmap_locked] start = 0x2b5053a30000, end = 0x2b5053a96000, page offset = 0xc801d
[drm:drm_mmap_locked]    Type = 0; start = 0x2b5053a30000, end = 0x2b5053a96000, offset = 0xc801d000
[drm:drm_vm_open_locked] 0x2b5053a30000,0x00066000
[drm:drm_unlocked_ioctl] pid=17904, cmd=0xc0206448, nr=0x48, dev 0xe200, auth=1
[drm:drm_addmap_core] offset = 0x003ca000, size = 0x00066000, type = 4
[drm:nouveau_mem_alloc] allocated 0x3ca000 type=0x00000110
[drm:drm_mmap_locked] start = 0x2b5053a96000, end = 0x2b5053afc000, page offset = 0x1f001
[drm:drm_vm_open_locked] 0x2b5053a96000,0x00066000
[drm:drm_unlocked_ioctl] pid=17904, cmd=0xc0206448, nr=0x48, dev 0xe200, auth=1
[drm:drm_addmap_core] offset = 0x00430000, size = 0x00066000, type = 4
[drm:nouveau_mem_alloc] allocated 0x430000 type=0x00000110
[drm:drm_mmap_locked] start = 0x2b5053afc000, end = 0x2b5053b62000, page offset = 0x1f002
[drm:drm_vm_open_locked] 0x2b5053afc000,0x00066000
[drm:drm_do_vm_sg_nopage]
(also repeated 101 times)

I pressesd dmesg -c >outfile at the time about 2-3 seconds after I started
mplayer, at the same time I pressed return, sound ended and the text mode
restoration was done. I attached the remaining final messages after these 2-3
seconds.

Bernhard

PS: DPMS also does not bring the display back when I after I have put
the mointors side by side with xrandr. For me this DPMS issue could
be easyer to debug, I hope, but first I would like to get the console
switch working as it should and as I had it with my patch to the randr
branch.
--168427776-1707732284-1189008662=:24186
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=dmesg.Randr12.2.startmplayer.crash
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LNX.0.9999-openSUSE-5.0709051811011.24186-aORvohZ8rX8NvFgr0RP9cw@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=dmesg.Randr12.2.startmplayer.crash

W2RybTpkcm1fdm1fc2htX2Nsb3NlXSAweDJiNTA0NzhmZDAwMCwweDAwMDAy
MDAwDQpbZHJtOmRybV92bV9jbG9zZV0gMHgyYjUwNDk0YzQwMDAsMHgwODAw
MDAwMA0KW2RybTpkcm1fdm1fY2xvc2VdIDB4MmI1MDUxNGM0MDAwLDB4MDAz
YzAwMDANCltkcm06ZHJtX3ZtX2Nsb3NlXSAweDJiNTA1MTg4NDAwMCwweDAw
MDEwMDAwDQpbZHJtOmRybV92bV9jbG9zZV0gMHgyYjUwNTE4OTQwMDAsMHgw
MDAwNDAwMA0KW2RybTpkcm1fdm1fY2xvc2VdIDB4MmI1MDUxODk4MDAwLDB4
MDAwMDgwMDANCltkcm06ZHJtX3ZtX2Nsb3NlXSAweDJiNTA1MThhMDAwMCww
eDAwMDEwMDAwDQpbZHJtOmRybV92bV9jbG9zZV0gMHgyYjUwNTE4YjAwMDAs
MHgwMDAwMTAwMA0KW2RybTpkcm1fdm1fY2xvc2VdIDB4MmI1MDUxZjBhMDAw
LDB4MDAwMDEwMDANCltkcm06ZHJtX3ZtX2Nsb3NlXSAweDJiNTA1M2EzMDAw
MCwweDAwMDY2MDAwDQpbZHJtOmRybV92bV9jbG9zZV0gMHgyYjUwNTNhOTYw
MDAsMHgwMDA2NjAwMA0KW2RybTpkcm1fdm1fY2xvc2VdIDB4MmI1MDUzYWZj
MDAwLDB4MDAwNjYwMDANCltkcm06ZHJtX3JlbGVhc2VdIG9wZW5fY291bnQg
PSAxDQpbZHJtOm5vdXZlYXVfZmlmb19jbGVhbnVwXSBjbGVhcmluZyBGSUZP
IGVuYWJsZXMgZnJvbSBmaWxlX3ByaXYNCltkcm1dIG5vdXZlYXVfZmlmb19m
cmVlOiBmcmVlaW5nIGZpZm8gMQ0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZf
ZGVsXSByZWYgZmZmZjgxMDA0OTIxNzJjMA0KW2RybTpub3V2ZWF1X2dwdW9i
al9kZWxdIGdwdW9iaiBmZmZmODEwMDc1MGM4M2MwDQpbZHJtOm5vdXZlYXVf
Z3B1b2JqX3JlZl9kZWxdIHJlZiBmZmZmODEwMDZlM2NmMjgwDQpbZHJtOm5v
dXZlYXVfZ3B1b2JqX2RlbF0gZ3B1b2JqIGZmZmY4MTAwNzI0NWRlYzANCltk
cm06bm91dmVhdV9ncHVvYmpfcmVmX2RlbF0gcmVmIGZmZmY4MTAwNjcyMGM5
YzANCltkcm06bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgxMDA3
NTBjODhjMA0KW2RybTpub3V2ZWF1X21lbV9mcmVlXSBmcmVlaW5nIDB4M2Mx
MDAwIHR5cGU9MHgwMDAwMDExMA0KW2RybTpub3V2ZWF1X2dwdW9ial9jaGFu
bmVsX3Rha2Vkb3duXSBjaDENCltkcm06bm91dmVhdV9ncHVvYmpfcmVmX2Rl
bF0gcmVmIGZmZmY4MTAwNTQ2N2U4NDANCltkcm06bm91dmVhdV9yYW1odF9o
YXNoX2hhbmRsZV0gY2gxIGhhbmRsZT0weGQ4MDAwMDAxDQpbZHJtOm5vdXZl
YXVfcmFtaHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgwMDAwMDFkMA0KW2RybTpu
b3V2ZWF1X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNoMSAweDAwMDAwMWQwOiBo
PTB4ZDgwMDAwMDEsIGM9MHgwMDAwMDAwMA0KW2RybTpub3V2ZWF1X2dwdW9i
al9kZWxdIGdwdW9iaiBmZmZmODEwMDcyNDVkMWMwDQpbZHJtOm5vdXZlYXVf
Z3B1b2JqX3JlZl9kZWxdIHJlZiBmZmZmODEwMDNiOTA5N2MwDQpbZHJtOm5v
dXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGNoMSBoYW5kbGU9MHhkODAwMDAw
Mg0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBoYXNoPTB4MDAw
MDAxYzgNCltkcm06bm91dmVhdV9yYW1odF9yZW1vdmVdIHJlbW92ZSBjaDEg
MHgwMDAwMDFjODogaD0weGQ4MDAwMDAyLCBjPTB4MDAwMDAwMDANCltkcm06
bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgxMDA3NTBjODQ0MA0K
W2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYgZmZmZjgxMDAzMjBj
YmM4MA0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBjaDEgaGFu
ZGxlPTB4MDAwMDAwMDANCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hhbmRs
ZV0gaGFzaD0weDAwMDAwMTAwDQpbZHJtOm5vdXZlYXVfcmFtaHRfcmVtb3Zl
XSByZW1vdmUgY2gxIDB4MDAwMDAxMDA6IGg9MHgwMDAwMDAwMCwgYz0weDAw
MDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0gZ3B1b2JqIGZmZmY4
MTAwNzUwYzgxNDANCltkcm06bm91dmVhdV9ncHVvYmpfcmVmX2RlbF0gcmVm
IGZmZmY4MTAwM2I5MDlmNDANCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hh
bmRsZV0gY2gxIGhhbmRsZT0weGQ4MDAwMDAzDQpbZHJtOm5vdXZlYXVfcmFt
aHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgwMDAwMDFjMA0KW2RybTpub3V2ZWF1
X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNoMSAweDAwMDAwMWMwOiBoPTB4ZDgw
MDAwMDMsIGM9MHgwMDAwMDAwMA0KW2RybTpub3V2ZWF1X2dwdW9ial9kZWxd
IGdwdW9iaiBmZmZmODEwMDM3ZmI2MjQwDQpbZHJtOm5vdXZlYXVfbm90aWZp
ZXJfZ3B1b2JqX2R0b3JdIA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVs
XSByZWYgZmZmZjgxMDAzZWZhMzVjMA0KW2RybTpub3V2ZWF1X3JhbWh0X2hh
c2hfaGFuZGxlXSBjaDEgaGFuZGxlPTB4ODAwMDAwMTANCltkcm06bm91dmVh
dV9yYW1odF9oYXNoX2hhbmRsZV0gaGFzaD0weDAwMDAwMTAwDQpbZHJtOm5v
dXZlYXVfcmFtaHRfcmVtb3ZlXSByZW1vdmUgY2gxIDB4MDAwMDAxMDg6IGg9
MHg4MDAwMDAxMCwgYz0weDAwMDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1b2Jq
X2RlbF0gZ3B1b2JqIGZmZmY4MTAwNzI0NWRjYzANCltkcm06bm91dmVhdV9n
cHVvYmpfcmVmX2RlbF0gcmVmIGZmZmY4MTAwNGJjODM5YzANCltkcm06bm91
dmVhdV9yYW1odF9oYXNoX2hhbmRsZV0gY2gxIGhhbmRsZT0weDgwMDAwMDFi
DQpbZHJtOm5vdXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgwMDAw
MDE1OA0KW2RybTpub3V2ZWF1X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNoMSAw
eDAwMDAwMTU4OiBoPTB4ODAwMDAwMWIsIGM9MHgwMDAwMDAwMA0KW2RybTpu
b3V2ZWF1X2dwdW9ial9kZWxdIGdwdW9iaiBmZmZmODEwMDcyNDVkOTQwDQpb
ZHJtOm5vdXZlYXVfZ3B1b2JqX3JlZl9kZWxdIHJlZiBmZmZmODEwMDRiYzgz
ZTQwDQpbZHJtOm5vdXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGNoMSBoYW5k
bGU9MHg4MDAwMDAxYw0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxl
XSBoYXNoPTB4MDAwMDAxNjANCltkcm06bm91dmVhdV9yYW1odF9yZW1vdmVd
IHJlbW92ZSBjaDEgMHgwMDAwMDE2MDogaD0weDgwMDAwMDFjLCBjPTB4MDAw
MDAwMDANCltkcm06bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgx
MDA3MjQ1ZDhjMA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYg
ZmZmZjgxMDA2NDUzMDg0MA0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFu
ZGxlXSBjaDEgaGFuZGxlPTB4ODAwMDAwMTINCltkcm06bm91dmVhdV9yYW1o
dF9oYXNoX2hhbmRsZV0gaGFzaD0weDAwMDAwMTEwDQpbZHJtOm5vdXZlYXVf
cmFtaHRfcmVtb3ZlXSByZW1vdmUgY2gxIDB4MDAwMDAxMTA6IGg9MHg4MDAw
MDAxMiwgYz0weDAwMDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0g
Z3B1b2JqIGZmZmY4MTAwNzUwYzg5NDANCltkcm06bm91dmVhdV9ncHVvYmpf
cmVmX2RlbF0gcmVmIGZmZmY4MTAwNDI5YmYxODANCltkcm06bm91dmVhdV9y
YW1odF9oYXNoX2hhbmRsZV0gY2gxIGhhbmRsZT0weDgwMDAwMDExDQpbZHJt
Om5vdXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgwMDAwMDEwOA0K
W2RybTpub3V2ZWF1X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNoMSAweDAwMDAw
MTE4OiBoPTB4ODAwMDAwMTEsIGM9MHgwMDAwMDAwMA0KW2RybTpub3V2ZWF1
X2dwdW9ial9kZWxdIGdwdW9iaiBmZmZmODEwMDc1MGM4YWMwDQpbZHJtOm5v
dXZlYXVfZ3B1b2JqX3JlZl9kZWxdIHJlZiBmZmZmODEwMDNiOTA5OGMwDQpb
ZHJtOm5vdXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGNoMSBoYW5kbGU9MHg4
MDAwMDAxNg0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBoYXNo
PTB4MDAwMDAxMzANCltkcm06bm91dmVhdV9yYW1odF9yZW1vdmVdIHJlbW92
ZSBjaDEgMHgwMDAwMDEzMDogaD0weDgwMDAwMDE2LCBjPTB4MDAwMDAwMDAN
Cltkcm06bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgxMDA3NTBj
OGE0MA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYgZmZmZjgx
MDA3NWQ4ZTY4MA0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBj
aDEgaGFuZGxlPTB4ODAwMDAwMTUNCltkcm06bm91dmVhdV9yYW1odF9oYXNo
X2hhbmRsZV0gaGFzaD0weDAwMDAwMTI4DQpbZHJtOm5vdXZlYXVfcmFtaHRf
cmVtb3ZlXSByZW1vdmUgY2gxIDB4MDAwMDAxMjg6IGg9MHg4MDAwMDAxNSwg
Yz0weDAwMDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0gZ3B1b2Jq
IGZmZmY4MTAwNzUwYzg4NDANCltkcm06bm91dmVhdV9ncHVvYmpfcmVmX2Rl
bF0gcmVmIGZmZmY4MTAwNzkxYTg5MDANCltkcm06bm91dmVhdV9yYW1odF9o
YXNoX2hhbmRsZV0gY2gxIGhhbmRsZT0weDgwMDAwMDE3DQpbZHJtOm5vdXZl
YXVfcmFtaHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgwMDAwMDEzOA0KW2RybTpu
b3V2ZWF1X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNoMSAweDAwMDAwMTM4OiBo
PTB4ODAwMDAwMTcsIGM9MHgwMDAwMDAwMA0KW2RybTpub3V2ZWF1X2dwdW9i
al9kZWxdIGdwdW9iaiBmZmZmODEwMDc1MGM4MWMwDQpbZHJtOm5vdXZlYXVf
Z3B1b2JqX3JlZl9kZWxdIHJlZiBmZmZmODEwMDdhYTdlNzQwDQpbZHJtOm5v
dXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGNoMSBoYW5kbGU9MHg4MDAwMDAx
Mw0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBoYXNoPTB4MDAw
MDAxMTgNCltkcm06bm91dmVhdV9yYW1odF9yZW1vdmVdIHJlbW92ZSBjaDEg
MHgwMDAwMDEyMDogaD0weDgwMDAwMDEzLCBjPTB4MDAwMDAwMDANCltkcm06
bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgxMDA3YjhlODc0MA0K
W2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYgZmZmZjgxMDAzMjBj
YjZjMA0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBjaDEgaGFu
ZGxlPTB4ODAwMDAwMTQNCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hhbmRs
ZV0gaGFzaD0weDAwMDAwMTIwDQpbZHJtOm5vdXZlYXVfcmFtaHRfcmVtb3Zl
XSByZW1vdmUgY2gxIDB4MDAwMDAxNDA6IGg9MHg4MDAwMDAxNCwgYz0weDAw
MDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0gZ3B1b2JqIGZmZmY4
MTAwNzc2NDgxNDANCltkcm06bm91dmVhdV9ncHVvYmpfcmVmX2RlbF0gcmVm
IGZmZmY4MTAwM2I5MDliODANCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hh
bmRsZV0gY2gxIGhhbmRsZT0weDgwMDAwMDFhDQpbZHJtOm5vdXZlYXVfcmFt
aHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgwMDAwMDE1MA0KW2RybTpub3V2ZWF1
X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNoMSAweDAwMDAwMTUwOiBoPTB4ODAw
MDAwMWEsIGM9MHgwMDAwMDAwMA0KW2RybTpub3V2ZWF1X2dwdW9ial9kZWxd
IGdwdW9iaiBmZmZmODEwMDc3NjQ4OGMwDQpbZHJtOm5vdXZlYXVfZ3B1b2Jq
X3JlZl9kZWxdIHJlZiBmZmZmODEwMDU0ZWM4ZjQwDQpbZHJtOm5vdXZlYXVf
cmFtaHRfaGFzaF9oYW5kbGVdIGNoMSBoYW5kbGU9MHg4MDAwMDAxOA0KW2Ry
bTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBoYXNoPTB4MDAwMDAxNDAN
Cltkcm06bm91dmVhdV9yYW1odF9yZW1vdmVdIHJlbW92ZSBjaDEgMHgwMDAw
MDE0ODogaD0weDgwMDAwMDE4LCBjPTB4MDAwMDAwMDANCltkcm06bm91dmVh
dV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgxMDA3NzY0ODFjMA0KW2RybTpu
b3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYgZmZmZjgxMDAzYjkwOWU4MA0K
W2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBjaDEgaGFuZGxlPTB4
ODAwMDAwMTkNCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hhbmRsZV0gaGFz
aD0weDAwMDAwMTQ4DQpbZHJtOm5vdXZlYXVfcmFtaHRfcmVtb3ZlXSByZW1v
dmUgY2gxIDB4MDAwMDAxNjg6IGg9MHg4MDAwMDAxOSwgYz0weDAwMDAwMDAw
DQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0gZ3B1b2JqIGZmZmY4MTAwNzc2
NDhlNDANCltkcm06bm91dmVhdV9ncHVvYmpfcmVmX2RlbF0gcmVmIGZmZmY4
MTAwNGJjODM4MDANCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hhbmRsZV0g
Y2gxIGhhbmRsZT0weGU4MDAwMDAwDQpbZHJtOm5vdXZlYXVfcmFtaHRfaGFz
aF9oYW5kbGVdIGhhc2g9MHgwMDAwMDFlOA0KW2RybTpub3V2ZWF1X3JhbWh0
X3JlbW92ZV0gcmVtb3ZlIGNoMSAweDAwMDAwMWU4OiBoPTB4ZTgwMDAwMDAs
IGM9MHgwMDAwMDAwMA0KW2RybTpub3V2ZWF1X2dwdW9ial9kZWxdIGdwdW9i
aiBmZmZmODEwMDU5NzdjNDQwDQpbZHJtOm5vdXZlYXVfbm90aWZpZXJfZ3B1
b2JqX2R0b3JdIA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYg
ZmZmZjgxMDA0YmM4M2QwMA0KW2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFu
ZGxlXSBjaDEgaGFuZGxlPTB4ZTgwMDAwMDENCltkcm06bm91dmVhdV9yYW1o
dF9oYXNoX2hhbmRsZV0gaGFzaD0weDAwMDAwMWUwDQpbZHJtOm5vdXZlYXVf
cmFtaHRfcmVtb3ZlXSByZW1vdmUgY2gxIDB4MDAwMDAxZTA6IGg9MHhlODAw
MDAwMSwgYz0weDAwMDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0g
Z3B1b2JqIGZmZmY4MTAwNTk3N2NjYzANCltkcm06bm91dmVhdV9ub3RpZmll
cl9ncHVvYmpfZHRvcl0gDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX3JlZl9kZWxd
IHJlZiBmZmZmODEwMDRhMjg4YzAwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2Rl
bF0gZ3B1b2JqIDAwMDAwMDAwMDAwMDAwMDANCltkcm06bm91dmVhdV9ncHVv
YmpfcmVmX2RlbF0gcmVmIDAwMDAwMDAwMDAwMDAwMDANCltkcm06bm91dmVh
dV9tZW1fZnJlZV0gZnJlZWluZyAweDNjOTAwMCB0eXBlPTB4MDAwMDAxMTAN
Cltkcm06ZHJtX3JlbGVhc2VdIHBpZCA9IDE3OTA0LCBkZXZpY2UgPSAweGUy
MDAsIG9wZW5fY291bnQgPSAxDQpbZHJtOmRybV9yZWxlYXNlXSBGaWxlIGZm
ZmY4MTAwNWQwNGY0YzAgcmVsZWFzZWQsIGZyZWVpbmcgbG9jayBmb3IgY29u
dGV4dCAxDQpbZHJtOmRybV9mYXN5bmNdIGZkID0gLTEsIGRldmljZSA9IDB4
ZTIwMA0KW2RybTpkcm1fbGFzdGNsb3NlXSANCltkcm06bm91dmVhdV9jYXJk
X3Rha2Vkb3duXSBwcmV2IHN0YXRlID0gMQ0KW2RybTpub3V2ZWF1X2RtYV9j
aGFubmVsX3Rha2Vkb3duXSANCltkcm1dIG5vdXZlYXVfZmlmb19mcmVlOiBm
cmVlaW5nIGZpZm8gMA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVsXSBy
ZWYgZmZmZjgxMDAzZWZhMzJjMA0KW2RybTpub3V2ZWF1X2dwdW9ial9kZWxd
IGdwdW9iaiBmZmZmODEwMDc1MGM4NTQwDQpbZHJtOm5vdXZlYXVfZ3B1b2Jq
X3JlZl9kZWxdIHJlZiBmZmZmODEwMDViOTliMmMwDQpbZHJtOm5vdXZlYXVf
Z3B1b2JqX2RlbF0gZ3B1b2JqIGZmZmY4MTAwNzUwYzgzNDANCltkcm06bm91
dmVhdV9ncHVvYmpfcmVmX2RlbF0gcmVmIGZmZmY4MTAwNzQzZjVjNDANCltk
cm06bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmogZmZmZjgxMDA3NTBjOGVj
MA0KW2RybTpub3V2ZWF1X21lbV9mcmVlXSBmcmVlaW5nIDB4MCB0eXBlPTB4
MDAwMDAxMDENCltkcm06bm91dmVhdV9ncHVvYmpfY2hhbm5lbF90YWtlZG93
bl0gY2gwDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX3JlZl9kZWxdIHJlZiBmZmZm
ODEwMDZhZmQzNjgwDQpbZHJtOm5vdXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVd
IGNoMCBoYW5kbGU9MHg4MDAzZDAwMQ0KW2RybTpub3V2ZWF1X3JhbWh0X2hh
c2hfaGFuZGxlXSBoYXNoPTB4MDAwMDBmYzgNCltkcm06bm91dmVhdV9yYW1o
dF9yZW1vdmVdIHJlbW92ZSBjaDAgMHgwMDAwMGZjODogaD0weDgwMDNkMDAx
LCBjPTB4MDAwMDAwMDANCltkcm06bm91dmVhdV9ncHVvYmpfZGVsXSBncHVv
YmogZmZmZjgxMDA3MjQ1ZDc0MA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZf
ZGVsXSByZWYgZmZmZjgxMDA3MDhmYmM4MA0KW2RybTpub3V2ZWF1X3JhbWh0
X2hhc2hfaGFuZGxlXSBjaDAgaGFuZGxlPTB4ODAwM2QwMDINCltkcm06bm91
dmVhdV9yYW1odF9oYXNoX2hhbmRsZV0gaGFzaD0weDAwMDAwZmQwDQpbZHJt
Om5vdXZlYXVfcmFtaHRfcmVtb3ZlXSByZW1vdmUgY2gwIDB4MDAwMDBmZDA6
IGg9MHg4MDAzZDAwMiwgYz0weDAwMDAwMDAwDQpbZHJtOm5vdXZlYXVfZ3B1
b2JqX2RlbF0gZ3B1b2JqIGZmZmY4MTAwNzI0NWQ4NDANCltkcm06bm91dmVh
dV9ncHVvYmpfcmVmX2RlbF0gcmVmIGZmZmY4MTAwNGEyODg3ODANCltkcm06
bm91dmVhdV9yYW1odF9oYXNoX2hhbmRsZV0gY2gwIGhhbmRsZT0weDgwMDNk
MDAzDQpbZHJtOm5vdXZlYXVfcmFtaHRfaGFzaF9oYW5kbGVdIGhhc2g9MHgw
MDAwMGZkOA0KW2RybTpub3V2ZWF1X3JhbWh0X3JlbW92ZV0gcmVtb3ZlIGNo
MCAweDAwMDAwZmQ4OiBoPTB4ODAwM2QwMDMsIGM9MHgwMDAwMDAwMA0KW2Ry
bTpub3V2ZWF1X2dwdW9ial9kZWxdIGdwdW9iaiBmZmZmODEwMDcyNDVkN2Mw
DQpbZHJtOm5vdXZlYXVfbm90aWZpZXJfZ3B1b2JqX2R0b3JdIA0KW2RybTpu
b3V2ZWF1X2dwdW9ial9yZWZfZGVsXSByZWYgZmZmZjgxMDA1NDU3YzI4MA0K
W2RybTpub3V2ZWF1X3JhbWh0X2hhc2hfaGFuZGxlXSBjaDAgaGFuZGxlPTB4
ODAwMzkwMDENCltkcm06bm91dmVhdV9yYW1odF9oYXNoX2hhbmRsZV0gaGFz
aD0weDAwMDAwZWM4DQpbZHJtOm5vdXZlYXVfcmFtaHRfcmVtb3ZlXSByZW1v
dmUgY2gwIDB4MDAwMDBlYzg6IGg9MHg4MDAzOTAwMSwgYz0weDAwMDAwMDAw
DQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2RlbF0gZ3B1b2JqIGZmZmY4MTAwNzI0
NWQ1NDANCltkcm06bm91dmVhdV9ncHVvYmpfcmVmX2RlbF0gcmVmIGZmZmY4
MTAwM2I5MDljNDANCltkcm06bm91dmVhdV9ncHVvYmpfZGVsXSBncHVvYmog
MDAwMDAwMDAwMDAwMDAwMA0KW2RybTpub3V2ZWF1X2dwdW9ial9yZWZfZGVs
XSByZWYgMDAwMDAwMDAwMDAwMDAwMA0KW2RybTpub3V2ZWF1X21lbV9mcmVl
XSBmcmVlaW5nIDB4MCB0eXBlPTB4MDAwMDAxMTANCltkcm06bm91dmVhdV9n
cHVvYmpfZGVsXSBncHVvYmogMDAwMDAwMDAwMDAwMDAwMA0KW2RybTpub3V2
ZWF1X2dwdW9ial90YWtlZG93bl0gDQpbZHJtOm5vdXZlYXVfZ3B1b2JqX2Rl
bF0gZ3B1b2JqIGZmZmY4MTAwNzI0NWRhNDANCltkcm06ZHJtX2lycV91bmlu
c3RhbGxdIGRybV9pcnFfdW5pbnN0YWxsOiBpcnE9MTYNCltkcm06bm91dmVh
dV9ncHVvYmpfbGF0ZV90YWtlZG93bl0gDQpbZHJtOmRybV9sYXN0Y2xvc2Vd
IGRyaXZlciBsYXN0Y2xvc2UgY29tcGxldGVkDQpbZHJtOmRybV9sYXN0Y2xv
c2VdIGxhc3RjbG9zZSBjb21wbGV0ZWQNCg==

--168427776-1707732284-1189008662=:24186
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--168427776-1707732284-1189008662=:24186--
