From: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Bug 37284] some applications crash the x server in
 multiscreen mode
Date: Tue, 17 May 2011 17:51:20 +0100
Message-ID: <op.vvmw3uv07cbmmg@emo>
References: <bug-37284-8800@http.bugs.freedesktop.org/>
	<20110517163438.3E61B13004E@annarchy.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20110517163438.3E61B13004E-4GnqB8vgsbnwRzGw0Gvu8Q/tdpCO6/zZ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 17 May 2011 17:34:38 +0100, <bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org> wrote:

> https://bugs.freedesktop.org/show_bug.cgi?id=37284
>
> --- Comment #4 from tim blechmann <tim-xpEK/MU0Hawdnm+yROfE0A@public.gmane.org> 2011-05-17 09:34:37 PDT ---
> ...
> either it is a different issue, or it the log is not synced to disc
The above has been taken from the latest Xorg.log in the bug report and clearly
indicated that the issue was experienced using nouveau

> ...
> * run xrandr --output VGA-1 --off --output DVI-I-1 --mode 1680x1050 --pos
> 1680x0 --rotate normal --output HDMI-1 --mode 1680x1050 --pos 0x0 --rotate
> normal
you kind of missed to mentioned *anywhere* this step

> ...
> * i check the tracker of my distribution and find a related issue
* Ensure that the issue is the same as the one I'm experiensing

> ...
> * i stop using one of my crucial applications
* Or try to find a workaround
* I read the bugs section

> * i submit a bug report upstream, pointing to the downstream report
> * it initially gets `resolved' as `notourbug'
>
> i am maintaining an open source project myself. but i have never told any of my
> users that it is their problem, if my code crashes.
>
Please read the bugs section [1] and open another bug.
Thanks

[1] http://nouveau.freedesktop.org/wiki/Bugs
