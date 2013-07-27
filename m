From: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: WARN in drm_crtc.c:1992 on 3.11-rc2
Date: Fri, 26 Jul 2013 20:39:30 -0400
Message-ID: <CAKb7UvjESg3UZh=aW81Av6JHis1LNZQC_tzjNc7SNMnGyQSk5w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/dri-devel>,
	<mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Sender: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
Errors-To: dri-devel-bounces+sf-dri-devel=m.gmane.org@lists.freedesktop.org
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Hello,

I've started seeing the following warning in 3.11-rc2. [In the
interest of full disclosure, I do have a patch applied that tries to
implement drm_planes, which I might have done completely incorrectly,
but looking around it doesn't seem related. I'm definitely not
invoking any of the planes functionality right now. See
http://paste.debian.net/hidden/cf8b3a2, plus a call to the new
function from the end of dispnv04/disp.c:nv04_display_create ]

Here is my traceback: http://pastebin.com/W3SvKFYD, linewrapped version below:

[  379.242635] ------------[ cut here ]------------
[  379.242738] WARNING: CPU: 0 PID: 2260 at
drivers/gpu/drm/drm_crtc.c:1992 drm_mode_set_config_internal+0x6d/0xba
[drm]()
[  379.242740] Modules linked in: it87 hwmon_vid or51132 cx88_dvb
videobuf_dvb dvb_core ir_mce_kbd_decoder ir_sanyo_decoder
ir_jvc_decoder ir_sony_decoder ir_rc6_decoder ir_rc5_decoder
ir_nec_decoder rc_hauppauge tuner_simple tuner_types tda9887 tuner
rndis_host cdc_ether usbnet usb_storage nouveau fbcon cfbfillrect
cfbimgblt bitblit softcursor video font btusb cfbcopyarea ttm
bluetooth drm_kms_helper cx8800 cx8802 drm mxm_wmi crc16 cx88xx
tveeprom btcx_risc videobuf_dma_sg videobuf_core v4l2_common backlight
videodev fb fbdev rc_core i2c_algo_bit wmi
[  379.242784] CPU: 0 PID: 2260 Comm: X Not tainted 3.11.0-rc2+ #59
[  379.242786] Hardware name: Gigabyte Technology Co., Ltd.
EX58-UD3R/EX58-UD3R, BIOS FB  05/04/2009
[  379.242788]  00000000000007c8 ffff8801c4945c58 ffffffff816cc092
0000000000000050
[  379.242793]  0000000000000000 ffff8801c4945c98 ffffffff8106e2fe
ffff8801c4945c00
[  379.242797]  ffffffffa0142453 ffff8801c8b03000 0000000000000000
ffff8801c81af300
[  379.242802] Call Trace:
[  379.242808]  [<ffffffff816cc092>] dump_stack+0x46/0x58
[  379.242815]  [<ffffffff8106e2fe>] warn_slowpath_common+0x81/0x9b
[  379.242830]  [<ffffffffa0142453>] ?
drm_mode_set_config_internal+0x6d/0xba [drm]
[  379.242835]  [<ffffffff8106e332>] warn_slowpath_null+0x1a/0x1c
[  379.242850]  [<ffffffffa0142453>]
drm_mode_set_config_internal+0x6d/0xba [drm]
[  379.242866]  [<ffffffffa0144895>] drm_mode_setcrtc+0x495/0x4ef [drm]
[  379.242871]  [<ffffffff816d1769>] ? _cond_resched+0xe/0x22
[  379.242875]  [<ffffffff816d0044>] ? mutex_lock+0x16/0x37
[  379.242887]  [<ffffffffa013772c>] drm_ioctl+0x305/0x41c [drm]
[  379.242913]  [<ffffffffa0144400>] ? drm_mode_setplane+0x354/0x354 [drm]
[  379.242930]  [<ffffffff8114fe03>] do_vfs_ioctl+0x407/0x448
[  379.242941]  [<ffffffff81143a5d>] ? __sb_end_write+0x2f/0x5e
[  379.242945]  [<ffffffff81141b3f>] ? file_end_write+0x25/0x27
[  379.242949]  [<ffffffff811423b1>] ? vfs_write+0xf3/0xff
[  379.242953]  [<ffffffff8114fe90>] SyS_ioctl+0x4c/0x70
[  379.242959]  [<ffffffff816d9546>] system_call_fastpath+0x1a/0x1f
[  379.242961] ---[ end trace c33c4d50de085b7e ]---
[  613.441899] ------------[ cut here ]------------

It appears that this warning was introduced in v3.11-rc1 (commit
cc85e1217f598). I'm using nouveau, which always uses
drm_crtc_helper_set_config (at least for nv04/nv50 displays), so
perhaps there's an issue in that helper function? (I looked at the
helper and it seems like it updates ->fb at least sometimes, but I
couldn't make out the full logic.) I have a number of cards plugged in
right now (NV18, NV44, NV96), not sure which one would be causing
this. I did see these when flipping between 2 X's that are on
different vt's.

Let me know if there's anything you'd like me to try, or if you have
any insight as to why this might be happening.

Thanks,

  -ilia
