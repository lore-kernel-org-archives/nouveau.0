From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30086] Nouveau fails with unreadable EDID
Date: Thu,  9 Sep 2010 15:32:40 -0700 (PDT)
Message-ID: <20100909223240.D0A341300E5@annarchy.freedesktop.org>
References: <bug-30086-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-30086-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=30086

--- Comment #7 from walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-09 15:32:40 PDT ---
(In reply to comment #6)
> (In reply to comment #5)
> > In my case that device wasn't created during boot until I added
> > console framebuffer support in the kernel. CONFIG_FRAMEBUFFER_CONSOLE=y
> 
> Why would you *not* have fbcon=y? Without fbcon, you will not have a text
> console at all with Nouveau.

Now I remember.  My mistake was building fbcon as a module.  When I changed
it to built-in then everything started working correctly.

Before I figured it all out, I loaded the fbcon module from a blank console
screen before starting X -- thus getting the missing device error mentioned by
the OP.

If there's a way to shoot yourself in the foot -- I promise to find it :)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
