From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 24820] [nv15] Vertical screen corruption in X when
 KMS is enabled
Date: Sun,  8 Nov 2009 06:09:45 -0800 (PST)
Message-ID: <20091108140945.56B3A13009C@annarchy.freedesktop.org>
References: <bug-24820-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-24820-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

http://bugs.freedesktop.org/show_bug.cgi?id=24820





--- Comment #11 from Francisco Jerez <currojerez-sGOZH3hwPm2sTnJN9+BGXg@public.gmane.org>  2009-11-08 06:09:44 PST ---
(In reply to comment #10)
> This patch helps.
> 
> Same tests as above -> all modes work...
> 

From nv15_arbitration.patch:
> -               min_clwm = 1024 - cbs + 128 * pclk_freq / 100000;
> +               min_clwm = 1024 - cbs + 8;

It would be interesting to know how high can you set that 8 without seeing any
sort of corruption. It should be something within [8,221].

> Only one thing I recognized:
> If you have 24 bit depth, KMS enabled and try changing resolution to a higher
> one within X the screen gets corrupted.
> e.g.:
> 1980x1080 -> 1280x720 -> 1024x768 -> 800x600 is possible without screen
> corruption.
> 1980x1080 -> 1280x720 -> 1920x1080 or 1980x1080 -> 1024x768 -> 1280x720 cause a
> screen corruption which can only be solved by pressing Ctrl+Alt+Backspace...
> 
Anything suspicious in the logs when that happens?


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
