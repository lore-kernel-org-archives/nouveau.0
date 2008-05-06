From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15845] X busyloops when huge image in firefox
Date: Tue,  6 May 2008 11:16:45 -0700 (PDT)
Message-ID: <20080506181645.DCE47130051@annarchy.freedesktop.org>
References: <bug-15845-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15845-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15845





--- Comment #2 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2008-05-06 11:16:44 PST ---
Created an attachment (id=16390)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=16390)
gdb session

This is a gdb session recorded on a serial console.
For many times I interrupt X while it is spinning and print the backtrace.
There's a disassembly of nouveau_notifier_wait_status.
I set breakpoints to NVUploadToScreen and NVDownloadFromScreen to see what kind
of calls they get.

Looks like it is migrating a big pixmap a lot. w=1703, h=3000 are probably the
original dimensions of the image I used to trigger the problem this time.
During the dozens of calls to NVUploadToScreen, the firefox window does not
show any redrawing. After something like 5 mins running, the window updates
instantly, and I can re-trigger the freeze by doing anything that would expose
a piece of the huge image.

Hmm, I just noticed a pattern there:
NVUploadToScreen (pDst=0x2ba0cf4db010, x=0, y=0, w=1703, h=3000
NVUploadToScreen (pDst=0x1314020, x=0, y=0, w=494, h=1315
NVUploadToScreen (pDst=0x2ba0cf4db010, x=0, y=0, w=1703, h=3000
NVUploadToScreen (pDst=0x1314020, x=0, y=0, w=495, h=1315
NVUploadToScreen (pDst=0x2ba0cf4db010, x=0, y=0, w=1703, h=3000
NVUploadToScreen (pDst=0x1314020, x=0, y=0, w=496, h=1315
NVUploadToScreen (pDst=0x2ba0cf4db010, x=0, y=0, w=1703, h=3000
NVUploadToScreen (pDst=0x1314020, x=0, y=0, w=497, h=1315
See the width of the second pixmap.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
