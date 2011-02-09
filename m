From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33707] Gimp causes Nouveau/GPU lockup
Date: Tue,  8 Feb 2011 16:52:46 -0800 (PST)
Message-ID: <20110209005246.D44C813004F@annarchy.freedesktop.org>
References: <bug-33707-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33707-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33707

--- Comment #3 from Rena Kunisaki <i.am.inuyasha-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-02-08 16:52:46 PST ---
Created an attachment (id=43140)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=43140)
System log

OK, here's a complete system log, from when it booted to when the GPU locked
up. Unfortunately doesn't look like it contains the actual crash, whereas the
partial log (attachment 42730) does.

This crash was caused by opening a large image in Gimp (3600x1080) and moving a
large layer (1680x1050) at 50% zoom. It locked up midway through redrawing the
moving layer. The keyboard also stops responding.

This crash doesn't appear to happen if Compiz is not running. Perhaps Gimp is
doing some sort of 3D accelerated blit when it detects a compositing window
manager?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
