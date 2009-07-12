From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: DRM from git not building properly
Date: Sun, 12 Jul 2009 22:37:31 +0300
Message-ID: <20090712223731.767bbc28@daedalus.pq.iki.fi>
References: <bug-22525-502@http.bugs.freedesktop.org/>
	<20090712184315.1931313005B@annarchy.freedesktop.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20090712184315.1931313005B-4GnqB8vgsbnwRzGw0Gvu8Q/tdpCO6/zZ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 12 Jul 2009 11:43:15 -0700 (PDT)
bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org wrote:

> http://bugs.freedesktop.org/show_bug.cgi?id=22525
> 
> --- Comment #5 from Steven Ward <STEVENWARD666-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>  2009-07-12 11:43:13 PST ---
> Hi there,
>         I am sorry about that,I shouldn't have added this new problem to this
> bug report.I have had some success in the past to get the all three pieces of
> source code"working"(all thanks to the developers advice and doing a lot of
> browsing and forum posting)I'm getting the impression that the A.T.I and
> Nouveau code seems to be "forking"(i.e,going their separate ways)and I think
> that it is a shame .I can pull out my current Nvidia card and replace it with
> my very old A.T.I 9,200(Rv 280?) and use that instead,but that maybe more
> hassle than it could be worth.
> 
> I wish I knew about C++ and the inner workings of the stack,but I think that
> would be too much of a steep learning curve.
> 
> I'd like to thank you very much for your help anyway.

What do you mean by "forking" in this case? How are we separating?

All "major" drivers (intel, radeon, nouveau) have their separate places for
DRM development, and merge in Airlied's kernel tree for sending upstream to
Linus. Well, not yet Nouveau, but in the future.

Recently Nouveau development has been concentrating on 2D and DRM kernel
modules, aiming eventually for the inclusion of Nouveau DRM in the mainline
kernel. It also happens that 3D support has got less attention. I'm sure
attention will shift to 3D once Nouveau is in mainline as a mature driver
(the DRM part).

Nouveau 3D has never yet been said to be supported. 2D on the other hand is,
it should work, and we would like to hear about any problems with the three
components: the DRM modules, libdrm and libdrm_nouveau, and the DDX.

Btw. you want C, C++ is not too useful ;-)


Thanks.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
