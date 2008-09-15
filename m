From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: report almost a success with Randr1.2 on NV50
Date: Mon, 15 Sep 2008 16:30:45 +0200
Message-ID: <6d4bc9fc0809150730u1c3737d1kfbae26ce76e01cd4@mail.gmail.com>
References: <48CE5F5C.8000302@free.fr>
	<6d4bc9fc0809150649w651de5d0q55a26356f34192e8@mail.gmail.com>
	<48CE6EB0.2010204@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <48CE6EB0.2010204-GANU6spQydw@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Herv=E9_Cauwelier?= <herve.cauwelier-GANU6spQydw@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Mon, Sep 15, 2008 at 4:18 PM, Herv=E9 Cauwelier
<herve.cauwelier-GANU6spQydw@public.gmane.org> wrote:
> Maarten Maathuis a =E9crit :
>> Maybe share a xorg log and your xorg.conf, so we can know what kind of
>> problem it is (that's causing your native res not to show up).
>
> The xorg logs: http://pastebin.ca/1203355
> The xorg.conf: http://pastebin.ca/1203356
>
> Don't pay attention to the "EXAOptimizeMigration" option, I've just
> added it to try at next reboot.
>
> The VGA-1 is a 1600x1200 LCD, a real 4/3 not a widescreen.
>
> The LVDS-0 is my 1280x800 laptop panel.
>
> Thanks for taking care,
>
> Herv=E9
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

Is this log of the attempt to connect the vga, as i cannot find it in the l=
og?

I can say now that you should remove these lines:

HorizSync       28.0-64.0
VertRefresh     43.0-60.0

Unless you are very sure you need them, otherwise they limit the modes
that are accepted.

btw, KMS is autodetected, the option doesn't exist anymore.

Maarten.
