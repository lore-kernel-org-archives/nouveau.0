From: Jaejoong Kim <climbbb.kim@gmail.com>
Subject: kmemleak in nvkm_iccsense_oneinit
Date: Thu, 18 Oct 2018 22:18:20 +0900
Message-ID: <CAL6iAa+5a1UW31+egVXnDw=O4RePmFpvV_1qHXyjPFBnhkOWWg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: bskeggs@redhat.com, airlied@linux.ie
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, LKML <linux-kernel@vger.kernel.org>
List-Id: nouveau.vger.kernel.org

## I forgot the write email without checking the enable text mode. So,
send email again. Sorry for send E-mail twice.

Hi

I got a kmemleak and it is pointing to nvkm_iccsense_oneinit().
Please refer to the below kmemleak message.

# uname -a
Linux climb 4.19.0-rc1+ #4 SMP Thu Sep 20 11:48:55 KST 2018 x86_64
x86_64 x86_64 GNU/Linux

# HW
LG Notebook. (Model Name:lg15n54)

# kmemleak mesage
unreferenced object 0xffff8801e9c58388 (size 96):
  comm "systemd-udevd", pid 130, jiffies 4294895052 (age 295965.560s)
  hex dump (first 32 bytes):
    02 05 00 6b 6b 6b 6b 6b 6b 6b 10 00 02 15 6b 6b  ...kkkkkkk....kk
    6b 6b 6b 6b 6b 6b 6b 6b 00 00 00 6b 6b 6b 6b 6b  kkkkkkkk...kkkkk
  backtrace:
    [<000000000f9caea9>] nvkm_iccsense_oneinit+0x231/0x1cf0 [nouveau]
    [<00000000d7f5cb68>] nvkm_subdev_init+0x155/0x9a0 [nouveau]
    [<00000000b2b0e9d8>] nvkm_device_init+0x332/0x5a0 [nouveau]
    [<000000003b736a7c>] nvkm_udevice_init+0x93/0xe0 [nouveau]
    [<00000000cc1011dc>] nvkm_object_init+0xcb/0x610 [nouveau]
    [<0000000006253ff8>] nvkm_ioctl_new+0x412/0x9a0 [nouveau]
    [<00000000db03ae9a>] nvkm_ioctl+0x3b4/0xbe0 [nouveau]
    [<00000000ac40bf7e>] nvif_object_init+0x2df/0x530 [nouveau]
    [<00000000e98baaae>] nvif_device_init+0x12/0xe0 [nouveau]
    [<000000006d050b26>] nouveau_cli_init+0x4e7/0x15b0 [nouveau]
    [<00000000d3f314bc>] nouveau_drm_load+0x118/0x1380 [nouveau]
    [<000000009823b666>] drm_dev_register+0x2c5/0x5a0 [drm]
    [<000000001a870888>] drm_get_pci_dev+0x16d/0x4b0 [drm]
    [<000000004d6e667f>] nouveau_drm_probe+0x459/0x620 [nouveau]
    [<00000000ad85fd78>] local_pci_probe+0xde/0x1a0
    [<00000000c07cf5fe>] pci_device_probe+0x419/0x590

Jaejoong
