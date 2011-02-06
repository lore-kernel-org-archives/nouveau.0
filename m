From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 33887] nouveau causes graphic corruption were you
 cant do anything
Date: Sun,  6 Feb 2011 06:29:50 -0800 (PST)
Message-ID: <20110206142950.3920D2DC101@annarchy.freedesktop.org>
References: <bug-33887-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-33887-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=33887

--- Comment #16 from Tomasz Wasiak <tjwasiak-wo4oW1Pw1HF3vZ0LZ0W7Rg@public.gmane.org> 2011-02-06 06:29:48 PST ---
Unfortunately mentioned commit is not the only issue.
Using revision 38e8809bb415bae5c182fc79c8fc62992c5e4ed0 patched not to use
tiled scanout helps only a bit when using current master branch of mesa... 
You need to switch to mesa-7.9 branch in order to have X working normally
without major screen corruption (unfortunately there are still some minor
corruptions here and there but you can live with them...).
Still I got only 2D acceleration working (I know 3D is not supported :-D) -
screen (or window) is totally messed up even when launching glxgears demo using
Gallium3D nouveau driver.

I had been trying nearly all revisions of xf86-video-nouveau (from
4063616938f76af8028491276039d422c0782b1b dated April 9th 2010 till current)
built on top of current master branch of mesa with same major screen
corruption!
Of course most of them need some patches not to lock the GPU when built on top
of current versions of libdrm/mesa/xorg-server but I have carefully checked if
those patches could be source of screen corruption issues.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
