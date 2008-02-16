From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 14403] NV17: LVDS0 is black with Randr 1.2,
 works when randr 1.  2 is disabled
Date: Fri, 15 Feb 2008 17:46:52 -0800 (PST)
Message-ID: <20080216014656.966F8130078@annarchy.freedesktop.org>
References: <bug-14403-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-14403-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=14403





--- Comment #24 from Phillip Ezolt <phillipezolt-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-02-15 17:46:51 PST ---
Success!

If I set the following, 
"3) nv_bios.c:3152 lvdsmanufacturerindex = 1;"

I am able to boot up into X.  I can then use xrandr to switch between
resolutions. 

In fact, that patch is the ONLY one necessary.  I removed all of the others,
and it still works. 

There are still some bugs (for example, my console is messed up when I return
to X), and also a few resolutions (for example 1024x768) are completely
corrupted.

However, I figure I'll wait to report those until you have an 'official' patch
now that we know what the problem is. 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
