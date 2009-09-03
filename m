From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23593] nouveau hangs after a few minutes
Date: Thu,  3 Sep 2009 10:49:49 -0700 (PDT)
Message-ID: <20090903174949.2B15913005B@annarchy.freedesktop.org>
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





--- Comment #11 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-09-03 10:49:48 PST ---
Argh. I looked only at the first part. The hang happens at 22:41:24.

First, that log is not from boot, or then the kernel message buffer has
overflown FAST. (Which might not be a surprise, since it is logging crtc
register access and whatnot.)

Browsing the log, it is clear that the kernel message buffer repeatedly
overflows. Not to mention that that log is a bitch to search through.

Okay, I'll see if I could limit the crtc etc. logging in Nouveau during the
weekend. The ioctl flood is a bit more annoying.


The kernel screen saver is just blanking and DPMS and mouse does not wake it up
(not sure if with gpm it would). AFAIK X disables the kernel screen saver. Do
you have X running, or just nouveaufb virtual terminal? I'm asking again, since
the information from when nvidiafb was enabled is useless. Was this nv05?

You probably do have X running since all the activity in the log. What apps are
running there? Could you stop them (to get smaller logs), does it hang then?

It would be useful to repeat the still valid basic information here that you
mentioned in emails to the list. People reading this bug don't know we
discussed it on the list.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
