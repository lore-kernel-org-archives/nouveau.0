From: Eric Valette <eric.valette-GANU6spQydw@public.gmane.org>
Subject: Re: When will nouveau kernel tree be merged into master
Date: Thu, 09 Jul 2009 19:20:54 +0200
Message-ID: <4A5626F6.4090607@free.fr>
References: <4A55DBDD.6030703@Free.fr>
	<20090709193053.5a5d6430@daedalus.pq.iki.fi>
Reply-To: eric.valette-GANU6spQydw@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090709193053.5a5d6430-cxYvVS3buNOdIgDiPM52R8c4bpwCjbIv@public.gmane.org>
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
> On Thu, 09 Jul 2009 14:00:29 +0200
> Eric Valette <Eric.Valette-rC/V9kRXU7Q@public.gmane.org> wrote:
> 
>> I've been using nouveau driveau for 8 months or so, using automated
>> build from drm git, xf86-video-nouveau git and even sometimes mesa drm
>> git  and discovered the linux-core build did not build the nouveau
>> driver the hard way: X was refusing to start as the nouveau.ko modules
>> was not loaded nor build. Build process did chnage without obvious way
>> to know womething was wrong.
> 
> Nouveau was removed from make targets, therefore you get this:
> 
> $ make nouveau.o
> make: *** No rule to make target `nouveau.o'.  Stop.

Except this is not the way you build linux-core by default...

If you follow the Makefile and make DRM_MODULES=nouveau compilation
fails without telling you this is no more the right way.


> Btw. Nouveau should fall back to NoAccel mode, if the kernel modules are
> not available.

Not in my case. KDM simply does not start.

>> So my question are:
>>     - Why not purely delete nouveau files from linux-core and issue
>> error messages?
> 
> The code is still in the tree for historical reference, and for BSDs.
> I'm not sure if BSDs still need it.

Not a convincing agument!. I wasted a few hours trying to find how to
compile it.


> Yes, and we are trying to alleviate the pain by keeping the guides
> in the wiki up-to-date. Granted, there were the few days, when drm.git
> nouveau.ko build was broken, and the InstallDRM page was not written
> yet, nor InstallNouveau updated. IIRC that was less than a week.

Well I would suggest you to look at GALLIUM3D because using gi to clone
mesa master is not even working and even if you get a git snapshot it
does not build.


> The nouveau kernel tree was annouced on the wiki front page, and on
> the nouveau mailing list. What more should we have done?

I guess I would have done:
	- when configuring drm with the nouveau API, I would have issued a
warning that linux-core will no more build nouveau.ko
	- I would have purely removed the code now that it is no more used or
at least issed an error if DRM_MODULE was containing "nouveau"

-- eric
