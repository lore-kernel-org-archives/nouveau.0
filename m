From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29455] Nouveau TV-out incorrectly detecting load on
	NV18
Date: Fri, 13 Aug 2010 05:51:45 -0700 (PDT)
Message-ID: <20100813125145.55C55130101@annarchy.freedesktop.org>
References: <bug-29455-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29455-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29455

--- Comment #10 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-08-13 05:51:45 PDT ---
Created an attachment (id=37847)
 View: https://bugs.freedesktop.org/attachment.cgi?id=37847
 Review: https://bugs.freedesktop.org/review?bug=29455&attachment=37847

nouveau_dac_detect_debug.patch

(In reply to comment #9)
> (In reply to comment #8)
> 
> > Most likely there's a GPIO-controlled switch you have to poke to make TV-out
> > work: the attached patch is just a wild guess, if it has no effect you could
> > try to play a bit with the "gpio->line" parameter (values in 7-9 and 2-4 should
> > be safe).
> 
> I applied the patch (manually) to the 2.6.35 Kernel from Debian (experimental),
> but it had no effect. I don't feel comfortable fiddling around with the values
> for "gpio->line" without having the slightest idea what this would or should
> cause. The value in your patch was "7", so there would still be 5 possibilities
> left to try?
> 
Yeah, the attached patch adds some debugging output that may be useful for you
to see the effects of your changes, "output=2 sample=YXXXXXXX" with Y!=0 means
load is incorrectly being detected in your tv output.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
