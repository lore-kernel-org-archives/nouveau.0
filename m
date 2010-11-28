From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31780] DRM/Nouveau Blank Screen with 8500 GT
Date: Sat, 27 Nov 2010 16:33:04 -0800 (PST)
Message-ID: <20101128003305.5969A13004E@annarchy.freedesktop.org>
References: <bug-31780-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31780-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31780

--- Comment #10 from Kevin Winchester <kjwinchester-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2010-11-27 16:33:03 PST ---
Created an attachment (id=40610)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=40610)
dmesg log with drm.debug=15

Here is another log, with drm.debug=15 this time.  The debugging seemed to work
when I used a "debug" kernel parameter in addition to the "drm.debug=15".  This
log also has the radeon driver loading and taking control of the fbcon, but
since this doesn't seem to be the real issue, that is likely fine.

Looking at the log, I think I see the problem in the nouveau driver.  It
apparently decides that my monitor is connected to the VGA-2 connector, when in
fact I have my monitor plugged into the DVI connector on the card, would be
DVI-I-2.  The detected mode of 1440x900 is correct for my LCD monitor, so
apparently the detection of the monitor is working properly - it is just that
apparently the driver thinks it is querying the monitor through the VGA
connector.

Any settings I can try to make this work, or any code changes that might make
it work?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
