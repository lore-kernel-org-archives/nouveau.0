From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36382] Frozen graphics and corrupted second monitor
 (mouse still moves)
Date: Mon, 16 May 2011 01:58:18 -0700 (PDT)
Message-ID: <20110516085818.ADF0813004F@annarchy.freedesktop.org>
References: <bug-36382-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-36382-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=36382

--- Comment #5 from Antoine Sirinelli <freedesktop-HBC0pQshtZqSJCNSX2h5FQ@public.gmane.org> 2011-05-16 01:58:18 PDT ---
(In reply to comment #2)
> You can try playing with WrappedFB (man nouveau), AFAIK it *does*
> resolve similar issue on another Debian box.

You are right. I created a simple xorg.conf file with WrappedFB set to "on" and
it solved the problem.


> Another option is to change/enable/disable xft fonts inside xterm.

I haven't tried it as the first solution was working fine.

> How do you configure your dial head setup - xrandr of xorg.conf ?

I did not have any xorg.conf. The dual-head configuration was set up by gnome
using the "Screen" preferences. I believe it is relying on xrandr.

Many thanks for your help,

Antoine

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
