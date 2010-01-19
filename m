From: Johannes Obermayr <johannesobermayr-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: OpenSUSE packages
Date: Tue, 19 Jan 2010 20:45:33 +0100
Message-ID: <201001192045.34421.johannesobermayr@gmx.de>
References: <8b96e3d21001190814h63283407ne7cec8694f2d1a86@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8b96e3d21001190814h63283407ne7cec8694f2d1a86-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Am Dienstag, 19. Januar 2010 17:14:46 schrieb Luiz Angelo Daros de Luca:
> Hello guys,
> 
> Nouveau's OpenSUSE Build packages have broken dependences. It seems that now
> it demands xorg>=7.5 but the avaiable in opensuse 11.2 (current version) is
> 7.4. As there is no xorg-7.5 compiled for 11.2, I'm running vesa driver by
> now.
> 
> I guess that a hint on download page could be useful.
> 
> Cheers,
> 
> ---
>     Luiz Angelo Daros de Luca, Me.
>            luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
> 
Hi Luiz,

sorry for answerring so late (I was at work ...).

You have to include additional repository:

http://download.opensuse.org/repositories/X11:/XOrg/openSUSE_11.2/

Then it should work again ...


I updated:

- http://de.opensuse.org/Nouveau
- http://nouveau.freedesktop.org/wiki/openSUSEPackages
- https://features.opensuse.org/307588


It is not wanted that I integrate the packages direct in my repository:
http://lists.opensuse.org/opensuse-buildservice/2009-09/msg00114.html


@News/wiki specialists: Can you please announce the change in news feed? I do not know how to do this ...

Thanks
Johannes
