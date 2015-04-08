From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 87885] [NV94] Fan speed of Nvidia GeForce 9600GT
 (G94) constantly too high
Date: Wed, 08 Apr 2015 06:49:23 +0000
Message-ID: <bug-87885-8800-qBZnb3s2yZ@http.bugs.freedesktop.org/>
References: <bug-87885-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1334996215=="
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


--===============1334996215==
Content-Type: multipart/alternative; boundary="1428475762.710135b1.15744"; charset="UTF-8"


--1428475762.710135b1.15744
Date: Wed, 8 Apr 2015 06:49:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=87885

--- Comment #20 from Martin Peres <martin.peres-GANU6spQydw@public.gmane.org> ---
(In reply to TM from comment #19)
> Ping :)
> 
> (no need to rush; just making sure this doesn't get forgotten)

Another bug report provided me with the necessary information. I also got
access to one of the GPUs with this weird behavior. I am pretty sure you have
one of those weird cards where there is a divisor that I cannot find.

To be sure about this, you can try to go to manual fan management and then run:
nvapoke e118 80000005

This should silence the fan. Try to adjust the last value (5) to see how much
you can go to reach the maximum speed. Please also make sure that the fan is
still running and the temperature is not skyrocketing.

Fixing this problem is still my number one priority for nouveau but I don't
work on it too often. Fixing bugs isn't always fun...

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1428475762.710135b1.15744
Date: Wed, 8 Apr 2015 06:49:22 +0000
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
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885#c20">Comment # 20</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW - [NV94] Fan speed of Nvidia GeForce 9600GT (G94) constantly too high"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=87885">bug 87885</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;free.fr" title="Martin Peres &lt;martin.peres&#64;free.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to TM from <a href="show_bug.cgi?id=87885#c19">comment #19</a>)
<span class="quote">&gt; Ping :)
&gt; 
&gt; (no need to rush; just making sure this doesn't get forgotten)</span >

Another bug report provided me with the necessary information. I also got
access to one of the GPUs with this weird behavior. I am pretty sure you have
one of those weird cards where there is a divisor that I cannot find.

To be sure about this, you can try to go to manual fan management and then run:
nvapoke e118 80000005

This should silence the fan. Try to adjust the last value (5) to see how much
you can go to reach the maximum speed. Please also make sure that the fan is
still running and the temperature is not skyrocketing.

Fixing this problem is still my number one priority for nouveau but I don't
work on it too often. Fixing bugs isn't always fun...</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1428475762.710135b1.15744--

--===============1334996215==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cDovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK

--===============1334996215==--
