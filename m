From: rm.riches-BRax14MUi1YI9MI5TlNUSA@public.gmane.org (Robert M. Riches Jr.)
Subject: Lockups ENGT430 (NVc0), failed to unbind.
Date: Wed, 05 Jun 2013 22:26:29 -0700
Message-ID: <20130606052629.EFDFE1835EA@one.localnet>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Twice in a little over a week, nouveau has locked up on my system
with an Asus ENGT430 that is "Detected [as] an NVc0 generation
card (0x0c1080a1)" at boot time.  OS is Mageia 2, kernel
3.4.45-server-1.mga2.  At the time of both lockups, I had a
couple dozen Firefox windows plus several other miscellaneous
windows open.

Here are the some snippets from /var/log/messages a few days
before the first lock-up:

    May 27 10:24:25 one kernel: [779598.847459] [drm] nouveau 0000:06:00.0: gpuobj -28
    ...
    May 27 10:28:37 one kernel: [779850.989024] [drm] nouveau 0000:06:00.0: gpuobj -28
    ...
    May 27 10:28:45 one kernel: [779858.365759] [drm] nouveau 0000:06:00.0: Error creating object: -28 (3/0xbeef9039)


These happened at approximately the time of the first lockup.
Keyboard LEDs were inoperative.

    May 30 20:52:38 one kernel: [1075995.216570] [drm] nouveau 0000:06:00.0: PFIFO: write fault at 0x0000188000 [PAGE_NOT_PRESENT] from BAR3/BAR_WRITE on channel 0x0000058000
    May 30 20:52:38 one kernel: [1075995.216579] [drm] nouveau 0000:06:00.0: PFIFO: unknown status 0x40000000
    May 30 20:52:38 one kernel: [1075995.216594] [drm] nouveau 0000:06:00.0: PFIFO: write fault at 0x0038a20000 [PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x0000ac8000

These happened a little over an hour after booting following
increasing system RAM:

    Jun  1 14:16:25 one kernel: [ 4163.578441] [drm] nouveau 0000:06:00.0: PMFB0_SUBP0: 0x037f0040
    Jun  1 14:16:25 one kernel: [ 4163.578447] [drm] nouveau 0000:06:00.0: PMFB0_SUBP1: 0x037f0040

Nothing adverse was observed at this time:

    Jun  3 19:09:42 one kernel: [194241.366196] [drm] nouveau 0000:06:00.0: gpuobj -28

This was the time of the second lock-up:

    Jun  4 20:40:44 one kernel: [285949.704837] [drm] nouveau 0000:06:00.0: PFIFO: write fault at 0x01bcb20000 [INVALID_STORAGE_TYPE] from PGRAPH/GPC0/PROP on channel 0x0000ac8000
    Jun  4 20:40:44 one kernel: [285949.704846] [drm] nouveau 0000:06:00.0: PFIFO: unknown status 0x40000000

Some months ago, following advice from this list, I had
successfully restored function by doing these commands via ssh
from another machine:

    echo 0 > /sys/class/vtconsole/vtcon1/bind
    modprobe -r nouveau
    modprobe nouveau

These two times, the "modprobe -r nouveau" returned a message
indicating the module was busy.  On the second time, June 4,
/sys/class/vtconsole/vtcon1/bind still had "1" rather than the
"0' I had written to it.  I'm taking that means the kernel had
failed to unbind the console and module.

Any additional suggestions for getting it unbound so I can remove
and reload the module?  (...preferably without needing to reboot
the machine.)

(Truth be known, I have some GTX560 cards I'd love to put to use,
but last time I tried, the system wouldn't even boot with one of
those cards.)

Thanks,

Robert
