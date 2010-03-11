From: Younes Manton <younes.m-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Gallium driver and compatibility issues
Date: Thu, 11 Mar 2010 13:23:24 -0500
Message-ID: <586c2acd1003111023y72ca711at32b69b88252673f3@mail.gmail.com>
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

On Thu, Mar 11, 2010 at 12:42 PM, Uwe Bugla <uwe.bugla-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi,
>
> I use two nv34 cards and I would like to test / try out / use the
> Gallium driver without drawbacks.
>
> Unfortunately this has not been working since I decided to install /
> compile nouveau drivers.
>
> My system is Debian Squeeze, my kernel is 2.6.34-rc1.
>
> The problem is:
>
> Every time I load nouveau_dri.so into RAM existing applications are
> broken / unusable (Example: gnome-games).
>
> It does not matter if I overwrite existing versions of libglut*,
> libGLw*, libGLU*, libGL*, libEGL* or not - that does not make any
> difference.
> The center of the problem is nouveau_dri.so and nothing else.
>
> Could it please be possible to modify this driver file so that it does
> NOT continue to break existing applications??
>
> Would be a pleasure!
>
> Cheers
>
> Uwe

Don't install nouveau_dri.so globally. When you want to try it with a
specific application set LIBGL_DRIVERS_PATH=/path/to/nouveau_dri.so in
your env.
