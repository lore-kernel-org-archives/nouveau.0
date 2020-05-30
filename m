From: Karol Herbst <kherbst-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: Re: 5.5 kernel: using nouveau or something else just long
 enough to turn off Quadro RTX 4000 Mobile for hybrid graphics?
Date: Sat, 30 May 2020 19:32:16 +0200
Message-ID: <CACO55tsvY0t_z986VVoYCvxuBASdZ+rQcDtZ_dAtQR60NLmQQw@mail.gmail.com>
References: <20200529180315.GA18804@merlins.org>
 <CAKb7Uvhw2EYo1RR-=NGgLO3CU9QTRWchcAw1injffybZbJ-zOA@mail.gmail.com>
 <20200529194605.GB18804@merlins.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <20200529194605.GB18804-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Marc MERLIN <marc_nouveau-xnduUnryOU1AfugRpC6u6w@public.gmane.org>
Cc: nouveau <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

On Fri, May 29, 2020 at 9:48 PM Marc MERLIN <marc_nouveau-xnduUnryOU1AfugRpC6u6w@public.gmane.org> wrote:
>
> On Fri, May 29, 2020 at 02:53:51PM -0400, Ilia Mirkin wrote:
> > > moving to new window moves the mouse, but not windows get displayed.
> >
> > Do you see anything in dmesg after this is set up? I'd expect some
> > errors about timeouts or something else.
>
> Nothing other than what I pasted.
>
> > Which kernel are you using? There have been some turing-specific fixes recently.
>
> 5.5.11. I can put 5.6 if needed.
>

please do. 5.5 is EOL and 5.4 and 5.6 got the runpm fixes in recent releases.

> > Also note that TLP has a problem where it forces the audio
> > sub-function to always-on which prevents the GPU from suspending.
>
> Ah, thanks for that.
> I have
> #RUNTIME_PM_DRIVER_BLACKLIST="amdgpu mei_me nouveau nvidia pcieport radeon"
>
> sauron:~$ lspci |grep -i nvidia
> 01:00.0 VGA compatible controller: NVIDIA Corporation TU104GLM [Quadro RTX 4000 Mobile / Max-Q] (rev a1)
> 01:00.1 Audio device: NVIDIA Corporation TU104 HD Audio Controller (rev a1)
> 01:00.2 USB controller: NVIDIA Corporation TU104 USB 3.1 Host Controller (rev a1)
> 01:00.3 Serial bus controller [0c80]: NVIDIA Corporation TU104 USB Type-C UCSI Controller (rev a1)
>
> So you're saying that I need to blacklist 01:00.1 and without that it hangs
> when suspending the powered off nvidia chip, which is what I'm experiencing
> as a hang when I unplug power?
>

no. It forces the audio device to be always on when on AC. there are
some sound power settings.

SOUND_POWER_SAVE_CONTROLLER=Y
SOUND_POWER_SAVE_ON_AC=1
SOUND_POWER_SAVE_ON_BAT=1

need to be set.

> Thanks,
> Marc
> --
> "A mouse is a device used to point at the xterm you want to type in" - A.S.R.
>
> Home page: http://marc.merlins.org/
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
>
