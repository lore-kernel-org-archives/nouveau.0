From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Tue,  1 Sep 2009 11:21:29 -0700 (PDT)
Message-ID: <20090901182129.BB382130058@annarchy.freedesktop.org>
References: <bug-23593-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23593-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23593


aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org




--- Comment #4 from aeriksson-97jfqw80gc6171pxa8y+qA@public.gmane.org  2009-09-01 11:21:29 PST ---
Douh. Sorry about that. Removing the nvidiafb modules does make it better (and
I get kms!!).

However, leaving the machine for the night locks the screensaver. Wiggling the
mouse/kbd doesn't light up the screen. The machine continues to route packets
though.

I get a bunch of these in the log:

Sep  1 19:11:13 tippex [drm:drm_ioctl], pid=2376, cmd=0x40086485, nr=0x85, dev
0xe200, auth=1
Sep  1 19:11:13 tippex [drm:drm_ioctl], ret = fffffff5
Sep  1 19:11:13 tippex [drm:drm_ioctl], pid=2376, cmd=0x40086485, nr=0x85, dev
0xe200, auth=1
Sep  1 19:11:13 tippex [drm:drm_ioctl], ret = fffffff5
Sep  1 19:11:13 tippex [drm:drm_ioctl], pid=2376, cmd=0x40086485, nr=0x85, dev
0xe200, auth=1
Sep  1 19:11:13 tippex [drm:drm_ioctl], ret = fffffff5
Sep  1 19:11:13 tippex [drm:drm_ioctl], pid=2376, cmd=0x40086485, nr=0x85, dev
0xe200, auth=1
Sep  1 19:11:13 tippex [drm:drm_ioctl], ret = fffffff5


Do you want the entire log from boot?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
