From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: trouble connecting to Panduit VGA adapter
Date: Fri, 1 Sep 2017 18:09:37 +0100
Message-ID: <87b721bd-0780-f5bd-4b72-9b047e93f60a@spliet.org>
References: <8760d2l5wb.fsf@tpad-m.i-did-not-set--mail-host-address--so-tickle-me>
 <CAKb7Uvg37iJGwzCZZyJHzSRNb=KHAtDjHutzdWB=gjr0JTe9bQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0338979585=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7Uvg37iJGwzCZZyJHzSRNb=KHAtDjHutzdWB=gjr0JTe9bQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0338979585==
Content-Type: multipart/alternative;
 boundary="------------78DDF9DF81F6478330CD6A0A"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------78DDF9DF81F6478330CD6A0A
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

If this doesn't work I suspect the converter is really blocking/damaging 
the EDID information. The official NVIDIA driver is willing to fall back 
to default modes, but this fall-back was handled less gracefully on 
nouveau last time I checked.

You might be able to use the xrandr tool to manually add a mode for the 
display. Forgive me for not knowing the exact syntax, but from what I 
recall you can use cvt to generate a modeline and copy-paste the 
parameters into an xrandr command to add, then use a second xrandr 
command to enable the display either in mirror mode or positioned 
relative to another display. If you're lucky, that mode corresponds well 
enough with what the projector will accept to just work.


Op 01-09-17 om 18:01 schreef Ilia Mirkin:
> Are you running a v4.12-based kernel? If so, update to v4.13-rcN or
> integrate https://github.com/skeggsb/linux/commit/13a86519202c5d119d83640d6f781f3181205d2c
> into your kernel build.
>
> On Fri, Sep 1, 2017 at 12:50 PM, Marko Schuetz-Schmuck
> <MarkoSchuetz-S0/GAf8tV78@public.gmane.org> wrote:
>> I want to connect to an InFocus projector that sits behind a Panduit VGA
>> adapter. I use a Thinkpad P51 with a mini display-port to VGA
>> converter. The laptop runs Manjaro and has the
>> video-hybrid-intel-nouveau-prime installed and it works with other
>> monitors. For some reason it does not detect the projector that is
>> connected through the Panduit. The keyboard shortcut to switch monitor
>> configuration says "No External Display". xrandr reports only the
>> built-in screen.
>>
>> I talked to the technician for the room installation and he told me that
>> he had seen this before on a Ubuntu machine and that switching to the
>> proprietary nvidia driver solved that problem. For various reasons I'd
>> rather not switch to that driver.
>>
>> I also found some lines with "DRM: DDC responded, but no EDID for DP-1"
>> in them from around the time I tried connecting to the projector. Could
>> they be related?
>>
>> Is there some setting or configuration that can help in this case?
>>
>> Best regards,
>>
>> Marko
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> https://lists.freedesktop.org/mailman/listinfo/nouveau
>>
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--------------78DDF9DF81F6478330CD6A0A
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p><font size="-1">If this doesn't work I suspect the converter is
        really blocking/damaging the EDID information. The official
        NVIDIA driver is willing to fall back to default modes, but this
        fall-back was handled less gracefully on nouveau last time I
        checked.</font></p>
    <p><font size="-1">You might be able to use the xrandr tool to
        manually add a mode for the display. Forgive me for not knowing
        the exact syntax, but from what I recall you can use cvt to
        generate a modeline and copy-paste the parameters into an xrandr
        command to add, then use a second xrandr command to enable the
        display either in mirror mode or positioned relative to another
        display. If you're lucky, that mode corresponds well enough with
        what the projector will accept to just work.</font></p>
    <br>
    <div class="moz-cite-prefix">Op 01-09-17 om 18:01 schreef Ilia
      Mirkin:<br>
    </div>
    <blockquote type="cite"
cite="mid:CAKb7Uvg37iJGwzCZZyJHzSRNb=KHAtDjHutzdWB=gjr0JTe9bQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org">
      <pre wrap="">Are you running a v4.12-based kernel? If so, update to v4.13-rcN or
integrate <a class="moz-txt-link-freetext" href="https://github.com/skeggsb/linux/commit/13a86519202c5d119d83640d6f781f3181205d2c">https://github.com/skeggsb/linux/commit/13a86519202c5d119d83640d6f781f3181205d2c</a>
into your kernel build.

On Fri, Sep 1, 2017 at 12:50 PM, Marko Schuetz-Schmuck
<a class="moz-txt-link-rfc2396E" href="mailto:MarkoSchuetz-S0/GAf8tV78@public.gmane.org">&lt;MarkoSchuetz-S0/GAf8tV78@public.gmane.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">I want to connect to an InFocus projector that sits behind a Panduit VGA
adapter. I use a Thinkpad P51 with a mini display-port to VGA
converter. The laptop runs Manjaro and has the
video-hybrid-intel-nouveau-prime installed and it works with other
monitors. For some reason it does not detect the projector that is
connected through the Panduit. The keyboard shortcut to switch monitor
configuration says "No External Display". xrandr reports only the
built-in screen.

I talked to the technician for the room installation and he told me that
he had seen this before on a Ubuntu machine and that switching to the
proprietary nvidia driver solved that problem. For various reasons I'd
rather not switch to that driver.

I also found some lines with "DRM: DDC responded, but no EDID for DP-1"
in them from around the time I tried connecting to the projector. Could
they be related?

Is there some setting or configuration that can help in this case?

Best regards,

Marko

_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a>

</pre>
      </blockquote>
      <pre wrap="">_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------78DDF9DF81F6478330CD6A0A--

--===============0338979585==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============0338979585==--
