From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Sat, 03 Jan 2015 02:53:29 +0000
Message-ID: <bug-87885-8800-NlfKHX46jF@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1171084109=="
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


--===============1171084109==
Content-Type: multipart/alternative; boundary="1420253609.C3ac341.14192"; charset="UTF-8"


--1420253609.C3ac341.14192
Date: Sat, 3 Jan 2015 02:53:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #8 from TM <asiasuppenesser-Mmb7MZpHnFY@public.gmane.org> ---
Hmm; I installed the proprietary driver now (strange enough: I had to use the
G02 driver, not the G03 one which I thought I was supposed to use according to
web pages like https://en.opensuse.org/SDB:NVIDIA_drivers). It's running fine,
I can see in the nvidia-settings utility that the fan speed is reported to be
at 35%.

Running
  nvapoke e114 21c
  nvapoke e118 8000010e
doesn't have any effect.

Nevertheless, here's the output of
./nvapeek e114 20
_after_ running the above commands:
# ./nvapeek e114 20
0000e114: 0000021c 0000010e 0000021c 030000bd
0000e124: 10000000 00000000 0001010e 00000000

Does this help in any way?

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420253609.C3ac341.14192
Date: Sat, 3 Jan 2015 02:53:29 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c8">Comment # 8</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:asiasuppenesser&#64;gmx.de" title="TM &lt;asiasuppenesser&#64;gmx.de&gt;"> <span class="fn">TM</span></a>
</span></b>
        <pre>Hmm; I installed the proprietary driver now (strange enough: I had to use the
G02 driver, not the G03 one which I thought I was supposed to use according to
web pages like <a href="https://en.opensuse.org/SDB:NVIDIA_drivers">https://en.opensuse.org/SDB:NVIDIA_drivers</a>). It's running fine,
I can see in the nvidia-settings utility that the fan speed is reported to be
at 35%.

Running
  nvapoke e114 21c
  nvapoke e118 8000010e
doesn't have any effect.

Nevertheless, here's the output of
./nvapeek e114 20
_after_ running the above commands:
# ./nvapeek e114 20
0000e114: 0000021c 0000010e 0000021c 030000bd
0000e124: 10000000 00000000 0001010e 00000000

Does this help in any way?</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420253609.C3ac341.14192--

--===============1171084109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1171084109==--
