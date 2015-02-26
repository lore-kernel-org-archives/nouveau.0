From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Thu, 26 Feb 2015 10:24:14 +0000
Message-ID: <bug-80901-8800-0fEcRX0oXq@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0884252060=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80901-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0884252060==
Content-Type: multipart/alternative; boundary="1424946254.31DA3.3112"; charset="UTF-8"


--1424946254.31DA3.3112
Date: Thu, 26 Feb 2015 10:24:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #34 from K.-P. Schrage <kpschrage-Mmb7MZpHnFY@public.gmane.org> ---
(In reply to Martin Peres from comment #33)

Hello, Martin,

thank you for caring!


# nvapeek e114 10
0000e114: 0000021c 000000d8 00000001 00000000

(that's with the latest nouveau driver from darktama)

After enabling manual fan control mode (pwm1_enable = 1),
'nvapoke e118 80000005' somewhat reduces fan speed audibly, but still seems to
be too high (pwm1 shows a value of 0).

FWIW, after 'nvapoke e118 80000005", the output of the nvapeek command has
changed to
0000e114: 0000021c 00000005 00000001 00000000

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1424946254.31DA3.3112
Date: Thu, 26 Feb 2015 10:24:14 +0000
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
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c34">Comment # 34</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:kpschrage&#64;gmx.de" title="K.-P. Schrage &lt;kpschrage&#64;gmx.de&gt;"> <span class="fn">K.-P. Schrage</span></a>
</span></b>
        <pre>(In reply to Martin Peres from <a href="show_bug.cgi?id=80901#c33">comment #33</a>)

Hello, Martin,

thank you for caring!


# nvapeek e114 10
0000e114: 0000021c 000000d8 00000001 00000000

(that's with the latest nouveau driver from darktama)

After enabling manual fan control mode (pwm1_enable = 1),
'nvapoke e118 80000005' somewhat reduces fan speed audibly, but still seems to
be too high (pwm1 shows a value of 0).

FWIW, after 'nvapoke e118 80000005&quot;, the output of the nvapeek command has
changed to
0000e114: 0000021c 00000005 00000001 00000000</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1424946254.31DA3.3112--

--===============0884252060==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0884252060==--
