From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27398] displayport: x server does not draw anything
 on ThinkPad T410
Date: Fri,  2 Sep 2011 02:39:12 -0700 (PDT)
Message-ID: <20110902093912.A05CD1300B7@annarchy.freedesktop.org>
References: <bug-27398-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27398-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27398

--- Comment #8 from Pavel S. <pav_s-KuiJ5kEpwI6ELgA04lAiVw@public.gmane.org> 2011-09-02 02:39:11 PDT ---
> The mentioned xorg hang disappeared long time ago (in my case at least)...
I am sorry, just tried to install fedora15 on my T410 and could not continue
the install after reboot, because DP was plugged in and xorg would hang
infinitely.
(machine worked fine though, had to install the blob through USBtty, though
:-()

what I want to say, this bug is still there in stable releases, my post from
the last time was from gentoo and everything installed from git...

btw. will DP be useful at any time, or is this a hard to reverse engineer BIOS
issue?

> I have the same issue on a Thinkpad W510; the display is supposed to be active,
but I don't see anything on the screen.

on git versions: If I close the lid then will BIOS disable LVDS and enable DP,
which then works as expected in xorg, you can even enable LVDS afterwards - so
maybe this can work for you until this bug is fixed...

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
