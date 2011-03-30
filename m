From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 35714] Nouveau: GLSL issue with Gnome Shell
Date: Wed, 30 Mar 2011 08:06:30 -0700 (PDT)
Message-ID: <20110330150630.0612813004F@annarchy.freedesktop.org>
References: <bug-35714-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-35714-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=35714

--- Comment #4 from Rui Tiago Matos <tiagomatos-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> 2011-03-30 08:06:29 PDT ---
(In reply to comment #3)
> Hey, 
> 
> The policy has changed, it is now accepted to report misrendered images (see
> http://nouveau.freedesktop.org/wiki/MesaDrivers).
> So, I re-open this bug report. This is your lucky day ;)
> 
> Could you provide more information? Kernel logs, mesa version (git master would
> be preferred) and maybe the lspci output for your GPU would be helpful.

I can reproduce this with mesa master on linux 2.6.38 with an NV86. Check here
for the commit that introduced the bug in gnome-shell:

https://bugzilla.gnome.org/show_bug.cgi?id=645814#c2

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
