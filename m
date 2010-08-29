From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29809] Random hangs on GeForce 8400M GS (NV86)
Date: Sun, 29 Aug 2010 03:57:38 -0700 (PDT)
Message-ID: <20100829105738.7295E1300E4@annarchy.freedesktop.org>
References: <bug-29809-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29809-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29809

--- Comment #8 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-08-29 03:57:38 PDT ---
Created an attachment (id=38258)
 View: https://bugs.freedesktop.org/attachment.cgi?id=38258
 Review: https://bugs.freedesktop.org/review?bug=29809&attachment=38258

nouveau_pushbuf_deadlock.patch

(In reply to comment #7)
> This patch sort of works.
> 
> My system used to hang just after few minutes of usage.
> With this patch I used the system for about 1/2 of hour, but then X hanged.
> I might be another bug.
> ( I also did many s2ram cycles, which sometimes garbage the screen, so I might
> be just lucky to have this hang)
> 
Can you reproduce it with the attached patch applied on top of the other one?
If you can (and it isn't locked up hard), please provide kernel logs after the
hang.

> Note that in 2.6.35, I see no hangs, no matter what I do with the system.
> (But like I said before I might have beein just lucky. I do see occasional
> garbage on the screen after resume from ram)
> 
> I always run compiz.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
