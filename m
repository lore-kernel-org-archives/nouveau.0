From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26321] New: [9400M] GPU lockup and X does not start
Date: Fri, 29 Jan 2010 07:59:17 -0800 (PST)
Message-ID: <bug-26321-8800@http.bugs.freedesktop.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26321

           Summary: [9400M] GPU lockup and X does not start
           Product: xorg
           Version: git
          Platform: x86-64 (AMD64)
        OS/Version: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: Driver/nouveau
        AssignedTo: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
        ReportedBy: johannesobermayr-Mmb7MZpHnFY@public.gmane.org
         QAContact: xorg-team-go0+a7rfsptAfugRpC6u6w@public.gmane.org


Created an attachment (id=32900)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=32900)
dmesg

With latest code (KMS, libdrm, Mesa, nouveau) I have a GPU lockup and X does
not start.

Commit eeec3a1ecd703d3a32fe223274d2a77686030d78 worked on 2.6.32.

Btw. nouveau/linux-2.6 does not compile on 2.6.33-rc5. You have to "patch" so:

On linus tree:
git archive tags/v2.6.33-rc5 drivers/gpu include/drm ...
(git archive master ... does not compile)

On nouveau/linux-2.6 tree:
git archive master drivers/gpu/drm/nouveau include/drm/*nouveau* ...

Then "patch" contents of linus tree archive with contents of nouveau/linux-2.6
tree ...

It compiles now ...

(Maybe this "patch" is related to the GPU lockup ...)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
