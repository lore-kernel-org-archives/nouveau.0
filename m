From: Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
Subject: Re: [PATCH] mesa: nouveau/nvfx primitive restart
Date: Mon, 15 Nov 2010 19:55:00 +0100
Message-ID: <20101115195500.aacf0f31.mandin.patrice@orange.fr>
References: <20101113112006.e161abe1.mandin.patrice@orange.fr>
	<4CDE7936.6040309@student.tuwien.ac.at>
	<20101113152651.6d098db7.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20101113152651.6d098db7.mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Le Sat, 13 Nov 2010 15:26:51 +0100
Patrice Mandin <mandin.patrice-1tsiiZ//OF9QFI55V6+gNQ@public.gmane.org> a =E9crit:

> Le Sat, 13 Nov 2010 12:40:38 +0100
> Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org> a =E9crit:
> =

> > On 13.11.2010 11:20, Patrice Mandin wrote:
> > > Hello,
> > >
> > > As nv30/nv40 supports primitive restart in hardware, here is a patch.
> > >
> > Thank you, note however that this does not make it work yet in the case
> > where the driver decides to push vertex data on the FIFO directly, which
> > is implemented via the translate module and u_split_prim in nvfx_push.c,
> > maybe you could adjust that path too ?
> =

> Of course, I was also wondering if there were any other code paths that
> may need to be fixed.

After having rewritten a bit the test in renouveau, my patch appears to
be wrong.

I found a bit of early announcements about nv30 chips that talk about a
vertex cache. Luca Barbieri thought 0x1710 could be some kind of vertex
cache flush (see http://people.freedesktop.org/~cbrill/dri-log/dri-devel-20=
10-01-14.log
(at 18:50)).

0x1dac that I changed recently, thinking it could be
PRIMITIVE_RESTART_ENABLE, could be a VERTEX_CACHE_ENABLE instead. =


When using a vbo, the blob always resend vertex data when
primitive_restart is used, even when using an array of indices (which
could contain the primitive_restart index, set with 0x1db0).

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
