From: Xavier <shiningxc-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Removal of Non-KMS support
Date: Thu, 7 Jan 2010 20:49:21 +0100
Message-ID: <91752841001071149u155f3e22veb91b07167f60f36@mail.gmail.com>
References: <1262755950.2346.5.camel@araqiel>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1262755950.2346.5.camel@araqiel>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Jan 6, 2010 at 6:32 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> I did a very quick pass at removing all the non-KMS support from the
> DDX. =A0It's tested on G80 but nowhere else currently, I thought some
> discussion would be a good idea rather than just ripping it out :)
>
> The non-KMS paths are messy, and lets face it, rotting badly. =A0IMO the
> KMS code is stable enough now that we can continue without the UMS
> crutch, and indeed, the KMS code supports a lot more chipsets
> (particularly on GF8 and up) than the UMS code ever will.
>
> I've left the Xv overlay code intact, but ifdef'd out. =A0I want to bring
> support back with KMS enabled (thinking of older chipsets where the
> blitter sucks), so it made sense to leave the old code there for now.
>
> So, who has some Signed-off-by's :)
>

That broke exapixmaps=3Dno for me.
I tried to disable exapixmaps temporarily to workaround some
dri2/window resize problems, as suggested by calim.
After reverting "Removal of Non-KMS support", exapixmaps=3Dno worked fine.

Jan  7 17:44:13 xps-m1530 init: Switching to runlevel: 5
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.449485] integrated sync not suppor=
ted
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.555266] integrated sync not suppor=
ted
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.664571] [drm] nouveau
0000:01:00.0: Allocating FIFO number 2
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.673371] [drm] nouveau
0000:01:00.0: nouveau_channel_alloc: initialised FIFO 2
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.674075] [TTM] Page number
range to small Need 4503599627369472 pages, range is [0, 65536]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.678391] [drm] nouveau
0000:01:00.0: nouveau_channel_free: freeing fifo 2
Jan  7 17:44:13 xps-m1530 gdm-binary[8150]: WARNING: GdmDisplay:
display lasted 0.309705 seconds
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.723902] integrated sync not suppor=
ted
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.829683] integrated sync not suppor=
ted
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.937500] [drm] nouveau
0000:01:00.0: Allocating FIFO number 2
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.945901] [drm] nouveau
0000:01:00.0: nouveau_channel_alloc: initialised FIFO 2
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946061]
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946064] BUG kmalloc-512:
Poison overwritten
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946066]
---------------------------------------------------------------------------=
--
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946067]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946070] INFO:
0xffff8801183a6d18-0xffff8801183a6d1f. First byte 0x0 instead of 0x6b
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946081] INFO: Allocated in
nouveau_bo_new+0x5b/0x470 [nouveau] age=3D272 cpu=3D1 pid=3D8156
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946088] INFO: Freed in
nouveau_bo_del_ttm+0x9f/0xd0 [nouveau] age=3D272 cpu=3D1 pid=3D8156
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946091] INFO: Slab
0xffffea0003d4cc50 objects=3D14 used=3D11 fp=3D0xffff8801183a6b68
flags=3D0x80000000000040c3
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946094] INFO: Object
0xffff8801183a6b68 @offset=3D2920 fp=3D0xffff8801183a7918
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946095]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946097] Bytes b4
0xffff8801183a6b58:  75 73 49 00 01 00 00 00 5a 5a 5a 5a 5a 5a 5a 5a
usI.....ZZZZZZZZ
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946107]   Object
0xffff8801183a6b68:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946117]   Object
0xffff8801183a6b78:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946126]   Object
0xffff8801183a6b88:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946136]   Object
0xffff8801183a6b98:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946145]   Object
0xffff8801183a6ba8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946155]   Object
0xffff8801183a6bb8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946170]   Object
0xffff8801183a6bc8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946179]   Object
0xffff8801183a6bd8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946187]   Object
0xffff8801183a6be8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946204]   Object
0xffff8801183a6bf8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946214]   Object
0xffff8801183a6c08:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946223]   Object
0xffff8801183a6c18:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946233]   Object
0xffff8801183a6c28:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946243]   Object
0xffff8801183a6c38:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946252]   Object
0xffff8801183a6c48:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6c58:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6c68:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6c78:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6c88:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6c98:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6ca8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6cb8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6cc8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6cd8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6ce8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6cf8:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6d08:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6d18:  00 00 00 00 00 00 00 00 6b 6b 6b 6b 6b 6b 6b 6b
........kkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6d28:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6d38:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6d48:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b
kkkkkkkkkkkkkkkk
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]   Object
0xffff8801183a6d58:  6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b 6b a5
kkkkkkkkkkkkkkk=A5
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  Redzone
0xffff8801183a6d68:  bb bb bb bb bb bb bb bb
=BB=BB=BB=BB=BB=BB=BB=BB
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  Padding
0xffff8801183a6da8:  5a 5a 5a 5a 5a 5a 5a 5a
ZZZZZZZZ
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255] Pid: 8160, comm: Xorg
Not tainted 2.6.32-nouveau #30
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255] Call Trace:
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff810f5fc1>]
print_trailer+0x101/0x170
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff810f66e2>]
check_bytes_and_report+0xf2/0x120
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff810f691e>]
check_object+0x20e/0x260
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff810f892e>]
__slab_alloc+0x59e/0x7c0
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff812cd5cc>]
? security_inode_alloc+0x1c/0x20
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff81117526>]
? inode_init_always+0x116/0x1c0
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffffa015b4ab>]
? nouveau_bo_new+0x5b/0x470 [nouveau]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff810f8dd7>]
kmem_cache_alloc+0xb7/0x140
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffffa015b4ab>]
nouveau_bo_new+0x5b/0x470 [nouveau]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffffa015dccf>]
nouveau_gem_new+0x3f/0xd0 [nouveau]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffffa015de99>]
nouveau_gem_ioctl_new+0x139/0x320 [nouveau]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffffa00ec6ed>]
drm_ioctl+0x17d/0x3a0 [drm]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffffa015dd60>]
? nouveau_gem_ioctl_new+0x0/0x320 [nouveau]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff810e6238>]
? mmap_region+0x1f8/0x500
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff8110fc6c>]
vfs_ioctl+0x7c/0xa0
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff8110fda0>]
do_vfs_ioctl+0x80/0x560
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff81303e75>]
? __up_write+0xe5/0x150
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff81110301>]
sys_ioctl+0x81/0xa0
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]  [<ffffffff8100bf2b>]
system_call_fastpath+0x16/0x1b
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255] FIX kmalloc-512:
Restoring 0xffff8801183a6d18-0xffff8801183a6d1f=3D0x6b
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.946255] FIX kmalloc-512:
Marking all objects used
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.947018] [TTM] Page number
range to small Need 4503599627369472 pages, range is [0, 65536]
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.950986] [drm] nouveau
0000:01:00.0: nouveau_channel_free: freeing fifo 2
Jan  7 17:44:13 xps-m1530 gdm-binary[8150]: WARNING: GdmDisplay:
display lasted 0.270496 seconds
Jan  7 17:44:13 xps-m1530 kernel: [ 5113.987276] integrated sync not suppor=
ted
Jan  7 17:44:13 xps-m1530 kernel: [ 5114.092992] integrated sync not suppor=
ted
