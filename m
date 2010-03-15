From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50 mouse cursor disappears hourly
Date: Mon, 15 Mar 2010 20:25:22 +0100
Message-ID: <b67489df1003151225j54616bf6kefc9962d68f64bcf@mail.gmail.com>
References: <201003111530.01357.brian@derocher.org>
	<b67489df1003140137s3e8a5a91u4d76241777b5d812@mail.gmail.com>
	<201003151451.11546.brian@derocher.org>
	<b67489df1003151215w517a5766qff796733d5bc36b8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <b67489df1003151215w517a5766qff796733d5bc36b8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Brian DeRocher <brian-TeWftVRA/bxg9hUCZPvPmw@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

2010/3/15 Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
>
> Since 2010-02-17 is right after the ABI break, this should not cause
> any problems, so I would just move back to this older kernel first
> with git checkout and check for some period that it indeed works.
> And if it does work, start a bisection between these two dates.
>
> Looking back at this commit range, there is the nv50 ctxprog right in
> the middle.
> So maybe it would be a good idea to try this nouveau module parameter fir=
st :
> parm: =A0 =A0 =A0 =A0 =A0 ctxfw:Use external firmware blob for grctx init=
 (NV40) (int)
>
> (it seems the param description needs an update for NV50 ;) )
>

I should always ask first people who know better :)

20:19 < mwk> shining: fwiw, ctxprog generator shouldn't be the one
causing cursor screwups
20:19 < mwk> it deals with entirely different area of card
20:19 < mwk> ctxprog =3D=3D PGRAPH, cursor =3D=3D PDISPLAY
20:19 < mwk> evoch =3D=3D PDISPLAY too
