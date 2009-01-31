From: Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Subject: Re: git compile failure
Date: Sat, 31 Jan 2009 15:52:53 -0800
Message-ID: <4984E455.4070701@seiner.com>
References: <141d1c48884ed68f7e91236a287d48a9.squirrel@www.datavault.us>	<20090129231559.302a708e@daedalus.pq.iki.fi>	<49830BB2.2040602@seiner.com>
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
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pekka Paalanen wrote:
> On Fri, 30 Jan 2009 06:16:18 -0800
> Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
>
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
>>     
>
> Could you provide some basic information, like which Debian you are using
> and which Xorg version you have?
>
> I trust you already saw
> http://nouveau.freedesktop.org/wiki/DebianTips
> and it didn't help?
>
> I asked on IRC, and two Debian users replied saying they don't have the
> problem (unstable+experimental, and Lenny).
>
>   
OK, I finally got a couple of solid hours to figure out what's going 
on.  Seems that the code I got from git assumes that all of the xorg 
header files are in the src dir - but they don't get pulled in.  Copying 
stuff over just didn't work.  I went ahead fixed all of that to where it 
would pull in the header files from the correct dirs for debian lenny.

A git-diff is at http://www.seiner.com/debian-nouveau.diff

Let me know if this is useful.  I can either post it on the wiki or 
submit a bug report.

nouveau_drv.so built OK; the man page build crashed with

Making all in man
make[2]: Entering directory `/usr/src/nouveau/xf86-video-nouveau/man'
make[2]: *** No rule to make target `nouveau.@DRIVER_MAN_SUFFIX@', 
needed by `all-am'.  Stop.
make[2]: Leaving directory `/usr/src/nouveau/xf86-video-nouveau/man'
make[1]: *** [all-recursive] Error 1
make[1]: Leaving directory `/usr/src/nouveau/xf86-video-nouveau'


--Yan
