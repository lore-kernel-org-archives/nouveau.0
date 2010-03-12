From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26800] Nouveau TV-out incorrectly detecting load
Date: Fri, 12 Mar 2010 10:21:49 -0800 (PST)
Message-ID: <20100312182149.B89A41300A9@annarchy.freedesktop.org>
References: <bug-26800-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-26800-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=26800





--- Comment #12 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-03-12 10:21:48 PST ---
Created an attachment (id=34006)
 --> (http://bugs.freedesktop.org/attachment.cgi?id=34006)
nv67_tvdac_load_2.patch

(In reply to comment #11)
> (In reply to comment #10)
> > Is the TV detected properly when it's plugged in? In particular 'xrandr --prop
> > |grep subconnector' should tell you the right connector type after you've
> > plugged it in (Composite I guess).
> > 
> 
> It looks like it. Booting with the TV hooked in, it chooses the lower default
> resolution it was using before your patch. The output from 'xrandr --prop |
> grep subconnector' was:
> 
>         subconnector:   SCART
>         select subconnector:    Automatic
> 

Does the attached patch have the same effect?

>[...]
> 
> The TV-out doesn't actually show anything, but I imagine that is to be expected
> according to the status matrix.
> 

Actually it's a bit unexpected, TV-out is supposed to work on all the nv40-like
cards, but I think you're the first one to try it on an nv6x. Sadly the
mmiotrace you sent seems to be incomplete: Are you sure you waited long enough
before giving up? X often takes quite a while to start up when you're
mmiotracing, up to several minutes.

> -Andy
> 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
