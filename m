From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29810] Blank screen on nouveau module load
Date: Mon,  6 Sep 2010 05:59:54 -0700 (PDT)
Message-ID: <20100906125954.6F225130143@annarchy.freedesktop.org>
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

--- Comment #19 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-09-06 05:59:54 PDT ---
(In reply to comment #18)
> As its a quite old machine that compiling stuff would take many hours so ... i
> chose an easier way. I appended your patch to the 2.6.33 kernel nouveau driver,
> and recompiled only the driver. Luckily it worked fine. With the given kernel
> parameters the new nouveau module loaded fine and i could use the console with
> nouveaufb loaded. So i thank for your help.

Thanks, to fix this properly I'd be interested in a dump of your OF device
tree, can you send me the output from "tar czvf device-tree.tar.gz
/proc/device-tree/"?

> My only problem is now the lack of
> X. xorg still says the same error as last time (failed to open device, no
> devices detected). Should i open a new bug for that?

Please, read the trouble shooting guide [1] carefully before opening a new bug.

[1] http://nouveau.freedesktop.org/wiki/TroubleShooting

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
