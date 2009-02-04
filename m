From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nouveau xorg.conf documentation
Date: Wed, 4 Feb 2009 16:16:05 +0100
Message-ID: <6d4bc9fc0902040716x3a956eacwf59330f4b4bd03d4@mail.gmail.com>
References: <4989A970.2010503@seiner.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4989A970.2010503-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org>
Cc: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, Feb 4, 2009 at 3:42 PM, Yan Seiner <yan-6T0/PJfuvIjQT0dZR+AlfA@public.gmane.org> wrote:
> I'm trying to get started with nouveau.  I have it compiled, I have it
> installed, but I'm having trouble working out the xorg.conf file.
>
> My system has 3 video cards; one is a single DVI out, two are dual DVI
> out. From the messages in the xorg log files, nouveau expects config for
> DVI-I-0 and DVI-I-1, and so on.  Going from the nvidia blob is not as
> easy as changing nvidia to nouveau; all of the options are different and
> the structure of the file is different.
>
> Can someone who has a working nouveau xorg.conf with multiple cards and
> dual DVI cards please put this on on the wiki?  The wiki is really short
> of info for casual user/developers like me.  My time and knowledge are
> limited so any help I get is greatly appreciated.
>
> Thanks,
>
> --Yan
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

All randr-1.2+ drivers are incapable of doing the xinerama style
multihead, until someone writes the needed xorg code.

If you want a protocol screen per card, then that should be possible,
minus possible nouveau bugs. Few people actually have a multi card
setup, so a standard config isn't really available.

You can try using this howto
"http://wiki.debian.org/XStrikeForce/HowToRandR12" and expand it to
two (protocol) screens in your xorg.conf

Maarten.
