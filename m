From: Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org>
Subject: Re: "enable ctxprog xfer only when we need it to save
 power" introduces big performance regression
Date: Thu, 10 Nov 2011 08:10:44 +0100
Message-ID: <4EBB78F4.2020902@ensi-bourges.fr>
References: <20111029170801.GA3219@joi.lan> <20111029172923.GA3110@joi.lan>
	<20111029190938.GA3105@joi.lan> <20111109221009.GD3402@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"; Format="flowed"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20111109221009.GD3402-OI9uyE9O0yo@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le 09/11/2011 23:10, Marcin Slusarz a =E9crit :
> For anyone who don't read IRC logs - it turns out it regressed only on =

> my box, because I have page flipping disabled (due to page flipping =

> being very buggy here, see =

> https://bugs.freedesktop.org/show_bug.cgi?id=3D42398), which forces gpu =

> context switch on every frame - even with (OpenGL) full screen apps. =

> And this patch slows down context switches. So, can we disable xfers =

> in ctxprog only when page flipping is enabled? Or is there any other =

> option? Marcin =

Hmm, it isn't logical yet. To test for performance regression, I =

launched the well known context switch test that is glxgears and only =

found a performance decrease of 1%.

I'll test with pageflip disabled though and see for myself.

Anyway, we'll do something about it. I just hope that most cards don't =

have this problem. This is clearly an hw regression.

Martin
