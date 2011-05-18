From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35930] flickering in many OpenGL applications with
 composition manager
Date: Wed, 18 May 2011 13:28:48 -0700 (PDT)
Message-ID: <20110518202848.D4BBC13004E@annarchy.freedesktop.org>
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

--- Comment #6 from Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> 2011-05-18 13:28:48 PDT ---
From my understanding of the code in the ddx and the way dri2 swap
scheduling/completion is supposed to work, it could be that you're hitting a
limitation of the current nouveau ddx when pageflipping is enabled for
bufferswaps:

<http://cgit.freedesktop.org/nouveau/xf86-video-nouveau/tree/src/nouveau_dri2.c#n272>

-> For page-flipped bufferswaps, which are on by default, the current ddx
doesn't wait for swap completion before it notifies x / mesa of it. Instead it
over-optimistically assumes that the swap completes at the very moment it is
scheduled, which is almost never the case.

-> Mesa would start to render to what it thinks is the post-swap backbuffer,
but in reality it is the current pre-swap frontbuffer. Unless they have some
other unorthodox synchronization mechanism in place to prevent that. You'd see
many of the symptoms described here if i'm correct. And a pause of 30 msecs
after each bufferswap as described would fix the issue in many cases.

Iow, the ddx implementation isn't yet ready to do this properly for
page-flipped fullscreen swaps, as they happen with video games and quite often
with desktop compositor.

You could try if adding the option "Pageflip" "off" in xorg.conf fixes the
problems for now, until proper implementation is there.

As far as i can see, the current ddx code has a few more issues there -- it
does do stuff differently in some cases than how it is meant to be done for the
dri2 swapbuffers and timestamping implementation.

-mario

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
