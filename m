From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24710] nouveau KMS fails on NV11 - screen freeze
Date: Fri,  6 Nov 2009 08:40:19 -0800 (PST)
Message-ID: <20091106164020.1DD491300F3@annarchy.freedesktop.org>
References: <bug-24710-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24710-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24710





--- Comment #8 from Jan Buecken <jb.faq-Mmb7MZpHnFY@public.gmane.org>  2009-11-06 08:40:14 PST ---
Tried an other monitor (MD6155AH) today. Does work!

But: Tried forcing the resolution with the command line option
(video=VGA-1:1024x768e) with this monitor. Does not work (same problem, black
screen)! The monitor tells me it has no connection any more.

Tried other resolutions with the old monitor (LT1772ie, which is technical the
same like an Acerview 76ie)
The resolution 800x600e does work! This seems to be the resolution the kernel
boots with (so there is no resolution switch?). Maybe it is not possible to
switch the resolutions if it is forced by kernel command line?

If necessary I can upload the new dmesg outputs of the different cases.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
