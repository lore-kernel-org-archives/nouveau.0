From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 45517] [GTX 580] X seems to hang a login prompt --
 PFIFO errors in dmesg
Date: Tue, 07 Feb 2012 19:46:12 +0000
Message-ID: <bug-45517-8800-BEC5jfbjG8@http.bugs.freedesktop.org/>
References: <bug-45517-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-45517-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=45517

--- Comment #5 from Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-02-07 11:46:12 PST ---
Hello Bryce

Here are some tips that will help triage the issue

* Is the person using "3d" - try reproducing the issue without it
Disable AIGLX in the X server
(Re)move the file (or package providing it)
"/usr/lib/x86_64-linux-gnu/dri/nouveau_dri.so"

* Try booting with "nouveau.nofbaccel=0"

* Amend the previous option to read "nouveau.noaccel=0"


Although before attempting any of the above I would recommend trying the git
master branch (or as close as) of the following

* [1] xf86-video-nouveau
* [2] kernel
* [3] mesa

Note that those tips can be used for any case/issue

Cheers
Emil

[1] http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/
[2] http://cgit.freedesktop.org/nouveau/linux-2.6/
[3] http://cgit.freedesktop.org/mesa/mesa/

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
