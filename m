From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23445] NV46: GPU lockup with gdm prompt AND logged
	in fbcon
Date: Sat, 22 Aug 2009 08:28:35 -0700 (PDT)
Message-ID: <20090822152835.61C6C130058@annarchy.freedesktop.org>
References: <bug-23445-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23445-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23445





--- Comment #9 from Renato Caldas <seventhguardian-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-08-22 08:28:34 PST ---
(In reply to comment #8)
> Can you reproduce the "GPU lockup" message completely without X?

It's not reproducible without X.. I've ran things like "dmesg && dmesg && dmesg
&& dmesg && dmesg", played a hi-res movie in mplayer using "-vo fbdev" and "-vo
caca". Nothing.

I've tried with a "gtkterm" session, and the problem didn't occur. Then I tried
starting a firefox session, and changed VT while firefox was starting up: full
lock up, SysRq wouldn't even work (I was root, not sure if it matters).

Then I tested a gnome-session as a regular user, and the problem didn't show
up.

So it seems to be related with changing VT in some circumstances. It seems that
its not possible to rule out X after all...


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
