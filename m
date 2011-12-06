From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 37549] Dell Studio XPS 1340 - fails to enter suspend
	mode
Date: Tue, 06 Dec 2011 19:31:47 +0000
Message-ID: <bug-37549-8800-iJ68LKSKhI@http.bugs.freedesktop.org/>
References: <bug-37549-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-37549-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=37549

--- Comment #4 from Seth Forshee <seth.forshee-Z7WLFzj8eWMS+FvcfC7Uqw@public.gmane.org> 2011-12-06 11:31:47 PST ---
(In reply to comment #3)
> Can you provide dmesg from failed suspend on 64-bit kernel? I bet it will fail
> differently than 32-bit kernel.
> 
> 2 256MB cards + 32-bit kernel without CONFIG_HIGHMEM4G (only 876 MB of RAM
> directly accessible) = fail. Maybe it's fixable, but I wouldn't count on it.

Marcin: I take it you are referring to failure to suspend due to vmalloc
failures in the nouveau driver? Indeed, Daniel has verified that this problem
can be avoided by using a 64-bit kernel or by passing vmalloc=128M to the
kernel (see the reference bug in Launchpad for details).

When that issue is avoided the system does appear to suspend successfully, but
then hangs when resuming.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
