From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26800] Nouveau TV-out incorrectly detecting load
Date: Sat,  6 Mar 2010 09:43:08 -0800 (PST)
Message-ID: <20100306174308.11D57130072@annarchy.freedesktop.org>
References: <bug-26800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26800-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26800





--- Comment #3 from Andy Rink <personman_145-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>  2010-03-06 09:43:07 PST ---
(In reply to comment #2)
> An mmiotrace would help here (see [1] and the docs in the kernel tree),
> preferably with something plugged in the TV connector and LVDS disabled. Do you
> have access to a TV?
> 
> [1] http://nouveau.freedesktop.org/wiki/MmioTrace
> 

I do have access to a TV. Do you know how or where I might look to disable the
LVDS? I'm assuming I can ssh in to the laptop to do this if the the TV-out
doesn't work and the LVDS is disabled.

I'm reading up on mmiotrace to familiarize myself with the process.

Thanks for the work you guys do! I have several generations of nvidia cards,
including the original GeForce DDR, 6600, 6800, and 8800GTS. I'll report any
issues I run in to as I migrate them over to nouveau.

-Andy


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
