From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 84101] [NV96] null deref in nouveau_i2c_acquire_pad,
 triggered by xcmddc
Date: Fri, 09 Jan 2015 06:27:14 +0000
Message-ID: <bug-84101-8800-QHz6S4tsEN@http.bugs.freedesktop.org/>
References: <bug-84101-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0409594682=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-84101-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============0409594682==
Content-Type: multipart/alternative; boundary="1420784833.AC800BC02.11764"; charset="UTF-8"


--1420784833.AC800BC02.11764
Date: Fri, 9 Jan 2015 06:27:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=84101

--- Comment #4 from hong-fMnCZbbUwqqsTnJN9+BGXg@public.gmane.org ---
I can reproduce a similar issue by unplug and replug in the display cable. I'll
attach the crashed log and other dmesg information.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1420784833.AC800BC02.11764
Date: Fri, 9 Jan 2015 06:27:13 +0000
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
   title="NEW - [NV96] null deref in nouveau_i2c_acquire_pad, triggered by xcmddc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84101#c4">Comment # 4</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV96] null deref in nouveau_i2c_acquire_pad, triggered by xcmddc"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=84101">bug 84101</a>
              from <span class="vcard"><a class="email" href="mailto:hong&#64;topbug.net" title="hong&#64;topbug.net">hong&#64;topbug.net</a>
</span></b>
        <pre>I can reproduce a similar issue by unplug and replug in the display cable. I'll
attach the crashed log and other dmesg information.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1420784833.AC800BC02.11764--

--===============0409594682==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============0409594682==--
