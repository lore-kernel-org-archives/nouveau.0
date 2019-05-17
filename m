From: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Subject: Re: drm/nouveau/core/memory: kmemleak 684 new suspected memory leaks
Date: Fri, 17 May 2019 16:35:05 +0900
Message-ID: <20190517073505.GA7102@jagdpanzerIV>
References: <20190517061340.GA709@jagdpanzerIV>
 <20190517072737.GA651@jagdpanzerIV>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517072737.GA651@jagdpanzerIV>
Sender: linux-kernel-owner@vger.kernel.org
To: Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
List-Id: nouveau.vger.kernel.org

On (05/17/19 16:27), Sergey Senozhatsky wrote:
> > ... but most likely it's utterly wrong.
> > 
> 
> JFI, I removed kmemleak annotation

meeehhh....

kmemleak: 2046 new suspected memory leaks (see /sys/kernel/debug/kmemleak)

unreferenced object 0xffff95cbea4e6060 (size 16):
  comm "Web Content", pid 1191, jiffies 4294795669 (age 735.950s)
  hex dump (first 16 bytes):
    00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
  backtrace:
    [<00000000d0781ea4>] nvkm_memory_tags_get+0x8e/0x130
    [<00000000061f3c89>] gf100_vmm_valid+0x196/0x2f0
    [<00000000d79084b7>] nvkm_vmm_map+0xa8/0x360
    [<00000000e3174e33>] nvkm_vram_map+0x48/0x50
    [<00000000006adddb>] nvkm_uvmm_mthd+0x658/0x770
    [<00000000b36f3a8b>] nvkm_ioctl+0xdf/0x177
    [<0000000003acea2c>] nvif_object_mthd+0xd4/0x100
    [<0000000033824292>] nvif_vmm_map+0xeb/0x100
    [<00000000537f8629>] nouveau_mem_map+0x79/0xd0
    [<00000000c3b20b73>] nouveau_vma_new+0x19d/0x1c0
    [<00000000dc91383f>] nouveau_gem_object_open+0xd4/0x140
    [<000000005a53123b>] drm_gem_handle_create_tail+0xe3/0x160
    [<00000000e733f5a8>] nouveau_gem_ioctl_new+0x6e/0xd0
    [<00000000b5bebef5>] drm_ioctl_kernel+0x8c/0xd0
    [<000000004f28d8a6>] drm_ioctl+0x1c4/0x360
    [<00000000b08b5723>] nouveau_drm_ioctl+0x63/0xb0

	-ss
