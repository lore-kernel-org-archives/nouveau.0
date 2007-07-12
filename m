From: Richard Hughes <hughsient-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Does Nouveau break the nVidia drivers?
Date: Thu, 12 Jul 2007 17:24:51 +0100
Message-ID: <1184257491.10812.36.camel@work>
References: <30c82f5f0707120641v45a01c72yb3a828271d1d64f9@mail.gmail.com>
	<46965347.20005@sms.ed.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <46965347.20005-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Ioannis Nousias <s0238762-Y3tGgqFSo3OFxr2TtlUqVg@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 2007-07-12 at 17:13 +0100, Ioannis Nousias wrote:
> I'm not a nouveau developer, but I'm a Fedora user and I've tried this.
> 
> Yes you can have the nVidia binary drivers and nouveau at the same time, 
> as long as you use the livna packages:

If you want to use the latest ddx (xrg-x11-drv-nouveau) you'll need the
latest DRM, which requires pulling in tons of other stuff due to api
changes. I was playing with nouveau from git on fedora yesterday [1] and
resorted to installing libdrm from git, compiling a custom kernel with a
new drm hacked in, compiling ddx, and then trying to compile mesa.

It works, but it's not something that's particularly easy to test nor
backport. When drm syncs with the kernel (hopefully soon) it will be
very easy to add the nouveau stuff into the fedora rawhide kernel once
again.

Richard.

[1] http://hughsient.livejournal.com/29989.html
