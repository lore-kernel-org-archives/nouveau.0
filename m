From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30086] Nouveau fails with unreadable EDID
Date: Thu,  9 Sep 2010 14:10:31 -0700 (PDT)
Message-ID: <20100909211031.6CBA81300BD@annarchy.freedesktop.org>
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

--- Comment #6 from Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org> 2010-09-09 14:10:31 PDT ---
(In reply to comment #5)
> In my case that device wasn't created during boot until I added
> console framebuffer support in the kernel. CONFIG_FRAMEBUFFER_CONSOLE=y

Why would you *not* have fbcon=y? Without fbcon, you will not have a text
console at all with Nouveau.

> After I made that change, then I could see that the nouveau fb
> driver takes over the console during early bootup -- and that
> (somehow) prods udev into creating the missing device.

That is a little odd trigger for it, but still just an unrelated theoretical
issue of the case when someone wants to have graphics but not a console.


To the original poster:

You were asked to provide a complete kernel log from boot up to the original
failure. Do not filter it, do not interpret it, do not compress it. Without the
log you cannot be helped.

It is almost as if you do not have KMS enabled (or Nouveau installed properly).
The log will show the cause. When Nouveau loads, it will print many lines to
the kernel log at kernel module init time, before X starts.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
