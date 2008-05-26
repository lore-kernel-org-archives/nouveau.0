From: Pekka Paalanen <pq-X3B1VOXEql0@public.gmane.org>
Subject: Re: AIGLX problem
Date: Mon, 26 May 2008 21:22:36 +0300
Message-ID: <20080526212236.02e4a905@daedalus.pq.iki.fi>
References: <483AED8D.4020805@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <483AED8D.4020805-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
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

On Mon, 26 May 2008 19:04:13 +0200
Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> Hey everyone,
> 
> I followed the guide InstallNouvea from the wiki. Installing the driver 
> was a walk in the park. However, I do notice these lines in my Xorg.0.log:
> 
> (EE) AIGLX error: dlopen of /usr/lib/dri/nouveau_dri.so failed 
> (/usr/lib/dri/nouveau_dri.so: cannot open shared object file: No such 
> file or directory)
> (EE) AIGLX: reverting to software rendering

Currently, this is the correct behaviour. Nouveau_dri.so alias
the nvidia Gallium3D driver is in heavy development and is not usable.
You can get rid of the harmless message by disabling AIGLX.

-- 
Pekka Paalanen
http://www.iki.fi/pq/
