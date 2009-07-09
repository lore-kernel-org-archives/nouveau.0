From: Eric Valette <eric.valette-GANU6spQydw@public.gmane.org>
Subject: Re: When will nouveau kernel tree be merged into master
Date: Thu, 09 Jul 2009 21:51:23 +0200
Message-ID: <4A564A3B.1050905@free.fr>
References: <4A55DBDD.6030703@Free.fr>	<20090709193053.5a5d6430@daedalus.pq.iki.fi>	<4A5626F6.4090607@free.fr>
	<20090709205154.4f613cc5@daedalus.pq.iki.fi>
Reply-To: eric.valette-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090709205154.4f613cc5-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, dri-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
List-Id: nouveau.vger.kernel.org

Pekka Paalanen wrote:
> Sorry for causing that much trouble.
> 
> On Thu, 09 Jul 2009 19:20:54 +0200
> Eric Valette <eric.valette-GANU6spQydw@public.gmane.org> wrote:
> 
>> Well I would suggest you to look at GALLIUM3D because using gi to clone
>> mesa master is not even working and even if you get a git snapshot it
>> does not build.
> 
> http://nouveau.freedesktop.org/wiki/GalliumHowto
> Is there something unclear here?

The command
git clone git://anongit.freedesktop.org/git/mesa/mesa

Does not work for me while others do. It hangs indefinitely (I let it
run once half a day, doing strace to see that I was waiting to a read on
a socket).


> Also, I'd recommend studying git, you only ever have to 'clone' once.

If the full clone requires a day on 1Mbit sped, I guess you will have
few volunteers.

> Receiving updates is a lot faster.

I tool you in the first mail, I use drm git, xf86-video-nouveau git and
you still suggest I should learn how to use git? In my kernel udate
script I have git fetch ; git rebase origin for several trees. I ommited
mesa because of the bug


>  InstallDRM has the instructions, since
> the kernel tree is so big, but there are more than one way to pull updates.

I do not mind you use a whole kernel tree provide you provide automated
way to extract diff compared to the kernel you pull in. I've found the
tarball already but will rather extract the whole code and modify my
rather complex kernel update script to move original drm directory back
and forth for the sake of using still using ketchup, drm git update
xf86-video-nouveau git update  and regular kernel patching way.

-- eric
