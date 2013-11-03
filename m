From: bugzilla-daemon-CC+yJ3UmIYqDUpFQwHEjaQ@public.gmane.org
Subject: [Bug 71116] [Ubuntu userspace upgrade 13.04 ->
 13.10][regression] NV34 card fails to properly resume.
Date: Sun, 03 Nov 2013 07:40:35 +0000
Message-ID: <bug-71116-8800-PfHIivALcP@http.bugs.freedesktop.org/>
References: <bug-71116-8800@http.bugs.freedesktop.org/>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1488215819=="
Return-path: <nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
In-Reply-To: <bug-71116-8800-V0hAGp6uBxMKqLRl/0Ahz6D7qz1kEfGD2LY78lusg7I@public.gmane.org/>
List-Unsubscribe: <http://lists.freedesktop.org/mailman/options/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>
List-Help: <mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=help>
List-Subscribe: <http://lists.freedesktop.org/mailman/listinfo/nouveau>,
	<mailto:nouveau-request-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org?subject=subscribe>
Sender: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Errors-To: nouveau-bounces-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
To: nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: nouveau.vger.kernel.org


--===============1488215819==
Content-Type: multipart/alternative; boundary="1383464435.eb2BB1.2836"; charset="us-ascii"


--1383464435.eb2BB1.2836
Date: Sun, 3 Nov 2013 07:40:35 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"

https://bugs.freedesktop.org/show_bug.cgi?id=71116

--- Comment #9 from Ronald <ronald645-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> ---
(see above three logfiles)

I tried your second suggestion, did not work(!).

- nouveau.agpmode=0 -> crash
- agp=off -> crash
- no kernel parameters -> typing pm-hibernate from SSH -> success(!) . Clicking
somewhere on desktop -> crash (Only moving cursor did not make it crash).

I'm not totally against bisecting these source packages, but that will then be
a longterm thing. Furthermore, is all of mesa required? (i.e. I'm not using a
compositing desktop for that matter (just XFCE)).

Conclusion, it appears that disabling agp has no effect. Machine only crashes
after resume if the screen is repainted with the exception of mouse movements.

-- 
You are receiving this mail because:
You are the assignee for the bug.

--1383464435.eb2BB1.2836
Date: Sun, 3 Nov 2013 07:40:35 +0000
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
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116#c9">Comment # 9</a>
              on <a class="bz_bug_link 
          bz_status_NEW "
   title="NEW --- - [Ubuntu userspace upgrade 13.04 -&gt; 13.10][regression] NV34 card fails to properly resume."
   href="https://bugs.freedesktop.org/show_bug.cgi?id=71116">bug 71116</a>
              from <span class="vcard"><a class="email" href="mailto:ronald645&#64;gmail.com" title="Ronald &lt;ronald645&#64;gmail.com&gt;"> <span class="fn">Ronald</span></a>
</span></b>
        <pre>(see above three logfiles)

I tried your second suggestion, did not work(!).

- nouveau.agpmode=0 -&gt; crash
- agp=off -&gt; crash
- no kernel parameters -&gt; typing pm-hibernate from SSH -&gt; success(!) . Clicking
somewhere on desktop -&gt; crash (Only moving cursor did not make it crash).

I'm not totally against bisecting these source packages, but that will then be
a longterm thing. Furthermore, is all of mesa required? (i.e. I'm not using a
compositing desktop for that matter (just XFCE)).

Conclusion, it appears that disabling agp has no effect. Machine only crashes
after resume if the screen is repainted with the exception of mouse movements.</pre>
        </div>
      </p>
      <hr>
      <span>You are receiving this mail because:</span>
      
      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>

--1383464435.eb2BB1.2836--

--===============1488215819==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Nouveau mailing list
Nouveau-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
http://lists.freedesktop.org/mailman/listinfo/nouveau

--===============1488215819==--
