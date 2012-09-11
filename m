From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52244] [ 4.876531] [drm] nouveau 0000:01:00.0: GPU
 lockup - switching to software fbcon
Date: Tue, 11 Sep 2012 09:18:46 +0000
Message-ID: <bug-52244-8800-cerGOXprtm@http.bugs.freedesktop.org/>
References: <bug-52244-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-52244-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=52244

--- Comment #11 from Mike C <mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-11 09:18:46 UTC ---
I also have this in the kernel log but I don't know if it is indicative of the
same issue:

Sep 11 09:31:20 localhost kernel: [    9.278108] [drm] nouveau 0000:01:00.0:
allocated 1680x1050 fb: 0x2b0000, bo ffff88011284e400
Sep 11 09:31:20 localhost kernel: [    9.278195] fbcon: nouveaufb (fb0) is
primary device
Sep 11 09:31:20 localhost kernel: [    9.317007] Console: switching to colour
frame buffer device 210x65
Sep 11 09:31:20 localhost kernel: [    9.321037] fb0: nouveaufb frame buffer
device
Sep 11 09:31:20 localhost kernel: [    9.321039] drm: registered panic notifier
Sep 11 09:31:20 localhost kernel: [    9.321044] [drm] Initialized nouveau
1.0.0 20120316 for 0000:01:00.0 on minor 0

Does the reference to panic notifier indicate a problem or is that expected?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
