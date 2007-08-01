From: "Stephane Marchesin" <marchesin-YynmYXH4S6491FlJP1ih0VAUjnlXr6A1@public.gmane.org>
Subject: Re: Kernel module indispensable?
Date: Thu, 2 Aug 2007 00:18:11 +0200
Message-ID: <6a89f9d50708011518o1bc1c8a5q83bb85fabf9d09d@mail.gmail.com>
References: <jwvtzrj2kts.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau@gnu.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <jwvtzrj2kts.fsf-monnier+gmane.comp.freedesktop.xorg.nouveau-mXXj517/zsQ@public.gmane.org>
Content-Disposition: inline
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 8/1/07, Stefan Monnier <monnier-CRDzTM1onBSWkKpYnGOUKg@public.gmane.org> wrote:
>
> I don't need 3D acceleration but I'm interested in the nouveau driver
> because I hope it'll be able to properly set the mode of my card: currently
> nv is unable to make my card display 1600x1200 via DVI (it works OK via VGA
> but the quality is bit less stunning).
>
> So I compiled and installed it, but now I encountered a problem: it seems
> that (contrary to both the nv and the nvidia drivers) the nouveau driver
> does not work at all without the corresponding kernel module.  Is that true?

The binary nvidia driver does require a kernel module as well.

> Is there some hope to drop this requirement?

Not really, actually we're moving towards a world where graphics
drivers for X.org depend on a kernel module. Nouvea is just a little
early here (for a change :).

>
>
>         Stefan "whose kernel says `-1 Unknown symbol in module' when trying
>                 to insert the new drm.ko module"

That should be troubleshoot. Usually dmesg mentions missing symbols
which in turn points at the real issue.

Stephane
