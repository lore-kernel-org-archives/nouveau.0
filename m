From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: xf86-video-nouveau-git and xorg-server-git
Date: Sat, 15 May 2010 10:59:43 +0300
Message-ID: <20100515105943.4addf661@daedalus.pq.iki.fi>
References: <4BEC5A74.9010400@interia.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4BEC5A74.9010400-khu2bkKidpXVItvQsEIGlw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 13 May 2010 22:00:52 +0200
yaiba.kurogane-khu2bkKidpXVItvQsEIGlw@public.gmane.org wrote:

> Hi! With current git version of xorg-server when I try to compile 
> xf86-video-nouveau I got these errors:
> nouveau_exa.lo
> nouveau_exa.c: In function 'nouveau_exa_create_pixmap':
> nouveau_exa.c:325:3: warning: 'Xcalloc' is deprecated (declared
> at /usr/include/xorg/os.h:225)
> nouveau_exa.c:331:2: warning: 'Xcalloc' is deprecated (declared
> at /usr/include/xorg/os.h:225)
> nouveau_exa.c:372:3: warning: 'Xfree' is deprecated (declared at 
> /usr/include/xorg/os.h:234)
> nouveau_exa.c: In function 'nouveau_exa_destroy_pixmap':
> nouveau_exa.c:388:2: warning: 'Xfree' is deprecated (declared at 
> /usr/include/xorg/os.h:234)
>    CC     nouveau_xv.lo
> nouveau_xv.c: In function 'NVSetupBlitVideo':
> nouveau_xv.c:1582:2: warning: 'Xcalloc' is deprecated (declared
> at /usr/include/xorg/os.h:225)
> (...)

These are all warnings, not errors. If your build fails, the reason
is something else.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
