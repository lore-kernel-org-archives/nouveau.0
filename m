From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: CCACHE and VFETCH FAULTs causing lockups
Date: Tue, 1 Mar 2011 21:08:31 +0000
Message-ID: <AANLkTik0CkbQz=PoXNG7bQEn_5ssAfp7cr=Z=3qJz6h2@mail.gmail.com>
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
Cc: Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Mar  1 18:21:23 madman kernel: [ 1697.116256] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
Mar  1 18:21:23 madman kernel: [ 1697.116275] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000 00000000
Mar  1 18:21:23 madman kernel: [ 1697.116283] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE FAULT
Mar  1 18:21:23 madman kernel: [ 1697.116299] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE 00000080 00000000 00000000 00000000
00000000 00000004 00000000
Mar  1 18:21:23 madman kernel: [ 1697.116306] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP
Mar  1 18:21:23 madman kernel: [ 1697.116318] [drm] nouveau
0000:01:00.0: PGRAPH - ch 3 (0x00018f3000) subc 7 class 0x8297 mthd
0x15e0 data 0x00000000
Mar  1 18:21:23 madman kernel: [ 1697.116330] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
Mar  1 18:21:23 madman kernel: [ 1697.116342] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000 00000000
Mar  1 18:21:23 madman kernel: [ 1697.116349] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE FAULT
Mar  1 18:21:23 madman kernel: [ 1697.116363] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_CCACHE 00000080 00000000 00000000 00000000
00000000 00000004 00080000
Mar  1 18:21:23 madman kernel: [ 1697.116371] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP
Mar  1 18:21:23 madman kernel: [ 1697.116380] [drm] nouveau
0000:01:00.0: PGRAPH - ch 3 (0x00018f3000) subc 7 class 0x8297 mthd
0x1084 data 0x219d6fff
Mar  1 18:21:23 madman kernel: [ 1697.116392] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_VFETCH FAULT
Mar  1 18:21:23 madman kernel: [ 1697.116404] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP_VFETCH 00f00000 0000fe0c 00000000 00000000
Mar  1 18:21:23 madman kernel: [ 1697.116410] [drm] nouveau
0000:01:00.0: PGRAPH - TRAP
Mar  1 18:21:23 madman kernel: [ 1697.116420] [drm] nouveau
0000:01:00.0: PGRAPH - ch 3 (0x00018f3000) subc 7 class 0x8297 mthd
0x15e0 data 0x00000000
Mar  1 18:21:29 madman kernel: [ 1703.981014] [drm] nouveau
0000:01:00.0: Failed to idle channel 3.
Mar  1 18:21:31 madman kernel: [ 1705.601034] [drm] nouveau
0000:01:00.0: Ctxprog is still running

Those come after 15-30 minutes of running warzone2100, i haven't
played any games for a while, so no idea how long this has been going
on.
I also got a TRAP_CCACHE on channel 2 a little while ago, it takes
much longer to trigger (a few hours). I'm using todays "nouveau
kernel" git.

I'm guessing something is being unmapped too early or without reason,
or some cache is stale. But it isn't obvious what exactly it is.

Because i don't remember having these lockups before I'm inclined to
guess that this commit is involved
http://cgit.freedesktop.org/nouveau/linux-2.6/commit/?id=6330d8f5ecc4a19fd2ad3c7fa128b2f4c2ce3360

Any ideas?

Maarten.

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
