From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 52244] [ 4.876531] [drm] nouveau 0000:01:00.0: GPU
 lockup - switching to software fbcon
Date: Tue, 11 Sep 2012 09:13:43 +0000
Message-ID: <bug-52244-8800-bYGwOw0Nwx@http.bugs.freedesktop.org/>
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

bugs.freedesktop.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |bugs.freedesktop.org@spider
                   |                            |007.net

--- Comment #10 from Mike C <mike.cloaked-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2012-09-11 09:13:43 UTC ---
Running arch linux with kernel 3.5.3-1-ARCH (x86_64) and nouveau
xf86-video-nouveau 1.0.1-1 Although the machine boots and runs with the screen
display apparently normal I do get in the kernel log:

Sep 11 09:37:35 localhost kernel: [ 389.092546] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 3/0 Mthd 0x0060 Data 0x8000000f
Sep 11 09:40:11 localhost kernel: [ 545.848393] [drm] nouveau 0000:01:00.0:
PFIFO_CACHE_ERROR - Ch 3/5 Mthd 0x1b00 Data 0x00000000

However when I shutdown (after running KDE desktop with desktop effects
switched on) I get a hang for some seconds after the X session ends, with a
message on the console "GPU lockup - switching to software fbcon".  However I
don't see the GPU lockup message in the logs - and only on the console during
shutdown.

If there is any additional diagnostics that I can run to help pin down where
the problem lies I will be happy to run tests.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
