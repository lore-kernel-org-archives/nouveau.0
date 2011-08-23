From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35930] flickering in many OpenGL applications with
 composition manager
Date: Mon, 22 Aug 2011 18:08:56 -0700 (PDT)
Message-ID: <20110823010856.1C5C8130169@annarchy.freedesktop.org>
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

--- Comment #27 from Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> 2011-08-22 18:08:55 PDT ---
Hi, can you try the attached series of three patches?

They implement handling of pageflip completion events from the kernel. So far
pageflip events from the kernel were ignored by the nouveau ddx. They also fix
some serious screen corruption when switching between redirected and
unredirected fullscreen windows under a compositor, and fix a few corner cases
in dri2 swap scheduling, especially for copy-swaps for windows.

These are direct translations to nouveau ddx of the corresponding (well tested)
implementations and fixes for the intel and ati ddx.

The series is so far only tested with Linux 3.0 on a single display
configuration, but should work with earlier kernels as well. Should work with
dual-display setups (fullscreen window spanning both displays, clone mode, or
zaphod head with separate x-screens), but i probably won't have a chance to
test dual-display before next weekend, so there's some chance of bugs there.

These patches fix all bugs i encountered so far with wrong oml_sync_control
timestamps from bufferswaps, flicker and other synchronization issues, e.g.,
glxgears running with 1800 fps although vsync is on. Hopefully they also help
to resolve this bug.

thanks,
-mario

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
