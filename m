From: Daniel Stone <daniel-rLtY4a/8tF1rovVCs/uTlw@public.gmane.org>
Subject: Re: [PATCH 01/10] dri2: Fix can_exchange() to allow
 page-flipping on more mesa versions.
Date: Thu, 1 Mar 2012 20:37:38 +0000
Message-ID: <CAPj87rM6TmUKnB9CFqrvntQciAtV6enJvqTmVFsWF24JydXNnw@mail.gmail.com>
References: <1330625475-7080-1-git-send-email-mario.kleiner@tuebingen.mpg.de>
	<1330625475-7080-2-git-send-email-mario.kleiner@tuebingen.mpg.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1330625475-7080-2-git-send-email-mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org>
Cc: xorg-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

On 1 March 2012 18:11, Mario Kleiner <mario.kleiner-TdbV1Z3I5XE0NhjG498hmQ@public.gmane.org> wrote:
> can_exchange() returns false and thereby prevents page
> flipping on some drawables where page flipping would
> work fine. This due to non-matching drawable depths values
> between front buffer pixmap and back buffer pixmap, because
> front buffer pixmaps inherit the depth of the screen, typically
> 24 bits, whereas the depth value of back buffer pixmaps for a
> given RGB8 or RGBA8 visual depends on the mesa version in use,
> either 24 bits or 32 bits.
>
> Use bitsPerPixel instead of depth to decide if drawable
> is flippable. This will still catch really incompatible
> formats like 32 bpp vs. 16 bpp buffers.

In theory, shouldn't this be a format-compatibility check, so you
don't (unlikely though it is) attempt to flip to a BGR drawable on an
RGB configuration, or a 4444 drawable on 0565?

Cheers,
Daniel
