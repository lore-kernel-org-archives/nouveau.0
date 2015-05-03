From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Sun, 03 May 2015 01:55:34 +0000
Message-ID: <bug-87885-8800-Zljz13Eswj@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0384303783=="
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


--===============0384303783==
Content-Type: multipart/alternative; boundary="1430618134.BFc4b81.26306"; charset="UTF-8"


--1430618134.BFc4b81.26306
Date: Sun, 3 May 2015 01:55:34 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #21 from TM <asiasuppenesser-Mmb7MZpHnFY@public.gmane.org> ---
Hi, sorry for the late reply - Busy times...

Unfortunately the new command didn't work either :/

I also re-installed the proprietary driver again, for testing purposes. The
"nvidia-settings" GUI still reported a fan speed of 35% (as always), but this
time (I guess I missed that information before) I saw a line saying that
adjusting the fan speed is not supported. Were you aware of this already? I
think I wasn't...

Scrolling through this bug report again I saw that you were suspecting a
adt7473 chip to be placed on the graphics card board. I had a look at it and
couldn't find one. Here are the first lines written on all chips I could find
on the board (apart from memory chips):
- AT24C16B7
- AZ358M
- RT9214
- RT9259
- NXP 74HC08D

I hope that helps in some way :/

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1430618134.BFc4b81.26306
Date: Sun, 3 May 2015 01:55:34 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c21">Comment # 21</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:asiasuppenesser&#64;gmx.de" title="TM &lt;asiasuppenesser&#64;gmx.de&gt;"> <span class="fn">TM</span></a>
</span></b>
        <pre>Hi, sorry for the late reply - Busy times...

Unfortunately the new command didn't work either :/

I also re-installed the proprietary driver again, for testing purposes. The
&quot;nvidia-settings&quot; GUI still reported a fan speed of 35% (as always), but this
time (I guess I missed that information before) I saw a line saying that
adjusting the fan speed is not supported. Were you aware of this already? I
think I wasn't...

Scrolling through this bug report again I saw that you were suspecting a
adt7473 chip to be placed on the graphics card board. I had a look at it and
couldn't find one. Here are the first lines written on all chips I could find
on the board (apart from memory chips):
- AT24C16B7
- AZ358M
- RT9214
- RT9259
- NXP 74HC08D

I hope that helps in some way :/</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1430618134.BFc4b81.26306--

--===============0384303783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0384303783==--
