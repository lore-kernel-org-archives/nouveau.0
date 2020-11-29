From: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Subject: Re: Could Fedora-5.9.9/X-server problem be a
 Nouveau-problem?
Date: Sun, 29 Nov 2020 18:00:01 -0500
Message-ID: <CAKb7UvjiRApxVzxT=9Y26uXWB3zDMf8Nvi+eHfE0yJUMAfGLog@mail.gmail.com>
References: <f827ab7dd91e4b1684dd818bd541272d@di.ku.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <f827ab7dd91e4b1684dd818bd541272d-okVzrDOvQGk@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Klaus Ebbe Grue <grue-okVzrDOvQGk@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

When in doubt, blame nouveau.

I believe there has been some recent work around adjusting the logic
which checks that modes have enough bandwidth. Adding Lyude, who
worked on these changes. Not sure when they landed.

Klaus -- please supply a full Xorg log.

Cheers,

  -ilia

On Sun, Nov 29, 2020 at 4:28 PM Klaus Ebbe Grue <grue-okVzrDOvQGk@public.gmane.org> wrote:
>
> Hi nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>
> My X-server gives a blank screen on Fedora kernel 5.9.9.
>
> I am in doubt whether or not I should blame Nouveau for that.
>
> I know the nvidea drivers have problems with Fedora kernel 5.9.9.
>
> I can file a bug against Nouveau and provide logs if you think there is a remote chance that Nouveau could be the cause.
>
> Here are some details:
>
> Fedora 5.8.18 / X-server works fine.
>
> I can boot into Fedora 5.9.9 runlevel 3 (no X-server).
>
> If I boot into Fedora 5.9.9 runlevel 5 (with X-server), the screen powers off instead of giving a login prompt, but apart from that, Fedora 5.9.9 works fine and produces log files.
>
> If I then power off and boot into Fedora 5.8.18 and read Xorg.0.log.old I can see that the X-server under Fedora 5.9.9 did not get the screen resolutions right.
>
> Here is what monitor-edid says under both Fedora 5.9.9 and 5.8.18:
>
> > monitor-edid
> Name: PHL BDM4350
> EISA ID: PHL08fa
> EDID version: 1.4
> EDID extension blocks: 1
> Screen size: 95.3 cm x 54.3 cm (43.18 inches, aspect ratio 16/9 = 1.76)
> Gamma: 2.2
> Digital signal
> Max video bandwidth: 600 MHz
>         HorizSync 30-160
>         VertRefresh 23-80
>         # Monitor preferred modeline (60.0 Hz vsync, 133.3 kHz hsync, ratio 16/9, 102 dpi) (bad ratio)
>         ModeLine "3840x2160" 533.25 3840 3888 3920 4000 2160 2163 2168 2222 -hsync +vsync
> ...
>
> But under Fedora 5.9.9, the X-server is unaware of the 3840x2160 resolution according to Xorg.0.log.old. It also gets the screen physical size wrong.
>
> My first cry of help is here:
> https://ask.fedoraproject.org/t/no-login-screen-after-upgrade/10618
> That is where I leaned that the nvidea drivers have problems with Fedora 5.9.9
>
> Cheers,
> Klaus
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
