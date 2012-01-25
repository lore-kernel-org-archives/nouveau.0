From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45230] New: freezing nouveau
Date: Wed, 25 Jan 2012 14:57:39 +0000
Message-ID: <bug-45230-8800@http.bugs.freedesktop.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45230

             Bug #: 45230
           Summary: freezing nouveau
    Classification: Unclassified
           Product: Mesa
           Version: unspecified
          Platform: All
        OS/Version: All
            Status: NEW
          Severity: critical
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: calestyo-Jy7UQHNrZ9Pk1uMJSBkQmQ@public.gmane.org


Created attachment 56148
  --> https://bugs.freedesktop.org/attachment.cgi?id=56148
kernel output

Hi.

I have an issue where Nouveau freezes X.

Sometimes it's then even possible to press the Powerbutton or Ctrl+Alt+F1 and
Ctrl-Alt-Ent to get a "clean" halt/reboot.

I'm using Debian sid, which has 3D support now enabled per default.
GPU is:
01:00.0 VGA compatible controller: nVidia Corporation G86 [GeForce 8400M G]
(rev a1)

The problem typically (but not only) occurs when the system memory gets low.
Sometimes (but not always) I see flickering before the problem occurs, then
typically at some parts where compiz does 3D (e.g. minimising windows, or
switching the desktop or so).


I see the kernel output attached in kern.1,... but this differs, with sometimes
completely different output.



Sometimes the system does not freeze, but I see the flickering and I just get
endless messages like these:
Jan 25 14:48:04 heisenberg kernel: [ 7847.494437] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:04 heisenberg kernel: [ 7847.501793] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:04 heisenberg kernel: [ 7847.511712] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:04 heisenberg kernel: [ 7847.511716] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:04 heisenberg kernel: [ 7847.511726] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:04 heisenberg kernel: [ 7847.536947] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:04 heisenberg kernel: [ 7847.536950] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:04 heisenberg kernel: [ 7847.536960] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:04 heisenberg kernel: [ 7847.572498] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:04 heisenberg kernel: [ 7847.572507] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:04 heisenberg kernel: [ 7847.572538] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:04 heisenberg kernel: [ 7847.611449] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:04 heisenberg kernel: [ 7847.611453] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:04 heisenberg kernel: [ 7847.611463] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:04 heisenberg kernel: [ 7847.635921] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:04 heisenberg kernel: [ 7847.635928] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:04 heisenberg kernel: [ 7847.635959] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.285552] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.285557] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.285568] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.292713] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.292716] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.292725] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.325399] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.325402] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.325412] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.365366] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.365372] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.365388] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.394988] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.394996] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.395059] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.424959] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.424961] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.424971] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.442100] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.442108] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.442140] [drm] nouveau 0000:01:00.0:
validate: -12
Jan 25 14:48:30 heisenberg kernel: [ 7873.464103] [drm] nouveau 0000:01:00.0:
fail ttm_validate
Jan 25 14:48:30 heisenberg kernel: [ 7873.464107] [drm] nouveau 0000:01:00.0:
validate vram_list
Jan 25 14:48:30 heisenberg kernel: [ 7873.464117] [drm] nouveau 0000:01:00.0:
validate: -12



or:
Jan 23 02:26:07 heisenberg kernel: [18659.474400] [drm] nouveau 0000:01:00.0:
PGRAPH - DATA_ERROR XY_OUT_OF_BOUNDS
Jan 23 02:26:07 heisenberg kernel: [18659.474407] [drm] nouveau 0000:01:00.0:
PGRAPH - DATA_ERROR
Jan 23 02:26:07 heisenberg kernel: [18659.474411] [drm] nouveau 0000:01:00.0:
PGRAPH - ch 4 (0x0001da0000) subc 7 class 0x5039 mthd 0x0328 data 0x00000000



Any ideas? Need further data?

Cheers,
Chris.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
