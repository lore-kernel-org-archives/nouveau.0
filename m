From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30086] Nouveau fails with unreadable EDID
Date: Thu,  9 Sep 2010 11:53:59 -0700 (PDT)
Message-ID: <20100909185359.5DEB5130126@annarchy.freedesktop.org>
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

--- Comment #5 from walt <w41ter-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-09 11:53:58 PDT ---
(In reply to comment #4)

> [   339.439] (EE) [drm] failed to open device
> [   339.439] (EE) No devices detected.

I got that error too at first.  The device it's looking for is
crw-rw---- 1 root video 226, 0 2010-09-09 06:39 /dev/dri/card0

In my case that device wasn't created during boot until I added
console framebuffer support in the kernel. CONFIG_FRAMEBUFFER_CONSOLE=y

After I made that change, then I could see that the nouveau fb
driver takes over the console during early bootup -- and that
(somehow) prods udev into creating the missing device.

There may be an alternative way to do the same thing but I don't
know how to do it.  (Hints welcomed.)

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
