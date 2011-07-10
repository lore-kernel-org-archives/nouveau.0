From: Martin Peres <martin.peres-GANU6spQydw@public.gmane.org>
Subject: Re: [PATCH] Enable hwmon support when both nouveau and
 hwmon are built as modules.
Date: Sun, 10 Jul 2011 17:04:45 +0200
Message-ID: <4E19BF8D.6090205@free.fr>
References: <4E10BAE4.8000506@googlemail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4E10BAE4.8000506-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le 03/07/2011 20:54, Ken Milmore a =E9crit :
> The nouveau hwmon temperature support currently only functions when hwmon=
 is
> compiled into the kernel. There's no reason why this shouldn't also work =
when
> both hwmon and nouveau are modularised (as is the case with Slackware's s=
tock
> kernels). The patch below worked for me on 2.6.38.7.
Looks good to me but I can't commit it.
>
> BTW, I notice that nouveau idles my 8600GT at around 71C, which is 18C ho=
tter
> than the Nvidia blob driver. Running some intensive OpenGL (Sauerbraten) =
caused
> the temperature to reach 85C in a few minutes. The blob rarely goes above=
 80C,
> even after extended use.
We are working on power management, it is all but simple ;)
