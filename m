From: Christoph Bumiller <e0425955-oe7qfRrRQffzPE21tAIdciO7C/xPubJB@public.gmane.org>
Subject: Re: Gallium driver and compatibility issues
Date: Fri, 12 Mar 2010 16:19:58 +0100
Message-ID: <4B9A5B9E.8090102@student.tuwien.ac.at>
References: <1268329369.2107.14.camel@brian.bconsult.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1268329369.2107.14.camel-nwZTc+tSiniYW16jBriTx7NAH6kLmebB@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 11.03.2010 18:42, Uwe Bugla wrote:
> Hi,
>
> I use two nv34 cards and I would like to test / try out / use the
> Gallium driver without drawbacks.
>
>   
Note that you said "use", and not "own", which is a little
biased towards "they're plugged into the same MB".

> Unfortunately this has not been working since I decided to install /
> compile nouveau drivers.
>
>   
This is kind of a pre-requisite to be able to try the gallium
drivers ... well, you can run a simulation in your head, but,
that would be rather tedious.

> My system is Debian Squeeze, my kernel is 2.6.34-rc1.
>
> The problem is:
>
> Every time I load nouveau_dri.so into RAM existing applications are
> broken / unusable (Example: gnome-games).
>
>   
Loading stuff into RAM by itself shouldn't cause any problems
if that RAM isn't used by something else, but, I'll just interpret
this as best I can:
AIGLX is loading it from .../lib/dri/, i.e. you installed it globally -
not the safest way to try, because now any app using OpenGL
may use the hw through indirect rendering.
(indirect meaning app -> libGL -> Xorg -> nouveau_dri, instead
of app -> libGL -> nouveau_dri)

> It does not matter if I overwrite existing versions of libglut*,
> libGLw*, libGLU*, libGL*, libEGL* or not - that does not make any
> difference.
> The center of the problem is nouveau_dri.so and nothing else.
>
>   
Sure, libGL etc. don't directly control the hardware, they
hook into the dri driver (nouveau_dri.so) to do that.

> Could it please be possible to modify this driver file so that it does
> NOT continue to break existing applications??
>
>   
It will break existing applications if existing applications make
use of it and it is itself broken.
So, either don't let them use it, or fix it. We're working on that.

Consider yourself lucky that you got an answer at all. Normally,
at this time, we don't care about the process of people trying the
gallium driver without knowing exactly (well, to a certain degree
at least) what they're doing.

Half-expecting to have my message dissected now,

Christoph
> Would be a pleasure!
>
> Cheers
>
> Uwe
>
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>   
