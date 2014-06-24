From: Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] glamor: fix build without glamor.h
Date: Tue, 24 Jun 2014 19:27:08 +1000
Message-ID: <CACAvsv7k4i4MAsd5BTDWwiwtWcAUqjyYfnRQD5wpnT-qPy7nGA@mail.gmail.com>
References: <20140621233146.GA22546@joi.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20140621233146.GA22546-ilENSeTUhOw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sun, Jun 22, 2014 at 9:31 AM, Marcin Slusarz
<marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> xorg-server can be built without glamor, which leads to:
Hey Marcin,

Applied both patches, thanks.

Ben.

>
>   CC       nouveau_xv.lo
> In file included from nouveau_xv.c:41:0:
> nouveau_glamor.h:12:20: fatal error: glamor.h: No such file or directory
> compilation terminated.
>
> Signed-off-by: Marcin Slusarz <marcin.slusarz-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  configure.ac | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/configure.ac b/configure.ac
> index c34e575..92e047a 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -128,7 +128,13 @@ XORG_MANPAGE_SECTIONS
>  XORG_RELEASE_VERSION
>
>  AC_MSG_CHECKING([whether to include GLAMOR support])
> -if pkg-config --exists "xorg-server >= 1.15.99.901"
> +
> +AC_COMPILE_IFELSE(AC_LANG_PROGRAM(
> +[[
> +  #include <glamor.h>
> +]],[[]]),[found_glamor_header=yes],[found_glamor_header=no])
> +
> +if test "$found_glamor_header" = "yes" && pkg-config --exists "xorg-server >= 1.15.99.901"
>  then
>         AC_DEFINE(HAVE_GLAMOR, 1, [Build support for glamor acceleration])
>         AC_MSG_RESULT([yes])
> --
> 2.0.0
>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
