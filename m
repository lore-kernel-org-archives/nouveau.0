From: Maarten Maathuis <madman2003-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Canvas in Firefox, corruption
Date: Sun, 15 Aug 2010 00:37:05 +0200
Message-ID: <AANLkTimYsP=A8YXZNnRR9p5EtVeiCsgHndjeg6U955CW@mail.gmail.com>
References: <4C6690D6.6050507@spider007.net>
	<20100814210400.1faf8378@laptop64.home>
	<4C66EA8B.2010902@spider007.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <4C66EA8B.2010902-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: Sjon <archlinux.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org>
Cc: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

On Sat, Aug 14, 2010 at 9:12 PM, Sjon <archlinux.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org> wrote:
> On 08/14/2010 09:04 PM, Andreas Radke wrote:
>>
>> Am Sat, 14 Aug 2010 14:49:26 +0200
>> schrieb Sjon<archlinux.org-pbuv2Qasjt8Gk0GAwe0YXA@public.gmane.org>:
>>
>>
>>> nouveau-drm-lts 0.0.16_20100313-2
>>> nouveau-firmware 20091212-4
>>> xf86-video-nouveau 0.0.16_git20100517-1
>>
>> Are you running the .32 LTS kernel? Please confirm if the behavior is
>> the same with .35.x Arch stock kernel.
>
> Although I have kernel26-lts-2.6.32.18-1 installed (because nouveau-drm-lts
> depends on it), my machine currently runs on kernel26-2.6.34.3-1
>
> I have never intended to install or use LTS, but it seems it was installed
> via some dependency.
>
> Thanks,
> Sjon
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

The bug appears to be a pixman bug, fixed by commit
9897bb4eeed165b76001dfefd3a89bcb96d38a72. I have requested it to be
cherry picked for the next release. The REPEAT_NONE for XRGB source
fallback is being triggered in a composite operation.

Maarten.

-- 
Far away from the primal instinct, the song seems to fade away, the
river get wider between your thoughts and the things we do and say.
