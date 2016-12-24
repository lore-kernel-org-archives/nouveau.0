From: Roy Spliet <nouveau-NQbd8FSOZ1kdnm+yROfE0A@public.gmane.org>
Subject: Re: NVAC "No Signal"
Date: Sat, 24 Dec 2016 10:48:20 +0100
Message-ID: <4940241f-aadc-0277-a8c8-62879a41fc77@spliet.org>
References: <1de93d48-bc1c-bab4-11c4-395bfdfba7bb@gmail.com>
 <CAEXux-ZHdmop1c8F3FGRzAa_otwVjHUsT7OCVg6ObP_dg-Pcdw@mail.gmail.com>
 <90c3d7fc-16c9-bc81-8812-a9a1e86415dc@gmail.com>
 <CAEXux-Zr9SaRgSoVGCJKGO59CNYqq1MEwTo1ib23dCD+rxebjw@mail.gmail.com>
 <1f02c18b-e472-e3bc-9302-646d20e59d46@gmail.com>
 <CAEXux-a=F+AAr--rf8Dk_Cekcfk7yFF49mK4tW6MH4Xv=-2puA@mail.gmail.com>
 <07fa54e9-1a6f-de75-52ee-cc8aee96a541@gmail.com>
 <20161019175806.uqksdyiyr3dpkzu3@pmoreau.org>
 <f1d2a80f-5911-9ec7-f61f-4c10fe2ad87f@gmail.com>
 <f372e6ef-a030-ef79-c72f-0b00fdc48ffe@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1694096369=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <f372e6ef-a030-ef79-c72f-0b00fdc48ffe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Ben Skeggs <skeggsb-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============1694096369==
Content-Type: multipart/alternative;
 boundary="------------BD04A33C709977B831A62EE2"

This is a multi-part message in MIME format.
--------------BD04A33C709977B831A62EE2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I've observed this regression on my NVAC board; a 1920x1080 TV on HDMI 
(single monitor set-up) gets no signal with Fedora kernels from 4.8. 
Trace sent to the mmio dumps mailbox. A brief scan already revealed that 
register 0xe840 is never touched, so it appears that NVIDIA does 
something different.
VBIOS for this board is in the usual place. Commenting out 0xac from the 
workaround seems to solve the problem, as tested on a Fedora 4.9 kernel. 
I hope that helps you get a little further with this issue. Cheers, and 
happy holidays!

Roy.

Op 22-11-16 om 15:04 schreef poma:
> On 20.10.2016 00:46, Ben Skeggs wrote:
> [...]
>> I'd like to see a mmiotrace of the NVIDIA binary driver on a system
>> where this WAR breaks things.  I applied it to all the GPUs that NVIDIA
>> told me required it.
>>
>> Ben.
>>
> Still broken, more than four months,
> tested with mainline 4.9-rc6.
>
> According to Ben Skeggs,
> since this is "told" by NVIDIA i.e. by you, or perhaps some other of your colleagues,
> what's more that I don't see progress in this regard,
> would you guys from NVIDIA R&D mind help him to finally solve this?
>
> Thanks.
>
>
> Ref.
> https://lists.freedesktop.org/archives/nouveau/2016-October/026242.html
> http://goo.gl/Gm4ffO
> mmiotrace-nouveau/
> _______________________________________________
> Nouveau mailing list
> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau


--------------BD04A33C709977B831A62EE2
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <font size="-1">I've observed this regression on my NVAC board; a
      1920x1080 TV on HDMI (single monitor set-up) gets no signal with
      Fedora kernels from 4.8. Trace sent to the mmio dumps mailbox. A
      brief scan already revealed that register 0xe840 is never touched,
      so it appears that NVIDIA does something different.</font><br>
    <font size="-1">VBIOS for this board is in the usual place.
      Commenting out 0xac from the workaround seems to solve the
      problem, as tested on a Fedora 4.9 kernel. I hope that helps you
      get a little further with this issue. Cheers, and happy holidays!<br>
      <br>
    </font><font size="-1">Roy.<br>
      <br>
    </font>
    <div class="moz-cite-prefix">Op 22-11-16 om 15:04 schreef poma:<br>
    </div>
    <blockquote
      cite="mid:f372e6ef-a030-ef79-c72f-0b00fdc48ffe-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org"
      type="cite">
      <pre wrap="">On 20.10.2016 00:46, Ben Skeggs wrote:
[...]
</pre>
      <blockquote type="cite">
        <pre wrap="">I'd like to see a mmiotrace of the NVIDIA binary driver on a system
where this WAR breaks things.  I applied it to all the GPUs that NVIDIA
told me required it.

Ben.

</pre>
      </blockquote>
      <pre wrap="">
Still broken, more than four months,
tested with mainline 4.9-rc6.

According to Ben Skeggs,
since this is "told" by NVIDIA i.e. by you, or perhaps some other of your colleagues,
what's more that I don't see progress in this regard,
would you guys from NVIDIA R&amp;D mind help him to finally solve this?

Thanks.


Ref.
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/archives/nouveau/2016-October/026242.html">https://lists.freedesktop.org/archives/nouveau/2016-October/026242.html</a>
<a class="moz-txt-link-freetext" href="http://goo.gl/Gm4ffO">http://goo.gl/Gm4ffO</a>
mmiotrace-nouveau/
_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="https://lists.freedesktop.org/mailman/listinfo/nouveau">https://lists.freedesktop.org/mailman/listinfo/nouveau</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------BD04A33C709977B831A62EE2--

--===============1694096369==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==

--===============1694096369==--
