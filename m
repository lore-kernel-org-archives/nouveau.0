From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29810] Blank screen on nouveau module load
Date: Wed,  8 Sep 2010 07:43:36 -0700 (PDT)
Message-ID: <20100908144336.323451300E9@annarchy.freedesktop.org>
References: <bug-29810-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29810-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29810

--- Comment #34 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-09-08 07:43:35 PDT ---
Created an attachment (id=38552)
 View: https://bugs.freedesktop.org/attachment.cgi?id=38552
 Review: https://bugs.freedesktop.org/review?bug=29810&attachment=38552

nouveau_edid_from_of_dbg.patch

(In reply to comment #32)
> (In reply to comment #30)
> > (In reply to comment #28)
> > > Created an attachment (id=38526)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=38526)
[details]
> > > fourth dmesg output
> > > 
> > > Unfortunately the same thing happened with the last patch. I hope you meant
> > > this by detailed kernel log.
> > 
> > Are you sure you reverted the previous patches before trying this one? They
> > aren't supposed to work together.
> 
> Well i have just checked. All .c files in drivers/gpu/drm/nouveau have
> modification date feb.24 only the nouveau_connector.c is sept 7. The module is
> recompiled and put into the /lib directory. I really don't know about this
> driver details but the fact is it worked when i only applied your first
> nv04_crtc.c suggestions.

Not sure what's going on then, can you show me the kernel logs you get after
running it with this patch applied and the previous ones reverted?

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
