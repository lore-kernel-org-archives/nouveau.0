From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Problems with nouveau driver in Ubuntu 18.04
Date: Sat, 29 Feb 2020 15:25:05 -0500
Message-ID: <CAKb7UvgpgsmddaVwSxF8mWhyPyOxZ9JxCG10hNXU=9UGEbvNwQ@mail.gmail.com>
References: <AM6PR09MB3447992A0A96D6377F7B9CF8FBEB0@AM6PR09MB3447.eurprd09.prod.outlook.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AM6PR09MB3447992A0A96D6377F7B9CF8FBEB0-BMP/HIh3pkoGtiHWy8bydaF+KQg4AgVRvxpqHgZTriW3zl9H0oFU5g@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Juan Manuel Alvarez <alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Can you try to figure out what was updated in the latest updates? My
guess would be that it's actually the software used to display your
desktop/etc which changed.

You can disable all accel by booting with nouveau.noaccel=1.

Cheers,

  -ilia

On Sat, Feb 29, 2020 at 12:31 AM Juan Manuel Alvarez
<alvarez_juanma-PkbjNfxxIARBDgjK7y7TUQ@public.gmane.org> wrote:
>
> Hello,
>
>
> I use Ubuntu 18.04, since one of the last upgrades I have problems with nouveau drivers.
>
> My screen look like the picture atteched.
>
>
>  [~]$ uname -a
> Linux  5.3.0-40-generic #32~18.04.1-Ubuntu SMP Mon Feb 3 14:05:59 UTC 2020 x86_64 x86_64 x86_64 GNU/Linux
>
> [~]$ inxi -Gx
> Graphics:  Card: NVIDIA G71GL [Quadro FX 1500] bus-ID: 01:00.0
>            Display Server: x11 (X.Org 1.20.5 ) driver: nouveau Resolution: 1920x1080-qEAkLYPErqw@public.gmane.org, 1920x1080-qEAkLYPErqw@public.gmane.org
>            OpenGL: renderer: NV49 version: 2.1 Mesa 19.2.8 Direct Render: Yes
>
> I have tried to install Nvidia driver 304.137, but it seems is not supported in Ubuntu 18.04 anymore.
>
>
> Are there any nouveau upgrade (that it is not on Canonical) that fixes this problem?
>
> Or how I can downgrade nouveau driver to any previous one that works fine in ubuntu 18.04 with my graphics card?
>
>
> Regards!
>
> Juanma
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
