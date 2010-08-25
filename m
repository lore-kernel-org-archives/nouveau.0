From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29583] nouveau freeze Xorg on NV34
Date: Wed, 25 Aug 2010 15:54:41 -0700 (PDT)
Message-ID: <20100825225441.8BC6513011B@annarchy.freedesktop.org>
References: <bug-29583-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29583-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29583

--- Comment #6 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-08-25 15:54:40 PDT ---
(In reply to comment #3)
> Created an attachment (id=37908)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=37908)
> Xorg log
> 
> After '2.6.36-rc1' is merged into nouveau,the same problem appears with nouveau
> kernel tree.
> 
You could try to bisect this problem (see "man git-bisect").

> Here is my xorg.0.log

(In reply to comment #5)
> Curious behavior of nouveau driver(though I don't know if it's connect with
> this problem):
> Once nouveau driver is loaded,after the screen resolution changed(which is
> normal),there is a area,about 640*480 in size,at the top-left corner of the
> screen,is totally white.
> 
> This behavior started maybe after 2.6.36-rc1

That's an unrelated issue, it's already fixed in Andrew Morton's -mm tree,
commit "vt: fix console corruption on driver hand-over".

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
