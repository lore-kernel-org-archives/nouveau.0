From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Nvidia GT450M
Date: Tue, 19 Apr 2011 20:58:10 +1000
Message-ID: <1303210694.6174.0.camel@nisroch>
References: <BANLkTinPx2y-7YZxg6amLvVsaPgaVY2x5w@mail.gmail.com>
	<1303165988.3453.0.camel@nisroch>
	<BANLkTikgjUfmtAHUqs08cT=G7koGTvW21Q@mail.gmail.com>
Reply-To: skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <BANLkTikgjUfmtAHUqs08cT=G7koGTvW21Q-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marc Rios <marcrios84-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Tue, 2011-04-19 at 10:19 +0200, Marc Rios wrote:
> Hi Ben,
> 
> I know I have optimus, and we are trying a module to be able to switch
> between screens, you can check it here:
> git://github.com/awilliam/asus-switcheroo.git
> 
> I will try to get better debug and see why I get a black screen... 
> 
> This error is not significant then???
> 
Not to you having a black screen, no.  Can you post your *full* dmesg
output after you've tried to load nouveau?

Ben.
> Thanks
> --
> Marc Rios
> 
> 
> 
> 
> On Tue, Apr 19, 2011 at 12:33 AM, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> wrote:
>         
>         On Mon, 2011-04-18 at 21:17 +0200, Marc Rios wrote:
>         > Hi,
>         >
>         > I supose this has been reported yet, but I have not find it.
>         >
>         > I have recently bought a new laptop (ASUS N53S) with nvidia
>         card 450M.
>         > When I load the nouveau module I get this error in dmesg:
>         >
>         > [  117.724465] [drm] nouveau 0000:01:00.0: PGRAPH:
>         unsupported
>         > chipset, please report!
>         > [  117.724593] [drm] nouveau 0000:01:00.0: PGRAPH: unknown
>         config:
>         > 2/0/0/0, 1
>         > [  117.727225] [drm] nouveau 0000:01:00.0: failed to load
>         fuc409d
>         >
>         > I think you may find it interesting. If I try to switch to
>         nvidia card
>         > I get a black screen. I supose, can be caused by this
>         error...
>         
>         This error wouldn't get you a black screen.  However, I'd say
>         you've
>         probably got an Optimus laptop, which means you're out of
>         luck.  Only
>         the intel GPU is physically wired up to the display..
>         
>         Ben.
>         
>         >
>         > Regards,
>         >
>         > --
>         > Marc Rios
>         >
>         >
>         > _______________________________________________
>         > Nouveau mailing list
>         > Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>         > http://lists.freedesktop.org/mailman/listinfo/nouveau
>         
>         
> 
