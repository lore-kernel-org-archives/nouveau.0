From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: gp104: regression on Linux 5.6
Date: Thu, 30 Apr 2020 00:15:28 -0400
Message-ID: <CAKb7UvhLF7Qdx7W_0Ft4G8NujW6XbELcCP09DSkubj_duBXVkg@mail.gmail.com>
References: <20200401185621.GA24692@avx2>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200401185621.GA24692@avx2>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, Ben Skeggs <bskeggs-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Hi Alexey,

On Fri, Apr 24, 2020 at 10:52 PM Alexey Dobriyan <adobriyan-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
>
> gp104 refuses to switch to "graphic" mode and show anything past
> this line:
>
>         fb0: switching to nouveaufb from EFI VGA
>
> Machine is fine, as it I can press Ctrl+Alt+Delete and reboot it
> normally.
>
> 5.5 is OK. 5.6 is broken.

I've heard some issues relating to missing firmware lately. It should
work fine without firmware, but perhaps that got broken. Can you log
into the machine and check dmesg to see what's there? My guess is that
nouveau takes over from efifb, and then fails to load at some point in
the middle.

> Bisecting is kinda painful with miscompilation and init/main.c breakage.
>
> BTW do I need all those megabytes of firmware?
>
> [    0.923273] fb0: switching to nouveaufb from EFI VGA
> [    0.923440] nouveau 0000:02:00.0: NVIDIA GP104 (134000a1)
> [    1.026681] nouveau 0000:02:00.0: bios: version 86.04.1e.00.01
> [    1.026930] nouveau 0000:02:00.0: gr: failed to load firmware "gr/sw_nonctx"
> [    1.026934] nouveau 0000:02:00.0: gr: failed to load gr/sw_nonctx

This is necessary to provide any sort of acceleration. Otherwise this
is just a dumb scanout engine. You only need the firmware for your
chipset, not all of it.

Cheers,

  -ilia
