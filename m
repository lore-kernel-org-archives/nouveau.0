From: "Dr. Boris Neubert" <omega-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org>
Subject: Re: Nouveau and multi-monitor setup for Quadro NVS450
	(G98)
Date: Sun, 23 Nov 2014 15:51:47 +0100
Message-ID: <5471F483.3060105@online.de>
References: <545F674D.7060605@online.de>
 <CACAvsv5ovBX8zEJvLsPC0GXAfqNT13U01hiM8dV152c+mnnmdw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0778927004=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CACAvsv5ovBX8zEJvLsPC0GXAfqNT13U01hiM8dV152c+mnnmdw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0778927004==
Content-Type: multipart/alternative;
 boundary="------------070908090704030907050807"

This is a multi-part message in MIME format.
--------------070908090704030907050807
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Am 10.11.2014 um 00:18 schrieb Ben Skeggs:

> On Sun, Nov 9, 2014 at 11:08 PM, Dr. Boris Neubert <omega-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org> wrote:
>> I have a NVidia Quadro NVS450 graphics card with on screen (4800 x 1200
>> pixels) over three monitors. I use the proprietary NVidia modules to
>> achieve accelerated 2D graphics and display effects.
>> I am not able to create a multi-monitor setup with current Nouveau
>> drivers (from Ubuntu 14.04.1). xrandr -q only shows one monitor.
>> http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/ seems to refer
>> to Xinerama which is no alternative to me (slow, no display effects).
>>
> From what I recall (I believe I have this board on my desk somewhere),
> this board is actually two separate GPUs, each one driving two
> outputs.  Your best bet is to treat it as one would an "Optimus"
> configuration[1].
>
Thank you Ben, for the hint.

Unfortunately I am trapped by another problem: after switching back from
NVidia driver to Nouveau driver in Ubuntu, I get GPU lockups already at
boot time, rendering the system inaccessible. This is a peculiarity of
the combination of my mainboard and NVidia graphics card. I already
filed that issue to the Ubuntu bug tracker. Booting with
nouveau.noaccel=1 works but KDE crashes silently during initialization.

I thus had no chance to try the Optimus thing at all. Deadlocked 

Cheers,
Boris


--------------070908090704030907050807
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-text-plain" wrap="true" graphical-quote="true"
      style="font-family: -moz-fixed; font-size: 12px;" lang="x-unicode">
      <pre wrap="">
Am 10.11.2014 um 00:18 schrieb Ben Skeggs:
</pre>
      <blockquote type="cite" style="color: #000000;">
        <pre wrap="">On Sun, Nov 9, 2014 at 11:08 PM, Dr. Boris Neubert <a class="moz-txt-link-rfc2396E" href="mailto:omega-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org">&lt;omega-BGeptl67XyCzQB+pC5nmwQ@public.gmane.org&gt;</a> wrote:
</pre>
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">I have a NVidia Quadro NVS450 graphics card with on screen (4800 x 1200
pixels) over three monitors. I use the proprietary NVidia modules to
achieve accelerated 2D graphics and display effects.
</pre>
        </blockquote>
      </blockquote>
      <blockquote type="cite" style="color: #000000;">
        <blockquote type="cite" style="color: #000000;">
          <pre wrap="">I am not able to create a multi-monitor setup with current Nouveau
drivers (from Ubuntu 14.04.1). xrandr -q only shows one monitor.
<a class="moz-txt-link-freetext" href="http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/">http://nouveau.freedesktop.org/wiki/MultiMonitorDesktop/</a> seems to refer
to Xinerama which is no alternative to me (slow, no display effects).

</pre>
        </blockquote>
        <pre wrap="">From what I recall (I believe I have this board on my desk somewhere),
this board is actually two separate GPUs, each one driving two
outputs.  Your best bet is to treat it as one would an "Optimus"
configuration[1].

</pre>
      </blockquote>
      <pre wrap="">Thank you Ben, for the hint.

Unfortunately I am trapped by another problem: after switching back from
NVidia driver to Nouveau driver in Ubuntu, I get GPU lockups already at
boot time, rendering the system inaccessible. This is a peculiarity of
the combination of my mainboard and NVidia graphics card. I already
filed that issue to the Ubuntu bug tracker. Booting with
nouveau.noaccel=1 works but KDE crashes silently during initialization.

I thus had no chance to try the Optimus thing at all. Deadlocked <span class="moz-smiley-s2" title=":-("></span>

Cheers,
Boris

</pre>
    </div>
  </body>
</html>

--------------070908090704030907050807--

--===============0778927004==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0778927004==--
