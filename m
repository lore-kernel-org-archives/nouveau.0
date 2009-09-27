From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23792] Getting inverted colors after having launched
 Virtualbox with Nouveau driver
Date: Sun, 27 Sep 2009 05:13:38 -0700 (PDT)
Message-ID: <20090927121338.BDC4513005B@annarchy.freedesktop.org>
References: <bug-23792-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23792-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=23792


Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |INVALID




--- Comment #10 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>  2009-09-27 05:13:38 PST ---
(In reply to comment #9)
> Actually, I've been using the Mesa ebuild from the X11 overlay for a while with
> gallium support enabled, as well as Nouveau (VIDEO_CARDS="nouveau)". 

Okay, that is enough to make this report invalid. We do not take Gallium3D bugs
yet.

> What is swrast? 

The Mesa software rasterizer, the only supported OpenGL renderer for Nouveau at
this time. glxinfo would say:
OpenGL vendor string: Mesa Project
OpenGL renderer string: Software Rasterizer

> According to xdpyinfo, the default number of colormap cells is 256. Is that
> what you want to know ? If i'm wrong, just tell me where i can find this and
> i'll tell you. ;)

"Depth of root window". I bet you would know if you were in 256-color mode.
Ever looked at 256-color gifs? Not to mention that anything OpenGL would
probably refuse to work.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
