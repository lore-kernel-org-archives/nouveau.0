From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 27603] [nouveau] Celestia 1.6.0 crashes with
 nv04_surface_copy_swizzle assertion
Date: Mon, 12 Apr 2010 15:37:14 -0700 (PDT)
Message-ID: <20100412223714.9753313005D@annarchy.freedesktop.org>
References: <bug-27603-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-27603-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=27603

--- Comment #5 from Alex Buell <alex.buell-XLQCo7u1tb3e9xe1eoZjHA@public.gmane.org> 2010-04-12 15:37:14 PDT ---
(In reply to comment #4)
> You have to go to the main page to find the git and http URL :
> http://repo.or.cz/w/mesa/mesa-lb.git
> (you can find this link on the first line of each git page.
> 
> Then try the stable branch.

Thanks, I just tried that:
% git clone git://repo.or.cz/mesa/mesa-lb.git/ mesa
Initialized empty Git repository in /home/alex/src/opengl/mesa/.git/
remote: Counting objects: 288777, done.
remote: Compressing objects: 100% (52440/52440), done.
remote: Total 288777 (delta 240300), reused 281772 (delta 234422)
Receiving objects: 100% (288777/288777), 86.32 MiB | 745 KiB/s, done.
Resolving deltas: 100% (240300/240300), done.
warning: remote HEAD refers to nonexistent ref, unable to checkout.

I'm not sure why that's happening. 

> If you are on 0.0.15, it won't be that easy, you probably should first upgrade
> kernel module / libdrm / ddx to 0.0.16 (well, current git).

I'm already on 0.0.16, not to worry. I made sure of that before starting with
this!

Thanks for your help so far!

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
