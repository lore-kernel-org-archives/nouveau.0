From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 81690] nouveau GPU locks up under memory pressure
Date: Wed, 23 Sep 2015 21:39:11 +0000
Message-ID: <bug-81690-8800-aYYDcVk90S@http.bugs.freedesktop.org/>
References: <bug-81690-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0321110288=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-81690-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Sender: "Nouveau" <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============0321110288==
Content-Type: multipart/alternative; boundary="1443044351.3F5D17e83.11431"; charset="UTF-8"


--1443044351.3F5D17e83.11431
Date: Wed, 23 Sep 2015 21:39:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=81690

--- Comment #6 from Ian Kumlien <ian.kumlien-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
I don't know if this is really related but... 

I'm seeing this:
[40181.763458] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a575000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f921000 [chrome[6026]]
[40181.763462] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
10, recovering...
[40182.417849] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.701542] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.985634] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.270485] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.554109] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.841470] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.128689] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.415447] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.701808] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.986853] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.272766] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.558682] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.843290] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.128950] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.415131] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.700506] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.986265] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.271499] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.556816] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.842722] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.133485] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.418877] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.705268] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.990129] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.275092] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.560675] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.846162] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.131173] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.414957] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.698904] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.982435] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.266176] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.549908] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.833565] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.117459] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.401711] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.685162] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.969316] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.256315] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.541295] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.828543] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.113320] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.398205] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.685591] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.969929] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.254368] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.537985] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.821983] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.105431] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.389035] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.672610] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.957269] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.263701] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.548514] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.831412] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.114322] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.397061] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.680167] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.964247] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.248475] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.532005] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.818370] nouveau E[chrome[6026]] nv50cal_space: -16
[40214.814500] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[40215.097878] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[178161.256855] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0009399000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f923000
[chrome[29152]]
[178161.256859] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 10, recovering...

I get big blocky dark squares rendering specifically in the corners and, in
this case, a youtube video flickering.

After killing chrome and starting it again:
[178192.982581] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
[178207.974336] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
---

I have been seeing this a lot and it usually leads to a complete X deadlock...

This is on a single socket AMD machine: I don't know if this is really related
but... 

I'm seeing this:
[40181.763458] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a575000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f921000 [chrome[6026]]
[40181.763462] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
10, recovering...
[40182.417849] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.701542] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.985634] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.270485] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.554109] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.841470] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.128689] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.415447] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.701808] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.986853] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.272766] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.558682] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.843290] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.128950] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.415131] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.700506] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.986265] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.271499] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.556816] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.842722] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.133485] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.418877] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.705268] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.990129] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.275092] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.560675] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.846162] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.131173] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.414957] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.698904] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.982435] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.266176] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.549908] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.833565] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.117459] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.401711] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.685162] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.969316] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.256315] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.541295] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.828543] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.113320] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.398205] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.685591] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.969929] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.254368] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.537985] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.821983] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.105431] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.389035] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.672610] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.957269] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.263701] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.548514] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.831412] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.114322] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.397061] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.680167] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.964247] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.248475] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.532005] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.818370] nouveau E[chrome[6026]] nv50cal_space: -16
[40214.814500] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[40215.097878] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[178161.256855] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0009399000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f923000
[chrome[29152]]
[178161.256859] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 10, recovering...

I get big blocky dark squares rendering specifically in the corners and, in
this case, a youtube video flickering.

After killing chrome and starting it again:
[178192.982581] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
[178207.974336] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
---

I have been seeing this a lot and it usually leads to a complete X deadlock...

This is on a single socket AMD machine: AMD FX(tm)-8350 Eight-Core Processor
With 32GB of ECC memory (no ecc errors detected)

This would mean that it's been reproduced on a non NUMA system with only video
playing....

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1443044351.3F5D17e83.11431
Date: Wed, 23 Sep 2015 21:39:11 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"

<html>
    <head>
      <base href="https://bugs.freedesktop.org/" />
    </head>
    <body>
      <p>
        <div>
            <b><a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - nouveau GPU locks up under memory pressure"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=81690">bug 81690</a>
              from <span class="vcard"><a class="email" href="mailto:ian.kumlien&#64;gmail.com" title="Ian Kumlien &lt;ian.kumlien&#64;gmail.com&gt;"> <span class="fn">Ian Kumlien</span></a>
</span></b>
        <pre>I don't know if this is really related but... 

