From: sebastien.brennion-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
Subject: Re: backlight support
Date: Mon, 27 Jul 2009 18:46:36 +0200
Message-ID: <200907271846.36982.schmirrwurst@googlemail.com>
References: <200907232122.28084.schmirrwurst@googlemail.com>
	<6d4bc9fc0907240810q304dd344j169f0b7a1de52136@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <6d4bc9fc0907240810q304dd344j169f0b7a1de52136-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Thanks for your answer,


I use karmic, with the already packaged 0.0.14+git20090715-0ubuntu1 from =

nouveau...
I can't see any backlight information in /sys/class/backlight
Could you tell me how it is supposed to work with nouveau ? I though the =

driver would provide backlight information there??

I don't think to have a old hw, but I don't know what is old for devs... =

nVidia Corporation G86 [GeForce 8400M GT]

As I mentionned backlight problems, I didn't mean bug in relation with =

nouveau, but for example on nvnews, on launchpad, on ubuntu forums, I alrea=
dy =

spoken with a lot of people experiencing backlight problem with nvidia =

driver... I do not like so much overstatements ;)


Le Friday 24 July 2009 17:10:37, vous avez =E9crit :
> There is some support for laptop backlight control.
>
> (http://cgit.freedesktop.org/nouveau/linux-2.6/tree/drivers/gpu/drm/nouve=
au
>/nouveau_backlight.c)
>
> If you have older hw, then you may need to figure out how to control it.
>
> I see only a few bug reports related to backlights, so a lot of people
> seems like an overstatement.
>
> Maarten.
