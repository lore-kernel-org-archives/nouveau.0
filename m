From: "Yan Seiner" <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Subject: Re: git compile failure
Date: Fri, 30 Jan 2009 16:19:36 -0800 (PST)
Message-ID: <f96023015b0728e6e1df3f48b0cb8ce9.squirrel@www.datavault.us>
References: <141d1c48884ed68f7e91236a287d48a9.squirrel@www.datavault.us>
	<20090129231559.302a708e@daedalus.pq.iki.fi>
	<49830BB2.2040602@seiner.com>
	<20090130195749.4f03acb2@daedalus.pq.iki.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090130195749.4f03acb2-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, January 30, 2009 9:57 am, Pekka Paalanen wrote:
> On Fri, 30 Jan 2009 06:16:18 -0800
> Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
>
>> OK, I've tried that....  No joy.  The problem is that the autogen script
>> doesn't find any of the correct header files.  It's a debian dependency
>> issue.  Even when I edit the source by hand to put in the correct
>> locations, it still fails.  I think I'm wasting a lot of time trying to
>> reverse-engineer the debian deps rather than building nouveau.  Is there
>> a 'getting started' howto for building X?  I only need the very basics
>> for testing nouveau.  Is there some basic basic script that will pull
>> down the tarballs and allow me to install a minimal xorg for testing
>> nouveau?

First of all, thanks for all your help.  I really appreciate this.

>
> Could you provide some basic information, like which Debian you are using
> and which Xorg version you have?

It's unstable/experimental.


yan@selene:~$ dpkg --list | grep xorg | grep ii | awk '{print $2 " " $3}'
xorg 1:7.4~5
xorg-dev 1:7.4~5
xorg-docs 1:1.4-4
xserver-xorg 1:7.4~5
xserver-xorg-core 2:1.5.99.901-2
xserver-xorg-dev 2:1.5.99.901-2
xserver-xorg-input-evdev 1:2.1.1-1
xserver-xorg-video-apm 1:1.2.1-1
xserver-xorg-video-ark 1:0.7.1-1
xserver-xorg-video-chips 1:1.2.1-1
xserver-xorg-video-cirrus 1:1.2.1-3
xserver-xorg-video-intel 2:2.6.1-1
xserver-xorg-video-radeon 1:6.10.0-2
xserver-xorg-video-vesa 1:2.1.0-1

>
> I trust you already saw
> http://nouveau.freedesktop.org/wiki/DebianTips
> and it didn't help?

I've been all through that; I've even wiped out all my xorg debs and
reinstalled just to make sure.

>
> I asked on IRC, and two Debian users replied saying they don't have the
> problem (unstable+experimental, and Lenny).

What appears to be happening is that NOUVEAU_PRIVATE is #defined as
_X_HIDDEN, which is #defined in /usr/include/X11/Xfuncproto.h.  For
whatever reason, autogen.sh is not picking up any of the header files in
/usr/include.

If I try to follow the directions in DebianTips, the compile fails because
it cannot find the definition of _X_HIDDEN.

It's a header file misconfiguration somewhere on my system, I guess.

--Yan

-- 
  o__
  ,>/'_          o__
  (_)\(_)        ,>/'_        o__
Yan Seiner      (_)\(_)       ,>/'_     o__
       Personal Trainer      (_)\(_)    ,>/'_        o__
             Professional Engineer     (_)\(_)       ,>/'_
Who says engineers have to be pencil necked geeks?  (_)\(_)

You are an adult when you realize that everyone's an idiot sometimes. You
are wise when you include yourself.
