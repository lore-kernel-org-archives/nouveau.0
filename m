From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 107874] New: Incorrect SPDX-License-Identifier on
 various nouveau drm kernel source files?
Date: Sun, 09 Sep 2018 15:14:35 +0000
Message-ID: <bug-107874-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0222078438=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0222078438==
Content-Type: multipart/alternative; boundary="15365060780.Eb340C1.7985"
Content-Transfer-Encoding: 7bit


--15365060780.Eb340C1.7985
Date: Sun, 9 Sep 2018 15:14:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107874

            Bug ID: 107874
           Summary: Incorrect SPDX-License-Identifier on various nouveau
                    drm kernel source files?
           Product: xorg
           Version: unspecified
          Hardware: Other
                OS: NetBSD
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
          Assignee: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
          Reporter: campbell+fd.o-bugzilla-yMXdqOOGdVisTnJN9+BGXg@public.gmane.org
        QA Contact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org

As I understand it, the nouveau drm kernel component is meant to be availab=
le
under the X.Org permissive (`MIT') licence OR the GPL v2(+).  It looks like=
 in
2017, Greg KH ran a script over all the files without explicit copying noti=
ces
and added `SPDX-License-Identifier: GPL-2.0' to them, in commit
b24413180f5600bcb3bb70fbed5cf186b60864bd.  This included a lot of nouveau
source files, particularly header files which didn't have any explicit copy=
ing
notice.  Can these be converted to say `GPL-2.0 OR MIT'?

We use these files downstream in NetBSD and I would like to update them, but
since NetBSD is BSD-licensed, I'm nervous about kernel components that look
like they might be GPL.

The following list is taken from Linux 4.19-rc2:

dispnv04/cursor.c:// SPDX-License-Identifier: GPL-2.0
dispnv04/disp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl0002.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl0046.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl006b.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl0080.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl506e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl506f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl5070.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507a.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507b.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507c.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507d.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl826e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl826f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl906f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl9097.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cla06f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/class.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/clc37b.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/clc37e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/client.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/device.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/driver.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/event.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0000.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0001.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0002.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0003.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0004.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0005.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/ioctl.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/notify.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/object.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/os.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/unpack.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/client.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/debug.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/device.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/engine.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/enum.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/event.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/firmware.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/gpuobj.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/ioctl.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/memory.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/mm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/notify.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/object.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/oproxy.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/option.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/os.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/pci.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/ramht.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/subdev.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/tegra.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/bsp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/ce.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/cipher.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/disp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/dma.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/falcon.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/fifo.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/gr.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/mpeg.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/msenc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/mspdec.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/msppp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/msvld.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/nvdec.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/nvenc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/pm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/sec.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/sec2.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/sw.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/vic.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/vp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/xtensa.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bar.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/M0203.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/M0205.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/M0209.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/P0260.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/bit.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/bmp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/boost.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/conn.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/cstep.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/dcb.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/disp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/dp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/extdev.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/fan.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/gpio.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/i2c.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/iccsense.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/image.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/init.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/mxm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/npde.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/pcir.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/perf.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/pll.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/pmu.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/power_budget.h:/* SPDX-License-Identifier: GPL-2.0=
 */
include/nvkm/subdev/bios/ramcfg.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/rammap.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/therm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/timing.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/vmap.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/volt.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/vpstate.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/xpio.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bus.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/clk.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/devinit.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/fb.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/fuse.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/gpio.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/i2c.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/ibus.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/iccsense.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/instmem.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/ltc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/mc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/mmu.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/mxm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/pci.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/pmu.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/therm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/timer.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/top.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/vga.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/volt.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_abi16.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_acpi.c:// SPDX-License-Identifier: GPL-2.0
nouveau_acpi.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_bo.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_chan.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_debugfs.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_display.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_drv.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_fence.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_gem.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_ioctl.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_reg.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_sgdma.c:// SPDX-License-Identifier: GPL-2.0
nouveau_ttm.c:// SPDX-License-Identifier: GPL-2.0 OR MIT
nouveau_ttm.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_usif.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_vga.c:// SPDX-License-Identifier: GPL-2.0
nouveau_vga.h:/* SPDX-License-Identifier: GPL-2.0 */
nv10_fence.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/ce/fuc/gf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/ce/fuc/gt215.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/ce/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/device/acpi.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/device/ctrl.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/device/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/channv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/conn.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/dp.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/hdmi.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/disp/hdmi.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/head.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/ior.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/outp.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/rootnv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/dma/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/dma/user.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/chan.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/changf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/changk104.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/channv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/channv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/gk104.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/nv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/regsnv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/ctxgf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/ctxnv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgf117.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgk104.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgk110.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgk208.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgm107.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgf117.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgk104.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgk110.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgk208.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgm107.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/os.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv10.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv20.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv20.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv25.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv2a.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv30.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv34.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv35.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/regs.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/mpeg/nv31.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/mpeg/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/mspdec/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/msppp/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/msvld/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/nvdec/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/pm/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/pm/nv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/pm/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sec/fuc/g98.fuc0s.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sec2/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/chan.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/nvsw.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/falcon/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bar/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bar/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bar/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bios/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bus/hwsq.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bus/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/gt215.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/pll.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/seq.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/devinit/nv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/devinit/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/devinit/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ram.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ramfuc.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ramnv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ramseq.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/regsnv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fuse/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/gpio/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/aux.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/bus.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/pad.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/ibus/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/iccsense/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/instmem/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/ltc/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mc/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mmu/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mxm/mxms.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mxm/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pci/agp.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pci/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gf119.fuc4.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gk208.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gt215.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/os.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/memx.c:// SPDX-License-Identifier: GPL-2.0
nvkm/subdev/pmu/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/timer/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/timer/regsnv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/top/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/volt/priv.h:/* SPDX-License-Identifier: GPL-2.0 */

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15365060780.Eb340C1.7985
Date: Sun, 9 Sep 2018 15:14:38 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Incorrect SPDX-License-Identifier on various nouveau drm =
kernel source files?"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107874">107874</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Incorrect SPDX-License-Identifier on various nouveau drm kern=
el source files?
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>xorg
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>NetBSD
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>Driver/nouveau
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>nouveau&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>campbell+fd.o-bugzilla&#64;mumble.net
          </td>
        </tr>

        <tr>
          <th>QA Contact</th>
          <td>xorg-team&#64;lists.x.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>As I understand it, the nouveau drm kernel component is meant =
to be available
under the X.Org permissive (`MIT') licence OR the GPL v2(+).  It looks like=
 in
2017, Greg KH ran a script over all the files without explicit copying noti=
ces
and added `SPDX-License-Identifier: GPL-2.0' to them, in commit
b24413180f5600bcb3bb70fbed5cf186b60864bd.  This included a lot of nouveau
source files, particularly header files which didn't have any explicit copy=
ing
notice.  Can these be converted to say `GPL-2.0 OR MIT'?

We use these files downstream in NetBSD and I would like to update them, but
since NetBSD is BSD-licensed, I'm nervous about kernel components that look
like they might be GPL.

The following list is taken from Linux 4.19-rc2:

dispnv04/cursor.c:// SPDX-License-Identifier: GPL-2.0
dispnv04/disp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl0002.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl0046.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl006b.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl0080.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl506e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl506f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl5070.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507a.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507b.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507c.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507d.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl507e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl826e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl826f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl906f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cl9097.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/cla06f.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/class.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/clc37b.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/clc37e.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/client.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/device.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/driver.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/event.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0000.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0001.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0002.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0003.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0004.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/if0005.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/ioctl.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/notify.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/object.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/os.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvif/unpack.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/client.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/debug.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/device.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/engine.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/enum.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/event.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/firmware.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/gpuobj.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/ioctl.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/memory.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/mm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/notify.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/object.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/oproxy.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/option.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/os.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/pci.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/ramht.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/subdev.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/core/tegra.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/bsp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/ce.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/cipher.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/disp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/dma.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/falcon.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/fifo.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/gr.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/mpeg.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/msenc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/mspdec.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/msppp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/msvld.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/nvdec.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/nvenc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/pm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/sec.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/sec2.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/sw.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/vic.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/vp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/engine/xtensa.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bar.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/M0203.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/M0205.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/M0209.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/P0260.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/bit.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/bmp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/boost.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/conn.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/cstep.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/dcb.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/disp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/dp.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/extdev.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/fan.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/gpio.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/i2c.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/iccsense.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/image.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/init.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/mxm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/npde.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/pcir.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/perf.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/pll.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/pmu.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/power_budget.h:/* SPDX-License-Identifier: GPL-2.0=
 */
include/nvkm/subdev/bios/ramcfg.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/rammap.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/therm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/timing.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/vmap.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/volt.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/vpstate.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bios/xpio.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/bus.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/clk.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/devinit.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/fb.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/fuse.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/gpio.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/i2c.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/ibus.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/iccsense.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/instmem.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/ltc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/mc.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/mmu.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/mxm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/pci.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/pmu.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/therm.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/timer.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/top.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/vga.h:/* SPDX-License-Identifier: GPL-2.0 */
include/nvkm/subdev/volt.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_abi16.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_acpi.c:// SPDX-License-Identifier: GPL-2.0
nouveau_acpi.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_bo.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_chan.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_debugfs.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_display.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_drv.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_fence.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_gem.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_ioctl.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_reg.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_sgdma.c:// SPDX-License-Identifier: GPL-2.0
nouveau_ttm.c:// SPDX-License-Identifier: GPL-2.0 OR MIT
nouveau_ttm.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_usif.h:/* SPDX-License-Identifier: GPL-2.0 */
nouveau_vga.c:// SPDX-License-Identifier: GPL-2.0
nouveau_vga.h:/* SPDX-License-Identifier: GPL-2.0 */
nv10_fence.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/ce/fuc/gf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/ce/fuc/gt215.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/ce/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/device/acpi.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/device/ctrl.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/device/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/channv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/conn.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/dp.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/hdmi.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/disp/hdmi.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/head.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/ior.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/outp.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/disp/rootnv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/dma/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/dma/user.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/chan.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/changf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/changk104.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/channv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/channv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/gk104.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/nv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/fifo/regsnv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/ctxgf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/ctxnv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgf117.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgk104.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgk110.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgk208.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/gpcgm107.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgf117.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgk104.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgk110.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgk208.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/hubgm107.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/fuc/os.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv10.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv20.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv20.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv25.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv2a.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv30.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv34.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv35.c:// SPDX-License-Identifier: GPL-2.0
nvkm/engine/gr/nv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/gr/regs.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/mpeg/nv31.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/mpeg/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/mspdec/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/msppp/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/msvld/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/nvdec/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/pm/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/pm/nv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/pm/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sec/fuc/g98.fuc0s.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sec2/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/chan.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/nvsw.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/engine/sw/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/falcon/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bar/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bar/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bar/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bios/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bus/hwsq.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/bus/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/gt215.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/pll.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/clk/seq.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/devinit/nv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/devinit/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/devinit/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/gf100.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/nv50.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ram.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ramfuc.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ramnv40.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/ramseq.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fb/regsnv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/fuse/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/gpio/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/aux.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/bus.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/pad.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/i2c/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/ibus/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/iccsense/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/instmem/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/ltc/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mc/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mmu/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mxm/mxms.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/mxm/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pci/agp.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pci/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gf100.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gf119.fuc4.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gk208.fuc5.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/gt215.fuc3.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/fuc/os.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/pmu/memx.c:// SPDX-License-Identifier: GPL-2.0
nvkm/subdev/pmu/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/timer/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/timer/regsnv04.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/top/priv.h:/* SPDX-License-Identifier: GPL-2.0 */
nvkm/subdev/volt/priv.h:/* SPDX-License-Identifier: GPL-2.0 */</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15365060780.Eb340C1.7985--

--===============0222078438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0222078438==--
