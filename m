From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 26800] Nouveau TV-out incorrectly detecting load
Date: Thu, 11 Mar 2010 12:21:34 -0800 (PST)
Message-ID: <20100311202134.6A7D61300DF@annarchy.freedesktop.org>
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





--- Comment #10 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2010-03-11 12:21:33 PST ---
(In reply to comment #9)
> Excellent work my man. :)
> 
> Both KMS and X are defaulting to the correct resolution now, and I no longer
> get messages about a load being detected on the TV out.
> 

Is the TV detected properly when it's plugged in? In particular 'xrandr --prop
|grep subconnector' should tell you the right connector type after you've
plugged it in (Composite I guess).

> As far as vsync goes, I've done some testing with smplayer:
> 
> Using "xv (2 - NV Video Blitter)" I get decent vsync, as I did before. Not
> perfect, but decent.
> 
> Using "xv (1 - NV40 high quality adapter)" I get decent vsync, which I did NOT
> get before.
> 
> However if I use default xv, which I believe uses "xv (0 - NV40 texture
> adapter)" I still experience vsync issues.
> 
> This is problematic, because any player besides smplayer doesn't allow me to
> choose between xv outputs, and defaults to the xv output with vsync issues.
> 
> If I recall correctly, my 8800GTS didn't exhibit any vsync issues, and had
> seemingly perfect vsync.
> 
> If you'd like, I could submit another bug report about that, let me know.
> 
Yeah, that one deserves its own bug.

> Also, I couldn't help but notice you have a riseup e-mail address. I actually
> run what I describe as "a modern, rationalist, humanist, libertarian-socialist
> anarchist" site: http://anarchismtoday.org/ Just thought you might be
> interested. :)
> 
Heh, I'll check it out :)

> Thanks again for your help!
> 
> -Andy
> 


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
