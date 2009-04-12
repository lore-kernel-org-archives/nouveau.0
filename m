From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: nv50: wfb patches
Date: Mon, 13 Apr 2009 00:39:13 +0200
Message-ID: <6d4bc9fc0904121539s60a38aafj2c695de1fa0bf16c@mail.gmail.com>
References: <6d4bc9fc0903291654r70e3e6f0pd6f56874a6c361f7@mail.gmail.com>
	<586c2acd0903292054r11841a3v7750ac27ea9a6963@mail.gmail.com>
	<6d4bc9fc0903300320t7ab80b83k499c7aaf397303ea@mail.gmail.com>
	<6d4bc9fc0904101231l4373cc92h1f32b93dec9cc8b8@mail.gmail.com>
	<49E26A53.6010004@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <49E26A53.6010004-GANU6spQydw@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: =?ISO-8859-1?Q?Herv=E9_Cauwelier?= <herve.cauwelier-GANU6spQydw@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

Two things:

- wfb is not supposed to solve that problem, it's only supposed to
solve the problem of software access to tiled pixmaps
- wfb+exa requires something newer than xorg-server-1.6.0

The problem of getting the hw to do scanout from tiled memory still
exists (darktama tried to replicate what the blob does without success
as far as i know). The only workaround to it is some kind of shadow
fb, the latter is more of a political issue.

Maarten.

2009/4/13 Herv=E9 Cauwelier <herve.cauwelier-GANU6spQydw@public.gmane.org>:
> Is there some option to pass? I have xserver 1.6, drm 2.4.9 and nouveau
> master with your patches, but I see no progress in gnome-terminal
> refresh when maximising the window or switching desktops. It still takes
> like a couple of seconds where the CPU is at 100 %.
>
> Some report from dmesg:
>
> [drm] Initialized drm 1.1.0 20060810
> nouveau 0000:01:00.0: PCI INT A -> GSI 16 (level, low) -> IRQ 16
> nouveau 0000:01:00.0: setting latency timer to 64
> [drm] Detected an NV50 generation card (0x086700a2)
> [drm] Initialized nouveau 0.0.12 libdrm-2.4.9 on minor 0
> [drm] Allocating FIFO number 1
> [drm] nouveau_fifo_alloc: initialised FIFO 1
> [drm] Allocating FIFO number 2
> [drm] nouveau_fifo_alloc: initialised FIFO 2
>
> And Xorg.0.log: http://pastebin.ca/1390029
>
> Regards
>
> Maarten Maathuis a =E9crit :
>> Updated patches, with one performance improvement. Not checking for
>> tiled pixmaps when all pending pixmaps are linear. This reduces the
>> overhead to the point that you are doing small memcopies instead of a
>> large one.
>>
>> I think i solved the XSHM problem, simply by accelerating it
>> (http://cgit.freedesktop.org/xorg/xserver/commit/?id=3D1b5758bef0840c661=
4244e321790231b3c9477c9).
>>
>> I'll be fading to the background for a few months pretty soon, so
>> questions that involve access to my main machine (running nouveau,
>> xorg-git, etc) should be asked soon (less than a week).
>>
>> Maarten.
>>
>>
>> ------------------------------------------------------------------------
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>
>
