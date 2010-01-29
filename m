From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: swap control
Date: Fri, 29 Jan 2010 10:07:08 +0100
Message-ID: <b67489df1001290107v43d29388paaa7f1d939d16073@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Is it possible to use sync to vblank / swap control with mesa/gallium
(and nouveau) ?
I googled it but did not find any clear answers about how it is
supposed to be enabled.
I also tried to read the code, and I am getting lost. So I didn't find
any answers to any of these questions :
1) how are we supposed to enable it ? is there an env var , or
~/.drirc ? is drirc/driconf still valid with dri2 ?
2) is it supported by mesa/gallium ? and nouveau ?

It looks like there were some related changes with dri2.2 but that
might not concern SGI/MESA swap_control extensions.
http://lists.x.org/archives/xorg-devel/2009-October/003209.html

Anyway when running progs/xdemos/glxswapcontrol with softpipe, I get
the following message :
Unable to set swap-interval.  Neither GLX_SGI_swap_control nor
GLX_MESA_swap_control are supported.

And I do not get when using nouveau, so it seems these extensions are
announced but not supported.

Another mystery : right after the dri2.2 merge, running glxgears
showed the following bogus message :
Running synchronized to the vertical refresh.  The framerate should be
approximately 1/12400064 the monitor refresh rate.
4843 frames in 5.0 seconds = 968.573 FPS

Again I tried to read the code when it happened but I didn't find
anything. And the message went away soon after, but I don't know when
and why. Probably during one of the regular mesa update.. but I
couldn't find which patch fixed it.
