From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Thu, 01 Jan 2015 09:23:45 +0000
Message-ID: <bug-87885-8800-Se4tu3sOlr@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1388718703=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-87885-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1388718703==
Content-Type: multipart/alternative; boundary="1420104225.ae1Dc821.16447"; charset="UTF-8"


--1420104225.ae1Dc821.16447
Date: Thu, 1 Jan 2015 09:23:45 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #6 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
So, I had a look at the dumps. The temperature thresholds are OK and the
reported temperature seems sensible.

I now wonder if we somehow select the wrong PWM controller, could you try
running the following writes?

nvapoke e114 21c
nvapoke e118 8000010e

If this does not work, have you ever tried with the proprietary driver? If it
works with it, could you run "./nvapeek e114 20" on it?

Looking at your vbios, it reports you have an adt7473 which is an external fan
management IC. Some vbios report the device but don't actually have it. In your
case, it may be there but it would be undetected. We have had a lot of problems
with this chip. If everything else does not work, then we'll try to see if we
can get this freaking adt7473 to work!

Happy new year :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420104225.ae1Dc821.16447
Date: Thu, 1 Jan 2015 09:23:45 +0000
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
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c6">Comment # 6</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>So, I had a look at the dumps. The temperature thresholds are OK and the
reported temperature seems sensible.

I now wonder if we somehow select the wrong PWM controller, could you try
running the following writes?

nvapoke e114 21c
nvapoke e118 8000010e

If this does not work, have you ever tried with the proprietary driver? If it
works with it, could you run &quot;./nvapeek e114 20&quot; on it?

Looking at your vbios, it reports you have an adt7473 which is an external fan
management IC. Some vbios report the device but don't actually have it. In your
case, it may be there but it would be undetected. We have had a lot of problems
with this chip. If everything else does not work, then we'll try to see if we
can get this freaking adt7473 to work!

Happy new year :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420104225.ae1Dc821.16447--

--===============1388718703==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1388718703==--
