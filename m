From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80507] Cannot set pwm1 above 80 on GeForce 9600 GT,
	10de:0622
Date: Wed, 25 Jun 2014 07:24:12 +0000
Message-ID: <bug-80507-8800-D4sQgshIxl@http.bugs.freedesktop.org/>
References: <bug-80507-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1753764496=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-80507-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
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


--===============1753764496==
Content-Type: multipart/alternative; boundary="1403681052.a1B82B2.6891"; charset="us-ascii"


--1403681052.a1B82B2.6891
Date: Wed, 25 Jun 2014 07:24:12 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80507

--- Comment #3 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #2)
> nouveau.debug="PHERM=debug" logs the values as they change, but doesn't give
> any other useful information, it doesn't provide any handy smoking gun hints
> as to what's going on.

cat pwm1_max

I guess your vbios states the maximum fan speed is 80%, hence why Nouveau isn't
allowing you to set anything higher.

Please tell us if pwm1_max is set to 80 so as we close this as not a bug :)

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403681052.a1B82B2.6891
Date: Wed, 25 Jun 2014 07:24:12 +0000
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
   title="NEW --- - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507#c3">Comment # 3</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507">bug 80507</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80507#c2">comment #2</a>)
<span class="quote">&gt; nouveau.debug=&quot;PHERM=debug&quot; logs the values as they change, but doesn't give
&gt; any other useful information, it doesn't provide any handy smoking gun hints
&gt; as to what's going on.</span >

cat pwm1_max

I guess your vbios states the maximum fan speed is 80%, hence why Nouveau isn't
allowing you to set anything higher.

Please tell us if pwm1_max is set to 80 so as we close this as not a bug :)</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403681052.a1B82B2.6891--

--===============1753764496==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1753764496==--
