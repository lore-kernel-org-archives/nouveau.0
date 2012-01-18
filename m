From: Patrice Mandin <mandin.patrice@orange.fr>
Subject: Re: [Nouveau] [PATCH 4/4] nvfx: random cleanups of the
 state validation code
Date: Wed, 18 Jan 2012 21:54:14 +0100
Message-ID: <20120118215414.1aef2da3.mandin.patrice@orange.fr>
References: <1326195664-28384-1-git-send-email-dev@lynxeye.de>
	<1326195664-28384-5-git-send-email-dev@lynxeye.de>
	<20120117182259.cc64f260.mandin.patrice@orange.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org>
In-Reply-To: <20120117182259.cc64f260.mandin.patrice@orange.fr>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/mesa-dev>
List-Post: <mailto:mesa-dev@lists.freedesktop.org>
List-Help: <mailto:mesa-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/mesa-dev>,
	<mailto:mesa-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
Errors-To: mesa-dev-bounces+gcvmd-mesa3d-493=gmane.org@lists.freedesktop.org
To: Lucas Stach <dev@lynxeye.de>
Cc: nouveau@lists.freedesktop.org, mesa-dev@lists.freedesktop.org
List-Id: nouveau.vger.kernel.org

Le Tue, 17 Jan 2012 18:22:59 +0100
Patrice Mandin <mandin.patrice@orange.fr> a =E9crit:

> Le Tue, 10 Jan 2012 12:41:04 +0100
> Lucas Stach <dev@lynxeye.de> a =E9crit:
> =

> > Signed-off-by: Lucas Stach <dev@lynxeye.de>
> > ---
> >  src/gallium/drivers/nvfx/nvfx_state_emit.c |   49 ++++++++++++--------=
-------
> >  1 files changed, 22 insertions(+), 27 deletions(-)
> > =

> > diff --git a/src/gallium/drivers/nvfx/nvfx_state_emit.c b/src/gallium/d=
rivers/nvfx/nvfx_state_emit.c
> > index e2cfb76..a959015 100644
> [snip]
@@ -212,14 +211,6 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		nvfx->relocs_needed =3D NVFX_RELOCATE_ALL;
 	}
 =

-	if(nvfx->dirty & NVFX_NEW_SAMPLER) {
-		nvfx->dirty &=3D~ NVFX_NEW_SAMPLER;
-		nvfx_fragtex_validate(nvfx);
-
-		// TODO: only set this if really necessary
-		flush_tex_cache =3D TRUE;
-	}
-
 	dirty =3D nvfx->dirty;
 =

 	if(nvfx->render_mode =3D=3D HW)
@@ -252,6 +243,13 @@ nvfx_state_validate_common(struct nvfx_context *nvfx)
 		}
 	}
 =

+	if(dirty & NVFX_NEW_SAMPLER) {
+		nvfx_fragtex_validate(nvfx);
+
+		// TODO: only set this if really necessary
+		flush_tex_cache =3D TRUE;
+	}
+
 	if(dirty & NVFX_NEW_RAST)
 		sb_emit(chan, nvfx->rasterizer->sb, nvfx->rasterizer->sb_len);
 =

> I noticed another small regression with it, the splashscreen bitmap is
> also not displayed anymore, so I'll investigate a bit further. Maybe no
> need to revert the whole series.

And the above part triggers it, the missing nvfx->dirty &=3D~ NVFX_NEW_SAMP=
LER;
in the change causes this regression.

-- =

Patrice Mandin
WWW: http://pmandin.atari.org/
Programmeur Linux, Atari
Sp=E9cialit=E9: D=E9veloppement, jeux

"who writes the code, decides"
