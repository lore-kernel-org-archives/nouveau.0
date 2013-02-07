From: mwesten <mwesten-H+0wwilmMs3R7s880joybQ@public.gmane.org>
Subject: Re: Monitor with corrupted EDID
Date: Thu, 07 Feb 2013 14:37:41 -0500
Message-ID: <51140285.4000108@verizon.net>
References: <CAAs+i9J0jFhD1==NYEGtwJDUPCH4oaxH7_9rdOsgU-R7iu=Gtg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <nouveau-bounces+gcfxn-nouveau=m.gmane.org-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-reply-to: <CAAs+i9J0jFhD1==NYEGtwJDUPCH4oaxH7_9rdOsgU-R7iu=Gtg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
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

On 02/07/2013 10:16 AM, Flavio Castelli wrote:
> For an unknown reason both my monitors ended up with a corrupted EDID.
> They both provide VGA and DVI input. The VGA input works fine, while
> DVI is broken because of the EDID issue.
>
> Using these [1] instructions I have been able to read the EDID and fix
> it. Unfortunately I'm not able to write it back to the eeprom.
> I always get this message:
>    i2c i2c-1: sendbytes: NAK bailout.
>
> This is what I usually see in /var/log/message
> [dump of the EDID]
> nouveau 0000:01:00.0: DVI-D-1: EDID block 0 invalid.
> [drm] nouveau 0000:01:00.0: DDC responded, but no EDID for DVI-D-1
>
> Do you know why writing to the monitor does not work? I suspect the
> eeprom is write protected
>
> Googling a bit I noticed the nvidia driver allows to ignore the EDID
> returned by the monitor and use a custom one. I looks like the nouveau
> drivers do not offer this feature. Am I wrong?
>
> These are my specs:
>    * kernel: 3.4.11-2.16-desktop
>    * architecture: x86_64
>    * distribution: openSUSE 12.2
>    * xorg-x11-driver-video-nouveau-0.0.16_20120321_ab7291d-3.5.1.x86_64
>    * X.Org X Server 1.12.3
>    * NVIDIA Corporation G84M [Quadro FX 570M]
>    * Monitor 1: lenovo l220x wide
>    * Monitor 2: lenovo l2440p
>
>
> What should I do?
>
> Thanks in advance
> Flavio
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/nouveau
>

I recently used a DOS program called ddcw.exe to fix the corrupted EDID 
on one of my monitors.

See this site, http://byuu.org/articles/computing/edid
and get it here, http://www.komeil.com/download/2984

If that doesn't work, the drm_kms_helper module in newer kernels should 
have a parameter to get around the problem.

See https://www.osadl.org/Single-View.111+M50eaf2f2c66.0.html

-Mike
