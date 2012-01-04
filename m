From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35452] Pageflipping + nouveau + compiz + fullscreen
	== FAIL
Date: Wed, 04 Jan 2012 22:51:30 +0000
Message-ID: <bug-35452-8800-lFxK0QBjFd@http.bugs.freedesktop.org/>
References: <bug-35452-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35452-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35452

--- Comment #23 from Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> 2012-01-04 14:51:30 PST ---
Good. You can try with the 2nd patch only if you want. That should fix your bug
and should give you an idea of the performance you'll get. The 2nd patch does
not apply cleanly because of some context it needs from the 1st patch, but you
can fix this manually. ("Bugfix for nouveau, a direct translation of the bugfix
in ati-ddx for same problem.")

The 1st patch fixes other bugs, but potentially reduces fps a little bit by
reducing kms-flips from triple-buffered to double-buffered, probably causing
your lost 6 fps wrt. no fix applied at all.

1st patch wasn't applied to nouveau because of this. But Xserver 1.12 has a new
swaplimit api that should allow to apply the 1st patch without performance
loss, once we have a patch using the swaplimit api.

I'll prepare those additional patch in the next couple of days and submit them
to nouveau-devel.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
