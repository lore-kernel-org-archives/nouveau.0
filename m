From: Marcin =?utf-8?q?Ko=C5=9Bcielnicki?= <koriakin-mP9o5jsk0RY@public.gmane.org>
Subject: Re: xf86-video-nouveau compile error and fix
Date: Thu, 14 Jan 2010 05:51:23 +0000
Message-ID: <201001140551.23511.koriakin@0x04.net>
References: <4B4EAB40.3050700@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4B4EAB40.3050700-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

> I found xf86-video-nouveau unable to compile on my system. Failing
> with two errors in nv_accel_common.c about NV50_2D_CLIP_ENABLE and
> NV50_2D_COLOR_KEY_ENABLE not being defined.
>
> Comparing the source to xf86-video-nv, i found the missing constants
> to be 0x290 for CLIP_ENABLE and 0x29c for COLOR_KEY_ENABLE. This got
> nv_accel_common.c to compile.
>
> I'd request these two constants to be defined to the said values
> and this being committed to the git repository.

These constants come from nouveau_class.h, which is part of libdrm. Please 
update your libdrm package to the latest git.
