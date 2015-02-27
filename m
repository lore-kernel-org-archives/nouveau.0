From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80901] [NVCF] PWM fan speed too high
Date: Fri, 27 Feb 2015 20:08:51 +0000
Message-ID: <bug-80901-8800-JW3g3VSX6q@http.bugs.freedesktop.org/>
References: <bug-80901-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1193885073=="
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


--===============1193885073==
Content-Type: multipart/alternative; boundary="1425067731.204A7Bc2.12954"; charset="UTF-8"


--1425067731.204A7Bc2.12954
Date: Fri, 27 Feb 2015 20:08:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80901

--- Comment #39 from Lars E Pettersson <lars-mDsk/mlFC80@public.gmane.org> ---
OK, lets see...

# ./nvapeek e114 10
0000e114: 0000021c 000000f9 00000001 00000000

sometimes I get the following answer:

0000e114: 0000021c 000000fe 00000001 00000000

I then select manual control and do the following:

[root@tux nva]# ./nvapoke e118 80000005
[root@tux nva]# ./nvapeek e114 10
0000e114: 0000021c 00000005 00000001 00000000

Silent fan. Check with 'sensors' command. RPM is 0! Temperature raising! Set
fan control back to old setting and fan returns to normal.

Restart with the module blacklisted.

[root@tux nva]# ./nvapeek e114 10
0000e114: 0000021c 000000a2 00000001 00000000

Restart with the nouveau module in place again.

You asked K.-P. Schrage to use 'nvapoke e118 80000002' As I have 000000a2 I
instead tried the following:

[root@tux nva]# ./nvapoke e118 800000a2

(If I try 'nvapoke e118 80000002' the RPM goes down to 0 rpm, so I think that
800000a2 is correct for me to use. The RPM then stays slightly above 2000 rpm
and the temperature is at about 60-65 degC, as it was before the change in the
3.15 kernel.)

Not sure what all these numbers means though... :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1425067731.204A7Bc2.12954
Date: Fri, 27 Feb 2015 20:08:51 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901#c39">Comment # 39</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NVCF] PWM fan speed too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80901">bug 80901</a>
              from <span class="vcard"><a class="email" href="mailto:lars&#64;homer.se" title="Lars E Pettersson &lt;lars&#64;homer.se&gt;"> <span class="fn">Lars E Pettersson</span></a>
</span></b>
        <pre>OK, lets see...

# ./nvapeek e114 10
0000e114: 0000021c 000000f9 00000001 00000000

sometimes I get the following answer:

0000e114: 0000021c 000000fe 00000001 00000000

I then select manual control and do the following:

[root&#64;tux nva]# ./nvapoke e118 80000005
[root&#64;tux nva]# ./nvapeek e114 10
0000e114: 0000021c 00000005 00000001 00000000

Silent fan. Check with 'sensors' command. RPM is 0! Temperature raising! Set
fan control back to old setting and fan returns to normal.

Restart with the module blacklisted.

[root&#64;tux nva]# ./nvapeek e114 10
0000e114: 0000021c 000000a2 00000001 00000000

Restart with the nouveau module in place again.

You asked K.-P. Schrage to use 'nvapoke e118 80000002' As I have 000000a2 I
instead tried the following:

[root&#64;tux nva]# ./nvapoke e118 800000a2

(If I try 'nvapoke e118 80000002' the RPM goes down to 0 rpm, so I think that
800000a2 is correct for me to use. The RPM then stays slightly above 2000 rpm
and the temperature is at about 60-65 degC, as it was before the change in the
3.15 kernel.)

Not sure what all these numbers means though... :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1425067731.204A7Bc2.12954--

--===============1193885073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1193885073==--
