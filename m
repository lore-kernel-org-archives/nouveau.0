From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 23092] Syslog flooded with "nouveau 0000:01:00.0:
 Unhandled PFIFO_INTR - 0x00000010"
Date: Fri, 12 Mar 2010 06:24:01 -0800 (PST)
Message-ID: <20100312142401.BBEB81300A5@annarchy.freedesktop.org>
References: <bug-23092-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-23092-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=23092


Michal Suchanek <hramrach-aRb0bU7PRFPrBKCeMvbIDA@public.gmane.org> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |hramrach-aRb0bU7PRFPrBKCeMvbIDA@public.gmane.org




--- Comment #7 from Michal Suchanek <hramrach-aRb0bU7PRFPrBKCeMvbIDA@public.gmane.org>  2010-03-12 06:24:01 PST ---
I had similar messages when vesafb was activated before loading the nouveau
module.

Setting vga=normal on the kernel command line resolved the issue for me.


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
