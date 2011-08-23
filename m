From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35930] flickering in many OpenGL applications with
 composition manager
Date: Tue, 23 Aug 2011 04:25:21 -0700 (PDT)
Message-ID: <20110823112521.1C07D130158@annarchy.freedesktop.org>
References: <bug-35930-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35930-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35930

Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #31 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2011-08-23 04:25:20 PDT ---
(In reply to comment #29)
> I think there's a fundamental problem with simply exchanging the buffers for a
> redirected window's backing pixmap: There's no synchronization between the app
> and the compositing manager (CM), so by the time the CM composites the window
> contents after a flip, the app might have already flipped again and started
> rendering to the buffer the CM is using for compositing. I think this is the
> cause of the flickering.
> 
Exactly.

> It might be possible to fix this (at least as long as there aren't several
> clients trying to get at the window contents via the Composite extension...)
> with triple buffering, but I wonder if it's really worth the complexity. (E.g.
> exchanging buffers isn't possible anyway with the majority of window managers,
> which reparent client windows)

I was considering another solution, but I've been too busy in the last couple
of months to put it into practice. Basically, the X server could make sure that
at any given time all clients agree on the role of any buffers that are being
shared by several clients, by blocking their GetBuffers requests at the right
time, IOW no two clients would ever see the same buffer in two different slots
at the same moment. AFAICT this can be made to work for an arbitrary number of
clients getting at the same window at the same time.

Maxim, I've pushed your patch as a temporary solution until I (or somebody else
with more time) get around to fixing this synchronization problem in the X
server.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
