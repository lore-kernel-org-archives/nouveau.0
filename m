From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Virtualbox 3D accel broken in xf86-video-nouveau 1.0.3
Date: Sun, 28 Oct 2012 18:18:34 -0000
Message-ID: <op.wmwig8yx8t7z9u@arch-laptop>
References: <508C874A.90200@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <508C874A.90200-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Pouar <thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, 28 Oct 2012 01:15:54 -0000, Pouar <thepouar-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:

> there's a regression in the xf86-video-nouveau driver that came up in
> 1.0.3 that causes the desktop to bounce around in virtualbox whenever
> using HW acceleration in cinnamon and gnome 3, but not in fallback or
> cinnamon 2d, only happens in virtualbox and not the host, I've confirmed
> it was the graphics driver on the host because it happened with the
> 1.0.3 driver but not the 1.0.2.
> anyone else having this problem? I'm using GeForce GTX 560 Ti

Hi Pouar

Can you open a bug, following these instructions [1]

Ideally you can try bisecting the issue - there are only 10 changes that  
may have caused the issue

Cheers
Emil

[1] http://nouveau.freedesktop.org/wiki/Bugs
