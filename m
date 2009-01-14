From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 18300] NV11 Locks Up On Xorg Initialization
Date: Tue, 13 Jan 2009 19:26:20 -0800 (PST)
Message-ID: <20090114032620.D011A130056@annarchy.freedesktop.org>
References: <bug-18300-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-18300-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=18300





--- Comment #13 from Stuart Bennett <sb476-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>  2009-01-13 19:26:20 PST ---
Looking again at the log provided (apologies for missing this bug when it was
first filed), I note it's picking up a 1360x1360 virtual resolution, which at
32 bits per pixel will use 7.6M of ram for the display with very little left
over, irrespective of the fact that nouveau tries to use only half the detected
amount for the display, and 7.6M clearly doesn't fit in 4M.

I'd suggest removing any line in the xorg.conf setting a large virtual size, or
indeed, anything else suggesting the server display a 1360 wide image.  This
should cause it to use try to use a 1024x1024 virtual by default (the xserver
makes it square for rotation purposes) -- if you don't need rotation, add the
line `Virtual 1024 768' in xorg.conf under the depth 24 "display" subsection
(in the "screen" section) for an even smaller memory footprint.  Finally, you
might try setting DefaultDepth 16 in xorg.conf which should use half as much
memory and so fit, but may be less stable (less tested), and will look worse.

If something's unclear here, attaching your current xorg.conf may help.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
