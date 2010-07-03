From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 28810] Blank consoles (Ctrl+Alt+Fn) after X starts
 on Arch Linux with FX5200 card.
Date: Sat,  3 Jul 2010 09:23:09 -0700 (PDT)
Message-ID: <20100703162309.735E4130082@annarchy.freedesktop.org>
References: <bug-28810-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-28810-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=28810

--- Comment #17 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org> 2010-07-03 09:23:09 PDT ---
Created an attachment (id=36728)
 View: https://bugs.freedesktop.org/attachment.cgi?id=36728
 Review: https://bugs.freedesktop.org/review?bug=28810&attachment=36728

nv34_tv_detect_quirk.patch

(In reply to comment #16)
> Created an attachment (id=36724)
 --> (https://bugs.freedesktop.org/attachment.cgi?id=36724)
> Output of lspci -vvnn
> 
> Ouput of lspci -vvnn attached.
> 
Ok, could you try the attached patch?

> The xorg.conf Option lines added by nvidia-settings to disable TV don't work
> for nouveau, but 'xrandr --output TV-1 --off' does work for X. 
> 
See [1], 'Option "Ignore"' is what you were looking for, but you shouldn't need
it anymore.

> Pete

[1] http://wiki.debian.org/XStrikeForce/HowToRandR12

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
