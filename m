From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Wed, 31 Dec 2014 17:10:39 +0000
Message-ID: <bug-87885-8800-6iihyL3YOU@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0463786936=="
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


--===============0463786936==
Content-Type: multipart/alternative; boundary="1420045838.22eF7E1.3725"; charset="UTF-8"


--1420045838.22eF7E1.3725
Date: Wed, 31 Dec 2014 17:10:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #3 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
Thanks TM for reporting this bug!

Could you test the following cases, please?

- inverted PWM: The fan may be inverted. 35% would then translate to 65% and
increasing as the temperature falls down. Could you try the manual fan
management and set the pwm to 50%? Please tell us what happens to the fan.

- If the previous test yielded no modification in the fan speed at all, then
either we are driving the wrong PWM controller ... or our settings are not
taken into account. PTHERM may override the fan speed and set it to 100%. Could
you please dump PTHERM's reg space please ? "nvapeek 20000 1000" will do :)
Could you also add "nvapeek e114 20" please?

Looking forward to hearing back from you!

PS: nvapeek can be found in envytools: https://github.com/envytools/envytools/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420045838.22eF7E1.3725
Date: Wed, 31 Dec 2014 17:10:38 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>Thanks TM for reporting this bug!

Could you test the following cases, please?

- inverted PWM: The fan may be inverted. 35% would then translate to 65% and
increasing as the temperature falls down. Could you try the manual fan
management and set the pwm to 50%? Please tell us what happens to the fan.

- If the previous test yielded no modification in the fan speed at all, then
either we are driving the wrong PWM controller ... or our settings are not
taken into account. PTHERM may override the fan speed and set it to 100%. Could
you please dump PTHERM's reg space please ? &quot;nvapeek 20000 1000&quot; will do :)
Could you also add &quot;nvapeek e114 20&quot; please?

Looking forward to hearing back from you!

PS: nvapeek can be found in envytools: <a href="https://github.com/envytools/envytools/">https://github.com/envytools/envytools/</a></pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420045838.22eF7E1.3725--

--===============0463786936==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0463786936==--
