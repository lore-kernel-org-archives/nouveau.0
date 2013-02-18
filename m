From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/7] nouveau: Check if the device supports
 modesetting, after opening it
Date: Mon, 18 Feb 2013 10:47:54 +1000
Message-ID: <CAPM=9tyko+H6B2KRC7RaTKgkRan_rMy4FHz4=_95s=v4sgsaDQ@mail.gmail.com>
References: <1361047727-740-1-git-send-email-emil.l.velikov@gmail.com>
	<1361047727-740-2-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1361047727-740-2-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sun, Feb 17, 2013 at 6:48 AM, Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> "Regression" caused by
> commit e34cfbd5bd23f7f15372af52d8a39a5715ce7310
> Author: Emil Velikov <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date:   Fri Nov 2 03:57:41 2012 +0000
>
>     nouveau: Factor out common code to NVHasKMS()
>
>     As the name suggests checks if it has kernel mode setting,
>     prints out the interface version and checkes if the chipset
>     is supported
>
>     Function is used in NVPciProbe and NVPlatformProbe
>
> Without this change X will fail with '[drm] KMS not enabled' if
> the kernel module is not loaded

Thats correct, the X server is not responsible for loading the kernel module.

If the kernel module isn't loaded then there is a bug elsewhere.

Dave.
