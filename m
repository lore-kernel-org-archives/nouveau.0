From: "Maarten Maathuis" <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: AIGLX problem
Date: Mon, 26 May 2008 20:19:38 +0200
Message-ID: <6d4bc9fc0805261119j2bd50659oebde1ce451a89991@mail.gmail.com>
References: <483AED8D.4020805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <483AED8D.4020805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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
To: ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On 5/26/08, Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hey everyone,
>
>  I followed the guide InstallNouvea from the wiki. Installing the driver
>  was a walk in the park. However, I do notice these lines in my Xorg.0.log:
>
>  (EE) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed
>  (/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such
>  file or directory)
>  (EE) AIGLX: reverting to software rendering
>  (II) Loading sub module "GLcore"
>  (II) LoadModule: "GLcore"
>  (WW) Warning, couldn't open module GLcore
>  (II) UnloadModule: "GLcore"

glcore is a seperate build target, make glcore && make glcore-install iirc.
I'd expect a seperate package for it in the case of debian.

>
>  I'm using debian Lenny with Xorg 1.4.1~git20080131-4.
>
>                                                 Thanks
>  _______________________________________________
>  Nouveau mailing list
>  Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>  http://lists.freedesktop.org/mailman/listinfo/nouveau
>
