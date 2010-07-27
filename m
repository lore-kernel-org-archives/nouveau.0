From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: nvfx
Date: Tue, 27 Jul 2010 18:53:05 +0200
Message-ID: <20100727185305.d39feb83.mandin.patrice@orange.fr>
References: <AANLkTinqWb6nC0fcFU_kWmDs4fmGTxudmuN-GSmQjFlu@mail.gmail.com>
	<AANLkTimX_IgQ0eZvNYrVE_0lyiDv6vqQ7D7WUqyBZIlp@mail.gmail.com>
	<20100618180509.23f24f1b.mandin.patrice@orange.fr>
	<AANLkTilelUM7VKRRLs9Ep4Ewn00mJvKoKqeWkyZt-0h2@mail.gmail.com>
	<20100723190133.9e3e7320.mandin.patrice@orange.fr>
	<AANLkTimf0B66ErpPHLy9cKCZ9f+4DOLpATwHxWrbjC0C@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTimf0B66ErpPHLy9cKCZ9f+4DOLpATwHxWrbjC0C-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org>
Cc: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Le Sat, 24 Jul 2010 15:34:06 +0200
Luca Barbieri <luca-Ukmtq+NC3rhBHFWNQifrYwC/G2K4zDHf@public.gmane.org> a =E9crit:

> I got busy with other things and then essentially lost interest;
> furthermore, my nv40 is not even working right now.
> =

> As for the code, sure, feel free to make it work and merge it :)
> The new temporary code did indeed screw things up, and I think it also
> had other stuff mixed in that I didn't factor out.
> However, the old temporary code is wrong because the temporary is
> per-surface, while it should be attached to the resource, so that
> multiple surfaces, and direct use of the resource itself, works
> properly.
> =

> nv40 should support having mismatching color/depth as long as both are
> linear and not swizzled.
> I'm not sure if that is the case on nv30 or if there the restriction
> applies to both cases.
> =

> There are also two branches starting with "RFC" in mesa git that add
> correct nv30 ARB_texture_rectangle and correct glsl support, which
> require minor Gallium changes but for which IIRC I never got answers
> back from Gallium maintainers.
> =

> There should also be code in other branches to add control flow for
> nv40 fragment programs (and perhaps other features I don't remember
> right now).

Hello Luca,

Happy to get some news from you, and a bit sad you can not continue to
work on it.

Thanks for this report. At last, we know in which state is the work you
left.

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
