From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50 piglit change between 7.8 and master
Date: Tue, 18 May 2010 11:59:22 +0200
Message-ID: <AANLkTin2B3VsBuETRZJROCpnvcYDk3E5PHEXnOKQfK6O@mail.gmail.com>
References: <AANLkTilYP0j8uGJxcSui_MbjjE9mHlYYX77liQXKA9hi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTilYP0j8uGJxcSui_MbjjE9mHlYYX77liQXKA9hi-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Mon, May 17, 2010 at 2:52 PM, Xavier Chantry
<chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> 7.8 branch (533b7663) : 209/246
> master branch (c882c31) : 216/241
>
> In short :
> 8 fail/warn -> pass
> 5 fail -> skip
> 1 pass -> fail
>
> So the only regression is glean/clipFlat
> Output:
> ----------------------------------------------------------------------
> Test clipping with flat shading (provoking vertex).
>
> clipFlat: Failure for glBegin/End(GL_QUADS), glFrontFace(GL_CCW)
> =A0 =A0 =A0 =A0GL_EXT_provoking_vertex test: GL_FIRST_VERTEX_CONVENTION_E=
XT mode
> =A0 =A0 =A0 =A0Expected color (0, 1, 0) but found (1, 0, 0)
> clipFlat: =A0FAIL rgba8, db, z24, s8, win+pmap, id 33
>
>

IRC answer :

19:58 < calim> shining: clipFlat probably fails because gallium
reports quads don't follow provoking vertex convention and I'm not
willing to add an extra
               test for that to the draw functions
20:04 < shining> calim: I think I read a r300g commit about that, let me see
20:04 < shining> 759fd1f25f33273e0b7c02598bfa5b97d1a82d77
20:05 < shining> Read the comments. In short, we can't possibly pass
piglit's glean/clipFlat without some help from Gallium and an API/spec
change.
20:05 < shining> MostAwesomeDude: ^^
20:07 < MostAwesomeDude> shining:
http://people.freedesktop.org/~csimpson/gallium-docs/cso/rasterizer.html#fl=
atshade-first
20:07 < calim> in short, I don't care to add extra code to nv50 just
because r300 is crippled
20:08 < MostAwesomeDude> r300's not the only one with this, but we
discussed it on the ML and agreed to do it this way.
20:08 < MostAwesomeDude> Nobody really cares because nobody actually
uses the flatshade_first rules with quads.
20:09 < MostAwesomeDude> If we had specified flatshade_first as only
affecting tri, tristrip, and trifan, then life would be different. :3
20:09 < MostAwesomeDude> Except, of course, you'd still have to check
the rendering mode and adjust as needed.
20:11 < calim> you've just said it too, nobody cares; if someone does
care, they'll have to modify nvXX drivers themselves
20:12 < MostAwesomeDude> Yeah.
20:13 < MostAwesomeDude> What would need to be done, exactly? Are the
provoking verts selected through a register, or would the VBOs need to
be reshuffled?
20:14 < calim> if (mode is quads) { BEGIN_RING(chan, tesla,
NV50TCL_PROVOKING_VERTEX_LAST, 1); OUT_RING(1); }
20:15 < MostAwesomeDude> Ah, similar to that ridiculous thing in r300_rende=
r.
20:21 < calim> if we're lucky this works like a fence on vertex
processing, but most likely it's negligible
20:22 < MostAwesomeDude> I mostly just wanted to get an idea of what
must be done, so that somebody who cared could do it. :3
20:31 < MaximLevitsky> calim: every piglit test that fails adds noise,
so if that is just one line, why not to put it there?
20:32 < MostAwesomeDude> It's not one line.
20:32 < calim> not if you want to keep the 80 column limit, no; also,
you'd have to remove 2 lines from rasterizer cso
20:32 < MaximLevitsky> oh yeah, 2 lines :-)
20:33 < MaximLevitsky> :-)
20:33 < MostAwesomeDude> r300g doesn't remove the CSO write, but just
adds an additional write for the quirk cases. Dunno if that's safe on
nv50 though.
20:35 < calim> draw_arrays(quads); draw_arrays(tris); rasterizer cso
not dirty, so you need to set correct state in place (so the line
above should include
               an else clause)
