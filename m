From: "John H. Mountcastle" <mtcstle-/E1597aS9LQAvxtiuMwx3w@public.gmane.org>
Subject: Re: linux kernel 3.17, freeze on resume
Date: Sat, 01 Nov 2014 14:15:59 -0400
Message-ID: <5455235F.4090109@yahoo.com>
References: <1414247146.47116.YahooMailNeo@web162805.mail.bf1.yahoo.com>
 <CAKb7UvhprANm0zP5X1o6nZL=rt1m2iubx0HRq_9_dhc-91sh9A@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1870345315=="
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
--===============1870345315==
Content-Type: multipart/alternative;
 boundary="------------080001070404090300090101"

This is a multi-part message in MIME format.
--------------080001070404090300090101
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

I haven't received a digest from the group in over six days. Have I
fallen off the list somehow? Is there an online spot where I may go to
see if there was any response to my last message?
73 | *KB3KEY* | John | Mt.Airy,MD
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
>> hibernate, Plymouth fails then I get a completely inert machine. Lights are
>> on but keyboard nor mouse will elicit any response. If I go to another
>> machine and ssh to a shell and do, #systemctl restart gdm, a clean Xdisplay
>> pops up showing the log in screen. Now all is well. I'm running Gnome 3 on
>> kernel 3.17.1-302.fc21.x86_64 on an HP Elitebook 8440p with NVIDIA GT218N
>> [NVS 3100M] GPU, 8 GIG RAM and SSD. Can you help me help you to help me?
>> Do you suppose this is an as yet unreported driver bug or something else. It
>> may be interesting to note that about one time in five to seven, the machine
>> hangs on a reboot before getting anything at all onto the screen.
>> __________________
>> Never believe the set of that which you understand rivals the universe of
>> that which may go wrong -- mtcstle
>>
>>
>> _______________________________________________
>> Nouveau mailing list
>> Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
>> http://lists.freedesktop.org/mailman/listinfo/nouveau
>>


--------------080001070404090300090101
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">I haven't received a digest from the
      group in over six days. Have I fallen off the list somehow? Is
      there an online spot where I may go to see if there was any
      response to my last message?<br>
      <div class="moz-signature">73 | <b>KB3KEY</b> | John | Mt.Airy,MD</div>
      On 10/25/2014 09:24 PM, Ilia Mirkin wrote:<br>
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
hibernate, Plymouth fails then I get a completely inert machine. Lights are
on but keyboard nor mouse will elicit any response. If I go to another
machine and ssh to a shell and do, #systemctl restart gdm, a clean Xdisplay
pops up showing the log in screen. Now all is well. I'm running Gnome 3 on
kernel 3.17.1-302.fc21.x86_64 on an HP Elitebook 8440p with NVIDIA GT218N
[NVS 3100M] GPU, 8 GIG RAM and SSD. Can you help me help you to help me?
Do you suppose this is an as yet unreported driver bug or something else. It
may be interesting to note that about one time in five to seven, the machine
hangs on a reboot before getting anything at all onto the screen.
__________________
Never believe the set of that which you understand rivals the universe of
that which may go wrong -- mtcstle


_______________________________________________
Nouveau mailing list
<a class="moz-txt-link-abbreviated" href="mailto:Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org">Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org</a>
<a class="moz-txt-link-freetext" href="http://lists.freedesktop.org/mailman/listinfo/nouveau">http://lists.freedesktop.org/mailman/listinfo/nouveau</a>

</pre>
      </blockquote>
      <pre wrap="">
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------080001070404090300090101--

--===============1870345315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1870345315==--
