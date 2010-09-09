From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 30086] Nouveau fails with unreadable EDID
Date: Thu,  9 Sep 2010 15:40:54 -0700 (PDT)
Message-ID: <20100909224054.D53871300FE@annarchy.freedesktop.org>
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

--- Comment #8 from Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-09-09 15:40:54 PDT ---
(In reply to comment #4)
> There is not much in /var/log/messages after a failed attempt... If I change
> xorg.conf from nv to nouveau, then logout from gnome, gdm will fail to start.
> 
> At that time, I have nothing added in /var/log/messages.
> In /var/log/syslog, I get:
> 
> Sep  9 18:52:27 franck-laptop gdm-binary[23109]: WARNING: GdmDisplay: display
> lasted 0,230001 seconds
> Sep  9 18:52:27 franck-laptop gdm-binary[23109]: WARNING:
> GdmLocalDisplayFactory: maximum number of X display failures reached: check X
> server log for errors
> 
> In /var/log/Xorg.0.log, I get the same messages as in the attachment I made,
> ending with:
> 
> [   339.439] (EE) [drm] failed to open device
> [   339.439] (EE) No devices detected.
> 
> Is there any other log I can provide ?

I need to see your dmesg output (or /var/log/messages) from nouveau trying to
start *without* "nomodeset" (so, you'll get a blank screen because nouveau
can't read your edid) in order to better diagnose the problem.

"failed to open device" is probably because you were trying to use nouveau
without kernel modesetting enabled.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
