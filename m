From: Brian DeRocher <brian-TeWftVRA/bxg9hUCZPvPmw@public.gmane.org>
Subject: Re: nv50 mouse cursor disappears hourly
Date: Tue, 16 Mar 2010 17:52:11 -0400
Message-ID: <201003161752.11685.brian@derocher.org>
References: <201003111530.01357.brian@derocher.org>
	<201003151451.11546.brian@derocher.org>
	<b67489df1003151215w517a5766qff796733d5bc36b8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1003151215w517a5766qff796733d5bc36b8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
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

I started with this, 

git bisect start
git bisect good a8072c2a92a13511e28edbec015b58c6b66c35c9
bit bisect bad master
git reset -hard a8072c2a92a13511e28edbec015b58c6b66c35c9
# oops i really wanted this
git reset --hard a733b93582023fd100c5ce6430f3a0b0f26af86c

built that kernel, install, reboot

Here's a summary.

2009-12-08 a8072c2a92a13511e28edbec015b58c6b66c35c9 I could not compile the stack.

> > a8072c2a92a13511e28edbec015b58c6b66c35c9 a733b93582023fd100c5ce6430f3a0b0f26af86c
> >  root <root-qh82uKLjDaOJy/xUX+eaekB+6BGkLq7r@public.gmane.org> 1266534758 -0500      pull : Fast-forward

2010-02-17 a733b93582023fd100c5ce6430f3a0b0f26af86c is marked as bad.  Therefor i can't *really* say this is a regression.

But this confuses me.  I was running a733b93582023fd100c5ce6430f3a0b0f26af86c for about 8 work days (mon-fri) and never saw the bug.  Is it possible that the bug is not in the kernel?  What's the next package i should re-compile, nouveau-drm or xserver-xorg-video-nouveau?

Here's the action that caused the mouse to disappear last time.  In a konsole terminal i 

(1) typed "dpkg -i "
(2) double clicked on "linux-headers-2.6.32-nouveau.git_nouveau.1280_amd64.deb"
(3) middle mouse clicked to paste it
(4) typed " "
(5) double clicked on "linux-image-2.6.32-nouveau.git_nouveau.1280_amd64.deb"
(6) the cursor was gone.

Funny.  I had already marked a733 as good, and compiled the next kernel 128022241f068271f0fc937edf9ed22ffbac3d77.  When i was one keystroke away from installing it, a733 failed.

I've tried very hard to reproduce this issue according to the steps above with several variations, but can't.  I've tried middle mouse clicking in the window and dragging it outside the window, cutting and pasting very fast, very slow, repeatedly 20 times, bringing another window to focus between cut and paste.  But nothing will reproduce it.

thanks,
Brian

--
http://brian.derocher.org