I'm seeing this:
[40181.763458] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a575000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f921000 [chrome[6026]]
[40181.763462] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
10, recovering...
[40182.417849] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.701542] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.985634] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.270485] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.554109] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.841470] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.128689] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.415447] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.701808] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.986853] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.272766] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.558682] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.843290] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.128950] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.415131] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.700506] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.986265] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.271499] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.556816] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.842722] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.133485] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.418877] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.705268] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.990129] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.275092] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.560675] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.846162] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.131173] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.414957] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.698904] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.982435] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.266176] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.549908] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.833565] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.117459] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.401711] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.685162] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.969316] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.256315] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.541295] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.828543] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.113320] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.398205] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.685591] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.969929] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.254368] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.537985] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.821983] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.105431] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.389035] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.672610] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.957269] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.263701] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.548514] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.831412] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.114322] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.397061] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.680167] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.964247] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.248475] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.532005] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.818370] nouveau E[chrome[6026]] nv50cal_space: -16
[40214.814500] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[40215.097878] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[178161.256855] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0009399000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f923000
[chrome[29152]]
[178161.256859] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 10, recovering...

I get big blocky dark squares rendering specifically in the corners and, in
this case, a youtube video flickering.

After killing chrome and starting it again:
[178192.982581] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
[178207.974336] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
---

I have been seeing this a lot and it usually leads to a complete X deadlock...

This is on a single socket AMD machine: I don't know if this is really related
but... 

I'm seeing this:
[40181.763458] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x000a575000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f921000 [chrome[6026]]
[40181.763462] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on channel
10, recovering...
[40182.417849] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.701542] nouveau E[chrome[6026]] nv50cal_space: -16
[40182.985634] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.270485] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.554109] nouveau E[chrome[6026]] nv50cal_space: -16
[40183.841470] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.128689] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.415447] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.701808] nouveau E[chrome[6026]] nv50cal_space: -16
[40184.986853] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.272766] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.558682] nouveau E[chrome[6026]] nv50cal_space: -16
[40185.843290] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.128950] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.415131] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.700506] nouveau E[chrome[6026]] nv50cal_space: -16
[40186.986265] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.271499] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.556816] nouveau E[chrome[6026]] nv50cal_space: -16
[40187.842722] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.133485] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.418877] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.705268] nouveau E[chrome[6026]] nv50cal_space: -16
[40188.990129] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.275092] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.560675] nouveau E[chrome[6026]] nv50cal_space: -16
[40189.846162] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.131173] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.414957] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.698904] nouveau E[chrome[6026]] nv50cal_space: -16
[40190.982435] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.266176] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.549908] nouveau E[chrome[6026]] nv50cal_space: -16
[40191.833565] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.117459] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.401711] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.685162] nouveau E[chrome[6026]] nv50cal_space: -16
[40192.969316] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.256315] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.541295] nouveau E[chrome[6026]] nv50cal_space: -16
[40193.828543] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.113320] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.398205] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.685591] nouveau E[chrome[6026]] nv50cal_space: -16
[40194.969929] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.254368] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.537985] nouveau E[chrome[6026]] nv50cal_space: -16
[40195.821983] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.105431] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.389035] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.672610] nouveau E[chrome[6026]] nv50cal_space: -16
[40196.957269] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.263701] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.548514] nouveau E[chrome[6026]] nv50cal_space: -16
[40197.831412] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.114322] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.397061] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.680167] nouveau E[chrome[6026]] nv50cal_space: -16
[40198.964247] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.248475] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.532005] nouveau E[chrome[6026]] nv50cal_space: -16
[40199.818370] nouveau E[chrome[6026]] nv50cal_space: -16
[40214.814500] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[40215.097878] nouveau E[chrome[6026]] failed to idle channel 0xcccc0000
[chrome[6026]]
[178161.256855] nouveau E[   PFIFO][0000:01:00.0] read fault at 0x0009399000
[PAGE_NOT_PRESENT] from PGRAPH/GPC0/PROP on channel 0x007f923000
[chrome[29152]]
[178161.256859] nouveau E[   PFIFO][0000:01:00.0] PGRAPH engine fault on
channel 10, recovering...

I get big blocky dark squares rendering specifically in the corners and, in
this case, a youtube video flickering.

After killing chrome and starting it again:
[178192.982581] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
[178207.974336] nouveau E[chrome[29152]] failed to idle channel 0xcccc0000
[chrome[29152]]
---

I have been seeing this a lot and it usually leads to a complete X deadlock...

This is on a single socket AMD machine: AMD FX(tm)-8350 Eight-Core Processor
With 32GB of ECC memory (no ecc errors detected)

This would mean that it's been reproduced on a non NUMA system with only video
playing....</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1443044351.3F5D17e83.11431--

--===============0321110288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0321110288==--
