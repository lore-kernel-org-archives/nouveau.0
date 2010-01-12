From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 25966] nv25 : rxvt scrolling is very slow
Date: Tue, 12 Jan 2010 04:39:49 -0800 (PST)
Message-ID: <20100112123949.282B2130115@annarchy.freedesktop.org>
References: <bug-25966-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-25966-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=25966





--- Comment #1 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-01-12 04:39:47 PST ---
(In reply to comment #0)
> Hi,
> 
> using rxvt 2.7.10 (from debian sid) has some issue with nouveau :
> - opening a new terminal, 
> - filling it with data (dmesg for example), 
> - and then scrolling with the mouse is :
>   - slow (we can see a latency)
>   - Xorg eat 100% of cpu
> 
> There no such problem with nvidia blob (and nv driver IRRC).
> 
> 
> Oprofile give me :
> 
>     62336 51.8948 libpixman-1.so.0.16.4
>     22927 19.0867 libfb.so
>     16548 13.7762 no-vmlinux
>      6297  5.2423 Xorg
> 
> unfortunately I don't have debug symbol.
> 
> 
> May be it is related to https://bugzilla.redhat.com/show_bug.cgi?id=538467 ?
> 

Could you provide some Xorg/kernel logs? (works for me on nv28).


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
