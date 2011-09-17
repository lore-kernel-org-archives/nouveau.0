From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26980] NVA3 / NVA5 / NVA8 / NVAF (GT2xx/GT3xx) with
 nouveau: random GPU lockups
Date: Sat, 17 Sep 2011 05:48:47 -0700 (PDT)
Message-ID: <20110917124847.9B4F7130163@annarchy.freedesktop.org>
References: <bug-26980-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26980-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=26980

ColdFeetBob <lithium_flower-1Ph4/jfBtgs@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |lithium_flower-1Ph4/jfBtgs@public.gmane.org

--- Comment #65 from ColdFeetBob <lithium_flower-1Ph4/jfBtgs@public.gmane.org> 2011-09-17 05:48:39 PDT ---
I experimented this bug not long ago - right now, Im not sure it is exactly the
same, since it's not really random but it happens everytime I run Supertux.
I recovered the folloving kernel log lines rebooting from another partition
after the freeze.

kernel 3.0.4, Arch Linux, x86_64, fully updated
nouveau-dri 7.11-2

lspci:

01:00.0 VGA compatible controller: nVidia Corporation GT215 [GeForce GT 240]
(rev a2) (prog-if 00 [VGA controller])

kernel.log:


Sep 11 08:44:25 faye kernel: [ 1297.836589] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 0
Sep 11 08:44:25 faye kernel: [ 1298.301418] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x00400000 - Ch 2
Sep 11 08:44:27 faye kernel: [ 1299.629024] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x04400000 - Ch 2
Sep 11 08:44:27 faye kernel: [ 1300.956673] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x04400000 - Ch 2
Sep 11 08:44:27 faye kernel: [ 1300.956719] psmouse.c: Wheel Mouse at
isa0060/serio1/input0 lost synchronization, throwing 1 bytes away.
Sep 11 08:44:29 faye kernel: [ 1302.284342] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x00400000 - Ch 2
Sep 11 08:44:29 faye kernel: [ 1299.632344] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 5
Sep 11 08:44:31 faye kernel: [ 1302.960046] [drm] nouveau 0000:01:00.0: PGRAPH
TLB flush idle timeout fail: 0x00c00f01 0x00000209 0x00001600 0x00000000
Sep 11 08:44:32 faye kernel: [ 1303.611794] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 5
Sep 11 08:44:34 faye kernel: [ 1303.615050] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 5
Sep 11 08:44:53 faye kernel: [ 1302.960046] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 0
Sep 11 08:44:53 faye kernel: [ 1305.614198] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x00400000 - Ch 2
Sep 11 08:44:53 faye kernel: [ 1307.613341] [drm] nouveau 0000:01:00.0: PGRAPH
TLB flush idle timeout fail: 0x00c00f01 0x00000209 0x00001600 0x00000000
Sep 11 08:44:53 faye kernel: [ 1310.944310] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 5
Sep 11 08:44:53 faye kernel: [ 1307.613341] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 0
Sep 11 08:44:53 faye kernel: [ 1314.940910] [drm] nouveau 0000:01:00.0: PRAMIN
flush timeout
Sep 11 08:44:53 faye kernel: [ 1310.941070] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 0
Sep 11 08:44:53 faye kernel: [ 1316.266913] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 5
Sep 11 08:44:53 faye kernel: [ 1312.943555] [drm] nouveau 0000:01:00.0: PGRAPH
TLB flush idle timeout fail: 0x00c00f01 0x00000209 0x00001600 0x00000000
Sep 11 08:44:53 faye kernel: [ 1312.943555] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 0
Sep 11 08:44:55 faye kernel: [ 1318.264271] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x04c00000 - Ch 2
Sep 11 08:44:55 faye kernel: [ 1322.259717] psmouse.c: resync failed, issuing
reconnect request
Sep 11 08:44:55 faye kernel: [ 1322.256898] [drm] nouveau 0000:01:00.0: PGRAPH
TLB flush idle timeout fail: 0x00c00f01 0x00000209 0x00001600 0x00000000
Sep 11 08:44:55 faye kernel: [ 1322.256898] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 0
Sep 11 08:44:55 faye kernel: [ 1323.596565] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x00400000 - Ch 2
Sep 11 08:44:55 faye kernel: [ 1326.270583] [drm] nouveau 0000:01:00.0: PRAMIN
flush timeout
Sep 11 08:44:55 faye kernel: [ 1328.923088] hrtimer: interrupt took 2607527851
ns
Sep 11 08:44:55 faye kernel: [ 1328.923099] [drm] nouveau 0000:01:00.0:
PFIFO_INTR 0x00c00000 - Ch 2
Sep 11 08:44:55 faye kernel: [ 1328.926536] [drm] nouveau 0000:01:00.0: vm
flush timeout: engine 5

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
