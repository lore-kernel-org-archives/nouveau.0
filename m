From: "Emil Velikov" <emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 0/4] nouveau: xserver 1.13 compat fixes
Date: Fri, 02 Nov 2012 00:51:05 -0000
Message-ID: <op.wm4fbfzs8t7z9u@arch-laptop>
References: <1351780858-13631-1-git-send-email-emil.l.velikov@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"; DelSp="yes"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <1351780858-13631-1-git-send-email-emil.l.velikov-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Thu, 01 Nov 2012 14:40:54 -0000, Emil Velikov wrote:

> Here are a few patches adding some missing functions in
> NvPlatformProbe, which iirc is being used as of xserver 1.13
>
> First patch adds a nouveau_kernel_mode_enabled helper, similar
> to xf86-video-radeon
> Second and third use the function in Nv{Pci,Platform}Probe
> And last one ensures we can still use ZaphodHead and relative
> head positioning via xorg.conf
>
> The coding style may be a bit off, despite my best attempts
>
> Please review and comment

A few notes
* patch1 - it may be better to split the function to has_kms and
is_gpu_supported
* patch2 - introduced a minor memory leak, when has_kms fails
* patch3 - is ok
* patch4 - is incomplete, it turns out that we need to explicitly check
if IsSharable and SetShared() it. Note radeon and others would need a
similar fix. Intel is OK

I'm planning to consolidate the common parts of Nv{Pci,Platform}Probe()
into a common function, and send another series

~Emil

>
>   [PATCH 1/4] nouveau: add nouveau_kernel_mode_enabled()
>  [PATCH 2/4] nouveau: Use helper function
>  [PATCH 3/4] nouveau: Check for kms in NvPlatformProbe
>  [PATCH 4/4] nouveau: fix entity handling in NvPlatformProbe
