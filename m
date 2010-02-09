From: Xavier Chantry <chantry.xavier-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: texture dimension limits in ddx
Date: Tue, 9 Feb 2010 20:44:45 +0100
Message-ID: <b67489df1002091144vd1ee91fv3070b3dfd03cc7e7@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau <Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

in nv10_exa.c :
check_texture does :
       if (w > 2046 || h > 2046)
                NOUVEAU_FALLBACK("picture too large, %dx%d\n", w, h);
check_render_target does :
        if (w > 4096 || h > 4096)
                return FALSE;

So we have different size limits for the source and the destination ?

Another thing is that nv20 uses nv10_exa.c code, and the limit in
check_texture could be increased for nv20 according to curro :
01:03 < curro_> shining: btw, about the 2048x2048 fallback, i'm quite
sure it's wrong for nv2x
01:05 < curro_> shining: it can do 4096x4096 with no problems, IIRC

And finally I saw that nouveau_exa_init does this :
       if (pNv->Architecture >= NV_ARCH_50) {
                exa->maxX = 8192;
                exa->maxY = 8192;
        } else
        if (pNv->Architecture >= NV_ARCH_20) {
                exa->maxX = 4096;
                exa->maxY = 4096;
        } else {
                exa->maxX = 2048;
                exa->maxY = 2048;
        }

But these 3 values are hardcoded everywhere in the code.
It might not be possible to use exa->maxX/Y directly as some functions
like check_texture / check_render_target above don't seem to have
access to them.
Maybe some constants could be defined instead and used everywhere ?
#define NV04_MAX 2048
#define NV20_MAX 4096
#define NV50_MAX 8192
or something.
