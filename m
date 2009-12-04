From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25440] New: PATCH: fixes conflicting miptree
	definitions
Date: Fri,  4 Dec 2009 02:35:51 -0800 (PST)
Message-ID: <bug-25440-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

http://bugs.freedesktop.org/show_bug.cgi?id=25440

           Summary: PATCH: fixes conflicting miptree definitions
           Product: Mesa
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Drivers/DRI/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: rjgleits-Bdlq13kUjeyLZ21kGMrzwg@public.gmane.org


Created an attachment (id=31731)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=31731)
Patch to fix problem above

There is a conflict between the definitions of struct nv50_miptree and
nv[1-4]0_miptree + nv04_miptree. Note that nv50_miptree starts with struct
nouveau_miptree. Sometimes pipe_textures are cast to nouveau_miptree, although
the pt was part of a nv40_miptree (for example). This results in the bo field
pointing to an incorrect location, resulting in segfaults, etc. The patch does
not change the nv50 driver (or shouldn't). I have tested it on 7300 GT only. 

Best Wishes,

Bob Gleitsmann


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
