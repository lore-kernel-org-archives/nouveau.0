From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: nv50 piglit change between 7.8 and master
Date: Mon, 17 May 2010 14:52:51 +0200
Message-ID: <AANLkTilYP0j8uGJxcSui_MbjjE9mHlYYX77liQXKA9hi@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
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

7.8 branch (533b7663) : 209/246
master branch (c882c31) : 216/241

In short :
8 fail/warn -> pass
5 fail -> skip
1 pass -> fail

So the only regression is glean/clipFlat
Output:
----------------------------------------------------------------------
Test clipping with flat shading (provoking vertex).

clipFlat: Failure for glBegin/End(GL_QUADS), glFrontFace(GL_CCW)
	GL_EXT_provoking_vertex test: GL_FIRST_VERTEX_CONVENTION_EXT mode
	Expected color (0, 1, 0) but found (1, 0, 0)
clipFlat:  FAIL rgba8, db, z24, s8, win+pmap, id 33

If anyone cares, I can host the detailed html results somewhere.
