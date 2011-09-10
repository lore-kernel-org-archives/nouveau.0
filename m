From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted opengl/3d/composited
 graphics after suspend/hibernate
Date: Sat, 10 Sep 2011 08:14:46 -0700 (PDT)
Message-ID: <20110910151446.5CB75130135@annarchy.freedesktop.org>
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

--- Comment #34 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-10 08:14:46 PDT ---
Thanks for testing the latest kernel, and sadly as you see the problem is still
there.

This is a summary of findings of findings so far:

1. Fault always happens in MP1 of TP0, after resume from ram

2. It doesn't matter if program was run through suspend 
    or launched afrer suspend.

3. It doesn't matter if there was suspend or hibernate, 
   even hibernate without BIOS suport (echo shutdown > /sys/power/disk)

4. Actual size of allocated buffer doesn't matter. However just pretending that
we 
   allocated smaller buffers for each code type (by passing smaller size to
   nouveau_resource_alloc fixes the issue. (32K was largest size that was
working)

5. Buffers that glxgears happen to upload (tested on his and my system and
apppears 
   not to change:

   7fc00 - 2nd vertex shader - 392 bytes
   7fe00 - vertex shader 392 bytes
   fff00 - pixel shader - 24 bytes

   However fault address is almost always 7bf00 or something very close to it 
   (7bf08, 7c000)

   That address is way outside the areas that were uploaded.

6. Filling whole code buffer with pattern (using nouveau_bo_map) with pattern
made 
   TP1 execute that pattern once again at 7bf00. Tested many tumes.
   However if in addition to doing so, the code buffer upload was skipped, all
TPs 
   (all 4 of them) faulted in tandem at 7fc00 trying to execute the pattern.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
