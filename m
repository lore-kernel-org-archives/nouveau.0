From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 10920] glxgears on AGP 10de0028 NV5 [RIVA TNT2/TNT2
 Pro] works! ( but slowly)
Date: Fri,  1 Feb 2008 17:27:51 -0800 (PST)
Message-ID: <20080202012751.9A82D130009@annarchy.freedesktop.org>
References: <bug-10920-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-10920-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=10920





--- Comment #13 from Mark Carey <mark.carey-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-01 17:27:51 PST ---
Ubuntu 8.04 alpha
X.Org X Server 1.4.0.90
drm c77b0937f290568604961fa0013691349c5fcf3b
xf86-video-nouveau 5b79b0a9e54fe99eaae5b411f46a601b6944b773
mesa  ca8d91610f547b9c66f703e07356f6347a121516

glxinfo reports that Marcheu's mesa is running.

Start gears from gnome terminal, black rectangle is drawn (no window
decorations or gears), Xorg locks up and get dropped back to tty before gdm
restarts Xorg.

Will attach kernel logs and Xorg log from starting the X session which
eventually crashed.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
