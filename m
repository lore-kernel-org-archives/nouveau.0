From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] drm/nouveau/bios: fix DCB v1.5 parsing
Date: Fri, 16 Nov 2012 21:36:56 +1000
Message-ID: <CAPM=9tx7nxB1ncQUZrBCh2xyKNxEz77=QMyandzoKmY3yopXEA@mail.gmail.com>
References: <20121115210914.GA6970@joi.lan>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20121115210914.GA6970-OI9uyE9O0yo@public.gmane.org>
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
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Nov 16, 2012 at 7:09 AM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> memcmp->nv_strncmp conversion should have inverted the return value.
>
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> See http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/gpu/drm/nouveau/nouveau_bios.c;h=a0a3fe3c016be86665db1369c44bef832f829a1a;hb=a0d271cbfed1dd50278c6b06bead3d00ba0a88f9#l5652 (3.6)
> and http://git.kernel.org/?p=linux/kernel/git/torvalds/linux.git;a=blob;f=drivers/gpu/drm/nouveau/core/include/core/object.h;h=818feabbf4a0969f090f897852fe4476a422b1b6;hb=77b67063bb6bce6d475e910d3b886a606d0d91f7#l179 (nv_strncmp definition)

Christ fix that nv_strncmp to act like the C one, or give it a very
different name!

Dave.
