From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 32645] NV20 GF 3 Ti 200, displays blank screen to DVI
Date: Sat, 25 Dec 2010 05:39:26 -0800 (PST)
Message-ID: <20101225133926.B052413004F@annarchy.freedesktop.org>
References: <bug-32645-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-32645-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=32645

--- Comment #6 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-12-25 05:39:26 PST ---
Created an attachment (id=41440)
 View: https://bugs.freedesktop.org/attachment.cgi?id=41440
 Review: https://bugs.freedesktop.org/review?bug=32645&attachment=41440

nv20_broken_dcb.patch

(In reply to comment #0)
> I have a monitor that supports both DVI and VGA.  The VGA seems to work fine
> (aside from the fact that at startup it sometimes powers down for a second).
> The DVI on the other hand doesn't work as soon as we start booting (BIOS and
> GRUB work).  
> 
> I am attaching the kern and Xorg log for both when using VGA and when using
> DVI.  I am using the latest Xorg Edgers PPA in Ubuntu, built from git 3 days
> ago.

Apparently your BIOS incorrectly claims that you have an LVDS output (instead
of TMDS), the attached patch may help.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
