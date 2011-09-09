From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 40630] nouveau: corrupted opengl/3d/composited
 graphics after suspend/hibernate
Date: Thu,  8 Sep 2011 22:11:45 -0700 (PDT)
Message-ID: <20110909051145.6B0581300BA@annarchy.freedesktop.org>
References: <bug-40630-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-40630-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=40630

--- Comment #27 from maximlevitsky-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org 2011-09-08 22:11:45 PDT ---
So I did a shot in the dark and I almost scored.
This what I found:

nouveau gallium3d driver reserves 3x512KB buffers for each shader type.
We reduced this to 3x32K buffers and problem gone!
(Although one crash with kwin and glxgears was reported, not clear yet it it
was related).

Its not easy to say what is going on, but suggestions that I have in mind:

1. memory allocation failure that goes somehow silent or other similar ttm
related bug. knowing about all the titanic memory moving it might be the case
after all (the system has 1GB of vram and 2GB of system memory...)

2. Issues with VM, for example large pages that might be involved and somewhat
disabled.

3. Issues with TLB??

4. ????

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
