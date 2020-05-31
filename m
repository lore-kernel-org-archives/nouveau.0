From: Marc MERLIN <marc_nouveau-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
Subject: Re: 5.5 kernel: using nouveau or something else just long
 enough to turn off Quadro RTX 4000 Mobile for hybrid graphics?
Date: Sun, 31 May 2020 11:31:15 -0700
Message-ID: <20200531183115.GA1128@merlins.org>
References: <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
 <CACO55tsvY0t_z986VVoYCvxuBASdZ+rQcDtZ_dAtQR60NLmQQw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Sat, May 30, 2020 at 07:32:16PM +0200, Karol Herbst wrote:
> > 5.5.11. I can put 5.6 if needed.
> 
> please do. 5.5 is EOL and 5.4 and 5.6 got the runpm fixes in recent releases.

Done, just went to 5.6.15, thanks.

> no. It forces the audio device to be always on when on AC. there are
> some sound power settings.
> 
> SOUND_POWER_SAVE_CONTROLLER=Y
> SOUND_POWER_SAVE_ON_AC=1
> SOUND_POWER_SAVE_ON_BAT=1

Thank you Karol and Ilia for the kind help, this totally worked.
I filed a documentation bug on https://github.com/linrunner/TLP/issues/495
this will hopefully help other people.

In other great news, I was able to mirror my display on HDMI through
nouveau on the new kernel, thank you!

xrandr --listproviders
Providers: number : 2
Provider 0: id: 0x43 cap: 0xf, Source Output, Sink Output, Source Offload, Sink Offload crtcs: 3 outputs: 1 associated providers: 0 name:modesetting
Provider 1: id: 0xf1 cap: 0x2, Sink Output crtcs: 4 outputs: 5 associated providers: 0 name:modesetting
xrandr --setprovideroutputsource 1 0

[42753.806113] nouveau 0000:01:00.0: DRM: allocated 2560x1600 fb: 0x200000, bo 00000000e75d7ede
[42753.806248] nouveau 0000:01:00.0: fb1: nouveaudrmfb frame buffer device

Thaks much,
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
 
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
