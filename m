From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 80507] Cannot set pwm1 above 80 on GeForce 9600 GT,
	10de:0622
Date: Wed, 25 Jun 2014 16:35:39 +0000
Message-ID: <bug-80507-8800-aqwDVm8qhV@http.bugs.freedesktop.org/>
References: <bug-80507-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0983437341=="
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


--===============0983437341==
Content-Type: multipart/alternative; boundary="1403714139.12062.29542"; charset="us-ascii"


--1403714139.12062.29542
Date: Wed, 25 Jun 2014 16:35:39 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=80507

--- Comment #5 from Martin Peres <martin.peres-Iz16wY1oaNPLSKGbIzaifA@public.gmane.org> ---
(In reply to comment #4)
> Ben initially thought it was a bug as he thought he had a vbios from the
> same card indicating it should go higher, but apparently he may have been
> looking at the wrong one. pwm1_max is 80, yeah. apparently ideally I should
> send the vbios to verify, but Fedora's kernel config doesn't seem to provide
> the necessary bits...I only filed this as Ben thought it was a bug, so let's
> just close it for now.

This is not the first vbios I see with pwm_max set to 80, hence why I thought
straight away about this. 

You can force the pwm1_max to 100 if you really want to make it go to 100%, but
I wouldn't do that.

Anyway, thanks for the quick response!

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1403714139.12062.29542
Date: Wed, 25 Jun 2014 16:35:39 +0000
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
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507#c5">Comment # 5</a>
              on <a class="bz_bug_link 
          bz_status_RESOLVED  bz_closed"
   title="RESOLVED NOTABUG - Cannot set pwm1 above 80 on GeForce 9600 GT, 10de:0622"
   href="https://bugs.freedesktop.org/show_bug.cgi?id=80507">bug 80507</a>
              from <span class="vcard"><a class="email" href="mailto:martin.peres&#64;ensi-bourges.fr" title="Martin Peres &lt;martin.peres&#64;ensi-bourges.fr&gt;"> <span class="fn">Martin Peres</span></a>
</span></b>
        <pre>(In reply to <a href="show_bug.cgi?id=80507#c4">comment #4</a>)
<span class="quote">&gt; Ben initially thought it was a bug as he thought he had a vbios from the
&gt; same card indicating it should go higher, but apparently he may have been
&gt; looking at the wrong one. pwm1_max is 80, yeah. apparently ideally I should
&gt; send the vbios to verify, but Fedora's kernel config doesn't seem to provide
&gt; the necessary bits...I only filed this as Ben thought it was a bug, so let's
&gt; just close it for now.</span >

This is not the first vbios I see with pwm_max set to 80, hence why I thought
straight away about this. 

You can force the pwm1_max to 100 if you really want to make it go to 100%, but
I wouldn't do that.

Anyway, thanks for the quick response!</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1403714139.12062.29542--

--===============0983437341==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============0983437341==--
