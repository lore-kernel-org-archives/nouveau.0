From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: Compilation error in nouveau_exa.c
Date: Wed, 10 Jun 2009 16:45:12 +0300
Message-ID: <20090610164512.2259da49@daedalus.pq.iki.fi>
References: <4A2FA30B.5080902@defora.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4A2FA30B.5080902-tmMSDyayuCodnm+yROfE0A@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pierre Pronchery <khorben-tmMSDyayuCodnm+yROfE0A@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Wed, 10 Jun 2009 14:11:55 +0200
Pierre Pronchery <khorben-tmMSDyayuCodnm+yROfE0A@public.gmane.org> wrote:

> 			Dear nouveau team,
> 
> compilation of the Nouveau driver is currently failing for me with the 
> following error:
> 
<snip>
> 
> It used to compile without any problems. I am using:
> - NetBSD 5.0 stable
> - xorg-server 1.5.3
> - libX11 1.1.5
> - libxcb 1.1
> - Mesa 7.4
> - libdrm 2.4.7
> 
> Hints?

Yes. Use libdrm and DRM kernel modules from drm.git master, the
latest revision.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
