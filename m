From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21186] nouveau very slow with screen size > 1680
Date: Fri, 17 Apr 2009 17:38:30 -0700 (PDT)
Message-ID: <20090418003830.D3E22130016@annarchy.freedesktop.org>
References: <bug-21186-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-21186-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
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

http://bugs.freedesktop.org/show_bug.cgi?id=21186





--- Comment #13 from Gaetano Canepa <gaetano.canepa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-04-17 17:38:30 PST ---
Created an attachment (id=24907)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=24907)
oprofile without opengl

As soon as you sent the first message I realized my ingenuity.
I installed:
xorg-x11-drv-nouveau-debuginfo.x86_64                               
xorg-x11-drv-nv-debuginfo.x86_64                                              
xorg-x11-server-debuginfo.x86_64                                         
xorg-x11-server-utils-debuginfo.x86_64 

And I re-runned oprofile (no opengl): any hint in the attached file?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
