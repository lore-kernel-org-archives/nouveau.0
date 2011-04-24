From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 36382] Frozen graphics and corrupted second monitor
 (mouse still moves)
Date: Sun, 24 Apr 2011 01:08:51 -0700 (PDT)
Message-ID: <20110424080851.8926213004F@annarchy.freedesktop.org>
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

--- Comment #4 from Angus Mackenzie <bugs-4f9hmS7KqqcdYYaOPf09RA@public.gmane.org> 2011-04-24 01:08:51 PDT ---
I have been plagued with ?this bug for about a month; every time I loaded a
libreoffice component (calc or writer), the system lost track of the dual
screens, often putting a copy of the first screen up, then after a few more
seconds stopped accepting input from keyboard or mouse clicks (though pointer
moved I think). I don't know if SysRq worked because I use the box next door to
reboot via ssh.

I'm using debian unstable amd-64 with nouveau 1:0.0.16+git20110411+8378443-1
and  a nVidia G98|GeForce 8400GS. I used a 3 line xrandr script in my bin
directory to enable dual screen after kde finished booting.

Thanks for the hints; the addtion of a minimal xorg.conf with wrappedfb in it
seems to have solved the issues for me.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
