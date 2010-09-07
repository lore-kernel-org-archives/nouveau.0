From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 29810] Blank screen on nouveau module load
Date: Tue,  7 Sep 2010 06:40:37 -0700 (PDT)
Message-ID: <20100907134038.99AFA1300C0@annarchy.freedesktop.org>
References: <bug-29810-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-29810-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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

https://bugs.freedesktop.org/show_bug.cgi?id=29810

--- Comment #24 from Zoltan Varnagy <doi-Y8qEzhMunLyT9ig0jae3mg@public.gmane.org> 2010-09-07 06:40:37 PDT ---
(In reply to comment #23)
> (In reply to comment #22)
> > Well it went worse. This time the screen remains blank and the nouveau module
> > is loaded. So i think i will stay at the previous solution. 
> > 
> Did you have "video=VGA-1:e" in your kernel command line? If you did please try
> without.

I tried without that as well but it still shows black screen. Should i post a
register dump? 

> > Finally i compiled and tried the 2.6.36 kernel and the DDX driver and managed
> > to start X with nouveau.
> 
> Where did you get that kernel from? The nouveau kernel tree or Linus' tree?

I did it with git as written at 
http://nouveau.freedesktop.org/wiki/DebianInstall
The only thing i have not compiled was libdrm as the debian 2.4.21 version
seemed new enough. 

> > Although it seems to be slower than the nv driver.
> > glxgears dropped to 50 from 150, it uses software rendering for opengl and hung
> > the machine on video load. I wonder if these can get better.
> It uses software rendering because you haven't installed the 3D driver (try it
> at your own risk, it's still unsupported).

Hmm, okay, thanks maybe later. Actually i just expected some speedup on xmoto
which does not use 3d as far as i know. I thought it would be faster as fast 2D
seems to be present in the nouveau feature matrix at NV10.

-- 
Configure bugmail: https://bugs.freedesktop.org/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are the assignee for the bug.
