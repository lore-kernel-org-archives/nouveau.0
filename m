From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 16782] Light graphical corruption in
	Firefox/Iceweasel
Date: Wed, 23 Sep 2009 19:47:38 -0700 (PDT)
Message-ID: <20090924024738.756FA13005A@annarchy.freedesktop.org>
References: <bug-16782-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-16782-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=16782





--- Comment #5 from Tim Allen <screwtape-L9NkjsXw7LUAvxtiuMwx3w@public.gmane.org>  2009-09-23 19:47:37 PST ---
It's been a while since I owned the computer I was using when I filed this bug,
so I'm afraid I can't test it anymore.

My recollection is that there was some kind of bug in the X server pixmap
rendering that libcairo was tickling; Mozilla hacked up their internal copy of
libcairo to work around the bug, but the Debian folks built Iceweasel against
the official libcairo release.

A reference to the problem on the Debian Iceweasel maintainer's blog:

    http://glandium.org/blog/?p=209

The Mozilla bug in which they hack up their libcairo source:

    https://bugzilla.mozilla.org/show_bug.cgi?id=413583#c3

So although I don't know the current state of the actual underlying bugs, it
does seem to have workarounds in place, and it doesn't seem to be nouveau's
fault.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
