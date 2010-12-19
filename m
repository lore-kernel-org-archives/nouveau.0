From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: libdrm: Make some kernel structures fully initialized
Date: Sun, 19 Dec 2010 12:20:53 +0100
Message-ID: <AANLkTimetOhzK65U_FaYk-uGXU_-LgthUAaEAXi5GA_8@mail.gmail.com>
References: <AANLkTikhxe79ytfkVG3W13K+wsemAWErqWX512ghNH-3@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <AANLkTikhxe79ytfkVG3W13K+wsemAWErqWX512ghNH-3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Michel Hermier <michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Fri, Dec 17, 2010 at 1:37 PM, Michel Hermier
<michel.hermier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
> A patch that initialise kernel structures. In addition =A0to reduce the
> noise of valgrind when running piglit tests, it may be also
> interesting to have these structures fully initialised for the future
> in case of some kernel ioctrl changes.
>

If you send your patch inline (e.g. with git send-email), we can also
review inline which is practical.

Just one comment :
nouveau_bo.c: In function 'nouveau_bo_kalloc':
nouveau_bo.c:116:9: warning: missing braces around initializer
nouveau_bo.c:116:9: warning: (near initialization for 'req.info')

Thats because the first member of drm_nouveau_gem_new is another
structure : drm_nouveau_gem_info

This seems to work:
	struct drm_nouveau_gem_new req =3D { { 0 }, 0, 0 };

And we could also use memset.
