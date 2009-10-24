From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18638] nouveau fails on GeForce 9400M
Date: Fri, 23 Oct 2009 17:14:52 -0700 (PDT)
Message-ID: <20091024001452.E4D621300C9@annarchy.freedesktop.org>
References: <bug-18638-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18638-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18638





--- Comment #13 from Matthew <mister.wardrop-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-10-23 17:14:50 PST ---
Okay... that was bound to fail.

Please find the trace file at;

http://www.matthewwardrop.co.cc/tracing.txt.tar.bz2

Note: this trace was run on Ubuntu using a custom kernel based on settings from
the default 2.6.31-14 kernel in Karmic (i.e. 2.6.31.4). It traces the starting
of an empty X session using the proprietary nVidia drivers 185.18.36 as
packaged in Ubuntu. The hardware being used is the MacBook 5,1 ; with nVidia
9400m.

I also uploaded the GDM trace:
http://www.matthewwardrop.co.cc/tracing-gdm.txt.tar.bz2
The details are the same as above, but instead of starting an empty session, I
started GDM/GNOME with compiz enabled, etc.

I do hope this helps; for I'd love to run nouveau on my MacBook.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
