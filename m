From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: texture layout test
Date: Thu, 19 Mar 2009 12:20:28 +0100
Message-ID: <6d4bc9fc0903190420w35c5463aj883a416b53daa0b0@mail.gmail.com>
References: <49C183DF.4020803@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49C183DF.4020803-GANU6spQydw@public.gmane.org>
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

NV84_MODE is for NV84, try setting it to zero.

I have a NV86, so i'm pretty sure it works.

Maarten.

2009/3/19 Herv=E9 Cauwelier <herve.cauwelier-GANU6spQydw@public.gmane.org>:
> I come back on this matter because I was away when you posted it.
>
> I read you've got enough feedback for NV86 cards but mine doesn't seem
> to match your assumptions:
>
> [...]
> x 197 y 151
> offset 38734 offset_expected 38478
> x 198 y 151
> offset 38735 offset_expected 38479
> [...]
>
> I didn't touch the source code, so it's in NV84_MODE.
>
> The complete output is available at http://pastebin.ca/1364759
>
> The other program nv9x_special "map fails", just for the completeness.
>
> Herv=E9
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
