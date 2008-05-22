From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15949] LVDS-0 has wrapped screen with Randr1.2
Date: Thu, 22 May 2008 05:40:03 -0700 (PDT)
Message-ID: <20080522124003.F3D62130054@annarchy.freedesktop.org>
References: <bug-15949-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15949-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15949





--- Comment #5 from Carl van Tonder <simplyw00x-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2008-05-22 05:40:02 PST ---
>> Does the problem happen when not using nvidiafb?
AFAIK I'm not using it. It doesn't show up in lsmod, at any rate

>> Is this effect still visible
when starting X (from a good initial state) without the VGA head plugged?
If I set the laptop to a resolution at which the screen wraps, then reboot it
with no external monitor plugged in, the problem persists.

>> Do
different modes affect it (it seems to be starting in a 1024x768 mode below; is
it setting 1280x800 that breaks it)?
12800x800 is the only ode I've been able to find that actually fills the screen
--- it's a 16:10 and resolutions like 1024x786 show up in the centre with
vertical letterboxing.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
