From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29455] Nouveau TV-out incorrectly detecting load on
	NV18
Date: Sat, 14 Aug 2010 13:09:21 -0700 (PDT)
Message-ID: <20100814200921.E579813011C@annarchy.freedesktop.org>
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

Vlado Plaga <rechner-dLI15PoULosb1SvskN2V4Q@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|                            |FIXED

--- Comment #13 from Vlado Plaga <rechner-dLI15PoULosb1SvskN2V4Q@public.gmane.org> 2010-08-14 13:09:21 PDT ---
Great! With "gpio->line = 4" a TV is no longer incorrectly detected. Of course
I had to try the four other values before, and no longer expected any
difference... but the more positive was my surprise when the last attempt
worked.

I used Linus' git tree first, where both patches could be applied. But there
were still many errors in the kernel log, so I went back to kernel 2.6.35,
where the  nouveau_imac_g4_tvout.patch (with "gpio-> = 4") also has the desired
effect.

Thank you, Francisco Jerez! Keep up the good work with nouveau!

P.S.: If you're interested, I can still upload kernel logs with the new errors
from 2.6.35+, and with no errors with a patched 2.6.35.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
