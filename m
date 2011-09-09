From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted graphics after
 suspending/resuming computer
Date: Thu,  8 Sep 2011 17:24:42 -0700 (PDT)
Message-ID: <20110909002442.D86931301CA@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #25 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-08 17:24:42 PDT ---
OK. After making kernel handle the TP1 error bit, the error was decoded, and
tried several times. These are errors we got:

1st try:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at
07bf00 warp 9, opcode ffc8c2bf ffc8c2bf
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x0001430000) subc 5 class 0x8297
mthd 0x0f04 data 0x3f4b6dfa

2nd try:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at
07bf00 warp 1, opcode ff1f515e ff1f515e
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001cd1000) subc 5 class 0x8297
mthd 0x1b0c data 0x1000f010

3rd try:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at
07bf00 warp 13, opcode ff1f515e ff1f515e
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 4 (0x0001930000) subc 5 class 0x8297
mthd 0x1b0c data 0x1000f010

4rd try:

[drm] nouveau 0000:01:00.0: PGRAPH_TRAP_MP_EXEC - TP 0 MP 1: INVALID_OPCODE at
07c000 warp 1, opcode ffc7c1bf ffc7c1bf
[drm] nouveau 0000:01:00.0: PGRAPH - TRAP
[drm] nouveau 0000:01:00.0: PGRAPH - ch 5 (0x000322c000) subc 5 class 0x8297
mthd 0x1b0c data 0x1000f010


It was also found that 2d usage after resume from ram and/or xvideo playback
don't trigger that MP fault.

Also following suggestions from Marcin Slusarz were tried:


We tried to restart X after resume from ram, and once again no errors.
We tried running rendercheck -tblend, just 9 out of 18 tests passed, but no TP
error.

Its somewhat strange as if nouveau drm module didn't restore some of TP/MP
state, the error should have being triggered by X as it does use shaders that
have to choice but to run on MP/TPs.

Also running just glxinfo was attempted. That does all the 3d init but doesn't
render anything (I checked this). No errors.

Thats is ***ing strange, that all I can say, and I am out of ideas for now.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
