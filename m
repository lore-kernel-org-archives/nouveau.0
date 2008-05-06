From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 15502] Unknown LVDS configuration bits
Date: Tue,  6 May 2008 01:13:03 -0700 (PDT)
Message-ID: <20080506081303.7D430130053@annarchy.freedesktop.org>
References: <bug-15502-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-15502-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=15502





--- Comment #13 from Jan Willies <jan-uD0V+UySoA6ZuzBka8ofvg@public.gmane.org>  2008-05-06 01:13:02 PST ---
(In reply to comment #12)
> The issue is known, i know perfectly well what causes the error. It's in
> nv_bios.c around line 4148. Please just accept that the driver isn't end-user
> ready and for that reason i don't work around it.
> 

/*                      if (conf & mask) {
*                               xf86DrvMsg(pScrn->scrnIndex, X_ERROR,
*                                          "Unknown LVDS configuration bits,
please report\n");
*                               pNv->dcb_table.entries = 0;
*                               return false;
*                       }
*/

That's my workaround (suggestion from Maarten, thx)


HTH


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
