From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: GPU Temperature?
Date: Sun, 13 Dec 2009 12:56:30 -0500
Message-ID: <586c2acd0912130956iefbebx97d9a1f6617052c0@mail.gmail.com>
References: <4B25214C.4030303@chaoslayer.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B25214C.4030303-gfoo8dC7XAXddJNmlsFzeA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ancoron Luciferis <ancoron-gfoo8dC7XAXddJNmlsFzeA@public.gmane.org>
Cc: Nouveau Mailing List <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Dec 13, 2009 at 12:15 PM, Ancoron Luciferis
<ancoron-gfoo8dC7XAXddJNmlsFzeA@public.gmane.org> wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Hi there,
>
> I just wondered if there is an open-source way of getting information
> about the temperatures provided by the internal sensors. I've read that
> nvclock is providing such information but only if the binary driver is
> installed and used.
>
> When I run 'sensors-detect' is see three adapters provided through nouveau:
>
> ...
> Next adapter: nouveau-0000:01:00.0-2 (i2c-0)
> ...
> Next adapter: nouveau-0000:01:00.0-0 (i2c-1)
> ...
> Next adapter: nouveau-0000:01:00.0-1 (i2c-2)
> ...
>
> This is on an old Dell Inspiron 8600 notebook with an nVidia GeforceFX
> Go 5200 64M.
>
>
> Thanx for info on this and please keep up the good work on this driver,
>
> Ancoron

Matthew Garrett has some code for this, although I don't know if it's
been committed yet. I think it's still limited to some cards anyway.
Eventually we will be able to do this I hope.
