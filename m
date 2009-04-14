From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 21186] nouveau very slow with screen size > 1680
Date: Tue, 14 Apr 2009 15:53:27 -0700 (PDT)
Message-ID: <20090414225327.1881F130016@annarchy.freedesktop.org>
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





--- Comment #3 from Gaetano Canepa <gaetano.canepa-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>  2009-04-14 15:53:26 PST ---
(In reply to comment #1)
> Can you also provide your Xorg.0.log?
> 
> If I understand you correctly the problem is with mplayer and video that is
> scaled larger than the native size? Or are most of the applications also
> slower? What happens at lower resolutions like 1024x786?
> 

Thank you for the quick answer.

I provided Xorg.0.log now: sorry It's my first time ;-)

Speed: with NVIDIA driver (before it freezes) glxgears give something like 1900
frame/s!
nouveau (and nv) give approx 193 fr/s for the same window dimension.

If I change the resolution to 1024x786 mplayer does not stop (when fullscreen)
but still have some imperfections in the images.

If you tell me how to check video performances in a better way I can try them.
My impression is that it is always slow (even when it creates the desktop).
Anyway, nv is able to run full screen video at the maximum resolution even if
the glxgears performances are comparable with nouveau (direct pixel renering
problems?)


-- 
Configure bugmail: http://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
