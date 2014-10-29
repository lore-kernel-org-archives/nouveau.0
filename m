From: "John H. Mountcastle" <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux kernel 3.17, freeze on resume
Date: Wed, 29 Oct 2014 08:28:37 -0400
Message-ID: <5450DD75.3080509@yahoo.com>
References: <1414247146.47116.YahooMailNeo@web162805.mail.bf1.yahoo.com>
 <CAKb7UvhprANm0zP5X1o6nZL=rt1m2iubx0HRq_9_dhc-91sh9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0066601235=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <CAKb7UvhprANm0zP5X1o6nZL=rt1m2iubx0HRq_9_dhc-91sh9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: Ilia Mirkin <imirkin-FrUbXkNCsVf2fBVCVOL8/A@public.gmane.org>
Cc: "nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Id: nouveau.vger.kernel.org

This is a multi-part message in MIME format.
--===============0066601235==
Content-Type: multipart/alternative;
 boundary="------------020806080604060906050709"

This is a multi-part message in MIME format.
--------------020806080604060906050709
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Sorry I'm so long replying, this got caught in my junk filter. I will
try as you suggest and report back. Thanks for the suggestions. _- mtcstle
On 10/25/2014 09:24 PM, Ilia Mirkin wrote:
> Can you grab a copy of dmesg after resume? Can you try waiting ~2
> minutes to see if gdm will restart on its own (due to X dying)? In
> general, nouveau is less-than-great at resuming while 3d applications
> are running. This used to be rare, but now people have things like
> gnome-shell/etc which complicate matters.
>
> On Sat, Oct 25, 2014 at 10:25 AM, John Mountcastle <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org> wrote:
>> This may not be the proper place to raise this question but I've had little
>> luck elsewhere.
>> After trying again, unsuccessfully this time, to install the proprietary
>> NVIDIA driver, I've decided to focus my efforts on the open source Nouveau
>> driver. I've seen video drivers blamed for varying degrees of "freeze on
>> resume" but I'm not certain that's what I'm up against. When I resume after
>> __________________
>> Never believe the set of that which you understand rivals the universe of
>> that which may go wrong -- mtcstle
>>
-- 
73 | *KB3KEY* | John | Mt.Airy,MD

--------------020806080604060906050709
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Sorry I'm so long replying, this got caught in my junk filter. I
    will try as you suggest and report back. Thanks for the suggestions.
    _- mtcstle<br>
    <div class="moz-cite-prefix">On 10/25/2014 09:24 PM, Ilia Mirkin
      wrote:<br>
    </div>
    <blockquote
cite="mid:CAKb7UvhprANm0zP5X1o6nZL=rt1m2iubx0HRq_9_dhc-91sh9A-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org"
      type="cite">
      <pre wrap="">Can you grab a copy of dmesg after resume? Can you try waiting ~2
minutes to see if gdm will restart on its own (due to X dying)? In
general, nouveau is less-than-great at resuming while 3d applications
are running. This used to be rare, but now people have things like
gnome-shell/etc which complicate matters.

On Sat, Oct 25, 2014 at 10:25 AM, John Mountcastle <a class="moz-txt-link-rfc2396E" href="mailto:mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org">&lt;mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org&gt;</a> wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="">This may not be the proper place to raise this question but I've had little
luck elsewhere.
After trying again, unsuccessfully this time, to install the proprietary
NVIDIA driver, I've decided to focus my efforts on the open source Nouveau
driver. I've seen video drivers blamed for varying degrees of "freeze on
resume" but I'm not certain that's what I'm up against. When I resume after
__________________
Never believe the set of that which you understand rivals the universe of
that which may go wrong -- mtcstle

</pre>
      </blockquote>
    </blockquote>
    <div class="moz-signature">-- <br>
      73 | <b>KB3KEY</b> | John | Mt.Airy,MD</div>
  </body>
</html>

--------------020806080604060906050709--

--===============0066601235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0066601235==--
