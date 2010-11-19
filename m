From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 31637] NV30, PFIFO_CACHE_ERROR when stopping kdm
Date: Fri, 19 Nov 2010 09:44:32 -0800 (PST)
Message-ID: <20101119174432.2A0AD13004E@annarchy.freedesktop.org>
References: <bug-31637-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-31637-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=31637

--- Comment #5 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-11-19 09:44:29 PST ---
Created an attachment (id=40409)
 View: https://bugs.freedesktop.org/attachment.cgi?id=40409
 Review: https://bugs.freedesktop.org/review?bug=31637&attachment=40409

nvfx_screen_destroy_flush.patch

(In reply to comment #4)
> Created an attachment (id=40403)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=40403)
> Kernel log with patch and more debug message
> 
> Your patch does not change anything. I also added some debug messages in
> nouveau_channel_idle() at start and end of the function, and the error appears
> in the middle of it.

Right, you'll need this mesa patch in addition to the other one.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
