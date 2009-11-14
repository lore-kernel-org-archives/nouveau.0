From: Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: undefined symbol for DRI
Date: Sat, 14 Nov 2009 10:08:58 -0500
Message-ID: <1258211338.5688.7.camel@ayu>
References: <8b96e3d20911121102u3e0ab108v6a5c8c432fc90bd@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <8b96e3d20911121102u3e0ab108v6a5c8c432fc90bd-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Luiz Angelo Daros de Luca <luizluca-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

Hi,

On Thu, 2009-11-12 at 17:02 -0200, Luiz Angelo Daros de Luca wrote:
> Hello guys,
> 
> Quick question. I use libdrm, kernel drm, mesa and nouveau from git.
> However, I got this error:
> 
> (EE) AIGLX error: dlopen of /usr/lib64/dri/nouveau_dri.so failed
> (/usr/lib64/dri/nouveau_dri.so: undefined symbol: _glapi_tls_Context)

This looks like your mesa was built with TLS support, but your X server
does not have TLS support.

> Does it means I need an updated xorg? I'm using 1.6.5

That shouldn't be needed, you just have to disable TLS when compiling
mesa.

(This is disabled by default in the ./configure script and in the sample
configurations, did you manually enable it?)

Alternately, you can try to find Xorg packages with TLS enabled, or
rebuild it yourself.

Hope that helps!

-- 
Calvin Walton <calvin.walton-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
