From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31058] Flickering area on external monitor [9400M]
Date: Sat, 23 Oct 2010 10:24:05 -0700 (PDT)
Message-ID: <20101023172405.3EA1313000D@annarchy.freedesktop.org>
References: <bug-31058-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31058-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31058

--- Comment #2 from Felix Leimbach <felix.leimbach-hi6Y0CQ0nG0@public.gmane.org> 2010-10-23 10:24:05 PDT ---
(In reply to comment #1)
> You seem to have Samsung SyncMaster 204B monitor, which has two known typical
> faults:
> dying chinese electrolyte capacitors, and instability at the monitor's
> own recommended mode of 1600x1200 60 Hz.

(offtopic)
Yeah, had to replace 4 leaking capacitors after approx 2 years too, since then
its running great again. However the same monitor works just fine with another
PC and also with the nvidia binary driver.
Thanks for the hint re. ReducedBlanking, will check it out once I *can* run at
the native resolution.

(back on topic)
Today I've found a reproducable kernel panic related to the external display 
might be related:

When I play a video in VLC on the external Monitor the kernel panics as soon as
I switch to fullscreen. Maximized window works.

I'll attach a screenshot of the OOPs.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
