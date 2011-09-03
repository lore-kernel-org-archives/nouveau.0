From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40572] [nvac] Nouveau drm causes failure to resume
 from suspend with any kernel newer than 2.6.36
Date: Sat,  3 Sep 2011 03:25:33 -0700 (PDT)
Message-ID: <20110903102533.161F91301B1@annarchy.freedesktop.org>
References: <bug-40572-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40572-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40572

--- Comment #6 from Daniel Lindgren <dali.spam-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-09-03 03:25:33 PDT ---
(In reply to comment #5)
> Ok. So this commit is unlikely to be the culprit.
> 2 another ideas:
> - does suspend/resume works at all without nouveau?
> - can netconsole catch anything after failed resume?

Blacklisted nouveau with 3.0.4, the screen is still black after resume but the
machine is alive and I can ssh into it. No reboot.

Netconsole didn't produce anything after resume. Verified that it worked by
inserting a USB stick before resume, but nothing logged after. No ping
responses either, the network's probably gone.

Starting netconsole however changed the behaviour a bit, the machine reboots a
little faster, about 20 seconds after I hit the power button to resume. Without
netconsole it takes 40 seconds until it reboots.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
