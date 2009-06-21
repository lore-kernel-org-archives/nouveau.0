From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: External monitor is blank with nouveau driver
Date: Sun, 21 Jun 2009 11:56:50 -0400
Message-ID: <586c2acd0906210856v4af3e719na6ac9f669c7bc47c@mail.gmail.com>
References: <4A3D0D7A.2040105@irbisnet.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A3D0D7A.2040105-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Andriy Bakay <andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Jun 20, 2009 at 12:25 PM, Andriy Bakay<andriy-Ru+gAU1lvYpWk0Htik3J/w@public.gmane.org> wrote:
> Hi Nouveau Team,
>
> I have the following hardware/software spec:
>
> ThinkPad T61
> FreeBSD 7.1-RELEASE-p5 amd64
> NVIDIA Quadro NVS 140M
> X driver nouveau
> External monitor NEC MultiSync 90GX2
>
> I am connecting external monitor through VGA interface. I was able to
> detect it using command 'xrandr -q' and even turn it on:
>
> $ xrandr --output VGA-0 --auto --below LVDS-0
>
> the geometry of my desktop changed, but monitor remain blank.
>
> Please, advise.
>
> Thanks,
> Andriy

Why don't you show us what's in your xorg log?
